Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2823A7587
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811954; cv=none; b=c9P2PPbp3v6+JsVB0gwdvKLArbp1ezRQKRPJPnTc0zAzU2v9uuublUjrK5yR+ZrE3sXN9dS3nXX5rcAgZUZOtTV8nItP17v1za4InazeWQR1knC0wR9g8fRIcijP4owNE5YDTjR55RjAs8hhzRoqAAROjBtbP//985pbp9nY1is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811954; c=relaxed/simple;
	bh=p4hpYbaaV2jAO91rm4XYUSpVwUAcL13OGh3u8xmVSKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ug+FhYVR3Q56IJmPxiHQUdBZzvSVjnLYCdXRYc8LW4MIx01BFNG2hzA2fdMP8Fo87u09PFQMK5S2/nVx0xmWxQkAeizt8kC22KZQO9F/swSe9L1Nn28XMP6FEUZfP8KEVvaodMt2BPZAsWp0BJlmkwueDl7vi7q59m9DbtdxBpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlQgxJ2o; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlQgxJ2o"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2de831d2b20so397261eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 15:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776811949; x=1777416749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52lKPT06xJB6S0hMXMshZr9YSqwMjyDFKuBVFDd9B08=;
        b=nlQgxJ2opjNvu83bLd8aKVBBvJoqzj5pFQ+4168NZkyPsNdYp84jbr0udrDk7+hC4x
         BXZffM0E2KxgkiYoPMLMRNQY14vfmuFavnEGDDXH4IGXAyzWWzz6v0jbmGLuHOl9dOix
         Nkai5e1bPSb0iMm6ukejQ6q6k7VNZkVej7mSIl0f4WEQaPXdkyBiZVwUAb07LplOukjH
         uQwSrjGNGXUE8L5pEBFcjbCJ95yDJPD4cccKl0QSTXURKMo9KvVQpAcYVYS9xsE9cRyd
         d6VVrTQGzXqc5TP5dRo8I3vcxdiqnUWEFhR/P+8J+yYU3dwRBm6XxbwdRmddWu56sFSU
         ihHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811949; x=1777416749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=52lKPT06xJB6S0hMXMshZr9YSqwMjyDFKuBVFDd9B08=;
        b=c38kXkPeAN1yT7Uik/d0CxMP6aK3Cn2nOISWetpm4KaVuIJZe/mT5GQYGijoKKp+rv
         OV/wpuGDyyqnGV1gX5Tq9bNjlmuZeMHrl/LdRgFzjySGnSY9l4BUPGK5fv/lQYGO4aCT
         781gXNPPAZSqfkqhUJKlXCx5LR45NFktTbG661dsvViLu/RKxdmcGGbiHSpc6tUhZfJb
         22JkaaAEYE9E5wHMQwoX4euO+suJhk/0XHLOCO4Cvj1R7XRopp8gjMyD/fg1nSmhBcHP
         sizqhMbvHUaSzhGPU49wR/kTpLwO22gFLWLnGna3aojAMCDZLVEDJfdB0Krq2/h9xXne
         3Q8w==
X-Forwarded-Encrypted: i=1; AFNElJ9jcJZMWetskMaW+uf+XV9ZPaylAjHplKzuHCmg3A4FnPx1YoOVknJoxRaP0eRUZ6eq6aDsZyGNgGkTCq6gFVY5qnU6@vger.kernel.org
X-Gm-Message-State: AOJu0YwF0QXlrjYlmnzD2tQj77gE00H3zDIBQe+CDgt2J8/H1XF5T9Oe
	gCrJEFIHZ2dEGg6CL0m6ZxWEkHa0J1+o7HhLhYedXIUa8N5r9RhRHLbo
X-Gm-Gg: AeBDietU1q21yD9CCNd4mt/ThYCkOYOizdxi+UNZ0hQfNCFslCOp+xq3mhwwXmqEvpP
	ANl2U3z4KzHWTSwkLmzBNqsV43Zbi0B8u1RqDxSppf8J+O5HVt4/aYVI26XXcOlIn5aXl/GlgyJ
	cXU8q/V1w4arQiTyyXJiy8oAYUucO+5edsnZb3WHmJDp+HOB81ncnGNDrZ9TdDSjkE9sHapM8Zn
	uR+SIlOAacNRL68yVfRZEotau1yXVgxNGIB0gWsNs0E492BoCR+3erXgCEqDkLAN+RXgLYoBi8q
	Ax52ul6tsiX5BbFT6FtXkuk8Jj1dlk83uPcAy/iAUFr8JHB4BsW3JKAd0DyxrTeDFR+csompL3g
	Rak8VqG93i2jfqAuIFe3LE6yAqTsVCnMncSaPJFLicW64Xxdlm3D+5ZFwmnGf8H+YacQrrouKyh
	Mx8t4KkojwE9Y9bYR0Oihimi6p7ZSMjZcA
X-Received: by 2002:a05:7300:b58a:b0:2d4:62f0:b2d4 with SMTP id 5a478bee46e88-2e4786461b4mr11747692eec.13.1776811949190;
        Tue, 21 Apr 2026 15:52:29 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm26145884eec.8.2026.04.21.15.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:52:28 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v4 0/5] Enable cameras on Dell Latitude 5285 2-in-1
Date: Tue, 21 Apr 2026 15:52:12 -0700
Message-ID: <20260421225217.12472-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

Changes since v3 (addressing feedback from Sakari Ailus and Hans de Goede):
- Patch 1: Fix multi-line comment style (blank opening line).
- Patch 2: Fix multi-line comment style; change n_consumers and loop
  variable i from int to unsigned int; remove spurious (int) cast.
- Patch 3: Rework regulator mapping per Hans's review:
    * VIO has no enable register and is always-on at hardware level; it
      must never have direct software consumers.  Rename
      surface_go_tps68470_vio_reg_init_data to generic_tps68470_vio_reg_init_data
      (used by both Surface Go and Dell 5285) and remove all VIO consumers.
    * Map VSIO to dovdd/INT3477 instead of vsio/INT3477.  Enabling VSIO
      sets S_I2C_CTL (reg 0x43) which opens the I2C passthrough to OV8858;
      since ov8858 enables dovdd before any I2C transaction, the passthrough
      is guaranteed to be active in time without marking VSIO always_on.
    * Remove always_on from VSIO (was a workaround; no longer needed).
    * Update commit message to reflect the new design.
- Patch 5: Remove "vsio" from ov8858_supply_names[] (VSIO now maps to
  "dovdd", which the driver already requests); remove ACPI_PTR() wrapper
  (unnecessary when the ACPI table is declared unconditionally); update
  commit message and title.
- Patches 4: Unchanged.

Tested on Ubuntu 25.10, kernel 6.17.0-22-generic.  Both cameras working
in Zoom, Chrome, and GNOME Camera via PipeWire.

Thierry Chatard (5):
  platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477

