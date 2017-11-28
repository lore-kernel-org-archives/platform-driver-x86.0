From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 04/11] x86: define IA32_FEATUE_CONTROL.SGX_LC
Date: Tue, 28 Nov 2017 22:51:41 +0200
Message-ID: <20171128205141.vm6v2qvbiboptpeg@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-5-jarkko.sakkinen@linux.intel.com>
 <1511889371.9392.58.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:27981 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751822AbdK1Uvm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 15:51:42 -0500
Content-Disposition: inline
In-Reply-To: <1511889371.9392.58.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@suse.de>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, Piotr Luc <piotr.luc@intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>

On Tue, Nov 28, 2017 at 09:16:11AM -0800, Sean Christopherson wrote:
> On Sat, 2017-11-25 at 21:29 +0200, Jarkko Sakkinen wrote:
> > When IA32_FEATURE_CONTROL.SGX_LC identifies that the root key for
> > enclave signatures can be configured either by the OS or pre-boot
> > firmware.
> > 
> > If this the case, IA32_SGXLEPUBKEYHASHn MSRs (0 < n < 4) can be used
> > to
> > set the SHA256 of the root key. IA32_FEATURE_CONTROL bit 17 controls
> > whether the MSRs are writable by the OS. The pre-boot firmware can
> > decided whether to  set this bit before setting
> > IA32_FEATURE_CONTROL.LOCK.
> 
> The commit message (feature control bit) doesn't match the patch (CPUID
> bit).

Oops. I'll move most of this the patch that defines the MSRs. I think
the latter part was meant for that I had been awake for too long time
:-) I'll fix these commit messages with extra care for v7. Thank you.

/Jarkko
