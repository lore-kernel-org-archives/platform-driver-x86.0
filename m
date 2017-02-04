From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] asus-wireless: Fix identation
Date: Sat, 4 Feb 2017 17:10:55 +0200
Message-ID: <CAHp75VeCJee46FHoyGdZ39CvTu0pb=k_R0CnWb9_vaX-per+rQ@mail.gmail.com>
References: <CA+A7VXU2yjb6dYExqZjsP3--6ePJzK+nbNKADv=rxUcGfzX8pQ@mail.gmail.com>
 <20170201122707.14738-1-jprvita@endlessm.com> <CAHp75Vfn4K+90pqrR=iy-CZFFM67icB4Od9NmsGtuG3puQKTUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:34938 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750851AbdBDPK4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Feb 2017 10:10:56 -0500
In-Reply-To: <CAHp75Vfn4K+90pqrR=iy-CZFFM67icB4Od9NmsGtuG3puQKTUw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On Sat, Feb 4, 2017 at 5:08 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Feb 1, 2017 at 2:27 PM, Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail=
.com> wrote:
>
> Do not leave empty commit message. Describe your changes here in a few wo=
rds.
>
> For the drivers/platform/x86 use a pattern in subject
>
> platform/x86: asus-wireless: ...

And one more, use versioning of your patches: PATCHv1, PATCHv2, ...

>
>> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
>> ---
>>  drivers/platform/x86/asus-wireless.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86=
/asus-wireless.c
>> index 9f31bc1a47d0..a7ee18383146 100644
>> --- a/drivers/platform/x86/asus-wireless.c
>> +++ b/drivers/platform/x86/asus-wireless.c
>> @@ -76,8 +76,7 @@ static void led_state_update(struct work_struct *work)
>>                              data->led_state);
>>  }
>>
>> -static void led_state_set(struct led_classdev *led,
>> -                                 enum led_brightness value)
>> +static void led_state_set(struct led_classdev *led, enum led_brightness=
 value)
>>  {
>>         struct asus_wireless_data *data;
>>
>> --
>> 2.11.0
>>
>
>
>
> --
> With Best Regards,
> Andy Shevchenko



--=20
With Best Regards,
Andy Shevchenko
