Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017F530DD21
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763310539; cv=none; b=s2iF6GfmY7HJkzO1vfE7lXBaeRiyWHBNlWEHrj7Oeqhwgt+m3ouHqjgCOA1VTVrcPSNxSyTA7fNJVafJ48wChd+60v8Ta8m/wE0KdixZuH52RPaiws+XUcGnYi0T8a3RneJfZAUBpumTuZtS/FM+HZqhjvuHxDNk6MrVR+8FrN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763310539; c=relaxed/simple;
	bh=WLL796Tc57/4m3daCVHgrVo9ThNutdb25sieHIF4UTc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qGZEIm3f6Jbx4HKvUQCnu6dv3LSrxNlPK6mJ8+qqcqD5h0z6/7Ef0D9cnRMtBYopr3LrjossycQjY42cD1753bkE+Ky2fdZDlnyuY0S+Z2DwarcgG3fVhsLpe3FJvCmG/AbuLBCUHpb6XTJApLEPpt1DNT0NMm3iwCvyDa8w26c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=hP9P9iEF; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="hP9P9iEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1763310528; x=1763569728;
	bh=WLL796Tc57/4m3daCVHgrVo9ThNutdb25sieHIF4UTc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hP9P9iEF+bYm/mWO1qjLvWEu4YFCL5oyT6nuSx5vC4vAfx6VWd2WWMjNEgpHUv0RN
	 tsDUmB23wHml8B88cya3Y+huoudLen8+GqKPSOVNp9sJxcNIaQbyjXA8+Te6Jh75e6
	 NtRInMVqGi59PQcmf4p5XRBbU7m900zAznOqC0fcyUZU4An1DekbDjzIZDZU8JdhIN
	 Hoh2TgbMmKW2Izyti1enp9Rp5KTc/8WBFpK1jumiBh+h+cahlLhwKTuqWvA7Ex787j
	 mPb/HypHsEKMuImIFvo8YZ0uc8Fc2YtigXdyPp79PaeSwIR4OfwDoujLMvUqB26Bjn
	 6L42XGFIpA1WA==
Date: Sun, 16 Nov 2025 16:28:42 +0000
To: Hans de Goede <hansg@kernel.org>
From: Bugaddr <Bugaddr@protonmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness unexpectedly
Message-ID: <tPQumZng3Py_n2et4MLRKu_-M-xqv-nzkFCCtnVryRamgSs5020dXq67qWVdrTG6mrFCDTGVDLGvoVvvnJZ_nQszJDQ4PWYCPbflKqGlqNs=@protonmail.com>
In-Reply-To: <xEdzYmxBwMOpzb0oiIr1q-SXgVMntKFDOqeoW1Q1wshnw7o-MZjLstwuSkj2Bc6E8DSEIMghxzhAKLbO8FtY4ABQHjYxG8SreVDidptyg2k=@protonmail.com>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com> <1536ce4a-5844-447f-9e86-197c71c6d364@gmx.de> <0RyizLnGQaxXLOtK-q6h-mHCTA2ergYBAIS-DkF1MPD9T5nx79rlaKdIOUBRft7Ghpy11OPo2OZM4waIjDbdnv2fnafWBDxWEYL75XZKtUo=@protonmail.com> <0b485b76-fb44-44a4-afab-d35fa31043db@gmx.de> <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com> <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de> <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org> <xEdzYmxBwMOpzb0oiIr1q-SXgVMntKFDOqeoW1Q1wshnw7o-MZjLstwuSkj2Bc6E8DSEIMghxzhAKLbO8FtY4ABQHjYxG8SreVDidptyg2k=@protonmail.com>
Feedback-ID: 43498376:user:proton
X-Pm-Message-ID: 3946dc8097f696e888a6cf016d2b15044f79141c
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Hans and Armin,
Could you please review the logs I shared? The issue persists across all ba=
cklight modes, and I=E2=80=99d appreciate your guidance on the next steps.
Thanks,
Bugaddr


On Saturday, October 25th, 2025 at 1:11 AM, Bugaddr <Bugaddr@protonmail.com=
> wrote:

>
>
>
> On Wednesday, October 15th, 2025 at 3:43 PM, Hans de Goede hansg@kernel.o=
rg wrote:
>
> > Hi,
> >
> > On 11-Oct-25 5:08 PM, Armin Wolf wrote:
> >
> > > Am 04.10.25 um 18:33 schrieb Bugaddr:
> > >
> > > > Sent with Proton Mail secure email.
> > > >
> > > > On Thursday, October 2nd, 2025 at 3:26 AM, Armin Wolf W_Armin@gmx.d=
e wrote:
> > > >
> > > > > Am 18.09.25 um 21:18 schrieb Bugaddr:
> > > > >
> > > > > > > Am 13.06.25 um 19:12 schrieb Bugaddr:
> > > > > > >
> > > > > > > > Hello,
> > > > > > > > I'm writing to report what appears to be a bug affecting th=
e Acer AN515-58 laptop, and I would appreciate any assistance in investigat=
ing or resolving it.
> > > > > > > >
> > > > > > > > When I press Fn + F10=E2=80=94which is intended to increase=
 the keyboard backlight brightness=E2=80=94the display brightness unexpecte=
dly decreases along with it. Furthermore, the display brightness continues =
to lower incrementally, until I manually press Fn + Brightness Up to stop a=
nd reverse it.
> > > > > > > >
> > > > > > > > After pressing Fn + Brightness Up, the display brightness b=
ehavior returns to normal, and the issue does not reoccur=E2=80=94however, =
from that point onward, the Brightness Down key no longer works.
> > > > > > > >
> > > > > > > > This behavior is consistent and reproducible. I'm happy to =
assist with any debugging, log collection, or kernel testing as needed.
> > > > > > > >
> > > > > > > > Best regards,
> > > > > > > > Bugaddr
> > > > > > > > Hi,
> > > > > > > > can you share the output of "acpidump"?
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Armin Wolf
> > > > > > > Sorry for late reply, but checkout this:
> > > > > > > https://paste.rs/Nqca3
> > > > > > > Thanks,
> > > > > > > Bugaddr
> > > > >
> > > > > Hi,
> > > > >
> > > > > sorry for the late response. It seems that you forgot to paste pa=
rts of the DSDT table. Could you please store the output
> > > > > of acpidump inside a file (sudo acpidump > acpidump.log) and atta=
ch it to the email? Also please put the whole mailing list
> > > > >
> > > > > on the CC next time.
> > > > >
> > > > > Thanks,
> > > > > Armin Wolf
> > > > > Hey, please checkout the attached acpidump
> > > >
> > > > Thanks,
> > > > Bugaddr
> > >
> > > Alright, the following ACPI bytecode is likely responsible for sendin=
g those brightness down events:
> > >
> > > Method (_Q11, 0, NotSerialized) // _Qxx: EC Query, xx=3D0x00-0xFF
> > > {
> > > Debug =3D "=3D=3D=3D=3D=3DQUERY_11=3D=3D=3D=3D=3D"
> > > ^^^WMID.FEBC [Zero] =3D One /* Acer hotkey event
> > > ^^^WMID.FEBC [One] =3D HTBN /* Hotkey scancode /
> > > ^^^WMID.FEBC [One] =3D BRTS / Unknown, BIOS error? /
> > > ^^^WMID.FEBC [Zero] =3D 0x04 / Unknown, BIOS error? /
> > > Notify (WMID, 0xBC) / Notify acer-wmi driver /
> > > If (IGDS) / Integrated GPU device state? /
> > > {
> > > Notify (^^^GFX0.DD1F, 0x87) / Decrease brightness on Intel iGPU /
> > > }
> > > Else
> > > {
> > > Notify (^^^PEG1.PEGP.LCD0, 0x87) / Decrease brightness on discrete GP=
U */
> > > }
> > > }
> > >
> > > I think the brightness problems are caused by the kernel using the wr=
ong backlight interface.
> > > Can you please try the following things:
> > >
> > > 1. Unload the acer-wmi driver using "modprobe -r acer-wmi".
> > > 2. Boot the kernel with "acpi_backlight=3Dvendor" if the problem stil=
l occurs.
> >
> > Using acpi_backlight=3Dvendor on a recent laptop-model like this one is=
 unlikely
> > to be the right thing to do. acpi_backlight=3Dvendor is for vendor spec=
ific
> > backlight control firmware interfaces from before things were standardi=
zed
> > on using the ACPI video firmware interface around Windows XP (IIRC), no=
t
> > sure if it was XP or some other Windows release but standardizing on
> > the API video firmware interface happened a long long time ago and then
> > things moved to mostly using direct hw access (acpi_backlight=3Dnative)
> > starting with Windows Vista.
> >
> > acpi_backlight=3Dvideo could still be something which might be the pref=
erred
> > way on some devices and also goes through ACPI calls, but using
> > acpi_backlight=3Dvendor is weird.
> >
> > OTOH I learned a while ago that apparently if multiple backlight interf=
aces
> > are present Windows simply sends the new brightness value to all interf=
aces.
> >
> > Anyways Bugaddr please do give acpi_backlight=3Dvendor (and maybe also
> > acpi_backlight=3Dvideo) a try as asked by Armin, this will still be
> > a good data point to have.
> >
> > Regards,
> >
> > Hans
>
>
> Here are the logs:
>
> # Logs after setting acpi_backlight=3Dvendor & removing acer-wmi
>
> 1. I am unable to change the display brightness either up/down
> 2. Caps_lock light turns on automatically when pressing fn+brightness_up =
key & turned off automatically as soon as other keys are pressed
> 3. Was able to change the keyboard brightness
> 4. no logs while pressing fn+keyboard_brightness_up/down
>
> wmi PNP0C14:00 000000bc 00000000
> video/brightnessup BRTUP 00000086 00000000
> wmi PNP0C14:00 000000bc 00000000
> wmi PNP0C14:00 000000bc 00000000
> video/brightnessdown BRTDN 00000087 00000000
> wmi PNP0C14:00 000000bc 00000000
>
> # Logs after setting acpi_backlight=3Dvideo
>
> ## Logs while testing the brightnes buttons first time after boot after r=
emoving acer-wmi, was able to change the display brightness
>
> wmi PNP0C14:00 000000bc 00000000
> video/brightnessup BRTUP 00000086 00000000
> wmi PNP0C14:00 000000bc 00000000
> wmi PNP0C14:00 000000bc 00000000
> video/brightnessdown BRTDN 00000087 00000000
> wmi PNP0C14:00 000000bc 00000000
>
> ## Logs after pressing fn+keyboard_brightness_up (the display brightness =
suddenly goes to 0) & keyboard brightness also changes
>
> video/brightnessdown BRTDN 00000087 00000000 K
>
> ** I am on latest bios update & acpi_backlight=3Dnative also dont work
>
> Regards,
> Bugaddr
