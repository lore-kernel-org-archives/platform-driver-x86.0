Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650311;
	b=xr+bRaDwbJvQ6oYqJDvf+RenLvGnb43K1Wb3AiHboeFKYTCLUNihyfEeeKDIdBMjjwZV
	 epke+Wq0+QYTK/J9SyO8qVmVzwSO7w4+LqhVsU/DvYPeDXwBZgW4/6Vg8HAt29b8o3VWJ
	 CkUmR2zWS0kXbuZSAAHtfn/7KWwpXLWp30Ya79LLQCeEGB0hh0n4HRQA8ktiGKW6ESBgb
	 rNJ0N2AdxfzsLdTFy++jZuGj0wJfGfVrGSFq/jJpVBW5mPYbJgYZiooeqdYW2SFytwcFw
	 rLSqzYCLRqLokXthQfXy61s9m0zZ9Q7CE2VYEqUZ12icEeayoNb1U/NgLNqCE3XxziQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650311;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XIBiDmKmFgvuo2uQe5M7PmElCghgpqtneR6cAgMU5m8=;
	b=LyKFx64dGqzBoQ1+/RUZ7Jn5EF50LmwBZiX36jhkIO4WtfJNtVu80VAspK8mh7GjtVk6
	 rEuAmq9e10AwWunwKwBv0oSl82ElBZuG7HaoMpLVSTJED1eh8W+BpwNlEw4/aeImkoSSg
	 7fJ6NQB029iGYr4MhC60T/AjBM8mnXVWl8UPkpLFoix4R7eqO3n6aQVDI+V9Pd4I7jfB3
	 bvkioNFXkoyWkY2+xnUyCys6/iNxhXCvgeQKUqzvzUCrGhihugU1BfHkiMDuIGmRmOCpW
	 hMRlhHovyiBsvYC2iUyCWBGynuo2ty6Q2Ku0hFZiAxRD/AdFqtLH2UZK4WKks9Y90Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=f137wCx7;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD654606A327;
	Sat, 14 Nov 2026 09:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD654606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=f137wCx7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794650308; x=1794909508;
	bh=XIBiDmKmFgvuo2uQe5M7PmElCghgpqtneR6cAgMU5m8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=f137wCx75tO52/dSpaaWOfiZGKf0vm2JBOkv1Piu5CiicbEg0tg41VD6Iczo8oFmV
	 zrtYDtvSx5d/KKWbKOa5jXjxOf5j+r8QTGIirvEVo1RAtNh75mpTlnP9k4eoy7aWeC
	 Um5XtDEOqmz30AoWp1JftDNNTrEbOSfdX1MLoLeW4O/73anCQn8htkgdUyN5RXGOvA
	 hAsrUSEG5WDYsCiuRUgGBXhvz+cEElvmmb+PTunupsMfraNrIEhdM9fO4XyC9Q+4Tk
	 cst28gtlQOE0GVWtHkTbGr33EzC87GDtuJ6/OZWjGQQMd4EKuQJgOp8EXPuQR9XEP0
	 z+OMHO7Dbn3iA==
Date: Sat, 14 Nov 2026 09:58:22 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, Emfox Zhou <emfox@debian.org>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] media: Add the ST VD55G0 global shutter sensor
Message-ID: <20261114095815.74012-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 5d281dbd9506479ce1e8391447b77940d63fef23
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The ST VD55G0 is a 644x604 monochrome global shutter sensor. It is the
infrared camera of the Microsoft Surface Pro 11 for Business with Intel
(Lunar Lake, IPU7), of the Surface Pro 9 (Alder Lake, IPU6) and of the
Surface Pro 8 (Tiger Lake, IPU6), ACPI device SMO55F0. Without a driver
the camera does not appear at all.

  1/6  dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
  2/6  media: i2c: Add ST VD55G0 global shutter sensor driver
  3/6  platform/x86: int3472: Map the VD55G0 supplies to "vddio" and "vana"
  4/6  media: ipu-bridge: Add ST VD55G0
  5/6  media: ipu-bridge: Index the sensor device properties as the endpoin=
t ones
  6/6  media: ipu-bridge: Add the Surface Pro 8, 9 and 11 infrared illumina=
tor

The driver is a port of ST's own downstream driver, firmware patch
included, as vd55g1 carries its own:
https://github.com/STMicroelectronics/vd55g0-linux-driver
2/6 carries Benjamin's Co-developed-by, and its clock tree is based on
his.

Changes in v5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

v5 is on media-committers next, where v4 no longer applies. It is sent
less than a week after v4 so that nobody reviews a version that cannot
be applied as posted.
- 3/6: type 0x10 is INT3472_GPIO_TYPE_AVDD there (Hans de Goede's
  int3472 series), so the vana entry keys on it. As posted, v4 matched
  0x0f there, and the sensor got no vana:
  https://lore.kernel.org/all/20261111063351.96951-1-lsa.uz@pm.me/
- 4/6: VD55G0 goes under IMX681, which next now carries at that place.
- 6/6: the Surface Pro 8, as Emfox tested it.
- Emfox's Tested-by on 3/6, 4/6 and 6/6, from the Surface Pro 8:
  https://lore.kernel.org/all/179439345249.5.16817789862917866412@debian.or=
g/
- 1/6, 2/6 and 5/6 do not change.

v4: https://lore.kernel.org/all/20261110195454.48176-1-lsa.uz@pm.me/

On the supply names in 3/6: which rail each of the two pins feeds is not
documented. Measuring it here does not tell either: with the power
enable alone, or AVDD alone, the sensor never answered on I2C (0 of 6
each), and with both it always did (6 of 6). AVDD maps to vana, and the
power enable to vddio; VCORE stays a dummy. The driver enables all three
together, so the names do not change what the sensor gets. Hans, Hao,
Dan, D. Manresa: if you know what these two pins feed on this machine, I
will change 3/6 to match.

3/6 matches SMO55F0, which is also the Surface Pro 9's IR camera, and
v4 and v5 have not run there. Fernando, could you try it? If its INT3472
uses other pins for the sensor, 3/6 needs them too.

On all three machines the sensor needs Hao Yao's int3472 fix, which sets
the 24 MHz clock the SSDB asks for; without it the sensor runs at four
fifths of every rate this series computes. Its v2 fixes the Surface Pro
11; on the Surface Pro 8 and 9 the _DSM wants 0 rather than 3 (Fernando,
Emfox):
https://lore.kernel.org/all/20251208035122.2147678-1-hao.yao@intel.com/

Tested on the Surface Pro 11 for Business, on v7.4-rc1 with Hao Yao's
int3472 v2, KASAN and lockdep on, IPU7 run by the ipu6 driver.

v5 in one boot, with its vd55g0, its ipu-bridge (next's, with 4/6 to
6/6) and its int3472 discrete module (next's discrete.c, with 3/6)
built against that kernel:
- 3/6: INT3472 registers vana and vddio for the sensor and nothing else;
  vcore is a dummy;
- probe binds, and the sensor suspends about 1 s later, with no
  power-off inside probe. Probe forced to fail at registration: no clock
  or regulator warning. As a control, the same failure after a runtime
  suspend inside probe gives three warnings per probe;
- led_mode is offered (6/6), and the privacy LED is lit while streaming;
- v4l2-compliance 46 of 46; captures at 59.14 fps; three unload and
  reload cycles; the controls reach the sensor as in v4;
- the same results as v4's check, line for line, but for the supply
  names next gives the other two sensors and the IMX681 next now finds;
- no KASAN, lockdep or Oops report; the only other WARNING is the ipu6
  driver's lockdep_assert_held() at each stream start;
- on next: checkpatch --strict, W=3D1 and sparse clean on x86_64, i386,
  allmodconfig and without CONFIG_PM; smatch clean; coccicheck clean but
  for three scripts this spatch cannot run; each patch builds on its
  own; dt_binding_check clean, and it refuses a VD55G0 example at 125
  MHz.

v4, whose 2/6 v5 carries unchanged, also ran every mode at 59.14 fps,
read the controls back over I2C, went through ten runtime PM cycles and
s2idle with the camera idle and mid-stream, and passed 54 of 54 through
the media device. Emfox ran v4 on the Surface Pro 8, on v7.4-rc2: 3/6
maps its INT3472 as written, and 6/6 with the Surface Pro 8 entry lights
the illuminator.

5/6's lens-focus entry did not run: this machine's rear camera has a
VCM type ipu-bridge does not know. The Surface Pro 9 entry in 6/6 was
tested by Fernando on v2, not by me.

On the illuminator in 6/6: it stops lighting past about 70% of the
frame, and in the dark the AE runs past that, to exposure 1796 with both
gains at maximum. v5, as vd55g1, keeps that as the next stream's AE cold
start, so every later stream starts on a black frame and stays there
until the driver is bound again. On a white sheet the AE settles at 51
lines from the default cold start, and from 1796 with no gain, but never
leaves 1796 with full gains. A MAX_EXPOSURE_LINES cap while the strobe
is on should avoid both; I would send it on top of this series.
Benjamin, or should the cold start not carry over until then?

Tool use, per Documentation/process/generated-content.rst (Assisted-by
tags in commits were dropped in 7.4-rc1):

* My contributions to this series were prepared with Claude Code
  (claude-opus-5-5); work by others in it is their own.
* This replaces any Assisted-by tags in earlier versions.

Sergey Lebedev (6):
  dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
  media: i2c: Add ST VD55G0 global shutter sensor driver
  platform/x86: int3472: Map the VD55G0 supplies to "vddio" and "vana"
  media: ipu-bridge: Add ST VD55G0
  media: ipu-bridge: Index the sensor device properties as the endpoint
    ones
  media: ipu-bridge: Add the Surface Pro 8, 9 and 11 infrared
    illuminator

 .../bindings/media/i2c/st,vd55g1.yaml         |   27 +-
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/vd55g0.c                    | 2232 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   92 +-
 drivers/platform/x86/intel/int3472/discrete.c |   24 +
 include/media/ipu-bridge.h                    |   16 +-
 8 files changed, 2396 insertions(+), 16 deletions(-)
 create mode 100644 drivers/media/i2c/vd55g0.c


base-commit: 42b94ef7358f04a0ad2e3541a0db307ed39402f1
--=20
2.54.0


