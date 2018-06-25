From: Nathaniel McCallum <npmccallum@redhat.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 13/13] intel_sgx: in-kernel
 launch enclave
Date: Mon, 25 Jun 2018 17:06:12 -0400
Message-ID: <CAOASepPb5zKz_HDyM+s8wLmaN3oN7+OtuDLmocP_9w5Hdq3c6A@mail.gmail.com>
References: <CALCETrVp1ZhrxF5bQDSaZpLucS88tErejj5JC6Jb0fB5etWRbA@mail.gmail.com>
 <20180611115255.GC22164@hmswarspite.think-freely.org> <CALCETrX6SD0ThNzpjkbXd7CbNTguzqiQhWMomGK+tocx_DE9XQ@mail.gmail.com>
 <20180612174535.GE19168@hmswarspite.think-freely.org> <CALCETrV-4D-M2ap1EFHQiQerYf_XgwLmBAx5WMvcCUefOODjOA@mail.gmail.com>
 <CAOASepN9t3jF4ajfKLG_odTZddOvXjY_DqLQhRPWhJ-imtjkgg@mail.gmail.com>
 <e3f8e5b9-aa1e-20da-37ac-3c3caafa66bc@fortanix.com> <b5c81504-83cd-8150-ebe4-41355026590f@fortanix.com>
 <20180620210158.GA24328@linux.intel.com> <CAOASepN1AtgEhobJUVh=rcsQ_Qt8ujoEhnivV-29y=-AiyJwZQ@mail.gmail.com>
 <20180621152903.GB1324@hmswarspite.think-freely.org> <CAOASepOPxte6aDHQB2dsd+VMPqWOuZZH4j8OKoqaHZ2cBsc38g@mail.gmail.com>
 <CALCETrVCVeen+foJbW-yXgg2ivkPNmUx31tPT8rV4cYOAqcSfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALCETrVCVeen+foJbW-yXgg2ivkPNmUx31tPT8rV4cYOAqcSfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: luto@kernel.org
Cc: Neil Horman <nhorman@redhat.com>, sean.j.christopherson@intel.com, jethro@fortanix.com, jarkko.sakkinen@linux.intel.com, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, intel-sgx-kernel-dev@lists.01.org, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org, Peter Jones <pjones@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jun 21, 2018 at 6:49 PM Andy Lutomirski <luto@kernel.org> wrote:
>
> On Thu, Jun 21, 2018 at 12:11 PM Nathaniel McCallum
> <npmccallum@redhat.com> wrote:
> >
> > If this is acceptable for everyone, my hope is the following:
> >
> > 1. Intel would split the existing code into one of the following
> > schemas (I don't care which):
> >   A. three parts: UEFI module, FLC-only kernel driver and user-space
> > launch enclave
> >   B. two parts: UEFI module (including launch enclave) and FLC-only
> > kernel driver
> >
> > 2. Intel would release a reproducible build of the GPL UEFI module
> > sources signed with a SecureBoot trusted key and provide an
> > acceptable[0] binary redistribution license.
> >
> > 3. The kernel community would agree to merge the kernel driver given
> > the above criteria (and, obviously, acceptable kernel code).
> >
> > The question of how to distribute the UEFI module and possible launch
> > enclave remains open. I see two options: independent distribution and
> > bundling it in linux-firmware. The former may be a better
> > technological fit since the UEFI module will likely need to be run
> > before the kernel (and the boot loader; and shim). However, the latter
> > has the benefit of already being a well-known entity to our downstream
> > distributors. I could go either way on this.
>
> This is a lot of complication and effort for a gain that is not
> entirely clear.

Root kits and evil maid attacks are two worth considering.

> I really really really do *not* want to see Intel or
> anyone else start enforcing policy on which programs can and cannot
> run using this mechanism.

We already do this. It is called SecureBoot.

> (This is exactly why non-FLC systems aren't
> about to be supported upstream.)  So my preference is to not merge
> anything that supports this type of use case unless there is
> compelling evidence that it is (a) genuinely useful, (b) will be used
> to improve security and (c) won't be abused for, say, revenue
> purposes.

I think there are benefits for (a) and (b). I agree with you about
(c). But, again, we already have SecureBoot.
