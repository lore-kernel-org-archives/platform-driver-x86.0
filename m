From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 17 Dec 2018 11:12:21 -0800
Message-ID: <CALCETrX0W4dhFJBHEbDbKed_QZxmw6ZNMajfsoVgqGqhMB0nDg@mail.gmail.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com> <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
 <20181217180102.GA12560@linux.intel.com> <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com> <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Sean Christopherson <sean.j.christopherson@intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, Haitao Huang <haitao.huang@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, open list:X86 ARCHITECTURE (32-B
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 17, 2018 at 10:47 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 12/17/18 10:43 AM, Jarkko Sakkinen wrote:
> > On Mon, Dec 17, 2018 at 10:36:13AM -0800, Sean Christopherson wrote:
> >> I'm pretty sure doing mmget() would result in circular dependencies and
> >> a zombie enclave.  In the do_exit() case where a task is abruptly killed:
> >>
> >>   - __mmput() is never called because the enclave holds a ref
> >>   - sgx_encl_release() is never be called because its VMAs hold refs
> >>   - sgx_vma_close() is never called because __mmput()->exit_mmap() is
> >>     blocked and the process itself is dead, i.e. won't unmap anything.
> > Right, it does, you are absolutely right. Tried it and removed the
> > commit already.
> >
> > Well, what we came up from your suggestion i.e. setting mm to NULL
> > and checking that is very subtle change and does not have any such
> > circular dependencies. We'll go with that.
>
> This all screams that you need to break out this code from the massive
> "18" patch and get the mm interactions reviewed more thoroughly.
>
> Also, no matter what method you go with, you have a bunch of commenting
> and changelogging to do here.

I'm going to ask an obnoxious high-level question: why does an enclave
even refer to a specific mm?

If I were designing this thing, and if I hadn't started trying to
implement it, my first thought would be that an enclave tracks its
linear address range, which is just a pair of numbers, and also keeps
track of a whole bunch of physical EPC pages, data structures, etc.
And that mmap() gets rejected unless the requested virtual address
matches the linear address range that the enclave wants and, aside
from that, just creates a VMA that keeps a reference to the enclave.
(And, for convenience, I suppose that the first mmap() call done
before any actual enclave setup happens could choose any address and
then cause the enclave to lock itself to that address, although a
regular anonymous PROT_NONE MAP_NORESERVE mapping would do just fine,
too.)  And the driver would explicitly allow multiple different mms to
have the same enclave mapped.  More importantly, a daemon could set up
an enclave without necessarily mapping it at all and then SCM_RIGHTS
the enclave over to the process that plans to run it.

Now I'm sure this has all kinds of problems, such as the ISA possibly
making it rather obnoxious to add pages to the enclave without having
it mapped.  But these operations could, in principle, be done by
having the enclave own a private mm that's used just for setup.  While
this would be vaguely annoying, Nadav's still-pending-but-nearly-done
text_poke series adds all the infrastructure that's needed for the
kernel to manage little private mms.  But some things get simpler --
invalidating the enclave can presumably use the regular rmap APIs to
zap all the PTEs in all VMAs pointing into the enclave.

So I'm not saying that you shouldn't do it the way you are now, but I
do think that the changelog or at least some emails should explain
*why* the enclave needs to keep a pointer to the creating process's
mm.  And, if you do keep the current model, it would be nice to
understand what happens if you do something awful like mremap()ing an
enclave, or calling madvise on it, or otherwise abusing the vma.  Or
doing fork(), for that matter.

I also find it suspicious that the various ioctl handlers
systematically ignore their "filep" parameters and instead use
find_vma() to find the relevant mm data structures.  That seems
backwards.
