From: Bin Li <libin.charles@gmail.com>
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: Add IdeaPad V310-14ISK
 to no_hw_rfkill
Date: Fri, 7 Jul 2017 00:01:45 +0800
Message-ID: <CAGBH1r4zhcGNDZweHFms5Kfz2ZNrK1cA+TeA+42dOE8aRkJM1A@mail.gmail.com>
References: <1499332949-8732-1-git-send-email-bin.li@canonical.com>
 <CAHp75VcGQ9ULH_6y1nwi=MdP3Z4GjPv+7e1U02SrnbMvEb06DQ@mail.gmail.com> <CAHp75VegYPSp8Ai7LVOZQzicQdLckvtTGyH3SHikVwhhHqOHdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:35856 "EHLO
        mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751653AbdGFQBr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Jul 2017 12:01:47 -0400
Received: by mail-qk0-f172.google.com with SMTP id p21so6044048qke.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Jul 2017 09:01:46 -0700 (PDT)
In-Reply-To: <CAHp75VegYPSp8Ai7LVOZQzicQdLckvtTGyH3SHikVwhhHqOHdA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bin Li <bin.li@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

Andy,

 Yes, I also found it in mailing list, thanks a lot!
Sincerely Yours,

Bin Li (=E6=9D=8E=E5=BD=AC)

http://www.bjgug.org/


On Thu, Jul 6, 2017 at 7:50 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jul 6, 2017 at 2:48 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Thu, Jul 6, 2017 at 12:22 PM, Bin Li <bin.li@canonical.com> wrote:
>>> Like other Lenovo models the IdeaPad V310-14ISK does not have an hw
>>> rfkill switch. This results in hard-blocked radios after boot, resultin=
g
>>> in always blocked radios rendering them unusable.
>>>
>>> Add the IdeaPad V310-14ISK to the no_hw_rfkill DMI list and allows usin=
g
>>> the built-in radios.
>>
>> Pushed to testing, thanks!
>
> Ah, sorry, have to remove it. We already have a record done by commit
> 710c059c248a
> ("platform/x86: ideapad-laptop: Add several models to no_hw_rfkill")
>
>
> --
> With Best Regards,
> Andy Shevchenko
