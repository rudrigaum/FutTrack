# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| latest  | ✅ Yes             |
| < 1.0.0 | ⚠️ Best effort     |

## Reporting a Vulnerability

We take the security of FutTrack seriously. If you discover a security
vulnerability, please report it responsibly.

### How to Report

1. **DO NOT** open a public issue
2. Send an email to **futtrack@proton.me** with:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### What to Expect

- **Acknowledgment** within 48 hours
- **Initial assessment** within 7 days
- **Resolution or mitigation plan** within 30 days
- Credit in the changelog (unless you prefer anonymity)

### Scope

The following are in scope:

- Authentication and authorization flaws
- Data exposure or leakage
- Injection vulnerabilities
- Insecure data storage on device
- Insecure network communication

### Out of Scope

- Denial of service attacks
- Social engineering
- Issues in third-party dependencies (report to the respective maintainers)

## Security Best Practices

This project follows these security practices:

- Sensitive data stored in **Keychain** (not UserDefaults)
- No secrets or API keys committed to the repository
- HTTPS enforced for all network communication
- Dependencies reviewed before adoption
- Secrets managed via GitHub Secrets for CI/CD