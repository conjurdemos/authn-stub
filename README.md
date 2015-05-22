# Conjur Authn-Stub

A stubbed Conjur authenticator which accepts any login and password, and returns a signed auth token.

# Build

```
$ docker build -t authn-stub .
```

# Run

```
$ docker run -d \
	-v $PWD/insecure-key/authn-stub.pem:/app/service.pem \
	--name authn-stub \
	-p 9292:9292 \
	authn-stub
```

# Test

```
$ curl -X POST http://$(boot2docker ip):9292/users/alice/authenticate --data "the-password"
{
  "data": "alice",
  "timestamp": "2015-05-22 17:47:52 UTC",
  "signature": "lqay18syHKx2rcmAGovME1Bi3p_aeQN49U0S7U2m1tiCWKie7aqYBRdcpMGXnwNaLgbNAIWrBbCxbMWQEr-rDgCSJjuELT0GJQJZzUVrnXMU7f187deN7pnuDvpZcvebKvS6DRL74xy1r9u6qWAsQJZSzCfuQZMicqTpEQSFir5D6u-YB4pxvwBPOMpslzoyovnM_rLAI8cqus30asQOpGEO5cYqhneRpgePo26yTJZww0RRxHVTvoXqROGPFo2ChmUdyqRBTCZMkhWf3MIXnofC5nd_D2AUtuOZFDK4TqIRZ7n1fZWN4zc7mqjW1lneuobGEQTIfU5OekK_UFDJCDW8Qys9Gr7kLzuSc-IksgrrRGfsFOUWcJcmrF4KwIUmiQc0lzBSQL885wBtjyC9TpPdw1tQzl6zbdqFi9342D5w8nAtHFLq6IWMj2-HFowJluz4ySROlcytc6qcRql0D34BJiLhesiikjx2Cd6vRvuywhkd8PngMnAK8nSc5aS0Q0iLOGsXR_Lcth23uBr4XJsnb32GiIsuaonxn8jacBIAOvaiMFTx5NXuHknzpyVVKqBM8mTHnBbuTYQTNAlEP2mK-NSMpmW8vniqEkTFrayM1ol_o363ycVEoTD3ur6QQhU16OgG-XXGqYadGg0gReLYBna47rB6r-8M1hUTS8d_z-PKsNnRBZwcp1DRT8ozSL7GiunxmN8UhaD1I5Tx3w==",
  "key": "5360d0acc3d4ecd4fac3ace5e875203a"
}
```
