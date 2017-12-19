From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v9 7/7] intel_sgx: in-kernel launch enclave
Date: Wed, 20 Dec 2017 01:57:48 +0200
Message-ID: <1513727868.2206.33.camel@linux.intel.com>
References: <20171216162200.20243-1-jarkko.sakkinen@linux.intel.com>
         <20171216162200.20243-8-jarkko.sakkinen@linux.intel.com>
         <20171219135928.ospmfhabavac5gnu@linux.intel.com>
         <CAHp75VdxpqS=8DFYMhSAs6Q6myJKvx_iBW3zEvnsHhjrzpztNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:45479 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753041AbdLSX54 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 18:57:56 -0500
In-Reply-To: <CAHp75VdxpqS=8DFYMhSAs6Q6myJKvx_iBW3zEvnsHhjrzpztNQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: intel-sgx-kernel-dev@lists.01.org, Platform Driver <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tue, 2017-12-19 at 17:36 +0200, Andy Shevchenko wrote:
> On Tue, Dec 19, 2017 at 3:59 PM, Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> 
> > I streamlined the IPC quite a bit. See the attached patch. Can be
> > applied on top of this patch.
> 
> Sorry, I didn't look into actual code, but WRT the attached patch,
> wouldn't be better / possible to use
> pr_fmt() to print "intel_sgx:" prefix for all pr_*() ?

Would make much sense. I can do this. In any case Ineed to update this
series at least once more for the copyright platters. Thanks for the
comment.

Now that the series does not add anything intrusive (namely pipe exports
or use a fragile AES implementation) I would propose to pull the current
series as a single platform driver and move relevant code under arch/x86
in subsequent series.

I've taken great of making sure that it would be doable to move code
later on when I first decided to make it as a plaform driver. My
thinking has been that encapsulating the codebase to a driver would be
the least intrusive way to mainline the first version of the SGX support
for the Linux kernel especially when there isn't publicly available HW
to test it yet with launch control that makes sense for Linux.

I can write a detailed description to the documentation how the 
implementation works in order to help to make the right decision for
subsequent series. 

/Jarkko
