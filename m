Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A4F35975;
	Tue, 28 Jul 2026 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246983; cv=none; b=tTDHrpEj9WVQ0nYGWUPDojecWuBLMKgLX5R826CfUG1/dSCyzBlWUrjWSP6vshMMuBP+tu2Dx+O2+ra9BfOprg66i2j9m5wLvKXOOsmscUMd/cmiYperDcxhs+5KjgbOcxdrMZymcuXenbReXq00TWfvaZ74gI/qiR7tKMdiEcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246983; c=relaxed/simple;
	bh=+oE6nPWwrbDSr+7kffJkn93zIPzcmztNMd1+OHJe64o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CqlMmwEeKZOXC6oCAdWKXJ9+y8O1Z1ATr8/ouvbpBL7ZdAfTt9I0B97mFCUm5zAjYcPKySJg9rVZIdu8Rjst+ZjcIifFmYP8Y0PezXgDi6xklnSdk+Hbmjcx/Za9aBmeaOujYVIboJAm2WDtnJe6O4CsAsjpNjsxk6bi+2UQkeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ZgvxTpXX; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ZgvxTpXX"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4B91D9D942;
	Tue, 28 Jul 2026 15:56:17 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shPRDB5YnKbh; Tue, 28 Jul 2026 15:56:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785246976; bh=+oE6nPWwrbDSr+7kffJkn93zIPzcmztNMd1+OHJe64o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZgvxTpXXcC8IsbsLdnbwroii5ewrdNX2Wmc4iDnUxZaD/H1/IjMSaBIxUe94cTka6
	 75mVZaii6EBDkBIpdIXon3rpGo0J+hXjaP+WAM9MHvdcPvoVMBaqOIpur5VuOD2KMq
	 LM4bjrh2XNSJnKxud+mZvU49ph6u/msOADqQnYTw4t4bzbCK5lKnR6xn0/OJPs8oFZ
	 Bv2qkn763Eszar6OnENOBTAXEWrR0qNGNVgSibzPz5RmgGOQpCMjKmA5vWrIHjpbhc
	 ga0crf3bE9zS3nz/CgGrxZme2U1pC/f34PCQ9UABkb1kfgt1M5ouPo+N853fm1Wpr+
	 uPm1nuEtcLeQQ==
From: Marco Scardovi <scardracs@disroot.org>
To: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Cc: luke@ljones.dev, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 denis.benato@linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/x86: asus-armoury: add Whisper Mode support
Date: Tue, 28 Jul 2026 15:56:02 +0200
Message-ID: <y0qKqYgBT5Cpfe4BHTFqrA@disroot.org>
In-Reply-To: <d88d0945-71e0-4d21-b154-d0d837624858@kernel.org>
References:
 <20260728071843.130492-1-scardracs@disroot.org>
 <d88d0945-71e0-4d21-b154-d0d837624858@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In data marted=C3=AC 28 luglio 2026 13:39:39 Ora legale dell=E2=80=99Europa=
 centrale, Hans=20
de Goede ha scritto:
> Hi,
>=20
> Thank you for your patch.
>=20
> On 28-Jul-26 09:18, Marco Scardovi wrote:
> > This series introduces support for ASUS WMI Whisper Mode hardware contr=
ols
> > in the asus-wmi header and asus-armoury driver.
> >=20
> > Background & Findings:
> > ----------------------
> > After talking with Denis and thanks to NeuroMarshal reverse engineering
> > and
> > firmware trace analysis on modern ASUS laptops, three specific WMI Devi=
ce
> > IDs were identified that manage acoustic profiles and thermal regulation
> > under ASUS Whisper Mode:
> >=20
> > 1. ASUS_WMI_DEVID_WHISPER_MODE (0x0012007A):
> >    - Controls the BIOS-level Whisper Mode acoustic profile toggle
> >    (read/write boolean).>=20
> > 2. ASUS_WMI_DEVID_WHISPER_ENABLE (0x00090022):
> >    - Enables or disables Dynamic Whisper acoustic regulation (read/write
> >    boolean).>=20
> > 3. ASUS_WMI_DEVID_WHISPER_STATUS (0x00090023):
> >    - Reports status and allows runtime control over Dynamic Whisper sta=
te
> >    (read/write boolean).
> I wonder how this interacts with the platform_profile stuff ?
>=20
> I would expect enabling whisper mode to lower the max performance,
> so does this automatically change the platform_profile away
> from performance when it is set to performance ?
>=20
> Note the platform_profile API is extensible. To me it seems more
> logical to expose this as a whisper mode platform-profile ?
>=20
> Regards,
>=20
> Hans

Hi Hans,

Thanks for the feedback!
Here you can find my opinions on your questions.

1. Interaction with platform_profile:
In ASUS laptops, where presents, Whisper Mode operates as an
independent boolean toggle/feature controlling fan acoustic target limits in
firmware/EC, rather than acting as a global thermal profile. Setting=20
WHISPER_MODE or WHISPER_ENABLE via WMI sends a direct call to the EC/BIOS,=
=20
which adjusts acoustic thresholds internally without altering the active=20
platform_profile state (throttle_thermal_policy) in asus-wmi. IIRC on Windo=
ws=20
it even permits to "hear" the ambient to make the fans run in a way to blen=
d=20
with the ambient noise.

2. platform_profile vs firmware_attributes (asus-armoury):
platform_profile is designed for mutually exclusive global power/thermal
modes (Quiet, Balanced, Performance). Whisper Mode, on the other hand,=20
consists of independent BIOS feature toggles (0/1 controls for BIOS Whisper=
=20
Mode, Dynamic Whisper Enable, and Status).
Since asus-armoury is dedicated to exposing BIOS/Armoury Crate firmware
attributes via fw_attributes_class (similar to nv_dynamic_boost,
nv_temp_target, panel_od, etc.), exposing these three WMI controls as
sysfs firmware attributes fits the overall design of asus-armoury much
better than extending platform_profile.

I hope I've been of help. Feel free to let me know if you have more=20
questions: I'll try to answer the best of my capacities.

Best regards,
Marco
>=20
> > Series Overview:
> > ----------------
> > - Patch 1/2: Adds WMI Device ID macro definitions to
> >=20
> >   include/linux/platform_data/x86/asus-wmi.h.
> >=20
> > - Patch 2/2: Exposes whisper_mode, whisper_enable, and whisper_status
> > sysfs
> >=20
> >   attribute groups in drivers/platform/x86/asus-armoury.c.
> >=20
> > Safety & Compatibility:
> > -----------------------
> > All newly introduced attributes are probed via armoury_has_devstate()
> > before sysfs registration. On devices where these WMI methods are not
> > implemented by firmware, the sysfs nodes are gracefully omitted without
> > impacting existing attributes or functionality.
> >=20
> > Validation:
> > -----------
> > - Build verification against linux-next cleanly with zero warnings or
> > errors. - Coding style and formatting verified via git diff --check.
> >=20
> > Note:
> > -----------
> > Unfortunately, due to it being missing on my laptop, I'm not able to
> > verify
> > if the WhisperMode works as intended. The values are the same reported =
by
> > NeuroMarshal on his reverse engineering of Armoury Crate [1] so they
> > *should* work.
> >=20
> > [1] https://github.com/NeuroMarshal/armoury-linux-probe
> >=20
> > Marco Scardovi (2):
> >   platform/x86: asus-wmi: add Whisper Mode WMI device ID defines
> >   platform/x86: asus-armoury: add Whisper Mode attributes
> > =20
> >  drivers/platform/x86/asus-armoury.c        | 14 ++++++++++++++
> >  include/linux/platform_data/x86/asus-wmi.h |  5 +++++
> >  2 files changed, 19 insertions(+)




