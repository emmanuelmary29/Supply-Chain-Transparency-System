# Supply Chain Transparency System

A blockchain-based supply chain transparency platform that provides consumers with detailed product sourcing information to enable ethical shopping decisions.

## Overview

This system addresses the growing consumer demand for transparency in product sourcing and manufacturing. It combats greenwashing, supports fair trade practices, and enables premium pricing for ethically sourced products.

## Key Features

### For Consumers
- **Detailed Product History**: Complete supply chain journey from raw materials to finished product
- **Certification Verification**: Authentic fair trade, organic, and sustainability certifications
- **Ethical Scoring**: Comprehensive scoring based on labor practices, environmental impact, and sourcing
- **Price Justification**: Understanding of why ethically sourced products cost more
- **Greenwashing Protection**: Verified claims backed by blockchain immutability

### For Producers
- **Supply Chain Documentation**: Immutable record of sourcing and manufacturing processes
- **Certification Management**: Digital certificates with blockchain verification
- **Premium Pricing Support**: Justified higher prices through transparency
- **Brand Trust Building**: Verifiable sustainability and ethical practices
- **Compliance Tracking**: Automated compliance with various standards

## System Architecture

### Smart Contracts

1. **Product Registry** (`product-registry.clar`)
    - Product registration and basic information
    - Product lifecycle management
    - Ownership and transfer tracking

2. **Supply Chain Tracker** (`supply-chain-tracker.clar`)
    - Supply chain step recording
    - Location and timestamp tracking
    - Process verification

3. **Certification Manager** (`certification-manager.clar`)
    - Digital certificate issuance
    - Certification verification
    - Expiration and renewal management

4. **Verification System** (`verification-system.clar`)
    - Third-party verification processes
    - Audit trail management
    - Dispute resolution

5. **Consumer Interface** (`consumer-interface.clar`)
    - Consumer-facing queries
    - Ethical scoring calculations
    - Transparency reports

## Data Flow

1. **Product Registration**: Manufacturers register products with basic information
2. **Supply Chain Recording**: Each step in the supply chain is recorded with location, timestamp, and process details
3. **Certification Addition**: Relevant certifications (organic, fair trade, etc.) are added and verified
4. **Third-Party Verification**: Independent auditors verify claims and processes
5. **Consumer Access**: Consumers can query complete product history and ethical scores

## Ethical Scoring System

Products receive scores based on:
- **Labor Practices** (40%): Fair wages, working conditions, child labor policies
- **Environmental Impact** (35%): Carbon footprint, waste management, resource usage
- **Sourcing Ethics** (25%): Fair trade practices, local sourcing, supplier relationships

## Certification Types Supported

- Fair Trade Certified
- USDA Organic
- Rainforest Alliance
- B-Corp Certification
- Carbon Neutral
- Conflict-Free Minerals
- Sustainable Forestry Initiative

## Benefits

### Consumer Benefits
- Make informed purchasing decisions
- Support ethical businesses
- Avoid greenwashing
- Understand price premiums
- Access to verified sustainability claims

### Business Benefits
- Build consumer trust
- Justify premium pricing
- Demonstrate compliance
- Competitive advantage
- Reduced liability

## Getting Started

### Prerequisites
- Clarinet CLI installed
- Node.js and npm
- Basic understanding of Clarity smart contracts

### Installation

\`\`\`bash
git clone <repository-url>
cd supply-chain-transparency
npm install
clarinet check
\`\`\`

### Running Tests

\`\`\`bash
npm test
\`\`\`

### Deployment

\`\`\`bash
clarinet deploy --testnet
\`\`\`

## Usage Examples

### Registering a Product
\`\`\`clarity
(contract-call? .product-registry register-product
"Coffee Beans - Ethiopian Single Origin"
"Premium coffee beans from Ethiopian highlands"
"Food & Beverage"
u1000)
\`\`\`

### Adding Supply Chain Step
\`\`\`clarity
(contract-call? .supply-chain-tracker add-supply-step
u1
"Harvesting"
"Yirgacheffe Region, Ethiopia"
"Hand-picked by local farmers")
\`\`\`

### Querying Product Information
\`\`\`clarity
(contract-call? .consumer-interface get-product-transparency u1)
\`\`\`

## API Reference

### Product Registry
- `register-product`: Register a new product
- `update-product`: Update product information
- `transfer-ownership`: Transfer product ownership

### Supply Chain Tracker
- `add-supply-step`: Add a new supply chain step
- `verify-step`: Verify a supply chain step
- `get-supply-chain`: Retrieve complete supply chain

### Certification Manager
- `issue-certification`: Issue a new certification
- `verify-certification`: Verify certification validity
- `renew-certification`: Renew expiring certification

### Consumer Interface
- `get-product-transparency`: Get complete transparency report
- `calculate-ethical-score`: Calculate product ethical score
- `search-by-criteria`: Search products by ethical criteria

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## License

MIT License - see LICENSE file for details

## Support

For questions and support, please open an issue on GitHub or contact our team.
