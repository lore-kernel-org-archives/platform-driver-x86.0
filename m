From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v11 09/13] x86, sgx: basic routines for enclave page
 cache
Date: Mon, 25 Jun 2018 12:21:22 +0300
Message-ID: <b8ea3787ae99637a8aae286ff90ac6889d8b55f4.camel@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
         <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
         <1529500871.9779.58.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529500871.9779.58.camel@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
Cc: dave.hansen@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2018-06-20 at 06:21 -0700, Sean Christopherson wrote:
> On Fri, 2018-06-08 at 19:09 +0200, Jarkko Sakkinen wrote:
> > SGX has a set of data structures to maintain information about the enclaves
> > and their security properties. BIOS reserves a fixed size region of
> > physical memory for these structures by setting Processor Reserved Memory
> > Range Registers (PRMRR). This memory area is called Enclave Page Cache
> > (EPC).
> > 
> > This commit implements the basic routines to allocate and free pages from
> > different EPC banks. There is also a swapper thread ksgxswapd for EPC pages
> > that gets woken up by sgx_alloc_page() when we run below the low watermark.
> > The swapper thread continues swapping pages up until it reaches the high
> > watermark.
> > 
> > Each subsystem that uses SGX must provide a set of callbacks for EPC
> > pages that are used to reclaim, block and write an EPC page. Kernel
> > takes the responsibility of maintaining LRU cache for them.
> > 
> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > ---
> >  arch/x86/include/asm/sgx.h      |  67 +++++
> >  arch/x86/include/asm/sgx_arch.h | 224 ++++++++++++++++
> >  arch/x86/kernel/cpu/intel_sgx.c | 443 +++++++++++++++++++++++++++++++-
> >  3 files changed, 732 insertions(+), 2 deletions(-)
> >  create mode 100644 arch/x86/include/asm/sgx_arch.h
> 
> ...
> 
> > +struct sgx_pcmd {
> > +	struct sgx_secinfo secinfo;
> > +	uint64_t enclave_id;
> > +	uint8_t reserved[40];
> > +	uint8_t mac[16];
> > +};
> 
> sgx_pcmd has a 128-byte alignment requirement.  I think it's
> worth specifying here as sgx_pcmd is small enough that it could
> be put on the stack, e.g. by KVM when trapping and executing
> ELD* on behalf of a guest VM.
> 
> In fact, it probably makes sense to add alightment attributes
> to all SGX structs for self-documentation purposes, even though
> many of them will never be allocated statically or on the stack.

I agree with this. It also documents stuff so that you don't have
to look it up from the SDM.

Neil: this should also clear your concerns.

/Jarkko
