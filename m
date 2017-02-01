From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 1/1] asus-wireless: Use the correct HSWC parameter for
 each HID
Date: Wed, 1 Feb 2017 07:20:03 -0500
Message-ID: <CA+A7VXWjL4GZORhfELJroxR3-CRTrOP8uBUgqZYyjzU0KwMYiw@mail.gmail.com>
References: <20170126150031.11840-1-jprvita@endlessm.com> <20170126150031.11840-2-jprvita@endlessm.com>
 <CAHp75VfFGziE4iENsJqy8-HESK=HA8EYdGqQQ26EBqC3yv0KFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yb0-f195.google.com ([209.85.213.195]:36367 "EHLO
        mail-yb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752005AbdBAMUp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Feb 2017 07:20:45 -0500
In-Reply-To: <CAHp75VfFGziE4iENsJqy8-HESK=HA8EYdGqQQ26EBqC3yv0KFg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 27 January 2017 at 10:26, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> On Thu, Jan 26, 2017 at 5:00 PM, Jo=C3=A3o Paulo Rechi Vita
> <jprvita@gmail.com> wrote:
>> Some Asus machines use 0x4/0x5 as their LED on/off values, while others =
use
>> 0x0/0x1, as shown in the DSDT exerpts below (note "Arg0 =3D=3D 0x02", us=
ed to get
>
> excerpts
>

Thanks for catching that.

>> the LED status). Luckly it seems this behavior is tied to different HIDs=
, after
>
> Luckily
>

Ditto.

>> looking at 44 DSDTs from different Asus models.
>
>
>
>>
>> Another small difference (not shown here) is that a few machines call GW=
BL
>> instead of OWGS, and SWBL instead of OWGD. That does not seem to make a
>> difference for asus-wireless, and is a reason to not try to call these m=
ethods
>> directly.
>>
>> Device (ASHS)                       | Device (ASHS)
>> {                                   | {
>>     Name (_HID, "ATK4002")          |     Name (_HID, "ATK4001")
>>     Method (HSWC, 1, Serialized)    |     Method (HSWC, 1, Serialized)
>>     {                               |     {
>>         If ((Arg0 < 0x02))          |         If ((Arg0 < 0x02))
>>         {                           |         {
>>             OWGD (Arg0)             |             OWGD (Arg0)
>>             Return (One)            |             Return (One)
>>         }                           |         }
>>         If ((Arg0 =3D=3D 0x02))         |
>>         {                           |         If ((Arg0 =3D=3D 0x02))
>>             Local0 =3D OWGS ()        |         {
>>             If (Local0)             |             Return (OWGS ())
>>             {                       |         }
>>                     Return (0x05)   |
>>             }                       |         If ((Arg0 =3D=3D 0x03))
>>             Else                    |         {
>>             {                       |             Return (0xFF)
>>                     Return (0x04)   |         }
>>             }                       |
>>         }                           |         If ((Arg0 =3D=3D 0x80))
>>         If ((Arg0 =3D=3D 0x03))         |         {
>>         {                           |            Return (One)
>>             Return (0xFF)           |         }
>>         }                           |     }
>>         If ((Arg0 =3D=3D 0x04))         |     Method (_STA, 0, NotSerial=
ized)
>>         {                           |     {
>>             OWGD (Zero)             |         If ((MSOS () >=3D OSW8))
>>             Return (One)            |         {
>>         }                           |             Return (0x0F)
>>         If ((Arg0 =3D=3D 0x05))         |         }
>>         {                           |         Else
>>             OWGD (One)              |         {
>>             Return (One)            |             Return (Zero)
>>         }                           |         }
>>         If ((Arg0 =3D=3D 0x80))         |     }
>>         {                           | }
>>             Return (One)            |
>>         }                           |
>>     }                               |
>>     Method (_STA, 0, NotSerialized) |
>>     {                               |
>>         If ((MSOS () >=3D OSW8))      |
>>         {                           |
>>             Return (0x0F)           |
>>         }                           |
>>         Else                        |
>>         {                           |
>>             Return (Zero)           |
>>         }                           |
>>     }                               |
>> }                                   |
>>
>> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
>> ---
>>  drivers/platform/x86/asus-wireless.c | 46 ++++++++++++++++++++++++++---=
-------
>>  1 file changed, 33 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86=
/asus-wireless.c
>> index c9b5ac152cf1..5a238fad35fb 100644
>> --- a/drivers/platform/x86/asus-wireless.c
>> +++ b/drivers/platform/x86/asus-wireless.c
>> @@ -18,18 +18,35 @@
>>  #include <linux/leds.h>
>>
>>  #define ASUS_WIRELESS_LED_STATUS 0x2
>> -#define ASUS_WIRELESS_LED_OFF 0x4
>> -#define ASUS_WIRELESS_LED_ON 0x5
>> +
>> +struct hswc_params {
>> +       u8 on;
>> +       u8 off;
>> +};
>>
>>  struct asus_wireless_data {
>>         struct input_dev *idev;
>>         struct acpi_device *adev;
>> +       const struct hswc_params *hswc_params;
>>         struct workqueue_struct *wq;
>>         struct work_struct led_work;
>>         struct led_classdev led;
>>         int led_state;
>>  };
>>
>> +/* LED ON/OFF values for different HIDs. Please update when adding new =
HIDs. */
>> +static const struct hswc_params id_params[] =3D {
>> +       { 0x0, 0x1 },
>> +       { 0x5, 0x4 },
>> +};
>
> Add status here as well.

Not really necessary, but who knows if that may also change in the
future. I'm fixing it for the next revision.

> Split to one struct per set.
>
>> +
>> +static const struct acpi_device_id device_ids[] =3D {
>> +       {"ATK4001", 0},
>> +       {"ATK4002", 0},
>
> ...and use it as a parameter here.
>

I'm not exactly sure how to do that, as driver_data is a
kernel_ulong_t. Can you please elaborate a bit more?

Thanks for the review,
