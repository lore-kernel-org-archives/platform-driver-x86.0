Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DE02D77E2
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763397528; cv=none; b=n2+O1DXihn7+uG8IYGNFcWT4ejYLf0bussEMQ7DmJs1+Cc44V0AQicRXZWr/PopPsVxxJeEiU/VZZnBY4lzKLuXdBDk/3c6uVg/DSUhPr+dvaH5njFkmG251LN+eq7zGd5rHw80Xw1mrTgjXbQ7TmgSUTZqGhwZFbsAyl35LV54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763397528; c=relaxed/simple;
	bh=uz47m2x69kwhJcMrNPUf0/HvPILcQDixb0aTUhp2kZU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJy1CcgJ1uvjsKe2ixl3dXujyD3Giu5/NF34S+Tt1F7ahp7wqtPgEsHBllaa4nlFPOScWygmHPU7MM3jqZ2P3KQPrIfYpMNsRKDKCbx5yJxYyC3YO0xSUJ7gJC/NdAYAHFaAtnJWRTbIv4PbZxU67XvYHkWSTcOAfpDsSTAuNw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=a+fh9YRO; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="a+fh9YRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1763397515; x=1763656715;
	bh=uz47m2x69kwhJcMrNPUf0/HvPILcQDixb0aTUhp2kZU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=a+fh9YROL1NMngm2/fmRrz9Jz+Xq7c4U0ICp15v7s0lBuHMCeRmKqrw+BsNi40u+v
	 gfEto7+1NkTpCNMku1FSOvB2aZ5qU4B7yUJuFjztcZvkFIDy/LAsqFppTWNkwa588+
	 cPtuGEmcqB5Oza4R9N/4kTUwsz3rciLCmefsiJjMLn0hkodJBa+InXoRtMTlxxj/ls
	 hS98q8juqKnWnpE/+ttxT9s7zlT6Wvy96wfpDwuxsEbyD9BXWWnyioY2khF8Jvi6kU
	 E9w1KpF3WQTvC4DC/m/ImLnswEI75jymaEwMB5i3cdbMTgW9Qr6j8Ki+YaLvIAGd+f
	 RJxodB2sQcAzA==
Date: Mon, 17 Nov 2025 16:38:29 +0000
To: Armin Wolf <W_Armin@gmx.de>
From: Bugaddr <Bugaddr@protonmail.com>
Cc: Hans de Goede <hansg@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness unexpectedly
Message-ID: <NxQI23FpGxly2BrhR9gBkMJw3eflLyQ-ymaf_RxAsLztqm_hJvFB68E8xEpaMVAFzVuALBC--pdhgvHF7oxsI1HY-0I6F7L5gObvZHn3BkE=@protonmail.com>
In-Reply-To: <2c733a76-a622-48f5-ba0f-01773f6a7a7a@gmx.de>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com> <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org> <xEdzYmxBwMOpzb0oiIr1q-SXgVMntKFDOqeoW1Q1wshnw7o-MZjLstwuSkj2Bc6E8DSEIMghxzhAKLbO8FtY4ABQHjYxG8SreVDidptyg2k=@protonmail.com> <tPQumZng3Py_n2et4MLRKu_-M-xqv-nzkFCCtnVryRamgSs5020dXq67qWVdrTG6mrFCDTGVDLGvoVvvnJZ_nQszJDQ4PWYCPbflKqGlqNs=@protonmail.com> <1szuDGB7r2yubTWirjmsulWXtSkOdmTU2dmYrMbB6Wp2Y2PzBxbJ63OT4BWW_zDRp8QnPhH0VGKG7UyjWzEnFITEo1QjD10ksXtTG44K7Ts=@protonmail.com> <44a8cee2-c193-4cba-b33c-e3937a9a59b6@gmx.de> <066226b0-2f4a-44b1-b084-f0ac42bd6150@gmx.de> <i02dtJC1U0Pf-yZFGOXKCBYdnbCerkuTvEkD3E0SbQt3bVvkBK8preFKHRAfgsi3_FijP8cZAu0HSNAjxEn3gAoYpDseHbUqNXRoE3fl1tw=@protonmail.com> <2c733a76-a622-48f5-ba0f-01773f6a7a7a@gmx.de>
Feedback-ID: 43498376:user:proton
X-Pm-Message-ID: 8cea6a484d8177a21f740ef6b5ddd8c09e880d23
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, November 17th, 2025 at 9:33 PM, Armin Wolf <W_Armin@gmx.de> wrot=
e:

> Am 17.11.25 um 15:12 schrieb Bugaddr:
>=20
> > On Monday, November 17th, 2025 at 6:35 AM, Armin Wolf W_Armin@gmx.de wr=
ote:
> >=20
> > > Am 17.11.25 um 01:29 schrieb Armin Wolf:
> > >=20
> > > > Am 16.11.25 um 23:14 schrieb Bugaddr:
> > > >=20
> > > > > On Sunday, November 16th, 2025 at 9:58 PM, Bugaddr
> > > > > Bugaddr@protonmail.com wrote:
> > > > >=20
> > > > > > Hi Hans and Armin,
> > > > > > Could you please review the logs I shared? The issue persists a=
cross
> > > > > > all backlight modes, and I=E2=80=99d appreciate your guidance o=
n the next
> > > > > > steps.
> > > > > > Thanks,
> > > > > > Bugaddr
> > > > > >=20
> > > > > > On Saturday, October 25th, 2025 at 1:11 AM, Bugaddr
> > > > > > Bugaddr@protonmail.com wrote:
> > > > > >=20
> > > > > > > On Wednesday, October 15th, 2025 at 3:43 PM, Hans de Goede
> > > > > > > hansg@kernel.org wrote:
> > > > > > >=20
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > On 11-Oct-25 5:08 PM, Armin Wolf wrote:
> > > > > > > >=20
> > > > > > > > > Am 04.10.25 um 18:33 schrieb Bugaddr:
> > > > > > > > >=20
> > > > > > > > > > Sent with Proton Mail secure email.
> > > > > > > > > >=20
> > > > > > > > > > On Thursday, October 2nd, 2025 at 3:26 AM, Armin Wolf
> > > > > > > > > > W_Armin@gmx.de wrote:
> > > > > > > > > >=20
> > > > > > > > > > > Am 18.09.25 um 21:18 schrieb Bugaddr:
> > > > > > > > > > >=20
> > > > > > > > > > > > > Am 13.06.25 um 19:12 schrieb Bugaddr:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Hello,
> > > > > > > > > > > > > > I'm writing to report what appears to be a bug =
affecting the
> > > > > > > > > > > > > > Acer AN515-58 laptop, and I would appreciate an=
y assistance
> > > > > > > > > > > > > > in investigating or resolving it.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > When I press Fn + F10=E2=80=94which is intended=
 to increase the
> > > > > > > > > > > > > > keyboard backlight brightness=E2=80=94the displ=
ay brightness
> > > > > > > > > > > > > > unexpectedly decreases along with it. Furthermo=
re, the
> > > > > > > > > > > > > > display brightness continues to lower increment=
ally, until I
> > > > > > > > > > > > > > manually press Fn + Brightness Up to stop and r=
everse it.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > After pressing Fn + Brightness Up, the display =
brightness
> > > > > > > > > > > > > > behavior returns to normal, and the issue does =
not
> > > > > > > > > > > > > > reoccur=E2=80=94however, from that point onward=
, the Brightness Down
> > > > > > > > > > > > > > key no longer works.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > This behavior is consistent and reproducible. I=
'm happy to
> > > > > > > > > > > > > > assist with any debugging, log collection, or k=
ernel testing
> > > > > > > > > > > > > > as needed.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Best regards,
> > > > > > > > > > > > > > Bugaddr
> > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > can you share the output of "acpidump"?
> > > > > > > > > > > > > > Thanks,
> > > > > > > > > > > > > > Armin Wolf
> > > > > > > > > > > > > > Sorry for late reply, but checkout this:
> > > > > > > > > > > > > > https://paste.rs/Nqca3
> > > > > > > > > > > > > > Thanks,
> > > > > > > > > > > > > > Bugaddr
> > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > sorry for the late response. It seems that you =
forgot to paste
> > > > > > > > > > > > > > parts of the DSDT table. Could you please store=
 the output
> > > > > > > > > > > > > > of acpidump inside a file (sudo acpidump > acpi=
dump.log) and
> > > > > > > > > > > > > > attach it to the email? Also please put the who=
le mailing list
> > > > > > > > > > >=20
> > > > > > > > > > > on the CC next time.
> > > > > > > > > > >=20
> > > > > > > > > > > Thanks,
> > > > > > > > > > > Armin Wolf
> > > > > > > > > > > Hey, please checkout the attached acpidump
> > > > > > > > > > > Thanks,
> > > > > > > > > > > Bugaddr
> > > > > > > > > > > Alright, the following ACPI bytecode is likely respon=
sible for
> > > > > > > > > > > sending those brightness down events:
> > > > > > > > > > > Method (_Q11, 0, NotSerialized) // _Qxx: EC Query, xx=
=3D0x00-0xFF
> > > > > > > > > > > {
> > > > > > > > > > > Debug =3D "=3D=3D=3D=3D=3DQUERY_11=3D=3D=3D=3D=3D"
> > > > > > > > > > > ^^^WMID.FEBC [Zero] =3D One /* Acer hotkey event
> > > > > > > > > > > ^^^WMID.FEBC [One] =3D HTBN /* Hotkey scancode /
> > > > > > > > > > > ^^^WMID.FEBC [One] =3D BRTS / Unknown, BIOS error? /
> > > > > > > > > > > ^^^WMID.FEBC [Zero] =3D 0x04 / Unknown, BIOS error? /
> > > > > > > > > > > Notify (WMID, 0xBC) / Notify acer-wmi driver /
> > > > > > > > > > > If (IGDS) / Integrated GPU device state? /
> > > > > > > > > > > {
> > > > > > > > > > > Notify (^^^GFX0.DD1F, 0x87) / Decrease brightness on =
Intel iGPU /
> > > > > > > > > > > }
> > > > > > > > > > > Else
> > > > > > > > > > > {
> > > > > > > > > > > Notify (^^^PEG1.PEGP.LCD0, 0x87) / Decrease brightnes=
s on
> > > > > > > > > > > discrete GPU */
> > > > > > > > > > > }
> > > > > > > > > > > }
> > > > > > > > >=20
> > > > > > > > > I think the brightness problems are caused by the kernel =
using
> > > > > > > > > the wrong backlight interface.
> > > > > > > > > Can you please try the following things:
> > > > > > > > >=20
> > > > > > > > > 1. Unload the acer-wmi driver using "modprobe -r acer-wmi=
".
> > > > > > > > > 2. Boot the kernel with "acpi_backlight=3Dvendor" if the =
problem
> > > > > > > > > still occurs.
> > > > > > > > > Using acpi_backlight=3Dvendor on a recent laptop-model li=
ke this one
> > > > > > > > > is unlikely
> > > > > > > > > to be the right thing to do. acpi_backlight=3Dvendor is f=
or vendor
> > > > > > > > > specific
> > > > > > > > > backlight control firmware interfaces from before things =
were
> > > > > > > > > standardized
> > > > > > > > > on using the ACPI video firmware interface around Windows=
 XP
> > > > > > > > > (IIRC), not
> > > > > > > > > sure if it was XP or some other Windows release but stand=
ardizing on
> > > > > > > > > the API video firmware interface happened a long long tim=
e ago and
> > > > > > > > > then
> > > > > > > > > things moved to mostly using direct hw access (acpi_backl=
ight=3Dnative)
> > > > > > > > > starting with Windows Vista.
> > > > > > > > > acpi_backlight=3Dvideo could still be something which mig=
ht be the
> > > > > > > > > preferred
> > > > > > > > > way on some devices and also goes through ACPI calls, but=
 using
> > > > > > > > > acpi_backlight=3Dvendor is weird.
> > > > > > > >=20
> > > > > > > > OTOH I learned a while ago that apparently if multiple back=
light
> > > > > > > > interfaces
> > > > > > > > are present Windows simply sends the new brightness value t=
o all
> > > > > > > > interfaces.
> > > > > > > >=20
> > > > > > > > Anyways Bugaddr please do give acpi_backlight=3Dvendor (and=
 maybe also
> > > > > > > > acpi_backlight=3Dvideo) a try as asked by Armin, this will =
still be
> > > > > > > > a good data point to have.
> > > > > > > >=20
> > > > > > > > Regards,
> > > > > > > >=20
> > > > > > > > Hans
> > > > > > > > Here are the logs:
> > > > > > > > # Logs after setting acpi_backlight=3Dvendor & removing ace=
r-wmi
> > > > > > >=20
> > > > > > > 1. I am unable to change the display brightness either up/dow=
n
> > > > > > > 2. Caps_lock light turns on automatically when pressing
> > > > > > > fn+brightness_up key & turned off automatically as soon as ot=
her
> > > > > > > keys are pressed
> > > > > > > 3. Was able to change the keyboard brightness
> > > > > > > 4. no logs while pressing fn+keyboard_brightness_up/down
> > > > > > >=20
> > > > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > > > video/brightnessup BRTUP 00000086 00000000
> > > > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > > > video/brightnessdown BRTDN 00000087 00000000
> > > > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > > >=20
> > > > > > > # Logs after setting acpi_backlight=3Dvideo
> > > > > > >=20
> > > > > > > ## Logs while testing the brightnes buttons first time after =
boot
> > > > > > > after removing acer-wmi, was able to change the display brigh=
tness
> > > > > > >=20
> > > > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > > > video/brightnessup BRTUP 00000086 00000000
> > > > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > > > video/brightnessdown BRTDN 00000087 00000000
> > > > > > > wmi PNP0C14:00 000000bc 00000000
> > > > > > >=20
> > > > > > > ## Logs after pressing fn+keyboard_brightness_up (the display
> > > > > > > brightness suddenly goes to 0) & keyboard brightness also cha=
nges
> > > > > > >=20
> > > > > > > video/brightnessdown BRTDN 00000087 00000000 K
> > > > > > >=20
> > > > > > > ** I am on latest bios update & acpi_backlight=3Dnative also =
dont work
> > > > > > >=20
> > > > > > > Regards,
> > > > > > > Bugaddr
> > > > > > > Hi everyone,
> > > > > > > I've debugged and fixed the annoying Fn+F10 bug on Acer Nitro=
 5
> > > > > > > AN515-58.
> > > > >=20
> > > > > ROOT CAUSE:
> > > > > Firmware sends wrong scancode (0xef) which Linux maps to
> > > > > KEY_BRIGHTNESSDOWN instead of keyboard backlight control.
> > > > >=20
> > > > > SOLUTION:
> > > > > Install this udev hwdb rule:
> > > > >=20
> > > > > sudo tee /etc/udev/hwdb.d/90-acer-nitro5-an515-58.hwdb > /dev/nul=
l <<
> > > > > 'EOF'
> > > > > # Acer Nitro 5 AN515-58 - Fix Fn+F10 scancode 0xef
> > > > > evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pnNitroAN515-58
> > > > > KEYBOARD_KEY_ef=3Dreserved
> > > > > EOF
> > > > >=20
> > > > > sudo systemd-hwdb update && sudo udevadm trigger
> > > > > --sysname-match=3D"event*"
> > > > >=20
> > > > > TESTED ON:
> > > > > - Kernel: 6.17.8-arch1-1
> > > > > - Distribution: Arch Linux
> > > > > - Desktop: KDE Plasma (Wayland)
> > > > >=20
> > > > > I have blogged my full analysis here:
> > > > > https://bugaddr.tech/posts/2025-11-16-debugging-the-acer-nitro-5-=
an515-58-fn-f10-keyboard-backlight-bug-on-linux/
> > > > >=20
> > > > > Thanks & regards,
> > > > > Bugaddr
> > > > > Sorry for not responding earlier, i kind of forgot about this bug
> > > > > report :/.
> > > >=20
> > > > But thanks for figuring that out, maybe you can contribute this fix=
 to
> > > > hwdb so that other users of this device
> > > > can benefit for it?
> > > >=20
> > > > Thanks,
> > > > Armin Wolf
> > >=20
> > > I just read your blog post and it seems that your device has some WMI=
 interface issues. The warning
> > > from the WMI driver regarding the missing WQ00 ACPI control method is=
 harmless, as the WMI driver core
> > > will simply ignore the affected WMI device.
> > >=20
> > > The unknown function number 4 - 0 however can be fixed inside the ace=
r-wmi driver. It seems that all
> > > we need to do is to tell the driver to ignore function number 4 - 0, =
as the acpi-video driver already
> > > handles the brightness up/down events.
> > >=20
> > > Can you test the attached patch?
> > >=20
> > > Thanks,
> > > Armin Wolf
> > > Thanks Armin for the patch, I have tested this patch on my device and=
 yes the logs are suppressed. Well its unrelated but I am only getting this=
 messages when pressing fn+F9 (Keyboard backlight down) & there are no such=
 warnings on fn+F10 (Keyboard brightness up):
> >=20
> > [ 398.153437] atkbd serio0: Unknown key pressed (translated set 2, code=
 0xf0 on isa0060/serio0).
> > [ 398.153469] atkbd serio0: Use 'setkeycodes e070 <keycode>' to make it=
 known.
> >=20
> > Note: The hwdb overrides were still there while testing (The issue of d=
isplay brightness came back after removing those overrides)
> >=20
> > Thanks and regards
> > Bugaddr
>=20
>=20
> Strange, seems to me that the atkbd driver simply has no default mapping =
for keycode 0xf0. I honestly have no
> experience regarding the atkbd driver, so i can can only suggest that you=
 map this key code to KEY_IGNORE/KEY_UNKNOWN.
>=20
> Thanks,
> Armin Wolf

The pr has been merged into hwdb, fixing both the keys.
https://github.com/systemd/systemd/pull/39769#event-20990427715
Thanks for your support Armin & Hans.

Regards,
Bugaddr


