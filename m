From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: Sony-laptop: Adjustments for sony_nc_setup_rfkill()
Date: Sun, 5 Nov 2017 15:20:09 +0100
Message-ID: <2c1996c5-0833-dcd3-c747-62eca46a433d@users.sourceforge.net>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
 <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
 <CAHp75VfaWLSwzLpnWHj0sD9ZVVbSCi+ya_+PESXjU2FbHefE0Q@mail.gmail.com>
 <340e5426-a9ba-2193-2735-85e918773785@users.sourceforge.net>
 <CAHp75VeyLnKG43g0LiDqirkehH4bLK7x216NV1+C8Oktp7D5UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:56185 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750778AbdKEOUv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Nov 2017 09:20:51 -0500
In-Reply-To: <CAHp75VeyLnKG43g0LiDqirkehH4bLK7x216NV1+C8Oktp7D5UQ@mail.gmail.com>
Content-Language: en-GB
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Marco Chiappero <marco@absence.it>, Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy@infradead.org>

>> Do you find the following details useful for further clarification?
>>
>> text: -32
>> data: 0
>> bss:  0
> 
> ...but kernel is compiled with -O2 which,

Did you try to compare results for my update suggestion also with
the default build configuration?


> I suppose, will eliminate these repeats.

My build results did not fit to your expectations.


> So, the main question is "WHY" you are doing this change.
> 
> I didn't find any convinced explanation (yet?).

Do you find a reduction of 32 bytes for the object code not interesting
enough just by achieving such a small effect because of the replacement
of three function calls “rfkill_destroy” with goto statements?

Regards,
Markus
