From: Jan Vlietland <j.vlietland@nisi.nl>
Subject: Keyboard backlight not working on my NP900X5N laptop <previous not
 accepted due to HTML encoding>
Date: Tue, 1 Jan 2019 13:48:49 +0100
Message-ID: <c3ea9b3f-5ffe-df8f-726c-0bf6f3a82701@nisi.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: nl
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, open list <linux-kernel@vger.kernel.org>
Cc: "open list:SAMSUNG LAPTOP DRIVER" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi all,

Greg K-H suggested to mail you guys.

I installed Linux 4.20.0-rc7 (downloaded, compiled and installed) on a Sams=
ung NP900X5N laptop and have noticed 3 bugs. 2 of them I found in Bugzilla =
and replied on them (i915 and Nouveau issues). I am currently discussing th=
em with an intel engineer.

On other bug I haven't found so therefore a mail directly to you guys as ma=
intainers.

On my other machine, a Samsung NP900X4D (just bought it in the USA, 2017 mo=
del), the samsung-laptop.ko module is enabling the use of the keyboard back=
light keys.

It is not working on my new machine NP900X5N. My samsung-laptop.ko driver i=
sn't loading. If I try to load it manually it complains about 'no such devi=
ce".

My Linux kernel is working in CSM mode. The module is still not loaded.

As it is weekend I did some more reading and debugging of the module. To my=
 understanding the module checks the model and type of the laptop. The know=
n models and types are stored in the struct:

static struct dmi_system_id __initdata samsung_dmi_table[]

I wondr if the NP900X5N notebook is included in this list.

With dmidecode -t chassis it shows:
Getting SMBIOS data from sysfs.
SMBIOS 3.0.0 present.

Handle 0x0003, DMI type 3, 22 bytes
Chassis Information
         Manufacturer: SAMSUNG ELECTRONICS CO., LTD.
         Type: Notebook
         Lock: Not Present
         Version: N/A
         Serial Number: 0F4C91CJ900346
         Asset Tag: No Asset Tag
         Boot-up State: Safe
         Power Supply State: Safe
         Thermal State: Other
         Security Status: None
         OEM Information: 0x00000000
         Height: Unspecified
         Number Of Power Cords: 1
         Contained Elements: 0
         SKU Number: Chassis

If I use the -u flag. The notebook value is 0x0A, not 0x10!!!

Could that be the reason for not loading?

=09=09.matches =3D {
=09=09=09DMI_MATCH(DMI_SYS_VENDOR,
=09=09=09=09=09"SAMSUNG ELECTRONICS CO., LTD."),
=09=09=09DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
=09=09},

Maybe another reason could that that either the i915 and Nouveau modules=20
are not working well. I get black screens with the i915 and MMIO faults=20
with the nouveau driver. That is another issue that I need to tackle.

Oh happy new year :-)

--=20

Met vriendelijke groet,

*dr. Jan Vlietland*, namens

spin-off

Nederlands Instituut voor de Software Industrie

_j.vlietland@nisi.nl_| 06 =E2=80=93 20 411 834 | 030 =E2=80=93 268 53 98
Princetonplein 5 | 3584 CC=C2=A0 Utrecht | www.nisi.nl
