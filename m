Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DB730AABE;
	Tue, 18 Nov 2025 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478533; cv=none; b=YsKuvGWis/iapDGcnBnaJyaXgSpeR15DTCFjJpvQSVZU2YNi3Bcixh6ngeGmKDMJBsNIGATlDd2Ta3Jz0V+whSvAHStiARxSLRiRrO7QUWzqUV3CbRV+y95lgkf/WpIApJWb6qGUR35EJIOAr10pRTrQx40mrw7ilrSIF2jV2pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478533; c=relaxed/simple;
	bh=c/VrYgyPD9j3J2iuB0aEC+Ly6MVYOjq9CrD0ZHl69VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6PciSHeNuOO6hHiPQzB2BSvZk7aNzIIkcmbPh/zht6sy3MJ1wQmIzkALTvTuqZra0pkYS04pdse4EIQ+1jOgMGJRt9zS0YUAB4qRaHN5cMVg7BZa7msGN2VtW0RT3ndYGyKZJboZPx+wT1NmHgnfRkkflmaMjHs4WPv0nhpCws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=aNHIUp2W; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="aNHIUp2W"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 92AF02FC005D;
	Tue, 18 Nov 2025 16:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763478526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L0zPPp2EH0JqFqyfzL9XbfSA4TGrKCcc1pNZhms7NzY=;
	b=aNHIUp2WbQIq0qvWnH/tPcOLftZii/D6FhKoSxai6CJXYaBdDcODEGzJhsq7GGkX5sx7ur
	qbmyKGRy66A1LvNAv8i2eLGJ87RHYwPRE/zCoE0CurJMISCaIWJSbDvgr/urq6x0suvz1i
	rktlge875v61ct568hJtxGwAcDeTdp4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v2 2/2] platform/x86/uniwill: Add TUXEDO devices
Date: Tue, 18 Nov 2025 16:02:29 +0100
Message-ID: <20251118150839.55336-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118150839.55336-1-wse@tuxedocomputers.com>
References: <20251118150839.55336-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all TUXEDO devices that can make use of this driver.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 308 ++++++++++++++++++++
 1 file changed, 308 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 4efb5a909f717..0cb86a701b2e1 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1495,6 +1495,20 @@ static struct platform_driver uniwill_driver = {
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
@@ -1520,6 +1534,300 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
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

