Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807CC30675C;
	Wed, 13 May 2026 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684115; cv=none; b=SP+Rya1gsULqKBIBAp20Xec4WfawduyGLph06igAvbbb6RJ4NUBj+b2/8KyIXwx5DLkJFkIF3XieUyK5gnQ/G3BJlLpgqL1ACTQL7H0BURCgOSPfKU0mHqqxglRpyz9awKZEvGpZLmSG+vHf4E21AtK1f3tC/bX02HWsYsQuF1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684115; c=relaxed/simple;
	bh=QQsWC/6RP4h2rDpTCbD4w2KNaVFe9nrBwjdo3jzeOyc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hk2fvKUsqRGGIr1x4Wc+Yp1dExzbDYlSIo2E/QnG/ufY6vBcGXA2yw1RYIlUW49nLXttfEWzEjmbNKuLUQuw1MbgLos+oOjLi+kzbO4JUgC71Lc9vC4GzsnHI7PweFWt2d6u53T4hPg9Rb7h6XYOIuYpbMtq1lYCrAY56WToVkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=cUj64p9E; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="cUj64p9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail; t=1778684100; x=1778943300;
	bh=YGSqDBDu4V+seUOdqEgLPtTyCUUw7EFHKh98qDACBXw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cUj64p9EQrCNQ+MliSuUBc1GVk5b3Q854+vVQ+YCyZoJzMXExxS2fTUM9isPq+nnn
	 c2gJiWAPkfjRdv+faxDmHekEab8K9MhSAHOFo8bNplTnrlmYkU76UGY+sNcRMD6EN3
	 REmNaHJ/nD4Do0ahAgHI/q7CIiWnelVT1QwjOywr1+Gc5V0/4Jyz2718ojfBIymO8k
	 oULRGWR0n2IVSxVxO9bkl2IUUdXqfASBXEKxv9jBftuUY6ahr/wAhhe5yP98lBiebh
	 iCo8eDZAGtjnASlIg8P6hKgZiFZaCxuv2p0qcJ7Ell4Wm/DDZZOr94339IBW8eqq3Q
	 JN1m2xH+FCUdg==
Date: Wed, 13 May 2026 14:54:53 +0000
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, platform-driver-x86@vger.kernel.org
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, mpearson-lenovo@squebb.ca, Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH 0/2] asus-armoury: gate PPT writes on active fan curves
Message-ID: <b81a047b-4dc5-4537-adfb-a38ad66bbc25@ghoul.dev>
In-Reply-To: <79556116-6362-4C2B-ADBA-00A325D79CB5@gmail.com>
References: <20260511061901.907540-1-yaseen@ghoul.dev> <79556116-6362-4C2B-ADBA-00A325D79CB5@gmail.com>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: b500d49136336e9efed06d70c6cf41ea5f081daf
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/05/2026 20:14, Derek J. Clark wrote:
> On May 10, 2026 11:19:14 PM PDT, Ahmed Yaseen <yaseen@ghoul.dev> wrote:
>> My first kernel patch series, posted in agreement with Denis Benato (Cc'=
d).
>>
>> On 28 ASUS ROG laptop models flagged with requires_fan_curve in the
>> asus-armoury DMI power_data table, the BIOS ACPI method SPLX silently
>> discards Package Power Tracking (PPT) writes unless the fan mode is
>> set to Manual (FANM=3D4). FANM is set to 4 by the DEFC method when a
>> custom fan curve is written. Until then, the WMI DEVS call returns
>> success but the firmware ignores the value, so userspace sees no
>> effect from writes to ppt_pl1_spl, ppt_pl2_sppt, ppt_pl3_fppt,
>> ppt_apu_sppt or ppt_platform_sppt.
>>
>=20
> This very nearly touches on an issue that has been present in the asus_ar=
moury driver for a while, and presents a possible avenue to correct it. Whe=
n originally adding PPT adjustments it was discussed that doing so should b=
e gated under the "custom" platform profile [1]. This was simple to do for =
the Lenovo WMI drivers because that interface includes a BIOS custom mode a=
nd requires it to be set for PPT settings to take effect. This soft "requir=
ement" was missed when asus_armoury was accepted, and it currently allows P=
PT settings to override manufacturer intent. Please correct me if I'm wrong=
, but I believe the fan curves associated in BIOS for low-power, balanced, =
and performance will not automatically adjust if a user changes the TDP out=
side of the window. I.e. setting low power and then maximum SPL would leave=
 the fans in a quiet mode.
>=20
> Since some devices require this bit to be set, it seems like a good oppor=
tunity to gate the platform profile under custom, and use custom to set the=
 performance mode and this bit, then allow userspace to set the curve and p=
pt values.
>=20
> Adding Mario to CC for his SA/comments on this proposal.
>=20
> - Derek
>=20
>=20
> 1: https://lore.kernel.org/platform-driver-x86/20241206031918.1537-17-mar=
io.limonciello@amd.com/

About the PPT settings overriding manufacturer intent, I believe this is=20
a misunderstanding. I believe Derek is pointing at how currently PPT=20
adjustments for these models appear to apply without a custom fan curve=20
while manufacturer intends for the TDP to only be adjustable with a=20
custom fan curve applied. To clarify, for the modules that require a=20
custom fan curve, TDP value adjustments are currently being completely=20
ignored by the BIOS because the requirement for the existence of a fan=20
curve prevents it at a hardware level. Meanwhile on the kernel side of=20
things, it would appear that TDP values are actually being set, while it=20
is actually ignored. This is the reason for my gating custom TDP values=20
behind requires_fan_curve for models that require it. Please correct me=20
if i am understanding the previous message incorrectly though.

As for the other issue mentioned (if a user were to choose low power and=20
set maximum SPL), this is an issue I was not able to properly recreate.=20
I have attempted to do this but on my device at least, a custom TDP=20
cannot be set without a custom fan curve. Even in low power mode, I am=20
able to ramp my fans up to 100% with a custom fan curve and increasing=20
TDP knobs works perfectly and my fans are loud as expected. It may be=20
the case that due to the bug I mentioned earlier, TDP was possible to=20
visually max out without a custom fan curve while being in quiet mode.

However, on an older device that doesn't require a custom fan curve for=20
TDP might behave as Derek mentioned, as there is no hardware level=20
enforcement for the user to take over the fan curve before changing TDP.=20
I am unable to test this as I do not have such a device, but I believe=20
this is how the device's design is. The user can simply use custom fan=20
curves if their device supports it in this case. Instead, there are=20
min-max power limits for each power profile defined for these to prevent=20
damage.

As for the proposal to implement a 'custom' power profile, I believe=20
this needs more discussion. Unlike Lenovo, ASUS does not have this as a=20
native option in the BIOS, Instead ASUS ships 4 fan modes (Quiet,=20
Balanced, Performance, Custom) which we are already using. The long term=20
plan I have in mind for this is that the custom fan curve can be applied=20
separately to all 3 performance profiles, saved somewhere, and switched=20
between them by the user.

So while I can see a lot of things becoming cleaner if a custom fan mode=20
mapped directly to a custom power profile, too many issues come together=20
with it. For instance, would this new custom mode use Performance,=20
Balanced, or Quiet as a baseline? what about the TDP value limits that=20
differ per profile according to Asus Armoury Crate in Widnows? it also=20
causes more complications for some users that only decrease TDP to=20
reduce power consumption as they will then also be switched to a custom=20
mode by the kernel which would now apply a custom fan curve which also=20
needs us to create defaults for these. In the case of Lenovo, the BIOS=20
likely ships with these baselines per device but this is not applicable=20
in our case.

If we can discuss this custom mode in more depth and the pros outweigh=20
the cons, I believe we can discuss this for a follow-up patch

- Ahmed Yaseen

>=20
>> The requires_fan_curve flag has existed in the per-model power_data
>> entries for some time but was never read. This series wires it up:
>>
>>   Patch 1: Adds the actual gate. Exports
>>     asus_wmi_custom_fan_curve_is_enabled() from asus-wmi so
>>     asus-armoury can query fan-curve state across module boundaries,
>>     and returns -ENODEV with a pr_warn() from the PPT write path on
>>     affected models when no fan curve is active.
>>
>>   Patch 2: Exposes the same flag to userspace as a read-only sysfs
>>     attribute (requires_fan_curve) so tools like asusctl and rogcc
>>     can surface the prerequisite to the user before issuing PPT
>>     writes. Documented in
>>     Documentation/ABI/testing/sysfs-class-firmware-attributes.
>>
>> Testing:
>>   Verified on G835LW (ROG Strix SCAR 18 2025, requires_fan_curve=3Dtrue)=
:
>>   - With no fan curve active, writes to ppt_pl1_spl return -ENODEV
>>     and the cached value is unchanged.
>>   - With pwm1_enable=3D1 on /sys/class/hwmon/.../asus_custom_fan_curve,
>>     PPT writes succeed and readback matches.
>>   - The pr_warn fires exactly once per rejected write.
>>
>>   I do not have access to the other 27 affected models. Testers from
>>   any of these would be appreciated: FX507VI, FX507VV, FX507Z,
>>   GA402X, GA403UI, GA403UV, GA403WM, GA403WR, GA403WW, GA605W,
>>   GU605CR, GU605CW, GU605CX, GU605M, G513I, G513QM, G513QY, G513R,
>>   G614J, G615LR, G634J, G713PV, G733C, G733P, G814J, G834J, G835LR.
>>
>> Ahmed Yaseen (2):
>>   platform/x86: asus-armoury: gate PPT writes behind active fan curve
>>   platform/x86: asus-armoury: expose requires_fan_curve via sysfs
>>
>> .../testing/sysfs-class-firmware-attributes   | 25 +++++++++++++
>> drivers/platform/x86/asus-armoury.c           | 35 +++++++++++++++++++
>> drivers/platform/x86/asus-wmi.c               | 28 +++++++++++++++
>> include/linux/platform_data/x86/asus-wmi.h    |  5 +++
>> 4 files changed, 93 insertions(+)
>>
>=20


