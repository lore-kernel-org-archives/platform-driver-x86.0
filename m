Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A4E363C5E
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823743; cv=none; b=JAh0SNaiC3p9JnMqB9cZgz4Z83oqdJ+KNChEWif858K+uv6ac48LhjmkEMX2uBBTcI+j2fB6FcNcZ1t2Ih4utbNuPLu3qP9vF5seXc+M++1V5t8zWoUXYHkMEnf8n3jyBPuA6twkH/l1FQIH+leBn0IHzS9IMJYBE85XtKNfy/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823743; c=relaxed/simple;
	bh=4ujO8YPn+C6kly/QIxgqk2+iFaoJUzR0JdPeVgifXGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvqinM4H8mizcQ8KgnQHPZx2Bf3SyYzQgcZ/ykhUUS4OViL2BUIikPxsusSCryH9/W7FLTHxXrZaIq9xuWBn1AGN9dPNbBG22zc86iUg6ldSzOUSZnvjRK0RN29QR1HYnM9wd1Iwm7FBbBBEiryp71vrrG1rLLg4IB4nSwCPoPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/uTGYHL; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/uTGYHL"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c7980c060cfso4155413a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 May 2026 22:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823742; x=1779428542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BD6jb0vjKtzgJh8F8xKpey20kEfF+Odim4ezk9P1XI=;
        b=F/uTGYHLT8VYmGW7uUL+D8T/AA74P6prWB53VB35e1Kcxs9A1li02lUUJfl59m2XPG
         UY9OLwSN6S+/GyHL7u9w6UurHJG2uXT6EofbCa31igySqpYGx2ecTIpBe5XaqdKQrW0c
         zMB0Q5Vt/vCsG/kUXnNwsxqCm2edDNVb6h7iwTs6LrrYPs0mGDZOywnYqXOq//V1Xq8N
         Z3CgISE7MVDvS/pAtRj4lRWSEYv5Mbaxe+nEhv/DucluH8eIFkne84tkuLaoGmLlu12m
         Y6Wr6qgXaZu8EKxu1EzW/9XGVTu+kYxXKeeW/icfozYKB0+QwoxhDMuq+FGy/7nj9Oxd
         8Z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823742; x=1779428542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5BD6jb0vjKtzgJh8F8xKpey20kEfF+Odim4ezk9P1XI=;
        b=OpgK+9n54wdg1TGFVppoTK4OGfGxtHSdRo+lLVQ6Fl+DiShWkk99TIMGTJdxuIbk1F
         itkh6AbVHLyOJtyUKYs6K2329JdHVYUmSaK1RhR3BjPaEnnnd19SzHMHvEsb/E6QarCB
         LOPTbPOAIaFYr2UJ46qVRPhRQqn64ZWdMHFztTAl9XnplII4ZhkGj/TpSF6HG/GhiCCh
         8Siw0tNok3wOdo9NlESZFRXjjW64CoC5PlVWTAf1sr9u6BWEdsajwNM6OyhlKHhiE2hh
         vBLBPa/nxGkq6CfzyW6iCQZjpYT9mCTxy/vPpkpIKgfjH4ZV6tWYmBcmpGnJCncgPrYd
         maKg==
X-Forwarded-Encrypted: i=1; AFNElJ+ynlKuYcYeKpcmCp5O+Cp6GokPpsADjua8sVTqwR5rRQ5km5n8geIJwLoDYzAJib4MqU2i1tbuYmSwusBJlCyBmQWj@vger.kernel.org
X-Gm-Message-State: AOJu0YxaiSx1HyzQc/nKVhSZSETZ9AJhm5cHRUwMudmfGW99iBUfBFiM
	vOYb9nu7qryWErEQBmGwGxX6h5a9+KPneymeV7uGI4x1InBgc4nRcNwy
X-Gm-Gg: Acq92OEs6qibo9hHYEf+YUBhhlZHB+ck+qaLObtXxoYDGM9haJXh1B727UA+brFSblM
	TiTH3qMeh4SPLN9qFezbQDgAFGFvo8qJwf8HUmX8C2CRaJf/KQmjAmyzTBcnpxLYXV+dwFePYHr
	QR5NaMR6fAgfZQoqybiNwtGuEg4hBhk8hmlGhKy5Rtnvx7SJCkVEV7SKxz8UAKzOfbns+CQBe52
	R0gPqBOYo1BS6pDarI0MXiKED8TeTBsfVPTs1DIWrrrTOHaLAY/kuKlR1WVUnrAJdNVNhvtRVmr
	YWOiIhCoxRi0LzQqKCqCdzxeBBCj8gr9ENlDaM6jLN9vRLjbtULKU5ocDe30JpUUu+mZgSDo5MY
	pAEYZWSPI2ba4a4FqFDoImh1XYrKhX0qxUV+GeFga7eYShevz+XRDFkcNEmpCTFFN6EIcf0G8lh
	shC4B/E6dA3LnW04x+cPxxrttlxFZF+STrA4lo3tu6cMBuo+xBa2u4lbjQHCqSH4ccqBVbgWJ2j
	AyN1r4nP+UYdfigxTj2bvtbZMQ=
X-Received: by 2002:a05:6a00:1954:b0:835:366f:5da2 with SMTP id d2e1a72fcca58-83f33d80937mr2828691b3a.37.1778823741521;
        Thu, 14 May 2026 22:42:21 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:20 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/7] Add support for the Microsoft Surface Pro 12in 1st Edition (Snapdragon),
Date: Fri, 15 May 2026 15:41:45 +1000
Message-ID: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <177869930359.1496076.12020223802779537187.b4-ty@kernel.org>
References: <177869930359.1496076.12020223802779537187.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
Ice device tree: 
 - Updated to use 0x0 formatting

Panel: 
 - Add edid to commit message

Device tree:
 - Fixed formatting and ordering nits
 - Removed extra dmic audio declarations
 - Added suspected devices on i2c busses
 - Fixed incorrect usb regulator
 - Describe panel pin regulator
 - Added defaults for volume button GPIOs

QSEECOM patch (4/8 in v1):
  - Applied by Bjorn Andersson
  
Hid patch (5/8 in v1):
  - Acked by Jiri Kosina, but not applied yet.

Link to v1:
https://lore.kernel.org/all/cover.1778498477.git.harrison.vanderbyl@gmail.com/


Currently supported:
  - UFS (with inline crypto)
  - Touchscreen, pen, cover keyboard and touchpad (via SAM)
  - USB 3.2 x2 with DP Alt Mode
  - Audio, WiFi, Bluetooth
  - CDSP, ADSP, GPU
  - Display (BOE NE120DRM-N28 panel)

Not yet supported:
  - Accelerometer
  - Front, back, and IR cameras
  - IRIS video decoder

Note on the compatible string: unlike other Microsoft Surface devices
upstream (denali, arcata, romulus13, blackrock), this device does not
appear to carry an internal codename in firmware. The DSDT, SMBIOS, and
EFI variables only refer to it as "Surface Pro 12in 1st Ed with
Snapdragon" (SKU 2110). I have used `microsoft,surface-pro-12in` as the
compatible. Suggestions welcome.

Although the device is marketed as just a smaller version of the denali,
it has enough differences that it warranted a different compatible and
device tree.

Tested on Surface Pro 12in 1st Ed with Snapdragon (SKU 2110).

Harrison Vanderbyl (7):
  dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
  dt-bindings: crypto: Add x1e80100 inline crypto
  platform/surface: SAM: Add support for Surface Pro 12in
  hid: Pen battery quirk for Surface Pro 12in
  drm/panel-edp: Add panel for Surface Pro 12in
  arm64: dts: qcom: hamoa: Add inline crypto for UFS
  arm64: dts: qcom: Add Microsoft Surface Pro 12in

 .../devicetree/bindings/arm/qcom.yaml         |    4 +
 .../crypto/qcom,inline-crypto-engine.yaml     |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi           |   10 +
 .../dts/qcom/x1p42100-microsoft-sp12in.dts    | 1201 +++++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c             |    1 +
 drivers/hid/hid-ids.h                         |    1 +
 drivers/hid/hid-input.c                       |    2 +
 .../surface/surface_aggregator_registry.c     |   15 +
 9 files changed, 1237 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
prerequisite-patch-id: a34133ba03bd1d31c0ed08612c31131b62015654
-- 
2.53.0

