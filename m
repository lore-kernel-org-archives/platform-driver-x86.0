From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH RFC v3 10/12] intel_sgx: in-kernel launch enclave
Date: Tue, 10 Oct 2017 17:32:56 +0300
Message-ID: <20171010143258.21623-11-jarkko.sakkinen@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:22285 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932225AbdJJOdb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 10:33:31 -0400
In-Reply-To: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

This commits implements the in-kernel launch enclave. It is wrapped into
a user space program that reads SIGSTRUCT instances from stdin and
outputs launch tokens to stdout.

The commit also adds enclave signing tool that is used by kbuild to
measure and sign the lauch enclave.

CONFIG_INTEL_SGX_SIGNING_KEY points to a PEM-file for the 3072-bit RSA
key that is used as the LE public key pair. The default location is:

  drivers/platform/x86/intel_sgx/intel_sgx_signing_key.pem

If the default key does not exist kbuild will generate a random key and
place it to this location. KBUILD_SGX_SIGN_PIN can be used to specify
the passphrase for the LE public key.

TinyCrypt (https://github.com/01org/tinycrypt) is used as AES
implementation, which is not timing resistant. Eventually this needs to
be replaced with AES-NI based implementation that could be either

- re-use existing AES-NI code in the kernel
- have its own hand written code

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 drivers/platform/x86/intel_sgx/Kconfig             |  13 +
 drivers/platform/x86/intel_sgx/Makefile            |  18 +
 drivers/platform/x86/intel_sgx/le/Makefile         |  26 +
 drivers/platform/x86/intel_sgx/le/enclave/Makefile |  46 ++
 .../x86/intel_sgx/le/enclave/aes_encrypt.c         | 191 ++++++++
 .../platform/x86/intel_sgx/le/enclave/cmac_mode.c  | 254 ++++++++++
 .../x86/intel_sgx/le/enclave/encl_bootstrap.S      | 163 +++++++
 .../intel_sgx/le/enclave/include/tinycrypt/aes.h   | 133 +++++
 .../le/enclave/include/tinycrypt/cmac_mode.h       | 194 ++++++++
 .../le/enclave/include/tinycrypt/constants.h       |  59 +++
 .../intel_sgx/le/enclave/include/tinycrypt/utils.h |  95 ++++
 drivers/platform/x86/intel_sgx/le/enclave/main.c   | 203 ++++++++
 .../platform/x86/intel_sgx/le/enclave/sgx_le.lds   |  28 ++
 .../platform/x86/intel_sgx/le/enclave/sgxsign.c    | 537 +++++++++++++++++++++
 drivers/platform/x86/intel_sgx/le/enclave/utils.c  |  78 +++
 drivers/platform/x86/intel_sgx/le/entry.S          | 117 +++++
 .../platform/x86/intel_sgx/le/include/sgx_asm.h    |  64 +++
 .../platform/x86/intel_sgx/le/include/sgx_encl.h   | 105 ++++
 drivers/platform/x86/intel_sgx/le/main.c           | 219 +++++++++
 drivers/platform/x86/intel_sgx/le/sgx_le_piggy.S   |  15 +
 .../platform/x86/intel_sgx/sgx_le_proxy_piggy.S    |  11 +
 21 files changed, 2569 insertions(+)
 create mode 100644 drivers/platform/x86/intel_sgx/le/Makefile
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/Makefile
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/aes_encrypt.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/cmac_mode.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/encl_bootstrap.S
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/aes.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/cmac_mode.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/constants.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/utils.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/main.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/sgx_le.lds
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/sgxsign.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/utils.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/entry.S
 create mode 100644 drivers/platform/x86/intel_sgx/le/include/sgx_asm.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/include/sgx_encl.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/main.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/sgx_le_piggy.S
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_le_proxy_piggy.S

diff --git a/drivers/platform/x86/intel_sgx/Kconfig b/drivers/platform/x86/intel_sgx/Kconfig
index 5c7e61ecb524..9c445e9f89fa 100644
--- a/drivers/platform/x86/intel_sgx/Kconfig
+++ b/drivers/platform/x86/intel_sgx/Kconfig
@@ -2,6 +2,8 @@
 # Intel SGX
 #
 
+menu "Intel SGX"
+
 config INTEL_SGX
 	tristate "Intel(R) SGX Driver"
 	default n
@@ -17,3 +19,14 @@ config INTEL_SGX
 	called Enclave Page Cache (EPC). There is a hardware unit in the
 	processor called Memory Encryption Engine. The MEE encrypts and decrypts
 	the EPC pages as they enter and leave the processor package.
+
+
+config INTEL_SGX_SIGNING_KEY
+	string "Path to the Intel SGX LE signing key"
+	default "drivers/platform/x86/intel_sgx/intel_sgx_signing_key.pem"
+	depends on INTEL_SGX
+	---help---
+	Provide a path to a 3072-bit RSA private key that will be used to
+	sign the launch enclave.
+
+endmenu
diff --git a/drivers/platform/x86/intel_sgx/Makefile b/drivers/platform/x86/intel_sgx/Makefile
index 92af94668508..39c0a5ad242c 100644
--- a/drivers/platform/x86/intel_sgx/Makefile
+++ b/drivers/platform/x86/intel_sgx/Makefile
@@ -11,3 +11,21 @@ intel_sgx-$(CONFIG_INTEL_SGX) += \
 	sgx_page_cache.o \
 	sgx_util.o \
 	sgx_vma.o \
+	sgx_le_proxy_piggy.o
+
+$(eval $(call config_filename,INTEL_SGX_SIGNING_KEY))
+
+INTEL_SGX_SIGNING_KEY_PATH := \
+	$(INTEL_SGX_SIGNING_KEY_SRCPREFIX)$(INTEL_SGX_SIGNING_KEY_FILENAME)
+
+ifeq ($(CONFIG_INTEL_SGX_SIGNING_KEY),"drivers/platform/x86/intel_sgx/intel_sgx_signing_key.pem")
+$(INTEL_SGX_SIGNING_KEY_PATH):
+	$(Q)openssl genrsa -3 -out $(INTEL_SGX_SIGNING_KEY_PATH) 3072
+endif
+
+$(obj)/sgx_le_proxy_piggy.o: $(INTEL_SGX_SIGNING_KEY_PATH) \
+			     $(obj)/le/sgx_le_proxy
+$(obj)/le/sgx_le_proxy: FORCE
+	$(Q)$(MAKE) $(build)=$(obj)/le $@
+
+export INTEL_SGX_SIGNING_KEY_PATH
diff --git a/drivers/platform/x86/intel_sgx/le/Makefile b/drivers/platform/x86/intel_sgx/le/Makefile
new file mode 100644
index 000000000000..50fe1849f6ca
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/Makefile
@@ -0,0 +1,26 @@
+KASAN_SANITIZE := n
+OBJECT_FILES_NON_STANDARD := y
+KCOV_INSTRUMENT := n
+KBUILD_CFLAGS := -Wall -Werror -static -nostdlib -nostartfiles -I$(obj)/include
+KBUILD_AFLAGS += -I$(obj)/include
+
+subdir- := enclave
+
+always := sgx_le_proxy
+clean-files := sgx_le_proxy
+
+#
+# sgx_le_proxy
+#
+
+sgx_le_proxy-y += main.o entry.o sgx_le_piggy.o
+targets += $(sgx_le_proxy-y)
+SGX_LE_PROXY_OBJS = $(addprefix $(obj)/,$(sgx_le_proxy-y))
+
+$(obj)/sgx_le_piggy.o: $(obj)/enclave/sgx_le.bin $(obj)/enclave/sgx_le.ss
+$(obj)/enclave/sgx_le.bin $(obj)/enclave/sgx_le.ss: FORCE
+	$(Q)$(MAKE) $(build)=$(obj)/enclave $@
+
+targets += sgx_le_proxy
+$(obj)/sgx_le_proxy: $(SGX_LE_PROXY_OBJS)
+	$(call if_changed,ld)
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/Makefile b/drivers/platform/x86/intel_sgx/le/enclave/Makefile
new file mode 100644
index 000000000000..dbe3d41a9a8c
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/Makefile
@@ -0,0 +1,46 @@
+KASAN_SANITIZE := n
+OBJECT_FILES_NON_STANDARD := y
+KCOV_INSTRUMENT := n
+KBUILD_CFLAGS := -Wall -Werror -static -nostdlib -nostartfiles -fPIC \
+		 -fno-stack-protector -mrdrnd  -I$(obj)/../include \
+		 -I$(obj)/include -I$(srctree)/arch/x86/include
+
+always := sgx_le.elf sgx_le.bin sgx_le.ss
+clean-files := sgx_le.elf sgx_le.bin sgx_le.ss
+
+#
+# sgx_le.ss
+#
+
+HOST_EXTRACFLAGS += -I$(srctree)/arch/x86/include
+HOSTLOADLIBES_sgxsign = -lcrypto
+hostprogs-y += sgxsign
+quiet_cmd_sgxsign = SGXSIGN $@
+      cmd_sgxsign = drivers/platform/x86/intel_sgx/le/enclave/sgxsign \
+		    $(INTEL_SGX_SIGNING_KEY_PATH) $< $@
+
+targets += sgx_le.ss
+$(obj)/sgx_le.ss: $(obj)/sgx_le.bin $(obj)/sgxsign FORCE
+	$(call if_changed,sgxsign)
+
+#
+# sgx_le.bin
+#
+
+targets += sgx_le.bin
+OBJCOPYFLAGS_sgx_le.bin := --remove-section=.got.plt -O binary
+$(obj)/sgx_le.bin: $(obj)/sgx_le.elf FORCE
+	$(call if_changed,objcopy)
+
+#
+# sgx_le.elf
+#
+
+sgx_le-y +=  main.o encl_bootstrap.o aes_encrypt.o cmac_mode.o utils.o
+targets += $(sgx_le-y)
+SGX_LE_OBJS = $(addprefix $(obj)/,$(sgx_le-y))
+
+targets += sgx_le.elf
+LDFLAGS_sgx_le.elf := -T
+$(obj)/sgx_le.elf: $(obj)/sgx_le.lds $(SGX_LE_OBJS)
+	$(call if_changed,ld)
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/aes_encrypt.c b/drivers/platform/x86/intel_sgx/le/enclave/aes_encrypt.c
new file mode 100644
index 000000000000..6bc73a581037
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/aes_encrypt.c
@@ -0,0 +1,191 @@
+/* aes_encrypt.c - TinyCrypt implementation of AES encryption procedure */
+
+/*
+ *  Copyright (C) 2015 by Intel Corporation, All Rights Reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions are met:
+ *
+ *    - Redistributions of source code must retain the above copyright notice,
+ *     this list of conditions and the following disclaimer.
+ *
+ *    - Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ *    - Neither the name of Intel Corporation nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ *  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ *  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ *  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ *  POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <tinycrypt/aes.h>
+#include <tinycrypt/utils.h>
+#include <tinycrypt/constants.h>
+
+static const uint8_t sbox[256] = {
+	0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b,
+	0xfe, 0xd7, 0xab, 0x76, 0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0,
+	0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0, 0xb7, 0xfd, 0x93, 0x26,
+	0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
+	0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2,
+	0xeb, 0x27, 0xb2, 0x75, 0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0,
+	0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84, 0x53, 0xd1, 0x00, 0xed,
+	0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
+	0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f,
+	0x50, 0x3c, 0x9f, 0xa8, 0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5,
+	0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2, 0xcd, 0x0c, 0x13, 0xec,
+	0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
+	0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14,
+	0xde, 0x5e, 0x0b, 0xdb, 0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c,
+	0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79, 0xe7, 0xc8, 0x37, 0x6d,
+	0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
+	0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f,
+	0x4b, 0xbd, 0x8b, 0x8a, 0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e,
+	0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e, 0xe1, 0xf8, 0x98, 0x11,
+	0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
+	0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f,
+	0xb0, 0x54, 0xbb, 0x16
+};
+
+static inline uint32_t rotword(uint32_t a)
+{
+	return (((a) >> 24)|((a) << 8));
+}
+
+#define subbyte(a, o)(sbox[((a) >> (o))&0xff] << (o))
+#define subword(a)(subbyte(a, 24)|subbyte(a, 16)|subbyte(a, 8)|subbyte(a, 0))
+
+int32_t tc_aes128_set_encrypt_key(TCAesKeySched_t s, const uint8_t *k)
+{
+	const uint32_t rconst[11] = {
+	0x00000000, 0x01000000, 0x02000000, 0x04000000, 0x08000000, 0x10000000,
+	0x20000000, 0x40000000, 0x80000000, 0x1b000000, 0x36000000
+	};
+	uint32_t i;
+	uint32_t t;
+
+	if (s == (TCAesKeySched_t) 0) {
+		return TC_CRYPTO_FAIL;
+	} else if (k == (const uint8_t *) 0) {
+		return TC_CRYPTO_FAIL;
+	}
+
+	for (i = 0; i < Nk; ++i) {
+		s->words[i] = (k[Nb*i]<<24) | (k[Nb*i+1]<<16) |
+			      (k[Nb*i+2]<<8) | (k[Nb*i+3]);
+	}
+
+	for (; i < (Nb*(Nr+1)); ++i) {
+		t = s->words[i-1];
+		if ((i % Nk) == 0) {
+			t = subword(rotword(t)) ^ rconst[i/Nk];
+		}
+		s->words[i] = s->words[i-Nk] ^ t;
+	}
+
+	return TC_CRYPTO_SUCCESS;
+}
+
+static inline void add_round_key(uint8_t *s, const uint32_t *k)
+{
+	s[0] ^= (uint8_t)(k[0] >> 24); s[1] ^= (uint8_t)(k[0] >> 16);
+	s[2] ^= (uint8_t)(k[0] >> 8); s[3] ^= (uint8_t)(k[0]);
+	s[4] ^= (uint8_t)(k[1] >> 24); s[5] ^= (uint8_t)(k[1] >> 16);
+	s[6] ^= (uint8_t)(k[1] >> 8); s[7] ^= (uint8_t)(k[1]);
+	s[8] ^= (uint8_t)(k[2] >> 24); s[9] ^= (uint8_t)(k[2] >> 16);
+	s[10] ^= (uint8_t)(k[2] >> 8); s[11] ^= (uint8_t)(k[2]);
+	s[12] ^= (uint8_t)(k[3] >> 24); s[13] ^= (uint8_t)(k[3] >> 16);
+	s[14] ^= (uint8_t)(k[3] >> 8); s[15] ^= (uint8_t)(k[3]);
+}
+
+static inline void sub_bytes(uint8_t *s)
+{
+	uint32_t i;
+
+	for (i = 0; i < (Nb*Nk); ++i) {
+		s[i] = sbox[s[i]];
+	}
+}
+
+#define triple(a)(_double_byte(a)^(a))
+
+static inline void mult_row_column(uint8_t *out, const uint8_t *in)
+{
+	out[0] = _double_byte(in[0]) ^ triple(in[1]) ^ in[2] ^ in[3];
+	out[1] = in[0] ^ _double_byte(in[1]) ^ triple(in[2]) ^ in[3];
+	out[2] = in[0] ^ in[1] ^ _double_byte(in[2]) ^ triple(in[3]);
+	out[3] = triple(in[0]) ^ in[1] ^ in[2] ^ _double_byte(in[3]);
+}
+
+static inline void mix_columns(uint8_t *s)
+{
+	uint8_t t[Nb*Nk];
+
+	mult_row_column(t, s);
+	mult_row_column(&t[Nb], s+Nb);
+	mult_row_column(&t[2*Nb], s+(2*Nb));
+	mult_row_column(&t[3*Nb], s+(3*Nb));
+	(void) _copy(s, sizeof(t), t, sizeof(t));
+}
+
+/*
+ * This shift_rows also implements the matrix flip required for mix_columns, but
+ * performs it here to reduce the number of memory operations.
+ */
+static inline void shift_rows(uint8_t *s)
+{
+	uint8_t t[Nb*Nk];
+
+	t[0]  = s[0]; t[1] = s[5]; t[2] = s[10]; t[3] = s[15];
+	t[4]  = s[4]; t[5] = s[9]; t[6] = s[14]; t[7] = s[3];
+	t[8]  = s[8]; t[9] = s[13]; t[10] = s[2]; t[11] = s[7];
+	t[12] = s[12]; t[13] = s[1]; t[14] = s[6]; t[15] = s[11];
+	(void) _copy(s, sizeof(t), t, sizeof(t));
+}
+
+int32_t tc_aes_encrypt(uint8_t *out, const uint8_t *in, const TCAesKeySched_t s)
+{
+	uint8_t state[Nk*Nb];
+	uint32_t i;
+
+	if (out == (uint8_t *) 0) {
+		return TC_CRYPTO_FAIL;
+	} else if (in == (const uint8_t *) 0) {
+		return TC_CRYPTO_FAIL;
+	} else if (s == (TCAesKeySched_t) 0) {
+		return TC_CRYPTO_FAIL;
+	}
+
+	(void)_copy(state, sizeof(state), in, sizeof(state));
+	add_round_key(state, s->words);
+
+	for (i = 0; i < (Nr-1); ++i) {
+		sub_bytes(state);
+		shift_rows(state);
+		mix_columns(state);
+		add_round_key(state, s->words + Nb*(i+1));
+	}
+
+	sub_bytes(state);
+	shift_rows(state);
+	add_round_key(state, s->words + Nb*(i+1));
+
+	(void)_copy(out, sizeof(state), state, sizeof(state));
+
+	/* zeroing out the state buffer */
+	_set(state, TC_ZERO_BYTE, sizeof(state));
+
+	return TC_CRYPTO_SUCCESS;
+}
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/cmac_mode.c b/drivers/platform/x86/intel_sgx/le/enclave/cmac_mode.c
new file mode 100644
index 000000000000..0da74d1c4aa5
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/cmac_mode.c
@@ -0,0 +1,254 @@
+/* cmac_mode.c - TinyCrypt CMAC mode implementation */
+
+/*
+ *  Copyright (C) 2015 by Intel Corporation, All Rights Reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions are met:
+ *
+ *    - Redistributions of source code must retain the above copyright notice,
+ *     this list of conditions and the following disclaimer.
+ *
+ *    - Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ *    - Neither the name of Intel Corporation nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ *  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ *  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ *  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ *  POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <tinycrypt/aes.h>
+#include <tinycrypt/cmac_mode.h>
+#include <tinycrypt/constants.h>
+#include <tinycrypt/utils.h>
+
+/* max number of calls until change the key (2^48).*/
+const static uint64_t MAX_CALLS = ((uint64_t)1 << 48);
+
+/*
+ *  gf_wrap -- In our implementation, GF(2^128) is represented as a 16 byte
+ *  array with byte 0 the most significant and byte 15 the least significant.
+ *  High bit carry reduction is based on the primitive polynomial
+ *
+ *                     X^128 + X^7 + X^2 + X + 1,
+ *
+ *  which leads to the reduction formula X^128 = X^7 + X^2 + X + 1. Indeed,
+ *  since 0 = (X^128 + X^7 + X^2 + 1) mod (X^128 + X^7 + X^2 + X + 1) and since
+ *  addition of polynomials with coefficients in Z/Z(2) is just XOR, we can
+ *  add X^128 to both sides to get
+ *
+ *       X^128 = (X^7 + X^2 + X + 1) mod (X^128 + X^7 + X^2 + X + 1)
+ *
+ *  and the coefficients of the polynomial on the right hand side form the
+ *  string 1000 0111 = 0x87, which is the value of gf_wrap.
+ *
+ *  This gets used in the following way. Doubling in GF(2^128) is just a left
+ *  shift by 1 bit, except when the most significant bit is 1. In the latter
+ *  case, the relation X^128 = X^7 + X^2 + X + 1 says that the high order bit
+ *  that overflows beyond 128 bits can be replaced by addition of
+ *  X^7 + X^2 + X + 1 <--> 0x87 to the low order 128 bits. Since addition
+ *  in GF(2^128) is represented by XOR, we therefore only have to XOR 0x87
+ *  into the low order byte after a left shift when the starting high order
+ *  bit is 1.
+ */
+const unsigned char gf_wrap = 0x87;
+
+/*
+ *  assumes: out != NULL and points to a GF(2^n) value to receive the
+ *            doubled value;
+ *           in != NULL and points to a 16 byte GF(2^n) value
+ *            to double;
+ *           the in and out buffers do not overlap.
+ *  effects: doubles the GF(2^n) value pointed to by "in" and places
+ *           the result in the GF(2^n) value pointed to by "out."
+ */
+void gf_double(uint8_t *out, uint8_t *in)
+{
+
+	/* start with low order byte */
+	uint8_t *x = in + (TC_AES_BLOCK_SIZE - 1);
+
+	/* if msb == 1, we need to add the gf_wrap value, otherwise add 0 */
+	uint8_t carry = (in[0] >> 7) ? gf_wrap : 0;
+
+	out += (TC_AES_BLOCK_SIZE - 1);
+	for (;;) {
+		*out-- = (*x << 1) ^ carry;
+		if (x == in) {
+			break;
+		}
+		carry = *x-- >> 7;
+	}
+}
+
+int32_t tc_cmac_setup(TCCmacState_t s, const uint8_t *key, TCAesKeySched_t sched)
+{
+
+	/* input sanity check: */
+	if (s == (TCCmacState_t) 0 ||
+	    key == (const uint8_t *) 0) {
+		return TC_CRYPTO_FAIL;
+	}
+
+	/* put s into a known state */
+	_set(s, 0, sizeof(*s));
+	s->sched = sched;
+
+	/* configure the encryption key used by the underlying block cipher */
+	tc_aes128_set_encrypt_key(s->sched, key);
+
+	/* compute s->K1 and s->K2 from s->iv using s->keyid */
+	_set(s->iv, 0, TC_AES_BLOCK_SIZE);
+	tc_aes_encrypt(s->iv, s->iv, s->sched);
+	gf_double (s->K1, s->iv);
+	gf_double (s->K2, s->K1);
+
+	/* reset s->iv to 0 in case someone wants to compute now */
+	tc_cmac_init(s);
+
+	return TC_CRYPTO_SUCCESS;
+}
+
+int32_t tc_cmac_erase(TCCmacState_t s)
+{
+	if (s == (TCCmacState_t) 0) {
+		return TC_CRYPTO_FAIL;
+	}
+
+	/* destroy the current state */
+	_set(s, 0, sizeof(*s));
+
+	return TC_CRYPTO_SUCCESS;
+}
+
+int32_t tc_cmac_init(TCCmacState_t s)
+{
+	/* input sanity check: */
+	if (s == (TCCmacState_t) 0) {
+		return TC_CRYPTO_FAIL;
+	}
+
+	/* CMAC starts with an all zero initialization vector */
+	_set(s->iv, 0, TC_AES_BLOCK_SIZE);
+
+	/* and the leftover buffer is empty */
+	_set(s->leftover, 0, TC_AES_BLOCK_SIZE);
+	s->leftover_offset = 0;
+
+	/* Set countdown to max number of calls allowed before re-keying: */
+	s->countdown = MAX_CALLS;
+
+	return TC_CRYPTO_SUCCESS;
+}
+
+int32_t tc_cmac_update(TCCmacState_t s, const uint8_t *data, size_t data_length)
+{
+	uint32_t i;
+
+	/* input sanity check: */
+	if (s == (TCCmacState_t) 0) {
+		return TC_CRYPTO_FAIL;
+	}
+	if (data_length == 0) {
+		return  TC_CRYPTO_SUCCESS;
+	}
+	if (data == (const uint8_t *) 0) {
+		return TC_CRYPTO_FAIL;
+	}
+
+	if (s->countdown == 0) {
+		return TC_CRYPTO_FAIL;
+	}
+
+	s->countdown--;
+
+	if (s->leftover_offset > 0) {
+		/* last data added to s didn't end on a TC_AES_BLOCK_SIZE byte boundary */
+		size_t remaining_space = TC_AES_BLOCK_SIZE - s->leftover_offset;
+
+		if (data_length < remaining_space) {
+			/* still not enough data to encrypt this time either */
+			_copy(&s->leftover[s->leftover_offset], data_length, data, data_length);
+			s->leftover_offset += data_length;
+			return TC_CRYPTO_SUCCESS;
+		}
+		/* leftover block is now full; encrypt it first */
+		_copy(&s->leftover[s->leftover_offset],
+		      remaining_space,
+		      data,
+		      remaining_space);
+		data_length -= remaining_space;
+		data += remaining_space;
+		s->leftover_offset = 0;
+
+		for (i = 0; i < TC_AES_BLOCK_SIZE; ++i) {
+			s->iv[i] ^= s->leftover[i];
+		}
+		tc_aes_encrypt(s->iv, s->iv, s->sched);
+	}
+
+	/* CBC encrypt each (except the last) of the data blocks */
+	while (data_length > TC_AES_BLOCK_SIZE) {
+		for (i = 0; i < TC_AES_BLOCK_SIZE; ++i) {
+			s->iv[i] ^= data[i];
+		}
+		tc_aes_encrypt(s->iv, s->iv, s->sched);
+		data += TC_AES_BLOCK_SIZE;
+		data_length  -= TC_AES_BLOCK_SIZE;
+	}
+
+	if (data_length > 0) {
+		/* save leftover data for next time */
+		_copy(s->leftover, data_length, data, data_length);
+		s->leftover_offset = data_length;
+	}
+
+	return TC_CRYPTO_SUCCESS;
+}
+
+int32_t tc_cmac_final(uint8_t *tag, TCCmacState_t s)
+{
+	uint8_t *k;
+	uint32_t i;
+
+	/* input sanity check: */
+	if (tag == (uint8_t *) 0 ||
+	    s == (TCCmacState_t) 0) {
+		return TC_CRYPTO_FAIL;
+	}
+
+	if (s->leftover_offset == TC_AES_BLOCK_SIZE) {
+		/* the last message block is a full-sized block */
+		k = (uint8_t *) s->K1;
+	} else {
+		/* the final message block is not a full-sized  block */
+		size_t remaining = TC_AES_BLOCK_SIZE - s->leftover_offset;
+
+		_set(&s->leftover[s->leftover_offset], 0, remaining);
+		s->leftover[s->leftover_offset] = TC_CMAC_PADDING;
+		k = (uint8_t *) s->K2;
+	}
+	for (i = 0; i < TC_AES_BLOCK_SIZE; ++i) {
+		s->iv[i] ^= s->leftover[i] ^ k[i];
+	}
+
+	tc_aes_encrypt(tag, s->iv, s->sched);
+
+	/* erasing state: */
+	tc_cmac_erase(s);
+
+	return TC_CRYPTO_SUCCESS;
+}
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/encl_bootstrap.S b/drivers/platform/x86/intel_sgx/le/enclave/encl_bootstrap.S
new file mode 100644
index 000000000000..616e000d74ec
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/encl_bootstrap.S
@@ -0,0 +1,163 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016, 2017 Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * Contact Information:
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ * Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
+ *
+ * BSD LICENSE
+ *
+ * Copyright(c) 2016, 2017 Intel Corporation.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above copyright
+ *     notice, this list of conditions and the following disclaimer in
+ *     the documentation and/or other materials provided with the
+ *     distribution.
+ *   * Neither the name of Intel Corporation nor the names of its
+ *     contributors may be used to endorse or promote products derived
+ *     from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * Authors:
+ *
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ * Haim Cohen <haim.cohen@intel.com>
+ */
+
+#include <sgx_asm.h>
+
+	.section ".tcs", "a"
+	.balign	4096
+
+	.fill	1, 8, 0			# STATE (set by CPU)
+	.fill	1, 8, 0			# FLAGS
+	.long	encl_ssa		# OSSA
+	.fill	1, 4, 0
+	.fill	1, 4, 0			# CSSA (set by CPU)
+	.fill	1, 4, 1			# NSSA
+	.long	encl_entry		# OENTRY
+	.fill	1, 4, 0
+	.fill	1, 8, 0			# AEP (set by EENTER and ERESUME)
+	.fill	1, 8, 0			# OFSBASE
+	.fill	1, 8, 0			# OGSBASE
+	.fill	1, 4, 0xFFFFFFFF 	# FSLIMIT
+	.fill	1, 4, 0xFFFFFFFF	# GSLIMIT
+
+	.text
+
+encl_entry:
+	# %rbx contains the base address for TCS, which is also the first
+	# address inside the enclave. By adding $le_stack_end to it, we get the
+	# absolute address for the stack.
+	lea	(encl_stack)(%rbx), %rax
+	xchg	%rsp, %rax
+	push	%rax
+
+	push	%rcx # push the address after EENTER
+	push	%rbx # push the enclave base address
+
+	call	encl_body
+
+	pop	%rbx # pop the enclave base address
+
+	# Restore XSAVE registers to a synthetic state.
+	mov     $0xFFFFFFFF, %rax
+	mov     $0xFFFFFFFF, %rdx
+	lea	(xsave_area)(%rbx), %rdi
+	fxrstor	(%rdi)
+
+	# Clear GPRs
+	xor     %rcx, %rcx
+	xor     %rdx, %rdx
+	xor     %rdi, %rdi
+	xor     %rsi, %rsi
+	xor     %r8, %r8
+	xor     %r9, %r9
+	xor     %r10, %r10
+	xor     %r11, %r11
+	xor     %r12, %r12
+	xor     %r13, %r13
+	xor     %r14, %r14
+	xor     %r15, %r15
+
+	# Reset status flags
+	add     %rdx, %rdx # OF = SF = AF = CF = 0; ZF = PF = 1
+
+	pop	%rbx # pop the address after EENTER
+
+	# Restore the caller stack.
+	pop	%rax
+	mov	%rax, %rsp
+
+	# EEXIT
+	mov	$4, %rax
+	enclu
+
+	.global sgx_ereport
+sgx_ereport:
+	push	%rbx
+	xor	%rax, %rax /* EREPORT */
+	mov	%rdi, %rbx  /* TARGETINFO */
+	mov	%rsi, %rcx /* REPORTDATA */
+	ENCLU
+	pop	%rbx
+	ret
+
+	.global sgx_egetkey
+sgx_egetkey:
+	push	%rbx
+	mov	$0x01, %rax /* EGETKEY */
+	mov	%rdi, %rbx /* KEYREQUEST */
+	mov	%rsi, %rcx  /* KEY */
+	ENCLU
+	pop	%rbx
+	ret
+
+	.section ".data", "aw"
+
+encl_ssa:
+	.space 4096
+
+xsave_area:
+	.fill	1, 4, 0x037F		# FCW
+	.fill	5, 4, 0
+	.fill	1, 4, 0x1F80		# MXCSR
+	.fill	1, 4, 0xFFFF		# MXCSR_MASK
+	.fill	123, 4, 0
+	.fill	1, 4, 0x80000000	# XCOMP_BV[63] = 1, compaction mode
+	.fill	12, 4, 0
+
+	.balign 4096
+	.space 8192
+encl_stack:
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/aes.h b/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/aes.h
new file mode 100644
index 000000000000..fe6e439d7d9e
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/aes.h
@@ -0,0 +1,133 @@
+/* aes.h - TinyCrypt interface to an AES-128 implementation */
+
+/*
+ *  Copyright (C) 2015 by Intel Corporation, All Rights Reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions are met:
+ *
+ *    - Redistributions of source code must retain the above copyright notice,
+ *     this list of conditions and the following disclaimer.
+ *
+ *    - Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ *    - Neither the name of Intel Corporation nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ *  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ *  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ *  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ *  POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/**
+ * @file
+ * @brief -- Interface to an AES-128 implementation.
+ *
+ *  Overview:   AES-128 is a NIST approved block cipher specified in
+ *              FIPS 197. Block ciphers are deterministic algorithms that
+ *              perform a transformation specified by a symmetric key in fixed-
+ *              length data sets, also called blocks.
+ *
+ *  Security:   AES-128 provides approximately 128 bits of security.
+ *
+ *  Usage:      1) call tc_aes128_set_encrypt/decrypt_key to set the key.
+ *
+ *              2) call tc_aes_encrypt/decrypt to process the data.
+ */
+
+#ifndef __TC_AES_H__
+#define __TC_AES_H__
+
+#include <linux/types.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#define Nb (4)  /* number of columns (32-bit words) comprising the state */
+#define Nk (4)  /* number of 32-bit words comprising the key */
+#define Nr (10) /* number of rounds */
+#define TC_AES_BLOCK_SIZE (Nb*Nk)
+#define TC_AES_KEY_SIZE (Nb*Nk)
+
+struct tc_aes_key_sched_struct {
+	uint32_t words[Nb*(Nr+1)];
+};
+typedef struct tc_aes_key_sched_struct *TCAesKeySched_t;
+
+/**
+ *  @brief Set AES-128 encryption key
+ *  Uses key k to initialize s
+ *  @return  returns TC_CRYPTO_SUCCESS (1)
+ *           returns TC_CRYPTO_FAIL (0) if: s == NULL or k == NULL
+ *  @note       This implementation skips the additional steps required for keys
+ *              larger than 128 bits, and must not be used for AES-192 or
+ *              AES-256 key schedule -- see FIPS 197 for details
+ *  @param      s IN/OUT -- initialized struct tc_aes_key_sched_struct
+ *  @param      k IN -- points to the AES key
+ */
+int32_t tc_aes128_set_encrypt_key(TCAesKeySched_t s, const uint8_t *k);
+
+/**
+ *  @brief AES-128 Encryption procedure
+ *  Encrypts contents of in buffer into out buffer under key;
+ *              schedule s
+ *  @note Assumes s was initialized by aes_set_encrypt_key;
+ *              out and in point to 16 byte buffers
+ *  @return  returns TC_CRYPTO_SUCCESS (1)
+ *           returns TC_CRYPTO_FAIL (0) if: out == NULL or in == NULL or s == NULL
+ *  @param out IN/OUT -- buffer to receive ciphertext block
+ *  @param in IN -- a plaintext block to encrypt
+ *  @param s IN -- initialized AES key schedule
+ */
+int32_t tc_aes_encrypt(uint8_t *out,
+		       const uint8_t *in,
+		       const TCAesKeySched_t s);
+
+/**
+ *  @brief Set the AES-128 decryption key
+ *  Uses key k to initialize s
+ *  @return returns TC_CRYPTO_SUCCESS (1)
+ *          returns TC_CRYPTO_FAIL (0) if: s == NULL or k == NULL
+ *  @note       This is the implementation of the straightforward inverse cipher
+ *              using the cipher documented in FIPS-197 figure 12, not the
+ *              equivalent inverse cipher presented in Figure 15
+ *  @warning    This routine skips the additional steps required for keys larger
+ *              than 128, and must not be used for AES-192 or AES-256 key
+ *              schedule -- see FIPS 197 for details
+ *  @param s  IN/OUT -- initialized struct tc_aes_key_sched_struct
+ *  @param k  IN -- points to the AES key
+ */
+int32_t tc_aes128_set_decrypt_key(TCAesKeySched_t s, const uint8_t *k);
+
+/**
+ *  @brief AES-128 Encryption procedure
+ *  Decrypts in buffer into out buffer under key schedule s
+ *  @return returns TC_CRYPTO_SUCCESS (1)
+ *          returns TC_CRYPTO_FAIL (0) if: out is NULL or in is NULL or s is NULL
+ *  @note   Assumes s was initialized by aes_set_encrypt_key
+ *          out and in point to 16 byte buffers
+ *  @param out IN/OUT -- buffer to receive ciphertext block
+ *  @param in IN -- a plaintext block to encrypt
+ *  @param s IN -- initialized AES key schedule
+ */
+int32_t tc_aes_decrypt(uint8_t *out,
+		       const uint8_t *in,
+		       const TCAesKeySched_t s);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/cmac_mode.h b/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/cmac_mode.h
new file mode 100644
index 000000000000..9d3f13051dfd
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/cmac_mode.h
@@ -0,0 +1,194 @@
+/*  cmac_mode.h -- interface to a CMAC implementation */
+
+/*
+ *  Copyright (C) 2015 by Intel Corporation, All Rights Reserved
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions are met:
+ *
+ *    - Redistributions of source code must retain the above copyright notice,
+ *     this list of conditions and the following disclaimer.
+ *
+ *    - Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ *    - Neither the name of Intel Corporation nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ *  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ *  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ *  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ *  POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/**
+ * @file
+ * @brief Interface to a CMAC implementation.
+ *
+ *  Overview: CMAC is defined NIST in SP 800-38B, and is the standard algorithm
+ *            for computing a MAC using a block cipher. It can compute the MAC
+ *            for a byte string of any length. It is distinguished from CBC-MAC
+ *            in the processing of the final message block; CMAC uses a
+ *            different technique to compute the final message block is full
+ *            size or only partial, while CBC-MAC uses the same technique for
+ *            both. This difference permits CMAC to be applied to variable
+ *            length messages, while all messages authenticated by CBC-MAC must
+ *            be the same length.
+ *
+ *  Security: AES128-CMAC mode of operation offers 64 bits of security against
+ *            collision attacks. Note however that an external attacker cannot
+ *            generate the tags him/herself without knowing the MAC key. In this
+ *            sense, to attack the collision property of AES128-CMAC, an
+ *            external attacker would need the cooperation of the legal user to
+ *            produce an exponentially high number of tags (e.g. 2^64) to
+ *            finally be able to look for collisions and benefit from them. As
+ *            an extra precaution, the current implementation allows to at most
+ *            2^48 calls to the tc_cmac_update function before re-calling
+ *            tc_cmac_setup (allowing a new key to be set), as suggested in
+ *            Appendix B of SP 800-38B.
+ *
+ *  Requires: AES-128
+ *
+ *  Usage:   This implementation provides a "scatter-gather" interface, so that
+ *           the CMAC value can be computed incrementally over a message
+ *           scattered in different segments throughout memory. Experience shows
+ *           this style of interface tends to minimize the burden of programming
+ *           correctly. Like all symmetric key operations, it is session
+ *           oriented.
+ *
+ *           To begin a CMAC session, use tc_cmac_setup to initialize a struct
+ *           tc_cmac_struct with encryption key and buffer. Our implementation
+ *           always assume that the AES key to be the same size as the block
+ *           cipher block size. Once setup, this data structure can be used for
+ *           many CMAC computations.
+ *
+ *           Once the state has been setup with a key, computing the CMAC of
+ *           some data requires three steps:
+ *
+ *           (1) first use tc_cmac_init to initialize a new CMAC computation.
+ *           (2) next mix all of the data into the CMAC computation state using
+ *               tc_cmac_update. If all of the data resides in a single data
+ *               segment then only one tc_cmac_update call is needed; if data
+ *               is scattered throughout memory in n data segments, then n calls
+ *               will be needed. CMAC IS ORDER SENSITIVE, to be able to detect
+ *               attacks that swap bytes, so the order in which data is mixed
+ *               into the state is critical!
+ *           (3) Once all of the data for a message has been mixed, use
+ *               tc_cmac_final to compute the CMAC tag value.
+ *
+ *           Steps (1)-(3) can be repeated as many times as you want to CMAC
+ *           multiple messages. A practical limit is 2^48 1K messages before you
+ *           have to change the key.
+ *
+ *           Once you are done computing CMAC with a key, it is a good idea to
+ *           destroy the state so an attacker cannot recover the key; use
+ *           tc_cmac_erase to accomplish this.
+ */
+
+#ifndef __TC_CMAC_MODE_H__
+#define __TC_CMAC_MODE_H__
+
+#include <tinycrypt/aes.h>
+
+#include <stddef.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/* padding for last message block */
+#define TC_CMAC_PADDING 0x80
+
+/* struct tc_cmac_struct represents the state of a CMAC computation */
+typedef struct tc_cmac_struct {
+/* initialization vector */
+	uint8_t iv[TC_AES_BLOCK_SIZE];
+/* used if message length is a multiple of block_size bytes */
+	uint8_t K1[TC_AES_BLOCK_SIZE];
+/* used if message length isn't a multiple block_size bytes */
+	uint8_t K2[TC_AES_BLOCK_SIZE];
+/* where to put bytes that didn't fill a block */
+	uint8_t leftover[TC_AES_BLOCK_SIZE];
+/* identifies the encryption key */
+	uint32_t keyid;
+/* next available leftover location */
+	uint32_t leftover_offset;
+/* AES key schedule */
+	TCAesKeySched_t sched;
+/* calls to tc_cmac_update left before re-key */
+	uint64_t countdown;
+} *TCCmacState_t;
+
+/**
+ * @brief Configures the CMAC state to use the given AES key
+ * @return returns TC_CRYPTO_SUCCESS (1) after having configured the CMAC state
+ *         returns TC_CRYPTO_FAIL (0) if:
+ *              s == NULL or
+ *              key == NULL
+ *
+ * @param s IN/OUT -- the state to set up
+ * @param key IN -- the key to use
+ * @param sched IN -- AES key schedule
+ */
+int32_t tc_cmac_setup(TCCmacState_t s, const uint8_t *key,
+			   TCAesKeySched_t sched);
+
+/**
+ * @brief Erases the CMAC state
+ * @return returns TC_CRYPTO_SUCCESS (1) after having configured the CMAC state
+ *         returns TC_CRYPTO_FAIL (0) if:
+ *              s == NULL
+ *
+ * @param s IN/OUT -- the state to erase
+ */
+int32_t tc_cmac_erase(TCCmacState_t s);
+
+/**
+ * @brief Initializes a new CMAC computation
+ * @return returns TC_CRYPTO_SUCCESS (1) after having initialized the CMAC state
+ *         returns TC_CRYPTO_FAIL (0) if:
+ *              s == NULL
+ *
+ * @param s IN/OUT -- the state to initialize
+ */
+int32_t tc_cmac_init(TCCmacState_t s);
+
+/**
+ * @brief Incrementally computes CMAC over the next data segment
+ * @return returns TC_CRYPTO_SUCCESS (1) after successfully updating the CMAC state
+ *         returns TC_CRYPTO_FAIL (0) if:
+ *              s == NULL or
+ *              if data == NULL when dlen > 0
+ *
+ * @param s IN/OUT -- the CMAC state
+ * @param data IN -- the next data segment to MAC
+ * @param dlen IN -- the length of data in bytes
+ */
+int32_t tc_cmac_update(TCCmacState_t s, const uint8_t *data, size_t dlen);
+
+/**
+ * @brief Generates the tag from the CMAC state
+ * @return returns TC_CRYPTO_SUCCESS (1) after successfully generating the tag
+ *         returns TC_CRYPTO_FAIL (0) if:
+ *              tag == NULL or
+ *              s == NULL
+ *
+ * @param tag OUT -- the CMAC tag
+ * @param s IN -- CMAC state
+ */
+int32_t tc_cmac_final(uint8_t *tag, TCCmacState_t s);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/constants.h b/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/constants.h
new file mode 100644
index 000000000000..1a7c9df3676f
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/constants.h
@@ -0,0 +1,59 @@
+/* constants.h - TinyCrypt interface to constants */
+
+/*
+ *  Copyright (C) 2015 by Intel Corporation, All Rights Reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions are met:
+ *
+ *    - Redistributions of source code must retain the above copyright notice,
+ *     this list of conditions and the following disclaimer.
+ *
+ *    - Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ *    - Neither the name of Intel Corporation nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ *  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ *  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ *  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ *  POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/**
+ * @file
+ * @brief -- Interface to constants.
+ *
+ */
+
+#ifndef __TC_CONSTANTS_H__
+#define __TC_CONSTANTS_H__
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#ifndef NULL
+#define NULL ((void *)0)
+#endif
+
+#define TC_CRYPTO_SUCCESS 1
+#define TC_CRYPTO_FAIL 0
+
+#define TC_ZERO_BYTE 0x00
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/utils.h b/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/utils.h
new file mode 100644
index 000000000000..615e7111a719
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/utils.h
@@ -0,0 +1,95 @@
+/* utils.h - TinyCrypt interface to platform-dependent run-time operations */
+
+/*
+ *  Copyright (C) 2015 by Intel Corporation, All Rights Reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions are met:
+ *
+ *    - Redistributions of source code must retain the above copyright notice,
+ *     this list of conditions and the following disclaimer.
+ *
+ *    - Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ *    - Neither the name of Intel Corporation nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ *  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ *  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ *  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ *  POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/**
+ * @file
+ * @brief Interface to platform-dependent run-time operations.
+ *
+ */
+
+#ifndef __TC_UTILS_H__
+#define __TC_UTILS_H__
+
+#include <linux/types.h>
+#include <stddef.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/**
+ * @brief Copy the the buffer 'from' to the buffer 'to'.
+ * @return returns TC_CRYPTO_SUCCESS (1)
+ *         returns TC_CRYPTO_FAIL (0) if:
+ *                from_len > to_len.
+ *
+ * @param to OUT -- destination buffer
+ * @param to_len IN -- length of destination buffer
+ * @param from IN -- origin buffer
+ * @param from_len IN -- length of origin buffer
+ */
+uint32_t _copy(uint8_t *to, uint32_t to_len,
+	       const uint8_t *from, uint32_t from_len);
+
+/**
+ * @brief Set the value 'val' into the buffer 'to', 'len' times.
+ *
+ * @param to OUT -- destination buffer
+ * @param val IN -- value to be set in 'to'
+ * @param len IN -- number of times the value will be copied
+ */
+void _set(void *to, uint8_t val, uint32_t len);
+
+/*
+ * @brief AES specific doubling function, which utilizes
+ * the finite field used by AES.
+ * @return Returns a^2
+ *
+ * @param a IN/OUT -- value to be doubled
+ */
+uint8_t _double_byte(uint8_t a);
+
+/*
+ * @brief Constant-time algorithm to compare if two sequences of bytes are equal
+ * @return Returns 0 if equal, and non-zero otherwise
+ *
+ * @param a IN -- sequence of bytes a
+ * @param b IN -- sequence of bytes b
+ * @param size IN -- size of sequences a and b
+ */
+int32_t _compare(const uint8_t *a, const uint8_t *b, size_t size);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/main.c b/drivers/platform/x86/intel_sgx/le/enclave/main.c
new file mode 100644
index 000000000000..358f0c5684c8
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/main.c
@@ -0,0 +1,203 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016, 2017 Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * Contact Information:
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ * Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
+ *
+ * BSD LICENSE
+ *
+ * Copyright(c) 2016, 2017 Intel Corporation.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above copyright
+ *     notice, this list of conditions and the following disclaimer in
+ *     the documentation and/or other materials provided with the
+ *     distribution.
+ *   * Neither the name of Intel Corporation nor the names of its
+ *     contributors may be used to endorse or promote products derived
+ *     from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * Authors:
+ *
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ */
+
+#include <tinycrypt/cmac_mode.h>
+#include <stdbool.h>
+#include <linux/types.h>
+#include <asm/sgx_arch.h>
+#include <uapi/asm/sgx.h>
+#include <sgx_encl.h>
+
+static bool get_rand_uint32(uint32_t *value)
+{
+	int i;
+
+	for (i = 0; i < 10; i++) {
+		if (__builtin_ia32_rdrand32_step((unsigned int *)value))
+			return true;
+	}
+
+	return false;
+}
+
+static bool read_rand(uint8_t *data, unsigned long size)
+{
+	uint32_t value;
+	uint8_t* bytes = (uint8_t *)&value;
+	unsigned long i;
+
+	for (i = 0; i < size; i++) {
+		if (!(i & 3)) {
+			if (!get_rand_uint32(&value))
+				return false;
+		}
+
+		data[i] = bytes[i & 3];
+	}
+
+	return true;
+}
+
+static bool sign_einittoken(struct sgx_einittoken *einittoken)
+{
+	struct sgx_keyrequest keyrequest __attribute__((aligned (512)));
+	uint8_t launch_key[16] __attribute__((aligned (16)));
+	struct tc_cmac_struct cmac_state;
+	struct tc_aes_key_sched_struct cmac_sched;
+
+	/* a random unique key id */
+	if (!read_rand(einittoken->keyid, sizeof(einittoken->keyid)))
+		return false;
+
+	sgx_memset(&keyrequest, 0, sizeof(keyrequest));
+	keyrequest.keyname = 0; /* LICENSE_KEY */
+	sgx_memcpy(&keyrequest.keyid, &einittoken->keyid,
+		   sizeof(keyrequest.keyid));
+	sgx_memcpy(&keyrequest.cpusvn, &(einittoken->cpusvnle),
+		   sizeof(keyrequest.cpusvn));
+	sgx_memcpy(&keyrequest.isvsvn, &(einittoken->isvsvnle),
+		   sizeof(keyrequest.isvsvn));
+
+	keyrequest.attributemask = ~SGX_ATTR_MODE64BIT;
+	keyrequest.xfrmmask = 0;
+	keyrequest.miscmask = 0xFFFFFFFF;
+
+	einittoken->maskedmiscselectle &= keyrequest.miscmask;
+	einittoken->maskedattributesle &= keyrequest.attributemask;
+	einittoken->maskedxfrmle &= keyrequest.xfrmmask;
+
+	if (sgx_egetkey(&keyrequest, launch_key))
+		return false;
+
+	tc_cmac_setup(&cmac_state, launch_key, &cmac_sched);
+	tc_cmac_init(&cmac_state);
+	tc_cmac_update(&cmac_state, (const uint8_t *)&einittoken->payload,
+		       sizeof(einittoken->payload));
+	tc_cmac_final(einittoken->mac, &cmac_state);
+
+	sgx_memset(launch_key, 0, sizeof(launch_key));
+
+	return true;
+}
+
+static bool create_einittoken(uint8_t *mrenclave,
+			      uint8_t *mrsigner,
+			      uint64_t attributes,
+			      uint64_t xfrm,
+			      struct sgx_einittoken *einittoken)
+{
+
+	struct sgx_targetinfo tginfo __attribute__((aligned (512)));
+	struct sgx_report report __attribute__((aligned (512)));
+	uint8_t reportdata[64] __attribute__((aligned (128)));
+
+	if (attributes & 8 /* RESERVED */)
+		return false;
+
+	sgx_memset(&tginfo, 0, sizeof(tginfo));
+	sgx_memset(reportdata, 0, sizeof(reportdata));
+	sgx_memset(&report, 0, sizeof(report));
+
+	if (sgx_ereport(&tginfo, reportdata, &report))
+		return false;
+
+	sgx_memset(einittoken, 0, sizeof(*einittoken));
+
+	einittoken->payload.valid = 1;
+
+	sgx_memcpy(einittoken->payload.mrenclave, mrenclave, 32);
+	sgx_memcpy(einittoken->payload.mrsigner, mrsigner, 32);
+	einittoken->payload.attributes = attributes;
+	einittoken->payload.xfrm = xfrm;
+
+	sgx_memcpy(&einittoken->cpusvnle, &report.cpusvn,
+		   sizeof(report.cpusvn));
+	einittoken->isvsvnle = report.isvsvn;
+	einittoken->isvprodidle = report.isvprodid;
+
+	einittoken->maskedattributesle = report.attributes;
+	einittoken->maskedxfrmle = report.xfrm;
+	einittoken->maskedmiscselectle = report.miscselect;
+
+	if (!sign_einittoken(einittoken))
+		return false;
+
+	return true;
+}
+
+void encl_body(void *req_ptr)
+{
+	struct sgx_le_request *req = (struct sgx_le_request *)req_ptr;
+	struct sgx_einittoken token;
+	uint8_t mrenclave[32];
+	uint8_t mrsigner[32];
+	uint64_t attributes;
+	uint64_t xfrm;
+
+	if (!req || !req->mrenclave || !req->mrsigner || !req->einittoken)
+		return;
+
+	sgx_memcpy(mrenclave, req->mrenclave, sizeof(mrenclave));
+	sgx_memcpy(mrsigner, req->mrsigner, sizeof(mrsigner));
+	sgx_memcpy(&attributes, &req->attributes, sizeof(uint64_t));
+	sgx_memcpy(&xfrm, &req->xfrm, sizeof(uint64_t));
+	sgx_memset(&token, 0, sizeof(token));
+
+	if (!create_einittoken(mrenclave, mrsigner, attributes, xfrm, &token))
+		return;
+
+	sgx_memcpy(req->einittoken, &token, sizeof(token));
+}
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/sgx_le.lds b/drivers/platform/x86/intel_sgx/le/enclave/sgx_le.lds
new file mode 100644
index 000000000000..56b694c15ebe
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/sgx_le.lds
@@ -0,0 +1,28 @@
+OUTPUT_FORMAT(elf64-x86-64)
+
+SECTIONS
+{
+	. = 0;
+	.tcs : {
+		*(.tcs*)
+	}
+
+	. = ALIGN(4096);
+	.text : {
+		*(.text*)
+		*(.rodata*)
+	}
+
+	. = ALIGN(4096);
+	.data : {
+		*(.data*)
+	}
+
+	/DISCARD/ : {
+		*(.data*)
+		*(.comment*)
+		*(.note*)
+		*(.debug*)
+		*(.eh_frame*)
+	}
+}
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/sgxsign.c b/drivers/platform/x86/intel_sgx/le/enclave/sgxsign.c
new file mode 100644
index 000000000000..27e8c61d033c
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/sgxsign.c
@@ -0,0 +1,537 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2017 Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * Contact Information:
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ * Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
+ *
+ * BSD LICENSE
+ *
+ * Copyright(c) 2017 Intel Corporation.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above copyright
+ *     notice, this list of conditions and the following disclaimer in
+ *     the documentation and/or other materials provided with the
+ *     distribution.
+ *   * Neither the name of Intel Corporation nor the names of its
+ *     contributors may be used to endorse or promote products derived
+ *     from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * Authors:
+ *
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ */
+
+#define _GNU_SOURCE
+#include <getopt.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <asm/sgx_arch.h>
+#include <openssl/err.h>
+#include <openssl/pem.h>
+
+static const char *sign_key_pass;
+
+static bool check_crypto_errors(void)
+{
+	int err;
+	bool had_errors = false;
+	const char *filename;
+	int line;
+	char str[256];
+
+	for ( ; ; ) {
+		if (ERR_peek_error() == 0)
+			break;
+
+		had_errors = true;
+		err = ERR_get_error_line(&filename, &line);
+		ERR_error_string_n(err, str, sizeof(str));
+		fprintf(stderr, "crypto: %s: %s:%d\n", str, filename, line);
+	}
+
+	return had_errors;
+}
+
+static void exit_usage(const char *program)
+{
+	fprintf(stderr,
+		"Usage: %s/sign-le <key> <enclave> <sigstruct>\n", program);
+	exit(1);
+}
+
+static int pem_passwd_cb(char *buf, int size, int rwflag, void *u)
+{
+	if (!sign_key_pass)
+		return -1;
+
+	strncpy(buf, sign_key_pass, size);
+	/* no retry */
+	sign_key_pass = NULL;
+
+	return strlen(buf) >= size ? size - 1 : strlen(buf);
+}
+
+static RSA *load_sign_key(const char *path)
+{
+	FILE *f;
+	RSA *key;
+
+	f = fopen(path, "rb");
+	if (!f) {
+		fprintf(stderr, "Unable to open %s\n", path);
+		return NULL;
+	}
+	key = RSA_new();
+	if (!PEM_read_RSAPrivateKey(f, &key, pem_passwd_cb, NULL))
+		return NULL;
+	fclose(f);
+
+	if (BN_num_bytes(key->n) != SGX_MODULUS_SIZE) {
+		fprintf(stderr, "Invalid key size %d\n", BN_num_bytes(key->n));
+		RSA_free(key);
+		return NULL;
+	}
+
+	return key;
+}
+
+static void reverse_bytes(void *data, int length)
+{
+	int i = 0;
+	int j = length - 1;
+	uint8_t temp;
+	uint8_t *ptr = data;
+
+	while (i < j) {
+		temp = ptr[i];
+		ptr[i] = ptr[j];
+		ptr[j] = temp;
+		i++;
+		j--;
+	}
+}
+
+enum mrtags {
+	MRECREATE = 0x0045544145524345,
+	MREADD = 0x0000000044444145,
+	MREEXTEND = 0x00444E4554584545,
+};
+
+static bool mrenclave_update(EVP_MD_CTX *ctx, const void *data)
+{
+	if (!EVP_DigestUpdate(ctx, data, 64)) {
+		fprintf(stderr, "digest update failed\n");
+		return false;
+	}
+
+	return true;
+}
+
+static bool mrenclave_commit(EVP_MD_CTX *ctx, uint8_t *mrenclave)
+{
+	unsigned int size;
+
+	if (!EVP_DigestFinal_ex(ctx, (unsigned char *)mrenclave, &size)) {
+		fprintf(stderr, "digest commit failed\n");
+		return false;
+	}
+
+	if (size != 32) {
+		fprintf(stderr, "invalid digest size = %u\n", size);
+		return false;
+	}
+
+	return true;
+}
+
+struct mrecreate {
+	uint64_t tag;
+	uint32_t ssaframesize;
+	uint64_t size;
+	uint8_t reserved[44];
+} __attribute__((__packed__));
+
+
+static bool mrenclave_ecreate(EVP_MD_CTX *ctx, uint64_t blob_size)
+{
+	struct mrecreate mrecreate;
+	uint64_t encl_size;
+
+	for (encl_size = 0x1000; encl_size < blob_size; encl_size <<= 1);
+
+	memset(&mrecreate, 0, sizeof(mrecreate));
+	mrecreate.tag = MRECREATE;
+	mrecreate.ssaframesize = 1;
+	mrecreate.size = encl_size;
+
+	if (!EVP_DigestInit_ex(ctx, EVP_sha256(), NULL))
+		return false;
+
+	return mrenclave_update(ctx, &mrecreate);
+}
+
+struct mreadd {
+	uint64_t tag;
+	uint64_t offset;
+	uint64_t flags; /* SECINFO flags */
+	uint8_t reserved[40];
+} __attribute__((__packed__));
+
+static bool mrenclave_eadd(EVP_MD_CTX *ctx, uint64_t offset, uint64_t flags)
+{
+	struct mreadd mreadd;
+
+	memset(&mreadd, 0, sizeof(mreadd));
+	mreadd.tag = MREADD;
+	mreadd.offset = offset;
+	mreadd.flags = flags;
+
+	return mrenclave_update(ctx, &mreadd);
+}
+
+struct mreextend {
+	uint64_t tag;
+	uint64_t offset;
+	uint8_t reserved[48];
+} __attribute__((__packed__));
+
+static bool mrenclave_eextend(EVP_MD_CTX *ctx, uint64_t offset, uint8_t *data)
+{
+	struct mreextend mreextend;
+	int i;
+
+	for (i = 0; i < 0x1000; i += 0x100) {
+		memset(&mreextend, 0, sizeof(mreextend));
+		mreextend.tag = MREEXTEND;
+		mreextend.offset = offset + i;
+
+		if (!mrenclave_update(ctx, &mreextend))
+			return false;
+
+		if (!mrenclave_update(ctx, &data[i + 0x00]))
+			return false;
+
+		if (!mrenclave_update(ctx, &data[i + 0x40]))
+			return false;
+
+		if (!mrenclave_update(ctx, &data[i + 0x80]))
+			return false;
+
+		if (!mrenclave_update(ctx, &data[i + 0xC0]))
+			return false;
+	}
+
+	return true;
+}
+
+/**
+ * measure_encl - measure enclave
+ * @path: path to the enclave
+ * @mrenclave: measurement
+ *
+ * Calculates MRENCLAVE. Assumes that the very first page is a TCS page and
+ * following pages are regular pages. Does not measure the contents of the
+ * enclave as the signing tool is used at the moment only for the launch
+ * enclave, which is pass-through (everything gets a token).
+ */
+static bool measure_encl(const char *path, uint8_t *mrenclave)
+{
+	FILE *file;
+	struct stat sb;
+	EVP_MD_CTX *ctx;
+	uint64_t flags;
+	uint64_t offset;
+	uint8_t data[0x1000];
+	int rc;
+
+	ctx = EVP_MD_CTX_create();
+	if (!ctx)
+		return false;
+
+	file = fopen(path, "rb");
+	if (!file) {
+		perror("fopen");
+		EVP_MD_CTX_destroy(ctx);
+		return false;
+	}
+
+	rc = stat(path, &sb);
+	if (rc) {
+		perror("stat");
+		goto out;
+	}
+
+	if (!sb.st_size || sb.st_size & 0xfff) {
+		fprintf(stderr, "Invalid blob size %lu\n", sb.st_size);
+		goto out;
+	}
+
+	if (!mrenclave_ecreate(ctx, sb.st_size))
+		goto out;
+
+	for (offset = 0; offset < sb.st_size; offset += 0x1000) {
+		if (!offset)
+			flags = SGX_SECINFO_TCS;
+		else
+			flags = SGX_SECINFO_REG | SGX_SECINFO_R |
+				SGX_SECINFO_W | SGX_SECINFO_X;
+
+		if (!mrenclave_eadd(ctx, offset, flags))
+			goto out;
+
+		rc = fread(data, 1, 0x1000, file);
+		if (!rc)
+			break;
+		if (rc < 0x1000)
+			goto out;
+
+		if (!mrenclave_eextend(ctx, offset, data))
+			goto out;
+	}
+
+	if (!mrenclave_commit(ctx, mrenclave))
+		goto out;
+
+	fclose(file);
+	EVP_MD_CTX_destroy(ctx);
+	return true;
+out:
+	fclose(file);
+	EVP_MD_CTX_destroy(ctx);
+	return false;
+}
+
+/**
+ * sign_encl - sign enclave
+ * @sigstruct: pointer to SIGSTRUCT
+ * @key: 3072-bit RSA key
+ * @signature: byte array for the signature
+ *
+ * Calculates EMSA-PKCSv1.5 signature for the given SIGSTRUCT. The result is
+ * stored in big-endian format so that it can be further passed to OpenSSL
+ * libcrypto functions.
+ */
+static bool sign_encl(const struct sgx_sigstruct *sigstruct, RSA *key,
+		      uint8_t *signature)
+{
+	struct sgx_sigstruct_payload payload;
+	unsigned int siglen;
+	uint8_t digest[SHA256_DIGEST_LENGTH];
+	bool ret;
+
+	memcpy(&payload.header, &sigstruct->header, sizeof(sigstruct->header));
+	memcpy(&payload.body, &sigstruct->body, sizeof(sigstruct->body));
+
+	SHA256((unsigned char *)&payload, sizeof(payload), digest);
+
+	ret = RSA_sign(NID_sha256, digest, SHA256_DIGEST_LENGTH, signature,
+		       &siglen, key);
+
+	return ret;
+}
+
+struct q1q2_ctx {
+	BN_CTX *bn_ctx;
+	BIGNUM *m;
+	BIGNUM *s;
+	BIGNUM *q1;
+	BIGNUM *qr;
+	BIGNUM *q2;
+};
+
+static void free_q1q2_ctx(struct q1q2_ctx *ctx)
+{
+	BN_CTX_free(ctx->bn_ctx);
+	BN_free(ctx->m);
+	BN_free(ctx->s);
+	BN_free(ctx->q1);
+	BN_free(ctx->qr);
+	BN_free(ctx->q2);
+}
+
+static bool alloc_q1q2_ctx(const uint8_t *s, const uint8_t *m,
+			   struct q1q2_ctx *ctx)
+{
+	ctx->bn_ctx = BN_CTX_new();
+	ctx->s = BN_bin2bn(s, SGX_MODULUS_SIZE, NULL);
+	ctx->m = BN_bin2bn(m, SGX_MODULUS_SIZE, NULL);
+	ctx->q1 = BN_new();
+	ctx->qr = BN_new();
+	ctx->q2 = BN_new();
+
+	if (!ctx->bn_ctx || !ctx->s || !ctx->m || !ctx->q1 || !ctx->qr ||
+	    !ctx->q2) {
+		free_q1q2_ctx(ctx);
+		return false;
+	}
+
+	return true;
+}
+
+static bool calc_q1q2(const uint8_t *s, const uint8_t *m, uint8_t *q1,
+		      uint8_t *q2)
+{
+	struct q1q2_ctx ctx;
+
+	if (!alloc_q1q2_ctx(s, m, &ctx)) {
+		fprintf(stderr, "Not enough memory for Q1Q2 calculation\n");
+		return false;
+	}
+
+	if (!BN_mul(ctx.q1, ctx.s, ctx.s, ctx.bn_ctx))
+		goto out;
+
+	if (!BN_div(ctx.q1, ctx.qr, ctx.q1, ctx.m, ctx.bn_ctx))
+		goto out;
+
+	if (BN_num_bytes(ctx.q1) > SGX_MODULUS_SIZE) {
+		fprintf(stderr, "Too large Q1 %d bytes\n",
+			BN_num_bytes(ctx.q1));
+		goto out;
+	}
+
+	if (!BN_mul(ctx.q2, ctx.s, ctx.qr, ctx.bn_ctx))
+		goto out;
+
+	if (!BN_div(ctx.q2, NULL, ctx.q2, ctx.m, ctx.bn_ctx))
+		goto out;
+
+	if (BN_num_bytes(ctx.q2) > SGX_MODULUS_SIZE) {
+		fprintf(stderr, "Too large Q2 %d bytes\n",
+			BN_num_bytes(ctx.q2));
+		goto out;
+	}
+
+	BN_bn2bin(ctx.q1, q1);
+	BN_bn2bin(ctx.q2, q2);
+
+	free_q1q2_ctx(&ctx);
+	return true;
+out:
+	free_q1q2_ctx(&ctx);
+	return false;
+}
+
+static bool save_sigstruct(const struct sgx_sigstruct *sigstruct,
+			   const char *path)
+{
+	FILE *f = fopen(path, "wb");
+
+	if (!f) {
+		fprintf(stderr, "Unable to open %s\n", path);
+		return false;
+	}
+
+	fwrite(sigstruct, sizeof(*sigstruct), 1, f);
+	fclose(f);
+	return true;
+}
+
+int main(int argc, char **argv)
+{
+	uint64_t header1[2] = {0x000000E100000006, 0x0000000000010000};
+	uint64_t header2[2] = {0x0000006000000101, 0x0000000100000060};
+	struct sgx_sigstruct ss;
+	const char *program;
+	int opt;
+	RSA *sign_key;
+
+	memset(&ss, 0, sizeof(ss));
+	ss.header.header1[0] = header1[0];
+	ss.header.header1[1] = header1[1];
+	ss.header.header2[0] = header2[0];
+	ss.header.header2[1] = header2[1];
+	ss.exponent = 3;
+	ss.body.attributes = SGX_ATTR_MODE64BIT | SGX_ATTR_EINITTOKENKEY;
+	ss.body.xfrm = 3,
+
+	sign_key_pass = getenv("KBUILD_SGX_SIGN_PIN");
+	program = argv[0];
+
+	do {
+		opt = getopt(argc, argv, "");
+		switch (opt) {
+		case -1:
+			break;
+		default:
+			exit_usage(program);
+		}
+	} while (opt != -1);
+
+	argc -= optind;
+	argv += optind;
+
+	if (argc < 3)
+		exit_usage(program);
+
+	/* sanity check only */
+	if (check_crypto_errors())
+		exit(1);
+
+	sign_key = load_sign_key(argv[0]);
+	if (!sign_key)
+		goto out;
+
+	BN_bn2bin(sign_key->n, ss.modulus);
+
+	if (!measure_encl(argv[1], ss.body.mrenclave))
+		goto out;
+
+	if (!sign_encl(&ss, sign_key, ss.signature))
+		goto out;
+
+	if (!calc_q1q2(ss.signature, ss.modulus, ss.q1, ss.q2))
+		goto out;
+
+	/* convert to little endian */
+	reverse_bytes(ss.signature, SGX_MODULUS_SIZE);
+	reverse_bytes(ss.modulus, SGX_MODULUS_SIZE);
+	reverse_bytes(ss.q1, SGX_MODULUS_SIZE);
+	reverse_bytes(ss.q2, SGX_MODULUS_SIZE);
+
+	if (!save_sigstruct(&ss, argv[2]))
+		goto out;
+	exit(0);
+out:
+	check_crypto_errors();
+	exit(1);
+}
diff --git a/drivers/platform/x86/intel_sgx/le/enclave/utils.c b/drivers/platform/x86/intel_sgx/le/enclave/utils.c
new file mode 100644
index 000000000000..f95b67762416
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/enclave/utils.c
@@ -0,0 +1,78 @@
+/* utils.c - TinyCrypt platform-dependent run-time operations */
+
+/*
+ *  Copyright (C) 2015 by Intel Corporation, All Rights Reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions are met:
+ *
+ *    - Redistributions of source code must retain the above copyright notice,
+ *     this list of conditions and the following disclaimer.
+ *
+ *    - Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ *    - Neither the name of Intel Corporation nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ *  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ *  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ *  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ *  POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <tinycrypt/utils.h>
+#include <tinycrypt/constants.h>
+
+#include <sgx_encl.h>
+
+#define MASK_MOST_SIG_BIT 0x80
+#define MASK_TWENTY_SEVEN 0x1b
+
+uint32_t _copy(uint8_t *to, uint32_t to_len,
+	       const uint8_t *from, uint32_t from_len)
+{
+	if (from_len <= to_len) {
+		(void)sgx_memcpy(to, from, from_len);
+		return from_len;
+	} else {
+		return TC_CRYPTO_FAIL;
+	}
+}
+
+void _set(void *to, uint8_t val, uint32_t len)
+{
+	(void)sgx_memset(to, val, len);
+}
+
+/*
+ * Doubles the value of a byte for values up to 127. Original 'return
+ * ((a<<1) ^ ((a>>7) * 0x1b))' re-written to avoid extra multiplication which
+ * the compiler won't be able to optimize
+ */
+uint8_t _double_byte(uint8_t a)
+{
+	return (a & MASK_MOST_SIG_BIT) ?
+		((a << 1) ^ MASK_TWENTY_SEVEN) : (a << 1);
+}
+
+int32_t _compare(const uint8_t *a, const uint8_t *b, size_t size)
+{
+	const uint8_t *tempa = a;
+	const uint8_t *tempb = b;
+	uint8_t result = 0;
+
+	for (uint32_t i = 0; i < size; i++) {
+		result |= tempa[i] ^ tempb[i];
+	}
+	return result;
+}
diff --git a/drivers/platform/x86/intel_sgx/le/entry.S b/drivers/platform/x86/intel_sgx/le/entry.S
new file mode 100644
index 000000000000..97554b93107d
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/entry.S
@@ -0,0 +1,117 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2017 Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * Contact Information:
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ * Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
+ *
+ * BSD LICENSE
+ *
+ * Copyright(c) 2016, 2017 Intel Corporation.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above copyright
+ *     notice, this list of conditions and the following disclaimer in
+ *     the documentation and/or other materials provided with the
+ *     distribution.
+ *   * Neither the name of Intel Corporation nor the names of its
+ *     contributors may be used to endorse or promote products derived
+ *     from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * Authors:
+ *
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ */
+
+#include <sgx_asm.h>
+
+	.text
+
+	.global sgx_le_request_token
+sgx_le_request_token:
+	push	%rbx
+	mov	$0x02, %rax
+	mov	%rsi, %rbx
+	mov	$sgx_async_exit, %rcx
+sgx_async_exit:
+	ENCLU
+	pop	%rbx
+	ret
+
+	.global sgx_sys_read
+sgx_sys_read:
+	mov	$0, %rax
+	mov	%rsi, %rdx /* buf */
+	mov	%rdi, %rsi /* count */
+	xor	%rdi, %rdi /* stdin */
+	syscall
+	ret
+
+	.global sgx_sys_write
+sgx_sys_write:
+	mov	$1, %rax
+	mov	%rsi, %rdx /* buf */
+	mov	%rdi, %rsi /* count */
+	mov	$1, %rdi /* stout */
+	syscall
+	ret
+
+	.global sgx_sys_close
+sgx_sys_close:
+	mov	$3, %rax
+	syscall
+	ret
+
+	.global sgx_sys_mmap
+sgx_sys_mmap:
+	mov	$9, %rax
+	mov	%rdi, %r8 /* fd */
+	xor	%rdi, %rdi /* any address */
+
+	mov	$0x07, %rdx /* rwx */
+	mov	$0x01, %r10 /* shared */
+	mov	$0x00, %r9 /* offset */
+	syscall
+	ret
+
+	.global sgx_sys_ioctl
+sgx_sys_ioctl:
+	mov	$16, %rax
+	syscall
+	ret
+
+	.global sgx_sys_exit
+sgx_sys_exit:
+	mov	$60, %rax
+	syscall
diff --git a/drivers/platform/x86/intel_sgx/le/include/sgx_asm.h b/drivers/platform/x86/intel_sgx/le/include/sgx_asm.h
new file mode 100644
index 000000000000..d1d5fbd70137
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/include/sgx_asm.h
@@ -0,0 +1,64 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016, 2017 Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * Contact Information:
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ * Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
+ *
+ * BSD LICENSE
+ *
+ * Copyright(c) 2016, 2017 Intel Corporation.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above copyright
+ *     notice, this list of conditions and the following disclaimer in
+ *     the documentation and/or other materials provided with the
+ *     distribution.
+ *   * Neither the name of Intel Corporation nor the names of its
+ *     contributors may be used to endorse or promote products derived
+ *     from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * Authors:
+ *
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ */
+
+#ifndef SGX_ASM_H
+#define SGX_ASM_H
+
+.macro ENCLU
+.byte 0x0f, 0x01, 0xd7
+.endm
+
+#endif /* SGX_ASM_H */
diff --git a/drivers/platform/x86/intel_sgx/le/include/sgx_encl.h b/drivers/platform/x86/intel_sgx/le/include/sgx_encl.h
new file mode 100644
index 000000000000..c0be08c78bdb
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/include/sgx_encl.h
@@ -0,0 +1,105 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016, 2017 Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * Contact Information:
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ * Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
+ *
+ * BSD LICENSE
+ *
+ * Copyright(c) 2016, 2017 Intel Corporation.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above copyright
+ *     notice, this list of conditions and the following disclaimer in
+ *     the documentation and/or other materials provided with the
+ *     distribution.
+ *   * Neither the name of Intel Corporation nor the names of its
+ *     contributors may be used to endorse or promote products derived
+ *     from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * Authors:
+ *
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ */
+
+#ifndef SGX_ENCL_H
+#define SGX_ENCL_H
+
+struct sgx_le_request {
+	void *mrenclave; /* input */
+	void *mrsigner; /* input */
+	uint64_t attributes; /* input */
+	uint64_t xfrm; /* input */
+	void *einittoken; /* output */
+};
+
+/* Outside enclave */
+
+void sgx_le_request_token(struct sgx_le_request *req, void *entry);
+long sgx_sys_read(void *buf, unsigned long count);
+long sgx_sys_write(const void *buf, unsigned long count);
+long sgx_sys_close(long fd);
+long sgx_sys_mmap(long fd, unsigned long size);
+long sgx_sys_ioctl(long fd, unsigned long cmd, void *arg);
+long sgx_sys_exit(long status);
+
+/* Inside enclave */
+
+int sgx_ereport(const void *target_info, const void *report_data,
+		void *report);
+int sgx_egetkey(void *key_request, void *key);
+
+/* Common */
+
+static inline void sgx_memset(void *dst, unsigned char value,
+			      unsigned long size)
+{
+	unsigned long i;
+
+	for (i = 0; i < size; i++)
+		((unsigned char *)dst)[i] = value;
+}
+
+static inline void sgx_memcpy(void *dst, const void *src,
+			      unsigned long size)
+{
+	unsigned long i;
+
+	for (i = 0; i < size; i++)
+		((unsigned char *)dst)[i] =
+			((unsigned char *)src)[i];
+}
+
+#endif /* SGX_ENCL_H */
diff --git a/drivers/platform/x86/intel_sgx/le/main.c b/drivers/platform/x86/intel_sgx/le/main.c
new file mode 100644
index 000000000000..2da7a8444837
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/main.c
@@ -0,0 +1,219 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016, 2017 Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * Contact Information:
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ * Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
+ *
+ * BSD LICENSE
+ *
+ * Copyright(c) 2016, 2017 Intel Corporation.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above copyright
+ *     notice, this list of conditions and the following disclaimer in
+ *     the documentation and/or other materials provided with the
+ *     distribution.
+ *   * Neither the name of Intel Corporation nor the names of its
+ *     contributors may be used to endorse or promote products derived
+ *     from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * Authors:
+ *
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ */
+
+#include <linux/types.h>
+#include <asm/sgx_arch.h>
+#include <sgx_encl.h>
+#include <uapi/asm/sgx.h>
+
+#define SGX_LE_PROXY_FD 3
+#define SGX_LE_DEV_FD 4
+
+#ifndef NULL
+#define NULL ((void *)0)
+#endif
+
+#ifndef MAP_FAILED
+#define MAP_FAILED ((void *)-1)
+#endif
+
+extern unsigned char sgx_aex[];
+extern unsigned char sgx_le_blob[];
+extern unsigned char sgx_le_blob_end[];
+extern unsigned char sgx_le_ss[];
+
+static void *start_launch_enclave(void)
+{
+	struct sgx_enclave_create create_ioc;
+	struct sgx_enclave_add_page add_ioc;
+	struct sgx_enclave_init init_ioc;
+	struct sgx_secs secs;
+	struct sgx_secinfo secinfo;
+	unsigned long blob_base;
+	unsigned long blob_size;
+	unsigned long offset;
+	int rc;
+
+	sgx_memset(&secs, 0, sizeof(secs));
+	sgx_memset(&secinfo, 0, sizeof(secinfo));
+
+	secs.ssaframesize = 1;
+	secs.attributes = SGX_ATTR_MODE64BIT | SGX_ATTR_EINITTOKENKEY;
+	secs.xfrm = 3;
+
+	blob_base = (unsigned long)&sgx_le_blob;
+	blob_size = (unsigned long)&sgx_le_blob_end - blob_base;
+
+	for (secs.size = 4096; secs.size < blob_size; secs.size <<= 1);
+
+	secs.base = (unsigned long)sgx_sys_mmap(SGX_LE_DEV_FD, secs.size);
+	if (secs.base == (unsigned long)MAP_FAILED)
+		goto out;
+
+	create_ioc.src = (unsigned long)&secs;
+	rc = sgx_sys_ioctl(SGX_LE_DEV_FD, SGX_IOC_ENCLAVE_CREATE, &create_ioc);
+	if (rc)
+		goto out;
+
+	add_ioc.secinfo = (unsigned long)&secinfo;
+	add_ioc.mrmask = 0xFFFF;
+
+	for (offset = 0; offset < blob_size; offset += 0x1000) {
+		if (!offset)
+			secinfo.flags = SGX_SECINFO_TCS;
+		else
+			secinfo.flags = SGX_SECINFO_REG | SGX_SECINFO_R |
+					SGX_SECINFO_W | SGX_SECINFO_X;
+
+		add_ioc.addr = secs.base + offset;
+		add_ioc.src = blob_base + offset;
+
+		rc = sgx_sys_ioctl(SGX_LE_DEV_FD, SGX_IOC_ENCLAVE_ADD_PAGE,
+				   &add_ioc);
+		if (rc)
+			goto out;
+	}
+
+	init_ioc.addr = secs.base;
+	init_ioc.sigstruct = (uint64_t)&sgx_le_ss;
+	init_ioc.flags = SGX_ENCLAVE_INIT_ARCH;
+	rc = sgx_sys_ioctl(SGX_LE_DEV_FD, SGX_IOC_ENCLAVE_INIT, &init_ioc);
+	if (rc)
+		goto out;
+
+	return (void *)secs.base;
+out:
+	return NULL;
+}
+
+static int read_input(void *data, unsigned int len)
+{
+	uint8_t *ptr = (uint8_t *)data;
+	long i;
+	long ret;
+
+	for (i = 0; i < len; ) {
+		ret = sgx_sys_read(&ptr[i], len - i);
+		if (ret < 0)
+			return ret;
+
+		i += ret;
+	}
+
+	return 0;
+}
+
+static int write_token(const struct sgx_einittoken *token)
+{
+	const uint8_t *ptr = (const uint8_t *)token;
+	long i;
+	long ret;
+
+	for (i = 0; i < sizeof(*token); ) {
+		ret = sgx_sys_write(&ptr[i], sizeof(*token) - i);
+		if (ret < 0)
+			return ret;
+
+		i += ret;
+	}
+
+	return 0;
+}
+
+void _start(void)
+{
+	struct sgx_einittoken token;
+	struct sgx_le_request req;
+	uint8_t mrenclave[32];
+	uint8_t mrsigner[32];
+	uint64_t attributes;
+	uint64_t xfrm;
+	void *entry;
+
+	sgx_sys_close(SGX_LE_PROXY_FD);
+	entry = start_launch_enclave();
+	sgx_sys_close(SGX_LE_DEV_FD);
+	if (!entry)
+		sgx_sys_exit(1);
+
+	for ( ; ; ) {
+		if (read_input(mrenclave, sizeof(mrenclave)))
+			sgx_sys_exit(1);
+
+		if (read_input(mrsigner, sizeof(mrsigner)))
+			sgx_sys_exit(1);
+
+		if (read_input(&attributes, sizeof(uint64_t)))
+			sgx_sys_exit(1);
+
+		if (read_input(&xfrm, sizeof(uint64_t)))
+			sgx_sys_exit(1);
+
+		req.mrenclave = mrenclave;
+		req.mrsigner = mrsigner;
+		req.attributes = attributes;
+		req.xfrm = xfrm;
+
+		sgx_memset(&token, 0, sizeof(token));
+		req.einittoken = &token;
+		sgx_le_request_token(&req, entry);
+
+		if (write_token(&token))
+			sgx_sys_exit(1);
+	}
+
+	__builtin_unreachable();
+}
diff --git a/drivers/platform/x86/intel_sgx/le/sgx_le_piggy.S b/drivers/platform/x86/intel_sgx/le/sgx_le_piggy.S
new file mode 100644
index 000000000000..e5631e8a755d
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/le/sgx_le_piggy.S
@@ -0,0 +1,15 @@
+#include <linux/linkage.h>
+#include <asm/page_types.h>
+
+	.section ".rodata","a"
+	.balign PAGE_SIZE
+
+GLOBAL(sgx_le_blob)
+	.incbin	"drivers/platform/x86/intel_sgx/le/enclave/sgx_le.bin"
+END(sgx_le_blob)
+
+GLOBAL(sgx_le_blob_end);
+
+GLOBAL(sgx_le_ss)
+	.incbin	"drivers/platform/x86/intel_sgx/le/enclave/sgx_le.ss"
+END(sgx_le_ss)
diff --git a/drivers/platform/x86/intel_sgx/sgx_le_proxy_piggy.S b/drivers/platform/x86/intel_sgx/sgx_le_proxy_piggy.S
new file mode 100644
index 000000000000..faced8a9a75a
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/sgx_le_proxy_piggy.S
@@ -0,0 +1,11 @@
+#include <linux/linkage.h>
+#include <asm/export.h>
+#include <asm/page_types.h>
+
+	.section ".rodata","a"
+
+GLOBAL(sgx_le_proxy)
+	.incbin	"drivers/platform/x86/intel_sgx/le/sgx_le_proxy"
+END(sgx_le_proxy)
+
+GLOBAL(sgx_le_proxy_end)
-- 
2.14.1
