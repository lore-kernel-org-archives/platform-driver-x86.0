From: Maarten Maathuis <madman2003@gmail.com>
Subject: Re: [PATCH] platform/x86/intel-vbtn: add volume up and down
Date: Tue, 25 Apr 2017 07:01:11 +0200
Message-ID: <CAGZ4FEQa2cq9xVd4=7X1V-oTGduDYaa0U-hOfQopv4AY-dgkTg@mail.gmail.com>
References: <20170424212908.10055-1-madman2003@shikahr.net>
 <CAHp75VeWJt0uVbKg_8_GBP3-JUQ3H0BLzBjFeyqcRfekK9VjNA@mail.gmail.com>
 <CAGZ4FEQab4++YbomLh1GP-cbEKrFy3WPbb=3Cc1bt1MnVWQ0mQ@mail.gmail.com> <CAFv23Q=RihxVZCvvpqdWT5R2NPZAwH3p1fhdS6QLbG2OH3W9BA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35032 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S972006AbdDYFBM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2017 01:01:12 -0400
In-Reply-To: <CAFv23Q=RihxVZCvvpqdWT5R2NPZAwH3p1fhdS6QLbG2OH3W9BA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maarten Maathuis <madman2003@shikahr.net>

On Tue, Apr 25, 2017 at 4:43 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> According the spec. I have, the values are correct.
> Please merge it, thanks.
>

Is there a reason the whole spec isn't implemented?
Is it under NDA?

> 2017-04-25 5:41 GMT+08:00 Maarten Maathuis <madman2003@gmail.com>:
>> On Mon, Apr 24, 2017 at 11:37 PM, Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Tue, Apr 25, 2017 at 12:29 AM, Maarten Maathuis <madman2003@gmail.com> wrote:
>>>> Tested on HP Elite X2 1012 G1.
>>>> Matches event report of Lenovo Helix 2
>>>> (https://www.spinics.net/lists/ibm-acpi-devel/msg03982.html).
>>>>
>>>
>>> Much better!
>>>
>>>> V2: Fix indent and add sign-off
>>>
>>> Usually this line goes after --- (body delimiter).
>>> No need to resend this time. I would wait a bit for actual
>>> author/driver maintainer to comment. Otherwise patch looks good enough
>>> to me.
>>
>> The intent is not have this in the commit message?
>> I'll keep an eye out if i can place it below "---" next time.
>> Although i suspect the message would end in the actual code diff,
>> which seems odd.
>>
>>>
>>>>
>>>> Signed-off-by: Maarten Maathuis <madman2003@shikahr.net>
>>>> ---
>>>>  drivers/platform/x86/intel-vbtn.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
>>>> index 554e82ebe83c..1616cb9c4ae5 100644
>>>> --- a/drivers/platform/x86/intel-vbtn.c
>>>> +++ b/drivers/platform/x86/intel-vbtn.c
>>>> @@ -37,6 +37,10 @@ static const struct acpi_device_id intel_vbtn_ids[] = {
>>>>  static const struct key_entry intel_vbtn_keymap[] = {
>>>>         { KE_IGNORE, 0xC0, { KEY_POWER } },     /* power key press */
>>>>         { KE_KEY, 0xC1, { KEY_POWER } },        /* power key release */
>>>> +       { KE_KEY, 0xC4, { KEY_VOLUMEUP} },      /* volume-up key press */
>>>> +       { KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },  /* volume-up key release */
>>>> +       { KE_KEY, 0xC6, { KEY_VOLUMEDOWN } },   /* volume-down key press */
>>>> +       { KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },        /* volume-down key release */
>>>>         { KE_END },
>>>>  };
>>>>
>>>> --
>>>> 2.12.2
>>>>
>>>
>>>
>>>
>>> --
>>> With Best Regards,
>>> Andy Shevchenko
>>
>>
>>
>> --
>> Far away from the primal instinct, the song seems to fade away, the
>> river get wider between your thoughts and the things we do and say.



-- 
Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
