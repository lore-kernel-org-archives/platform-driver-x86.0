Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C31459AC5;
	Wed, 29 Jul 2026 14:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336231; cv=none; b=pxon5VX+KWd9qCK/lzVJmys2tU5RYT3puGxQ3M/X+BDDxAbmAEfVV/jlOWoP3Wt7YzK0NQMdX9drP+BeGHAqfZjDNrc+0ZFD//d7h9dnSZMreWLNul41+oYg2Uvu/4xCqHuqHYYai6KlXg85G2YrAswDp09hi3AELBovxTmKrJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336231; c=relaxed/simple;
	bh=1iw7nNcJl6uV9WVTaLdUH7sCW2a3SHle96Et+2A58/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PK9vu4pI/spjggb4lpPRDOIClt+kvNVw3O1xNFy3C/e/qLTj+5lJU7OaBJqvEzJoYU2PQC9XIP/kXgKzEamK+MvppDCu8aTc5ay3J5aT5ULuHskWfrVgYLn/rc8tKZgh9ZdXnCe9KDw8CWy7Pxc8FrBgl7QEru3tMRhOVTi1IOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=WZ8ieeWN; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="WZ8ieeWN"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AFB05845C9;
	Wed, 29 Jul 2026 16:43:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZHv58qcKQmj; Wed, 29 Jul 2026 16:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785336224; bh=1iw7nNcJl6uV9WVTaLdUH7sCW2a3SHle96Et+2A58/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WZ8ieeWNZGsb9w0dEK9qq5Eo60hxxbo6sLuLA2nNN0Aug6kAZV4XQw74aFzpjBX21
	 BNq8JjMIel2nW8xkf0GujkMhoklUp/JlLBHuBctSjanGT6/jJ424nk4KcjppbsV/j2
	 NaQlMkNd4PYAYsM4SXff/T4OD7vI30kB+iGcdEoNLuQ3eZSAq1gIroiJsWu2Q+6H69
	 D2vTzQAMIVpoHv9Mv+Wu5a/WZA1af+VzyfQUnia0EfjE2ZnjbogmFFOi672qog19kI
	 2/06EH3/u6MFjzel6yqBW0wgyD+pLLSW/Ktd4b+BSUmlSFuPgxgkAkOHrQqxC4e5cH
	 3FAWAksd3AeUQ==
From: Marco Scardovi <scardracs@disroot.org>
To: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>
Cc: luke@ljones.dev, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/x86: asus-armoury: add Whisper Mode support
Date: Wed, 29 Jul 2026 16:43:32 +0200
Message-ID: <wArK7qMITou2-I6Hv4EmsA@disroot.org>
In-Reply-To: <a2efcc14-c4a5-4b16-9fed-c01176cc34b6@linux.dev>
References:
 <20260728071843.130492-1-scardracs@disroot.org>
 <W4pHviaQQ-qfwmORrCObjQ@disroot.org>
 <a2efcc14-c4a5-4b16-9fed-c01176cc34b6@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In data mercoled=C3=AC 29 luglio 2026 15:34:28 Ora legale dell=E2=80=99Euro=
pa centrale, Denis Benato ha scritto:
>=20
> On 7/29/26 15:22, Marco Scardovi wrote:
> > In data mercoled=C3=AC 29 luglio 2026 15:10:56 Ora legale dell=E2=80=99=
Europa centrale, Denis Benato ha scritto:
> >> On 7/29/26 09:32, Hans de Goede wrote:
> >>> Hi Marco,
> >>>
> >>> On 28-Jul-26 15:56, Marco Scardovi wrote:
> >>>> In data marted=C3=AC 28 luglio 2026 13:39:39 Ora legale dell=E2=80=
=99Europa centrale, Hans=20
> >>>> de Goede ha scritto:
> >>>>> Hi,
> >>>>>
> >>>>> Thank you for your patch.
> >>>>>
> >>>>> On 28-Jul-26 09:18, Marco Scardovi wrote:
> >>>>>> This series introduces support for ASUS WMI Whisper Mode hardware =
controls
> >>>>>> in the asus-wmi header and asus-armoury driver.
> >>>>>>
> >>>>>> Background & Findings:
> >>>>>> ----------------------
> >>>>>> After talking with Denis and thanks to NeuroMarshal reverse engine=
ering
> >>>>>> and
> >>>>>> firmware trace analysis on modern ASUS laptops, three specific WMI=
 Device
> >>>>>> IDs were identified that manage acoustic profiles and thermal regu=
lation
> >>>>>> under ASUS Whisper Mode:
> >>>>>>
> >>>>>> 1. ASUS_WMI_DEVID_WHISPER_MODE (0x0012007A):
> >>>>>>    - Controls the BIOS-level Whisper Mode acoustic profile toggle
> >>>>>>    (read/write boolean).>=20
> >>>>>> 2. ASUS_WMI_DEVID_WHISPER_ENABLE (0x00090022):
> >>>>>>    - Enables or disables Dynamic Whisper acoustic regulation (read=
/write
> >>>>>>    boolean).>=20
> >>>>>> 3. ASUS_WMI_DEVID_WHISPER_STATUS (0x00090023):
> >>>>>>    - Reports status and allows runtime control over Dynamic Whispe=
r state
> >>>>>>    (read/write boolean).
> >>>>> I wonder how this interacts with the platform_profile stuff ?
> >>>>>
> >>>>> I would expect enabling whisper mode to lower the max performance,
> >>>>> so does this automatically change the platform_profile away
> >>>>> from performance when it is set to performance ?
> >>>>>
> >>>>> Note the platform_profile API is extensible. To me it seems more
> >>>>> logical to expose this as a whisper mode platform-profile ?
> >>>>>
> >>>>> Regards,
> >>>>>
> >>>>> Hans
> >>>> Hi Hans,
> >>>>
> >>>> Thanks for the feedback!
> >>>> Here you can find my opinions on your questions.
> >>>>
> >>>> 1. Interaction with platform_profile:
> >>>> In ASUS laptops, where presents, Whisper Mode operates as an
> >>>> independent boolean toggle/feature controlling fan acoustic target l=
imits in
> >>>> firmware/EC, rather than acting as a global thermal profile. Setting=
=20
> >>>> WHISPER_MODE or WHISPER_ENABLE via WMI sends a direct call to the EC=
/BIOS,=20
> >>>> which adjusts acoustic thresholds internally without altering the ac=
tive=20
> >>>> platform_profile state (throttle_thermal_policy) in asus-wmi. IIRC o=
n Windows=20
> >>>> it even permits to "hear" the ambient to make the fans run in a way =
to blend=20
> >>>> with the ambient noise.
> >>>>
> >>>> 2. platform_profile vs firmware_attributes (asus-armoury):
> >>>> platform_profile is designed for mutually exclusive global power/the=
rmal
> >>>> modes (Quiet, Balanced, Performance). Whisper Mode, on the other han=
d,=20
> >>>> consists of independent BIOS feature toggles (0/1 controls for BIOS =
Whisper=20
> >>>> Mode, Dynamic Whisper Enable, and Status).
> >>>> Since asus-armoury is dedicated to exposing BIOS/Armoury Crate firmw=
are
> >>>> attributes via fw_attributes_class (similar to nv_dynamic_boost,
> >>>> nv_temp_target, panel_od, etc.), exposing these three WMI controls as
> >>>> sysfs firmware attributes fits the overall design of asus-armoury mu=
ch
> >>>> better than extending platform_profile.
> >>>>
> >>>> I hope I've been of help. Feel free to let me know if you have more=
=20
> >>>> questions: I'll try to answer the best of my capacities.
> >>> Thank you for clarifying things. Since the EC/BIOS interface sees this
> >>> as 2 independent settings, I agree that exposing this as a firmware
> >>> attr is the best way to expose this.
> >>>
> >>> Its a bit weird that one can select Performance profile and enable
> >>> whisper mode at the same time. But if that is how the Asus firmware
> >>> interfaces work, then that is how it is.
> >> Hello Hans and Marco,
> >>
> >> I agree that this is weird and we don't have a device with whisper mod=
e,
> >> but there is the possibility of the official windows app allowing whis=
per mode
> >> only on certain modes: we would need to find someone with windows
> >> to confirm this, but I also don't think binding whisper to quiet/low p=
erformance
> >> is a bad idea.
> >>
> >> My opinion is that either whisper gets its own profile and is a combin=
ation of
> >> quiet + whisper set to 1 or we check what windows does since I don't w=
ant
> >> to have hardware running in configurations that ASUS never intended to.
> >>
> >> Best regards,
> >> Denis
> >>> Regards,
> >>>
> >>> Hans
> >>>
> >>>
> > Hi Denis,
> > I made more checks on Whisper Mode and find out why it isn't under a si=
ngle
> > power profile: it works the contrary of power profiles.
> >
> > To be more specific: while power profiles tends to match the fans with =
the
> > TDP, in Whisper Mode it sets the max power (if under performance) but c=
ut
> > it if the dB/RPMs are too high to respect the Whisper Mode. So it basic=
ally
> > works for any power profiles but instead of pushing up the fans to cool=
 the
> > CPU/GPU, it kills the power to maintain the loudness in check
> Alright, perfect.
> > Let me know if it is a feature you want or not. If we end up deciding t=
o kill
> > it feel free to let me know.
> Yes I want this to be in the kernel: I simply don't want to do things that
> were never intended to be done, other than that I have no reservations.
>=20
> So you have my OK with these.
>=20
>=20
> Thank you,
> Denis
>=20
> > Best regards,
> > Marco
> >
> >
>=20
Hi everyone,

I've made more and more studies about Whisper Mode and dumped my own laptop
to set my mind straight about Whisper Mode, because I had some more doubts
about it.

TL;DR: Adding Whisper Mode is not useful for our drivers.
TL;DR 2: Whisper Mode enables only when power profile Quiet is set.

Whole version:
After dumping the ACPI DSDT tables and testing runtime calls via a diagnost=
ic=20
module on real hardware, I verified that the Embedded Controller (EC) autom=
atically=20
manages Whisper Mode acoustic capping whenever `platform_profile` is set to=
 "quiet"=20
(thermal policy 0x00120075 =3D 2).

This behavior applies to both internal hardware and connected eGPUs. Becaus=
e the=20
EC handles Whisper Mode natively within the quiet profile, discrete queries=
/writes=20
to WMI IDs 0x0012007A and 0x00090022 return 0xFFFFFFFE (unsupported).=20

Therefore, exposing standalone Whisper Mode sysfs attributes is unnecessary=
,=20
as `platform_profile =3D quiet` already provides full Whisper Mode function=
ality.

Best regards,
Marco


