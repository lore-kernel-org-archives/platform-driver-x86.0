From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH -next] platform/x86: dell-laptop: fix error return code in dell_init()
Date: Tue, 21 Nov 2017 16:23:51 +0200
Message-ID: <CAHp75VeO3N-Lf2ywsyc723vcd0pLED98HnSLqcRkgDpKk8xdGQ@mail.gmail.com>
References: <1510666813-173192-1-git-send-email-weiyongjun1@huawei.com> <22a08d901d38462d8a55f2b3b934e502@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:46568 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751658AbdKUOXx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2017 09:23:53 -0500
Received: by mail-qt0-f195.google.com with SMTP id r39so19309642qtr.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Nov 2017 06:23:52 -0800 (PST)
In-Reply-To: <22a08d901d38462d8a55f2b3b934e502@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Tue, Nov 14, 2017 at 4:38 PM,  <Mario.Limonciello@dell.com> wrote:
>> -----Original Message-----
>> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-x86-
>> owner@vger.kernel.org] On Behalf Of Wei Yongjun
>> Sent: Tuesday, November 14, 2017 7:40 AM
>> To: mjg59@srcf.ucam.org; pali.rohar@gmail.com; dvhart@infradead.org;
>> andy@infradead.org; Limonciello, Mario <Mario_Limonciello@Dell.com>
>> Cc: Wei Yongjun <weiyongjun1@huawei.com>; platform-driver-
>> x86@vger.kernel.org
>> Subject: [PATCH -next] platform/x86: dell-laptop: fix error return code in dell_init()
>>
>> Fix to return error code -ENOMEM from the kzalloc() error handling
>> case instead of 0, as done elsewhere in this function.
>>
>> Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM
>> calls")
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Pushed to my review and testing queue, thanks.

Shall we send this as material for -rc2 ?

>> ---
>>  drivers/platform/x86/dell-laptop.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
>> index c4903c5..0a8f359 100644
>> --- a/drivers/platform/x86/dell-laptop.c
>> +++ b/drivers/platform/x86/dell-laptop.c
>> @@ -2081,8 +2081,10 @@ static int __init dell_init(void)
>>       }
>>
>>       buffer = kzalloc(sizeof(struct calling_interface_buffer), GFP_KERNEL);
>> -     if (!buffer)
>> +     if (!buffer) {
>> +             ret = -ENOMEM;
>>               goto fail_buffer;
>> +     }
>>
>>       if (quirks && quirks->touchpad_led)
>>               touchpad_led_init(&platform_device->dev);
>
> Thanks.
>
> Acked-by: Mario Limonciello <mario.limonciello@dell.com>



-- 
With Best Regards,
Andy Shevchenko
