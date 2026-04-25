Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFABA8632B
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 16:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134712; cv=none; b=ncUlPy4zgLEOK+1wM0QmGHqTk0MKNCf7Qi40q7zHwnsycEyUzvdJTl/Ya8unZ0NQWzp2ChL6ACqFNQRo1Vv21rlsTKEvfQswM7OWHxO96Zp318bR0pyDkyu91iLe4JffORnnwDuXvWV/JuIvsgHsI/rBCs3D9zplOgzzuWSmdHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134712; c=relaxed/simple;
	bh=mv3H+AyqqYV4F8o/lHb6gla8J73a/RvMxboQCjj13C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9fJbWMgNlEduC/g7Xw+vOqOoPP2MgPGYDq8gBR0W8BOvq5jTfGeJKwukZCcMi2/Ly4f6e6adf/aKKv29psm2z10nqpLUPaKHWZR75ADB7E4IdyXqPEPOGBAlyazSM1tyfVVDihyeGOpZ2fWIAm6rxC1l3q906phtYr+6YQRbKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxhRMsIl; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxhRMsIl"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c45281a06so11587974c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 09:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777134710; x=1777739510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2etDo6S5QLxsftodeIDSQ1hpnhwMdeQI8Kh/liV+PG4=;
        b=rxhRMsIlGQVonxvhnptD4n7yeOh6q/xI4giDvlNWjRqtwNjoPPMxpMpXFRnPROcLcg
         o9QRsqa2Q32ZE69Pt2W11sk6FmcDnSM0waIGv0+tOGRfu9nVCHORt9bOQ6mZniHX3HhI
         7lwg3v/J6L75l7D5mxmnAfobWihY7LuGEkrXgMYuAphlM+q+y/p5dem+XgpXEwSWenJH
         ccWfBZhKTEsAkCduh2LmL9h9FbnOwvVRHj2mHtD7OaCrnalbk6s8o410wYG0mgyjgs3k
         pvoVeq0QlYwP10YAtDQy3lonbM5c20d2KbMPHGH4y6aOWSjqyiSFuX6ThpL9IdvSnLar
         RpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134710; x=1777739510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2etDo6S5QLxsftodeIDSQ1hpnhwMdeQI8Kh/liV+PG4=;
        b=CCLBSM3FLxutSEAD8BxwYioeJ2Rq7ItfF5V1j23USt73hfmVFHm1rRQ4ms/gK7mwgP
         BMAfYCuiIT7dCabY9OuF1XlJUShYwmUFGD62hn3UT8gP2j528WAYxQ6VStrxEAbIRR4R
         2/qMgDXVNJup4Yvv8aSqXvtxDuD53mOop7enebl8VqHJjg37kujfwM34EG2QXMifndMj
         SqRFLoZeYmEhwpVVnr5KstQRwLG2SFjAe8joCAXUUnmm7IuvEnfvfmchvDvQ4iL9UxBJ
         uswcO84K2+k4U8FHOpGMh3xULQmC7kZNqqsdPoxG7lxD4JVQbG6AWMEKZm2gx6/uf2jD
         /TkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WEYjvvGSYJEGjZPUrue2ADaJcNl5cj6yuPWAc7vgvAZU4RRcKItGU49LiCj9Hk6+n6PL8mZ7Y8OUHgLdpEReVALtH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9p07+cKzunWGrmsIDAyHohoHRrg5HizDEEDQrbpSS7WwTwrJX
	TBewCB4wLgyaElasjmG+lUsxoTHDbrA45bIvbQVnhGS2p9pt2C3DyIbO
X-Gm-Gg: AeBDievBlwvlr+2RmBry0P334MISyazugIPX6AfWcltKc1dLhFimCzQ7lEgaRBaJ2Bj
	QBqmOnOg/InrG7vDCADjvV/iUgQmOSHN9+IWRDx8Z3U2qXy3ZNJdg05DlgEpCSYCuMno6HhpPlu
	Ac0QYzKq4wt2iDbrq/0UWLViqHcv/haeQ3NsDZOMb95xNA8h+k6XAomuJQUguKF/syrCKirfDEJ
	89CRl9awLnpMa5zqSqgGHjQuiRGoEqACITsoY9y8w0BUONRhtj3geDaXqnCRPdUGAVX6GuDvvP8
	vXBLxUxVOkn8543Xg5RosVZRbgAlAVZBUQThiub8z35XrSRAWi4Xu6B9JgzuxmZwQYVCl6REyzw
	gs4T1g6kp24cilPTkAPMUxOtoWccg7vh59dk657wMZGKH9JjHlQH/nkDxZAmmUDEICSPLYESOPh
	nYRb3GLQGmF5VuMJ06N8DCgNEi0oKyT61W/g==
X-Received: by 2002:a05:7300:d70e:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-2e4878d65b0mr19573764eec.29.1777134709969;
        Sat, 25 Apr 2026 09:31:49 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.143.226.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8bd2sm35922547eec.11.2026.04.25.09.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:31:49 -0700 (PDT)
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
Subject: [PATCH v6 0/5] Enable cameras on Dell Latitude 5285 2-in-1
Date: Sat, 25 Apr 2026 09:31:40 -0700
Message-ID: <20260425163145.8474-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aehzn85IsUI-bcKW@kekkonen.localdomain>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

Changes since v5:
- Patch 2: Use a local 'tables' pointer before the gpiod_add/remove_
  lookup_table() loops so that neither call ends with a bare '(' (fixes
  checkpatch CHECK reported by the Media CI robot).
  Also restore the missing VSIO->avdd consumer for INT3479 (OV5670):
  the v4 refactor dropped this entry, leaving OV5670 without its analog
  supply and causing -EIO from ov5670_identify_module().

Changes since v4 (addressing feedback from Sakari Ailus):
- Patch 1: Drop the data == &spt_i2c_info guard from the probe condition;
  the HID (INT3446) + DMI check is already precise enough.
- Patch 2: Revert n_consumers back to int (unsigned int broke the
  if (n_consumers < 0) error check on skl_int3472_fill_clk_pdata());
  restructure probe so ChromeOS and error cases return early from the
  switch and the Windows path follows as straight-line code after it.
- Patch 3: Correct the VIO description in the commit message and code
  comment; drop the inaccurate "no enable register" claim and instead
  document why VIO is kept always_on (voltage must match VSIO, no direct
  consumers).
- Patch 5: Drop the paragraph explaining the VSIO->dovdd mapping from
  the commit message (implementation detail belonging in patch 3);
  add an explanation for the dvdd/dovdd reorder in supply_names (core
  power stable before the I2C passthrough opens).
- Patch 4: Unchanged.

Tested on Ubuntu 25.10, kernel 6.17.0-22-generic.  Both cameras working
in Zoom, Chrome, and GNOME Camera via PipeWire.

Thierry Chatard (5):
  platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477

