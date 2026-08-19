Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1348349B15
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148079; cv=none; b=pPdIQ7oWOUzf0yTUCAMN+awTqMUfu2GntA/i7TeGV4+vO+iCIqsAsutg8+LkxDLHSHGAmUSdrYi/5o9K/XovMHEsCYRbJ3A3A8PS005we/hV3AjcuZ7ubjFDiMIBRcv0tgXwjSeK0B3t34dew5vCMbOAo50ioFR4fhN9ZjWV9JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148079; c=relaxed/simple;
	bh=itH5vmH4tVR+3dyIjlnE+VC3GoAp1/pzlJwsRfBI9QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8UeFye0v/s43NCVpbg5r75JsTO9bZk2Fc+JZI/TURvjifuY+/T10TaGgbZHdigqicgw37wjzkZl7GZ+RerXYda/ASVU3ICDKyGpvDGS+hhOucCvbRFOaafIXvEG2r3UK6zsFzenTbi3Nj39lppv7fpfK1O1Olple+L0p/0YXfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqyQfNtw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqyQfNtw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4815b8781c7so511424f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787148076; x=1787752876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rV4HdDBapWRU7n3smij5X8vxur3rm1zQnAK/uJTwVYY=;
        b=rqyQfNtw6SE55wEtw85kpbWf35WR6bwClsJcXROraDRNNnZeoGeWlmyfADXuzC8iO2
         NBZINW6tTEAHnw9YmYhiZfwQgvuLmouxVmQ+WsHoDSqdMFv+oEzR0q3CmMt7dpmBz6cJ
         zMLbx21Vs8LbjrTwBytAG/SDOIoZEC02Mt99fTmDszt6Dvfyivb+S7Fpnyyac/P1fiXD
         6/wwJENvVe6fqY0FwGSfrThuBG/8K27x9Z0k17IvWvDIXwQ3iG7Vzvny+2qH7+Uz2P01
         QPHsKpSbHlwSDxM7jlFjOIi+a+RGYQ8tcyyUmqksvCe/vbIgFJSph4GnvU9OUjsnbhDB
         /s1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148076; x=1787752876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rV4HdDBapWRU7n3smij5X8vxur3rm1zQnAK/uJTwVYY=;
        b=oKjV7g9LZ6ZPHa8i5sRIHtoiFn3NNhJw4RN72ZCG9n460M/g3uVUzBhYcPQg0gxJ9O
         6nPj1D/6SHy8fv0SO4MPKVrIvoPv63yw3RwEP3nFg6XW9E0ziQc2bHRVpkwfh9Y6viLV
         cDZX0RhvtSqHj4p/8Cveno+sBvRTufEgt8yUdzBzMtzjQpQV2pfeAsQtFMJrBdQArYPo
         MNU3UfX8Tl9MvUXNtGT4V3NBcQytAcIPERxX1DOtZxWVD4JOzOIRIrpCAmcAVOpHm16f
         2moTYH3cOqqhW8pedmkvqHZotxJuADbuDWAyy8OvfHV6spQTYX12j445Y7V/1pNSXS9F
         Il8A==
X-Forwarded-Encrypted: i=1; AHgh+Rp/b7SLGzlEpEzgIaURYV1dXJOwTbSousC9ByHGPetaP/XHkKHLtDAcjl4nG/pyOPbMYdRoKME3hQumgX77VxxJhEAX@vger.kernel.org
X-Gm-Message-State: AOJu0YwRLu7/50W4cFIsObCtt0COUM1lG+T0zyH2Xrys5WWd+BKRszWP
	1o5SJqi02mJygpYTcQwTng4Mg2pglpSnKmPobMsa6SbsB3HXLFzs32GO
X-Gm-Gg: AR+sD13TtqSKctwBHtyxU59qpJc1XfR0v7dUZDsrEV3/dpSgGVm8wEG+A5LoeUyo8QM
	9ZvaSK5WXWrp3IWXU5t2jDR5BR3UFMy+AOk+wo1/NrYHAJTbzCCY5VrlNS8Q5joZ2viHEUaAVx8
	0yr0IYuJgrnF8qlXo15rDtYzRy8Nl7CMpQWOl90OoTNiCSl9VCnE3WS621dNqBbHK1Uj03gnc7h
	tJOMqwoILKAqrfxNAl/89Wt89/gBRLkEeA3CdwvhlqobOpEHAY0pBNy1vsTtZsGS2uS7tXeg4ev
	v2NhBfhoWsKEP71fxOUNPqbMXw7nK6qn2pLoHDXM1nc9eoTJTuQDZDcHF1hOtMOMyReMml+2uki
	hEyJZgw2+xKWrYjc0dpvPsY7NMmcikEptGudy3gt0yc45UiAU3w+Ggi9gKNpY9qx7orZC7lw7A1
	htb21oIazGLusToc2DYCwYLV+i7YV+AiIF5xu2nyr7w1dz6BK1Fofk/uw=
X-Received: by 2002:a05:600c:5291:b0:495:4fd4:619b with SMTP id 5b1f17b1804b1-499aa189357mr100576965e9.1.1787148075598;
        Wed, 19 Aug 2026 07:01:15 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:d3:816e:dd0c:fe6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm92751985e9.3.2026.08.19.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:01:15 -0700 (PDT)
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
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v7 0/5] Enable cameras on Dell Latitude 5285 2-in-1
Date: Wed, 19 Aug 2026 16:01:02 +0200
Message-ID: <20260819140107.1329091-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
References: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

I prepared this v7 at the end of April, then went on vacation in May and
forgot to send it out - apologies for the long gap since the v6 review.
Nothing has changed since then apart from the v6 review fixes listed below.

Per Documentation/process/coding-assistants.rst, and following up on Sakari's
question during the v6 review: this work was developed with significant help
from an AI coding assistant (Claude Code, by Anthropic). I used it to help
reverse-engineer the ACPI/TPS68470 bring-up, iterate on the board data, and
draft these patches. I have reviewed and tested all of it on the actual
hardware and take full responsibility for the result.

Changes since v6 (addressing feedback from Sakari Ailus and Hans de Goede):
- Patch 2: Move board_data lookup and clk_pdata setup to after the
  device-type switch, so they are only reached on the Windows path.
- Patch 5: Revert the supply name reorder (avdd, dvdd, dovdd ->
  avdd, dovdd, dvdd); regulator_bulk_enable() does not guarantee enable
  ordering between supplies, so the reorder had no functional effect.
  Remove the now-stale paragraph from the commit message.

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

Tested on Ubuntu 25.10 (kernel 6.17.0-22-generic) and Ubuntu 26.04
(kernel 7.0.0-28-generic).  Both cameras working in Zoom, Chrome, and
GNOME Camera via PipeWire.

This approach has also been independently tested on the closely-related Dell
Latitude 5290 2-in-1 (same IPU3/TPS68470/OV5670/OV8858/DW9714 stack) by
Vitalii Tytskyi, who got both cameras working across boot and suspend/resume
with additional 5290 board data, and who separately identified a
hibernate-restore fix for the TPS68470.  Dell 5290 board data and that
hibernate fix can follow as a separate series on top of this one:
  https://github.com/vitovt/dell-5290-camera-kernel/tree/master/patches

Thierry Chatard (5):
  platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477

