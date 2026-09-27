Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAE021CC5A
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Sep 2026 01:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790473238; cv=none; b=RuaEB7Ox84NUxGfhNDXBSTr8oA92M6VutcI8EjV6+CNtMyVJkC5TBFz3GRArtV8SPuGCcuD3HGNUFiAtxvhlFu231W+rJ1Oc8FwOv11VYfRW+wwhEN5erhRPx4ejSTP5GtCTdMyYrumPJIeGc53thoSEb8vVRWOjsw0rStKq4Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790473238; c=relaxed/simple;
	bh=UnnR+ATLgPExGFZHufyb2ba5HleIxoZRia483qSniq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dNCx44y8Okf8Abr9YKh+o99olsSEmfyKjyQmbucOyp3xibP2lPOKBC0WAqHRgxTSqDnEA6mj7jHFjUvmCxubyXe3EAOz9+lf5ZRkixeSM36Q6xxfui9qrpYBMj6141SdiGlUYyH0+bTjZzv8rZ2nOjJ/o3h5yKdre9NPVocZOrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQWQzttE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQWQzttE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so2640105e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 18:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790473235; x=1791078035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCbMaHKrOBAkv4xsmVqUggrJcIbKWw7RYeOk/wu2YR4=;
        b=hQWQzttEms21Zx0/m9+N6fW9VFZdEbxTpZQtgYKawIubNY2bqPpHVbOS+5a+hPSzdf
         BESA1fYM0vvkuYJNUizPKc63CsVZQQNMvJn2Go0E1i3ceEom7CTXj8ug+9yRCrVQ62Wv
         EKMgnSZMqFWGWZbeF7ZiFmXdIREkiRNubfwE/hr11UyqRrS6b54MSd5tClpkbJ5bQ7B0
         e2nY7vIdunA/kZIlAkWLDP3ECRZDakomHdYty5zFxxzSHh4rEOAUnqboyUva/2jmi1yf
         HfrK9fvVwD9m5HrF5hSsm7GTcSMD1AhWRet2TK/y3njdWklW9LMmcOWWov2iin9o3rvW
         nUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790473235; x=1791078035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCbMaHKrOBAkv4xsmVqUggrJcIbKWw7RYeOk/wu2YR4=;
        b=KjxdEJ8WjqEffyPl+ARxmiMGNEHCPPQ+tBm+eWvEtxXIh1xRzjVFxnpbF3kh4SK5L0
         Hjy6sbPYa5nljApOuMSIU9fHUi/Hkai1I8SAr/E8Tkh0OtD2UFBXQFmsZMBFp+Q90Mv/
         kSqp52es4m5mLBaQ5/XngjKYXhzmO9L/XHX8ulR70S7Q+cdFLHvyfZyPM2PRpQBIN80G
         QMratPQNjOi/KoO1BmlA67Zj7Cc3Y9qaUJl2QfA90ZsVH/MaQCvcIh4WVU5/8vCvRcx8
         n72fdkutBBvxZhqBQvviOiTj0wPOywL+gLAFQ6/STF5ISwgTVLbfGK80zsX18CuQCD7L
         Picw==
X-Gm-Message-State: AFuF++k8eNW5BA7rjv5zS/Z0UZ+/rhlESY3VncdWOj0E20WU5oWzgFrR
	awgvJRAuk2cmovDnU8WihMN1atjNZxjzKzScNrs0UIH0DSL2M0sFIg50
X-Gm-Gg: AYBFou1eTKtGZ67XnPcCNLPAXETX52WeoO8QyGvqw7RfwgRNJ8YhBf9ir9hPk2FTEHG
	VafvBBKN3C4aH5B/DLU6jwyc8qYims0DD2+e+OlDpVMISjvZZlDc+yZdVhVy5jOJ/Nkycvt4qJn
	40yrHdBneSuczXHlsmXtZqdKf4SfX1IRWCblsSJVpBVdmJ8PYDxmDDw6141ypMNNN+FcEVLOOUt
	4o6V/q8fCedi384qDwACXg2R+ujV6Unj0nqF0DrUWDIzDaFHMkNhRIYEw7qJKTerHz2UkqVgqSP
	ZBodtOB8h5pZMSzCcHPhT+V3dD/HU8tDn3x82lfFjk5r5xkGDtLbQ5Ngbjc+pZSTrejeoLqsRk4
	TVdsirz1NOx/5KjiM614Iyb34mh+nVIrw8DAahyn+FY8zfePCsgBEowcfwWmpzGXZaMT0rZnSKV
	Ckbfr7mAroaJ4n9NQ+2wH76Fa7Ra0higJGHFxY0nuxN1jwG5z/1iirdB3Hc/GtwlfvLGAOHrrbK
	bKZ6N097g==
X-Received: by 2002:a05:600c:8b5b:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fe66f17damr169784005e9.10.1790473235208;
        Sat, 26 Sep 2026 18:40:35 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee9203f0sm114736595e9.1.2026.09.26.18.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:40:34 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH v2 0/2] platform/x86: uniwill-laptop: Support the PCSpecialist Recoil 16 AMD
Date: Sun, 27 Sep 2026 02:40:29 +0100
Message-ID: <20260927014031.3465252-1-amad3v@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
(board X6FR57TY), which the driver does not match today because of the
different DMI vendor and board name.

Patch 1 adds it with the existing Stellaris 16 Gen7 AMD feature set.
Patch 2 maps the "Sc" key (WMI event 0xD0) to KEY_ROTATE_DISPLAY.

Tested on the Recoil 16 AMD (BIOS N.1.39PCS10) with the driver from this
series built against 7.2.7: the Sc key, the hwmon fan and temperature
readings, and all three charging profiles. Charging from below 70%,
with the charge counted from current_now:

  Profile    CV (4S)    per cell   stops at, of a Standard charge
  Standard   17.405 V   4.35 V     100%
  Long_Life  17.194 V   4.30 V     about 93%
  Trickle    16.818 V   4.20 V     about 90%

In every profile the EC then reports 100% / Full, as Armin said it
would.

Changes in v2:
- Patch 1 uses the existing Stellaris 16 Gen7 AMD feature set (charging
  profiles) instead of the percentage charge limit (Armin).
- Dropped the platform profile patch for now (Armin).
- Added Armin's Reviewed-by to the Sc key patch. On whether TUXEDO knows
  more about event 0xD0: tuxedo-drivers (4.24.0) has no entry for it in
  its Uniwill keymap, so it only reaches the "Unknown code" debug message
  there.

Regarding EC_ADDR_CHARGE_CTRL from the v1 review: it needs no cleanup. It
was 0 before v1 was ever loaded, and after a power cycle without the
driver the EC had reset it to 0 on its own.

v1: https://lore.kernel.org/platform-driver-x86/20260925211635.1422516-1-amad3v@gmail.com/

Mohamed Jouini (2):
  platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
  platform/x86: uniwill-laptop: Map the screen rotation key

 drivers/platform/x86/uniwill/uniwill-acpi.c | 11 +++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.h  |  3 +++
 2 files changed, 14 insertions(+)


base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
-- 
2.55.0

