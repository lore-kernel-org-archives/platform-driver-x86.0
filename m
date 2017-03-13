From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 0/4] fujitsu_init() cleanup
Date: Mon, 13 Mar 2017 18:07:03 +0200
Message-ID: <CAHp75VfvTPFWrpxjb6kw=aogm2_y-VH=nWu0Q36emrc8q7YpaQ@mail.gmail.com>
References: <20170310105036.26899-1-kernel@kempniu.pl> <20170310110200.GC21396@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:33656 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752561AbdCMQHG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2017 12:07:06 -0400
In-Reply-To: <20170310110200.GC21396@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Mar 10, 2017 at 1:02 PM, Jonathan Woithe <jwoithe@just42.net> wrote:
> On Fri, Mar 10, 2017 at 11:50:32AM +0100, Micha?? K??pie?? wrote:
>> These patches should make fujitsu_init() a bit more palatable.  No
>> changes are made to platform device code yet, for clarity these will be
>> posted in a separate series after this one gets applied.

> As noted, this V4 patch series is identical to V3 except for the backlight
> device name fix.  No regressions are evident on the hardware I have (S7020).
> I am therefore happy to see this series applied.  It represents a further
> worthwhile improvement to the fujitsu-laptop driver which will facilitate
> future maintenance and provide a more consistent basis for upcoming
> improvements.
>
> Tested-by: Jonathan Woithe <jwoithe@just42.net>
> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Pushed to testing, thanks!

-- 
With Best Regards,
Andy Shevchenko
