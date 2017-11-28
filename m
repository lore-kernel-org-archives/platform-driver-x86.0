From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 05/11] x86: add SGX MSRs to msr-index.h
Date: Tue, 28 Nov 2017 22:48:22 +0200
Message-ID: <20171128204822.fzleh5glazaoeqhf@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-6-jarkko.sakkinen@linux.intel.com>
 <1511889768.9392.63.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:23025 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752362AbdK1UsX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 15:48:23 -0500
Content-Disposition: inline
In-Reply-To: <1511889768.9392.63.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Haim Cohen <haim.cohen@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Len Brown <len.brown@intel.com>, Kyle Huey <me@kylehuey.com>, Tom Lendacky <thomas.lendacky@amd.com>, Kan Liang <Kan.liang@intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>

On Tue, Nov 28, 2017 at 09:22:48AM -0800, Sean Christopherson wrote:
> On Sat, 2017-11-25 at 21:29 +0200, Jarkko Sakkinen wrote:
> > From: Haim Cohen <haim.cohen@intel.com>
> > 
> > These MSRs hold the SHA256 checksum of the currently configured root
> > key for enclave signatures.
> 
> The commit message doesn't talk about the launch control bit in the
> feature control MSR.

Correct, would make sense to refine this further.

/Jarkko
