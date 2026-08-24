Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226064399E2;
	Mon, 24 Aug 2026 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589377; cv=none; b=kafhCCKLQ2rRgCmO96Hmyq7ectxZWmc6QcElPGwD/Xd9tdhRoJQMVlw2FER1mCVdVJKxPu+0mVn2seQ9auVXkLLqJN8Agr0/8CSPHCvFq+WoFU4nB3iYwYK98Z4WvLr8dKgt0zhoCERPsuxQo1dEbOPtWsT2H31QagJP8Xw6nJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589377; c=relaxed/simple;
	bh=cfbMA/LglzDbuZZ3w0HpeF9xO9utWCJTwajrM+OWBxQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UyqW5mpm+H6nY7mb9KroDQgr/pSlpdKxLk1AMVH8xA6X3UsvYf96GcKkMsKOeqHkG/QlZ5UiSG/cXZ+t1e2h8KaBFEO0pHqRz5mlNkgDNTLc2h3sT6TqA3AI5j55aKgENibO/lwOkFRWCWKtRdVDqPpcX9eR9A5zFpM+4xrx/TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AO8h+3im; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AO8h+3im"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787589375; x=1819125375;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cfbMA/LglzDbuZZ3w0HpeF9xO9utWCJTwajrM+OWBxQ=;
  b=AO8h+3imzqCgMeH8bKO80mka7fahTkSBZ+gHEj1ZnvBXBTmvTbkAUBy3
   bzIX5iXZbcaZSbKcIg6sGuk4Z4L4URjNrWgxMlOkusFv6qgsiOcRzMp5F
   lqUGPFjNWYjxN4+jAv1nTP4TkHn2UMFTZ/3osri/j6b0M59yKYUOor1kk
   zOT1+DTJJmc0ontv6iUU6jd8eZhkU7t2WpcS8FoxOJBJWJThqcnQy9GH9
   PWKtMPLi/T2f3sVF4QCMievree8twyDNavxSCiEaJR1e3ScpkkMkg8wLT
   uNqJF3KJfM2hpPRzswdaXWcNVdZrzvuKnD2H1IxMqFeYafSKCDHwlgTEZ
   Q==;
X-CSE-ConnectionGUID: SjaPrvNqRHKhjU7vGmb/NQ==
X-CSE-MsgGUID: dR1gKbatRcutTvfieVFk5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="113581576"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="113581576"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:36:14 -0700
X-CSE-ConnectionGUID: oiPtLBWOQHS4g1abme31kw==
X-CSE-MsgGUID: tKGUMdpRQQqmUyqPP6kdXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="267089857"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:36:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Aug 2026 19:36:08 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Denis Benato <denis.benato@linux.dev>, luke@ljones.dev, 
    corentin.chary@gmail.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] platform/x86: asus-armoury: add Whisper Mode
 support
In-Reply-To: <wArK7qMITou2-I6Hv4EmsA@disroot.org>
Message-ID: <704b188c-e4cc-591c-f693-0fa3e37afc1a@linux.intel.com>
References: <20260728071843.130492-1-scardracs@disroot.org> <W4pHviaQQ-qfwmORrCObjQ@disroot.org> <a2efcc14-c4a5-4b16-9fed-c01176cc34b6@linux.dev> <wArK7qMITou2-I6Hv4EmsA@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-445830745-1787589368=:1164"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-445830745-1787589368=:1164
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 29 Jul 2026, Marco Scardovi wrote:

> In data mercoled=C3=AC 29 luglio 2026 15:34:28 Ora legale dell=E2=80=99Eu=
ropa centrale, Denis Benato ha scritto:
> >=20
> > On 7/29/26 15:22, Marco Scardovi wrote:
> > > In data mercoled=C3=AC 29 luglio 2026 15:10:56 Ora legale dell=E2=80=
=99Europa centrale, Denis Benato ha scritto:
> > >> On 7/29/26 09:32, Hans de Goede wrote:
> > >>> Hi Marco,
> > >>>
> > >>> On 28-Jul-26 15:56, Marco Scardovi wrote:
> > >>>> In data marted=C3=AC 28 luglio 2026 13:39:39 Ora legale dell=E2=80=
=99Europa centrale, Hans=20
> > >>>> de Goede ha scritto:
> > >>>>> Hi,
> > >>>>>
> > >>>>> Thank you for your patch.
> > >>>>>
> > >>>>> On 28-Jul-26 09:18, Marco Scardovi wrote:
> > >>>>>> This series introduces support for ASUS WMI Whisper Mode hardwar=
e controls
> > >>>>>> in the asus-wmi header and asus-armoury driver.
> > >>>>>>
> > >>>>>> Background & Findings:
> > >>>>>> ----------------------
> > >>>>>> After talking with Denis and thanks to NeuroMarshal reverse engi=
neering
> > >>>>>> and
> > >>>>>> firmware trace analysis on modern ASUS laptops, three specific W=
MI Device
> > >>>>>> IDs were identified that manage acoustic profiles and thermal re=
gulation
> > >>>>>> under ASUS Whisper Mode:
> > >>>>>>
> > >>>>>> 1. ASUS_WMI_DEVID_WHISPER_MODE (0x0012007A):
> > >>>>>>    - Controls the BIOS-level Whisper Mode acoustic profile toggl=
e
> > >>>>>>    (read/write boolean).>=20
> > >>>>>> 2. ASUS_WMI_DEVID_WHISPER_ENABLE (0x00090022):
> > >>>>>>    - Enables or disables Dynamic Whisper acoustic regulation (re=
ad/write
> > >>>>>>    boolean).>=20
> > >>>>>> 3. ASUS_WMI_DEVID_WHISPER_STATUS (0x00090023):
> > >>>>>>    - Reports status and allows runtime control over Dynamic Whis=
per state
> > >>>>>>    (read/write boolean).
> > >>>>> I wonder how this interacts with the platform_profile stuff ?
> > >>>>>
> > >>>>> I would expect enabling whisper mode to lower the max performance=
,
> > >>>>> so does this automatically change the platform_profile away
> > >>>>> from performance when it is set to performance ?
> > >>>>>
> > >>>>> Note the platform_profile API is extensible. To me it seems more
> > >>>>> logical to expose this as a whisper mode platform-profile ?
> > >>>>>
> > >>>>> Regards,
> > >>>>>
> > >>>>> Hans
> > >>>> Hi Hans,
> > >>>>
> > >>>> Thanks for the feedback!
> > >>>> Here you can find my opinions on your questions.
> > >>>>
> > >>>> 1. Interaction with platform_profile:
> > >>>> In ASUS laptops, where presents, Whisper Mode operates as an
> > >>>> independent boolean toggle/feature controlling fan acoustic target=
 limits in
> > >>>> firmware/EC, rather than acting as a global thermal profile. Setti=
ng=20
> > >>>> WHISPER_MODE or WHISPER_ENABLE via WMI sends a direct call to the =
EC/BIOS,=20
> > >>>> which adjusts acoustic thresholds internally without altering the =
active=20
> > >>>> platform_profile state (throttle_thermal_policy) in asus-wmi. IIRC=
 on Windows=20
> > >>>> it even permits to "hear" the ambient to make the fans run in a wa=
y to blend=20
> > >>>> with the ambient noise.
> > >>>>
> > >>>> 2. platform_profile vs firmware_attributes (asus-armoury):
> > >>>> platform_profile is designed for mutually exclusive global power/t=
hermal
> > >>>> modes (Quiet, Balanced, Performance). Whisper Mode, on the other h=
and,=20
> > >>>> consists of independent BIOS feature toggles (0/1 controls for BIO=
S Whisper=20
> > >>>> Mode, Dynamic Whisper Enable, and Status).
> > >>>> Since asus-armoury is dedicated to exposing BIOS/Armoury Crate fir=
mware
> > >>>> attributes via fw_attributes_class (similar to nv_dynamic_boost,
> > >>>> nv_temp_target, panel_od, etc.), exposing these three WMI controls=
 as
> > >>>> sysfs firmware attributes fits the overall design of asus-armoury =
much
> > >>>> better than extending platform_profile.
> > >>>>
> > >>>> I hope I've been of help. Feel free to let me know if you have mor=
e=20
> > >>>> questions: I'll try to answer the best of my capacities.
> > >>> Thank you for clarifying things. Since the EC/BIOS interface sees t=
his
> > >>> as 2 independent settings, I agree that exposing this as a firmware
> > >>> attr is the best way to expose this.
> > >>>
> > >>> Its a bit weird that one can select Performance profile and enable
> > >>> whisper mode at the same time. But if that is how the Asus firmware
> > >>> interfaces work, then that is how it is.
> > >> Hello Hans and Marco,
> > >>
> > >> I agree that this is weird and we don't have a device with whisper m=
ode,
> > >> but there is the possibility of the official windows app allowing wh=
isper mode
> > >> only on certain modes: we would need to find someone with windows
> > >> to confirm this, but I also don't think binding whisper to quiet/low=
 performance
> > >> is a bad idea.
> > >>
> > >> My opinion is that either whisper gets its own profile and is a comb=
ination of
> > >> quiet + whisper set to 1 or we check what windows does since I don't=
 want
> > >> to have hardware running in configurations that ASUS never intended =
to.
> > >>
> > >> Best regards,
> > >> Denis
> > >>> Regards,
> > >>>
> > >>> Hans
> > >>>
> > >>>
> > > Hi Denis,
> > > I made more checks on Whisper Mode and find out why it isn't under a =
single
> > > power profile: it works the contrary of power profiles.
> > >
> > > To be more specific: while power profiles tends to match the fans wit=
h the
> > > TDP, in Whisper Mode it sets the max power (if under performance) but=
 cut
> > > it if the dB/RPMs are too high to respect the Whisper Mode. So it bas=
ically
> > > works for any power profiles but instead of pushing up the fans to co=
ol the
> > > CPU/GPU, it kills the power to maintain the loudness in check
> > Alright, perfect.
> > > Let me know if it is a feature you want or not. If we end up deciding=
 to kill
> > > it feel free to let me know.
> > Yes I want this to be in the kernel: I simply don't want to do things t=
hat
> > were never intended to be done, other than that I have no reservations.
> >=20
> > So you have my OK with these.
> >=20
> >=20
> > Thank you,
> > Denis
> >=20
> > > Best regards,
> > > Marco
> > >
> > >
> >=20
> Hi everyone,
>=20
> I've made more and more studies about Whisper Mode and dumped my own lapt=
op
> to set my mind straight about Whisper Mode, because I had some more doubt=
s
> about it.
>=20
> TL;DR: Adding Whisper Mode is not useful for our drivers.
> TL;DR 2: Whisper Mode enables only when power profile Quiet is set.
>=20
> Whole version:
> After dumping the ACPI DSDT tables and testing runtime calls via a diagno=
stic=20
> module on real hardware, I verified that the Embedded Controller (EC) aut=
omatically=20
> manages Whisper Mode acoustic capping whenever `platform_profile` is set =
to "quiet"=20
> (thermal policy 0x00120075 =3D 2).
>=20
> This behavior applies to both internal hardware and connected eGPUs. Beca=
use the=20
> EC handles Whisper Mode natively within the quiet profile, discrete queri=
es/writes=20
> to WMI IDs 0x0012007A and 0x00090022 return 0xFFFFFFFE (unsupported).=20
>=20
> Therefore, exposing standalone Whisper Mode sysfs attributes is unnecessa=
ry,=20
> as `platform_profile =3D quiet` already provides full Whisper Mode functi=
onality.

Okay. Nevermind my other email, I wrote it before noticing this (I finally=
=20
have time to clear my long backlog of unanswered things after the Summer).

--=20
 i.

--8323328-445830745-1787589368=:1164--
