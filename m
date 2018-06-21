From: Nathaniel McCallum <npmccallum@redhat.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 13/13] intel_sgx: in-kernel
 launch enclave
Date: Thu, 21 Jun 2018 08:32:25 -0400
Message-ID: <CAOASepN1AtgEhobJUVh=rcsQ_Qt8ujoEhnivV-29y=-AiyJwZQ@mail.gmail.com>
References: <20180608171216.26521-14-jarkko.sakkinen@linux.intel.com>
 <CALCETrW3aZJMMm1GqgPm-cOD3p7JvKxLj7j85KJwfNW2iHTj4A@mail.gmail.com>
 <CALCETrVp1ZhrxF5bQDSaZpLucS88tErejj5JC6Jb0fB5etWRbA@mail.gmail.com>
 <20180611115255.GC22164@hmswarspite.think-freely.org> <CALCETrX6SD0ThNzpjkbXd7CbNTguzqiQhWMomGK+tocx_DE9XQ@mail.gmail.com>
 <20180612174535.GE19168@hmswarspite.think-freely.org> <CALCETrV-4D-M2ap1EFHQiQerYf_XgwLmBAx5WMvcCUefOODjOA@mail.gmail.com>
 <CAOASepN9t3jF4ajfKLG_odTZddOvXjY_DqLQhRPWhJ-imtjkgg@mail.gmail.com>
 <e3f8e5b9-aa1e-20da-37ac-3c3caafa66bc@fortanix.com> <b5c81504-83cd-8150-ebe4-41355026590f@fortanix.com>
 <20180620210158.GA24328@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180620210158.GA24328@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.j.christopherson@intel.com
Cc: jethro@fortanix.com, luto@kernel.org, Neil Horman <nhorman@redhat.com>, jarkko.sakkinen@linux.intel.com, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, intel-sgx-kernel-dev@lists.01.org, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org, Peter Jones <pjones@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 20, 2018 at 5:02 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> On Wed, Jun 20, 2018 at 11:39:00AM -0700, Jethro Beekman wrote:
> > On 2018-06-20 11:16, Jethro Beekman wrote:
> > > > This last bit is also repeated in different words in Table 35-2 and
> > > > Section 42.2.2. The MSRs are *not writable* before the write-lock bit
> > > > itself is locked. Meaning the MSRs are either locked with Intel's key
> > > > hash, or not locked at all.
> >
> > Actually, this might be a documentation bug. I have some test hardware and I
> > was able to configure the MSRs in the BIOS and then read the MSRs after boot
> > like this:
> >
> > MSR 0x3a 0x0000000000040005
> > MSR 0x8c 0x20180620aaaaaaaa
> > MSR 0x8d 0x20180620bbbbbbbb
> > MSR 0x8e 0x20180620cccccccc
> > MSR 0x8f 0x20180620dddddddd
> >
> > Since this is not production hardware, it could also be a CPU bug of course.
> >
> > If it is indeed possible to configure AND lock the MSR values to non-Intel
> > values, I'm very much in favor of Nathaniels proposal to treat the launch
> > enclave like any other firmware blob.
>
> It's not a CPU or documentation bug (though the latter is arguable).
> SGX has an activation step that is triggered by doing a WRMSR(0x7a)
> with bit 0 set.  Until SGX is activated, the SGX related bits in
> IA32_FEATURE_CONTROL cannot be set, i.e. SGX can't be enabled.  But,
> the LE hash MSRs are fully writable prior to activation, e.g. to
> allow firmware to lock down the LE key with a non-Intel value.
>
> So yes, it's possible to lock the MSRs to a non-Intel value.  The
> obvious caveat is that whatever blob is used to write the MSRs would
> need be executed prior to activation.

This implies that it should be possible to create MSR activation (and
an embedded launch enclave?) entirely as a UEFI module. The kernel
would still get to manage who has access to /dev/sgx and other
important non-cryptographic policy details. Users would still be able
to control the cryptographic policy details (via BIOS Secure Boot
configuration that exists today). Distributions could still control
cryptographic policy details via signing of the UEFI module with their
own Secure Boot key (or using something like shim). The UEFI module
(and possibly the external launch enclave) could be distributed via
linux-firmware.

Andy/Neil, does this work for you?

> As for the SDM, it's a documentation... omission?  SGX activation
> is intentionally omitted from the SDM.  The intended usage model is
> that firmware will always do the activation (if it wants SGX enabled),
> i.e. post-firmware software will only ever "see" SGX as disabled or
> in the fully activated state, and so the SDM doesn't describe SGX
> behavior prior to activation.  I believe the activation process, or
> at least what is required from firmware, is documented in the BIOS
> writer's guide.
>
> > Jethro Beekman | Fortanix
> >
>
>
