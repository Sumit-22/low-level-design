## 🔥 Why It Exists

You have two incompatible interfaces.

Example:

- Your system expects `PaymentProcessor`
- Third-party library gives `StripeAPI`

They don’t match.

Instead of changing either side, you create an Adapter.

### Real Example

You integrate legacy banking API into modern microservice.

Adapter converts:

Old format → New format

---

[Example with code : -](https://www.notion.so/Example-with-code-31624b0bee43803b8803fb71b8aca65f?pvs=21)

---

## When To Use

- Third-party integration
- Legacy system migration
- Interface mismatch
- Wrapping external SDK
- Data format mismatch

## When NOT To Use

- If you control both interfaces
- If redesign is better than wrapping
- If it introduces too many layers
- If mismatch is small and manageable