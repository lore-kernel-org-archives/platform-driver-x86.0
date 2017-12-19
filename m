From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v9 7/7] intel_sgx: in-kernel launch enclave
Date: Tue, 19 Dec 2017 17:36:34 +0200
Message-ID: <CAHp75VdxpqS=8DFYMhSAs6Q6myJKvx_iBW3zEvnsHhjrzpztNQ@mail.gmail.com>
References: <20171216162200.20243-1-jarkko.sakkinen@linux.intel.com>
 <20171216162200.20243-8-jarkko.sakkinen@linux.intel.com> <20171219135928.ospmfhabavac5gnu@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f180.google.com ([209.85.216.180]:34929 "EHLO
        mail-qt0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750916AbdLSPgf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 10:36:35 -0500
In-Reply-To: <20171219135928.ospmfhabavac5gnu@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, Platform Driver <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tue, Dec 19, 2017 at 3:59 PM, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:

> I streamlined the IPC quite a bit. See the attached patch. Can be
> applied on top of this patch.

Sorry, I didn't look into actual code, but WRT the attached patch,
wouldn't be better / possible to use
pr_fmt() to print "intel_sgx:" prefix for all pr_*() ?

-- 
With Best Regards,
Andy Shevchenko
