From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: try to set als by default
Date: Tue, 25 Apr 2017 22:26:33 +0300
Message-ID: <CAHp75Ve4Xh=JO3xqm1CtYuQJwU4V_fM95CRw3vknnJyK=CM+LQ@mail.gmail.com>
References: <20170421152434.3834-1-linux@rempel-privat.de> <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>
 <cf184d2b-7736-3342-3a17-21ca998b8e0e@rempel-privat.de> <CAHp75Vcnm3h9D5OPFeoKyCr2VJP4kK+kbueW8eNuSs2U7Ttqsg@mail.gmail.com>
 <c8e5d303-7a46-9ce3-c567-09bc43be5dc8@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:34237 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1432364AbdDYT0e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2017 15:26:34 -0400
Received: by mail-qt0-f176.google.com with SMTP id c45so148674989qtb.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2017 12:26:34 -0700 (PDT)
In-Reply-To: <c8e5d303-7a46-9ce3-c567-09bc43be5dc8@rempel-privat.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Tue, Apr 25, 2017 at 9:42 PM, Oleksij Rempel <linux@rempel-privat.de> wrote:
> Am 25.04.2017 um 14:25 schrieb Andy Shevchenko:
>> On Sat, Apr 22, 2017 at 9:55 AM, Oleksij Rempel <linux@rempel-privat.de> wrote:
>>> Am 21.04.2017 um 21:06 schrieb Andy Shevchenko:
>>>> On Fri, Apr 21, 2017 at 6:24 PM, Oleksij Rempel <linux@rempel-privat.de> wrote:
>>>>> some laptops, for example ASUS UX330UAK, have brocken als_get function
>>>>> but working als_set funktion. In this case, ALS will stay turned off.
>>
>>>>> This patch will do the same. Turn ALS on by default.
>>>>
>>>> It would be good to see if there is no regression added.
>>>
>>> I just send this email to ASUS support, may be some thing will happen:
>>> https://pastebin.com/TLjbbNMc
>>
>> Okay, let's wait a bit and if there no answer submit v2 based on review.
>
> Oh well, the answer is like usual. We support Windows 10, make shit and
> bla bla...

I see.

> I'll send v2 ASAP.

One more comment. I think it would be better to make it as a quirk and
call only on certain platforms (based by DMI / etc).

-- 
With Best Regards,
Andy Shevchenko
