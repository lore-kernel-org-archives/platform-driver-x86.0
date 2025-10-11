Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988FD22156F
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Oct 2025 06:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760164747; cv=none; b=lfCaAwiw/PW1M7CaP/EhUzOYobj9WxyrOiPALFdM6kSO8J0RnLA/+KkxHapPAg0ZEI82KeiIadFXEN8DMdDoKa/nmNLDPQfQujubvmgXra9JEPJXQWzAD7LR0TFNMUMB8JNDiqIgAslbdzbzDCiutdX5B2aGet26sdeRFZa/0Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760164747; c=relaxed/simple;
	bh=7arbrLemIr4ew2lWcbkmCuP17rRxN8N6CQQQW1PRSjg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QzCfhpprkoIKWA1zhlOt0875bm8zVH/LBpD+HvRTvHTebzqXjGJVSVRqipvj54cEX+JByajNX5jzXoOsFCLZCl2fDxmQbYbiEhsOfGeuhKFZExOh+Jjsn7b26lctjER4UJbbPu9SfAH5TxKfrY/AXap72Ltf75bPFK6k+ka2mv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wr4tG4nA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wr4tG4nA"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2698e4795ebso27165385ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Oct 2025 23:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760164745; x=1760769545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RbdqxG92yzrMeciIeTBUuJ1kqttBeIBmVGrFI+VCiw=;
        b=Wr4tG4nA8x+LeW0waMuaUpTRBdMPeAEFGGYqq2ZzBRu9VjqKjuJNwgFcz2GgbHQDgA
         GzfdXP+JBFhcxdCo/0fhQ/HdIDb46szAl84qkOce4BVO9rKB13mxNl6BonQQjD3h16nY
         UAuoJwIUIDrZwFcBmlk32+fi7crCHvCqzwYNERi80wC4AjfHQof2fn7Y0LQGYdaAeMok
         xq1e1uGBqofC80zty71CTggdxgdESFs7dl7XdoGFNsrp5X7oAEkZGz6k2475JFVHwjyB
         JmaUcmcI4EolgdIWYufgFesk0VLeDxkS5L5lPRpEIPgEjkusZH0ZX6+bWBUUOLVPVb/y
         wS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760164745; x=1760769545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RbdqxG92yzrMeciIeTBUuJ1kqttBeIBmVGrFI+VCiw=;
        b=Cz/72hxRdKZbVGylMxm/6FHMueZH66QV4dpsCBJFcxjrovSw9x+UlED5RpAOD/NDl/
         HMmhMdBsB9NDNIqO2K0k2zXYmBqRg/R5EQoHM71AZkocAMgseVMD2YDz7oHNoCFnPhBu
         bgsJfczPcl72CqK2UL0o7wtGTTXIra2d9MFzROGHfJS8cddfI3JfsUQUrZPFXH/D7ccK
         WqvHATXR9Sc4c7/glpf/Cy20xZczNYpI5LSlfWtJPVzO2mb+zM2yjtkj9YiaXjAcBZIx
         +522+kan/gqAETAsG9XR5Fv+HCq+h4SgWhj1RiOSqshOqtdMjZRXNG8lD/idAe2GSkNk
         JIrg==
X-Forwarded-Encrypted: i=1; AJvYcCVCOhRqPMYbQX8jHsBoN/a1EvcMWvAKJMMiI3quXbEMOsB4pktj5S11Dzsgl92R/RezgA8sSSIk5HFQiADZdsibB8eZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxMr2z4Z0WByCfMtU+6h+VZXizaTm1n10EGucDR9X/UFM+GMqJA
	UzCpDXXs2EuXoK+4pkR9P2AOBDLd6k4w//lZjboIkS8EnAt0z5iSBgNd
X-Gm-Gg: ASbGncurb+s3n6oc6ZwD7S7ePTeypF3oaoFvGfE1IXswArwUTNK0EcjuEwyQriLTEn4
	O8otGEg9nwUIp4ghHs8uVGWeKcC7dSFkxGj4iCvdZ6u/g6vbl/9MsxaSpR76bAS3LEEne5slK3u
	uI8jknQ91c447qcfmKB7htOdHUYAy797PmDaYgSqx+A02/vOZbrm9qPISPob7eHGtEbmTo8NjBW
	9Vhz9U4lmQm8nmy9/qTZWCGnqmaWgRBuFMXxOo6wQmcZJKykAW6M3dhegkAlrqrSAcVDr8rCROR
	SMx+Niit2bA8jG3e+Ii9Q2hBie0jUEbhZOgEOaGqSSnDyDVGuX+BMX+2NaF3AsHJOQ12M7OBLTI
	eFrEonvoqQleyYFCsxRDZ2c/fsvvpmD99ATn5cg3po+5lxxHylhOI/f9fiTEIUM9hdhWdjp6bFZ
	S/ejy2kw==
X-Google-Smtp-Source: AGHT+IHB76D4GU47IgQDKRqpfK4084Sk1yZhLn2sQmzeSgViYiqrqYFWTIaGUTUGieei/ytOtwgbFg==
X-Received: by 2002:a17:902:e94e:b0:279:daa1:6780 with SMTP id d9443c01a7336-2902741cf99mr193290735ad.52.1760164744934;
        Fri, 10 Oct 2025 23:39:04 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f362efsm75647005ad.89.2025.10.10.23.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 23:39:04 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: mario.limonciello@amd.com
Cc: perry.yuan@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jserv@ccns.ncku.edu.tw,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 2/2] platform/x86/amd: hfi: Remove redundant assignment to .owner
Date: Sat, 11 Oct 2025 14:38:37 +0800
Message-Id: <20251011063837.2318535-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251011063837.2318535-1-visitorckw@gmail.com>
References: <20251011063837.2318535-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The coccicheck tool reports the following warning for this driver:

./hfi.c:509:3-8: No need to set .owner here. The core will do it.

The manual assignment of .owner = THIS_MODULE; in the platform_driver
struct is redundant. The platform_driver_register() function, which is
called to register the driver, is a macro that automatically sets the
driver's owner to THIS_MODULE.

The driver core handles this assignment internally, making the explicit
initialization in the struct definition unnecessary. Remove the
unnecessary line.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Build test only.

 drivers/platform/x86/amd/hfi/hfi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
index 5d5d2cf23a75..83863a5e0fbc 100644
--- a/drivers/platform/x86/amd/hfi/hfi.c
+++ b/drivers/platform/x86/amd/hfi/hfi.c
@@ -505,7 +505,6 @@ static int amd_hfi_probe(struct platform_device *pdev)
 static struct platform_driver amd_hfi_driver = {
 	.driver = {
 		.name = AMD_HFI_DRIVER,
-		.owner = THIS_MODULE,
 		.pm = &amd_hfi_pm_ops,
 		.acpi_match_table = ACPI_PTR(amd_hfi_platform_match),
 	},
-- 
2.34.1

