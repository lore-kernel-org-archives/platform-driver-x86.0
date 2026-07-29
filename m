Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC1D4949E3;
	Wed, 29 Jul 2026 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331895; cv=none; b=HfhnAVptHx66AbJ3gD4Wd61pBH54N3CjDkJ+IPmCgWWfXlgpERa9X10YEFvlEJZ27HxAChmdOvQ0jw/icsaF05Db/Moo7PNA7uVnzYBYH5dFAYhuxxuujx94c8edFTS/gQ6Pdogdrbq2sivaAVhg8V1Z+iJuzLd1lGjAItNOpI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331895; c=relaxed/simple;
	bh=PE+JF89SMlfeZxOlIcRRIK2OIC7bsO98a0NREVFSzAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DwjicFI9B6xOmOUSSzV34ukMEhhdX/6ovpsEkqNXc+01y9pbTFPTVExf3UKZgoAyW0CSjCNgXIEB1dc+27YGl3NZC+D2yhAdo9H41iq91vc0iZiQQ359Jc6ygLApZcUWPazlJ/CQ1y9EsJpQmONtylElXV0anTlRTDX02arodno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BY/5ifIB; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BY/5ifIB"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3585883F5F;
	Wed, 29 Jul 2026 15:22:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5U38L-Qqxn8; Wed, 29 Jul 2026 15:22:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785331346; bh=PE+JF89SMlfeZxOlIcRRIK2OIC7bsO98a0NREVFSzAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BY/5ifIBuMOLcPfUicDXI1aO7VU/KjhthqKxYFtH37wY2PEeABGLiZwedtdD/G2FF
	 klnq8f+Sv40LEEW3wRRVuIWcNiSFxptyXoLAQdhiM63hT6YkxOS5jXCOT50eVFRsGi
	 DWclpW3dzy1y6VqKSgm1Wbbpoh8767gQ384qynuYZvBZCSMaqGBVWE3bKmXfbenSxw
	 /QhSiio0LF+zZ4SJBjLqbecaCZ3ZnnDpPbSMlfy8aJtpaxmA58UCWB3jGlppQBQQJW
	 5ZU9KJN4MjKF+xCZR8DHgHkKBw42uDKg891ioh1Q60dveGtsUFBp/peFUORhMyPm0F
	 7WK3UyTglw/vQ==
From: Marco Scardovi <scardracs@disroot.org>
To: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>
Cc: luke@ljones.dev, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/x86: asus-armoury: add Whisper Mode support
Date: Wed, 29 Jul 2026 15:22:13 +0200
Message-ID: <W4pHviaQQ-qfwmORrCObjQ@disroot.org>
In-Reply-To: <ae9b94f9-7108-4973-9a99-79a008170b5d@linux.dev>
References:
 <20260728071843.130492-1-scardracs@disroot.org>
 <846ca0a3-bd37-4424-aa95-6ab255f48a48@kernel.org>
 <ae9b94f9-7108-4973-9a99-79a008170b5d@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In data mercoled=C3=AC 29 luglio 2026 15:10:56 Ora legale dell=E2=80=99Euro=
pa centrale, Denis Benato ha scritto:
>=20
> On 7/29/26 09:32, Hans de Goede wrote:
> > Hi Marco,
> >
> > On 28-Jul-26 15:56, Marco Scardovi wrote:
> >> In data marted=C3=AC 28 luglio 2026 13:39:39 Ora legale dell=E2=80=99E=
uropa centrale, Hans=20
> >> de Goede ha scritto:
> >>> Hi,
> >>>
> >>> Thank you for your patch.
> >>>
> >>> On 28-Jul-26 09:18, Marco Scardovi wrote:
> >>>> This series introduces support for ASUS WMI Whisper Mode hardware co=
ntrols
> >>>> in the asus-wmi header and asus-armoury driver.
> >>>>
> >>>> Background & Findings:
> >>>> ----------------------
> >>>> After talking with Denis and thanks to NeuroMarshal reverse engineer=
ing
> >>>> and
> >>>> firmware trace analysis on modern ASUS laptops, three specific WMI D=
evice
> >>>> IDs were identified that manage acoustic profiles and thermal regula=
tion
> >>>> under ASUS Whisper Mode:
> >>>>
> >>>> 1. ASUS_WMI_DEVID_WHISPER_MODE (0x0012007A):
> >>>>    - Controls the BIOS-level Whisper Mode acoustic profile toggle
> >>>>    (read/write boolean).>=20
> >>>> 2. ASUS_WMI_DEVID_WHISPER_ENABLE (0x00090022):
> >>>>    - Enables or disables Dynamic Whisper acoustic regulation (read/w=
rite
> >>>>    boolean).>=20
> >>>> 3. ASUS_WMI_DEVID_WHISPER_STATUS (0x00090023):
> >>>>    - Reports status and allows runtime control over Dynamic Whisper =
state
> >>>>    (read/write boolean).
> >>> I wonder how this interacts with the platform_profile stuff ?
> >>>
> >>> I would expect enabling whisper mode to lower the max performance,
> >>> so does this automatically change the platform_profile away
> >>> from performance when it is set to performance ?
> >>>
> >>> Note the platform_profile API is extensible. To me it seems more
> >>> logical to expose this as a whisper mode platform-profile ?
> >>>
> >>> Regards,
> >>>
> >>> Hans
> >> Hi Hans,
> >>
> >> Thanks for the feedback!
> >> Here you can find my opinions on your questions.
> >>
> >> 1. Interaction with platform_profile:
> >> In ASUS laptops, where presents, Whisper Mode operates as an
> >> independent boolean toggle/feature controlling fan acoustic target lim=
its in
> >> firmware/EC, rather than acting as a global thermal profile. Setting=20
> >> WHISPER_MODE or WHISPER_ENABLE via WMI sends a direct call to the EC/B=
IOS,=20
> >> which adjusts acoustic thresholds internally without altering the acti=
ve=20
> >> platform_profile state (throttle_thermal_policy) in asus-wmi. IIRC on =
Windows=20
> >> it even permits to "hear" the ambient to make the fans run in a way to=
 blend=20
> >> with the ambient noise.
> >>
> >> 2. platform_profile vs firmware_attributes (asus-armoury):
> >> platform_profile is designed for mutually exclusive global power/therm=
al
> >> modes (Quiet, Balanced, Performance). Whisper Mode, on the other hand,=
=20
> >> consists of independent BIOS feature toggles (0/1 controls for BIOS Wh=
isper=20
> >> Mode, Dynamic Whisper Enable, and Status).
> >> Since asus-armoury is dedicated to exposing BIOS/Armoury Crate firmware
> >> attributes via fw_attributes_class (similar to nv_dynamic_boost,
> >> nv_temp_target, panel_od, etc.), exposing these three WMI controls as
> >> sysfs firmware attributes fits the overall design of asus-armoury much
> >> better than extending platform_profile.
> >>
> >> I hope I've been of help. Feel free to let me know if you have more=20
> >> questions: I'll try to answer the best of my capacities.
> > Thank you for clarifying things. Since the EC/BIOS interface sees this
> > as 2 independent settings, I agree that exposing this as a firmware
> > attr is the best way to expose this.
> >
> > Its a bit weird that one can select Performance profile and enable
> > whisper mode at the same time. But if that is how the Asus firmware
> > interfaces work, then that is how it is.
> Hello Hans and Marco,
>=20
> I agree that this is weird and we don't have a device with whisper mode,
> but there is the possibility of the official windows app allowing whisper=
 mode
> only on certain modes: we would need to find someone with windows
> to confirm this, but I also don't think binding whisper to quiet/low perf=
ormance
> is a bad idea.
>=20
> My opinion is that either whisper gets its own profile and is a combinati=
on of
> quiet + whisper set to 1 or we check what windows does since I don't want
> to have hardware running in configurations that ASUS never intended to.
>=20
> Best regards,
> Denis
> > Regards,
> >
> > Hans
> >
> >
>=20
Hi Denis,
I made more checks on Whisper Mode and find out why it isn't under a single
power profile: it works the contrary of power profiles.

To be more specific: while power profiles tends to match the fans with the
TDP, in Whisper Mode it sets the max power (if under performance) but cut
it if the dB/RPMs are too high to respect the Whisper Mode. So it basically
works for any power profiles but instead of pushing up the fans to cool the
CPU/GPU, it kills the power to maintain the loudness in check

Let me know if it is a feature you want or not. If we end up deciding to ki=
ll
it feel free to let me know.

Best regards,
Marco


