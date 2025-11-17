Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A32330337
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 14:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763388770; cv=none; b=jH5ntZVeinEd3XMVbjk259w2GKVC+ciO+KR0fl3tJTry5LCyMNaQRqEl45momro0Std1JxQSgbFYNsy6MCoxRnQNx/4UMWAzfxcHBQfDpMXQspk4/3C/JJCc9lwonBPSfSdHMPHp8sStJJTRKeBu8LNwlxDzmQW8I67+lskz79E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763388770; c=relaxed/simple;
	bh=/4//CBHjCQKEZceL7l5i+qnk42HJKdHn2y9WJIiEExU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TAfIGgZQKvvwdvvjbZE0QWKAzZpXg53RJ77LU2W4pXyclhcEYuK5gJdWsCf8u5dbWtMTgc/HCS4Gx9WWi+qU2eQA+v22VxbH1H53HddZxewdwCptNIQwkbEegOnEROeb3zuJlYVcjIYVc1sD/IBDYkie3yjfRz/cMvebQSoIZGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=eT3HZ+iJ; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="eT3HZ+iJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1763388757; x=1763647957;
	bh=i3dFaCRflOsSU5vihGm6PNyWZCQDCv6s+LmKxgztzDs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eT3HZ+iJOMzvdMu7O1lfDNgQuxkGBQTGDk3ItabzE9wsvWX4HkPG/vZzgDrmvj5QV
	 Q4lPFkLkqvXiamce7AV9PDwHa0Utn3PLzxbtiV9yzj5FJtJo6q6VgZrnbax2kYZt0b
	 g18Pe9A/fnGv9T93twDVTuCze5BD+4DU9h9ZMxs5cE6Nw+HHj2TrpzHwhKCYLj/ThX
	 gg5nb0wiHQtb0BpUmt5EHIrchvlUzZ19K9w6+Xk+PJnCrHLRcs904ON/FQf9DrYV4u
	 Ff88z5lYssavKtcoEBjV6wqH56c+KaK5bBlnraYqxfvHtP3vrEsp4IB3wJKvMHDte/
	 KAMasMttbHHWQ==
Date: Mon, 17 Nov 2025 14:12:31 +0000
To: Armin Wolf <W_Armin@gmx.de>
From: Bugaddr <Bugaddr@protonmail.com>
Cc: Hans de Goede <hansg@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness unexpectedly
Message-ID: <i02dtJC1U0Pf-yZFGOXKCBYdnbCerkuTvEkD3E0SbQt3bVvkBK8preFKHRAfgsi3_FijP8cZAu0HSNAjxEn3gAoYpDseHbUqNXRoE3fl1tw=@protonmail.com>
In-Reply-To: <066226b0-2f4a-44b1-b084-f0ac42bd6150@gmx.de>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com> <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com> <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de> <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org> <xEdzYmxBwMOpzb0oiIr1q-SXgVMntKFDOqeoW1Q1wshnw7o-MZjLstwuSkj2Bc6E8DSEIMghxzhAKLbO8FtY4ABQHjYxG8SreVDidptyg2k=@protonmail.com> <tPQumZng3Py_n2et4MLRKu_-M-xqv-nzkFCCtnVryRamgSs5020dXq67qWVdrTG6mrFCDTGVDLGvoVvvnJZ_nQszJDQ4PWYCPbflKqGlqNs=@protonmail.com> <1szuDGB7r2yubTWirjmsulWXtSkOdmTU2dmYrMbB6Wp2Y2PzBxbJ63OT4BWW_zDRp8QnPhH0VGKG7UyjWzEnFITEo1QjD10ksXtTG44K7Ts=@protonmail.com> <44a8cee2-c193-4cba-b33c-e3937a9a59b6@gmx.de> <066226b0-2f4a-44b1-b084-f0ac42bd6150@gmx.de>
Feedback-ID: 43498376:user:proton
X-Pm-Message-ID: 0341f81368ba6b7198e80c022855d0f13087ca93
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, November 17th, 2025 at 6:35 AM, Armin Wolf <W_Armin@gmx.de> wrot=
e:

> Am 17.11.25 um 01:29 schrieb Armin Wolf:
>=20
> > Am 16.11.25 um 23:14 schrieb Bugaddr:
> >=20
> > > On Sunday, November 16th, 2025 at 9:58 PM, Bugaddr
> > > Bugaddr@protonmail.com wrote:
> > >=20
> > > > Hi Hans and Armin,
> > > > Could you please review the logs I shared? The issue persists acros=
s
> > > > all backlight modes, and I=E2=80=99d appreciate your guidance on th=
e next
> > > > steps.
> > > > Thanks,
> > > > Bugaddr
> > > >=20
> > > > On Saturday, October 25th, 2025 at 1:11 AM, Bugaddr
> > > > Bugaddr@protonmail.com wrote:
> > > >=20
> > > > > On Wednesday, October 15th, 2025 at 3:43 PM, Hans de Goede
> > > > > hansg@kernel.org wrote:
> > > > >=20
> > > > > > Hi,
> > > > > >=20
> > > > > > On 11-Oct-25 5:08 PM, Armin Wolf wrote:
> > > > > >=20
> > > > > > > Am 04.10.25 um 18:33 schrieb Bugaddr:
> > > > > > >=20
> > > > > > > > Sent with Proton Mail secure email.
> > > > > > > >=20
> > > > > > > > On Thursday, October 2nd, 2025 at 3:26 AM, Armin Wolf
> > > > > > > > W_Armin@gmx.de wrote:
> > > > > > > >=20
> > > > > > > > > Am 18.09.25 um 21:18 schrieb Bugaddr:
> > > > > > > > >=20
> > > > > > > > > > > Am 13.06.25 um 19:12 schrieb Bugaddr:
> > > > > > > > > > >=20
> > > > > > > > > > > > Hello,
> > > > > > > > > > > > I'm writing to report what appears to be a bug affe=
cting the
> > > > > > > > > > > > Acer AN515-58 laptop, and I would appreciate any as=
sistance
> > > > > > > > > > > > in investigating or resolving it.
> > > > > > > > > > > >=20
> > > > > > > > > > > > When I press Fn + F10=E2=80=94which is intended to =
increase the
> > > > > > > > > > > > keyboard backlight brightness=E2=80=94the display b=
rightness
> > > > > > > > > > > > unexpectedly decreases along with it. Furthermore, =
the
> > > > > > > > > > > > display brightness continues to lower incrementally=
, until I
> > > > > > > > > > > > manually press Fn + Brightness Up to stop and rever=
se it.
> > > > > > > > > > > >=20
> > > > > > > > > > > > After pressing Fn + Brightness Up, the display brig=
htness
> > > > > > > > > > > > behavior returns to normal, and the issue does not
> > > > > > > > > > > > reoccur=E2=80=94however, from that point onward, th=
e Brightness Down
> > > > > > > > > > > > key no longer works.
> > > > > > > > > > > >=20
> > > > > > > > > > > > This behavior is consistent and reproducible. I'm h=
appy to
> > > > > > > > > > > > assist with any debugging, log collection, or kerne=
l testing
> > > > > > > > > > > > as needed.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Best regards,
> > > > > > > > > > > > Bugaddr
> > > > > > > > > > > > Hi,
> > > > > > > > > > > > can you share the output of "acpidump"?
> > > > > > > > > > > > Thanks,
> > > > > > > > > > > > Armin Wolf
> > > > > > > > > > > > Sorry for late reply, but checkout this:
> > > > > > > > > > > > https://paste.rs/Nqca3
> > > > > > > > > > > > Thanks,
> > > > > > > > > > > > Bugaddr
> > > > > > > > > > > > Hi,
> > > > > > > > >=20
> > > > > > > > > sorry for the late response. It seems that you forgot to =
paste
> > > > > > > > > parts of the DSDT table. Could you please store the outpu=
t
> > > > > > > > > of acpidump inside a file (sudo acpidump > acpidump.log) =
and
> > > > > > > > > attach it to the email? Also please put the whole mailing=
 list
> > > > > > > > >=20
> > > > > > > > > on the CC next time.
> > > > > > > > >=20
> > > > > > > > > Thanks,
> > > > > > > > > Armin Wolf
> > > > > > > > > Hey, please checkout the attached acpidump
> > > > > > > > > Thanks,
> > > > > > > > > Bugaddr
> > > > > > > > > Alright, the following ACPI bytecode is likely responsibl=
e for
> > > > > > > > > sending those brightness down events:
> > > > > > >=20
> > > > > > > Method (_Q11, 0, NotSerialized) // _Qxx: EC Query, xx=3D0x00-=
0xFF
> > > > > > > {
> > > > > > > Debug =3D "=3D=3D=3D=3D=3DQUERY_11=3D=3D=3D=3D=3D"
> > > > > > > ^^^WMID.FEBC [Zero] =3D One /* Acer hotkey event
> > > > > > > ^^^WMID.FEBC [One] =3D HTBN /* Hotkey scancode /
> > > > > > > ^^^WMID.FEBC [One] =3D BRTS / Unknown, BIOS error? /
> > > > > > > ^^^WMID.FEBC [Zero] =3D 0x04 / Unknown, BIOS error? /
> > > > > > > Notify (WMID, 0xBC) / Notify acer-wmi driver /
> > > > > > > If (IGDS) / Integrated GPU device state? /
> > > > > > > {
> > > > > > > Notify (^^^GFX0.DD1F, 0x87) / Decrease brightness on Intel iG=
PU /
> > > > > > > }
> > > > > > > Else
> > > > > > > {
> > > > > > > Notify (^^^PEG1.PEGP.LCD0, 0x87) / Decrease brightness on
> > > > > > > discrete GPU */
> > > > > > > }
> > > > > > > }
> > > > > > >=20
> > > > > > > I think the brightness problems are caused by the kernel usin=
g
> > > > > > > the wrong backlight interface.
> > > > > > > Can you please try the following things:
> > > > > > >=20
> > > > > > > 1. Unload the acer-wmi driver using "modprobe -r acer-wmi".
> > > > > > > 2. Boot the kernel with "acpi_backlight=3Dvendor" if the prob=
lem
> > > > > > > still occurs.
> > > > > > > Using acpi_backlight=3Dvendor on a recent laptop-model like t=
his one
> > > > > > > is unlikely
> > > > > > > to be the right thing to do. acpi_backlight=3Dvendor is for v=
endor
> > > > > > > specific
> > > > > > > backlight control firmware interfaces from before things were
> > > > > > > standardized
> > > > > > > on using the ACPI video firmware interface around Windows XP
> > > > > > > (IIRC), not
> > > > > > > sure if it was XP or some other Windows release but standardi=
zing on
> > > > > > > the API video firmware interface happened a long long time ag=
o and
> > > > > > > then
> > > > > > > things moved to mostly using direct hw access (acpi_backlight=
=3Dnative)
> > > > > > > starting with Windows Vista.
> > > > > >=20
> > > > > > acpi_backlight=3Dvideo could still be something which might be =
the
> > > > > > preferred
> > > > > > way on some devices and also goes through ACPI calls, but using
> > > > > > acpi_backlight=3Dvendor is weird.
> > > > > >=20
> > > > > > OTOH I learned a while ago that apparently if multiple backligh=
t
> > > > > > interfaces
> > > > > > are present Windows simply sends the new brightness value to al=
l
> > > > > > interfaces.
> > > > > >=20
> > > > > > Anyways Bugaddr please do give acpi_backlight=3Dvendor (and may=
be also
> > > > > > acpi_backlight=3Dvideo) a try as asked by Armin, this will stil=
l be
> > > > > > a good data point to have.
> > > > > >=20
> > > > > > Regards,
> > > > > >=20
> > > > > > Hans
> > > > > > Here are the logs:
> > > > >=20
> > > > > # Logs after setting acpi_backlight=3Dvendor & removing acer-wmi
> > > > >=20
> > > > > 1. I am unable to change the display brightness either up/down
> > > > > 2. Caps_lock light turns on automatically when pressing
> > > > > fn+brightness_up key & turned off automatically as soon as other
> > > > > keys are pressed
> > > > > 3. Was able to change the keyboard brightness
> > > > > 4. no logs while pressing fn+keyboard_brightness_up/down
> > > > >=20
> > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > video/brightnessup BRTUP 00000086 00000000
> > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > video/brightnessdown BRTDN 00000087 00000000
> > > > > wmi PNP0C14:00 000000bc 00000000
> > > > >=20
> > > > > # Logs after setting acpi_backlight=3Dvideo
> > > > >=20
> > > > > ## Logs while testing the brightnes buttons first time after boot
> > > > > after removing acer-wmi, was able to change the display brightnes=
s
> > > > >=20
> > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > video/brightnessup BRTUP 00000086 00000000
> > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > video/brightnessdown BRTDN 00000087 00000000
> > > > > wmi PNP0C14:00 000000bc 00000000
> > > > >=20
> > > > > ## Logs after pressing fn+keyboard_brightness_up (the display
> > > > > brightness suddenly goes to 0) & keyboard brightness also changes
> > > > >=20
> > > > > video/brightnessdown BRTDN 00000087 00000000 K
> > > > >=20
> > > > > ** I am on latest bios update & acpi_backlight=3Dnative also dont=
 work
> > > > >=20
> > > > > Regards,
> > > > > Bugaddr
> > > > > Hi everyone,
> > >=20
> > > I've debugged and fixed the annoying Fn+F10 bug on Acer Nitro 5
> > > AN515-58.
> > >=20
> > > ROOT CAUSE:
> > > Firmware sends wrong scancode (0xef) which Linux maps to
> > > KEY_BRIGHTNESSDOWN instead of keyboard backlight control.
> > >=20
> > > SOLUTION:
> > > Install this udev hwdb rule:
> > >=20
> > > sudo tee /etc/udev/hwdb.d/90-acer-nitro5-an515-58.hwdb > /dev/null <<
> > > 'EOF'
> > > # Acer Nitro 5 AN515-58 - Fix Fn+F10 scancode 0xef
> > > evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pnNitroAN515-58
> > > KEYBOARD_KEY_ef=3Dreserved
> > > EOF
> > >=20
> > > sudo systemd-hwdb update && sudo udevadm trigger
> > > --sysname-match=3D"event*"
> > >=20
> > > TESTED ON:
> > > - Kernel: 6.17.8-arch1-1
> > > - Distribution: Arch Linux
> > > - Desktop: KDE Plasma (Wayland)
> > >=20
> > > I have blogged my full analysis here:
> > > https://bugaddr.tech/posts/2025-11-16-debugging-the-acer-nitro-5-an51=
5-58-fn-f10-keyboard-backlight-bug-on-linux/
> > >=20
> > > Thanks & regards,
> > > Bugaddr
> >=20
> > Sorry for not responding earlier, i kind of forgot about this bug
> > report :/.
> >=20
> > But thanks for figuring that out, maybe you can contribute this fix to
> > hwdb so that other users of this device
> > can benefit for it?
> >=20
> > Thanks,
> > Armin Wolf
>=20
>=20
> I just read your blog post and it seems that your device has some WMI int=
erface issues. The warning
> from the WMI driver regarding the missing WQ00 ACPI control method is har=
mless, as the WMI driver core
> will simply ignore the affected WMI device.
>=20
> The unknown function number 4 - 0 however can be fixed inside the acer-wm=
i driver. It seems that all
> we need to do is to tell the driver to ignore function number 4 - 0, as t=
he acpi-video driver already
> handles the brightness up/down events.
>=20
> Can you test the attached patch?
>=20
> Thanks,
> Armin Wolf

Thanks Armin for the patch, I have tested this patch on my device and yes t=
he logs are suppressed. Well its unrelated but I am only getting this messa=
ges when pressing fn+F9 (Keyboard backlight down) & there are no such warni=
ngs on fn+F10 (Keyboard brightness up):

[  398.153437] atkbd serio0: Unknown key pressed (translated set 2, code 0x=
f0 on isa0060/serio0).
[  398.153469] atkbd serio0: Use 'setkeycodes e070 <keycode>' to make it kn=
own.

Note: The hwdb overrides were still there while testing (The issue of displ=
ay brightness came back after removing those overrides)

Thanks and regards
Bugaddr
