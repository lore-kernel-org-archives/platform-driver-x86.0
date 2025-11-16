Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5B2765DC
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 22:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763331283; cv=none; b=W0tjFgzLr32FUE5B/NWLQpsTnWJLF6x7URVB0rDkpI9nXS7RTBTlXhpsk76oSRPqZYIfN8mZVVJP82GYc6MFzX1hfI5yeIhe4KN4qSeXpudu/Osenr8zzU0l+EyB+7dcQtb6ntXNzWRaifK55anhTx2guBzEMY/+sVSmci4n3CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763331283; c=relaxed/simple;
	bh=lAFHMHaDIvwGFtwNVvYyzbrejLH7H6lOYrCDUOBl1WY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XHgh+BXXFJI871XXyOY37sEiQmEUaJ7dRnTUnO4HhmMWo0GPda1MHbHJP5oZ+I0HVUaiXPA/j8molmu5bVXFBwSGBX0BMJj6otE0yJTH19YO6SBj2sbBP+L0atK58Ef6xzga62XprgpJ+IivNxt+7/dSfXWog4LuS6cW/5HcSRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=pxcuTf+n; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="pxcuTf+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1763331271; x=1763590471;
	bh=lAFHMHaDIvwGFtwNVvYyzbrejLH7H6lOYrCDUOBl1WY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pxcuTf+nMW/E75+hlQVXZwzau4eKSY3TdYItkUjdRcoz+74AUzY3DxJ4JNiOrBipe
	 QD6nmLIihsR+csjPTJ+eKoQkDSCLvE6r/My1Tt2exFzVRWgHHSEwYKC9n7BLQKz8ZC
	 z/W3N4Z2m/h0UfPcLcrjU4d9kD8oYV/v7c3c8eZX0+hcc1QA6369c7FVXx6A0FQtk2
	 xMDUUcbPN/zjteM89z7X62btEf5wdFbz+yvCAlOjS6YaFPdk+hh+gCGzZuF+Phx/Vn
	 R4hyVDJ6Hh58Fq6YmXmzRA39AsOE1l3lJ1IjGhKxazW7B75rHC1iErYQwUSmjVIQoD
	 sPgy7Tppif/RA==
Date: Sun, 16 Nov 2025 22:14:26 +0000
To: Hans de Goede <hansg@kernel.org>
From: Bugaddr <Bugaddr@protonmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness unexpectedly
Message-ID: <1szuDGB7r2yubTWirjmsulWXtSkOdmTU2dmYrMbB6Wp2Y2PzBxbJ63OT4BWW_zDRp8QnPhH0VGKG7UyjWzEnFITEo1QjD10ksXtTG44K7Ts=@protonmail.com>
In-Reply-To: <tPQumZng3Py_n2et4MLRKu_-M-xqv-nzkFCCtnVryRamgSs5020dXq67qWVdrTG6mrFCDTGVDLGvoVvvnJZ_nQszJDQ4PWYCPbflKqGlqNs=@protonmail.com>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com> <1536ce4a-5844-447f-9e86-197c71c6d364@gmx.de> <0RyizLnGQaxXLOtK-q6h-mHCTA2ergYBAIS-DkF1MPD9T5nx79rlaKdIOUBRft7Ghpy11OPo2OZM4waIjDbdnv2fnafWBDxWEYL75XZKtUo=@protonmail.com> <0b485b76-fb44-44a4-afab-d35fa31043db@gmx.de> <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com> <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de> <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org> <xEdzYmxBwMOpzb0oiIr1q-SXgVMntKFDOqeoW1Q1wshnw7o-MZjLstwuSkj2Bc6E8DSEIMghxzhAKLbO8FtY4ABQHjYxG8SreVDidptyg2k=@protonmail.com> <tPQumZng3Py_n2et4MLRKu_-M-xqv-nzkFCCtnVryRamgSs5020dXq67qWVdrTG6mrFCDTGVDLGvoVvvnJZ_nQszJDQ4PWYCPbflKqGlqNs=@protonmail.com>
Feedback-ID: 43498376:user:proton
X-Pm-Message-ID: 6c189a245b19bc2ce799fc7741b50ebece8b3e9a
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sunday, November 16th, 2025 at 9:58 PM, Bugaddr <Bugaddr@protonmail.com>=
 wrote:

> Hi Hans and Armin,
> Could you please review the logs I shared? The issue persists across all =
backlight modes, and I=E2=80=99d appreciate your guidance on the next steps=
.
> Thanks,
> Bugaddr
>=20
>=20
> On Saturday, October 25th, 2025 at 1:11 AM, Bugaddr Bugaddr@protonmail.co=
m wrote:
>=20
> > On Wednesday, October 15th, 2025 at 3:43 PM, Hans de Goede hansg@kernel=
.org wrote:
> >=20
> > > Hi,
> > >=20
> > > On 11-Oct-25 5:08 PM, Armin Wolf wrote:
> > >=20
> > > > Am 04.10.25 um 18:33 schrieb Bugaddr:
> > > >=20
> > > > > Sent with Proton Mail secure email.
> > > > >=20
> > > > > On Thursday, October 2nd, 2025 at 3:26 AM, Armin Wolf W_Armin@gmx=
.de wrote:
> > > > >=20
> > > > > > Am 18.09.25 um 21:18 schrieb Bugaddr:
> > > > > >=20
> > > > > > > > Am 13.06.25 um 19:12 schrieb Bugaddr:
> > > > > > > >=20
> > > > > > > > > Hello,
> > > > > > > > > I'm writing to report what appears to be a bug affecting =
the Acer AN515-58 laptop, and I would appreciate any assistance in investig=
ating or resolving it.
> > > > > > > > >=20
> > > > > > > > > When I press Fn + F10=E2=80=94which is intended to increa=
se the keyboard backlight brightness=E2=80=94the display brightness unexpec=
tedly decreases along with it. Furthermore, the display brightness continue=
s to lower incrementally, until I manually press Fn + Brightness Up to stop=
 and reverse it.
> > > > > > > > >=20
> > > > > > > > > After pressing Fn + Brightness Up, the display brightness=
 behavior returns to normal, and the issue does not reoccur=E2=80=94however=
, from that point onward, the Brightness Down key no longer works.
> > > > > > > > >=20
> > > > > > > > > This behavior is consistent and reproducible. I'm happy t=
o assist with any debugging, log collection, or kernel testing as needed.
> > > > > > > > >=20
> > > > > > > > > Best regards,
> > > > > > > > > Bugaddr
> > > > > > > > > Hi,
> > > > > > > > > can you share the output of "acpidump"?
> > > > > > > >=20
> > > > > > > > Thanks,
> > > > > > > > Armin Wolf
> > > > > > > > Sorry for late reply, but checkout this:
> > > > > > > > https://paste.rs/Nqca3
> > > > > > > > Thanks,
> > > > > > > > Bugaddr
> > > > > >=20
> > > > > > Hi,
> > > > > >=20
> > > > > > sorry for the late response. It seems that you forgot to paste =
parts of the DSDT table. Could you please store the output
> > > > > > of acpidump inside a file (sudo acpidump > acpidump.log) and at=
tach it to the email? Also please put the whole mailing list
> > > > > >=20
> > > > > > on the CC next time.
> > > > > >=20
> > > > > > Thanks,
> > > > > > Armin Wolf
> > > > > > Hey, please checkout the attached acpidump
> > > > >=20
> > > > > Thanks,
> > > > > Bugaddr
> > > >=20
> > > > Alright, the following ACPI bytecode is likely responsible for send=
ing those brightness down events:
> > > >=20
> > > > Method (_Q11, 0, NotSerialized) // _Qxx: EC Query, xx=3D0x00-0xFF
> > > > {
> > > > Debug =3D "=3D=3D=3D=3D=3DQUERY_11=3D=3D=3D=3D=3D"
> > > > ^^^WMID.FEBC [Zero] =3D One /* Acer hotkey event
> > > > ^^^WMID.FEBC [One] =3D HTBN /* Hotkey scancode /
> > > > ^^^WMID.FEBC [One] =3D BRTS / Unknown, BIOS error? /
> > > > ^^^WMID.FEBC [Zero] =3D 0x04 / Unknown, BIOS error? /
> > > > Notify (WMID, 0xBC) / Notify acer-wmi driver /
> > > > If (IGDS) / Integrated GPU device state? /
> > > > {
> > > > Notify (^^^GFX0.DD1F, 0x87) / Decrease brightness on Intel iGPU /
> > > > }
> > > > Else
> > > > {
> > > > Notify (^^^PEG1.PEGP.LCD0, 0x87) / Decrease brightness on discrete =
GPU */
> > > > }
> > > > }
> > > >=20
> > > > I think the brightness problems are caused by the kernel using the =
wrong backlight interface.
> > > > Can you please try the following things:
> > > >=20
> > > > 1. Unload the acer-wmi driver using "modprobe -r acer-wmi".
> > > > 2. Boot the kernel with "acpi_backlight=3Dvendor" if the problem st=
ill occurs.
> > >=20
> > > Using acpi_backlight=3Dvendor on a recent laptop-model like this one =
is unlikely
> > > to be the right thing to do. acpi_backlight=3Dvendor is for vendor sp=
ecific
> > > backlight control firmware interfaces from before things were standar=
dized
> > > on using the ACPI video firmware interface around Windows XP (IIRC), =
not
> > > sure if it was XP or some other Windows release but standardizing on
> > > the API video firmware interface happened a long long time ago and th=
en
> > > things moved to mostly using direct hw access (acpi_backlight=3Dnativ=
e)
> > > starting with Windows Vista.
> > >=20
> > > acpi_backlight=3Dvideo could still be something which might be the pr=
eferred
> > > way on some devices and also goes through ACPI calls, but using
> > > acpi_backlight=3Dvendor is weird.
> > >=20
> > > OTOH I learned a while ago that apparently if multiple backlight inte=
rfaces
> > > are present Windows simply sends the new brightness value to all inte=
rfaces.
> > >=20
> > > Anyways Bugaddr please do give acpi_backlight=3Dvendor (and maybe als=
o
> > > acpi_backlight=3Dvideo) a try as asked by Armin, this will still be
> > > a good data point to have.
> > >=20
> > > Regards,
> > >=20
> > > Hans
> >=20
> > Here are the logs:
> >=20
> > # Logs after setting acpi_backlight=3Dvendor & removing acer-wmi
> >=20
> > 1. I am unable to change the display brightness either up/down
> > 2. Caps_lock light turns on automatically when pressing fn+brightness_u=
p key & turned off automatically as soon as other keys are pressed
> > 3. Was able to change the keyboard brightness
> > 4. no logs while pressing fn+keyboard_brightness_up/down
> >=20
> > wmi PNP0C14:00 000000bc 00000000
> > video/brightnessup BRTUP 00000086 00000000
> > wmi PNP0C14:00 000000bc 00000000
> > wmi PNP0C14:00 000000bc 00000000
> > video/brightnessdown BRTDN 00000087 00000000
> > wmi PNP0C14:00 000000bc 00000000
> >=20
> > # Logs after setting acpi_backlight=3Dvideo
> >=20
> > ## Logs while testing the brightnes buttons first time after boot after=
 removing acer-wmi, was able to change the display brightness
> >=20
> > wmi PNP0C14:00 000000bc 00000000
> > video/brightnessup BRTUP 00000086 00000000
> > wmi PNP0C14:00 000000bc 00000000
> > wmi PNP0C14:00 000000bc 00000000
> > video/brightnessdown BRTDN 00000087 00000000
> > wmi PNP0C14:00 000000bc 00000000
> >=20
> > ## Logs after pressing fn+keyboard_brightness_up (the display brightnes=
s suddenly goes to 0) & keyboard brightness also changes
> >=20
> > video/brightnessdown BRTDN 00000087 00000000 K
> >=20
> > ** I am on latest bios update & acpi_backlight=3Dnative also dont work
> >=20
> > Regards,
> > Bugaddr

Hi everyone,

I've debugged and fixed the annoying Fn+F10 bug on Acer Nitro 5 AN515-58.

ROOT CAUSE:
Firmware sends wrong scancode (0xef) which Linux maps to KEY_BRIGHTNESSDOWN=
 instead of keyboard backlight control.

SOLUTION:
Install this udev hwdb rule:

sudo tee /etc/udev/hwdb.d/90-acer-nitro5-an515-58.hwdb > /dev/null << 'EOF'
# Acer Nitro 5 AN515-58 - Fix Fn+F10 scancode 0xef
evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pnNitro*AN515-58*
 KEYBOARD_KEY_ef=3Dreserved
EOF

sudo systemd-hwdb update && sudo udevadm trigger --sysname-match=3D"event*"

TESTED ON:
- Kernel: 6.17.8-arch1-1
- Distribution: Arch Linux
- Desktop: KDE Plasma (Wayland)

I have blogged my full analysis here: https://bugaddr.tech/posts/2025-11-16=
-debugging-the-acer-nitro-5-an515-58-fn-f10-keyboard-backlight-bug-on-linux=
/

Thanks & regards,
Bugaddr
