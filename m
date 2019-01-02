From: Jan Vlietland <j.vlietland@nisi.nl>
Subject: Please help!: Keyboard backlight not working on my NP900X5N laptop
 <previous not accepted due to HTML encoding>
Date: Thu, 3 Jan 2019 00:20:15 +0100
Message-ID: <0e16bba8-046c-c559-9ee1-88c0341a51d5@nisi.nl>
References: <c3ea9b3f-5ffe-df8f-726c-0bf6f3a82701@nisi.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c3ea9b3f-5ffe-df8f-726c-0bf6f3a82701@nisi.nl>
Content-Language: nl
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Vlietland <j.vlietland@nisi.nl>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, open list <linux-kernel@vger.kernel.org>
Cc: "open list:SAMSUNG LAPTOP DRIVER" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi guys,

Sorry but still walking with this bug under my arm.

I can't find the right group to file the bug on bugzilla and also on=20
freenode I cannot find the right group.

Please help!

Regards,

Jan


On 01-01-19 13:48, Jan Vlietland wrote:
> Hi all,
>
> Greg K-H suggested to mail you guys.
>
> I installed Linux 4.20.0-rc7 (downloaded, compiled and installed) on a=20
> Samsung NP900X5N laptop and have noticed 3 bugs. 2 of them I found in=20
> Bugzilla and replied on them (i915 and Nouveau issues). I am currently=20
> discussing them with an intel engineer.
>
> On other bug I haven't found so therefore a mail directly to you guys=20
> as maintainers.
>
> On my other machine, a Samsung NP900X4D (just bought it in the USA,=20
> 2017 model), the samsung-laptop.ko module is enabling the use of the=20
> keyboard backlight keys.
>
> It is not working on my new machine NP900X5N. My samsung-laptop.ko=20
> driver isn't loading. If I try to load it manually it complains about=20
> 'no such device".
>
> My Linux kernel is working in CSM mode. The module is still not loaded.
>
> As it is weekend I did some more reading and debugging of the module.=20
> To my understanding the module checks the model and type of the=20
> laptop. The known models and types are stored in the struct:
>
> static struct dmi_system_id __initdata samsung_dmi_table[]
>
> I wondr if the NP900X5N notebook is included in this list.
>
> With dmidecode -t chassis it shows:
> Getting SMBIOS data from sysfs.
> SMBIOS 3.0.0 present.
>
> Handle 0x0003, DMI type 3, 22 bytes
> Chassis Information
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Manufacturer: SAMSUNG ELECTRON=
ICS CO., LTD.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Type: Notebook
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Lock: Not Present
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Version: N/A
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Serial Number: 0F4C91CJ900346
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Asset Tag: No Asset Tag
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Boot-up State: Safe
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Power Supply State: Safe
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thermal State: Other
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Security Status: None
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OEM Information: 0x00000000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Height: Unspecified
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Number Of Power Cords: 1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Contained Elements: 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SKU Number: Chassis
>
> If I use the -u flag. The notebook value is 0x0A, not 0x10!!!
>
> Could that be the reason for not loading?
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_MA=
TCH(DMI_SYS_VENDOR,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "SAMSUNG ELECTRONICS CO., LTD.")=
,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_MA=
TCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>
> Maybe another reason could that that either the i915 and Nouveau=20
> modules are not working well. I get black screens with the i915 and=20
> MMIO faults with the nouveau driver. That is another issue that I need=20
> to tackle.
>
> Oh happy new year :-)
>
