From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Tue, 14 Nov 2017 22:49:48 +0200
Message-ID: <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171114083647.uxlaov56s2xw3pua@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:53049 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751197AbdKNUtw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 15:49:52 -0500
Content-Disposition: inline
In-Reply-To: <20171114083647.uxlaov56s2xw3pua@pd.tnic>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 14, 2017 at 09:36:47AM +0100, Borislav Petkov wrote:
> > +* **IA32_FEATURE_CONTROL[0]**: locks down the feature control register
> > +* **IA32_FEATURE_CONTROL[17]**: allow runtime reconfiguration of
> > +  IA32_SGXLEPUBKEYHASHn MSRs that define MRSIGNER hash for the launch
> > +  enclave. Essentially they define a signing key that does not require
> > +  EINITTOKEN to be let run.
> [SNIP]
> 
> What does that mean exactly?
> 
> OEM vendor BIOS can control how many enclaves user can launch and what
> signing key is loaded and lock down the feature control register so that
> no other signing keys are loaded?
> 
> Or am I misreading this?

Pre-boot firmware could potentially configure the root key hash for the
enclave that signs launch tokens for other enclaves i.e. the launch
enclave that is built and signed during the kbuild.

VMM/Hypervisor could potentially simulate such enviroment for guests.

In these cases IA32_FEATURE_CONTROL[17] would be zeroed before locking
the feature control, which would mean that the kernel could not write
new values with wrmsr for the root key hash.

You could use this to write policy inside the LE. The current LE is
really simple "pass-through everything" but it could be refined to be
something more non-trivial.

The question is whether we want to allow this or not. If the answer is
no, a check can be added to the driver initialization code whether 17 is
set, and if not, it driver would fail to initialize.

I'm not too dilated to any direction concerning this question. I just
wrote a driver that is robust. This is where I need your feedback to do
the right thing.

> -- 
> Regards/Gruss,
>     Boris.

PS. I'll add a proper commit message. Sorry for not doing that before.

/Jarkko
