From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 10/12] intel_sgx:
 in-kernel launch enclave
Date: Wed, 08 Nov 2017 12:07:26 -0800
Message-ID: <1510171646.4659.5.camel@intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
         <20171010143258.21623-11-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:54924 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752171AbdKHUKv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Nov 2017 15:10:51 -0500
In-Reply-To: <20171010143258.21623-11-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org

On Tue, 2017-10-10 at 17:32 +0300, Jarkko Sakkinen wrote:
> +static RSA *load_sign_key(const char *path)
> +{
> +	FILE *f;
> +	RSA *key;
> +
> +	f = fopen(path, "rb");
> +	if (!f) {
> +		fprintf(stderr, "Unable to open %s\n", path);
> +		return NULL;
> +	}
> +	key = RSA_new();
> +	if (!PEM_read_RSAPrivateKey(f, &key, pem_passwd_cb, NULL))
> +		return NULL;
> +	fclose(f);
> +
> +	if (BN_num_bytes(key->n) != SGX_MODULUS_SIZE) {

Dereferencing the RSA pointer (key) breaks on OpenSSL 1.1.0 as RSA is now an
opaque object.  It's relatively easy to fudge around the issue, patch below.

https://github.com/openssl/openssl/issues/1491
https://wiki.openssl.org/index.php/OpenSSL_1.1.0_Changes

> +		fprintf(stderr, "Invalid key size %d\n", BN_num_bytes(key-
> >n));
> +		RSA_free(key);
> +		return NULL;
> +	}
> +
> +	return key;
> +}
> +

diff --git drivers/platform/x86/intel_sgx/le/enclave/sgxsign.c
drivers/platform/x86/intel_sgx/le/enclave/sgxsign.c
index 27e8c61d033c..e454dc95f438 100644
--- drivers/platform/x86/intel_sgx/le/enclave/sgxsign.c
+++ drivers/platform/x86/intel_sgx/le/enclave/sgxsign.c
@@ -110,6 +110,17 @@ static int pem_passwd_cb(char *buf, int size, int rwflag,
void *u)
        return strlen(buf) >= size ? size - 1 : strlen(buf);
 }
 
+static inline const BIGNUM *get_modulus(RSA *key)
+{
+#if OPENSSL_VERSION_NUMBER < 0x10100000L
+       return key->n;
+#else
+       const BIGNUM *n;
+       RSA_get0_key(key, &n, NULL, NULL);
+       return n;
+#endif
+}
+
 static RSA *load_sign_key(const char *path)
 {
        FILE *f;
@@ -125,8 +136,9 @@ static RSA *load_sign_key(const char *path)
                return NULL;
        fclose(f);
 
-       if (BN_num_bytes(key->n) != SGX_MODULUS_SIZE) {
-               fprintf(stderr, "Invalid key size %d\n", BN_num_bytes(key->n));
+       if (BN_num_bytes(get_modulus(key)) != SGX_MODULUS_SIZE) {
+               fprintf(stderr, "Invalid key size %d\n",
+                       BN_num_bytes(get_modulus(key)));
                RSA_free(key);
                return NULL;
        }
@@ -511,7 +523,7 @@ int main(int argc, char **argv)
        if (!sign_key)
                goto out;
 
-       BN_bn2bin(sign_key->n, ss.modulus);
+       BN_bn2bin(get_modulus(sign_key), ss.modulus);
 
        if (!measure_encl(argv[1], ss.body.mrenclave))
                goto out;
