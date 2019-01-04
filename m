From: Jan Vlietland <j.vlietland@nisi.nl>
Subject: Re: Keyboard backlight not working on my NP900X5N laptop
Date: Fri, 4 Jan 2019 17:16:38 +0100
Message-ID: <a675b43e-b40b-5049-2045-294325053723@nisi.nl>
References: <ffa49970-ce0a-614e-3c90-03eb4924fbef@nisi.nl>
 <20190103020323.GA21617@wrath>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190103020323.GA21617@wrath>
Content-Language: nl
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Jan Vlietland <j.vlietland@nisi.nl>
Cc: Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, open list <linux-kernel@vger.kernel.org>, "open list:SAMSUNG LAPTOP DRIVER" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren,

I understand your extra workload. For me it is just being another user=20
complaining about some bug. Sorry for that :-) Good to know the response=20
time. I will keep that in mind.

Anyway. I have changed the static variable to "0A", recompiled the=20
module and I get the same output 'no such device'.

However I am now running in EFI mode based on another bug:

https://bugs.freedesktop.org/show_bug.cgi?id=3D109209

...and I see in the code....

 =C2=A0=C2=A0=C2=A0 struct samsung_laptop *samsung;
 =C2=A0=C2=A0=C2=A0 int ret;

 =C2=A0=C2=A0=C2=A0 if (efi_enabled(EFI_BOOT))
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -ENODEV;

 =C2=A0=C2=A0=C2=A0 quirks =3D &samsung_unknown;
 =C2=A0=C2=A0=C2=A0 if (!force && !dmi_check_system(samsung_dmi_table))
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -ENODEV;

 =C2=A0=C2=A0=C2=A0 samsung =3D kzalloc(sizeof(*samsung), GFP_KERNEL);
 =C2=A0=C2=A0=C2=A0 if (!samsung)
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -ENOMEM

Is that EFI restriction still valid. As far as I remember Samsung=20
repaired their BIOS. Or does the driver not work in EFI mode anyway?


On 03-01-19 03:03, Darren Hart wrote:
> On Mon, Dec 31, 2018 at 08:40:43PM +0100, Jan Vlietland wrote:
>> Hi all,
>>
> Hey Jan,
>
>> Greg K-H suggested to mail you guys.
>>
>> I installed Linux 4.20.0-rc7 (downloaded, compiled and installed) on a S=
amsung NP900X5N laptop and have noticed 3 bugs. 2 of them I found in Bugzil=
la and replied on them (i915 and Nouveau issues). I am currently discussing=
 them with an intel engineer.
>>
>> On other bug I haven't found so therefore a mail directly to you guys as=
 maintainers.
>>
>> On my other machine, a Samsung NP900X4D (just bought it in the USA, 2017=
 model), the samsung-laptop.ko module is enabling the use of the keyboard b=
acklight keys.
>>
>> It is not working on my new machine NP900X5N. My samsung-laptop.ko drive=
r isn't loading. If I try to load it manually it complains about 'no such d=
evice".
>>
>> My Linux kernel is working in CSM mode. The module is still not loaded.
>>
> That's correct.
>
>> As it is weekend I did some more reading and debugging of the module. To=
 my understanding the module checks the model and type of the laptop. The k=
nown models and types are stored in the struct:
>>
>> static struct dmi_system_id __initdata samsung_dmi_table[]
>>
>> I wondr if the NP900X5N notebook is included in this list.
>>
>> With dmidecode -t chassis it shows:
>> Getting SMBIOS data from sysfs.
>> SMBIOS 3.0.0 present.
>>
>> Handle 0x0003, DMI type 3, 22 bytes
>> Chassis Information
>>          Manufacturer: SAMSUNG ELECTRONICS CO., LTD.
>>          Type: Notebook
>>          Lock: Not Present
>>          Version: N/A
>>          Serial Number: 0F4C91CJ900346
>>          Asset Tag: No Asset Tag
>>          Boot-up State: Safe
>>          Power Supply State: Safe
>>          Thermal State: Other
>>          Security Status: None
>>          OEM Information: 0x00000000
>>          Height: Unspecified
>>          Number Of Power Cords: 1
>>          Contained Elements: 0
>>          SKU Number: Chassis
>>
>> If I use the -u flag. The notebook value is 0x0A, not 0x10!!!
>>
>> Could that be the reason for not loading?
> Seems likely.
>
>> =09=09.matches =3D {
>> =09=09=09DMI_MATCH(DMI_SYS_VENDOR,
>> =09=09=09=09=09"SAMSUNG ELECTRONICS CO., LTD."),
>> =09=09=09DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
>> =09=09},
>>
>> Maybe another reason could that that either the i915 and Nouveau modules=
 are
>> not working well. I get black screens with the i915 and MMIO faults with=
 the
>> nouveau driver. That is another issue that I need to tackle.
>>
> I would expect a different error than "no such device" in that case.
> I think your first thought was correct.
>
> As a simple test, I'd suggest replacing "10" with "0A" in the existing
> DMI_CHASSIS_TYPE match, recompile, and see if it loads and works
> correctly.  Would you be able to test this?
>
>> Oh happy new year :-)
>
> Happy New Year!
>
