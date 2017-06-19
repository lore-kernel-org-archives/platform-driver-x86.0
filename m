From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2] platform/x86: dell-laptop: Fix bogus keyboard
 backlight sysfs interface
Date: Mon, 19 Jun 2017 16:39:14 +0800
Message-ID: <CAAd53p4H-4hhCo5iyYgSu9jL=jGqK2ztUtNMXnPYbpH8LySV7Q@mail.gmail.com>
References: <20170619073629.14239-1-kai.heng.feng@canonical.com> <20170619075742.GA32387@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170619075742.GA32387@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: andy@infradead.org, Matthew Garrett <mjg59@srcf.ucam.org>, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 19, 2017 at 3:57 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Monday 19 June 2017 15:36:29 Kai-Heng Feng wrote:
>> Dell Latitude 3160 does not have keyboard backlight, but there is a
>> sysfs interface for it, which does nothing at all.
>>
>> KBD_LED_ON_TOKEN is the only token can be found. Since it doesn't have
>
> *ON* really?
>
>> KBD_LED_OFF_TOKEN or KBD_LED_AUTO_*_TOKEN, it should be safe to assume i=
t
>> does not support keyboard backlight.
>>
>> Models which do not use SMBIOS to control keyboard backlight, also have
>> this issue. Brightness level is 0 on these models. Verified on Dell
>> Inspiron 3565.
>>
>> Reports keyboard backlight is supported only when tokens other than
>> KBD_LED_ON_TOKEN can be found, or brightness level is not 0.
>>
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>>
>> v2:
>> The only token can be found is actually KBD_LED_ON_TOKEN, which is BIT(5=
),
>> instead of KBD_LED_OFF_TOKEN. Change commit log accordingly.
>>
>> Use token bit to make the intention more clear.
>> Also consider kbd_mode_levels_count and kbd_info.levels, suggested by
>> Pali Roh=C3=A1r.
>>
>> Use XOR to simplify the bitmask comparison, suggested by
>> Andy Shevchenko.
>>
>>  drivers/platform/x86/dell-laptop.c | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/d=
ell-laptop.c
>> index ec202094bd50..4b21fc982cb0 100644
>> --- a/drivers/platform/x86/dell-laptop.c
>> +++ b/drivers/platform/x86/dell-laptop.c
>> @@ -1148,6 +1148,15 @@ static const int kbd_tokens[] =3D {
>>       KBD_LED_ON_TOKEN,
>>  };
>>
>> +enum kbd_led_token_bit {
>> +     KBD_LED_TOKEN_BIT_OFF =3D 0,
>> +     KBD_LED_TOKEN_BIT_AUTO_25,
>> +     KBD_LED_TOKEN_BIT_AUTO_50,
>> +     KBD_LED_TOKEN_BIT_AUTO_75,
>> +     KBD_LED_TOKEN_BIT_AUTO_100,
>> +     KBD_LED_TOKEN_BIT_ON,
>> +};
>> +
>>  static u16 kbd_token_bits;
>>
>>  static struct kbd_info kbd_info;
>> @@ -1510,7 +1519,12 @@ static void kbd_init(void)
>>       ret =3D kbd_init_info();
>>       kbd_init_tokens();
>>
>> -     if (kbd_token_bits !=3D 0 || ret =3D=3D 0)
>> +     /*
>> +      * If brightness level is 0, or KBD_LED_ON_TOKEN is the only token=
,
>> +      * consider there is no keyboard backlight.
>> +      */
>> +     if ((ret =3D=3D 0 && (kbd_info.levels || kbd_mode_levels_count)) |=
|
>> +         kbd_token_bits ^ BIT(KBD_LED_TOKEN_BIT_ON))
>
> So in case there would be only *OFF* token then interface is exported
> too... This does not seems to be good idea.
>
> If there is machine for which firmware provides only *ON* token, then I
> think we should presence for at least two tokens.

So I can use kbd_get_valid_token_counts() >=3D 2 here.

>
> And similarly kbd_mode_levels_count needs to be checked that is at least
> two (as "off" is in count).

So it should be kbd_mode_levels_count >=3D 2.
The same rule should also apply to kbd_info.levels, right?

>
>>               kbd_led_present =3D true;
>>  }
>>
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
