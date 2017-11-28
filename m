From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 04/11] x86: define IA32_FEATUE_CONTROL.SGX_LC
Date: Tue, 28 Nov 2017 22:53:24 +0200
Message-ID: <20171128205324.pqojyfqbet3h7re4@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-5-jarkko.sakkinen@linux.intel.com>
 <1511889371.9392.58.camel@intel.com>
 <1511893683.9392.100.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:6492 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752211AbdK1UxZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 15:53:25 -0500
Content-Disposition: inline
In-Reply-To: <1511893683.9392.100.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@suse.de>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, Piotr Luc <piotr.luc@intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>

On Tue, Nov 28, 2017 at 10:28:03AM -0800, Sean Christopherson wrote:
> On Tue, 2017-11-28 at 09:16 -0800, Sean Christopherson wrote:
> > On Sat, 2017-11-25 at 21:29 +0200, Jarkko Sakkinen wrote:
> > > 
> > > When IA32_FEATURE_CONTROL.SGX_LC identifies that the root key for
> > > enclave signatures can be configured either by the OS or pre-boot
> > > firmware.
> > > 
> > > If this the case, IA32_SGXLEPUBKEYHASHn MSRs (0 < n < 4) can be used
> > > to
> > > set the SHA256 of the root key. IA32_FEATURE_CONTROL bit 17 controls
> > > whether the MSRs are writable by the OS. The pre-boot firmware can
> > > decided whether to  set this bit before setting
> > > IA32_FEATURE_CONTROL.LOCK.
> > The commit message (feature control bit) doesn't match the patch (CPUID
> > bit).
> 
> Also, assuming this message is destined for the commit that adds SGX_LC
> to feature control, I think it should first and foremost describe the
> hardware behavior.  The firmware vs OS interaction and use cases are
> valuable to document but IMO should come after the hardware description.
> 
> And though it's not documented in the SDM, I think it's worthwhile to
> describe the SGX activation sequence and its relationship with the SGX
> MSRs, e.g. the LE hash MSRs are writable prior to SGX activation.
> Without that information, it's unclear as to how the LE hash MSRs could
> be different than Intel's reset value.
> 
> So, maybe something like this?
> 
>     After SGX is activated[1] the IA32_SGXLEPUBKEYHASHn MSRs are writable
>     if and only if SGX_LC is set in the IA32_FEATURE_CONTROL MSR and the
>     IA32_FEATURE_CONTROL MSR is locked, otherwise they are read-only.
> 
>     For example, firmware can allow the OS to change the launch enclave
>     root key by setting IA32_FEATURE_CONTROL.SGX_LC, and thus give the
>     OS complete control over the enclaves it runs.  Alternatively,
>     firmware can clear IA32_FEATURE_CONTROL.SGX_LC to lock down the root
>     key and restrict the OS to running enclaves signed with the root key
>     or whitelisted/trusted by a launch enclave (which must be signed with
>     the root key).
> 
>     [1] SGX related bits in IA32_FEATURE_CONTROL cannot be set until SGX
>         is activated, e.g. by firmware.  SGX activation is triggered by
>         setting bit 0 in MSR 0x7a.  Until SGX is activated, the LE hash
>         MSRs are writable, e.g. to allow firmware to lock down the LE
>         root key with a non-Intel value.

Thanks I'll use this as a basis and move most of the crappy commit
message to the commit (with some editing) that defines the MSRs.

/Jarkko
