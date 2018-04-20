From: <Mario.Limonciello@dell.com>
Subject: RE: linux-next: Tree for Apr 19 (dell smbios SMM)
Date: Fri, 20 Apr 2018 14:29:30 +0000
Message-ID: <43bec7e798f5491284d2c049f835d339@ausx13mpc120.AMER.DELL.COM>
References: <20180419143545.63c0c639@canb.auug.org.au>
 <6aec5528-d6f1-3e05-1ac2-6eddbd0ac64f@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6aec5528-d6f1-3e05-1ac2-6eddbd0ac64f@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: rdunlap@infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Randy Dunlap [mailto:rdunlap@infradead.org]
> Sent: Thursday, April 19, 2018 1:00 PM
> To: Stephen Rothwell; Linux-Next Mailing List
> Cc: Linux Kernel Mailing List; Platform Driver; Limonciello, Mario
> Subject: Re: linux-next: Tree for Apr 19 (dell smbios SMM)
>=20
> On 04/18/18 21:35, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20180418:
> >
>=20
>=20
> I see some patches from about 1 month ago for this, but it was either
> never fixed ... or it's back.
>=20
>=20
> on x86_64:
>=20
> WARNING: unmet direct dependencies detected for DELL_SMBIOS
>   Depends on [m]: X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy] && (DCDBAS [=
=3Dm] ||
> DCDBAS [=3Dm]=3Dn) && (ACPI_WMI [=3Dn] || ACPI_WMI [=3Dn]=3Dn)
>   Selected by [y]:
>   - DELL_LAPTOP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy] && DM=
I [=3Dy]
> && BACKLIGHT_CLASS_DEVICE [=3Dy] && (ACPI_VIDEO [=3Dn] || ACPI_VIDEO [=3D=
n]=3Dn)
> && (RFKILL [=3Dn] || RFKILL [=3Dn]=3Dn) && SERIO_I8042 [=3Dy]
>=20
>=20
> drivers/platform/x86/dell-smbios-smm.o: In function `dell_smbios_smm_call=
':
> dell-smbios-smm.c:(.text+0x7d): undefined reference to `dcdbas_smi_reques=
t'
>=20
>=20
> --
> ~Randy

Randy,

Would you mind posting your kernel config somewhere like a pastebin or gith=
ub gist
so we can try to easily reproduce with your combination of configure option=
s?

Thanks,
