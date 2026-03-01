Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED330BF70
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772402607; cv=none; b=mRpk5qfIF7pH/wh8T0hGfnsnU41WgT6+rtn3zCdLfxmfOs5F9QY/edibNid4FWcSsJqMuoqVF/FCP6L1TQnmUqbiRkUUkb7cIqCpy50Vg6Snt0leZ4W5+VltjB7rjv0ynkGnlGsDZUWhHNH3aY8SH0R3Ri8oEnSAqocoF84cZj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772402607; c=relaxed/simple;
	bh=IQTAaMCWvyiVBj5QrhP1f1pHij+WxsuUJ09Kvh5TmW4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L+hA8GnmwKGEfA9SABAZ6s85piqnpfh2V95MwoUNuPV9vTtuEM8aud8ARp8WKJLBqBw55J9PVq2px0U3GczZpQRErBYMFZ4iOSph4OgC/61E9JskAKhmV8X+/5sjiBd62WE4qOi4DzC/Kl2FWbsc49fyoyXB6wBx74jN9Hpn2Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEgJRgUk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEgJRgUk"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9362ddbee2so509529666b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Mar 2026 14:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772402604; x=1773007404; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TVQBSBN25FmSvgyN9bAhLqHSAs1arjErdBOi8SafDUc=;
        b=JEgJRgUkeaeSMRLizUxKrUJr2W3p0e7Ae4FCtGsZ3e4GFyPyHiWnXXNG52jcOi37KK
         41NiUToSEZfH2Y85ZYE6NwFgZWLDKZY9xWm+lJpeVnpwlifjgth9WnwHONxoeR2oVNR/
         xstO6dCUPaHL2phrADP/XKeP/NV339ySc2DNlEfFa+18MmkJaO3WQ6b/OvCZOlyc2qeR
         ajF+/kSNDckhzuenpufvlFNSI4OLw6qhwxTjNy9RkLj9Y6A4ndLhzi4TI4X0DNgVQCIX
         gz0luFmIEXb/GUuuCwDFQOHU9aXakFlqjpsiJfYkHE2fmV06MtzZmkKOcup8IinfGseX
         v9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772402604; x=1773007404;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVQBSBN25FmSvgyN9bAhLqHSAs1arjErdBOi8SafDUc=;
        b=AjH8ynDSCUJoxPJGSjIOmecNgVDBjv7iNT2/9T7kRStHI6gM1/xg5faDgr5k9qwSt0
         89MLBL65rp33yp36EtQB0AFjnI0Vzmq5BYoFDse9h3XMlV9w+HoWyNKCBbLvRERzBnaf
         sG4da3fsYUCvRkd7fekfJM50FSq9vfWhXhUUz8ArcQXwaDz6Nkajp652I9RzdMeptM0j
         QeJlg3ffkJoEsv6CgjZMm88Z4Cl2lAwSXO/840mZXuFXygSblQutYCpDlJSmYWfB+Es/
         m8gyuqIvrTwp+1nPxPvW5xjntwDPRQqXmxVWsnODCSbu1IGM4KBSLo0aDddaZF/sx3kZ
         vDnQ==
X-Gm-Message-State: AOJu0Yx7etpTQz4C2dBD/paulI9O/MS40v2jjz4gDYE+/db3e2o1S+U0
	v867pNup30waOQt/q9elO5LExQfOZtXNAl4+vbWyiol2JULy6+039Ztk
X-Gm-Gg: ATEYQzzSwzVCiyWVEoIlLyJI9384e4MakoDRRMm4DM5GxUNoJCopHTCJOEdqhyiVFZP
	L++9zqdSDhypFHneaiQ+zVIFMxDqZ18O1u3BntlbVYxZiZrhnTaju8VVW8pbaG3OJ4klEbWFTEI
	f0n04TQu0It6K+0Ow66AjqEK6lYA0E7BAjWsiGako1DjNFSaMpiSc5R3G+2eo5UJKAMblx3Kgqs
	22/av4XRcswSZNhkkADl5vrgeC23ZnHe48itMmdqpYj2As0Uucmgk2/+ONl1+8ASJCBT/1MmrKq
	Sa7v7sqZcocQrolyoTVM5SxGCDAQcAYuked0QFZywlEvTYJpFxjLLyYRC++3ygd/pvkX/+DERjz
	LEftrSaj+tKPl/6D+ARoIr7nRb5uZ+cwSWkM5gvsmGRrLcr+k0fescu3W32/8yrH3vrXwUWFubc
	+Jsr5ouqxcOytUmE4uFQ==
X-Received: by 2002:a17:906:6c9:b0:b8f:e424:ae56 with SMTP id a640c23a62f3a-b9376567d7fmr487055266b.44.1772402603485;
        Sun, 01 Mar 2026 14:03:23 -0800 (PST)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13593sm400915866b.3.2026.03.01.14.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:03:23 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v2 0/2] x86-android-tablets: Add sound and haptics support
 for Lenovo YB1-X9*
Date: Mon, 02 Mar 2026 00:03:13 +0200
Message-Id: <20260302-x86-tablets-yogabook-v2-0-061768d5c9e7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKG3pGkC/0XO0Q6CIBTG8VdxXHecgKJ51Xs0L4COSoYUULM53
 z2WbV3+9+38dlYS0BsMpM1W4vFlgnFzCnbIiB7lPCCYS2rCCiYKXlBYGgFRqhvGAG83SOXcBKL
 HshJca3VkJJ3ePfZm+bLnLnXvnYU4epR/jNGacS5ok1POyqoqgMIVp9H502ClueXa2Z/l8fFMn
 8UdJEoGhLRaE9tsxiXCDrKadNv2AcZMzlLTAAAA
X-Change-ID: 20260301-x86-tablets-yogabook-6fe4563ccb92
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772402602; l=1510;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=IQTAaMCWvyiVBj5QrhP1f1pHij+WxsuUJ09Kvh5TmW4=;
 b=kl33AydoopESY6t+V9O7Xq+o7MGugrwtvLYG6wr/p49pDD4YeSMiUMD7soaaZtM9VKIlG68ol
 aHvHAYCLolYCerIexHQfdmO76osMdRgaLJo6/pRUn5m/fFwtj9+bTWF
X-Developer-Key: i=jekhor@gmail.com; a=ed25519;
 pk=C/csaZJs7UBNDgeJcUAmPu4ntqNeaZ3BKfBQiH8tuGc=

Defines I2C board info and properties for the DRV2604L haptics driver used in
Lenovo Yoga Book YB1-X90/X91 tablets.

Defines sound devices for both models: rt5677 codec and TS3A227E jack
detection IC. Depends on machine sound driver implemented in [1].

To simplify the sound driver, the same set of properties is used for both
the X91 and X90 versions. For X91, software nodes with such properties are
attached to the ACPI nodes.

v2:
  - Use cleanup functions instead of goto's in lenovo_yb1_x91_init();
  - Adjust ts3a227e settings: MICBIAS voltage and jack insertion
    debounce timeout, to prevent fake keypresses.

1. https://lore.kernel.org/linux-sound/20260217231324.1319392-1-jekhor@gmail.com/

Yauhen Kharuzhy (2):
  platform: x86-android-tablets: lenovo: Add Yoga Book haptics entries
  platform: x86-android-tablets: lenovo: Add Yoga Book YB1 sound card
    info

 .../platform/x86/x86-android-tablets/lenovo.c | 223 ++++++++++++++++++
 1 file changed, 223 insertions(+)

base-commit: next-20260227

--
2.51.0

---
Yauhen Kharuzhy (2):
      platform: x86-android-tablets: lenovo: Add Yoga Book haptics entries
      platform: x86-android-tablets: lenovo: Add Yoga Book YB1 sound card info

 drivers/platform/x86/x86-android-tablets/lenovo.c | 216 ++++++++++++++++++++++
 1 file changed, 216 insertions(+)
---
base-commit: 7f30250e792515b42130564cb52a9d218bad4cb3
change-id: 20260301-x86-tablets-yogabook-6fe4563ccb92

Best regards,
-- 
Yauhen Kharuzhy

