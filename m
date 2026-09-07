Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD71F3939DB;
	Mon,  7 Sep 2026 20:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814771; cv=none; b=UtIqe0oiJAUS+QX6IcczqbjQN+QG1QbUUAzztTlRztCGCSx2c+sjh+4eMGYnk4QSIN52Oqct+Mwmq8QI9Ew6Mg0D29ADGalrs6OmLITgXy8a6ha6CL+xj59u/mfPumaCM4KuGEQ3rnBx+JGPgS8m4Iqvy82RUIessiUJSgb6nSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814771; c=relaxed/simple;
	bh=rVwoTZF0zIWjvGfehh+heArB9ivKoxKKeZFYXCrO0mI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ehxamEPpI8lTSI5SjqAFP2LBg1zYm9BL535IIcPSznY7O8rDMFxhDpPdNExHgGE5/ibmlAWQpVvDK5UhTAz8YNlW4Dh9gOhqL5uGLUgKw/ngAiGMJgs0LNmu2QkZqP3HqM5WuOucDCgOsCCvsJksGbNHfaVXamxAFLdIlA9ezOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=qbsafyjF; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="qbsafyjF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788814761; x=1789073961;
	bh=U95leeEP3k6To4Cm7aU5npoew/9a0B1c8nhykvIRNxs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qbsafyjFU7szS2b9D7E171B3XftH6x/ROPNJ7bRjBGrbOAHRH7aWGcYdVsgzUusZk
	 mYgGjHAlVHpYwnUA2JGKy2M7wri4rTSDSvuTojkIztOuA2xzAkYpCkz9tIULnON0Y+
	 PubkCswdXkUMmM0k+0BovL68ZizlJJCQX0BaCW3phhf5XOHhEtjwpAdp41y2G8bzsI
	 6RW2eSp2CMnMx+wXd+RkYH6EJLIRq9GTNWifBJ+h/hVCn60fA9rHsxCW38dSdoA+Kx
	 iEZt/6hy9vRu2+SaM+uJTstHo5k1W4afH6BQ4orqpPYx4L0aEai+SKkmCkzk5i2dwQ
	 MzgqyA7WiDpLA==
Date: Mon, 07 Sep 2026 20:59:15 +0000
To: Peter Marshall <pm@petermarshall.ca>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: i2c: st-vd55g1: Genericize driver and add VD55G0 support
Message-ID: <20260907205908.21303-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 9668a35f474d3fdd9b9e66102de22c717f766a56
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Peter,

Tested on a second machine: Surface Pro 11 for Business, Intel Lunar Lake,
IPU7 =E2=80=94 same SMO55F0 HID as your Surface Pro 9, one IPU generation l=
ater.
Two results worth having before you respin, one good and one blocking.

The good one: the series applies and builds clean, and the sensor works on
IPU7. All seven patches applied in order to an Ubuntu 7.0.0 tree with no
conflicts (its vd55g1.c is 2061 lines, exactly what your diffstat deletes),
and media/i2c, media/pci/intel and int3472 rebuilt without a warning.
With firmware present the driver probes, the bridge finds the sensor and
the subdev registers:

  intel-ipu7: Found supported sensor SMO55F0:00
  intel_ipu7_isys: bind vd55g 1-0060 nlanes is 1 port is 1
  entity 233: vd55g 1-0060 (1 pad, 1 link, 0 routes)

So nothing here is IPU6-specific. That is the part I could add that you
could not.

The blocking one: without that firmware nobody can use VD55G0 at all.

  vd55g i2c-SMO55F0:00: Direct firmware load for vd55g0-cut1.bin failed
                        with error -2
  vd55g i2c-SMO55F0:00: Failed to load required firmware vd55g0-cut1.bin: -=
2

Probe fails and the camera disappears. The driver has a fallback for
exactly this case, but only the older part gets one:

  static const struct firmware vd55g1_builtin_fw =3D {
          .data =3D vd55g1_patch_array, .size =3D ARRAY_SIZE(vd55g1_patch_a=
rray)
  };
  ...
  if (ret =3D=3D -ENOENT && fw_info->builtin_fw)

vd55g0_fw_maps[] sets fw_name and leaves builtin_fw NULL, and neither
vd55g0-cut1.bin nor vd55g0-cut2.bin is in linux-firmware. So the series
works for you and for nobody else, which I assume is not the intent. Either
a built-in like VD55G1's, or the files submitted to linux-firmware, or at
minimum a note in the cover letter saying where they come from.

To get past it I used the same ST patch arrays that Andr=C3=A9 Gilerson's
out-of-tree VD55G0 driver compiles in (vd55g0_patches.h, "Copyright (C)
2024 STMicroelectronics SA"), written out as a file. cut1 is 6868 bytes and
its header parses correctly against struct vd55g_patch_header =E2=80=94 0x0=
681,
version 2.11 =E2=80=94 so the format is right. That is how I tested, not a
distribution path I am proposing.

Second, and this one reaches further than this series. Benjamin's warning
about libcamera is concrete and it is a regression for machines that work
today. libcamera keys the sensor-properties database, the soft-ISP helper
and the tuning file on the media entity name, which is the driver name:

  WARN  No static properties available for 'vd55g'
  WARN  'vd55g 1-0060': No sensor delays found in static properties
  WARN  Configuration file 'vd55g.yaml' not found for IPA module 'simple'
  WARN  IPASoft: Failed to create camera sensor helper for vd55g

and the installed libcamera 0.7.0 does carry a vd55g1 entry =E2=80=94 `stri=
ngs
libcamera.so.0.7 | grep -x vd55g1` finds it. So renaming the driver does
not only fail to help VD55G0; it silently takes the properties and the
helper away from VD55G1 users who have them now. Whatever is decided about
one driver or two, that rename needs libcamera patches landing alongside,
or the entity name keeping its old form.

Two smaller things, neither chased:

  - `supply vcore not found, using dummy regulator` persists here despite
    4/7's SMO55F0 mapping. It was not the blocker, so I did not dig.
  - 3/7 advertises 380 MHz for SMO55F0. This machine has been running 402 M=
Hz
    ("MIPI output freq is 804MHz / 2") from the out-of-tree driver. Your
    driver takes the endpoint's value rather than validating against a list=
,
    so it accepted 380 without complaint, and I have not established which =
is
    correct for either model. Worth knowing that two people measured
    different numbers for the same HID on different Surfaces.

Happy to run v2 here when you have one, and to report anything specific you
would like measured on IPU7.

Sergey

