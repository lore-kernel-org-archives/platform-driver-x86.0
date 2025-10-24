Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch [109.224.244.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A820CCCA
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761334936; cv=none; b=ar8ATF5LxSe0p2DxHWsoPuPBILDFhcKcyyk04SebHJAa0LXaKPJLQ2a+varoThVHQ/s21gJD4ihhnvhYyUrB6+LTmFLZPEKHkJ1/Mufeyu1lFWQ92Oc45+ulmdYmYZSzmOOpC6DUwcIiyC0ydBm2N5T6tfYvWxQnv22/oDOANPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761334936; c=relaxed/simple;
	bh=kCE4hQqEWxJAfxYHCODFTKKrCkWdXeIwBDkRGzVfQxY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YwD2G6xfN5y2N9SjxkVnlPu3mvIUR8QINeC932+VUBVHZLquN6GTnYy9+Bl/KiwU9o/MAVJrjyvKW4fuJIfz69/weF2Viw0yjU5nrPGKgpBzZMfOtcl6GQmtdhwbjXJpKJ8IntVUBut+7Z0ebs02Apvfnbo0ZQ/V75/65nZBJq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ZzZ0nVaA; arc=none smtp.client-ip=109.224.244.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ZzZ0nVaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1761334923; x=1761594123;
	bh=kCE4hQqEWxJAfxYHCODFTKKrCkWdXeIwBDkRGzVfQxY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZzZ0nVaAefHMTsXGvHV9qGz3qVbJyLDHft2atyZlq2tddMm2cPQlEjrQBBe9SE3Fc
	 PYvjgiTX/MiktOI1NvBYXkL5eyxC8P5dYOvBAYCYnd/q9qQesh6hdOqP/Yrae5LoC7
	 5qhuYQJTejW1FNZSEP8I+Ah2cQEzl2GHdJQ8j0ZSIVbpuOKGRop/AhRqOzPzB/jF58
	 VWpW1y7ErvyrJHfl/9opvYLhTdn2fNnqd/xl8iXYAFgdW4AKXy5woouf1tHKvp6aC+
	 Hwqq3PqRAkJw1yEwWLYgrGIeNtvySuJSeRX4CB1nP65woQ/X54i6hvngqyCixo+lQj
	 ZEyWbPUECm8bQ==
Date: Fri, 24 Oct 2025 19:41:59 +0000
To: Hans de Goede <hansg@kernel.org>
From: Bugaddr <Bugaddr@protonmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness unexpectedly
Message-ID: <xEdzYmxBwMOpzb0oiIr1q-SXgVMntKFDOqeoW1Q1wshnw7o-MZjLstwuSkj2Bc6E8DSEIMghxzhAKLbO8FtY4ABQHjYxG8SreVDidptyg2k=@protonmail.com>
In-Reply-To: <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com> <1536ce4a-5844-447f-9e86-197c71c6d364@gmx.de> <0RyizLnGQaxXLOtK-q6h-mHCTA2ergYBAIS-DkF1MPD9T5nx79rlaKdIOUBRft7Ghpy11OPo2OZM4waIjDbdnv2fnafWBDxWEYL75XZKtUo=@protonmail.com> <0b485b76-fb44-44a4-afab-d35fa31043db@gmx.de> <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com> <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de> <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org>
Feedback-ID: 43498376:user:proton
X-Pm-Message-ID: 12631321d302a2436448d06b0f1ef6c0412af05e
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable





On Wednesday, October 15th, 2025 at 3:43 PM, Hans de Goede <hansg@kernel.or=
g> wrote:

> Hi,
>=20
> On 11-Oct-25 5:08 PM, Armin Wolf wrote:
>=20
> > Am 04.10.25 um 18:33 schrieb Bugaddr:
> >=20
> > > Sent with Proton Mail secure email.
> > >=20
> > > On Thursday, October 2nd, 2025 at 3:26 AM, Armin Wolf W_Armin@gmx.de =
wrote:
> > >=20
> > > > Am 18.09.25 um 21:18 schrieb Bugaddr:
> > > >=20
> > > > > > Am 13.06.25 um 19:12 schrieb Bugaddr:
> > > > > >=20
> > > > > > > Hello,
> > > > > > > I'm writing to report what appears to be a bug affecting the =
Acer AN515-58 laptop, and I would appreciate any assistance in investigatin=
g or resolving it.
> > > > > > >=20
> > > > > > > When I press Fn + F10=E2=80=94which is intended to increase t=
he keyboard backlight brightness=E2=80=94the display brightness unexpectedl=
y decreases along with it. Furthermore, the display brightness continues to=
 lower incrementally, until I manually press Fn + Brightness Up to stop and=
 reverse it.
> > > > > > >=20
> > > > > > > After pressing Fn + Brightness Up, the display brightness beh=
avior returns to normal, and the issue does not reoccur=E2=80=94however, fr=
om that point onward, the Brightness Down key no longer works.
> > > > > > >=20
> > > > > > > This behavior is consistent and reproducible. I'm happy to as=
sist with any debugging, log collection, or kernel testing as needed.
> > > > > > >=20
> > > > > > > Best regards,
> > > > > > > Bugaddr
> > > > > > > Hi,
> > > > > > > can you share the output of "acpidump"?
> > > > > >=20
> > > > > > Thanks,
> > > > > > Armin Wolf
> > > > > > Sorry for late reply, but checkout this:
> > > > > > https://paste.rs/Nqca3
> > > > > > Thanks,
> > > > > > Bugaddr
> > > >=20
> > > > Hi,
> > > >=20
> > > > sorry for the late response. It seems that you forgot to paste part=
s of the DSDT table. Could you please store the output
> > > > of acpidump inside a file (sudo acpidump > acpidump.log) and attach=
 it to the email? Also please put the whole mailing list
> > > >=20
> > > > on the CC next time.
> > > >=20
> > > > Thanks,
> > > > Armin Wolf
> > > > Hey, please checkout the attached acpidump
> > >=20
> > > Thanks,
> > > Bugaddr
> >=20
> > Alright, the following ACPI bytecode is likely responsible for sending =
those brightness down events:
> >=20
> > Method (_Q11, 0, NotSerialized) // _Qxx: EC Query, xx=3D0x00-0xFF
> > {
> > Debug =3D "=3D=3D=3D=3D=3DQUERY_11=3D=3D=3D=3D=3D"
> > ^^^WMID.FEBC [Zero] =3D One /* Acer hotkey event
> > ^^^WMID.FEBC [One] =3D HTBN /* Hotkey scancode /
> > ^^^WMID.FEBC [One] =3D BRTS / Unknown, BIOS error? /
> > ^^^WMID.FEBC [Zero] =3D 0x04 / Unknown, BIOS error? /
> > Notify (WMID, 0xBC) / Notify acer-wmi driver /
> > If (IGDS) / Integrated GPU device state? /
> > {
> > Notify (^^^GFX0.DD1F, 0x87) / Decrease brightness on Intel iGPU /
> > }
> > Else
> > {
> > Notify (^^^PEG1.PEGP.LCD0, 0x87) / Decrease brightness on discrete GPU =
*/
> > }
> > }
> >=20
> > I think the brightness problems are caused by the kernel using the wron=
g backlight interface.
> > Can you please try the following things:
> >=20
> > 1. Unload the acer-wmi driver using "modprobe -r acer-wmi".
> > 2. Boot the kernel with "acpi_backlight=3Dvendor" if the problem still =
occurs.
>=20
>=20
> Using acpi_backlight=3Dvendor on a recent laptop-model like this one is u=
nlikely
> to be the right thing to do. acpi_backlight=3Dvendor is for vendor specif=
ic
> backlight control firmware interfaces from before things were standardize=
d
> on using the ACPI video firmware interface around Windows XP (IIRC), not
> sure if it was XP or some other Windows release but standardizing on
> the API video firmware interface happened a long long time ago and then
> things moved to mostly using direct hw access (acpi_backlight=3Dnative)
> starting with Windows Vista.
>=20
> acpi_backlight=3Dvideo could still be something which might be the prefer=
red
> way on some devices and also goes through ACPI calls, but using
> acpi_backlight=3Dvendor is weird.
>=20
> OTOH I learned a while ago that apparently if multiple backlight interfac=
es
> are present Windows simply sends the new brightness value to all interfac=
es.
>=20
> Anyways Bugaddr please do give acpi_backlight=3Dvendor (and maybe also
> acpi_backlight=3Dvideo) a try as asked by Armin, this will still be
> a good data point to have.
>=20
> Regards,
>=20
> Hans

Here are the logs:

# Logs after setting acpi_backlight=3Dvendor & removing acer-wmi

1. I am unable to change the display brightness either up/down
2. Caps_lock light turns on automatically when pressing fn+brightness_up ke=
y & turned off automatically as soon as other keys are pressed
3. Was able to change the keyboard brightness
4. no logs while pressing fn+keyboard_brightness_up/down

wmi PNP0C14:00 000000bc 00000000
video/brightnessup BRTUP 00000086 00000000
wmi PNP0C14:00 000000bc 00000000
wmi PNP0C14:00 000000bc 00000000
video/brightnessdown BRTDN 00000087 00000000
wmi PNP0C14:00 000000bc 00000000

# Logs after setting acpi_backlight=3Dvideo

## Logs while testing the brightnes buttons first time after boot after rem=
oving acer-wmi, was able to change the display brightness

wmi PNP0C14:00 000000bc 00000000
video/brightnessup BRTUP 00000086 00000000
wmi PNP0C14:00 000000bc 00000000
wmi PNP0C14:00 000000bc 00000000
video/brightnessdown BRTDN 00000087 00000000
wmi PNP0C14:00 000000bc 00000000

## Logs after pressing fn+keyboard_brightness_up (the display brightness su=
ddenly goes to 0) & keyboard brightness also changes

video/brightnessdown BRTDN 00000087 00000000 K

** I am on latest bios update & acpi_backlight=3Dnative also dont work

Regards,
Bugaddr
