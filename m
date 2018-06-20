From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v11 09/13] x86, sgx: basic routines for enclave page
 cache
Date: Wed, 20 Jun 2018 06:21:11 -0700
Message-ID: <1529500871.9779.58.camel@intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
         <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
Cc: dave.hansen@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2018-06-08 at 19:09 +0200, Jarkko Sakkinen wrote:
> SGX has a set of data structures to maintain information about the enclaves
> and their security properties. BIOS reserves a fixed size region of
> physical memory for these structures by setting Processor Reserved Memory
> Range Registers (PRMRR). This memory area is called Enclave Page Cache
> (EPC).
> 
> This commit implements the basic routines to allocate and free pages from
> different EPC banks. There is also a swapper thread ksgxswapd for EPC pages
> that gets woken up by sgx_alloc_page() when we run below the low watermark.
> The swapper thread continues swapping pages up until it reaches the high
> watermark.
> 
> Each subsystem that uses SGX must provide a set of callbacks for EPC
> pages that are used to reclaim, block and write an EPC page. Kernel
> takes the responsibility of maintaining LRU cache for them.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  arch/x86/include/asm/sgx.h      |  67 +++++
>  arch/x86/include/asm/sgx_arch.h | 224 ++++++++++++++++
>  arch/x86/kernel/cpu/intel_sgx.c | 443 +++++++++++++++++++++++++++++++-
>  3 files changed, 732 insertions(+), 2 deletions(-)
>  create mode 100644 arch/x86/include/asm/sgx_arch.h

...

> +struct sgx_pcmd {
> +	struct sgx_secinfo secinfo;
> +	uint64_t enclave_id;
> +	uint8_t reserved[40];
> +	uint8_t mac[16];
> +};

sgx_pcmd has a 128-byte alignment requirement.  I think it's
worth specifying here as sgx_pcmd is small enough that it could
be put on the stack, e.g. by KVM when trapping and executing
ELD* on behalf of a guest VM.

In fact, it probably makes sense to add alightment attributes
to all SGX structs for self-documentation purposes, even though
many of them will never be allocated statically or on the stack.

> +
> +#define SGX_MODULUS_SIZE 384
> +
> +struct sgx_sigstruct_header {
> +	uint64_t header1[2];
> +	uint32_t vendor;
> +	uint32_t date;
> +	uint64_t header2[2];
> +	uint32_t swdefined;
> +	uint8_t reserved1[84];
> +};
> +
> +struct sgx_sigstruct_body {
> +	uint32_t miscselect;
> +	uint32_t miscmask;
> +	uint8_t reserved2[20];
> +	uint64_t attributes;
> +	uint64_t xfrm;
> +	uint8_t attributemask[16];
> +	uint8_t mrenclave[32];
> +	uint8_t reserved3[32];
> +	uint16_t isvprodid;
> +	uint16_t isvsvn;
> +} __attribute__((__packed__));
> +
> +struct sgx_sigstruct {
> +	struct sgx_sigstruct_header header;
> +	uint8_t modulus[SGX_MODULUS_SIZE];
> +	uint32_t exponent;
> +	uint8_t signature[SGX_MODULUS_SIZE];
> +	struct sgx_sigstruct_body body;
> +	uint8_t reserved4[12];
> +	uint8_t q1[SGX_MODULUS_SIZE];
> +	uint8_t q2[SGX_MODULUS_SIZE];
> +};
> +
> +struct sgx_sigstruct_payload {
> +	struct sgx_sigstruct_header header;
> +	struct sgx_sigstruct_body body;
> +};
> +
> +struct sgx_einittoken_payload {
> +	uint32_t valid;
> +	uint32_t reserved1[11];
> +	uint64_t attributes;
> +	uint64_t xfrm;
> +	uint8_t mrenclave[32];
> +	uint8_t reserved2[32];
> +	uint8_t mrsigner[32];
> +	uint8_t reserved3[32];
> +};
> +
> +struct sgx_einittoken {
> +	struct sgx_einittoken_payload payload;
> +	uint8_t cpusvnle[16];
> +	uint16_t isvprodidle;
> +	uint16_t isvsvnle;
> +	uint8_t reserved2[24];
> +	uint32_t maskedmiscselectle;
> +	uint64_t maskedattributesle;
> +	uint64_t maskedxfrmle;
> +	uint8_t keyid[32];
> +	uint8_t mac[16];
> +};
> +
> +struct sgx_report {
> +	uint8_t cpusvn[16];
> +	uint32_t miscselect;
> +	uint8_t reserved1[28];
> +	uint64_t attributes;
> +	uint64_t xfrm;
> +	uint8_t mrenclave[32];
> +	uint8_t reserved2[32];
> +	uint8_t mrsigner[32];
> +	uint8_t reserved3[96];
> +	uint16_t isvprodid;
> +	uint16_t isvsvn;
> +	uint8_t reserved4[60];
> +	uint8_t reportdata[64];
> +	uint8_t keyid[32];
> +	uint8_t mac[16];
> +};
> +
> +struct sgx_targetinfo {
> +	uint8_t mrenclave[32];
> +	uint64_t attributes;
> +	uint64_t xfrm;
> +	uint8_t reserved1[4];
> +	uint32_t miscselect;
> +	uint8_t reserved2[456];
> +};
> +
> +struct sgx_keyrequest {
> +	uint16_t keyname;
> +	uint16_t keypolicy;
> +	uint16_t isvsvn;
> +	uint16_t reserved1;
> +	uint8_t cpusvn[16];
> +	uint64_t attributemask;
> +	uint64_t xfrmmask;
> +	uint8_t keyid[32];
> +	uint32_t miscmask;
> +	uint8_t reserved2[436];
> +};
