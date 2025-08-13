;; Product Registry Contract
;; Manages product registration, information, and ownership

;; Constants
(define-constant CONTRACT-OWNER tx-sender)
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-PRODUCT-NOT-FOUND (err u101))
(define-constant ERR-PRODUCT-EXISTS (err u102))
(define-constant ERR-INVALID-INPUT (err u103))

;; Data Variables
(define-data-var next-product-id uint u1)

;; Data Maps
(define-map products
  { product-id: uint }
  {
    name: (string-ascii 100),
    description: (string-ascii 500),
    category: (string-ascii 50),
    manufacturer: principal,
    created-at: uint,
    price: uint,
    status: (string-ascii 20)
  }
)

(define-map product-ownership
  { product-id: uint }
  { owner: principal }
)

;; Public Functions

;; Register a new product
(define-public (register-product (name (string-ascii 100))
                                (description (string-ascii 500))
                                (category (string-ascii 50))
                                (price uint))
  (let ((product-id (var-get next-product-id)))
    (asserts! (> (len name) u0) ERR-INVALID-INPUT)
    (asserts! (> price u0) ERR-INVALID-INPUT)

    (map-set products
      { product-id: product-id }
      {
        name: name,
        description: description,
        category: category,
        manufacturer: tx-sender,
        created-at: block-height,
        price: price,
        status: "active"
      }
    )

    (map-set product-ownership
      { product-id: product-id }
      { owner: tx-sender }
    )

    (var-set next-product-id (+ product-id u1))
    (ok product-id)
  )
)

;; Update product information
(define-public (update-product (product-id uint)
                              (name (string-ascii 100))
                              (description (string-ascii 500))
                              (price uint))
  (let ((product (unwrap! (map-get? products { product-id: product-id }) ERR-PRODUCT-NOT-FOUND))
        (owner (unwrap! (map-get? product-ownership { product-id: product-id }) ERR-PRODUCT-NOT-FOUND)))

    (asserts! (is-eq tx-sender (get owner owner)) ERR-NOT-AUTHORIZED)
    (asserts! (> (len name) u0) ERR-INVALID-INPUT)
    (asserts! (> price u0) ERR-INVALID-INPUT)

    (map-set products
      { product-id: product-id }
      (merge product {
        name: name,
        description: description,
        price: price
      })
    )

    (ok true)
  )
)

;; Transfer product ownership
(define-public (transfer-ownership (product-id uint) (new-owner principal))
  (let ((owner (unwrap! (map-get? product-ownership { product-id: product-id }) ERR-PRODUCT-NOT-FOUND)))

    (asserts! (is-eq tx-sender (get owner owner)) ERR-NOT-AUTHORIZED)

    (map-set product-ownership
      { product-id: product-id }
      { owner: new-owner }
    )

    (ok true)
  )
)

;; Deactivate product
(define-public (deactivate-product (product-id uint))
  (let ((product (unwrap! (map-get? products { product-id: product-id }) ERR-PRODUCT-NOT-FOUND))
        (owner (unwrap! (map-get? product-ownership { product-id: product-id }) ERR-PRODUCT-NOT-FOUND)))

    (asserts! (is-eq tx-sender (get owner owner)) ERR-NOT-AUTHORIZED)

    (map-set products
      { product-id: product-id }
      (merge product { status: "inactive" })
    )

    (ok true)
  )
)

;; Read-only Functions

;; Get product information
(define-read-only (get-product (product-id uint))
  (map-get? products { product-id: product-id })
)

;; Get product owner
(define-read-only (get-product-owner (product-id uint))
  (map-get? product-ownership { product-id: product-id })
)

;; Check if product exists
(define-read-only (product-exists (product-id uint))
  (is-some (map-get? products { product-id: product-id }))
)

;; Get next product ID
(define-read-only (get-next-product-id)
  (var-get next-product-id)
)

;; Check if user is product owner
(define-read-only (is-product-owner (product-id uint) (user principal))
  (match (map-get? product-ownership { product-id: product-id })
    owner (is-eq user (get owner owner))
    false
  )
)
