From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Fix const confusion in intel-mid x86 platform drivers
Date: Thu, 28 Dec 2017 11:47:03 +0200
Message-ID: <CAHp75VcgT_B8Za82ywhKkCedPRNTdm5+uHYQHEO0EfBMeUkwzA@mail.gmail.com>
References: <20171222001443.2067-1-andi@firstfloor.org> <20171222020835.GA17014@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:36601 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751580AbdL1JrE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Dec 2017 04:47:04 -0500
Received: by mail-qt0-f196.google.com with SMTP id a16so50565313qtj.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2017 01:47:04 -0800 (PST)
In-Reply-To: <20171222020835.GA17014@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Bhumika Goyal <bhumirks@gmail.com>
Cc: Andi Kleen <andi@firstfloor.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org

On Fri, Dec 22, 2017 at 4:08 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Thu, Dec 21, 2017 at 04:14:43PM -0800, Andi Kleen wrote:
>> From: Andi Kleen <ak@linux.intel.com>
>>
>> const must be marked __initconst, not __initdata
>>
>
> Thanks Andi,
>
> This file should go through the x86 maintainers per the current MAINTAINERS
> file. So to avoid risk of duplication, added Thomas et al. to Cc.
>
> Thomas, we discussed moving more of arch/x86/platform to drivers/platform/x86.
> We have migrated pmc_atom already, but a lot remains. Do you want to pull
> patches like this in the interim, or should we move arch/x86/platform under
> our entry in MAINTAINERS now?
>
> Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>

I'm sorry, but the patch which brings const there have made already a
regression [1].

So, NAK for this either.

Unbelievable that the other patch had been send w/o me in Cc list and
blindly applied.

[1]: https://github.com/andy-shev/linux/issues/20

-- 
With Best Regards,
Andy Shevchenko
