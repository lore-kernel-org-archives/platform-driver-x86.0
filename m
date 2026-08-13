Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CD8339719
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 02:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786589824; cv=none; b=MO3cfOml5eEu1PreO4A7mu5Iq+0azqDfI4Sa+P8D5IXFHoLMewDjfxgiJd4NqtRumCeT652CSZal12Fqu0nPX6+ImaabYRG9OWhY3zihxAKd0NxuHtc57QtKoKldV8+mBLAjWKb5ZlfZCbcUt9WB/SZ5pT1W0cso0266Kinz18I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786589824; c=relaxed/simple;
	bh=VRxlFXw96is9D7G3NrAUEYMo3k4A1Oq4s/wRktoxZY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qiKhjRvgTNAUc2kvB2P9K/4jwBP96OWrhQVkOp5Pe7OO7ZLvpiCdUGmW6gseO8aBAbmGHJFlLLZ3qHV4wydgtPlfLqmROVhI+tPa2AwvbXVJjCH2KZN1O3JUfk6uI49vDOWaz4R9cAv0FuOHtcVx9rr+M2kUSCMFpcHnqTJlXyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzMv4ZZx; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzMv4ZZx"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca12086c06eso256621a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786589823; x=1787194623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JK2S/jqrD07hGq4xNYBvCWpyA483T1NbLZw1jMz6AQ=;
        b=QzMv4ZZxF/ilWDWeapRYFoNsLihpfqXqolSmeWzIeXzeB+TgW/wASeKcll9guAmR7d
         J7yZneRs6kMWwmYgdSlSUIemoY4LCK01IUwpyx48pAEeaioNNFAsgpk5nTa6wN8Knt4w
         iFIOWhT2cMFMft7v5luv3W73v+jyp5yrWVi4dybO8u6aWjWAzmGjNlDaxXgbHvUw+Nyy
         5LL8C2NBDElPjpHIGn9c9s6x4LvRGR3242mNoYIvm4jFoQELmkP/WRjUDRKjB9F4okmJ
         Bd0TET/7GNgZHAPSSkByG58ZW0kXacQPAFm7DF6wA34cNpQkM18Z/icyCq9Bs/sCoDUS
         InLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786589823; x=1787194623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JK2S/jqrD07hGq4xNYBvCWpyA483T1NbLZw1jMz6AQ=;
        b=ESc2f849xIar/VIrGaCRuuh2wOBNSrAi21vRkc1ndR2QpwZCO402tJZeuYdFgE8tZW
         NW5S6ot57ul6iU3LDmxakUrO1StCcVGWtpBF9Y7NiTsEnX8rQPQxZEL4Uh9hiIC9X03w
         /qcDncZ0LSuApbQosS8DCGYvzhb+0LS19lZc9nf+5FfmcK0NGjLkWpTuB1Nal0axSuPe
         47VSlm1Mj93SigV9OKkl0sw/zFuyyRtVqv51AXqaJn98IvvxpsCCuio/5mNeizVbaEup
         e8aFInzl+wwk1zvEdpSC70Qk8W5GNJwLJO/6c8EXI76p1QMZxcwQ9Nz8RYW5xBwlMXD6
         c62A==
X-Gm-Message-State: AOJu0YziTpU4kJLfAYyQXwO+0St6SInBVMMMsr5m2Lod5n5DjHD3YMyb
	M/31z+z9gX46mEKqhGbsIgkXpU44p8KD/6QRThDNypTgjINTNLRNPe4w
X-Gm-Gg: AR+sD11mdpFL2zU82E2aij0K3gg2+Af2dPvHOPLNq+eVA8U3B7jzkFMnq9Wu7vbvNOM
	BAiuR4SMuS+9eVk7aU4wBBYQNsqivlXG1YTZwlgCyPPwvsn07ys3Vegxauuircq4H2IRT2HlVMG
	582v3SP7LPkiSPkTkUfEBfb9r4SoDg1vHltCcn27OckrbuYWB3bOKAlDcdj26u2a0XMbXoQrYui
	fqE52ASuqx0P7yoXga8HdQVhA1Zyuda4ESEhc6iNiS7ucju5EMYIql6vDetT5zRz/yUJr5/Hzyy
	GJyJ97hNQb2OoD+6+nc4I2+v6xVnMK049gGLEWOnT/GY3+XpmrcAncj3H6k8VAIxIYS3D7uS8e+
	1BfldrST1TqIWv+mDuu3d0MrGmSXh079juSTMj/yhMzEOVQqoob6Lc5qGLLK9+Wjm00yfbQkaw/
	cV1/siPlpzDCYqdWmT4QH4+49idmhi6slmrdhvwdg+UjKQJj3iaTYWUp5p9I+58sH1XKEJoPScr
	CEM/Z0F1bJgHmPPh2E=
X-Received: by 2002:a05:6a21:6da9:b0:3c3:9070:96bf with SMTP id adf61e73a8af0-3cc550384e3mr3568373637.9.1786589822495;
        Wed, 12 Aug 2026 19:57:02 -0700 (PDT)
Received: from sonic ([177.181.237.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebcf66340sm2097470eec.13.2026.08.12.19.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 19:57:01 -0700 (PDT)
From: Hilgad Montelo <hilgad.montelo@gmail.com>
To: Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hilgad Montelo <hilgad.montelo@gmail.com>
Subject: [PATCH 0/3] platform/x86: panasonic-laptop: CF-33 hotkey fixes
Date: Wed, 12 Aug 2026 23:56:22 -0300
Message-ID: <20260813025626.24266-1-hilgad.montelo@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two non-working buttons on the Panasonic Toughbook
CF-33 Mk1 and an independent bug found along the way, all in
drivers/platform/x86/panasonic-laptop.c.

Patch 1 fixes the bezel Rotation Lock button, which turns out to
signal via raw i8042 scancodes that alias the real Left-GUI key,
rather than via ACPI notify like the driver's other hotkeys.

Patch 2 adds support for the bezel A1/A2 buttons, which are wired to a
second ACPI device (MAT003C/TBTN) that nothing currently binds to.
Found by disassembling the platform's ACPI tables, since these buttons
produced no signal through any of evdev, ACPI notify, WMI, or ACPI GPE
interrupt counters.

Patch 3 fixes a latent off-by-one heap overflow in the existing HKEY
SINF-parsing code, independently triggered by this hardware's exact
SQTY/SINF sizes and caught via UBSan while testing patch 2. It's
unrelated to the CF-33-specific work but is included here since it was
found in the course of it and touches the same file.

All three verified on real CF-33 Mk1 hardware, including across a
reboot with the combined patch set installed via DKMS.

Hilgad Montelo (3):
  platform/x86: panasonic-laptop: Handle CF-33 rotation-lock button
  platform/x86: panasonic-laptop: Add driver for CF-33 A1/A2 buttons
    (TBTN)
  platform/x86: panasonic-laptop: Fix sentinel write past pcc->sinf[]

 drivers/platform/x86/panasonic-laptop.c | 254 +++++++++++++++++++++++-
 1 file changed, 251 insertions(+), 3 deletions(-)

-- 
2.53.0

