Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499502F6593;
	Thu, 20 Nov 2025 21:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675569; cv=none; b=ksqZ+3H26/ZFqKxrcd1NeyCfZYC6kkNHyGD/t0pFYGAjVHU0J0pmqxtopvT7iX48T9Nv+atsaA/qQdHcSaRTtBDwB1rotCFiJdmPIBNiYl3xl0W0td9Cwj+aHytWhUA3ObPURsbt9mgvfEnALUIvsXbnqlfghaGLuqC+1iABJ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675569; c=relaxed/simple;
	bh=CidE/p6wBYD/8Nl5RySVNu3uBfajxrxJEIPqF7U8TiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qceJo0vQkQ62fcBdyplYVpTMYzxApkJmymjEK2wms4ja+KfnDrNlayxavacofOYXVboJNSWF/z1UxfiN9P7i5lu+DIu1H8uFgtDCfy5Mj5KtLNBGjL/gg2b4LLSKpyi+p7GTT/1M8zOrKWIhaFA7DK5RGgz6Oz5scJX8Wv08Tao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=PnY9bnjo; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="PnY9bnjo"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id AA9342FC0069;
	Thu, 20 Nov 2025 22:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763675564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8vXVPGbf+cej9cwV4RE4mNkpopvlGkG5RPAe0oH4dME=;
	b=PnY9bnjoEpDisK+WsJA8cdEnvHC6YXCkSbkZ1xthUFItWolNMXwTg1wzXWg6S3i2MLhmRp
	9liY/nSsdXp2h26MSzwKZWXI3p3AGxaVmRt50VImyoNij6q5iIm8GgWJlb6qWZ5+4CIkzA
	eDWrH/iVRsLjVWUt5xHdu8J2C7Yrvz0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v3 2/2] platform/x86/uniwill: Add TUXEDO devices
Date: Thu, 20 Nov 2025 22:49:42 +0100
Message-ID: <20251120215240.436835-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120215240.436835-1-wse@tuxedocomputers.com>
References: <20251120215240.436835-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add all TUXEDO devices that can make use of this driver.

For the time being just the input part of the driver is used for these
devies. Other features will follow once implemented and/or tested.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 343 ++++++++++++++++++++
 1 file changed, 343 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index e0d356dfc74c7..bd7e63dd51810 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1497,6 +1497,20 @@ static struct platform_driver uniwill_driver = {
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
@@ -1522,6 +1536,335 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
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
+		.ident = "TUXEDO InfinityBook Max 15 Gen10 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Max 15 Gen10 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
+		},
+	},
+	{
+		.ident = "TUXEDO InfinityBook Max 16 Gen10 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
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

