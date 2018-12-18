From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Tue, 18 Dec 2018 03:31:44 +0200
Message-ID: <20181218013144.GB333@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
 <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
 <20181217180102.GA12560@linux.intel.com>
 <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com>
 <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
 <CALCETrX0W4dhFJBHEbDbKed_QZxmw6ZNMajfsoVgqGqhMB0nDg@mail.gmail.com>
 <20181218011725.GA333@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181218011725.GA333@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Sean Christopherson <sean.j.christopherson@intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, Haitao Huang <haitao.huang@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 18, 2018 at 03:17:25AM +0200, Jarkko Sakkinen wrote:
> On Mon, Dec 17, 2018 at 11:12:21AM -0800, Andy Lutomirski wrote:
> > I'm going to ask an obnoxious high-level question: why does an enclave
> > even refer to a specific mm?
> 
> The reason is that it has not been yet in focus in the review process
> and there has been other concerns.
> 
> At least the code is fairly stable i.e. working code is usually good
> starting point for making something different (ignoring the recent
> regression caused by the shmem to VMA migration).
> 
> > If I were designing this thing, and if I hadn't started trying to
> > implement it, my first thought would be that an enclave tracks its
> > linear address range, which is just a pair of numbers, and also keeps
> > track of a whole bunch of physical EPC pages, data structures, etc.
> > And that mmap() gets rejected unless the requested virtual address
> > matches the linear address range that the enclave wants and, aside
> > from that, just creates a VMA that keeps a reference to the enclave.
> > (And, for convenience, I suppose that the first mmap() call done
> > before any actual enclave setup happens could choose any address and
> > then cause the enclave to lock itself to that address, although a
> > regular anonymous PROT_NONE MAP_NORESERVE mapping would do just fine,
> > too.)  And the driver would explicitly allow multiple different mms to
> > have the same enclave mapped.  More importantly, a daemon could set up
> > an enclave without necessarily mapping it at all and then SCM_RIGHTS
> > the enclave over to the process that plans to run it.
> 
> The current SGX_IOC_ENCLAVE_CREATE ioctl would be trivial to change to
> use this approach. Instead looking up VMA with an enclave instance it
> would create a new enclave instance.
> 
> Then we could have SGX_IOC_ENCLAVE_ATTACH to attach an enclave to a VMA.
> 
> This does not sound too complicated.
> 
> > Now I'm sure this has all kinds of problems, such as the ISA possibly
> > making it rather obnoxious to add pages to the enclave without having
> > it mapped.  But these operations could, in principle, be done by
> 
> We do EADD in a kthread. What this would require to put current->mm
> into a request that it is processed by that thread. This would be
> doable with mmget().

Correction here. We need mm just for vm_insert_pfn(), which would be
removed, no need to pass mm.

/Jarkko
