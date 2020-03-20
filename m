From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 20/22] crypto: Convert to new CPU match macros
Date: Fri, 20 Mar 2020 14:14:05 +0100
Message-ID: <20200320131510.700250889@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@i>
List-Id: platform-driver-x86.vger.kernel.org

The new macro set has a consistent namespace and uses C99 initializers
instead of the grufty C89 ones.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org
---
 arch/x86/crypto/aesni-intel_glue.c         |    2 +-
 arch/x86/crypto/crc32-pclmul_glue.c        |    2 +-
 arch/x86/crypto/crc32c-intel_glue.c        |    2 +-
 arch/x86/crypto/crct10dif-pclmul_glue.c    |    2 +-
 arch/x86/crypto/ghash-clmulni-intel_glue.c |    2 +-
 drivers/crypto/padlock-aes.c               |    2 +-
 drivers/crypto/padlock-sha.c               |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -1064,7 +1064,7 @@ static struct aead_alg aesni_aeads[0];
 static struct simd_aead_alg *aesni_simd_aeads[ARRAY_SIZE(aesni_aeads)];
 
 static const struct x86_cpu_id aesni_cpu_id[] = {
-	X86_FEATURE_MATCH(X86_FEATURE_AES),
+	X86_MATCH_FEATURE(X86_FEATURE_AES, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, aesni_cpu_id);
--- a/arch/x86/crypto/crc32-pclmul_glue.c
+++ b/arch/x86/crypto/crc32-pclmul_glue.c
@@ -170,7 +170,7 @@ static struct shash_alg alg = {
 };
 
 static const struct x86_cpu_id crc32pclmul_cpu_id[] = {
-	X86_FEATURE_MATCH(X86_FEATURE_PCLMULQDQ),
+	X86_MATCH_FEATURE(X86_FEATURE_PCLMULQDQ, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, crc32pclmul_cpu_id);
--- a/arch/x86/crypto/crc32c-intel_glue.c
+++ b/arch/x86/crypto/crc32c-intel_glue.c
@@ -221,7 +221,7 @@ static struct shash_alg alg = {
 };
 
 static const struct x86_cpu_id crc32c_cpu_id[] = {
-	X86_FEATURE_MATCH(X86_FEATURE_XMM4_2),
+	X86_MATCH_FEATURE(X86_FEATURE_XMM4_2, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, crc32c_cpu_id);
--- a/arch/x86/crypto/crct10dif-pclmul_glue.c
+++ b/arch/x86/crypto/crct10dif-pclmul_glue.c
@@ -114,7 +114,7 @@ static struct shash_alg alg = {
 };
 
 static const struct x86_cpu_id crct10dif_cpu_id[] = {
-	X86_FEATURE_MATCH(X86_FEATURE_PCLMULQDQ),
+	X86_MATCH_FEATURE(X86_FEATURE_PCLMULQDQ, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, crct10dif_cpu_id);
--- a/arch/x86/crypto/ghash-clmulni-intel_glue.c
+++ b/arch/x86/crypto/ghash-clmulni-intel_glue.c
@@ -313,7 +313,7 @@ static struct ahash_alg ghash_async_alg
 };
 
 static const struct x86_cpu_id pcmul_cpu_id[] = {
-	X86_FEATURE_MATCH(X86_FEATURE_PCLMULQDQ), /* Pickle-Mickle-Duck */
+	X86_MATCH_FEATURE(X86_FEATURE_PCLMULQDQ, NULL), /* Pickle-Mickle-Duck */
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, pcmul_cpu_id);
--- a/drivers/crypto/padlock-aes.c
+++ b/drivers/crypto/padlock-aes.c
@@ -474,7 +474,7 @@ static struct skcipher_alg cbc_aes_alg =
 };
 
 static const struct x86_cpu_id padlock_cpu_id[] = {
-	X86_FEATURE_MATCH(X86_FEATURE_XCRYPT),
+	X86_MATCH_FEATURE(X86_FEATURE_XCRYPT, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, padlock_cpu_id);
--- a/drivers/crypto/padlock-sha.c
+++ b/drivers/crypto/padlock-sha.c
@@ -490,7 +490,7 @@ static struct shash_alg sha256_alg_nano
 };
 
 static const struct x86_cpu_id padlock_sha_ids[] = {
-	X86_FEATURE_MATCH(X86_FEATURE_PHE),
+	X86_MATCH_FEATURE(X86_FEATURE_PHE, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, padlock_sha_ids);
