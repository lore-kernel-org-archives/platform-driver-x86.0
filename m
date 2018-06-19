From: Neil Horman <nhorman@redhat.com>
Subject: Re: [PATCH v11 09/13] x86, sgx: basic routines for enclave page cache
Date: Tue, 19 Jun 2018 11:19:33 -0400
Message-ID: <20180619151933.GD3666@neilslaptop.think-freely.org>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
 <3c1b04d6-6e93-efaa-1890-101b7fd9784c@intel.com>
 <20180619145753.GB8034@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180619145753.GB8034@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, sean.j.christopherson@intel.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 19, 2018 at 05:57:53PM +0300, Jarkko Sakkinen wrote:
> On Fri, Jun 08, 2018 at 11:24:12AM -0700, Dave Hansen wrote:
> > On 06/08/2018 10:09 AM, Jarkko Sakkinen wrote:
> > > SGX has a set of data structures to maintain information about the enclaves
> > > and their security properties. BIOS reserves a fixed size region of
> > > physical memory for these structures by setting Processor Reserved Memory
> > > Range Registers (PRMRR). This memory area is called Enclave Page Cache
> > > (EPC).
> > > 
> > > This commit implements the basic routines to allocate and free pages from
> > > different EPC banks. There is also a swapper thread ksgxswapd for EPC pages
> > > that gets woken up by sgx_alloc_page() when we run below the low watermark.
> > > The swapper thread continues swapping pages up until it reaches the high
> > > watermark.
> > 
> > Yay!  A new memory manager in arch-specific code.
> > 
> > > Each subsystem that uses SGX must provide a set of callbacks for EPC
> > > pages that are used to reclaim, block and write an EPC page. Kernel
> > > takes the responsibility of maintaining LRU cache for them.
> > 
> > What does a "subsystem that uses SGX" mean?  Do we have one of those
> > already?
> 
> Driver and KVM.
> 
> > > +struct sgx_secs {
> > > +	uint64_t size;
> > > +	uint64_t base;
> > > +	uint32_t ssaframesize;
> > > +	uint32_t miscselect;
> > > +	uint8_t reserved1[SGX_SECS_RESERVED1_SIZE];
> > > +	uint64_t attributes;
> > > +	uint64_t xfrm;
> > > +	uint32_t mrenclave[8];
> > > +	uint8_t reserved2[SGX_SECS_RESERVED2_SIZE];
> > > +	uint32_t mrsigner[8];
> > > +	uint8_t	reserved3[SGX_SECS_RESERVED3_SIZE];
> > > +	uint16_t isvvprodid;
> > > +	uint16_t isvsvn;
> > > +	uint8_t reserved4[SGX_SECS_RESERVED4_SIZE];
> > > +};
> > 
> > This is a hardware structure, right?  Doesn't it need to be packed?
> 
> Everything is aligned properly in this struct.
> 
I don't think you can guarantee that.  I understand that the reserved size is
likely computed to turn those u8's into 32/64 byte regions, but the uint16t
isvvprodid and isvsvn might get padded to 32 or 64 bytes in software dependent
on the processor you build for.

And even so, its suceptible to being
misaligned if a new version of the hardware adds or removes elements.  Adding a
packed attribute seems like a safe approach (or at least a no-op in the current
state)

Neil
