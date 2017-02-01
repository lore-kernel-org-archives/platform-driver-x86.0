From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 7/8] asus-wireless: Export ids list
Date: Wed, 1 Feb 2017 07:23:45 -0500
Message-ID: <CA+A7VXU3zNm2qHaM2hnaJ0GamrL5c0zCKC-MLgPZ+9M_DyKKkQ@mail.gmail.com>
References: <20170126153013.12753-1-jprvita@endlessm.com> <20170126153013.12753-8-jprvita@endlessm.com>
 <CAHp75Vf229bhmXD4zMydXCSSm4HEhOa9Y5S1trpQUfWnwq85MQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:33023 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751346AbdBAMY1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Feb 2017 07:24:27 -0500
In-Reply-To: <CAHp75Vf229bhmXD4zMydXCSSm4HEhOa9Y5S1trpQUfWnwq85MQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 27 January 2017 at 10:36, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> On Thu, Jan 26, 2017 at 5:30 PM, Jo=C3=A3o Paulo Rechi Vita
> <jprvita@gmail.com> wrote:
>> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
>> ---
>>  drivers/platform/x86/asus-wireless.c | 15 ++++++---------
>>  drivers/platform/x86/asus-wireless.h | 10 ++++++++++
>>  2 files changed, 16 insertions(+), 9 deletions(-)
>>  create mode 100644 drivers/platform/x86/asus-wireless.h
>>
>> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86=
/asus-wireless.c
>> index 5a238fad35fb..fa28613688b4 100644
>> --- a/drivers/platform/x86/asus-wireless.c
>> +++ b/drivers/platform/x86/asus-wireless.c
>> @@ -17,6 +17,8 @@
>>  #include <linux/pci_ids.h>
>>  #include <linux/leds.h>
>>
>> +#include "asus-wireless.h"
>> +
>>  #define ASUS_WIRELESS_LED_STATUS 0x2
>>
>>  struct hswc_params {
>> @@ -40,12 +42,7 @@ static const struct hswc_params id_params[] =3D {
>>         { 0x5, 0x4 },
>>  };
>>
>> -static const struct acpi_device_id device_ids[] =3D {
>> -       {"ATK4001", 0},
>> -       {"ATK4002", 0},
>> -       {"", 0},
>> -};
>> -MODULE_DEVICE_TABLE(acpi, device_ids);
>> +MODULE_DEVICE_TABLE(acpi, asus_wireless_ids);
>>
>
> No, Don't do this.
>

Why?

>>  static u64 asus_wireless_method(acpi_handle handle, const char *method,
>>                                 int param)
>> @@ -130,8 +127,8 @@ static int asus_wireless_add(struct acpi_device *ade=
v)
>>         adev->driver_data =3D data;
>>
>>         hid =3D acpi_device_hid(adev);
>> -       for (i =3D 0; strcmp(device_ids[i].id, ""); i++) {
>
> This is wrong.
>
>> -               if (!strcmp(device_ids[i].id, hid)) {
>> +       for (i =3D 0; strcmp(asus_wireless_ids[i].id, ""); i++) {
>
> This is too.
>
> Potential infinite loop.
>
> On top of that seems you just introduced this by previous patches and
> changing here.
> Often it means you need to reconsider how you actually split the
> series on logical pieces.
>

Can you please elaborate a bit more? All this change does is to change
the name of the variable being iterated in the loop. As you said, the
loop was introduced in a previous series, and you didn't spot any
problems there. I don't think it makes sense to also rename the
variable in that other series, since I'm only renaming it because I'm
moving it to a header so it can be used by asus-wmi.c as well.

>> +               if (!strcmp(asus_wireless_ids[i].id, hid)) {
>>                         data->hswc_params =3D &id_params[i];
>>                         break;
>>                 }
>> @@ -179,7 +176,7 @@ static int asus_wireless_remove(struct acpi_device *=
adev)
>>  static struct acpi_driver asus_wireless_driver =3D {
>>         .name =3D "Asus Wireless Radio Control Driver",
>>         .class =3D "hotkey",
>> -       .ids =3D device_ids,
>> +       .ids =3D asus_wireless_ids,
>>         .ops =3D {
>>                 .add =3D asus_wireless_add,
>>                 .remove =3D asus_wireless_remove,
>> diff --git a/drivers/platform/x86/asus-wireless.h b/drivers/platform/x86=
/asus-wireless.h
>> new file mode 100644
>> index 000000000000..10a345863da6
>> --- /dev/null
>> +++ b/drivers/platform/x86/asus-wireless.h
>> @@ -0,0 +1,10 @@
>> +#ifndef _ASUS_WIRELESS_H_
>> +#define _ASUS_WIRELESS_H_
>> +
>> +const struct acpi_device_id asus_wireless_ids[] =3D {
>> +       {"ATK4001", 0},
>> +       {"ATK4002", 0},
>> +       {"", 0},
>> +};
>> +
>> +#endif /* !_ASUS_WIRELESS_H_ */
>> --
>> 2.11.0
>>
>
>
>
> --
> With Best Regards,
> Andy Shevchenko
