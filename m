Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003021A680E
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 05:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777094052; cv=none; b=nkFs5gwNtq9i66qaj/ZBb+trsyuoWJJkCcEaqje/XXckVgSW/l+V6OAJbtz5AfUTczC+SI5gJsjDtfKl3tP61BuGJoTjm2xK3p+lOiL7uh3QdMPt0FziGO/uI0fz5JPoxstLjdGZCSDXH6QDY5keY/sJQ0rEQ2YgLMXvIuvxbMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777094052; c=relaxed/simple;
	bh=nZeGtYRSLY6cucwUIwuF6nFPb17OoDRtA4XEhku14aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKOcxCb6egsWRsGv8X/cfo0W7qfWrFGaKWaz2R4Pn6wfPX8G0cHBv8TL45OcoM/FkwWVIR2YcW6SL/rAdaSRmzTsc4ci6s4o5QDKYIgPUtzIKV4GmSXdU8JYakjx8EMau9Cpfq7BweiOvdRcM0BoYIIkfU8GEvyxbyCss4f3Qnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCnCKXTf; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCnCKXTf"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so8280552eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 22:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777094050; x=1777698850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+bcFhSUD53lUNeF9/7wLA9Hr80nicrqJCEzeH7/pag=;
        b=tCnCKXTfjBxwLP9VCw+8LyxVcyKor3S0QJUs7tpzlOPC60lmddDT4DFSssNrBmzLMl
         SfIxZPcv6G0FLuOXByYugxHvvwWSkf6jjZetcpiOwXgWPf/oIJhFw63kLDuhwCgvrA+d
         3841OPcB27TtuYbJYYDgaJs1Qyrm4H6qFZE/TRS7VNmwwgqZ6rKy6AzpcmUPHc9LznKV
         /DEUia9to8quvLSaxrlSlTn2EkV+Yk+o6idsLPz2RObMftDB5oBTqu7U91bcYR0Sbdfl
         hpnXviSrxacA7v3LVKaNc7oaaqGSRyrc2FsM2q1reCxamPqLJrOZAx6lvuLCEoaIzkKy
         OoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777094050; x=1777698850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3+bcFhSUD53lUNeF9/7wLA9Hr80nicrqJCEzeH7/pag=;
        b=oco6E781kjjAD4HB5rsv6AO6MJ8jxZYXYHQ0L2ZfMfxVw4EQ4X7wgRzCzrCH4nIAoS
         B8zRIsOUcEpzzFTyNMH7AV9YuJPaOlW5J1HGQFXLtxCzoLkU2S3tbfO3Z/wEcb49GRYC
         osXEzXF7GytNMklBbjv0omc79V7w0VJbX0/u0AFR/pt7SU5/oI8ei8vjzggs4MwCHVRQ
         HQk6ifRSaRQYH+fBWtlIgC+vO7WPkZlLmrwwy3lKQfSIqAAbpTCeeojJZOIK8KKBQtVB
         uephOYntK6gt4UacYAJLGf1c/CWXbr0CpGk1slFIJ7vv+oSJylpGTlM3F8JDHH9PT/5/
         y+cQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gUdURMeNLmqJTvoM1QUgAn5vEADtv+LYpvgEMnPN4GNN+f1vkXZkXwHT7dF1Rvo2Wa0jTcvRx/SFKXINPZ73hue0i@vger.kernel.org
X-Gm-Message-State: AOJu0YwzXwyA6duLjhBiQT8YxX/t3I0gTWK+PWzTv51XEYd8Cz8ku9ae
	bOUj5CZoUIV1VWCXbOzEfKWKHao2agvdyG9pmGODgnFrhXGycEbb45CP
X-Gm-Gg: AeBDievh+0/SCazR782Y/YouKFJQwYKSRppVuaGD4uDVgVvmwWWaHeiHsv6F08o5jgk
	B/qa6/uXcvKNwJ/lSW+gxLsgJnI61uGiKWgVWugHaOtFP3zLTBePiBXE7OX+IVHz4fiLs0f5+9X
	mte+SzDO0sKbMT/7wpkFKoI5hSlei2HdMcbB7+OalQfadPFRaFlGk3WS2pOnp+A4HR+FfNpxv0w
	+LQb2ve0PNF2mPm/eWePuy85901EUf8f20g45dGtFX8Rj/CJ4L/AUfz8c1xq61T4goBSLkOsFSu
	I0SAqXjw/b92+blTyyj9uLcv3srX1B0iuFxb5beoC4BCsXW5LjWwWXrqWBx/XjVZdbUmas1qPQC
	NqB33kYKwYN9x+dsIpJC9iQNLyCbJpDXBNbA1H0k675N83Cv5g2+lk7HRHYYGNJqWgCZWEDbak2
	xlfr5vAkCZFgMPCI25LR8UBfvbm87zINub7A==
X-Received: by 2002:a05:7301:f90:b0:2ea:7901:8d72 with SMTP id 5a478bee46e88-2ea79019c06mr7788018eec.17.1777094050005;
        Fri, 24 Apr 2026 22:14:10 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.142.131.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm35973806eec.13.2026.04.24.22.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 22:14:09 -0700 (PDT)
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
Subject: [PATCH v5 0/5] Enable cameras on Dell Latitude 5285 2-in-1
Date: Fri, 24 Apr 2026 22:13:37 -0700
Message-ID: <20260425051342.8960-1-tchatard@gmail.com>
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

