From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Fri, 21 Dec 2018 10:28:09 -0800
Message-ID: <20181221182809.GB27371@linux.intel.com>
References: <20181217180102.GA12560@linux.intel.com>
 <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com>
 <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
 <CALCETrX0W4dhFJBHEbDbKed_QZxmw6ZNMajfsoVgqGqhMB0nDg@mail.gmail.com>
 <20181217222047.GG12491@linux.intel.com>
 <CALCETrX1HXZvMk8UM6wV5StTj+vvqehAvybJYk66At60t91QGQ@mail.gmail.com>
 <20181218154417.GC28326@linux.intel.com>
 <20181218185349.GC30082@linux.intel.com>
 <20181219050047.GC14295@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181219050047.GC14295@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, Haitao Huang <haitao.huang@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vge>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 19, 2018 at 07:00:47AM +0200, Jarkko Sakkinen wrote:
> On Tue, Dec 18, 2018 at 10:53:49AM -0800, Sean Christopherson wrote:
> > What if we re-organize the ioctls in such a way that we leave open the
> > possibility of allocating raw EPC for KVM via /dev/sgx?  I'm not 100%
> > positive this approach will work[1], but conceptually it fits well with
> > KVM's memory model, e.g. KVM is aware of the GPA<->HVA association but
> > generally speaking doesn't know what's physically backing each memory
> > region.
> 
> Why would you want to pass EPC through user space to KVM rather than
> KVM allocating it through kernel interfaces?

Delegating EPC management to userspace fits better with KVM's existing
memory ABI.  KVM provides a single ioctl(), KVM_SET_USER_MEMORY_REGION[1],
that allows userspace to create, move, modify and delete memory regions.

Skipping over a lot of details, there are essentially three options for
exposing EPC to a KVM guest:

 1) Provide a dedicated KVM ioctl() to manage EPC without routing it
    through KVM_SET_USER_MEMORY_REGION.

 2) Add a flag to 'struct kvm_userspace_memory_region' that denotes an
    EPC memory region and mmap() / allocate EPC in KVM.

 3) Provide an ABI to allocate raw EPC and let userspace manage it like
    any other memory region.

Option (1) requires duplicating all of KVM_SET_USER_MEMORY_REGION's
functionality unless the ioctl() is severly restricted.

Option (2) is an ugly abuse of KVM_SET_USER_MEMORY_REGION since the EPC
flag would have completely different semantics than all other usage of
KVM_SET_USER_MEMORY_REGION.

Thus, option (3).

Probably a better question to answer is why provide the ABI through
/dev/sgx and not /dev/kvm.  IMO /dev/sgx is a more logical way to
advertise support to userspace, e.g. userspace can simply check if
/dev/sgx (or /dev/sgx/epc) exists vs. probing a KVM capability.

Without EPC oversubscription in KVM, /dev/sgx is easily the best fit
since the EPC management would reside completely in x86/sgx, i.e. KVM
would essentially have zero code related to EPC management.

EPC oversubscription complicates things because the architecture forces
aspects of VMM oversubscription into the KVM domain, e.g. requires a
post-VMXON instruction (ENCLV) and a VM-Exit handler.   I still think
/dev/sgx is a better fit, my only concern is that the oversubscription
code would be even more heinous due to splitting responsibilities.
But, Andy's idea of having /dev/sgx/enclave vs. /dev/sgx/epc might help
avoid that entirely.
