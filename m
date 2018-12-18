From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Tue, 18 Dec 2018 05:27:02 +0200
Message-ID: <20181218032702.GA2903@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
 <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
 <20181217180102.GA12560@linux.intel.com>
 <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com>
 <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
 <CALCETrX0W4dhFJBHEbDbKed_QZxmw6ZNMajfsoVgqGqhMB0nDg@mail.gmail.com>
 <20181217222047.GG12491@linux.intel.com>
 <20181218013918.GC333@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181218013918.GC333@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, Haitao Huang <haitao.huang@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vge>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 18, 2018 at 03:39:18AM +0200, Jarkko Sakkinen wrote:
> On Mon, Dec 17, 2018 at 02:20:48PM -0800, Sean Christopherson wrote:
> > The only potential hiccup I can see is the build flow.  Currently,
> > EADD+EEXTEND is done via a work queue to avoid major performance issues
> > (10x regression) when userspace is building multiple enclaves in parallel
> > using goroutines to wrap Cgo (the issue might apply to any M:N scheduler,
> > but I've only confirmed the Golang case).  The issue is that allocating
> > an EPC page acts like a blocking syscall when the EPC is under pressure,
> > i.e. an EPC page isn't immediately available.  This causes Go's scheduler
> > to thrash and tank performance[1].
> 
> I don't see any major issues having that kthread. All the code that
> maps the enclave would be removed.
> 
> I would only allow to map enclave to process address space after the
> enclave has been initialized i.e. SGX_IOC_ENCLAVE_ATTACH.

Some refined thoughts.

PTE insertion can done in the #PF handler. In fact, we can PoC this
already with the current architecture (and I will right after sending
v18).

The backing space is a bit more nasty issue in the add pager thread.
The previous shmem swapping would have been a better fit. Maybe that
should be reconsidered?

If shmem was used, all the commits up to "SGX Enclave Driver" could
be reworked to the new model.

When we think about the swapping code, there uprises some difficulties.
Namely, when a page is swapped, the enclave must unmap the PTE from all
processes that have it mapped.

I have a one compromise solution for the problem above: make enclaves
shared BUT mutually exclusive. When you attach an enclave it gets
detached from the previous process that had it. This would still fully
implement the daemon example that Andy gave in earlier response.

/Jarkko
