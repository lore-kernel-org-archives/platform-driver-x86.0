From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Wed, 15 Nov 2017 12:54:12 +0100
Message-ID: <20171115115412.uqdy3y74w4sdnzlo@hirez.programming.kicks-ass.net>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171114083647.uxlaov56s2xw3pua@pd.tnic>
 <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:43160 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752126AbdKOLyW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Nov 2017 06:54:22 -0500
Content-Disposition: inline
In-Reply-To: <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Borislav Petkov <bp@alien8.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Tue, Nov 14, 2017 at 10:49:48PM +0200, Jarkko Sakkinen wrote:
> In these cases IA32_FEATURE_CONTROL[17] would be zeroed before locking
> the feature control, which would mean that the kernel could not write
> new values with wrmsr for the root key hash.

> The question is whether we want to allow this or not. If the answer is
> no, a check can be added to the driver initialization code whether 17 is
> set, and if not, it driver would fail to initialize.

That has my vote; I would not trust a firmware/BIOS key.
