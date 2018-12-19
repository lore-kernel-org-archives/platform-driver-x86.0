From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Wed, 19 Dec 2018 07:00:47 +0200
Message-ID: <20181219050047.GC14295@linux.intel.com>
References: <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
 <20181217180102.GA12560@linux.intel.com>
 <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com>
 <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
 <CALCETrX0W4dhFJBHEbDbKed_QZxmw6ZNMajfsoVgqGqhMB0nDg@mail.gmail.com>
 <20181217222047.GG12491@linux.intel.com>
 <CALCETrX1HXZvMk8UM6wV5StTj+vvqehAvybJYk66At60t91QGQ@mail.gmail.com>
 <20181218154417.GC28326@linux.intel.com>
 <20181218185349.GC30082@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181218185349.GC30082@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, Haitao Huang <haitao.huang@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vge>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 18, 2018 at 10:53:49AM -0800, Sean Christopherson wrote:
> What if we re-organize the ioctls in such a way that we leave open the
> possibility of allocating raw EPC for KVM via /dev/sgx?  I'm not 100%
> positive this approach will work[1], but conceptually it fits well with
> KVM's memory model, e.g. KVM is aware of the GPA<->HVA association but
> generally speaking doesn't know what's physically backing each memory
> region.

Why would you want to pass EPC through user space to KVM rather than
KVM allocating it through kernel interfaces?

> Tangentially related, I think we should support allocating multiple
> enclaves from a single /dev/sgx fd, i.e. a process shouldn't have to
> open /dev/sgx every time it wants to create a new enclave.

I'm fine with this. It just requires to create anon inode. I'll just
add a new field called 'enclave_fd' to struct sgx_enclave_create and
that's all.

I think I have otherwise ingredients for v19 ready except where to swap.

/Jarkko
