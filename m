Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E5F30F95C;
	Mon, 17 Nov 2025 13:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763385947; cv=none; b=F+wh2P3wRCzw1fKYSEq7NygBXX2OUsWj4RVznpaEgNpab8RyfhrRicekS1hcpU7++i6HBJQQGau57ONRcMroV9qosj2tUA31PqYLAIw+Yg+/PhHfLs2S85lRbIkikX9ElnGm7FtYJZY8ir4mFhHOkG/pUB6gV6AA1rb3MbzDgSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763385947; c=relaxed/simple;
	bh=hlH+KvaPy/VjPwiEu76WnqNwzWyPH7nBkUMXCJ3W/fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tym17xF6+xMGN/oiic/PwYq2+qUogjZopV03PitcDFk1qmOyyJJcgaI/rL8DRSVkieBKcz2Co/iPYLN0kPK9zihtleeTqmdXBa5cQm3/Y2vUI5j5gVvS0FWqGQR9MIBtHs4zclOzonRRb165EOesvoEe+4qiixQJt5+kXfL4OGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=E7W304++; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="E7W304++"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 097782FC004D;
	Mon, 17 Nov 2025 14:25:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763385938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hXn+frxogInMKvOCjn1sSvGq7CtT3So54J/i0Q8mibQ=;
	b=E7W304++5ZOGeaU5/NZqafyZnyeejZZW4RbBa1B8hPk12Ytw9KT41sD9OHaLv9Sb4BufEo
	K7zdLRRN9Ouh7Kf2OGypJR5DoOtq0eRjShPPsOI/fU2891MYOI7RwMg1o3MYXmd2GH/LlX
	HibSjZpHYCK3lTUkU0iw8mgz+RVlkuA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 1/6] platform/x86/uniwill: Add TUXEDO devices
Date: Mon, 17 Nov 2025 14:23:58 +0100
Message-ID: <20251117132530.32460-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117132530.32460-1-wse@tuxedocomputers.com>
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all TUXEDO devices that can make use of this driver.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 308 ++++++++++++++++++++
 1 file changed, 308 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 014960d16211b..29bb3709bfcc8 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1478,6 +1478,20 @@ static struct platform_driver uniwill_driver = {
 };
 
 static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
+	{
+		.ident = "XMG FUSION 15",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.ident = "XMG FUSION 15",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
 	{
 		.ident = "Intel NUC x15",
 		.matches = {
@@ -1503,6 +1517,300 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 					UNIWILL_FEATURE_BATTERY |
 					UNIWILL_FEATURE_HWMON),
 	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 14 Gen6 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 14 Gen6 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Book Pro Gen 7",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-Book 15 Gen9",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Pro 15 Gen10 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
+		},
+	},
+	{
+		.ident = "TUXEDO Polaris 15 Gen1 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
+		},
+	},
+	{
+		.ident = "TUXEDO Polaris 15 Gen1 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
+		},
+	},
+	{
+		.ident = "TUXEDO Polaris 17 Gen1 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
+		},
+	},
+	{
+		.ident = "TUXEDO Polaris 17 Gen1 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
+		},
+	},
+	{
+		.ident = "TUXEDO Polaris 15 Gen1 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
+		},
+	},
+	{
+		.ident = "TUXEDO Polaris 15 Gen1 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
+		},
+	},
+	{
+		.ident = "TUXEDO Polaris 17 Gen1 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
+		},
+	},
+	{
+		.ident = "TUXEDO Polaris 17 Gen1 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
+		},
+	},
+	{
+		.ident = "TUXEDO Trinity 15 Intel Gen1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
+		},
+	},
+	{
+		.ident = "TUXEDO Trinity 17 Intel Gen1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
+		},
+	},
+	{
+		.ident = "TUXEDO Polaris 15/17 Gen2 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
+		},
+	},
+	{
+		.ident = "TUXEDO Polaris 15/17 Gen2 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris 15 Gen4 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
+		},
+	},
+	{
+		.ident = "TUXEDO Polaris 15/17 Gen5 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris 16 Gen5 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim 15 Gen6",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris 16 Gen7 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
+		},
+	},
+	{
+		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
+		},
+	},
+	{
+		.ident = "TUXEDO Pulse 14 Gen1 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
+		},
+	},
+	{
+		.ident = "TUXEDO Pulse 15 Gen1 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
+		},
+	},
+	{
+		.ident = "TUXEDO Pulse 15 Gen2 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
+		},
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
-- 
2.43.0

