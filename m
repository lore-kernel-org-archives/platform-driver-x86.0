From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Tue, 18 Dec 2018 07:44:18 -0800
Message-ID: <20181218154417.GC28326@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
 <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
 <20181217180102.GA12560@linux.intel.com>
 <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com>
 <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
 <CALCETrX0W4dhFJBHEbDbKed_QZxmw6ZNMajfsoVgqGqhMB0nDg@mail.gmail.com>
 <20181217222047.GG12491@linux.intel.com>
 <CALCETrX1HXZvMk8UM6wV5StTj+vvqehAvybJYk66At60t91QGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrX1HXZvMk8UM6wV5StTj+vvqehAvybJYk66At60t91QGQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, Haitao Huang <haitao.huang@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 17, 2018 at 08:59:54PM -0800, Andy Lutomirski wrote:
> On Mon, Dec 17, 2018 at 2:20 PM Sean Christopherson
> <sean.j.christopherson@intel.com> wrote:
> >
> 
> > My brain is still sorting out the details, but I generally like the idea
> > of allocating an anon inode when creating an enclave, and exposing the
> > other ioctls() via the returned fd.  This is essentially the approach
> > used by KVM to manage multiple "layers" of ioctls across KVM itself, VMs
> > and vCPUS.  There are even similarities to accessing physical memory via
> > multiple disparate domains, e.g. host kernel, host userspace and guest.
> >
> 
> In my mind, opening /dev/sgx would give you the requisite inode.  I'm
> not 100% sure that the chardev infrastructure allows this, but I think
> it does.

My fd/inode knowledge is lacking, to say the least.  Whatever works, so
long as we have a way to uniquely identify enclaves.

> > The only potential hiccup I can see is the build flow.  Currently,
> > EADD+EEXTEND is done via a work queue to avoid major performance issues
> > (10x regression) when userspace is building multiple enclaves in parallel
> > using goroutines to wrap Cgo (the issue might apply to any M:N scheduler,
> > but I've only confirmed the Golang case).  The issue is that allocating
> > an EPC page acts like a blocking syscall when the EPC is under pressure,
> > i.e. an EPC page isn't immediately available.  This causes Go's scheduler
> > to thrash and tank performance[1].
> 
> What's the issue, and how does a workqueue help?  I'm wondering if a
> nicer solution would be an ioctl to add lots of pages in a single
> call.

Adding pages via workqueue makes the ioctl itself fast enough to avoid
triggering Go's rescheduling.  A batched EADD flow would likely help,
I just haven't had the time to rework the userspace side to be able to
test the performance.

> >
> > Alternatively, we could change the EADD+EEXTEND flow to not insert the
> > added page's PFN into the owner's process space, i.e. force userspace to
> > fault when it runs the enclave.  But that only delays the issue because
> > eventually we'll want to account EPC pages, i.e. add a cgroup, at which
> > point we'll likely need current->mm anyways.
> 
> You should be able to account the backing pages to a cgroup without
> actually sticking them into the EPC, no?  Or am I misunderstanding?  I
> guess we'll eventually want a cgroup to limit use of the limited EPC
> resources.

It's the latter, a cgroup to limit EPC.  The mm is used to retrieve the
cgroup without having track e.g. the task_struct.
