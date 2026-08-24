Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B4746C842;
	Mon, 24 Aug 2026 16:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589076; cv=none; b=Cj1UPFVt+NmmWoLqWgTvOllNG6CaFOQH7bF4NT5hTHv+mQHdeGEbe615F+a7xx4L+a2gOHv5PY5sr4zr7rvs1KJX7vsVVT6I00vwR1u0LSzuUjjy1D4vMFLiTHOYYjztA9oeu4T6aYjjkAbZ0QcoTbyhVrDUtJjD7CrcH/nAOuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589076; c=relaxed/simple;
	bh=eUroCkCxim85sjTNDEJsgp7DZCHD7cLWs6ogWnSoWvM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Z/mw2QIv26q8KfeckiUwZ9p+Oa+nA1eOEfhbVPiOlVkEIxz2jvNq/Xn/AuHYVCM9m0y9kPzbzQOI0Tuue257944Q9oYp7uQC0RYwneHP1cu/Mj0HSbMki5pvjTSji9mFeYVd2EoFwnhlW+Pk0njHKTTNTUoI4kvkWCfRvoc9hEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMlcMRyr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMlcMRyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787589074; x=1819125074;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eUroCkCxim85sjTNDEJsgp7DZCHD7cLWs6ogWnSoWvM=;
  b=iMlcMRyrYvci6++guLwjkB7YdXsHTtusvoof9nUNXkKgoGIcvXzVbK1o
   358DoTuK6p9HFTbBe86Vy1UNiNJinm1k2aEShQnPX2mhg36smEpgdQ76m
   z6439lHCjtDIVTJK9qqFrsyPwIizgEgsEODUAzUG1YybhNCIrLGEQ7C7d
   XkU8nofDqb0YgdRCmz0C+RXrRcOTEXOAtvnbPMAdCez4qkkrECfn+yxbe
   spckuoFTIn90+neWkU0GvSrjavXI9Lv7IBx9I5JWO6WDRXQpNzUOWm9vt
   eOri1FN/VsRboLnfRNp7YcTLI/jQqAI1TYajBhGl8rxUEzIj43zP4DDAc
   w==;
X-CSE-ConnectionGUID: 1TlCUNbrTweP9DU8fkgGaA==
X-CSE-MsgGUID: XCBe8DMlTWa47RrAFLrfZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88059902"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="88059902"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:31:13 -0700
X-CSE-ConnectionGUID: KgoFzuhWSomjfLP+R1IU7Q==
X-CSE-MsgGUID: twc6k6eBSzuDtG5KZJTb+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="290568413"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:31:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Aug 2026 19:31:07 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Denis Benato <denis.benato@linux.dev>, luke@ljones.dev, 
    corentin.chary@gmail.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] platform/x86: asus-armoury: add Whisper Mode
 support
In-Reply-To: <W4pHviaQQ-qfwmORrCObjQ@disroot.org>
Message-ID: <bd7adc8b-8716-26d8-6963-1d201bda5d1c@linux.intel.com>
References: <20260728071843.130492-1-scardracs@disroot.org> <846ca0a3-bd37-4424-aa95-6ab255f48a48@kernel.org> <ae9b94f9-7108-4973-9a99-79a008170b5d@linux.dev> <W4pHviaQQ-qfwmORrCObjQ@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-843884749-1787589067=:1164"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-843884749-1787589067=:1164
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 29 Jul 2026, Marco Scardovi wrote:

> In data mercoled=C3=AC 29 luglio 2026 15:10:56 Ora legale dell=E2=80=99Eu=
ropa centrale, Denis Benato ha scritto:
> >=20
> > On 7/29/26 09:32, Hans de Goede wrote:
> > > Hi Marco,
> > >
> > > On 28-Jul-26 15:56, Marco Scardovi wrote:
> > >> In data marted=C3=AC 28 luglio 2026 13:39:39 Ora legale dell=E2=80=
=99Europa centrale, Hans=20
> > >> de Goede ha scritto:
> > >>> Hi,
> > >>>
> > >>> Thank you for your patch.
> > >>>
> > >>> On 28-Jul-26 09:18, Marco Scardovi wrote:
> > >>>> This series introduces support for ASUS WMI Whisper Mode hardware =
controls
> > >>>> in the asus-wmi header and asus-armoury driver.
> > >>>>
> > >>>> Background & Findings:
> > >>>> ----------------------
> > >>>> After talking with Denis and thanks to NeuroMarshal reverse engine=
ering
> > >>>> and
> > >>>> firmware trace analysis on modern ASUS laptops, three specific WMI=
 Device
> > >>>> IDs were identified that manage acoustic profiles and thermal regu=
lation
> > >>>> under ASUS Whisper Mode:
> > >>>>
> > >>>> 1. ASUS_WMI_DEVID_WHISPER_MODE (0x0012007A):
> > >>>>    - Controls the BIOS-level Whisper Mode acoustic profile toggle
> > >>>>    (read/write boolean).>=20
> > >>>> 2. ASUS_WMI_DEVID_WHISPER_ENABLE (0x00090022):
> > >>>>    - Enables or disables Dynamic Whisper acoustic regulation (read=
/write
> > >>>>    boolean).>=20
> > >>>> 3. ASUS_WMI_DEVID_WHISPER_STATUS (0x00090023):
> > >>>>    - Reports status and allows runtime control over Dynamic Whispe=
r state
> > >>>>    (read/write boolean).
> > >>> I wonder how this interacts with the platform_profile stuff ?
> > >>>
> > >>> I would expect enabling whisper mode to lower the max performance,
> > >>> so does this automatically change the platform_profile away
> > >>> from performance when it is set to performance ?
> > >>>
> > >>> Note the platform_profile API is extensible. To me it seems more
> > >>> logical to expose this as a whisper mode platform-profile ?
> > >>>
> > >>> Regards,
> > >>>
> > >>> Hans
> > >> Hi Hans,
> > >>
> > >> Thanks for the feedback!
> > >> Here you can find my opinions on your questions.
> > >>
> > >> 1. Interaction with platform_profile:
> > >> In ASUS laptops, where presents, Whisper Mode operates as an
> > >> independent boolean toggle/feature controlling fan acoustic target l=
imits in
> > >> firmware/EC, rather than acting as a global thermal profile. Setting=
=20
> > >> WHISPER_MODE or WHISPER_ENABLE via WMI sends a direct call to the EC=
/BIOS,=20
> > >> which adjusts acoustic thresholds internally without altering the ac=
tive=20
> > >> platform_profile state (throttle_thermal_policy) in asus-wmi. IIRC o=
n Windows=20
> > >> it even permits to "hear" the ambient to make the fans run in a way =
to blend=20
> > >> with the ambient noise.
> > >>
> > >> 2. platform_profile vs firmware_attributes (asus-armoury):
> > >> platform_profile is designed for mutually exclusive global power/the=
rmal
> > >> modes (Quiet, Balanced, Performance). Whisper Mode, on the other han=
d,=20
> > >> consists of independent BIOS feature toggles (0/1 controls for BIOS =
Whisper=20
> > >> Mode, Dynamic Whisper Enable, and Status).
> > >> Since asus-armoury is dedicated to exposing BIOS/Armoury Crate firmw=
are
> > >> attributes via fw_attributes_class (similar to nv_dynamic_boost,
> > >> nv_temp_target, panel_od, etc.), exposing these three WMI controls a=
s
> > >> sysfs firmware attributes fits the overall design of asus-armoury mu=
ch
> > >> better than extending platform_profile.
> > >>
> > >> I hope I've been of help. Feel free to let me know if you have more=
=20
> > >> questions: I'll try to answer the best of my capacities.
> > > Thank you for clarifying things. Since the EC/BIOS interface sees thi=
s
> > > as 2 independent settings, I agree that exposing this as a firmware
> > > attr is the best way to expose this.
> > >
> > > Its a bit weird that one can select Performance profile and enable
> > > whisper mode at the same time. But if that is how the Asus firmware
> > > interfaces work, then that is how it is.
> > Hello Hans and Marco,
> >=20
> > I agree that this is weird and we don't have a device with whisper mode=
,
> > but there is the possibility of the official windows app allowing whisp=
er mode
> > only on certain modes: we would need to find someone with windows
> > to confirm this, but I also don't think binding whisper to quiet/low pe=
rformance
> > is a bad idea.
> >=20
> > My opinion is that either whisper gets its own profile and is a combina=
tion of
> > quiet + whisper set to 1 or we check what windows does since I don't wa=
nt
> > to have hardware running in configurations that ASUS never intended to.
> >=20
> > Best regards,
> > Denis
> > > Regards,
> > >
> > > Hans
> > >
> > >
> >=20
> Hi Denis,
> I made more checks on Whisper Mode and find out why it isn't under a sing=
le
> power profile: it works the contrary of power profiles.
>=20
> To be more specific: while power profiles tends to match the fans with th=
e
> TDP, in Whisper Mode it sets the max power (if under performance) but cut
> it if the dB/RPMs are too high to respect the Whisper Mode. So it basical=
ly
> works for any power profiles but instead of pushing up the fans to cool t=
he
> CPU/GPU, it kills the power to maintain the loudness in check

Thus, it effectively makes it yet another profile in between the others=20
and blocks higher-end profiles from operating "normally". Either whisper=20
mode does something or doesn't.

Some (low-end) platform profiles will never need any cutting and for the=20
profiles towards the high-end whisper mode behavior as described above=20
inhibits the actual profile set and uses the whisper "profile" somewhere=20
in between instead.

(The wildcard here is if it actually senses/records ambient noise level=20
and adapts the in-between profile somehow but it's still an in-between=20
mode, just the cut-off point will vary.)

This is not to suggest we diverge from how it is represented as a=20
separate configurable but it still, on fundamendal level, looks just=20
another profile to me.

> Let me know if it is a feature you want or not. If we end up deciding to =
kill
> it feel free to let me know.

--=20
 i.

--8323328-843884749-1787589067=:1164--
