From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Tue, 21 Nov 2017 13:47:39 +0100
Message-ID: <20171121124739.vszgiz37bhzjfnug@pd.tnic>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171114083647.uxlaov56s2xw3pua@pd.tnic>
 <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
 <20171115115412.uqdy3y74w4sdnzlo@hirez.programming.kicks-ass.net>
 <20171120224623.hpx7zcorrwo4ivhh@linux.intel.com>
 <20171121123854.rv3uxl7zndh3kr2z@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:38876 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751830AbdKUMuG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2017 07:50:06 -0500
Content-Disposition: inline
In-Reply-To: <20171121123854.rv3uxl7zndh3kr2z@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Tue, Nov 21, 2017 at 02:38:54PM +0200, Jarkko Sakkinen wrote:
>   Try to start LE. If it doesn't start i.e. is signed with a different
>   root key than the one inside MSRs, then fail the initialization.

But what if the one inside the MSRs is from the fw vendor and I don't
trust it?

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
