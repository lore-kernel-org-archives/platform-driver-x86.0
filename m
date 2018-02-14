From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] platform/x86: dell-laptop: fix kbd_get_state's request value
Date: Wed, 14 Feb 2018 21:44:11 +0200
Message-ID: <CAHp75VdBP0hooOB=gN6ZVcqm3NyxaDV_rVbL=jwfM_VGak61dw@mail.gmail.com>
References: <20180213204343.GA6586@laszlth> <20180213212612.u7b26krt47n4zpp6@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f180.google.com ([209.85.216.180]:38722 "EHLO
        mail-qt0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1162994AbeBNToM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Feb 2018 14:44:12 -0500
In-Reply-To: <20180213212612.u7b26krt47n4zpp6@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Laszlo Toth <laszlth@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Stable <stable@vger.kernel.org>

On Tue, Feb 13, 2018 at 11:26 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wr=
ote:
> On Tuesday 13 February 2018 21:43:43 Laszlo Toth wrote:
>> Commit 9862b43624a5 ("platform/x86: dell-laptop: Allocate buffer on heap
>> rather than globally")
>> broke one request, changed it back to the original value.
>>
>> Tested on a Dell E6540, backlight came back.
>>

Pushed to my review and testing queue, thanks!

>> Fixes: 9862b43624a5 ("platform/x86: dell-laptop: Allocate buffer on heap=
 rather than globally")
>> Signed-off-by: Laszlo Toth <laszlth@gmail.com>
>> ---
>> Changes in v2:
>>  - split the fix and the function merge part
>> Changes in v3:
>>  - added fixes tag
>>
>>  drivers/platform/x86/dell-laptop.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/d=
ell-laptop.c
>> index 2a68f59..a37cff9 100644
>> --- a/drivers/platform/x86/dell-laptop.c
>> +++ b/drivers/platform/x86/dell-laptop.c
>> @@ -1279,7 +1279,7 @@ static int kbd_get_state(struct kbd_state *state)
>>       struct calling_interface_buffer buffer;
>>       int ret;
>>
>> -     dell_fill_request(&buffer, 0, 0, 0, 0);
>> +     dell_fill_request(&buffer, 0x1, 0, 0, 0);
>>       ret =3D dell_send_request(&buffer,
>>                               CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT)=
;
>>       if (ret)
>
> Looks better!
>
> Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
With Best Regards,
Andy Shevchenko
