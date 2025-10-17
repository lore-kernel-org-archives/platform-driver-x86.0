Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95961231842
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760726231; cv=none; b=j9j8S8udz3S2wEN5RgqRCqrDpbqoKqIPKLTlexRNdYvqIS5CHk+qlEwBWqXheXqi5zAfsxRSP8TyrwZPhwr9zoER8ZZzgG32zT4nLsblfKzW5PdeFliaVNgaWzHceQIma43pUXI5dIPJOtdoi7zlRm8bwj3j2RBkcyhc54qyJto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760726231; c=relaxed/simple;
	bh=0HYzdDZcUi93MY7xV3bFA4oYlGIU1yq5GRoqS26jaIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EOlc4pwx52+EGraoPynIRMcdysx+jxT63XgGKf7M1Z6t3eGGJDsKq5VqKMS7sZH1WlzMArHwZzB0iskYmc7xChnFM6VAKDorHRrNBee7lctpiXupbeP+WAMhU0OZfZpnIm/8NCztkx1f+ZsuWxjty5IF/90AcnUED4VWgfgqoCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixMNJIQI; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixMNJIQI"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-639e1e8c8c8so4206895a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 11:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760726227; x=1761331027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rE57XXMWa+VwNPDtVGrV/wXcErqp5ekEXu+eNAT0BQ=;
        b=ixMNJIQIe9id/ScC49z/ts4yLewQrUrkCGKk5tTUNpWBDZ5NzikPtRlW3hf7bhv/vn
         8wYyMQeH+ExqWSUjoRSbUu1NNnEy37lWysRigTXaLFSeBPb9fSGd4Ev+1beVjwsrYlo6
         qy+K2j3YwwecI1gOzjnABn+68ylRp7zP1Orr4legJsmtRRyuRY6vJXLhbrd/QFRs8f8e
         m1fdXkgP0Oq+XytJLwnvaGXluuENzhyPuMye33mcD1LKw/mVirMHlrXLHp966nsMjujb
         TCBZrQU2VkJtX9sovsJeN5VYirjwWt68ZGDKTzduZnC7vFZjCF+jSn4eKK6uMpi8WisX
         GUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760726227; x=1761331027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rE57XXMWa+VwNPDtVGrV/wXcErqp5ekEXu+eNAT0BQ=;
        b=TTHes46lQJQ9pgniZqXkUhAkXx1r0sQZIcvT6joy84jO6Bzl1RxZbWISrKwfsVhwhw
         /ecG/OV98mm7skpnbWwvHI2kCTs9gacwOn2MZQDwrK4AtKEwd/VRDWsdzCS6UB1t35c9
         CFKQ4FZbqN6pt9Pl9ZxFDIA8TcxEJLuvdymkmcjSXt4KhKyGHXuwlHAf6LCPitsYzzJc
         SF0BmSEQ0lIz1eq+dEGNb1m/6fRmREMDiPQIi0s9Vg2AicefS0aGf1AZhaVGokehwUVH
         LGxbV86HY1NB611+mLFBSxkV2fL8ExeJtmWVOq8Y7qybksUNtAqnU0seXZEhxPKC1DwQ
         pLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj+Lb6QXSnuovv/gaJ6WRt7oZVVU4sQegl7T6z69y8gEpjUElMNo1C9FSzG4U4ONKwYwCIvIt9/pZL5CnDeuZU2l1J@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXF6kdo67I7zdMluhcou6+ZjHbC1BLLFqUoKG/EXbbQcLLugU
	Y6ZyfZRLZ+p0X4/VayISlE2EoKvfp9KwnCZBPl1uoRLDG7t8W+ElCIvF
X-Gm-Gg: ASbGnct1vQYPKDR20O66O14tFFdEPbNqJO5Q1CKC4RG5NbsQxtrQlKQYL2u+8shUhWp
	2xNm0CFrccjE2eJl/65384fqsBNduVqF9eotW+dehyw1fBBt8acmboxjr0dcA4s3lrmEUQV5Sr+
	UDu4oSgk2bKduhqBYXqOnZeBEC9T5KB9xPY32ZiJanCVN/59sdXDL4GYXxe+jhXN0+5yhhKahYw
	pRsnZSunn0tMBMQvf9kMIzL8ZNl2CsJq5UT5CfC/0c8aXeugWzAWStL3iZ5kEqKujWluhMpS6Kn
	TJ5HzZDMpq+2q8sEJ5u1qprQ7/1jnj6a4RWhkNmPVpLULqNjh2RBjaD7xI3cWu5u7ieuG6tmNzx
	Rgf6bU1+bQSDuabIkH1P4D3984pXsUBnBolNg9jwVXyWOzVDalG/RmtJLKyovcND5SXV4wQ47iU
	7zSKUl5krR+VSoFD+cM28a3ufeehZI1fAE/VFBI9Eimdg+itgrBLtP
X-Google-Smtp-Source: AGHT+IEqDf1CFx+tImN/qmpjBMn9gDXH5AAbouHdZCqZsw8BSWD0GaBU+JjrB00u6MgijpPDdz3IKQ==
X-Received: by 2002:a05:6402:4316:b0:63b:fbb7:88bc with SMTP id 4fb4d7f45d1cf-63c1f628bcamr3968505a12.5.1760726226709;
        Fri, 17 Oct 2025 11:37:06 -0700 (PDT)
Received: from localhost.localdomain (93-87-220-163.dynamic.isp.telekom.rs. [93.87.220.163])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c494999dasm321247a12.37.2025.10.17.11.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:37:05 -0700 (PDT)
From: Lazar Aleksic <kripticni.dev@gmail.com>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kripticni <kripticni.dev@gmail.com>
Subject: [PATCH] platform: x86: Kconfig: fix minor typo in help for WIRELESS_HOTKEY
Date: Fri, 17 Oct 2025 20:35:21 +0200
Message-ID: <20251017183521.16268-1-kripticni.dev@gmail.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: kripticni <kripticni.dev@gmail.com>

Fixed a misspelling of Xiaomi

Signed-off-by: kripticni <kripticni.dev@gmail.com>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 46e62feeda3c..c122016d82f1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -432,7 +432,7 @@ config WIRELESS_HOTKEY
 	depends on INPUT
 	help
 	 This driver provides supports for the wireless buttons found on some AMD,
-	 HP, & Xioami laptops.
+	 HP, & Xiaomi laptops.
 	 On such systems the driver should load automatically (via ACPI alias).
 
 	 To compile this driver as a module, choose M here: the module will
-- 
2.49.1

