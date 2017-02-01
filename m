From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 8/8] asus-wmi: Don't register rfkill if ASHS and user bit
 are present
Date: Wed, 1 Feb 2017 07:18:41 -0500
Message-ID: <CA+A7VXWtaEcQWxJQdRxQOqB+EhU0YuVU4r4EjLWes8fwwVgY=Q@mail.gmail.com>
References: <20170126153013.12753-1-jprvita@endlessm.com> <20170126153013.12753-9-jprvita@endlessm.com>
 <1485470741.12563.104.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:35497 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751266AbdBAMTW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Feb 2017 07:19:22 -0500
In-Reply-To: <1485470741.12563.104.camel@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 26 January 2017 at 17:45, Joe Perches <joe@perches.com> wrote:
> On Thu, 2017-01-26 at 10:30 -0500, Jo=C3=A3o Paulo Rechi Vita wrote:
>> Some Asus laptops that have an airplane-mode indicator LED, also have
>> the WMI WLAN user bit set, and the following bits in their DSDT:
>
> style trivia:
>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus=
-wmi.c
> []
>> @@ -2051,6 +2052,16 @@ static int asus_wmi_fan_init(struct asus_wmi *asu=
s)
>>       return 0;
>>  }
>>
>> +static bool ashs_present(void)
>> +{
>> +     int i;
>> +
>> +     for (i =3D 0; strcmp(asus_wireless_ids[i].id, ""); i++)
>> +             if (acpi_dev_found(asus_wireless_ids[i].id))
>> +                     return true;
>
> The for loop would commonly have braces because of the
> internal if.
>

Thanks, I'm fixing it for the next revision.
