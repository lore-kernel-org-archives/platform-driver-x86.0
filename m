From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: Add IdeaPad V310-14ISK
 to no_hw_rfkill
Date: Thu, 6 Jul 2017 14:50:44 +0300
Message-ID: <CAHp75VegYPSp8Ai7LVOZQzicQdLckvtTGyH3SHikVwhhHqOHdA@mail.gmail.com>
References: <1499332949-8732-1-git-send-email-bin.li@canonical.com> <CAHp75VcGQ9ULH_6y1nwi=MdP3Z4GjPv+7e1U02SrnbMvEb06DQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:34409 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751994AbdGFLup (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Jul 2017 07:50:45 -0400
Received: by mail-qk0-f175.google.com with SMTP id d78so13165586qkb.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Jul 2017 04:50:45 -0700 (PDT)
In-Reply-To: <CAHp75VcGQ9ULH_6y1nwi=MdP3Z4GjPv+7e1U02SrnbMvEb06DQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bin Li <bin.li@canonical.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, libin.charles@gmail.com

On Thu, Jul 6, 2017 at 2:48 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jul 6, 2017 at 12:22 PM, Bin Li <bin.li@canonical.com> wrote:
>> Like other Lenovo models the IdeaPad V310-14ISK does not have an hw
>> rfkill switch. This results in hard-blocked radios after boot, resulting
>> in always blocked radios rendering them unusable.
>>
>> Add the IdeaPad V310-14ISK to the no_hw_rfkill DMI list and allows using
>> the built-in radios.
>
> Pushed to testing, thanks!

Ah, sorry, have to remove it. We already have a record done by commit
710c059c248a
("platform/x86: ideapad-laptop: Add several models to no_hw_rfkill")


-- 
With Best Regards,
Andy Shevchenko
