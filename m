From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v9 4/7] intel_sgx: driver for Intel Software Guard Extensions
Date: Sat, 16 Dec 2017 18:19:51 +0200
Message-ID: <20171216162200.20243-5-jarkko.sakkinen@linux.intel.com>
References: <20171216162200.20243-1-jarkko.sakkinen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171216162200.20243-1-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Intel SGX is a set of CPU instructions that can be used by applications
to set aside private regions of code and data.  The code outside the
enclave is disallowed to access the memory inside the enclave by the CPU
access control.

SGX driver provides a ioctl API for loading and initializing enclaves.
Address range for enclaves is reserved with mmap() and they are
destroyed with munmap(). Enclave construction, measurement and
initialization is done with the provided the ioctl API.

The driver implements also a swapper thread ksgxswapd for EPC pages
backed by a private shmem file. Currently it has a limitation of not
swapping VA pages but there is nothing preventing to implement it later
on. Now it was scoped out in order to keep the implementation simple.

The parameter struct for SGX_IOC_ENCLAVE_INIT does not contain a
parameter to supply a launch token. Generating and using tokens is best
to be kept in the control of the kernel because it has direct binding to
the IA32_SGXPUBKEYHASHx MSRs (a core must have MSRs set to the same
value as the signer of token).

By giving user space any role in the launch process is a risk for
introducing bottlenecks as kernel must exhibit behavior that user space
launch daemon depends on, properietary risks (closed launch daemons on
closed platforms) and stability risks as there would be division of
semantics between user space and kernel.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Tested-by: Serge Ayoun <serge.ayoun@intel.com>
---
 arch/x86/include/asm/sgx.h                      | 233 ++++++
 arch/x86/include/asm/sgx_arch.h                 | 270 +++++++
 arch/x86/include/uapi/asm/sgx.h                 | 138 ++++
 drivers/platform/x86/Kconfig                    |   2 +
 drivers/platform/x86/Makefile                   |   1 +
 drivers/platform/x86/intel_sgx/Kconfig          |  19 +
 drivers/platform/x86/intel_sgx/Makefile         |  13 +
 drivers/platform/x86/intel_sgx/sgx.h            | 259 +++++++
 drivers/platform/x86/intel_sgx/sgx_encl.c       | 974 ++++++++++++++++++++++++
 drivers/platform/x86/intel_sgx/sgx_ioctl.c      | 281 +++++++
 drivers/platform/x86/intel_sgx/sgx_main.c       | 413 ++++++++++
 drivers/platform/x86/intel_sgx/sgx_page_cache.c | 642 ++++++++++++++++
 drivers/platform/x86/intel_sgx/sgx_util.c       | 347 +++++++++
 drivers/platform/x86/intel_sgx/sgx_vma.c        | 117 +++
 14 files changed, 3709 insertions(+)
 create mode 100644 arch/x86/include/asm/sgx.h
 create mode 100644 arch/x86/include/asm/sgx_arch.h
 create mode 100644 arch/x86/include/uapi/asm/sgx.h
 create mode 100644 drivers/platform/x86/intel_sgx/Kconfig
 create mode 100644 drivers/platform/x86/intel_sgx/Makefile
 create mode 100644 drivers/platform/x86/intel_sgx/sgx.h
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_encl.c
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_ioctl.c
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_main.c
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_page_cache.c
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_util.c
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_vma.c

diff --git a/arch/x86/include/asm/sgx.h b/arch/x86/include/asm/sgx.h
new file mode 100644
index 000000000000..2c2575100d0d
--- /dev/null
+++ b/arch/x86/include/asm/sgx.h
@@ -0,0 +1,233 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Suresh Siddha <suresh.b.siddha@intel.com>
+ */
+
+#ifndef _ASM_X86_SGX_H
+#define _ASM_X86_SGX_H
+
+#include <asm/sgx_arch.h>
+#include <asm/asm.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/types.h>
+
+#define SGX_CPUID 0x12
+
+enum sgx_cpuid {
+	SGX_CPUID_CAPABILITIES	= 0,
+	SGX_CPUID_ATTRIBUTES	= 1,
+	SGX_CPUID_EPC_BANKS	= 2,
+};
+
+enum sgx_commands {
+	ECREATE	= 0x0,
+	EADD	= 0x1,
+	EINIT	= 0x2,
+	EREMOVE	= 0x3,
+	EDGBRD	= 0x4,
+	EDGBWR	= 0x5,
+	EEXTEND	= 0x6,
+	ELDU	= 0x8,
+	EBLOCK	= 0x9,
+	EPA	= 0xA,
+	EWB	= 0xB,
+	ETRACK	= 0xC,
+	EAUG	= 0xD,
+	EMODPR	= 0xE,
+	EMODT	= 0xF,
+};
+
+#ifdef CONFIG_X86_64
+#define XAX "%%rax"
+#else
+#define XAX "%%eax"
+#endif
+
+#define __encls_ret(rax, rbx, rcx, rdx)			\
+	({						\
+	int ret;					\
+	asm volatile(					\
+	"1: .byte 0x0f, 0x01, 0xcf;\n\t"		\
+	"2:\n"						\
+	".section .fixup,\"ax\"\n"			\
+	"3: mov $-14,"XAX"\n"				\
+	"   jmp 2b\n"					\
+	".previous\n"					\
+	_ASM_EXTABLE(1b, 3b)				\
+	: "=a"(ret)					\
+	: "a"(rax), "b"(rbx), "c"(rcx), "d"(rdx)	\
+	: "memory");					\
+	ret;						\
+	})
+
+#define __encls(rax, rbx, rcx, rdx...)			\
+	({						\
+	int ret;					\
+	asm volatile(					\
+	"1: .byte 0x0f, 0x01, 0xcf;\n\t"		\
+	"   xor "XAX","XAX"\n"				\
+	"2:\n"						\
+	".section .fixup,\"ax\"\n"			\
+	"3: mov $-14,"XAX"\n"				\
+	"   jmp 2b\n"					\
+	".previous\n"					\
+	_ASM_EXTABLE(1b, 3b)				\
+	: "=a"(ret), "=b"(rbx), "=c"(rcx)		\
+	: "a"(rax), "b"(rbx), "c"(rcx), rdx		\
+	: "memory");					\
+	ret;						\
+	})
+
+static inline unsigned long __ecreate(struct sgx_pageinfo *pginfo, void *secs)
+{
+	return __encls(ECREATE, pginfo, secs, "d"(0));
+}
+
+static inline int __eextend(void *secs, void *epc)
+{
+	return __encls(EEXTEND, secs, epc, "d"(0));
+}
+
+static inline int __eadd(struct sgx_pageinfo *pginfo, void *epc)
+{
+	return __encls(EADD, pginfo, epc, "d"(0));
+}
+
+static inline int __einit(void *sigstruct, struct sgx_einittoken *einittoken,
+			  void *secs)
+{
+	return __encls_ret(EINIT, sigstruct, secs, einittoken);
+}
+
+static inline int __eremove(void *epc)
+{
+	unsigned long rbx = 0;
+	unsigned long rdx = 0;
+
+	return __encls_ret(EREMOVE, rbx, epc, rdx);
+}
+
+static inline int __edbgwr(unsigned long addr, unsigned long *data)
+{
+	return __encls(EDGBWR, *data, addr, "d"(0));
+}
+
+static inline int __edbgrd(unsigned long addr, unsigned long *data)
+{
+	unsigned long rbx = 0;
+	int ret;
+
+	ret = __encls(EDGBRD, rbx, addr, "d"(0));
+	if (!ret)
+		*(unsigned long *) data = rbx;
+
+	return ret;
+}
+
+static inline int __etrack(void *epc)
+{
+	unsigned long rbx = 0;
+	unsigned long rdx = 0;
+
+	return __encls_ret(ETRACK, rbx, epc, rdx);
+}
+
+static inline int __eldu(unsigned long rbx, unsigned long rcx,
+			 unsigned long rdx)
+{
+	return __encls_ret(ELDU, rbx, rcx, rdx);
+}
+
+static inline int __eblock(void *epc)
+{
+	unsigned long rbx = 0;
+	unsigned long rdx = 0;
+
+	return __encls_ret(EBLOCK, rbx, epc, rdx);
+}
+
+static inline int __epa(void *epc)
+{
+	unsigned long rbx = SGX_PAGE_TYPE_VA;
+
+	return __encls(EPA, rbx, epc, "d"(0));
+}
+
+static inline int __ewb(struct sgx_pageinfo *pginfo, void *epc, void *va)
+{
+	return __encls_ret(EWB, pginfo, epc, va);
+}
+
+static inline int __eaug(struct sgx_pageinfo *pginfo, void *epc)
+{
+	return __encls(EAUG, pginfo, epc, "d"(0));
+}
+
+static inline int __emodpr(struct sgx_secinfo *secinfo, void *epc)
+{
+	unsigned long rdx = 0;
+
+	return __encls_ret(EMODPR, secinfo, epc, rdx);
+}
+
+static inline int __emodt(struct sgx_secinfo *secinfo, void *epc)
+{
+	unsigned long rdx = 0;
+
+	return __encls_ret(EMODT, secinfo, epc, rdx);
+}
+
+#endif /* _ASM_X86_SGX_H */
diff --git a/arch/x86/include/asm/sgx_arch.h b/arch/x86/include/asm/sgx_arch.h
new file mode 100644
index 000000000000..6f5f4cfc9428
--- /dev/null
+++ b/arch/x86/include/asm/sgx_arch.h
@@ -0,0 +1,270 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+#ifndef _ASM_X86_SGX_ARCH_H
+#define _ASM_X86_SGX_ARCH_H
+
+#include <linux/types.h>
+
+#define SGX_SSA_GPRS_SIZE		182
+#define SGX_SSA_MISC_EXINFO_SIZE	16
+
+enum sgx_misc {
+	SGX_MISC_EXINFO		= 0x01,
+};
+
+#define SGX_MISC_RESERVED_MASK 0xFFFFFFFFFFFFFFFEL
+
+enum sgx_attribute {
+	SGX_ATTR_DEBUG		= 0x02,
+	SGX_ATTR_MODE64BIT	= 0x04,
+	SGX_ATTR_PROVISIONKEY	= 0x10,
+	SGX_ATTR_EINITTOKENKEY	= 0x20,
+};
+
+#define SGX_ATTR_RESERVED_MASK 0xFFFFFFFFFFFFFFC9L
+
+#define SGX_SECS_RESERVED1_SIZE 24
+#define SGX_SECS_RESERVED2_SIZE 32
+#define SGX_SECS_RESERVED3_SIZE 96
+#define SGX_SECS_RESERVED4_SIZE 3836
+
+struct sgx_secs {
+	uint64_t size;
+	uint64_t base;
+	uint32_t ssaframesize;
+	uint32_t miscselect;
+	uint8_t reserved1[SGX_SECS_RESERVED1_SIZE];
+	uint64_t attributes;
+	uint64_t xfrm;
+	uint32_t mrenclave[8];
+	uint8_t reserved2[SGX_SECS_RESERVED2_SIZE];
+	uint32_t mrsigner[8];
+	uint8_t	reserved3[SGX_SECS_RESERVED3_SIZE];
+	uint16_t isvvprodid;
+	uint16_t isvsvn;
+	uint8_t reserved4[SGX_SECS_RESERVED4_SIZE];
+};
+
+enum sgx_tcs_flags {
+	SGX_TCS_DBGOPTIN	= 0x01, /* cleared on EADD */
+};
+
+#define SGX_TCS_RESERVED_MASK 0xFFFFFFFFFFFFFFFEL
+
+struct sgx_tcs {
+	uint64_t state;
+	uint64_t flags;
+	uint64_t ossa;
+	uint32_t cssa;
+	uint32_t nssa;
+	uint64_t oentry;
+	uint64_t aep;
+	uint64_t ofsbase;
+	uint64_t ogsbase;
+	uint32_t fslimit;
+	uint32_t gslimit;
+	uint64_t reserved[503];
+};
+
+struct sgx_pageinfo {
+	uint64_t linaddr;
+	uint64_t srcpge;
+	union {
+		uint64_t secinfo;
+		uint64_t pcmd;
+	};
+	uint64_t secs;
+} __attribute__((aligned(32)));
+
+
+#define SGX_SECINFO_PERMISSION_MASK	0x0000000000000007L
+#define SGX_SECINFO_PAGE_TYPE_MASK	0x000000000000FF00L
+#define SGX_SECINFO_RESERVED_MASK	0xFFFFFFFFFFFF00F8L
+
+enum sgx_page_type {
+	SGX_PAGE_TYPE_SECS	= 0x00,
+	SGX_PAGE_TYPE_TCS	= 0x01,
+	SGX_PAGE_TYPE_REG	= 0x02,
+	SGX_PAGE_TYPE_VA	= 0x03,
+};
+
+enum sgx_secinfo_flags {
+	SGX_SECINFO_R		= 0x01,
+	SGX_SECINFO_W		= 0x02,
+	SGX_SECINFO_X		= 0x04,
+	SGX_SECINFO_SECS	= (SGX_PAGE_TYPE_SECS << 8),
+	SGX_SECINFO_TCS		= (SGX_PAGE_TYPE_TCS << 8),
+	SGX_SECINFO_REG		= (SGX_PAGE_TYPE_REG << 8),
+};
+
+struct sgx_secinfo {
+	uint64_t flags;
+	uint64_t reserved[7];
+} __attribute__((aligned(64)));
+
+struct sgx_pcmd {
+	struct sgx_secinfo secinfo;
+	uint64_t enclave_id;
+	uint8_t reserved[40];
+	uint8_t mac[16];
+};
+
+#define SGX_MODULUS_SIZE 384
+
+struct sgx_sigstruct_header {
+	uint64_t header1[2];
+	uint32_t vendor;
+	uint32_t date;
+	uint64_t header2[2];
+	uint32_t swdefined;
+	uint8_t reserved1[84];
+};
+
+struct sgx_sigstruct_body {
+	uint32_t miscselect;
+	uint32_t miscmask;
+	uint8_t reserved2[20];
+	uint64_t attributes;
+	uint64_t xfrm;
+	uint8_t attributemask[16];
+	uint8_t mrenclave[32];
+	uint8_t reserved3[32];
+	uint16_t isvprodid;
+	uint16_t isvsvn;
+} __attribute__((__packed__));
+
+struct sgx_sigstruct {
+	struct sgx_sigstruct_header header;
+	uint8_t modulus[SGX_MODULUS_SIZE];
+	uint32_t exponent;
+	uint8_t signature[SGX_MODULUS_SIZE];
+	struct sgx_sigstruct_body body;
+	uint8_t reserved4[12];
+	uint8_t q1[SGX_MODULUS_SIZE];
+	uint8_t q2[SGX_MODULUS_SIZE];
+};
+
+struct sgx_sigstruct_payload {
+	struct sgx_sigstruct_header header;
+	struct sgx_sigstruct_body body;
+};
+
+struct sgx_einittoken_payload {
+	uint32_t valid;
+	uint32_t reserved1[11];
+	uint64_t attributes;
+	uint64_t xfrm;
+	uint8_t mrenclave[32];
+	uint8_t reserved2[32];
+	uint8_t mrsigner[32];
+	uint8_t reserved3[32];
+};
+
+struct sgx_einittoken {
+	struct sgx_einittoken_payload payload;
+	uint8_t cpusvnle[16];
+	uint16_t isvprodidle;
+	uint16_t isvsvnle;
+	uint8_t reserved2[24];
+	uint32_t maskedmiscselectle;
+	uint64_t maskedattributesle;
+	uint64_t maskedxfrmle;
+	uint8_t keyid[32];
+	uint8_t mac[16];
+};
+
+struct sgx_report {
+	uint8_t cpusvn[16];
+	uint32_t miscselect;
+	uint8_t reserved1[28];
+	uint64_t attributes;
+	uint64_t xfrm;
+	uint8_t mrenclave[32];
+	uint8_t reserved2[32];
+	uint8_t mrsigner[32];
+	uint8_t reserved3[96];
+	uint16_t isvprodid;
+	uint16_t isvsvn;
+	uint8_t reserved4[60];
+	uint8_t reportdata[64];
+	uint8_t keyid[32];
+	uint8_t mac[16];
+};
+
+struct sgx_targetinfo {
+	uint8_t mrenclave[32];
+	uint64_t attributes;
+	uint64_t xfrm;
+	uint8_t reserved1[4];
+	uint32_t miscselect;
+	uint8_t reserved2[456];
+};
+
+struct sgx_keyrequest {
+	uint16_t keyname;
+	uint16_t keypolicy;
+	uint16_t isvsvn;
+	uint16_t reserved1;
+	uint8_t cpusvn[16];
+	uint64_t attributemask;
+	uint64_t xfrmmask;
+	uint8_t keyid[32];
+	uint32_t miscmask;
+	uint8_t reserved2[436];
+};
+
+#endif /* _ASM_X86_SGX_ARCH_H */
diff --git a/arch/x86/include/uapi/asm/sgx.h b/arch/x86/include/uapi/asm/sgx.h
new file mode 100644
index 000000000000..9bd8907efdaf
--- /dev/null
+++ b/arch/x86/include/uapi/asm/sgx.h
@@ -0,0 +1,138 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Suresh Siddha <suresh.b.siddha@intel.com>
+ */
+
+#ifndef _UAPI_ASM_X86_SGX_H
+#define _UAPI_ASM_X86_SGX_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+#define SGX_MAGIC 0xA4
+
+#define SGX_IOC_ENCLAVE_CREATE \
+	_IOW(SGX_MAGIC, 0x00, struct sgx_enclave_create)
+#define SGX_IOC_ENCLAVE_ADD_PAGE \
+	_IOW(SGX_MAGIC, 0x01, struct sgx_enclave_add_page)
+#define SGX_IOC_ENCLAVE_INIT \
+	_IOW(SGX_MAGIC, 0x02, struct sgx_enclave_init)
+
+/* SGX leaf instruction return values */
+#define SGX_SUCCESS			0
+#define SGX_INVALID_SIG_STRUCT		1
+#define SGX_INVALID_ATTRIBUTE		2
+#define SGX_BLKSTATE			3
+#define SGX_INVALID_MEASUREMENT		4
+#define SGX_NOTBLOCKABLE		5
+#define SGX_PG_INVLD			6
+#define SGX_LOCKFAIL			7
+#define SGX_INVALID_SIGNATURE		8
+#define SGX_MAC_COMPARE_FAIL		9
+#define SGX_PAGE_NOT_BLOCKED		10
+#define SGX_NOT_TRACKED			11
+#define SGX_VA_SLOT_OCCUPIED		12
+#define SGX_CHILD_PRESENT		13
+#define SGX_ENCLAVE_ACT			14
+#define SGX_ENTRYEPOCH_LOCKED		15
+#define SGX_INVALID_EINITTOKEN		16
+#define SGX_PREV_TRK_INCMPL		17
+#define SGX_PG_IS_SECS			18
+#define SGX_INVALID_CPUSVN		32
+#define SGX_INVALID_ISVSVN		64
+#define SGX_UNMASKED_EVENT		128
+#define SGX_INVALID_KEYNAME		256
+
+/* IOCTL return values */
+#define SGX_POWER_LOST_ENCLAVE		0x40000000
+#define SGX_LE_ROLLBACK			0x40000001
+
+/**
+ * struct sgx_enclave_create - parameter structure for the
+ *                             %SGX_IOC_ENCLAVE_CREATE ioctl
+ * @src:	address for the SECS page data
+ */
+struct sgx_enclave_create  {
+	__u64	src;
+};
+
+/**
+ * struct sgx_enclave_add_page - parameter structure for the
+ *                               %SGX_IOC_ENCLAVE_ADD_PAGE ioctl
+ * @addr:	address within the ELRANGE
+ * @src:	address for the page data
+ * @secinfo:	address for the SECINFO data
+ * @mrmask:	bitmask for the measured 256 byte chunks
+ */
+struct sgx_enclave_add_page {
+	__u64	addr;
+	__u64	src;
+	__u64	secinfo;
+	__u16	mrmask;
+} __attribute__((__packed__));
+
+
+/**
+ * struct sgx_enclave_init - parameter structure for the
+ *                           %SGX_IOC_ENCLAVE_INIT ioctl
+ * @addr:	address within the ELRANGE
+ * @sigstruct:	address for the SIGSTRUCT data
+ */
+struct sgx_enclave_init {
+	__u64	addr;
+	__u64	sigstruct;
+};
+
+#endif /* _UAPI_ASM_X86_SGX_H */
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 2c745e8ccad6..e962df10f1b5 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1170,6 +1170,8 @@ config SILEAD_DMI
 	  with the OS-image for the device. This option supplies the missing
 	  information. Enable this for x86 tablets with Silead touchscreens.
 
+source "drivers/platform/x86/intel_sgx/Kconfig"
+
 endif # X86_PLATFORM_DEVICES
 
 config PMC_ATOM
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index c32b34a72467..fc31186b85df 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -88,3 +88,4 @@ obj-$(CONFIG_PMC_ATOM)		+= pmc_atom.o
 obj-$(CONFIG_MLX_PLATFORM)	+= mlx-platform.o
 obj-$(CONFIG_MLX_CPLD_PLATFORM)	+= mlxcpld-hotplug.o
 obj-$(CONFIG_INTEL_TURBO_MAX_3) += intel_turbo_max_3.o
+obj-$(CONFIG_INTEL_SGX) += intel_sgx/
diff --git a/drivers/platform/x86/intel_sgx/Kconfig b/drivers/platform/x86/intel_sgx/Kconfig
new file mode 100644
index 000000000000..5c7e61ecb524
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/Kconfig
@@ -0,0 +1,19 @@
+#
+# Intel SGX
+#
+
+config INTEL_SGX
+	tristate "Intel(R) SGX Driver"
+	default n
+	depends on X86_64 && CPU_SUP_INTEL
+	select MMU_NOTIFIER
+	---help---
+	Intel(R) SGX is a set of CPU instructions that can be used by
+	applications to set aside private regions of code and data.  The code
+	outside the enclave is disallowed to access the memory inside the
+	enclave by the CPU access control.
+
+	The firmware uses PRMRR registers to reserve an area of physical memory
+	called Enclave Page Cache (EPC). There is a hardware unit in the
+	processor called Memory Encryption Engine. The MEE encrypts and decrypts
+	the EPC pages as they enter and leave the processor package.
diff --git a/drivers/platform/x86/intel_sgx/Makefile b/drivers/platform/x86/intel_sgx/Makefile
new file mode 100644
index 000000000000..92af94668508
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/Makefile
@@ -0,0 +1,13 @@
+#
+# Intel SGX
+#
+
+obj-$(CONFIG_INTEL_SGX) += intel_sgx.o
+
+intel_sgx-$(CONFIG_INTEL_SGX) += \
+	sgx_ioctl.o \
+	sgx_encl.o \
+	sgx_main.o \
+	sgx_page_cache.o \
+	sgx_util.o \
+	sgx_vma.o \
diff --git a/drivers/platform/x86/intel_sgx/sgx.h b/drivers/platform/x86/intel_sgx/sgx.h
new file mode 100644
index 000000000000..f123e6d9ce62
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/sgx.h
@@ -0,0 +1,259 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Suresh Siddha <suresh.b.siddha@intel.com>
+ * Serge Ayoun <serge.ayoun@intel.com>
+ * Shay Katz-zamir <shay.katz-zamir@intel.com>
+ */
+
+#ifndef __ARCH_INTEL_SGX_H__
+#define __ARCH_INTEL_SGX_H__
+
+#include <linux/kref.h>
+#include <linux/mmu_notifier.h>
+#include <linux/radix-tree.h>
+#include <linux/rbtree.h>
+#include <linux/rwsem.h>
+#include <linux/sched.h>
+#include <linux/workqueue.h>
+#include <asm/sgx.h>
+#include <uapi/asm/sgx.h>
+
+#define SGX_MAX_EPC_BANKS 8
+
+#define SGX_EINIT_SPIN_COUNT	20
+#define SGX_EINIT_SLEEP_COUNT	50
+#define SGX_EINIT_SLEEP_TIME	20
+
+#define SGX_VA_SLOT_COUNT 512
+#define SGX_VA_OFFSET_MASK ((SGX_VA_SLOT_COUNT - 1) << 3)
+
+#define SGX_EPC_BANK(epc_page) \
+	(&sgx_epc_banks[(unsigned long)(epc_page) & ~PAGE_MASK])
+#define SGX_EPC_PFN(epc_page) PFN_DOWN((unsigned long)(epc_page))
+#define SGX_EPC_ADDR(epc_page) ((unsigned long)(epc_page) & PAGE_MASK)
+
+enum sgx_alloc_flags {
+	SGX_ALLOC_ATOMIC	= BIT(0),
+};
+
+struct sgx_va_page {
+	void *epc_page;
+	DECLARE_BITMAP(slots, SGX_VA_SLOT_COUNT);
+	struct list_head list;
+};
+
+static inline unsigned int sgx_alloc_va_slot(struct sgx_va_page *page)
+{
+	int slot = find_first_zero_bit(page->slots, SGX_VA_SLOT_COUNT);
+
+	if (slot < SGX_VA_SLOT_COUNT)
+		set_bit(slot, page->slots);
+
+	return slot << 3;
+}
+
+static inline void sgx_free_va_slot(struct sgx_va_page *page,
+				    unsigned int offset)
+{
+	clear_bit(offset >> 3, page->slots);
+}
+
+static inline bool sgx_va_page_full(struct sgx_va_page *page)
+{
+	int slot = find_first_zero_bit(page->slots, SGX_VA_SLOT_COUNT);
+
+	return slot == SGX_VA_SLOT_COUNT;
+}
+
+enum sgx_encl_page_flags {
+	SGX_ENCL_PAGE_TCS	= BIT(0),
+	SGX_ENCL_PAGE_RESERVED	= BIT(1),
+	SGX_ENCL_PAGE_LOADED	= BIT(2),
+};
+
+#define SGX_ENCL_PAGE_ADDR(encl_page) ((encl_page)->desc & PAGE_MASK)
+#define SGX_ENCL_PAGE_VA_OFFSET(encl_page) \
+	((encl_page)->desc & SGX_VA_OFFSET_MASK)
+#define SGX_ENCL_PAGE_PCMD_OFFSET(encl_page) \
+	((PFN_DOWN((encl_page)->desc) & 31) * 128)
+
+struct sgx_encl_page {
+	unsigned long desc;
+	union {
+		void *epc_page;
+		struct sgx_va_page *va_page;
+	};
+	struct list_head list;
+};
+
+struct sgx_tgid_ctx {
+	struct pid *tgid;
+	struct kref refcount;
+	struct list_head encl_list;
+	struct list_head list;
+};
+
+enum sgx_encl_flags {
+	SGX_ENCL_INITIALIZED	= BIT(0),
+	SGX_ENCL_DEBUG		= BIT(1),
+	SGX_ENCL_SECS_EVICTED	= BIT(2),
+	SGX_ENCL_SUSPEND	= BIT(3),
+	SGX_ENCL_DEAD		= BIT(4),
+};
+
+struct sgx_encl {
+	unsigned int flags;
+	uint64_t attributes;
+	uint64_t xfrm;
+	unsigned int page_cnt;
+	unsigned int secs_child_cnt;
+	struct mutex lock;
+	struct mm_struct *mm;
+	struct file *backing;
+	struct file *pcmd;
+	struct list_head load_list;
+	struct kref refcount;
+	unsigned long base;
+	unsigned long size;
+	unsigned long ssaframesize;
+	struct list_head va_pages;
+	struct radix_tree_root page_tree;
+	struct list_head add_page_reqs;
+	struct work_struct add_page_work;
+	struct sgx_encl_page secs;
+	struct sgx_tgid_ctx *tgid_ctx;
+	struct list_head encl_list;
+	struct mmu_notifier mmu_notifier;
+};
+
+extern struct workqueue_struct *sgx_add_page_wq;
+extern u64 sgx_encl_size_max_32;
+extern u64 sgx_encl_size_max_64;
+extern u64 sgx_xfrm_mask;
+extern u32 sgx_misc_reserved;
+extern u32 sgx_xsave_size_tbl[64];
+
+extern const struct vm_operations_struct sgx_vm_ops;
+
+#define sgx_pr_ratelimited(level, encl, fmt, ...)			  \
+	pr_ ## level ## _ratelimited("intel_sgx: [%d:0x%p] " fmt,	  \
+				     pid_nr((encl)->tgid_ctx->tgid),	  \
+				     (void *)(encl)->base, ##__VA_ARGS__)
+
+#define sgx_dbg(encl, fmt, ...) \
+	sgx_pr_ratelimited(debug, encl, fmt, ##__VA_ARGS__)
+#define sgx_info(encl, fmt, ...) \
+	sgx_pr_ratelimited(info, encl, fmt, ##__VA_ARGS__)
+#define sgx_warn(encl, fmt, ...) \
+	sgx_pr_ratelimited(warn, encl, fmt, ##__VA_ARGS__)
+#define sgx_err(encl, fmt, ...) \
+	sgx_pr_ratelimited(err, encl, fmt, ##__VA_ARGS__)
+#define sgx_crit(encl, fmt, ...) \
+	sgx_pr_ratelimited(crit, encl, fmt, ##__VA_ARGS__)
+
+int sgx_encl_find(struct mm_struct *mm, unsigned long addr,
+		  struct vm_area_struct **vma);
+void sgx_tgid_ctx_release(struct kref *ref);
+struct sgx_encl *sgx_encl_alloc(struct sgx_secs *secs);
+int sgx_encl_create(struct sgx_encl *encl, struct sgx_secs *secs);
+int sgx_encl_add_page(struct sgx_encl *encl, unsigned long addr, void *data,
+		      struct sgx_secinfo *secinfo, unsigned int mrmask);
+int sgx_encl_init(struct sgx_encl *encl, struct sgx_sigstruct *sigstruct,
+		  struct sgx_einittoken *einittoken);
+void sgx_encl_release(struct kref *ref);
+
+long sgx_ioctl(struct file *filep, unsigned int cmd, unsigned long arg);
+#ifdef CONFIG_COMPAT
+long sgx_compat_ioctl(struct file *filep, unsigned int cmd, unsigned long arg);
+#endif
+
+/* Utility functions */
+int sgx_test_and_clear_young(struct sgx_encl_page *page, struct sgx_encl *encl);
+struct page *sgx_get_backing(struct sgx_encl *encl,
+			     struct sgx_encl_page *entry,
+			     bool pcmd);
+void sgx_put_backing(struct page *backing, bool write);
+void sgx_insert_pte(struct sgx_encl *encl,
+		    struct sgx_encl_page *encl_page,
+		    void *epc_page,
+		    struct vm_area_struct *vma);
+int sgx_eremove(void *epc_page);
+void sgx_zap_tcs_ptes(struct sgx_encl *encl,
+		      struct vm_area_struct *vma);
+void sgx_invalidate(struct sgx_encl *encl, bool flush_cpus);
+void sgx_flush_cpus(struct sgx_encl *encl);
+
+enum sgx_fault_flags {
+	SGX_FAULT_RESERVE	= BIT(0),
+};
+
+struct sgx_encl_page *sgx_fault_page(struct vm_area_struct *vma,
+				     unsigned long addr,
+				     unsigned int flags);
+
+
+extern struct mutex sgx_tgid_ctx_mutex;
+extern struct list_head sgx_tgid_ctx_list;
+extern atomic_t sgx_va_pages_cnt;
+
+int sgx_add_epc_bank(resource_size_t start, unsigned long size, int bank);
+int sgx_page_cache_init(struct device *parent);
+void sgx_page_cache_teardown(void);
+void *sgx_alloc_page(unsigned int flags);
+void sgx_free_page(void *page, struct sgx_encl *encl);
+void *sgx_get_page(void *page);
+void sgx_put_page(void *ptr);
+
+#endif /* __ARCH_X86_INTEL_SGX_H__ */
diff --git a/drivers/platform/x86/intel_sgx/sgx_encl.c b/drivers/platform/x86/intel_sgx/sgx_encl.c
new file mode 100644
index 000000000000..4c3b465c1770
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/sgx_encl.c
@@ -0,0 +1,974 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Suresh Siddha <suresh.b.siddha@intel.com>
+ * Serge Ayoun <serge.ayoun@intel.com>
+ * Shay Katz-zamir <shay.katz-zamir@intel.com>
+ * Sean Christopherson <sean.j.christopherson@intel.com>
+ */
+
+#include <asm/mman.h>
+#include <linux/delay.h>
+#include <linux/file.h>
+#include <linux/hashtable.h>
+#include <linux/highmem.h>
+#include <linux/ratelimit.h>
+#include <linux/sched/signal.h>
+#include <linux/shmem_fs.h>
+#include <linux/slab.h>
+#include "sgx.h"
+
+struct sgx_add_page_req {
+	struct sgx_encl *encl;
+	struct sgx_encl_page *encl_page;
+	struct sgx_secinfo secinfo;
+	u16 mrmask;
+	struct list_head list;
+};
+
+/**
+ * sgx_encl_find - find an enclave
+ * @mm:		mm struct of the current process
+ * @addr:	address in the ELRANGE
+ * @vma:	the resulting VMA
+ *
+ * Finds an enclave identified by the given address. Gives back the VMA, that
+ * is part of the enclave, located in that address. The VMA is given back if it
+ * is a proper enclave VMA even if a &struct sgx_encl instance does not exist
+ * yet (enclave creation has not been performed).
+ *
+ * Return:
+ * 0 on success,
+ * -EINVAL if an enclave was not found,
+ * -ENOENT if the enclave has not been created yet
+ */
+int sgx_encl_find(struct mm_struct *mm, unsigned long addr,
+		  struct vm_area_struct **vma)
+{
+	struct vm_area_struct *result;
+	struct sgx_encl *encl;
+
+	result = find_vma(mm, addr);
+	if (!result || result->vm_ops != &sgx_vm_ops || addr < result->vm_start)
+		return -EINVAL;
+
+	encl = result->vm_private_data;
+	*vma = result;
+
+	return encl ? 0 : -ENOENT;
+}
+
+static struct sgx_tgid_ctx *sgx_find_tgid_ctx(struct pid *tgid)
+{
+	struct sgx_tgid_ctx *ctx;
+
+	list_for_each_entry(ctx, &sgx_tgid_ctx_list, list)
+		if (pid_nr(ctx->tgid) == pid_nr(tgid))
+			return ctx;
+
+	return NULL;
+}
+
+static int sgx_add_to_tgid_ctx(struct sgx_encl *encl)
+{
+	struct pid *tgid = get_pid(task_tgid(current));
+	struct sgx_tgid_ctx *ctx;
+
+	mutex_lock(&sgx_tgid_ctx_mutex);
+
+	ctx = sgx_find_tgid_ctx(tgid);
+	if (ctx) {
+		if (kref_get_unless_zero(&ctx->refcount)) {
+			encl->tgid_ctx = ctx;
+			mutex_unlock(&sgx_tgid_ctx_mutex);
+			put_pid(tgid);
+			return 0;
+		}
+
+		list_del_init(&ctx->list);
+	}
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx) {
+		mutex_unlock(&sgx_tgid_ctx_mutex);
+		put_pid(tgid);
+		return -ENOMEM;
+	}
+
+	ctx->tgid = tgid;
+	kref_init(&ctx->refcount);
+	INIT_LIST_HEAD(&ctx->encl_list);
+
+	list_add(&ctx->list, &sgx_tgid_ctx_list);
+
+	encl->tgid_ctx = ctx;
+
+	mutex_unlock(&sgx_tgid_ctx_mutex);
+	return 0;
+}
+
+void sgx_tgid_ctx_release(struct kref *ref)
+{
+	struct sgx_tgid_ctx *pe =
+		container_of(ref, struct sgx_tgid_ctx, refcount);
+
+	mutex_lock(&sgx_tgid_ctx_mutex);
+	list_del(&pe->list);
+	mutex_unlock(&sgx_tgid_ctx_mutex);
+	put_pid(pe->tgid);
+	kfree(pe);
+}
+
+static int sgx_measure(void *secs_page,
+		       void *epc_page,
+		       u16 mrmask)
+{
+	int ret = 0;
+	void *secs;
+	void *epc;
+	int i;
+	int j;
+
+	for (i = 0, j = 1; i < 0x1000 && !ret; i += 0x100, j <<= 1) {
+		if (!(j & mrmask))
+			continue;
+
+		secs = sgx_get_page(secs_page);
+		epc = sgx_get_page(epc_page);
+
+		ret = __eextend(secs, (void *)((unsigned long)epc + i));
+
+		sgx_put_page(epc);
+		sgx_put_page(secs);
+	}
+
+	return ret;
+}
+
+static int sgx_eadd(void *secs_page,
+		    void *epc_page,
+		    unsigned long linaddr,
+		    struct sgx_secinfo *secinfo,
+		    struct page *backing)
+{
+	struct sgx_pageinfo pginfo;
+	void *epc_page_vaddr;
+	int ret;
+
+	pginfo.srcpge = (unsigned long)kmap_atomic(backing);
+	pginfo.secs = (unsigned long)sgx_get_page(secs_page);
+	epc_page_vaddr = sgx_get_page(epc_page);
+
+	pginfo.linaddr = linaddr;
+	pginfo.secinfo = (unsigned long)secinfo;
+	ret = __eadd(&pginfo, epc_page_vaddr);
+
+	sgx_put_page(epc_page_vaddr);
+	sgx_put_page((void *)(unsigned long)pginfo.secs);
+	kunmap_atomic((void *)(unsigned long)pginfo.srcpge);
+
+	return ret;
+}
+
+static bool sgx_process_add_page_req(struct sgx_add_page_req *req,
+				     void *epc_page)
+{
+	struct sgx_encl_page *encl_page = req->encl_page;
+	struct sgx_encl *encl = req->encl;
+	struct vm_area_struct *vma;
+	struct page *backing;
+	unsigned long addr;
+	int ret;
+
+	if (encl->flags & (SGX_ENCL_SUSPEND | SGX_ENCL_DEAD))
+		return false;
+
+	addr = SGX_ENCL_PAGE_ADDR(encl_page);
+	ret = sgx_encl_find(encl->mm, addr, &vma);
+	if (ret)
+		return false;
+
+	backing = sgx_get_backing(encl, encl_page, false);
+	if (IS_ERR(backing))
+		return false;
+
+	/* Do not race with do_exit() */
+	if (!atomic_read(&encl->mm->mm_users)) {
+		sgx_put_backing(backing, 0);
+		return false;
+	}
+
+	ret = vm_insert_pfn(vma, addr, SGX_EPC_PFN(epc_page));
+	if (ret) {
+		sgx_put_backing(backing, 0);
+		return false;
+	}
+
+	ret = sgx_eadd(encl->secs.epc_page, epc_page, addr, &req->secinfo,
+		       backing);
+
+	sgx_put_backing(backing, 0);
+	if (ret) {
+		sgx_warn(encl, "EADD returned %d\n", ret);
+		zap_vma_ptes(vma, addr, PAGE_SIZE);
+		return false;
+	}
+
+	encl->secs_child_cnt++;
+
+	ret = sgx_measure(encl->secs.epc_page, epc_page, req->mrmask);
+	if (ret) {
+		sgx_warn(encl, "EEXTEND returned %d\n", ret);
+		zap_vma_ptes(vma, addr, PAGE_SIZE);
+		return false;
+	}
+
+	encl_page->epc_page = epc_page;
+	sgx_test_and_clear_young(encl_page, encl);
+	list_add_tail(&encl_page->list, &encl->load_list);
+
+	return true;
+}
+
+static void sgx_add_page_worker(struct work_struct *work)
+{
+	struct sgx_add_page_req *req;
+	bool skip_rest = false;
+	bool is_empty = false;
+	struct sgx_encl *encl;
+	void *epc_page;
+
+	encl = container_of(work, struct sgx_encl, add_page_work);
+
+	do {
+		schedule();
+
+		if (encl->flags & SGX_ENCL_DEAD)
+			skip_rest = true;
+
+		mutex_lock(&encl->lock);
+		req = list_first_entry(&encl->add_page_reqs,
+				       struct sgx_add_page_req, list);
+		list_del(&req->list);
+		is_empty = list_empty(&encl->add_page_reqs);
+		mutex_unlock(&encl->lock);
+
+		if (skip_rest)
+			goto next;
+
+		epc_page = sgx_alloc_page(0);
+		if (IS_ERR(epc_page)) {
+			skip_rest = true;
+			goto next;
+		}
+
+		down_read(&encl->mm->mmap_sem);
+		mutex_lock(&encl->lock);
+
+		if (!sgx_process_add_page_req(req, epc_page)) {
+			sgx_free_page(epc_page, encl);
+			skip_rest = true;
+		}
+
+		mutex_unlock(&encl->lock);
+		up_read(&encl->mm->mmap_sem);
+
+next:
+		kfree(req);
+	} while (!kref_put(&encl->refcount, sgx_encl_release) && !is_empty);
+}
+
+static u32 sgx_calc_ssaframesize(u32 miscselect, u64 xfrm)
+{
+	u32 size_max = PAGE_SIZE;
+	u32 size;
+	int i;
+
+	for (i = 2; i < 64; i++) {
+		if (!((1 << i) & xfrm))
+			continue;
+
+		size = SGX_SSA_GPRS_SIZE + sgx_xsave_size_tbl[i];
+		if (miscselect & SGX_MISC_EXINFO)
+			size += SGX_SSA_MISC_EXINFO_SIZE;
+
+		if (size > size_max)
+			size_max = size;
+	}
+
+	return (size_max + PAGE_SIZE - 1) >> PAGE_SHIFT;
+}
+
+static int sgx_validate_secs(const struct sgx_secs *secs,
+			     unsigned long ssaframesize)
+{
+	int i;
+
+	if (secs->size < (2 * PAGE_SIZE) ||
+	    (secs->size & (secs->size - 1)) != 0)
+		return -EINVAL;
+
+	if (secs->base & (secs->size - 1))
+		return -EINVAL;
+
+	if (secs->attributes & SGX_ATTR_RESERVED_MASK ||
+	    secs->miscselect & sgx_misc_reserved)
+		return -EINVAL;
+
+	if (secs->attributes & SGX_ATTR_MODE64BIT) {
+#ifdef CONFIG_X86_64
+		if (secs->size > sgx_encl_size_max_64)
+			return -EINVAL;
+#else
+		return -EINVAL;
+#endif
+	} else {
+		/* On 64-bit architecture allow 32-bit encls only in
+		 * the compatibility mode.
+		 */
+#ifdef CONFIG_X86_64
+		if (!test_thread_flag(TIF_ADDR32))
+			return -EINVAL;
+#endif
+		if (secs->size > sgx_encl_size_max_32)
+			return -EINVAL;
+	}
+
+	if ((secs->xfrm & 0x3) != 0x3 || (secs->xfrm & ~sgx_xfrm_mask))
+		return -EINVAL;
+
+	/* Check that BNDREGS and BNDCSR are equal. */
+	if (((secs->xfrm >> 3) & 1) != ((secs->xfrm >> 4) & 1))
+		return -EINVAL;
+
+	if (!secs->ssaframesize || ssaframesize > secs->ssaframesize)
+		return -EINVAL;
+
+	for (i = 0; i < SGX_SECS_RESERVED1_SIZE; i++)
+		if (secs->reserved1[i])
+			return -EINVAL;
+
+	for (i = 0; i < SGX_SECS_RESERVED2_SIZE; i++)
+		if (secs->reserved2[i])
+			return -EINVAL;
+
+	for (i = 0; i < SGX_SECS_RESERVED3_SIZE; i++)
+		if (secs->reserved3[i])
+			return -EINVAL;
+
+	for (i = 0; i < SGX_SECS_RESERVED4_SIZE; i++)
+		if (secs->reserved4[i])
+			return -EINVAL;
+
+	return 0;
+}
+
+static void sgx_mmu_notifier_release(struct mmu_notifier *mn,
+				     struct mm_struct *mm)
+{
+	struct sgx_encl *encl =
+		container_of(mn, struct sgx_encl, mmu_notifier);
+
+	mutex_lock(&encl->lock);
+	encl->flags |= SGX_ENCL_DEAD;
+	mutex_unlock(&encl->lock);
+}
+
+static const struct mmu_notifier_ops sgx_mmu_notifier_ops = {
+	.release	= sgx_mmu_notifier_release,
+};
+
+static int sgx_init_page(struct sgx_encl *encl, struct sgx_encl_page *entry,
+			 unsigned long addr)
+{
+	struct sgx_va_page *va_page;
+	void *epc_page = NULL;
+	void *ptr;
+	int ret = 0;
+
+	/* fast path */
+	mutex_lock(&encl->lock);
+	if (encl->page_cnt % SGX_VA_SLOT_COUNT)
+		goto out;
+	mutex_unlock(&encl->lock);
+
+	/* slow path */
+	epc_page = sgx_alloc_page(0);
+	if (IS_ERR(epc_page))
+		return PTR_ERR(epc_page);
+
+	mutex_lock(&encl->lock);
+	if (encl->page_cnt % SGX_VA_SLOT_COUNT) {
+		sgx_free_page(epc_page, encl);
+		goto out;
+	}
+
+	ptr = sgx_get_page(epc_page);
+	ret = __epa(ptr);
+	sgx_put_page(ptr);
+	if (ret) {
+		sgx_crit(encl, "EPA returned %d\n", ret);
+		sgx_free_page(epc_page, encl);
+		ret = -EFAULT;
+		goto out;
+	}
+
+	va_page = kzalloc(sizeof(*va_page), GFP_KERNEL);
+	if (!va_page) {
+		sgx_free_page(epc_page, encl);
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	atomic_inc(&sgx_va_pages_cnt);
+	va_page->epc_page = epc_page;
+	list_add(&va_page->list, &encl->va_pages);
+
+out:
+	if (!ret) {
+		entry->desc = addr;
+		encl->page_cnt++;
+	}
+	mutex_unlock(&encl->lock);
+	return ret;
+}
+
+/**
+ * sgx_encl_alloc - allocate memory for an enclave and set attributes
+ *
+ * @secs:	SECS data (must be page aligned)
+ *
+ * Allocates a new &struct sgx_encl instance. Validates SECS attributes, creates
+ * backing storage for the enclave and sets enclave attributes to sane initial
+ * values.
+ *
+ * Return:
+ * &struct sgx_encl instance on success,
+ * system error on failure
+ */
+struct sgx_encl *sgx_encl_alloc(struct sgx_secs *secs)
+{
+	unsigned long ssaframesize;
+	struct sgx_encl *encl;
+	struct file *backing;
+	struct file *pcmd;
+
+	ssaframesize = sgx_calc_ssaframesize(secs->miscselect, secs->xfrm);
+	if (sgx_validate_secs(secs, ssaframesize))
+		return ERR_PTR(-EINVAL);
+
+	backing = shmem_file_setup("[dev/sgx]", secs->size + PAGE_SIZE,
+				   VM_NORESERVE);
+	if (IS_ERR(backing))
+		return (void *)backing;
+
+	pcmd = shmem_file_setup("[dev/sgx]", (secs->size + PAGE_SIZE) >> 5,
+				VM_NORESERVE);
+	if (IS_ERR(pcmd)) {
+		fput(backing);
+		return (void *)pcmd;
+	}
+
+	encl = kzalloc(sizeof(*encl), GFP_KERNEL);
+	if (!encl) {
+		fput(backing);
+		fput(pcmd);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	encl->attributes = secs->attributes;
+	encl->xfrm = secs->xfrm;
+
+	kref_init(&encl->refcount);
+	INIT_LIST_HEAD(&encl->add_page_reqs);
+	INIT_LIST_HEAD(&encl->va_pages);
+	INIT_RADIX_TREE(&encl->page_tree, GFP_KERNEL);
+	INIT_LIST_HEAD(&encl->load_list);
+	INIT_LIST_HEAD(&encl->encl_list);
+	mutex_init(&encl->lock);
+	INIT_WORK(&encl->add_page_work, sgx_add_page_worker);
+
+	encl->mm = current->mm;
+	encl->base = secs->base;
+	encl->size = secs->size;
+	encl->ssaframesize = secs->ssaframesize;
+	encl->backing = backing;
+	encl->pcmd = pcmd;
+
+	return encl;
+}
+
+/**
+ * sgx_encl_create - create an enclave
+ *
+ * @encl:	an enclave
+ * @secs:	page aligned SECS data
+ *
+ * Validates SECS attributes, allocates an EPC page for the SECS and creates
+ * the enclave by performing ECREATE.
+ *
+ * Return:
+ * 0 on success,
+ * system error on failure
+ */
+int sgx_encl_create(struct sgx_encl *encl, struct sgx_secs *secs)
+{
+	struct vm_area_struct *vma;
+	struct sgx_pageinfo pginfo;
+	struct sgx_secinfo secinfo;
+	void *secs_epc;
+	void *secs_vaddr;
+	long ret;
+
+	secs_epc = sgx_alloc_page(0);
+	if (IS_ERR(secs_epc)) {
+		ret = PTR_ERR(secs_epc);
+		return ret;
+	}
+
+	encl->secs.epc_page = secs_epc;
+
+	ret = sgx_add_to_tgid_ctx(encl);
+	if (ret)
+		return ret;
+
+	ret = sgx_init_page(encl, &encl->secs, encl->base + encl->size);
+	if (ret)
+		return ret;
+
+	secs_vaddr = sgx_get_page(secs_epc);
+
+	pginfo.srcpge = (unsigned long)secs;
+	pginfo.linaddr = 0;
+	pginfo.secinfo = (unsigned long)&secinfo;
+	pginfo.secs = 0;
+	memset(&secinfo, 0, sizeof(secinfo));
+	ret = __ecreate((void *)&pginfo, secs_vaddr);
+
+	sgx_put_page(secs_vaddr);
+
+	if (ret) {
+		sgx_dbg(encl, "ECREATE returned %ld\n", ret);
+		ret = -EFAULT;
+		return ret;
+	}
+
+	if (secs->attributes & SGX_ATTR_DEBUG)
+		encl->flags |= SGX_ENCL_DEBUG;
+
+	encl->mmu_notifier.ops = &sgx_mmu_notifier_ops;
+	ret = mmu_notifier_register(&encl->mmu_notifier, encl->mm);
+	if (ret) {
+		if (ret == -EINTR)
+			ret = -ERESTARTSYS;
+		encl->mmu_notifier.ops = NULL;
+		return ret;
+	}
+
+	down_read(&current->mm->mmap_sem);
+	ret = sgx_encl_find(current->mm, secs->base, &vma);
+	if (ret != -ENOENT) {
+		if (!ret)
+			ret = -EINVAL;
+		up_read(&current->mm->mmap_sem);
+		return ret;
+	}
+
+	if (vma->vm_start != secs->base ||
+	    vma->vm_end != (secs->base + secs->size) ||
+	    vma->vm_pgoff != 0) {
+		ret = -EINVAL;
+		up_read(&current->mm->mmap_sem);
+		return ret;
+	}
+
+	vma->vm_private_data = encl;
+	up_read(&current->mm->mmap_sem);
+
+	mutex_lock(&sgx_tgid_ctx_mutex);
+	list_add_tail(&encl->encl_list, &encl->tgid_ctx->encl_list);
+	mutex_unlock(&sgx_tgid_ctx_mutex);
+
+	return 0;
+}
+
+static int sgx_validate_secinfo(struct sgx_secinfo *secinfo)
+{
+	u64 page_type = secinfo->flags & SGX_SECINFO_PAGE_TYPE_MASK;
+	u64 perm = secinfo->flags & SGX_SECINFO_PERMISSION_MASK;
+	int i;
+
+	if ((secinfo->flags & SGX_SECINFO_RESERVED_MASK) ||
+	    ((perm & SGX_SECINFO_W) && !(perm & SGX_SECINFO_R)) ||
+	    (page_type != SGX_SECINFO_TCS &&
+	     page_type != SGX_SECINFO_REG))
+		return -EINVAL;
+
+	for (i = 0; i < sizeof(secinfo->reserved) / sizeof(u64); i++)
+		if (secinfo->reserved[i])
+			return -EINVAL;
+
+	return 0;
+}
+
+static bool sgx_validate_offset(struct sgx_encl *encl, unsigned long offset)
+{
+	if (offset & (PAGE_SIZE - 1))
+		return false;
+
+	if (offset >= encl->size)
+		return false;
+
+	return true;
+}
+
+static int sgx_validate_tcs(struct sgx_encl *encl, struct sgx_tcs *tcs)
+{
+	int i;
+
+	if (tcs->flags & SGX_TCS_RESERVED_MASK) {
+		sgx_dbg(encl, "%s: invalid TCS flags = 0x%lx\n",
+			__func__, (unsigned long)tcs->flags);
+		return -EINVAL;
+	}
+
+	if (tcs->flags & SGX_TCS_DBGOPTIN) {
+		sgx_dbg(encl, "%s: DBGOPTIN TCS flag is set, EADD will clear it\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	if (!sgx_validate_offset(encl, tcs->ossa)) {
+		sgx_dbg(encl, "%s: invalid OSSA: 0x%lx\n", __func__,
+			(unsigned long)tcs->ossa);
+		return -EINVAL;
+	}
+
+	if (!sgx_validate_offset(encl, tcs->ofsbase)) {
+		sgx_dbg(encl, "%s: invalid OFSBASE: 0x%lx\n", __func__,
+			(unsigned long)tcs->ofsbase);
+		return -EINVAL;
+	}
+
+	if (!sgx_validate_offset(encl, tcs->ogsbase)) {
+		sgx_dbg(encl, "%s: invalid OGSBASE: 0x%lx\n", __func__,
+			(unsigned long)tcs->ogsbase);
+		return -EINVAL;
+	}
+
+	if ((tcs->fslimit & 0xFFF) != 0xFFF) {
+		sgx_dbg(encl, "%s: invalid FSLIMIT: 0x%x\n", __func__,
+			tcs->fslimit);
+		return -EINVAL;
+	}
+
+	if ((tcs->gslimit & 0xFFF) != 0xFFF) {
+		sgx_dbg(encl, "%s: invalid GSLIMIT: 0x%x\n", __func__,
+			tcs->gslimit);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < sizeof(tcs->reserved) / sizeof(u64); i++)
+		if (tcs->reserved[i])
+			return -EINVAL;
+
+	return 0;
+}
+
+static int __sgx_encl_add_page(struct sgx_encl *encl,
+			       struct sgx_encl_page *encl_page,
+			       unsigned long addr,
+			       void *data,
+			       struct sgx_secinfo *secinfo,
+			       unsigned int mrmask)
+{
+	u64 page_type = secinfo->flags & SGX_SECINFO_PAGE_TYPE_MASK;
+	struct sgx_add_page_req *req = NULL;
+	struct page *backing;
+	void *backing_ptr;
+	int ret;
+	int empty;
+
+	if (sgx_validate_secinfo(secinfo))
+		return -EINVAL;
+
+	if (page_type == SGX_SECINFO_TCS) {
+		ret = sgx_validate_tcs(encl, data);
+		if (ret)
+			return ret;
+	}
+
+	ret = sgx_init_page(encl, encl_page, addr);
+	if (ret)
+		return ret;
+
+	mutex_lock(&encl->lock);
+
+	if (encl->flags & (SGX_ENCL_INITIALIZED | SGX_ENCL_DEAD)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (radix_tree_lookup(&encl->page_tree, addr >> PAGE_SHIFT)) {
+		ret = -EEXIST;
+		goto out;
+	}
+
+	req = kzalloc(sizeof(*req), GFP_KERNEL);
+	if (!req) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	backing = sgx_get_backing(encl, encl_page, false);
+	if (IS_ERR((void *)backing)) {
+		ret = PTR_ERR((void *)backing);
+		goto out;
+	}
+
+	ret = radix_tree_insert(&encl->page_tree, PFN_DOWN(encl_page->desc),
+				encl_page);
+	if (ret) {
+		sgx_put_backing(backing, false /* write */);
+		goto out;
+	}
+
+	backing_ptr = kmap(backing);
+	memcpy(backing_ptr, data, PAGE_SIZE);
+	kunmap(backing);
+
+	if (page_type == SGX_SECINFO_TCS)
+		encl_page->desc |= SGX_ENCL_PAGE_TCS;
+
+	memcpy(&req->secinfo, secinfo, sizeof(*secinfo));
+
+	req->encl = encl;
+	req->encl_page = encl_page;
+	req->mrmask = mrmask;
+	empty = list_empty(&encl->add_page_reqs);
+	kref_get(&encl->refcount);
+	list_add_tail(&req->list, &encl->add_page_reqs);
+	if (empty)
+		queue_work(sgx_add_page_wq, &encl->add_page_work);
+
+	sgx_put_backing(backing, true /* write */);
+
+	mutex_unlock(&encl->lock);
+	return 0;
+out:
+	kfree(req);
+	mutex_unlock(&encl->lock);
+	return ret;
+}
+
+/**
+ * sgx_encl_add_page - add a page to the enclave
+ *
+ * @encl:	an enclave
+ * @addr:	page address in the ELRANGE
+ * @data:	page data
+ * @secinfo:	page permissions
+ * @mrmask:	bitmask to select the 256 byte chunks to be measured
+ *
+ * Creates a new enclave page and enqueues an EADD operation that will be
+ * processed by a worker thread later on.
+ *
+ * Return:
+ * 0 on success,
+ * system error on failure
+ */
+int sgx_encl_add_page(struct sgx_encl *encl, unsigned long addr, void *data,
+		      struct sgx_secinfo *secinfo, unsigned int mrmask)
+{
+	struct sgx_encl_page *page;
+	int ret;
+
+	page = kzalloc(sizeof(*page), GFP_KERNEL);
+	if (!page)
+		return -ENOMEM;
+
+	ret = __sgx_encl_add_page(encl, page, addr, data, secinfo, mrmask);
+
+	if (ret)
+		kfree(page);
+
+	return ret;
+}
+
+static int sgx_einit(struct sgx_encl *encl, struct sgx_sigstruct *sigstruct,
+		     struct sgx_einittoken *token)
+{
+	void *secs_epc = encl->secs.epc_page;
+	void *secs_va;
+	int ret;
+
+	secs_va = sgx_get_page(secs_epc);
+	ret = __einit(sigstruct, token, secs_va);
+	sgx_put_page(secs_va);
+
+	return ret;
+}
+
+/**
+ * sgx_encl_init - perform EINIT for the given enclave
+ *
+ * @encl:	an enclave
+ * @sigstruct:	SIGSTRUCT for the enclave
+ * @token:	EINITTOKEN for the enclave
+ *
+ * Retries a few times in order to perform EINIT operation on an enclave
+ * because there could be potentially an interrupt storm.
+ *
+ * Return:
+ * 0 on success,
+ * -FAULT on a CPU exception during EINIT,
+ * SGX error code
+ */
+int sgx_encl_init(struct sgx_encl *encl, struct sgx_sigstruct *sigstruct,
+		  struct sgx_einittoken *token)
+{
+	int ret;
+	int i;
+	int j;
+
+	flush_work(&encl->add_page_work);
+
+	mutex_lock(&encl->lock);
+
+	if (encl->flags & SGX_ENCL_INITIALIZED) {
+		mutex_unlock(&encl->lock);
+		return 0;
+	}
+
+	for (i = 0; i < SGX_EINIT_SLEEP_COUNT; i++) {
+		for (j = 0; j < SGX_EINIT_SPIN_COUNT; j++) {
+			ret = sgx_einit(encl, sigstruct, token);
+
+			if (ret == SGX_UNMASKED_EVENT)
+				continue;
+			else
+				break;
+		}
+
+		if (ret != SGX_UNMASKED_EVENT)
+			break;
+
+		msleep_interruptible(SGX_EINIT_SLEEP_TIME);
+		if (signal_pending(current)) {
+			mutex_unlock(&encl->lock);
+			return -ERESTARTSYS;
+		}
+	}
+
+	mutex_unlock(&encl->lock);
+
+	if (ret) {
+		if (ret > 0)
+			sgx_dbg(encl, "EINIT returned %d\n", ret);
+		return ret;
+	}
+
+	encl->flags |= SGX_ENCL_INITIALIZED;
+	return 0;
+}
+
+void sgx_encl_release(struct kref *ref)
+{
+	struct sgx_encl *encl = container_of(ref, struct sgx_encl, refcount);
+	struct sgx_encl_page *entry;
+	struct sgx_va_page *va_page;
+	struct radix_tree_iter iter;
+	void **slot;
+
+	mutex_lock(&sgx_tgid_ctx_mutex);
+	if (!list_empty(&encl->encl_list))
+		list_del(&encl->encl_list);
+	mutex_unlock(&sgx_tgid_ctx_mutex);
+
+	if (encl->mmu_notifier.ops)
+		mmu_notifier_unregister_no_release(&encl->mmu_notifier,
+						   encl->mm);
+
+	list_for_each_entry(entry, &encl->load_list, list)
+		sgx_free_page(entry->epc_page, encl);
+
+	radix_tree_for_each_slot(slot, &encl->page_tree, &iter, 0) {
+		entry = *slot;
+		radix_tree_delete(&encl->page_tree, PFN_DOWN(entry->desc));
+		kfree(entry);
+	}
+
+	while (!list_empty(&encl->va_pages)) {
+		va_page = list_first_entry(&encl->va_pages,
+					   struct sgx_va_page, list);
+		list_del(&va_page->list);
+		sgx_free_page(va_page->epc_page, encl);
+		kfree(va_page);
+		atomic_dec(&sgx_va_pages_cnt);
+	}
+
+	if (!(encl->flags & SGX_ENCL_SECS_EVICTED))
+		sgx_free_page(encl->secs.epc_page, encl);
+
+	if (encl->tgid_ctx)
+		kref_put(&encl->tgid_ctx->refcount, sgx_tgid_ctx_release);
+
+	if (encl->backing)
+		fput(encl->backing);
+
+	if (encl->pcmd)
+		fput(encl->pcmd);
+
+	kfree(encl);
+}
diff --git a/drivers/platform/x86/intel_sgx/sgx_ioctl.c b/drivers/platform/x86/intel_sgx/sgx_ioctl.c
new file mode 100644
index 000000000000..ee29ada6b2bc
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/sgx_ioctl.c
@@ -0,0 +1,281 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Suresh Siddha <suresh.b.siddha@intel.com>
+ * Serge Ayoun <serge.ayoun@intel.com>
+ * Shay Katz-zamir <shay.katz-zamir@intel.com>
+ * Sean Christopherson <sean.j.christopherson@intel.com>
+ */
+
+#include <asm/mman.h>
+#include <linux/delay.h>
+#include <linux/file.h>
+#include <linux/hashtable.h>
+#include <linux/highmem.h>
+#include <linux/ratelimit.h>
+#include <linux/sched/signal.h>
+#include <linux/shmem_fs.h>
+#include <linux/slab.h>
+#include "sgx.h"
+
+static int sgx_encl_get(unsigned long addr, struct sgx_encl **encl)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma;
+	int ret;
+
+	if (addr & (PAGE_SIZE - 1))
+		return -EINVAL;
+
+	down_read(&mm->mmap_sem);
+
+	ret = sgx_encl_find(mm, addr, &vma);
+	if (!ret) {
+		*encl = vma->vm_private_data;
+
+		if ((*encl)->flags & SGX_ENCL_SUSPEND)
+			ret = SGX_POWER_LOST_ENCLAVE;
+		else
+			kref_get(&(*encl)->refcount);
+	}
+
+	up_read(&mm->mmap_sem);
+	return ret;
+}
+
+/**
+ * sgx_ioc_enclave_create - handler for %SGX_IOC_ENCLAVE_CREATE
+ * @filep:	open file to /dev/sgx
+ * @cmd:	the command value
+ * @arg:	pointer to the &struct sgx_enclave_create
+ *
+ * Validates SECS attributes, allocates an EPC page for the SECS and performs
+ * ECREATE.
+ *
+ * Return:
+ * 0 on success,
+ * system error on failure
+ */
+static long sgx_ioc_enclave_create(struct file *filep, unsigned int cmd,
+				   unsigned long arg)
+{
+	struct sgx_enclave_create *createp = (struct sgx_enclave_create *)arg;
+	struct sgx_secs *secs;
+	struct sgx_encl *encl;
+	int ret;
+
+	secs = kzalloc(sizeof(*secs),  GFP_KERNEL);
+	if (!secs)
+		return -ENOMEM;
+
+	ret = copy_from_user(secs, (void __user *)createp->src, sizeof(*secs));
+	if (ret)
+		goto out;
+
+	encl = sgx_encl_alloc(secs);
+	if (IS_ERR(encl)) {
+		ret = PTR_ERR(encl);
+		goto out;
+	}
+
+	ret = sgx_encl_create(encl, secs);
+	if (ret)
+		kref_put(&encl->refcount, sgx_encl_release);
+
+out:
+	kfree(secs);
+	return ret;
+}
+
+/**
+ * sgx_ioc_enclave_add_page - handler for %SGX_IOC_ENCLAVE_ADD_PAGE
+ *
+ * @filep:	open file to /dev/sgx
+ * @cmd:	the command value
+ * @arg:	pointer to the &struct sgx_enclave_add_page
+ *
+ * Creates a new enclave page and enqueues an EADD operation that will be
+ * processed by a worker thread later on.
+ *
+ * Return:
+ * 0 on success,
+ * system error on failure
+ */
+static long sgx_ioc_enclave_add_page(struct file *filep, unsigned int cmd,
+				     unsigned long arg)
+{
+	struct sgx_enclave_add_page *addp = (void *)arg;
+	struct sgx_secinfo secinfo;
+	struct sgx_encl *encl;
+	struct page *data_page;
+	void *data;
+	int ret;
+
+	ret = sgx_encl_get(addp->addr, &encl);
+	if (ret)
+		return ret;
+
+	if (copy_from_user(&secinfo, (void __user *)addp->secinfo,
+			   sizeof(secinfo))) {
+		kref_put(&encl->refcount, sgx_encl_release);
+		return -EFAULT;
+	}
+
+	data_page = alloc_page(GFP_HIGHUSER);
+	if (!data_page) {
+		kref_put(&encl->refcount, sgx_encl_release);
+		return -ENOMEM;
+	}
+
+	data = kmap(data_page);
+
+	ret = copy_from_user((void *)data, (void __user *)addp->src, PAGE_SIZE);
+	if (ret)
+		goto out;
+
+	ret = sgx_encl_add_page(encl, addp->addr, data, &secinfo, addp->mrmask);
+	if (ret)
+		goto out;
+
+out:
+	kref_put(&encl->refcount, sgx_encl_release);
+	kunmap(data_page);
+	__free_page(data_page);
+	return ret;
+}
+
+/**
+ * sgx_ioc_enclave_init - handler for %SGX_IOC_ENCLAVE_INIT
+ *
+ * @filep:	open file to /dev/sgx
+ * @cmd:	the command value
+ * @arg:	pointer to the &struct sgx_enclave_init
+ *
+ * Flushes the remaining enqueued EADD operations and performs EINIT.
+ *
+ * Return:
+ * 0 on success,
+ * system error on failure
+ */
+static long sgx_ioc_enclave_init(struct file *filep, unsigned int cmd,
+				 unsigned long arg)
+{
+	struct sgx_enclave_init *initp = (struct sgx_enclave_init *)arg;
+	struct sgx_sigstruct *sigstruct;
+	struct sgx_einittoken *einittoken;
+	struct sgx_encl *encl;
+	struct page *initp_page;
+	int ret;
+
+	initp_page = alloc_page(GFP_HIGHUSER);
+	if (!initp_page)
+		return -ENOMEM;
+
+	sigstruct = kmap(initp_page);
+	einittoken = (struct sgx_einittoken *)
+		((unsigned long)sigstruct + PAGE_SIZE / 2);
+
+	ret = copy_from_user(sigstruct, (void __user *)initp->sigstruct,
+			     sizeof(*sigstruct));
+	if (ret)
+		goto out;
+
+	ret = sgx_encl_get(initp->addr, &encl);
+	if (ret)
+		goto out;
+
+	ret = sgx_encl_init(encl, sigstruct, einittoken);
+
+	kref_put(&encl->refcount, sgx_encl_release);
+
+out:
+	kunmap(initp_page);
+	__free_page(initp_page);
+	return ret;
+}
+
+typedef long (*sgx_ioc_t)(struct file *filep, unsigned int cmd,
+			  unsigned long arg);
+
+long sgx_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
+{
+	char data[256];
+	sgx_ioc_t handler = NULL;
+	long ret;
+
+	switch (cmd) {
+	case SGX_IOC_ENCLAVE_CREATE:
+		handler = sgx_ioc_enclave_create;
+		break;
+	case SGX_IOC_ENCLAVE_ADD_PAGE:
+		handler = sgx_ioc_enclave_add_page;
+		break;
+	case SGX_IOC_ENCLAVE_INIT:
+		handler = sgx_ioc_enclave_init;
+		break;
+	default:
+		return -ENOIOCTLCMD;
+	}
+
+	if (copy_from_user(data, (void __user *)arg, _IOC_SIZE(cmd)))
+		return -EFAULT;
+
+	ret = handler(filep, cmd, (unsigned long)((void *)data));
+	if (!ret && (cmd & IOC_OUT)) {
+		if (copy_to_user((void __user *)arg, data, _IOC_SIZE(cmd)))
+			return -EFAULT;
+	}
+
+	return ret;
+}
diff --git a/drivers/platform/x86/intel_sgx/sgx_main.c b/drivers/platform/x86/intel_sgx/sgx_main.c
new file mode 100644
index 000000000000..09b91808170b
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/sgx_main.c
@@ -0,0 +1,413 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Suresh Siddha <suresh.b.siddha@intel.com>
+ * Serge Ayoun <serge.ayoun@intel.com>
+ * Shay Katz-zamir <shay.katz-zamir@intel.com>
+ * Sean Christopherson <sean.j.christopherson@intel.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/cdev.h>
+#include <linux/file.h>
+#include <linux/hashtable.h>
+#include <linux/highmem.h>
+#include <linux/kthread.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/suspend.h>
+#include "sgx.h"
+
+#define DRV_DESCRIPTION "Intel SGX Driver"
+#define DRV_VERSION "0.10"
+
+MODULE_DESCRIPTION(DRV_DESCRIPTION);
+MODULE_AUTHOR("Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>");
+MODULE_VERSION(DRV_VERSION);
+
+/*
+ * Global data.
+ */
+
+struct workqueue_struct *sgx_add_page_wq;
+u64 sgx_encl_size_max_32;
+u64 sgx_encl_size_max_64;
+u64 sgx_xfrm_mask = 0x3;
+u32 sgx_misc_reserved;
+u32 sgx_xsave_size_tbl[64];
+
+#ifdef CONFIG_COMPAT
+long sgx_compat_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
+{
+	return sgx_ioctl(filep, cmd, arg);
+}
+#endif
+
+static int sgx_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	vma->vm_ops = &sgx_vm_ops;
+	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO |
+			 VM_DONTCOPY;
+
+	return 0;
+}
+
+static unsigned long sgx_get_unmapped_area(struct file *file,
+					   unsigned long addr,
+					   unsigned long len,
+					   unsigned long pgoff,
+					   unsigned long flags)
+{
+	if (len < 2 * PAGE_SIZE || (len & (len - 1)))
+		return -EINVAL;
+
+	/* On 64-bit architecture, allow mmap() to exceed 32-bit encl
+	 * limit only if the task is not running in 32-bit compatibility
+	 * mode.
+	 */
+	if (len > sgx_encl_size_max_32)
+#ifdef CONFIG_X86_64
+		if (test_thread_flag(TIF_ADDR32))
+			return -EINVAL;
+#else
+		return -EINVAL;
+#endif
+
+#ifdef CONFIG_X86_64
+	if (len > sgx_encl_size_max_64)
+		return -EINVAL;
+#endif
+
+	addr = current->mm->get_unmapped_area(file, addr, 2 * len, pgoff,
+					      flags);
+	if (IS_ERR_VALUE(addr))
+		return addr;
+
+	addr = (addr + (len - 1)) & ~(len - 1);
+
+	return addr;
+}
+
+static const struct file_operations sgx_fops = {
+	.owner			= THIS_MODULE,
+	.unlocked_ioctl		= sgx_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl		= sgx_compat_ioctl,
+#endif
+	.mmap			= sgx_mmap,
+	.get_unmapped_area	= sgx_get_unmapped_area,
+};
+
+static int sgx_pm_suspend(struct device *dev)
+{
+	struct sgx_tgid_ctx *ctx;
+	struct sgx_encl *encl;
+
+	list_for_each_entry(ctx, &sgx_tgid_ctx_list, list) {
+		list_for_each_entry(encl, &ctx->encl_list, encl_list) {
+			sgx_invalidate(encl, false);
+			encl->flags |= SGX_ENCL_SUSPEND;
+			flush_work(&encl->add_page_work);
+		}
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(sgx_drv_pm, sgx_pm_suspend, NULL);
+
+static struct bus_type sgx_bus_type = {
+	.name	= "sgx",
+};
+
+struct sgx_context {
+	struct device dev;
+	struct cdev cdev;
+};
+
+static dev_t sgx_devt;
+
+static void sgx_dev_release(struct device *dev)
+{
+	struct sgx_context *ctx = container_of(dev, struct sgx_context, dev);
+
+	kfree(ctx);
+}
+
+static struct sgx_context *sgx_ctx_alloc(struct device *parent)
+{
+	struct sgx_context *ctx;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	device_initialize(&ctx->dev);
+
+	ctx->dev.bus = &sgx_bus_type;
+	ctx->dev.parent = parent;
+	ctx->dev.devt = MKDEV(MAJOR(sgx_devt), 0);
+	ctx->dev.release = sgx_dev_release;
+
+	dev_set_name(&ctx->dev, "sgx");
+
+	cdev_init(&ctx->cdev, &sgx_fops);
+	ctx->cdev.owner = THIS_MODULE;
+
+	dev_set_drvdata(parent, ctx);
+
+	return ctx;
+}
+
+static struct sgx_context *sgxm_ctx_alloc(struct device *parent)
+{
+	struct sgx_context *ctx;
+	int rc;
+
+	ctx = sgx_ctx_alloc(parent);
+	if (IS_ERR(ctx))
+		return ctx;
+
+	rc = devm_add_action_or_reset(parent, (void (*)(void *))put_device,
+				      &ctx->dev);
+	if (rc) {
+		kfree(ctx);
+		return ERR_PTR(rc);
+	}
+
+	return ctx;
+}
+
+static int sgx_dev_init(struct device *parent)
+{
+	struct sgx_context *sgx_dev;
+	unsigned int eax;
+	unsigned int ebx;
+	unsigned int ecx;
+	unsigned int edx;
+	int ret;
+	int i;
+
+	pr_info("intel_sgx: " DRV_DESCRIPTION " v" DRV_VERSION "\n");
+
+	sgx_dev = sgxm_ctx_alloc(parent);
+
+	cpuid_count(SGX_CPUID, SGX_CPUID_CAPABILITIES, &eax, &ebx, &ecx, &edx);
+	/* Only allow misc bits supported by the driver. */
+	sgx_misc_reserved = ~ebx | SGX_MISC_RESERVED_MASK;
+#ifdef CONFIG_X86_64
+	sgx_encl_size_max_64 = 1ULL << ((edx >> 8) & 0xFF);
+#endif
+	sgx_encl_size_max_32 = 1ULL << (edx & 0xFF);
+
+	if (boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+		cpuid_count(SGX_CPUID, SGX_CPUID_ATTRIBUTES, &eax, &ebx, &ecx,
+			    &edx);
+		sgx_xfrm_mask = (((u64)edx) << 32) + (u64)ecx;
+
+		for (i = 2; i < 64; i++) {
+			cpuid_count(0x0D, i, &eax, &ebx, &ecx, &edx);
+			if ((1 << i) & sgx_xfrm_mask)
+				sgx_xsave_size_tbl[i] = eax + ebx;
+		}
+	}
+
+	ret = sgx_page_cache_init(parent);
+	if (ret)
+		return ret;
+
+	sgx_add_page_wq = alloc_workqueue("intel_sgx-add-page-wq",
+					  WQ_UNBOUND | WQ_FREEZABLE, 1);
+	if (!sgx_add_page_wq) {
+		pr_err("intel_sgx: alloc_workqueue() failed\n");
+		ret = -ENOMEM;
+		goto out_page_cache;
+	}
+
+	ret = cdev_device_add(&sgx_dev->cdev, &sgx_dev->dev);
+	if (ret)
+		goto out_workqueue;
+
+	return 0;
+out_workqueue:
+	destroy_workqueue(sgx_add_page_wq);
+out_page_cache:
+	sgx_page_cache_teardown();
+	return ret;
+}
+
+static int sgx_drv_probe(struct platform_device *pdev)
+{
+	unsigned int eax;
+	unsigned int ebx;
+	unsigned int ecx;
+	unsigned int edx;
+	unsigned long fc;
+
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
+		return -ENODEV;
+
+	if (!boot_cpu_has(X86_FEATURE_SGX)) {
+		pr_err("intel_sgx: the CPU is missing SGX\n");
+		return -ENODEV;
+	}
+
+	if (!boot_cpu_has(X86_FEATURE_SGX_LC)) {
+		pr_err("intel_sgx: the CPU is missing launch control\n");
+		return -ENODEV;
+	}
+
+	rdmsrl(MSR_IA32_FEATURE_CONTROL, fc);
+
+	if (!(fc & FEATURE_CONTROL_LOCKED)) {
+		pr_err("intel_sgx: the feature control MSR is not locked\n");
+		return -ENODEV;
+	}
+
+	if (!(fc & FEATURE_CONTROL_SGX_ENABLE)) {
+		pr_err("intel_sgx: SGX is not enabled\n");
+		return -ENODEV;
+	}
+
+	cpuid(0, &eax, &ebx, &ecx, &edx);
+	if (eax < SGX_CPUID) {
+		pr_err("intel_sgx: CPUID is missing the SGX leaf\n");
+		return -ENODEV;
+	}
+
+	cpuid_count(SGX_CPUID, SGX_CPUID_CAPABILITIES, &eax, &ebx, &ecx, &edx);
+	if (!(eax & 1)) {
+		pr_err("intel_sgx: CPU does not support the SGX1 instructions\n");
+		return -ENODEV;
+	}
+
+	return sgx_dev_init(&pdev->dev);
+}
+
+static int sgx_drv_remove(struct platform_device *pdev)
+{
+	struct sgx_context *ctx = dev_get_drvdata(&pdev->dev);
+
+	cdev_device_del(&ctx->cdev, &ctx->dev);
+	destroy_workqueue(sgx_add_page_wq);
+	sgx_page_cache_teardown();
+
+	return 0;
+}
+
+#ifdef CONFIG_ACPI
+static struct acpi_device_id sgx_device_ids[] = {
+	{"INT0E0C", 0},
+	{"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, sgx_device_ids);
+#endif
+
+static struct platform_driver sgx_drv = {
+	.probe = sgx_drv_probe,
+	.remove = sgx_drv_remove,
+	.driver = {
+		.name			= "intel_sgx",
+		.pm			= &sgx_drv_pm,
+		.acpi_match_table	= ACPI_PTR(sgx_device_ids),
+	},
+};
+
+static int __init sgx_drv_subsys_init(void)
+{
+	int ret;
+
+	ret = bus_register(&sgx_bus_type);
+	if (ret)
+		return ret;
+
+	ret = alloc_chrdev_region(&sgx_devt, 0, 1, "sgx");
+	if (ret < 0) {
+		bus_unregister(&sgx_bus_type);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void sgx_drv_subsys_exit(void)
+{
+	bus_unregister(&sgx_bus_type);
+	unregister_chrdev_region(sgx_devt, 1);
+}
+
+static int __init sgx_drv_init(void)
+{
+	int ret;
+
+	ret = sgx_drv_subsys_init();
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&sgx_drv);
+	if (ret)
+		sgx_drv_subsys_exit();
+
+	return ret;
+}
+module_init(sgx_drv_init);
+
+static void __exit sgx_drv_exit(void)
+{
+	platform_driver_unregister(&sgx_drv);
+	sgx_drv_subsys_exit();
+}
+module_exit(sgx_drv_exit);
+
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/platform/x86/intel_sgx/sgx_page_cache.c b/drivers/platform/x86/intel_sgx/sgx_page_cache.c
new file mode 100644
index 000000000000..7ac213309a5f
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/sgx_page_cache.c
@@ -0,0 +1,642 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Suresh Siddha <suresh.b.siddha@intel.com>
+ * Serge Ayoun <serge.ayoun@intel.com>
+ * Shay Katz-zamir <shay.katz-zamir@intel.com>
+ * Sean Christopherson <sean.j.christopherson@intel.com>
+ */
+
+#include <linux/device.h>
+#include <linux/freezer.h>
+#include <linux/highmem.h>
+#include <linux/kthread.h>
+#include <linux/ratelimit.h>
+#include <linux/sched/signal.h>
+#include <linux/slab.h>
+#include "sgx.h"
+
+#define SGX_NR_LOW_PAGES 32
+#define SGX_NR_HIGH_PAGES 64
+#define SGX_NR_TO_SCAN	16
+
+LIST_HEAD(sgx_tgid_ctx_list);
+DEFINE_MUTEX(sgx_tgid_ctx_mutex);
+atomic_t sgx_va_pages_cnt = ATOMIC_INIT(0);
+
+struct sgx_epc_bank {
+	unsigned long pa;
+	unsigned long va;
+	unsigned long size;
+	void **pages;
+	atomic_t free_cnt;
+	struct rw_semaphore lock;
+};
+
+static struct sgx_epc_bank sgx_epc_banks[SGX_MAX_EPC_BANKS];
+static int sgx_nr_epc_banks;
+static unsigned int sgx_nr_total_pages;
+static atomic_t sgx_nr_free_pages = ATOMIC_INIT(0);
+static struct task_struct *ksgxswapd_tsk;
+static DECLARE_WAIT_QUEUE_HEAD(ksgxswapd_waitq);
+
+static int sgx_test_and_clear_young_cb(pte_t *ptep, pgtable_t token,
+				       unsigned long addr, void *data)
+{
+	pte_t pte;
+	int ret;
+
+	ret = pte_young(*ptep);
+	if (ret) {
+		pte = pte_mkold(*ptep);
+		set_pte_at((struct mm_struct *)data, addr, ptep, pte);
+	}
+
+	return ret;
+}
+
+/**
+ * sgx_test_and_clear_young() - Test and reset the accessed bit
+ * @page:	enclave EPC page to be tested for recent access
+ * @encl:	enclave which owns @page
+ *
+ * Checks the Access (A) bit from the PTE corresponding to the
+ * enclave page and clears it.  Returns 1 if the page has been
+ * recently accessed and 0 if not.
+ */
+int sgx_test_and_clear_young(struct sgx_encl_page *page, struct sgx_encl *encl)
+{
+	unsigned long addr = SGX_ENCL_PAGE_ADDR(page);
+	struct vm_area_struct *vma;
+	int ret;
+
+	ret = sgx_encl_find(encl->mm, addr, &vma);
+	if (ret)
+		return 0;
+
+	if (encl != vma->vm_private_data)
+		return 0;
+
+	return apply_to_page_range(vma->vm_mm, addr, PAGE_SIZE,
+				   sgx_test_and_clear_young_cb, vma->vm_mm);
+}
+
+static struct sgx_tgid_ctx *sgx_isolate_tgid_ctx(unsigned long nr_to_scan)
+{
+	struct sgx_tgid_ctx *ctx = NULL;
+	int i;
+
+	mutex_lock(&sgx_tgid_ctx_mutex);
+
+	if (list_empty(&sgx_tgid_ctx_list)) {
+		mutex_unlock(&sgx_tgid_ctx_mutex);
+		return NULL;
+	}
+
+	for (i = 0; i < nr_to_scan; i++) {
+		/* Peek TGID context from the head. */
+		ctx = list_first_entry(&sgx_tgid_ctx_list,
+				       struct sgx_tgid_ctx,
+				       list);
+
+		/* Move to the tail so that we do not encounter it in the
+		 * next iteration.
+		 */
+		list_move_tail(&ctx->list, &sgx_tgid_ctx_list);
+
+		/* Non-empty TGID context? */
+		if (!list_empty(&ctx->encl_list) &&
+		    kref_get_unless_zero(&ctx->refcount))
+			break;
+
+		ctx = NULL;
+	}
+
+	mutex_unlock(&sgx_tgid_ctx_mutex);
+
+	return ctx;
+}
+
+static struct sgx_encl *sgx_isolate_encl(struct sgx_tgid_ctx *ctx,
+					       unsigned long nr_to_scan)
+{
+	struct sgx_encl *encl = NULL;
+	int i;
+
+	mutex_lock(&sgx_tgid_ctx_mutex);
+
+	if (list_empty(&ctx->encl_list)) {
+		mutex_unlock(&sgx_tgid_ctx_mutex);
+		return NULL;
+	}
+
+	for (i = 0; i < nr_to_scan; i++) {
+		/* Peek encl from the head. */
+		encl = list_first_entry(&ctx->encl_list, struct sgx_encl,
+					encl_list);
+
+		/* Move to the tail so that we do not encounter it in the
+		 * next iteration.
+		 */
+		list_move_tail(&encl->encl_list, &ctx->encl_list);
+
+		/* Enclave with faulted pages?  */
+		if (!list_empty(&encl->load_list) &&
+		    kref_get_unless_zero(&encl->refcount))
+			break;
+
+		encl = NULL;
+	}
+
+	mutex_unlock(&sgx_tgid_ctx_mutex);
+
+	return encl;
+}
+
+static void sgx_isolate_pages(struct sgx_encl *encl,
+			      struct sgx_encl_page **cluster, int nr_to_scan)
+{
+	struct sgx_encl_page *entry;
+	int i;
+
+	mutex_lock(&encl->lock);
+
+	if (encl->flags & SGX_ENCL_DEAD)
+		goto out;
+
+	for (i = 0; i < nr_to_scan; i++) {
+		if (list_empty(&encl->load_list))
+			break;
+
+		entry = list_first_entry(&encl->load_list, struct sgx_encl_page,
+					 list);
+
+		if (!sgx_test_and_clear_young(entry, encl) &&
+		    !(entry->desc & SGX_ENCL_PAGE_RESERVED)) {
+			entry->desc |= SGX_ENCL_PAGE_RESERVED;
+			list_del(&entry->list);
+			entry->desc &= ~SGX_ENCL_PAGE_LOADED;
+			*cluster++ = entry;
+		} else {
+			list_move_tail(&entry->list, &encl->load_list);
+		}
+	}
+out:
+	*cluster = NULL;
+	mutex_unlock(&encl->lock);
+}
+
+static int __sgx_ewb(struct sgx_encl *encl,
+		     struct sgx_encl_page *encl_page,
+		     struct sgx_va_page *va_page,
+		     unsigned int va_offset)
+{
+	unsigned long pcmd_offset = SGX_ENCL_PAGE_PCMD_OFFSET(encl_page);
+	struct sgx_pageinfo pginfo;
+	struct page *backing;
+	struct page *pcmd;
+	void *epc;
+	void *va;
+	int ret;
+
+	backing = sgx_get_backing(encl, encl_page, false);
+	if (IS_ERR(backing)) {
+		ret = PTR_ERR(backing);
+		sgx_warn(encl, "pinning the backing page for EWB failed with %d\n",
+			 ret);
+		return ret;
+	}
+
+	pcmd = sgx_get_backing(encl, encl_page, true);
+	if (IS_ERR(pcmd)) {
+		ret = PTR_ERR(pcmd);
+		sgx_warn(encl, "pinning the pcmd page for EWB failed with %d\n",
+			 ret);
+		goto out;
+	}
+
+	epc = sgx_get_page(encl_page->epc_page);
+	va = sgx_get_page(va_page->epc_page);
+
+	pginfo.srcpge = (unsigned long)kmap_atomic(backing);
+	pginfo.pcmd = (unsigned long)kmap_atomic(pcmd) + pcmd_offset;
+	pginfo.linaddr = 0;
+	pginfo.secs = 0;
+	ret = __ewb(&pginfo, epc, (void *)((unsigned long)va + va_offset));
+	kunmap_atomic((void *)(unsigned long)(pginfo.pcmd - pcmd_offset));
+	kunmap_atomic((void *)(unsigned long)pginfo.srcpge);
+
+	sgx_put_page(va);
+	sgx_put_page(epc);
+	sgx_put_backing(pcmd, true);
+
+out:
+	sgx_put_backing(backing, true);
+	return ret;
+}
+
+static void sgx_eblock(struct sgx_encl *encl, struct sgx_encl_page **cluster)
+{
+	struct vm_area_struct *vma;
+	unsigned long addr;
+	void *ptr;
+	int ret;
+
+	for ( ; *cluster; cluster++) {
+		addr = SGX_ENCL_PAGE_ADDR(*cluster);
+
+		ret = sgx_encl_find(encl->mm, addr, &vma);
+		if (!ret && encl == vma->vm_private_data)
+			zap_vma_ptes(vma, addr, PAGE_SIZE);
+
+		ptr = sgx_get_page((*cluster)->epc_page);
+		ret = __eblock(ptr);
+		sgx_put_page(ptr);
+		if (ret) {
+			sgx_crit(encl, "EBLOCK returned %d\n", ret);
+			sgx_invalidate(encl, true);
+		}
+	}
+}
+
+static void sgx_etrack(struct sgx_encl *encl)
+{
+	void *ptr;
+	int ret;
+
+	ptr = sgx_get_page(encl->secs.epc_page);
+	ret = __etrack(ptr);
+	sgx_put_page(ptr);
+	if (ret) {
+		sgx_crit(encl, "ETRACK returned %d\n", ret);
+		sgx_invalidate(encl, true);
+	}
+}
+
+static void sgx_ewb(struct sgx_encl *encl, struct sgx_encl_page *entry)
+{
+	struct sgx_va_page *va_page;
+	unsigned int va_offset;
+	int ret;
+
+	va_page = list_first_entry(&encl->va_pages, struct sgx_va_page, list);
+	va_offset = sgx_alloc_va_slot(va_page);
+	if (sgx_va_page_full(va_page))
+		list_move_tail(&va_page->list, &encl->va_pages);
+
+	ret = __sgx_ewb(encl, entry, va_page, va_offset);
+	if (ret == SGX_NOT_TRACKED) {
+		/* slow path, IPI needed */
+		sgx_flush_cpus(encl);
+		ret = __sgx_ewb(encl, entry, va_page, va_offset);
+	}
+
+	if (ret) {
+		sgx_invalidate(encl, true);
+		if (ret > 0)
+			sgx_err(encl, "EWB returned %d, enclave invalidated\n",
+				ret);
+	}
+
+	sgx_free_page(entry->epc_page, encl);
+	entry->desc |= va_offset;
+	entry->va_page = va_page;
+	entry->desc &= ~SGX_ENCL_PAGE_RESERVED;
+}
+
+static void sgx_write_pages(struct sgx_encl *encl,
+			    struct sgx_encl_page **cluster)
+{
+	if (!*cluster)
+		return;
+
+	mutex_lock(&encl->lock);
+
+	sgx_eblock(encl, cluster);
+	sgx_etrack(encl);
+
+	for ( ; *cluster; cluster++) {
+		sgx_ewb(encl, *cluster);
+		encl->secs_child_cnt--;
+	}
+
+	if (!encl->secs_child_cnt && (encl->flags & SGX_ENCL_INITIALIZED)) {
+		sgx_ewb(encl, &encl->secs);
+		encl->flags |= SGX_ENCL_SECS_EVICTED;
+	}
+
+	mutex_unlock(&encl->lock);
+}
+
+static void sgx_swap_pages(void)
+{
+	struct sgx_tgid_ctx *ctx;
+	struct sgx_encl *encl;
+	struct sgx_encl_page *cluster[SGX_NR_TO_SCAN + 1];
+	int nr_to_scan = ARRAY_SIZE(cluster) - 1;
+
+	ctx = sgx_isolate_tgid_ctx(nr_to_scan);
+	if (!ctx)
+		return;
+
+	encl = sgx_isolate_encl(ctx, nr_to_scan);
+	if (!encl)
+		goto out;
+
+	down_read(&encl->mm->mmap_sem);
+	sgx_isolate_pages(encl, cluster, nr_to_scan);
+	sgx_write_pages(encl, cluster);
+	up_read(&encl->mm->mmap_sem);
+
+	kref_put(&encl->refcount, sgx_encl_release);
+out:
+	kref_put(&ctx->refcount, sgx_tgid_ctx_release);
+}
+
+static int ksgxswapd(void *p)
+{
+	set_freezable();
+
+	while (!kthread_should_stop()) {
+		if (try_to_freeze())
+			continue;
+
+		wait_event_freezable(ksgxswapd_waitq, kthread_should_stop() ||
+				     atomic_read(&sgx_nr_free_pages) <
+				     SGX_NR_HIGH_PAGES);
+
+		if (atomic_read(&sgx_nr_free_pages) < SGX_NR_HIGH_PAGES)
+			sgx_swap_pages();
+	}
+
+	pr_info("%s: done\n", __func__);
+	return 0;
+}
+
+static int sgx_init_epc_bank(unsigned long addr, unsigned long size,
+			     unsigned long index, struct sgx_epc_bank *bank)
+{
+	unsigned long nr_pages = size >> PAGE_SHIFT;
+	unsigned long i;
+	void *va;
+
+	if (IS_ENABLED(CONFIG_X86_64)) {
+		va = ioremap_cache(addr, size);
+		if (!va)
+			return -ENOMEM;
+	}
+
+	bank->pages = kzalloc(nr_pages * sizeof(void *), GFP_KERNEL);
+	if (!bank->pages) {
+		if (IS_ENABLED(CONFIG_X86_64))
+			iounmap(va);
+
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < nr_pages; i++)
+		bank->pages[i] = (void *)((addr + (i << PAGE_SHIFT)) | index);
+
+	bank->pa = addr;
+	bank->size = size;
+
+	if (IS_ENABLED(CONFIG_X86_64))
+		bank->va = (unsigned long)va;
+
+	atomic_set(&bank->free_cnt, nr_pages);
+
+	init_rwsem(&bank->lock);
+
+	sgx_nr_total_pages += nr_pages;
+	atomic_add(nr_pages, &sgx_nr_free_pages);
+	return 0;
+}
+
+int sgx_page_cache_init(struct device *parent)
+{
+	struct task_struct *tsk;
+	unsigned long size;
+	unsigned int eax;
+	unsigned int ebx;
+	unsigned int ecx;
+	unsigned int edx;
+	unsigned long pa;
+	int i;
+	int ret;
+
+	for (i = 0; i < SGX_MAX_EPC_BANKS; i++) {
+		cpuid_count(SGX_CPUID, i + SGX_CPUID_EPC_BANKS, &eax, &ebx,
+			    &ecx, &edx);
+		if (!(eax & 0xf))
+			break;
+
+		pa = ((u64)(ebx & 0xfffff) << 32) + (u64)(eax & 0xfffff000);
+		size = ((u64)(edx & 0xfffff) << 32) + (u64)(ecx & 0xfffff000);
+
+		dev_info(parent, "EPC bank 0x%lx-0x%lx\n", pa, pa + size);
+
+		ret = sgx_init_epc_bank(pa, size, i, &sgx_epc_banks[i]);
+		if (ret)
+			return ret;
+
+		sgx_nr_epc_banks++;
+	}
+
+	tsk = kthread_run(ksgxswapd, NULL, "ksgxswapd");
+	if (IS_ERR(tsk)) {
+		sgx_page_cache_teardown();
+		return PTR_ERR(tsk);
+	}
+
+	return 0;
+}
+
+void sgx_page_cache_teardown(void)
+{
+	struct sgx_epc_bank *bank;
+	int i;
+
+	if (ksgxswapd_tsk) {
+		kthread_stop(ksgxswapd_tsk);
+		ksgxswapd_tsk = NULL;
+	}
+
+	for (i = 0; i < sgx_nr_epc_banks; i++) {
+		bank = &sgx_epc_banks[i];
+
+		if (IS_ENABLED(CONFIG_X86_64))
+			iounmap((void *)bank->va);
+
+		kfree(bank->pages);
+	}
+}
+
+static void *sgx_try_alloc_page(void)
+{
+	struct sgx_epc_bank *bank;
+	void *page = NULL;
+	int i;
+
+	for (i = 0; i < sgx_nr_epc_banks; i++) {
+		bank = &sgx_epc_banks[i];
+
+		down_write(&bank->lock);
+
+		if (atomic_read(&bank->free_cnt))
+			page = bank->pages[atomic_dec_return(&bank->free_cnt)];
+
+		up_write(&bank->lock);
+
+		if (page)
+			break;
+	}
+
+	if (page)
+		atomic_dec(&sgx_nr_free_pages);
+
+	return page;
+}
+
+/**
+ * sgx_alloc_page - allocate an EPC page
+ * @flags:	allocation flags
+ *
+ * Try to grab a page from the free EPC page list. If there is a free page
+ * available, it is returned to the caller. If called with SGX_ALLOC_ATOMIC,
+ * the function will return immediately if the list is empty. Otherwise, it
+ * will swap pages up until there is a free page available. Before returning
+ * the low watermark is checked and ksgxswapd is waken up if we are below it.
+ *
+ * Return: an EPC page or a system error code
+ */
+void *sgx_alloc_page(unsigned int flags)
+{
+	void *entry;
+
+	for ( ; ; ) {
+		entry = sgx_try_alloc_page();
+		if (entry)
+			break;
+
+		/* We need at minimum two pages for the #PF handler. */
+		if (atomic_read(&sgx_va_pages_cnt) > (sgx_nr_total_pages - 2))
+			return ERR_PTR(-ENOMEM);
+
+		if (flags & SGX_ALLOC_ATOMIC) {
+			entry = ERR_PTR(-EBUSY);
+			break;
+		}
+
+		if (signal_pending(current)) {
+			entry = ERR_PTR(-ERESTARTSYS);
+			break;
+		}
+
+		sgx_swap_pages();
+		schedule();
+	}
+
+	if (atomic_read(&sgx_nr_free_pages) < SGX_NR_LOW_PAGES)
+		wake_up(&ksgxswapd_waitq);
+
+	return entry;
+}
+
+/**
+ * sgx_free_page - free an EPC page
+ *
+ * EREMOVE an EPC page and insert it back to the list of free pages.
+ * If EREMOVE fails, the error is printed out loud as a critical error.
+ * It is an indicator of a driver bug if that would happen.
+ *
+ * @page:	any EPC page
+ * @encl:	enclave that owns the given EPC page
+ */
+void sgx_free_page(void *page, struct sgx_encl *encl)
+{
+	struct sgx_epc_bank *bank = SGX_EPC_BANK(page);
+	void *va;
+	int ret;
+
+	va = sgx_get_page(page);
+	ret = __eremove(va);
+	sgx_put_page(va);
+
+	if (ret)
+		sgx_crit(encl, "EREMOVE returned %d\n", ret);
+
+	down_read(&bank->lock);
+	bank->pages[atomic_inc_return(&bank->free_cnt) - 1] = page;
+	up_read(&bank->lock);
+
+	atomic_inc(&sgx_nr_free_pages);
+}
+
+void *sgx_get_page(void *page)
+{
+	struct sgx_epc_bank *bank = SGX_EPC_BANK(page);
+
+	if (IS_ENABLED(CONFIG_X86_64))
+		return (void *)(bank->va + SGX_EPC_ADDR(page) - bank->pa);
+
+	return kmap_atomic_pfn(SGX_EPC_PFN(page));
+}
+
+void sgx_put_page(void *ptr)
+{
+	if (IS_ENABLED(CONFIG_X86_64))
+		return;
+
+	kunmap_atomic(ptr);
+}
diff --git a/drivers/platform/x86/intel_sgx/sgx_util.c b/drivers/platform/x86/intel_sgx/sgx_util.c
new file mode 100644
index 000000000000..2f09f399d2d6
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/sgx_util.c
@@ -0,0 +1,347 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Suresh Siddha <suresh.b.siddha@intel.com>
+ * Serge Ayoun <serge.ayoun@intel.com>
+ * Shay Katz-zamir <shay.katz-zamir@intel.com>
+ * Sean Christopherson <sean.j.christopherson@intel.com>
+ */
+
+#include <linux/highmem.h>
+#include <linux/sched/mm.h>
+#include <linux/shmem_fs.h>
+#include "sgx.h"
+
+struct page *sgx_get_backing(struct sgx_encl *encl,
+			     struct sgx_encl_page *entry,
+			     bool pcmd)
+{
+	struct address_space *mapping;
+	struct inode *inode;
+	gfp_t gfpmask;
+	pgoff_t index;
+
+	if (pcmd)
+		inode = encl->pcmd->f_path.dentry->d_inode;
+	else
+		inode = encl->backing->f_path.dentry->d_inode;
+
+	mapping = inode->i_mapping;
+	gfpmask = mapping_gfp_mask(mapping);
+
+	if (pcmd)
+		index = PFN_DOWN(entry->desc - encl->base) >> 5;
+	else
+		index = PFN_DOWN(entry->desc - encl->base);
+
+	return shmem_read_mapping_page_gfp(mapping, index, gfpmask);
+}
+
+void sgx_put_backing(struct page *backing_page, bool write)
+{
+	if (write)
+		set_page_dirty(backing_page);
+
+	put_page(backing_page);
+}
+
+void sgx_zap_tcs_ptes(struct sgx_encl *encl, struct vm_area_struct *vma)
+{
+	struct sgx_encl_page *entry;
+	unsigned long addr;
+
+	list_for_each_entry(entry, &encl->load_list, list) {
+		addr = SGX_ENCL_PAGE_ADDR(entry);
+		if ((entry->desc & SGX_ENCL_PAGE_TCS) &&
+		    addr >= vma->vm_start && addr < vma->vm_end)
+			zap_vma_ptes(vma, addr, PAGE_SIZE);
+	}
+}
+
+void sgx_invalidate(struct sgx_encl *encl, bool flush_cpus)
+{
+	struct vm_area_struct *vma;
+	unsigned long addr;
+	int ret;
+
+	for (addr = encl->base; addr < (encl->base + encl->size);
+	     addr = vma->vm_end) {
+		ret = sgx_encl_find(encl->mm, addr, &vma);
+		if (!ret && encl == vma->vm_private_data)
+			sgx_zap_tcs_ptes(encl, vma);
+		else
+			break;
+	}
+
+	encl->flags |= SGX_ENCL_DEAD;
+
+	if (flush_cpus)
+		sgx_flush_cpus(encl);
+}
+
+static void sgx_ipi_cb(void *info)
+{
+}
+
+void sgx_flush_cpus(struct sgx_encl *encl)
+{
+	on_each_cpu_mask(mm_cpumask(encl->mm), sgx_ipi_cb, NULL, 1);
+}
+
+static int sgx_eldu(struct sgx_encl *encl,
+		    struct sgx_encl_page *encl_page,
+		    void *epc_page,
+		    bool is_secs)
+{
+	struct sgx_pageinfo pginfo;
+	unsigned long pcmd_offset;
+	unsigned long va_offset;
+	void *secs_ptr = NULL;
+	struct page *backing;
+	struct page *pcmd;
+	void *epc_ptr;
+	void *va_ptr;
+	int ret;
+
+	pcmd_offset = SGX_ENCL_PAGE_PCMD_OFFSET(encl_page);
+	va_offset = SGX_ENCL_PAGE_VA_OFFSET(encl_page);
+
+	backing = sgx_get_backing(encl, encl_page, false);
+	if (IS_ERR(backing)) {
+		ret = PTR_ERR(backing);
+		sgx_warn(encl, "pinning the backing page for ELDU failed with %d\n",
+			 ret);
+		return ret;
+	}
+
+	pcmd = sgx_get_backing(encl, encl_page, true);
+	if (IS_ERR(pcmd)) {
+		ret = PTR_ERR(pcmd);
+		sgx_warn(encl, "pinning the pcmd page for EWB failed with %d\n",
+			 ret);
+		goto out;
+	}
+
+	if (!is_secs)
+		secs_ptr = sgx_get_page(encl->secs.epc_page);
+
+	epc_ptr = sgx_get_page(epc_page);
+	va_ptr = sgx_get_page(encl_page->va_page->epc_page);
+	pginfo.srcpge = (unsigned long)kmap_atomic(backing);
+	pginfo.pcmd = (unsigned long)kmap_atomic(pcmd) + pcmd_offset;
+	pginfo.linaddr = is_secs ? 0 : SGX_ENCL_PAGE_ADDR(encl_page);
+	pginfo.secs = (unsigned long)secs_ptr;
+
+	ret = __eldu((unsigned long)&pginfo, (unsigned long)epc_ptr,
+		     (unsigned long)va_ptr + va_offset);
+	if (ret) {
+		sgx_err(encl, "ELDU returned %d\n", ret);
+		ret = -EFAULT;
+	}
+
+	kunmap_atomic((void *)(unsigned long)(pginfo.pcmd - pcmd_offset));
+	kunmap_atomic((void *)(unsigned long)pginfo.srcpge);
+	sgx_put_page(va_ptr);
+	sgx_put_page(epc_ptr);
+
+	if (!is_secs)
+		sgx_put_page(secs_ptr);
+
+	sgx_put_backing(pcmd, false);
+
+out:
+	sgx_put_backing(backing, false);
+
+	if (!ret) {
+		sgx_free_va_slot(encl_page->va_page, va_offset);
+		list_move(&encl_page->va_page->list, &encl->va_pages);
+		encl_page->desc &= ~SGX_VA_OFFSET_MASK;
+	}
+
+	return ret;
+}
+
+static struct sgx_encl_page *sgx_do_fault(struct vm_area_struct *vma,
+					  unsigned long addr,
+					  unsigned int flags)
+{
+	bool reserve = (flags & SGX_FAULT_RESERVE) != 0;
+	struct sgx_encl *encl = vma->vm_private_data;
+	struct sgx_encl_page *entry;
+	void *secs_epc_page = NULL;
+	void *epc_page = NULL;
+	int rc = 0;
+
+	/* If process was forked, VMA is still there but vm_private_data is set
+	 * to NULL.
+	 */
+	if (!encl)
+		return ERR_PTR(-EFAULT);
+
+	mutex_lock(&encl->lock);
+
+	entry = radix_tree_lookup(&encl->page_tree, addr >> PAGE_SHIFT);
+	if (!entry) {
+		rc = -EFAULT;
+		goto out;
+	}
+
+	if (encl->flags & SGX_ENCL_DEAD) {
+		rc = -EFAULT;
+		goto out;
+	}
+
+	if (!(encl->flags & SGX_ENCL_INITIALIZED)) {
+		sgx_dbg(encl, "cannot fault, unitialized\n");
+		rc = -EFAULT;
+		goto out;
+	}
+
+	if (reserve && (entry->desc & SGX_ENCL_PAGE_RESERVED)) {
+		sgx_dbg(encl, "cannot fault, 0x%p is reserved\n",
+			(void *)SGX_ENCL_PAGE_ADDR(entry));
+		rc = -EBUSY;
+		goto out;
+	}
+
+	/* Legal race condition, page is already faulted. */
+	if (entry->desc & SGX_ENCL_PAGE_LOADED) {
+		if (reserve)
+			entry->desc |= SGX_ENCL_PAGE_RESERVED;
+		goto out;
+	}
+
+	epc_page = sgx_alloc_page(SGX_ALLOC_ATOMIC);
+	if (IS_ERR(epc_page)) {
+		rc = PTR_ERR(epc_page);
+		epc_page = NULL;
+		goto out;
+	}
+
+	/* If SECS is evicted then reload it first */
+	if (encl->flags & SGX_ENCL_SECS_EVICTED) {
+		secs_epc_page = sgx_alloc_page(SGX_ALLOC_ATOMIC);
+		if (IS_ERR(secs_epc_page)) {
+			rc = PTR_ERR(secs_epc_page);
+			secs_epc_page = NULL;
+			goto out;
+		}
+
+		rc = sgx_eldu(encl, &encl->secs, secs_epc_page, true);
+		if (rc)
+			goto out;
+
+		encl->secs.epc_page = secs_epc_page;
+		encl->flags &= ~SGX_ENCL_SECS_EVICTED;
+
+		/* Do not free */
+		secs_epc_page = NULL;
+	}
+
+	rc = sgx_eldu(encl, entry, epc_page, false /* is_secs */);
+	if (rc)
+		goto out;
+
+	/* Track the EPC page even if vm_insert_pfn fails; we need to ensure
+	 * the EPC page is properly freed and we can't do EREMOVE right away
+	 * because EREMOVE may fail due to an active cpu in the enclave.  We
+	 * can't call vm_insert_pfn before sgx_eldu because SKL signals #GP
+	 * instead of #PF if the EPC page is invalid.
+	 */
+	encl->secs_child_cnt++;
+
+	entry->epc_page = epc_page;
+	entry->desc |= SGX_ENCL_PAGE_LOADED;
+
+	if (reserve)
+		entry->desc |= SGX_ENCL_PAGE_RESERVED;
+
+	/* Do not free */
+	epc_page = NULL;
+	list_add_tail(&entry->list, &encl->load_list);
+
+	rc = vm_insert_pfn(vma, addr, SGX_EPC_PFN(entry->epc_page));
+	if (rc) {
+		/* Kill the enclave if vm_insert_pfn fails; failure only occurs
+		 * if there is a driver bug or an unrecoverable issue, e.g. OOM.
+		 */
+		sgx_crit(encl, "vm_insert_pfn returned %d\n", rc);
+		sgx_invalidate(encl, true);
+		goto out;
+	}
+
+	sgx_test_and_clear_young(entry, encl);
+out:
+	mutex_unlock(&encl->lock);
+	if (epc_page)
+		sgx_free_page(epc_page, encl);
+	if (secs_epc_page)
+		sgx_free_page(secs_epc_page, encl);
+	return rc ? ERR_PTR(rc) : entry;
+}
+
+struct sgx_encl_page *sgx_fault_page(struct vm_area_struct *vma,
+				     unsigned long addr,
+				     unsigned int flags)
+{
+	struct sgx_encl_page *entry;
+
+	do {
+		entry = sgx_do_fault(vma, addr, flags);
+		if (!(flags & SGX_FAULT_RESERVE))
+			break;
+	} while (PTR_ERR(entry) == -EBUSY);
+
+	return entry;
+}
diff --git a/drivers/platform/x86/intel_sgx/sgx_vma.c b/drivers/platform/x86/intel_sgx/sgx_vma.c
new file mode 100644
index 000000000000..481f671f10ca
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/sgx_vma.c
@@ -0,0 +1,117 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Copyright(c) 2016-2017 Intel Corporation.
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
+ * Suresh Siddha <suresh.b.siddha@intel.com>
+ * Serge Ayoun <serge.ayoun@intel.com>
+ * Shay Katz-zamir <shay.katz-zamir@intel.com>
+ * Sean Christopherson <sean.j.christopherson@intel.com>
+ */
+
+#include <asm/mman.h>
+#include <linux/delay.h>
+#include <linux/file.h>
+#include <linux/hashtable.h>
+#include <linux/highmem.h>
+#include <linux/mm.h>
+#include <linux/ratelimit.h>
+#include <linux/shmem_fs.h>
+#include <linux/slab.h>
+#include "sgx.h"
+
+static void sgx_vma_open(struct vm_area_struct *vma)
+{
+	struct sgx_encl *encl = vma->vm_private_data;
+
+	if (!encl)
+		return;
+
+	/* kref cannot underflow because ECREATE ioctl checks that there is only
+	 * one single VMA for the enclave before proceeding.
+	 */
+	kref_get(&encl->refcount);
+}
+
+static void sgx_vma_close(struct vm_area_struct *vma)
+{
+	struct sgx_encl *encl = vma->vm_private_data;
+
+	if (!encl)
+		return;
+
+	mutex_lock(&encl->lock);
+	zap_vma_ptes(vma, vma->vm_start, vma->vm_end - vma->vm_start);
+	encl->flags |= SGX_ENCL_DEAD;
+	mutex_unlock(&encl->lock);
+	kref_put(&encl->refcount, sgx_encl_release);
+}
+
+static int sgx_vma_fault(struct vm_fault *vmf)
+{
+	unsigned long addr = (unsigned long)vmf->address;
+	struct vm_area_struct *vma = vmf->vma;
+	struct sgx_encl_page *entry;
+
+	entry = sgx_fault_page(vma, addr, 0);
+
+	if (!IS_ERR(entry) || PTR_ERR(entry) == -EBUSY)
+		return VM_FAULT_NOPAGE;
+	else
+		return VM_FAULT_SIGBUS;
+}
+
+const struct vm_operations_struct sgx_vm_ops = {
+	.close = sgx_vma_close,
+	.open = sgx_vma_open,
+	.fault = sgx_vma_fault,
+};
-- 
2.14.1
