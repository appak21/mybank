package util

// you can easily add more currencies in the future

// Constants for all supported currencies
const (
	USD = "USD"
	EUR = "EUR"
	KZT = "KZT"
)

// IsSupportedCurrency returns true if the currency is supported
func IsSupportedCurrency(currency string) bool {
	switch currency {
	case USD, EUR, KZT:
		return true
	}
	return false
}
