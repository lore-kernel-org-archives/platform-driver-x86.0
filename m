From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 04/11] x86: define IA32_FEATUE_CONTROL.SGX_LC
Date: Wed, 29 Nov 2017 00:03:23 +0200
Message-ID: <20171128220323.frjxikp4n52ejyuc@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-5-jarkko.sakkinen@linux.intel.com>
 <1511889371.9392.58.camel@intel.com>
 <1511893683.9392.100.camel@intel.com>
 <20171128205324.pqojyfqbet3h7re4@linux.intel.com>
 <20171128212407.lky32cdghxqsxd4e@linux.intel.com>
 <20171128214055.gx7bre62iysz6px5@linux.intel.com>
 <1511905490.18982.13.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:16411 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751897AbdK1WDY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 17:03:24 -0500
Content-Disposition: inline
In-Reply-To: <1511905490.18982.13.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@suse.de>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, Piotr Luc <piotr.luc@intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>

On Tue, Nov 28, 2017 at 01:44:50PM -0800, Sean Christopherson wrote:
> On Tue, 2017-11-28 at 23:40 +0200, Jarkko Sakkinen wrote:
> > On Tue, Nov 28, 2017 at 11:24:07PM +0200, Jarkko Sakkinen wrote:
> > > 
> > > On Tue, Nov 28, 2017 at 10:53:24PM +0200, Jarkko Sakkinen wrote:
> > > > 
> > > > > 
> > > > > So, maybe something like this?
> > > > > 
> > > > >     After SGX is activated[1] the IA32_SGXLEPUBKEYHASHn MSRs are writable
> > > > >     if and only if SGX_LC is set in the IA32_FEATURE_CONTROL MSR and the
> > > > >     IA32_FEATURE_CONTROL MSR is locked, otherwise they are read-only.
> > > > > 
> > > > >     For example, firmware can allow the OS to change the launch enclave
> > > > >     root key by setting IA32_FEATURE_CONTROL.SGX_LC, and thus give the
> > > > >     OS complete control over the enclaves it runs.  Alternatively,
> > > > >     firmware can clear IA32_FEATURE_CONTROL.SGX_LC to lock down the root
> > > > >     key and restrict the OS to running enclaves signed with the root key
> > > > >     or whitelisted/trusted by a launch enclave (which must be signed with
> > > > >     the root key).
> > > > > 
> > > > >     [1] SGX related bits in IA32_FEATURE_CONTROL cannot be set until SGX
> > > > >         is activated, e.g. by firmware.  SGX activation is triggered by
> > > > >         setting bit 0 in MSR 0x7a.  Until SGX is activated, the LE hash
> > > > >         MSRs are writable, e.g. to allow firmware to lock down the LE
> > > > >         root key with a non-Intel value.
> > > > Thanks I'll use this as a basis and move most of the crappy commit
> > > > message to the commit (with some editing) that defines the MSRs.
> > > Not sure after all if I'm following this.
> > > 
> > > IA32_FEATURE_CONTROL[17] contols whether the MSRs are writable or not
> > > after the feature control MSR is locked. SGX_LC means just that the
> > > CPU supports the launch configuration.
> > > 
> > > /Jarkko
> > I used this commit message with some minor editing in the commit that
> > defines the MSRs and squashed commits that define cpuid level 7 bits.
> > Can you peer check the commit messages? They are in the le branch.
> > 
> > /Jarkko
> 
> The commit defines FEATURE_CONTROL_SGX_LAUNCH_CONTROL_ENABLE in addition
> to the LE hash MSRs, which is why my suggestion referred to "SGX_LC" and
> not simply bit 17.  I used "SGX_LC" instead of the full name because
> that's what your original commit messaged used (though it was attached
> to the CPUID patch, thus all the confusion).
> 
> Anyways, I think the commit should have a blurb about defining bit 17,
> and then refer to SGX_LAUNCH_CONTROL_ENABLE (or some variation) rather
> than bit 17 when talking about its effects on SGX.

Not sure I'm following because this commit only defines the CPUID
feature bits. I think it woul be a bad idea to refer to bit 17 with
SGX_LC because CPUID chapter in the instruction reference uses the
same acronym.

/Jarkko
