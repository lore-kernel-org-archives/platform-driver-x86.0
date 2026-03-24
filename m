Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4890735F5FB
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388526; cv=none; b=XqzYDRpgry0x+cYrY8/SYi60sbKiXNYmMtYVMcPdFRu4xreCs1rcUSIPJIOT2wgQeV2uCxr8asEMuqIYqtCwLaYX8lGhzj9YVZhH/vFlYeQcyaLWUzT8sp4UQAoLbT6rF0wSemH3ZxQM8O74TyVJk7g7qxsYjOsL9eyHHDaI76o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388526; c=relaxed/simple;
	bh=d8nRjqoDIwJbqKxF5GWzJrcsC0Ax6LqGNMy61f3bzMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eq1bZ8A8KiXXA+o6EIiMmeOb2giV8iF57ZY0e9cFZ8D4RRaXWTf3cqcBlncgPVbfiz41WDpzfq6lzSYHoRmV13DvIBnDat/8NDJ/yTZP688kJYjGXCSReW9uVB0GAX9Ykr2SJwAjPyCWENNUAe/ylpJmPw/zK7wAnI+JOSh+RdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IX46Ptnf; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IX46Ptnf"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0bb213b16so10433524eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 14:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774388523; x=1774993323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZErExxVrhQfzXmsDYKwyIHQCAZOmsLcP7GeXuAtDUQ=;
        b=IX46PtnfT/g4zjjmKPUXwSkV+a4wLeY/+FRUqC6OoCH6VzWqP2+yH/sMZUXRzKBx7n
         p1rS1TJoMcGSUXnwbCnPDKJeQimJpJ5vVaFXvp2RGcPWmq1VK+89WLbsFY5UYrUYLRsU
         rx3NkHrErz3Fpt6FaSpj7QaSn9rct1w88YktHeoIR/nBfDWv+AQikob8qKQ+RIcGM7+6
         WyeLW45Ml0sH4wC8IrjUQ+qSMBhdjBK7Oh1Lx1nzGC6m1Bg3rYmeyQO7buOt+GAdq8FS
         dDriM4FIXo2f6TO/sWePY8N06K7wXM5aIf32wyHp3TFGZZW1x3HuLJd9VzUdZlFxF5jz
         hlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388523; x=1774993323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZErExxVrhQfzXmsDYKwyIHQCAZOmsLcP7GeXuAtDUQ=;
        b=iW2xJM7p+LODPOpHuZE2tQBSjE7mBeyb3uPy/Sm50xxgHntmHZpFZLAip2Bgd5ggNd
         AwWQVPXsEeit3Z6euFx1YSEsoF/y5Rw1iu3hUmhM0LLiiUCMDGivwHgnesb2uPvWdEEX
         YXKAzy36+GpjjUIigNs1cFYzlyfMXuGTJm9VtNbXLyh8yht6bj3a8xEjzdD3QXU9YjSP
         yX6HIVER+H6Al0X47KDKP9RCqcbEk38hEK/ZwJqcx5huyllGc3K5Qmg9FOwrv/0axlOr
         0IrE3ZZlFgnVrhTI/tHeCK7R6oxTJJ28ZgvB//WJkWXxSjM9vSyropWOteSPsMudyG1R
         cSCg==
X-Forwarded-Encrypted: i=1; AJvYcCV0cBKSGOeL7xDtDJNBbljYjbZ1Yv+ygDnTJmXy9y6C07BzwcVa9GTLJ82gdXS3dDWBwZKk7LUD1EYnhdAZzrzgmFE6@vger.kernel.org
X-Gm-Message-State: AOJu0YxuGHtSzpczXUtMdMSGUtkejHxG1pHXGEFvn26f/JtiqkkuvmZr
	zZe1W4krPQ484ZM6HTw5qlKOJlSttVuEGWy0cACCUs33qlOIkXWLfHvR
X-Gm-Gg: ATEYQzwoiZzq0oivWq3oqG/U/2qKsLujo+8qLoxSyr0GjqVSSpFts1UFbrWBfp+zWMN
	+tzuNu2tgC7jDKA1TQ7BUQ1lnPJ6W0Yl2XmUdaF6H+OR8YsEyeIG3JCdTMolsb8cOzkvcGqt/EI
	H69yDCJMj1eC4jT0ASbkGDgu4+otDWvvq/qsG5MAEp7FMdB2NGoOZ+kFMHt89LYBmKNuS+FXTc5
	5eeTt2vx8tDQUFzQ+6e5OsvfjLMTj4eC6jPjKh2+XnLWEvI3POwxFigSiO+d1qVDvOdkRCUtUrQ
	gL4Zf3y48kDbgEdKXvQAumKgVC16u3eA/4rzUO47vMBaJGBonu8JZfzC56u3q489wzfuz62Pc/Q
	8CjSJvSl3I3BQMXGWw4tAnxZRhOMzk+RQBCA+HmC686rdaHNXMkAZnIyZ3fHfO8eRf0O4egHIFE
	Uqi56jOf4P1HM6wjxeSf1U6MJnpeSJqyRH
X-Received: by 2002:a05:7301:4e0b:b0:2c1:4b1d:a472 with SMTP id 5a478bee46e88-2c15d3fb1e1mr527524eec.29.1774388523085;
        Tue, 24 Mar 2026 14:42:03 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm3284180eec.2.2026.03.24.14.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:42:02 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v2 0/5] Enable dual cameras on Dell Latitude 5285 2-in-1
Date: Tue, 24 Mar 2026 14:41:24 -0700
Message-ID: <20260324214129.17300-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320000937.9177-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
- patch 2: split trailing statements in aml_parse_int() onto separate
  lines (checkpatch); add kernel-doc @param descriptions to
  aml_parse_int(), dell5285_gnvs_from_table(), and dell5285_gnvs_find()
  (kernel test robot); add Reported-by/Closes tags
- patch 3: wrap long lines in commit message (checkpatch)

The Dell Latitude 5285 2-in-1 has two cameras (OV5670 front, OV8858
rear) connected through a TPS68470 PMIC/clock/GPIO hub. All five patches
are required for a working system; each is self-contained and
bisect-safe.

Hardware topology
-----------------
  Front camera:  OV5670 (ACPI INT3479), I2C4 / INT3446
  Rear camera:   OV8858 (ACPI INT3477), I2C2 / i2c_designware.3
  PMIC:          TPS68470 (ACPI INT3472:05), addr 0x4D, on I2C2
  ISP:           Intel IPU3 (ipu3_cio2 + ipu3-imgu)

The OV8858 is daisy-chained behind the TPS68470 S_I2C passthrough port.
The TPS68470 VSIO regulator controls S_I2C_CTL (reg 0x43); marking it
always_on keeps the passthrough active from boot so OV8858 is reachable
on I2C2 at probe time.

Four problems must be fixed in combination:

patch 1/5 - intel_lpss: The BIOS claims the same MMIO region for both
  GEXP and INT3446 (I2C4). Without this quirk the kernel rejects INT3446
  as a resource conflict and the front camera's I2C bus never comes up.

patch 2/5 - GNVS fixup: With I2C4 available, ipu_bridge still does not
  create the front camera client because _DEP on INT3479 returns the
  root PCI bus instead of the INT3472 handle. Root cause: BIOS leaves
  GNVS fields C0TP, L0CL, L1CL at zero. Fix: scan DSDT/SSDTs for the
  GNVS OperationRegion at TPS68470 probe time and write 0x02 (19.2 MHz)
  into all three fields before ipu_bridge evaluates _DEP.

patch 3/5 - TPS68470 board data: No board data existed for this machine,
  so no PMIC regulators or GPIOs were configured for either sensor.

patch 4/5 - ipu-bridge: INT3477 (OV8858) was unknown to ipu_bridge, so
  it was skipped at CSI-2 enumeration.

patch 5/5 - ov8858 driver: No ACPI match for INT3477, and the driver did
  not request the vsio supply needed by the S_I2C passthrough.

Tested on Dell Latitude 5285 2-in-1, Ubuntu 25.10, kernel 6.17.0-19.
Both cameras appear in libcamera and are usable in applications.
Note: the IPU3 IMGU can only run one pipeline at a time, so front and
rear camera use is mutually exclusive.

Thierry Chatard (5):
  platform/x86: intel_lpss: add resource conflict quirk for Dell
    Latitude 5285
  platform/x86: int3472: tps68470: fix GNVS clock fields for Dell
    Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477 and vsio power supply

 drivers/mfd/intel-lpss-acpi.c                 |  32 +++
 drivers/media/i2c/ov8858.c                    |  10 +-
 drivers/media/pci/intel/ipu-bridge.c          |   2 ++
 drivers/platform/x86/intel/int3472/tps68470.c | 201 ++++++++++++++++++
 .../x86/intel/int3472/tps68470_board_data.c   | 163 ++++++++++++++
 5 files changed, 407 insertions(+), 1 deletion(-)

base-commit: 6de23f81a4be5ee86a4df4fde0ca0c7bf67aecd1
--
2.51.0
