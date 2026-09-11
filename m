Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B12B4BEE52
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789163880; cv=none; b=V9lYhj34VysXqyCEdeyhJWKr/l8EZK2geIDI0KH8WVn52tH0dpAyM5DFqyIJNoVQfkF0s1b8Qa9TuwQhm8fqIku2vJGNlBqHwL9z/ZRxGSD8EwpBRMjOynEEwhmB3wB5RZWRyUJIv6sckpIE1lwR16NadaoEImz0ujjvqYpqtds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789163880; c=relaxed/simple;
	bh=nSvx7nr4kRAgkezRgyU8+jjTXaVzH2/tL7tieH7jIDE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CuPtJC0cc2bC4rptJ13Cf7OsSph94DIKDTLf1qPubxeBPHyV69ugcgvSMk/brmDOO6rov4+mJ5hs2choATkGcshikLMRrJODBp0MdIgdPk+z9sTBcIIV0LT5evyovSaK/eMGjQ9XJXYLYB3F93oP/lT87k4eBOak07n6J4ZgK8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=NK3AoDxa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZQBrEWDD; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="NK3AoDxa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZQBrEWDD"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EA12A140014E;
	Fri, 11 Sep 2026 17:57:55 -0400 (EDT)
Received: from ams-imap-09 ([10.64.2.29])
  by ams-compute-01.internal (MEProxy); Fri, 11 Sep 2026 17:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1789163875;
	 x=1789250275; bh=7YT2eIKZHMrm5M7otTetbzGZn6sY3RlOMMzOShOXJNg=; b=
	NK3AoDxaFr9nMKgp2z7HpI93lRC9cPHg/eEWHrarFl2nj42mMo5u2fcDYLls6ECU
	+o6Zi1651uK1LVyyrd3A0ux2yfzBxF9alBNXCbni45f7JV+U376dU3feP0XgjHgQ
	LE5jAWfHdOzwPeNF4zgps4zKQikuY0KxxZ9oic1jdKO+Hbm+jURznkyWZC2UyIcY
	4WZm2FEacyPjobl222eeVymHHhni1PTkFjhGwuTeTenRw+90azBuy/ZAjaPdII09
	plQz+buaRukA9+OrvkNLrbqVdYpgWSQ14ZmX0smrrclTjsnb/DcsBlduYALr8FTn
	ICfpxd/Hh97ebh6O9HjeGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789163875; x=
	1789250275; bh=7YT2eIKZHMrm5M7otTetbzGZn6sY3RlOMMzOShOXJNg=; b=Z
	QBrEWDDlTrXEjNcu+N97jPAR/x1f+oaNXRFLy0Z5kgQ2ZFqx2NZGwDOZil6uNrsg
	/l9KbvfDEn72aSfUz1dcWO1bMUJCBDMtVx00Ou4WYFXV7PBY9QfnB7kQsasq+6Ds
	eSvz9NwVC+KhaamdszqOFPlKym3KGFxGyaIDMU32gIUG8rXC/db1ZB9dLVgqCuFQ
	/V5KnUItnfAh3XPPns3S9p5xZ4udCUG1Xx7KHUEmBlmwDsvWglnrYRpTdtqXIadO
	35+pweSy49c+PVCSdUGog2564d8fOAfzxQufQUhY9VkKfs/XLgNMUbDO/6WrwPbB
	YKPldztJsCa/JUKQxX/sA==
X-ME-Sender: <xms:YXmkapViqz-FkbZUrJt2DTPzjk261O_peEFhK1L0oBuBU8mHmV8wUw>
    <xme:YXmkakardQl6DvpD6ezeq7F5-AUEVqH6qMqWoeBuWGJXD5-mhoRNVtRF5eKpLEtGb
    Erwfb3_JQ_V0dazRTb6KPgdz2DH1IqexooJMJMu880OFQscbZOXut8>
X-ME-Proxy-Cause: dmFkZTEDCJJ1Hj9+n/xoY75+BonH7Iz4f3STLqdjpCaM1/FbaBIoBat/G4KnzFY4XkeX5m
    qoWJeLH7jWCzMIETAO+GSETQGRTp0W1kEATlCae8Q7WJ6DkZBavxkuN0kN12ninSdUJgWc
    cTXgqCQRRk/5xGxn2Tnuo1w1xOzitRQdB58YIm3i7HmOpMSOugTniQmdNGnRRzmdI6nSVm
    o+hG/101ih0x0ZIVVKIqBkBpB8LbdA+R/oOEmLyWnm71Vg7hvYLwgS95psTrHpPMTBhwCW
    SbzkSDIxYIBGH5I01ByawTCZuawzeURvORnpH8tkCkyFcPPcR+YOPc9FX6LRsuQh3W0WCo
    kYLOdRkddUVX5T5+4niWBi8SgDKvWCwapCLfglSHNQxjAE9vM2006MTsK+T2qmsClduQQ+
    18TZLPXuI1TPQbdYxO8MHhPkR1nw+Ew99AtZC4jjrHueXqnYMYf+HdZ9hfcRMNOcoxLhQC
    Xau1uduVjJfB3ZX7n5d44Gt8UBVpyoNpGjj95HcybCIvVMyLadqEZEeP3k92b2T37vrZ/Y
    KCf5NqHbK99L0L4fIsu1stSkn/F8tJaKQb8TdRBHfRDT75z+gMlb0rshwOCcgtGn3f4cJl
    HpfgBIN7HgBeylvf6O+fWg+Ie9/La+DVqWHpZ3xNrgpQ6FtSIrkVbwhahteA
X-ME-Proxy: <xmx:Ynmkau6P9U4zXqatj_7TV3LeG8F0HaEmyv_asgh0jmLeDkgxDuQYDw>
    <xmx:YnmkapZG59bgXLCOQLqhoObtQwbKbQgUsMQyRpbGte4joQjaaATchQ>
    <xmx:YnmkatiOQaWcva8C1JDzOaNBno4-UAOKc7QSvj_WNjBCL5_kHB4CUw>
    <xmx:Ynmkaq87XEZfWl0ZKbyTwsL81HAW_xw51VCvnGZuYwqUSvQOHRIUew>
    <xmx:Y3mkar9PB8O7Gmye8X-Rquz2vvYvRbQS10ZFBqm8lYNSjUIaVP42Vbmm>
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1AF82180087; Fri, 11 Sep 2026 17:57:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 00:56:16 +0300
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Kevin Charpentier" <kevinccharpentier@gmail.com>
Cc: hansg@kernel.org, markgross@kernel.org,
 platform-driver-x86@vger.kernel.org, maxtram95@gmail.com
Message-Id: <a909064f-857f-448b-9e8e-5dcaf02f6170@app.fastmail.com>
In-Reply-To: 
 <CAH4z8xFHq9_cQME2qfjBi5Yt8KRHxc17U17rEP0nebX82zXtyA@mail.gmail.com>
References: 
 <CAH4z8xHUrb3nHM7SS9s_3h9qo_Bu7Susf8ug5E==nFbHQMPCJg@mail.gmail.com>
 <5d11beec-b9ba-49ab-adfa-de5ad0cc4e69@app.fastmail.com>
 <CAH4z8xFHq9_cQME2qfjBi5Yt8KRHxc17U17rEP0nebX82zXtyA@mail.gmail.com>
Subject: Re: ideapad-laptop: duplicate KEY_MICMUTE events on ThinkBook 14 G7 ARP (ACPI
 and WMI both report)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026, at 17:45, Kevin Charpentier wrote:
> On Fri, Sep 11, 2026, Alice wrote:
>> Usually, duplicate keys are handled on udev level, see
>> /lib/udev/hwdb.d/60-keyboard.hwdb [...] From the source code of
>> ideapad-laptop, I see that MICMUTE scan codes are 8 and 0x13e - you n=
eed
>> to unmap one of those.
>
> That worked, thanks a lot. Confirming with details in case they are us=
eful.

Glad that worked!

> The two paths do use different scan codes, so unmapping one is enough =
and
> the WMI driver can stay bound. Reading the raw evdev stream from "Idea=
pad
> extra buttons" while pressing Fn+F4 three times, before any change:
>
>   +7.176s  MSC_SCAN =3D 0x8    EV_KEY 248 (KEY_MICMUTE) pressed/releas=
ed
>   +7.182s  MSC_SCAN =3D 0x13e  EV_KEY 248 (KEY_MICMUTE) pressed/releas=
ed
>   +10.878s MSC_SCAN =3D 0x8    EV_KEY 248 (KEY_MICMUTE) pressed/releas=
ed
>   +10.878s MSC_SCAN =3D 0x13e  EV_KEY 248 (KEY_MICMUTE) pressed/releas=
ed
>   +14.747s MSC_SCAN =3D 0x8    EV_KEY 248 (KEY_MICMUTE) pressed/releas=
ed
>   +14.752s MSC_SCAN =3D 0x13e  EV_KEY 248 (KEY_MICMUTE) pressed/releas=
ed
>
> 0x8 is the ACPI path (VPC2004:00) and 0x13e is the WMI path
> (8FC0DE0C-B4E4-43FD-B0F3-8871711C1294-17). I verified this by unbinding
> ideapad_wmi, which left only the 0x8 events.
>
> Your rule worked as written, with no changes and no reboot needed:
>
> evdev:name:Ideapad extra buttons:dmi:*:svnLENOVO:pn21MV:pvrThinkBook14=
G7ARP:*
>  KEYBOARD_KEY_13e=3Dunknown
>
> After `systemd-hwdb update` and `udevadm trigger --action=3Dchange
> /sys/class/input/event12`, the second event is reported as KEY_UNKNOWN
> (240) instead of KEY_MICMUTE, and the key now toggles the microphone
> reliably on every press, including the mic-mute LED:
>
>   +5.268s  MSC_SCAN =3D 0x8    EV_KEY 248 pressed/released
>   +5.273s  MSC_SCAN =3D 0x13e  EV_KEY 240 pressed/released
>
> I will submit this to systemd as a pull request against 60-keyboard.hw=
db.
>
> One question, only if it is worth your time: is it expected that this
> firmware reports the same key on both paths, or is the ThinkBook 14 G7=
 ARP
> simply a model that was never covered by a quirk?

Unfortunately, no idea. Having duplicate key reports is not uncommon in
various laptops. I don't know if this particular one is specific for
your model or a wider family. You can start with submitting the hwdb
rule for your specific model, and if other users with other models are
affected too, they can generalize it.

My old IdeaPad Z570 doesn't have a micmute button, as far as I remember.

> I ask because there is no
> entry for this machine (pn21MV) in 60-keyboard.hwdb, while several oth=
er
> ThinkBook models are listed, so I do not know whether other keys on th=
is
> laptop are affected in the same way and just have not been noticed yet.

Well, you can test all special keys by pressing them and watching evdev
events to identify all the buggy keys, to submit quirks for all of them
at once. From what I see in the driver, KEY_PROG{1,2,3,4} can be
generated both via ideapad_acpi and ideapad_wmi, so worth checking those
(Fn+Q, dark mode, sound profile, star button, Lenovo proprietary stuff,
and similar, if you have any of those on your laptop). But there is also
a possibility that some keys can be reported via both ideapad_laptop and
atkbd, so it's still worth checking all of the special keys.

Regards,
Alice

> Thanks again for the quick and clear answer. As a first-time reporter,=
 it
> was much easier than I expected.
>
> Kevin Christian Charpentier
>
>
> On Fri, Sep 11, 2026, Alice wrote:
>>
>> On Fri, Sep 11, 2026, at 05:49, Kevin Charpentier wrote:
>> > Hi,
>> >
>> > I am reporting a bug where the mic-mute key (Fn+F4) is reported twi=
ce by
>> > ideapad-laptop on a Lenovo ThinkBook 14 G7 ARP, which makes the key=
 appear
>> > not to work at all under GNOME.
>> >
>> > This is my first report to this list, so please let me know if anyt=
hing is
>> > missing or should be sent differently.
>> >
>> > System
>> > ------
>> > Machine:  Lenovo ThinkBook 14 G7 ARP (21MV)
>> > BIOS:     P6CN34WW, 03/10/2026 (EC 1.37, BIOS release 1.34)
>> > Kernel:   7.2.4-200.fc44.x86_64 (Fedora 44)
>> > Module:   drivers/platform/x86/lenovo/ideapad-laptop.ko
>> >
>> > DMI modalias:
>> > dmi:bvnLENOVO:bvrP6CN34WW:bd03/10/2026:br1.34:efr1.37:svnLENOVO:pn2=
1MV:pvrThinkBook14G7ARP:rvnLENOVO:rnLNVNB161216:rvrNODPK:cvnLENOVO:ct10:=
cvrThinkBook14G7ARP:skuLENOVO_MT_21MV_BU_idea_FM_ThinkBook14G7ARP:pfaThi=
nkBook14G7ARP:
>> >
>> > Symptom
>> > -------
>> > Pressing Fn+F4 appears to do nothing. The GNOME on-screen indicator=
 does
>> > appear and the mic-mute LED blinks, but the microphone mute state is
>> > unchanged. Roughly one press out of several does take effect, which=
 I
>> > believe happens when the firmware drops one of the two notification=
s.
>> >
>> > The key is not unmapped: KEY_MICMUTE is emitted correctly. It is em=
itted
>> > twice per physical keypress, 1-7 ms apart, so the userspace toggle =
is
>> > applied an even number of times and the state returns to its origin=
al
>> > value before anything can observe it.
>> >
>> > Note that polling the mute state does not reveal this. Both toggles=
 happen
>> > within ~7 ms, so a 100 ms poll of the PipeWire source sees no chang=
e at all
>> > and the key looks completely dead.
>> >
>> > Evidence
>> > --------
>> > Three physical keypresses, via `sudo libinput debug-events --show-k=
eycodes`.
>> > Note the millisecond-apart pairs, which cannot be produced by a fin=
ger:
>> >
>> > -event12  KEYBOARD_KEY   +0.860s    KEY_MICMUTE (248) pressed
>> >  event12  KEYBOARD_KEY   +0.860s    KEY_MICMUTE (248) released
>> >  event12  KEYBOARD_KEY   +0.867s    KEY_MICMUTE (248) pressed
>> >  event12  KEYBOARD_KEY   +0.868s    KEY_MICMUTE (248) released
>> >  event12  KEYBOARD_KEY   +3.137s    KEY_MICMUTE (248) pressed
>> >  event12  KEYBOARD_KEY   +3.137s    KEY_MICMUTE (248) released
>> >  event12  KEYBOARD_KEY   +3.140s    KEY_MICMUTE (248) pressed
>> >  event12  KEYBOARD_KEY   +3.140s    KEY_MICMUTE (248) released
>> >  event12  KEYBOARD_KEY   +4.886s    KEY_MICMUTE (248) pressed
>> >  event12  KEYBOARD_KEY   +4.886s    KEY_MICMUTE (248) released
>> >  event12  KEYBOARD_KEY   +4.891s    KEY_MICMUTE (248) pressed
>> >  event12  KEYBOARD_KEY   +4.891s    KEY_MICMUTE (248) released
>> >
>> > All events come from the same input device, "Ideapad extra buttons"
>> > (phys=3Dideapad/input0), created by ideapad-laptop.
>> >
>> > Analysis
>> > --------
>> > On this machine ideapad-laptop is bound to two devices at the same =
time,
>> > and both report this key into the same input device:
>> >
>> >   1. ACPI: platform device VPC2004:00 (driver ideapad_acpi)
>> >   2. WMI:  8FC0DE0C-B4E4-43FD-B0F3-8871711C1294-17 (driver ideapad_=
wmi),
>> >            notify_id D0, instance_count 1
>> >
>> > Unbinding the WMI device removes the duplicate completely:
>> >
>> >   echo 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294-17 > \
>> >        /sys/bus/wmi/drivers/ideapad_wmi/unbind
>> >
>> > After the unbind, the same three keypresses produce single events, =
with
>> > human-scale gaps instead of millisecond pairs:
>> >
>> >  event12  KEYBOARD_KEY   +0.298s    KEY_MICMUTE (248) pressed/relea=
sed
>> >  event12  KEYBOARD_KEY   +1.043s    KEY_MICMUTE (248) pressed/relea=
sed
>> >  event12  KEYBOARD_KEY   +2.880s    KEY_MICMUTE (248) pressed/relea=
sed
>> >
>> > The key then works correctly in GNOME, and so does the mic-mute LED.
>> >
>> > I also verified that unbinding the WMI device does not regress anyt=
hing
>> > else exposed by the driver: fn_lock, conservation_mode, camera_powe=
r,
>> > usb_charging and fan_mode still respond, the platform::fnlock,
>> > platform::kbd_backlight, platform::mute and platform::micmute LEDs =
are
>> > still present, and the kernel logs no errors.
>> >
>> > Questions
>> > ---------
>> > I am not sure where the fix belongs, so I am reporting rather than
>> > proposing a patch:
>> >
>> >   - Is the firmware expected to notify this key on both the ACPI an=
d the
>> >     WMI path, with the driver responsible for reporting it only onc=
e?
>> >   - Or should ideapad-laptop not register the WMI hotkey path on mo=
dels
>> >     where the ACPI path already reports these keys?
>> >
>> > I am happy to test patches or gather any further information. I can=
 also
>> > provide the full acpidump, the WMI BMOF dump, or udev debug logs if=
 that
>> > helps.
>>
>> Hi Kevin,
>>
>> Thanks for the detailed report!
>>
>> Usually, duplicate keys are handled on udev level, see /lib/udev/hwdb=
.d/60-
>> keyboard.hwdb: it contains lots of definitions with "=3Dunknown", whi=
ch
>> unmap certain keys, often because they are already handled by another
>> input device. Although adding a kernel quirk is also possible.
>>
>> There is no need to unbind or blacklist the entire WMI driver for thi=
s.
>> You can try adding a rule locally to /etc/udev/hwdb.d/61-keyboard-
>> custom.hwdb, run `systemd-hwdb update`, and reboot to test it. The ru=
le
>> will probably look like this (I can't test it):
>>
>> evdev:name:Ideapad extra buttons:dmi:*:svnLENOVO:pn21MV:pvrThinkBook1=
4G7ARP:*
>>  KEYBOARD_KEY_13e=3Dunknown
>>
>> If it doesn't work on the first attempt, try making the DMI match more
>> generic for testing. From the source code of ideapad-laptop, I see th=
at
>> MICMUTE scan codes are 8 and 0x13e =E2=80=94 you need to unmap one of=
 those.
>>
>> If that works, you can submit a pull request to systemd.
>>
>> Hope that helps,
>> Alice
>>
>> > Workaround for other users of this model
>> > ----------------------------------------
>> > A udev rule that unbinds the WMI device at boot:
>> >
>> > ACTION=3D=3D"bind", SUBSYSTEM=3D=3D"wmi",
>> > ATTR{guid}=3D=3D"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", RUN+=3D"/bi=
n/sh -c
>> > 'grep -qx 21MV /sys/class/dmi/id/product_name && echo %k >
>> > /sys/bus/wmi/drivers/ideapad_wmi/unbind'"
>> >
>> > Thanks,
>> > Kevin Christian Charpentier
