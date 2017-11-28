From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 03/11] x86: define IA32_FEATURE_CONTROL.SGX_ENABLE
Date: Tue, 28 Nov 2017 22:47:34 +0200
Message-ID: <20171128204734.gcz2y3pold4nyhxe@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-4-jarkko.sakkinen@linux.intel.com>
 <1511889198.9392.56.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:53783 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753102AbdK1Urf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 15:47:35 -0500
Content-Disposition: inline
In-Reply-To: <1511889198.9392.56.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Len Brown <len.brown@intel.com>, Kyle Huey <me@kylehuey.com>, Haim Cohen <haim.cohen@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, Jim Mattson <jmattson@google.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>

On Tue, Nov 28, 2017 at 09:13:18AM -0800, Sean Christopherson wrote:
> On Sat, 2017-11-25 at 21:29 +0200, Jarkko Sakkinen wrote:
> > From: Sean Christopherson <sean.j.christopherson@intel.com>
> > 
> > When IA32_FEATURE_CONTROL.SGX_ENABLE and IA32_FEATURE_CONTROL.LOCK are
> > set by the pre-boot firmware, SGX is usable by the OS.
> 
> This implies that only pre-boot firmware can write feature control, which is not
> true.  What about:
> 
>     SGX instructions (ENCLS and ENCLU) are usable if and only if SGX_ENABLE is
>     set in the IA32_FEATURE_CONTROL MSR and said MSR is locked.

You are correct, thanks. I'll fix this for v7.

/Jarkko
