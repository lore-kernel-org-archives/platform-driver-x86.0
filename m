Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E00191F95
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876362; cv=none; b=XCRNer1ubm9xqyUAgjLI6c87UMPTbKs2E08b3r5yrQtG9/zBvmlPeT/8rUe2oXYe9irmJUqMeqDRD1BuMbEYCcM+A0SVXPaNI1JqGHPEUDcpGnMwB0ZR5e0g7rM8WJugzZbmMPtSb8yAnJELi05iZ5YnsUhrZ4jsn8Mfo1u3qug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876362; c=relaxed/simple;
	bh=jgYEQR/CMvM1QLqc8LJB3Y0zD6umdnkq3sJIRc1ppUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+xqGkXndQn7WJXueLfuHp0vtP+Da2426zyRk3yX8t2Ih57gqhn/R8IhGOo8zFSDJmmMKy1u3Xwq/A9xmhYcGogQD4fGmVXGokHMGJtC727Rbq27dgawD+3klFAIyq6Jw6z0Z0xF1RKavCkNpBuedLgbmW5QSwx+DvGyLjdI6a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iHCyCJGM; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iHCyCJGM"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54989702b36so102718e87.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876359; x=1745481159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMSnHiDuLiHAtM0smyVAG+glICjNKIJrdV+6F8Gol3U=;
        b=iHCyCJGMoxSlWqQyj/QkStH04LYOU/c6bq9C2tMz1Y3ZqZgEUEDeIKhuDrwSMWzohV
         eoTCn2wdZ58iwievZdKXP0w5BSfoUnj7aFRPa0bhQIeZy8JJuqpff7dDILfUH+zOs0tz
         7pJ4l8MDw5nSveez+uP0/Ipcy+w2ITWZpiqzH8Ov2/WPUr2Br2jXb+P7xFX1GAPBFTCa
         M/21B4OpDdiLaJQCxuq0kaLFR+gboc/MAnEt9q3Et8qXLf+gpV9Ka8wEOA5GLx/9NXOz
         83jLerp0OnGgiXsxuFs7rVPHIkIcuvx71MFt+qcWfN0IXRquD0swEXC6Cgmlzi8EsWXE
         F/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876359; x=1745481159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMSnHiDuLiHAtM0smyVAG+glICjNKIJrdV+6F8Gol3U=;
        b=hyHv6NSMdopH8vFZFl4sewm2FDmiehlV3sWHW45dI3vOz9edvDBSjD+k8rMr3rCJr9
         A2GSgvHSkz9vSRNBcuqTHhYmKyT3jj//W5Fm3kedjrmewybXWk2Z/Ko573OGVPMea3d0
         NZL8wTlYt+G5emKvqUmNb8xkF7H9OoRvm9nWmbml0IlgG8FdXGLENIgUcOsIf0clLERu
         iUINcSaHQ2L+SzcB7sdb/Pz3aw6ltu+KWdT7t7Ib787nUSeC6k7U5ykUBVo2BsuVVrcc
         PQ/iuKBfrjFHruPWigJjhg0C/lB19aOPPQSZd+GpKY81L6Ij+jmLmpqbMIAVLiCtAX5h
         awvg==
X-Forwarded-Encrypted: i=1; AJvYcCUfhY6DAntdGHKv9mzh7XmCLzQeFctydqDi8O4UcQG9R0LHTqEeHD53IBmZ7+iVrdxCEPwjnKnZNjcxlU+yUB2PUzgm@vger.kernel.org
X-Gm-Message-State: AOJu0YwJRrHx0bFTdTePLPVo4cfoaVYJBu1A4tDO3+YwmMgPM/0N+6Z5
	2aTNCoe+ecq5ZEGv4vCLSYdajY7OjTA6W2jxrMK8M0pGCJeJd/7By03OrPZq9G9boGSizGvae1O
	M
X-Gm-Gg: ASbGncsET9Vk9Fv+afQ9sKAjA7r47jMkE9DXcngZXRZBv0W4qJOmXO7FwSxJhi40V1O
	qLMsWrY7X1KnfDb7nJdfI0a6AVm+Xcp3wDxJ13Q9He/JNnHUGJM/SZvsDdW2AXEh1UIjWrIgHy9
	lOetI9OW+BAz1JQq7FapEFgvkSWv9SY+/dR9CB/iJjj0Dq5qBDha7M/4rQz6sfLhvRlrT/9iBiG
	ygtF3ToUhAMGQJG1sko2erniwue/HpvcICCRPwDbUs8wm9k42t3ziUwPRs1FIhgZgz2+h93zTQM
	qnO34kqSVxeAGMqomXYZwixCArbTLoDeeC0VKfLx2F/R4llLEUMkoz0YnOWx0l+7iNVYYBOfjOv
	t0y0tNw==
X-Google-Smtp-Source: AGHT+IHB4jQhQTTFHjUKBspn82NOI75eRRcHHbv5F89JQH4b2AzbEMH2AEUaXUx/aXMiln+9GOMQbw==
X-Received: by 2002:a05:6000:1ac5:b0:391:319c:193f with SMTP id ffacd0b85a97d-39ee900296dmr630621f8f.13.1744876010118;
        Thu, 17 Apr 2025 00:46:50 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm19265954f8f.76.2025.04.17.00.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] platform: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:47 +0200
Message-ID: <20250417074648.81528-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/platform/arm64/Kconfig    | 2 +-
 drivers/platform/surface/Kconfig  | 2 +-
 drivers/platform/x86/dell/Kconfig | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 0abe5377891b..06288aebc559 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -6,7 +6,7 @@
 menuconfig ARM64_PLATFORM_DEVICES
 	bool "ARM64 Platform-Specific Device Drivers"
 	depends on ARM64 || COMPILE_TEST
-	default y
+	default ARM64
 	help
 	  Say Y here to get to see options for platform-specific device drivers
 	  for arm64 based devices, primarily EC-like device drivers.
diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
index b629e82af97c..f775c6ca1ec1 100644
--- a/drivers/platform/surface/Kconfig
+++ b/drivers/platform/surface/Kconfig
@@ -6,7 +6,7 @@
 menuconfig SURFACE_PLATFORMS
 	bool "Microsoft Surface Platform-Specific Device Drivers"
 	depends on ARM64 || X86 || COMPILE_TEST
-	default y
+	default y if ARM64 || X86
 	help
 	  Say Y here to get to see options for platform-specific device drivers
 	  for Microsoft Surface devices. This option alone does not add any
diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index f8a0dffcaab7..641276753bfa 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -171,7 +171,7 @@ config DELL_SMBIOS_SMM
 
 config DELL_SMO8800
 	tristate "Dell Latitude freefall driver (ACPI SMO88XX)"
-	default m
+	default m if ACPI
 	depends on I2C
 	depends on ACPI || COMPILE_TEST
 	help
-- 
2.45.2

