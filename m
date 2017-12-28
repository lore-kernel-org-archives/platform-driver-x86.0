From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH -next] platform/x86: dell-laptop: make some local
 functions static
Date: Thu, 28 Dec 2017 10:13:35 +0200
Message-ID: <CAHp75VeAuQuQ=7QUjzc7YRbbnN6V3GR46NybF8HW7iV3ic4HjQ@mail.gmail.com>
References: <1513994482-89811-1-git-send-email-weiyongjun1@huawei.com> <20171223083357.rkvvvlpwimndt7re@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:40038 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdL1INh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Dec 2017 03:13:37 -0500
Received: by mail-qk0-f193.google.com with SMTP id q14so36182088qke.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2017 00:13:36 -0800 (PST)
In-Reply-To: <20171223083357.rkvvvlpwimndt7re@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, quasisec@google.com, Platform Driver <platform-driver-x86@vger.kernel.org>

On Sat, Dec 23, 2017 at 10:33 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wr=
ote:
> On Saturday 23 December 2017 02:01:22 Wei Yongjun wrote:
>> Fixes the following sparse warnings:
>>
>> drivers/platform/x86/dell-laptop.c:289:6: warning:
>>  symbol 'dell_set_arguments' was not declared. Should it be static?
>> drivers/platform/x86/dell-laptop.c:298:5: warning:
>>  symbol 'dell_send_request' was not declared. Should it be static?
>>

Pushed to my review and testing queue, thanks!

>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>>  drivers/platform/x86/dell-laptop.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/d=
ell-laptop.c
>> index 629d960..a94936a 100644
>> --- a/drivers/platform/x86/dell-laptop.c
>> +++ b/drivers/platform/x86/dell-laptop.c
>> @@ -286,7 +286,7 @@ static int __init dmi_matched(const struct dmi_syste=
m_id *dmi)
>>       { }
>>  };
>>
>> -void dell_set_arguments(u32 arg0, u32 arg1, u32 arg2, u32 arg3)
>> +static void dell_set_arguments(u32 arg0, u32 arg1, u32 arg2, u32 arg3)
>>  {
>>       memset(buffer, 0, sizeof(struct calling_interface_buffer));
>>       buffer->input[0] =3D arg0;
>> @@ -295,7 +295,7 @@ void dell_set_arguments(u32 arg0, u32 arg1, u32 arg2=
, u32 arg3)
>>       buffer->input[3] =3D arg3;
>>  }
>>
>> -int dell_send_request(u16 class, u16 select)
>> +static int dell_send_request(u16 class, u16 select)
>>  {
>>       int ret;
>>
>
> This is correct change, add my:
>
> Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
With Best Regards,
Andy Shevchenko
