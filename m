Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B66A3815E3
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926977; cv=none; b=RvwqqcZ9tIy7bndpLx3GXtscWkjcSKPxNmRHHkV7DnnrsiNW9ph6wNlwfe9O5ur6y0S+QcSieNQ1DmXHr4pU9O2knDJdtR3q3QM5azQ4A7jNkhgkaoNXXlYoRLs/fP02Qb5WBSRy+Q1ySQIEOjRmlNIMhDqqM165hhuSpTHFGh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926977; c=relaxed/simple;
	bh=nBH75tqJdlH5fJaQm1Ul+W/17BYxocOQI7tjCZ0eKag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=esZ7+t6fFllhagxuUBQS0oRUymK2z2T/p8jdMk9UTb3UjwrTtWHS5zYumuBeXHCr+fE56aMnlcuda9ho3nBvGEcX9Cl/wniuukfpQoE9oU/4dHHCje15v+aGqEZ4LGuXGsIf1FRXvH80srcIpIqaM/8Oez/a39H97OZtXAo3yrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrIUPdg6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrIUPdg6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486b9675d36so5627605e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773926974; x=1774531774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JnzJWTdi1JRgK6Aqor8y63ze3q1ftzolVwcsUTBbIR4=;
        b=KrIUPdg6ExKewLeEmM6IrfqUJe6F2RUdd3Xjnc+4mpSW5rQ8drjQIwz1r2GqvG/xi7
         M7UQq+miaDL1lO2Goli5JciJq+KiXtLosUOTaC4sTrZQab0oTX6MCB126Yw18qffjqRv
         i1432MZr8pGjVaiyyci7l3qVD1HDGihrZHNVSlaNJAzQSod0j3WiiOZEOESIXRmE0pB7
         UH8InmdMgGxiHGun+d7BCd8aSWKqKcgbrh9ITKiIWji0EkFeeKtXTCw+48Hg6t6olM9i
         KNv/6kHJfuVasNV9O2WTHzHP68LWueIPcyfH1u/ng9N9MYi7wWgc/YQLDg9T7JgdUA+G
         JFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773926974; x=1774531774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnzJWTdi1JRgK6Aqor8y63ze3q1ftzolVwcsUTBbIR4=;
        b=Y+QyFdPYTXweZ9HwVqPqlo1pYv13cJBGc8MLYbtzbVLDWh8p4xNeyC8ihubRZyQOtN
         pvAyAUV/RL+cVRbJBLKqtbTtNXeR+1xFKcmyOy1CBlVYh7T5Jm0fXlNxadQAxCtHdZ3Y
         fpnMEkfthG5qhCHlnofzO4jGty6yHuUHZiFlSluHolDxNjzbkjyNXm3SJs4JeTJ/csJA
         nGyQS70bUS0Q5IkGPT0NuTNSOuoe61glgrOHpRNMwaqK/GLoRxAT6PVUVkra1zFT6Tr6
         icJucRody4/E8IIMkQ0DNozA84PJV60w9Nw2B8JxyONFRTPYwy1EQKe1OEtKnG215tX5
         lRIA==
X-Gm-Message-State: AOJu0YxKErJgUv1juiXXMhIq/Z/NuTXc9sqBnqLi/T9oH1zDsrnRBI9V
	rTBIIGLBfEz0D5JUx6qHgqg6dIYhkKCNnMMHqmbJljSS554XhtXtOyFm
X-Gm-Gg: ATEYQzyAGMiTS1TQuRfO+KoeRHhM96AnVhkSvK716c5G2EAXkHwzlpkxxCDoLJmJUjc
	2XmOlLmreFCC76AzxCzaoWdOmU0lGpIHF4PfAVcq7lWxZugsTvzjc5NsK64JtzqRzi9OgHPPtAU
	2LCW+hzKtKnqdtlex3ue9Sm7Hq7IRlf0Yy+G3pODGWAGqvaCMUAjMZ+YzSp4MUI8qFn7PckJGCo
	jv/9NK+Ym8i0bWZiC6GgtcvIORwSlwWYgdN3TwhDgzGcofo2e80mfQN0Fak9mgn08oP3A+kMBbS
	anY/S/W4edxGrAaQIcYuCyJd/AHAVHTra0S08GcnjBlO0BTc8JA2KbjP/fQ/IZCB54FWGbO17vi
	3X3PJcid3GrGys9aVIcNsmGWNV9plUJoDjjwHemM6//VMzFapk9ahmvrfG8D06Tc+bZHFruFLdQ
	wYrfJtykQyt0v2jsEqoFmuuG4fU7FZHQeHpmAWv3zTaNvzipMeFw==
X-Received: by 2002:a05:600c:1f11:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-486f442fa32mr121203915e9.15.1773926974217;
        Thu, 19 Mar 2026 06:29:34 -0700 (PDT)
Received: from sergio-82n7.fritz.box ([2a01:b600:83d8:1:eddb:b262:41cc:374a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b74abdsm70405415e9.5.2026.03.19.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 06:29:33 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: linux-hwmon@vger.kernel.org,
	groeck@gmail.com,
	sergiomelas@gmail.com
Cc: platform-driver-x86@vger.kernel.org,
	jdelvare@suse.com
Subject: [PATCH 0/1] 
Date: Thu, 19 Mar 2026 14:29:19 +0100
Message-ID: <20260319132920.275755-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a new driver for Lenovo Yoga, Legion, and IdeaPad
laptops that report fan speeds via ACPI.

The driver addresses the "jumpy" and low-resolution RPM data common in
Lenovo Embedded Controllers by implementing a passive First-Order Lag
filter with slew-rate limiting (RLLag).

Technical Validation:
- Verified via physical tachometer and FOPTD (First-Order Plus Time Delay)
  identification to ensure the filter constant (TAU_MS) matches hardware inertia.
- Stress-tested through multiple S3 (Suspend) and S4 (Hibernate) cycles.
- Verified 0.0% memory drift over 4+ hours of active monitoring.
- Compatible with KDE Plasma 6 System Monitor and standard hwmon tools.

The implementation is "passive," calculating filter state transitions 
only upon userspace read requests. This ensures physical model consistency 
without the power overhead of background kernel threads.

Changes since v1:
- Updated MODULE_LICENSE to "GPL".
- Removed background worker/kthread; implemented a passive update strategy.
- Added Documentation/hwmon/yoga_fan.rst.
- Added universal ACPI path probing for up to 8 fans (FANS, FA2S, FAN0).

Sergio Melas (1):
  hwmon: (yogafan) Add universal Lenovo Yoga/Legion fan driver

 Documentation/hwmon/yoga_fan.rst    |  36 +++++
 auto_compile_rust_lenovo_drivers.sh | 196 -----------------------
 drivers/hwmon/Kconfig               |  14 ++
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/yoga_fan.c            | 237 ++++++++++++++++++++++++++++
 5 files changed, 288 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/hwmon/yoga_fan.rst
 delete mode 100755 auto_compile_rust_lenovo_drivers.sh
 create mode 100644 drivers/hwmon/yoga_fan.c

-- 
2.53.0

