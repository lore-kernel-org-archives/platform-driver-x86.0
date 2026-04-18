Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011008.outbound.protection.outlook.com [40.93.194.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70CB23183B;
	Sat, 18 Apr 2026 05:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776491465; cv=fail; b=j++Gg67ObCBq9eCG6AiTeRaC4nRe7C/AQ4Yix7XOeYCxtwexKTZ5n4DAjuhMUxR9v0zy87Qmh4OsAtpZtUhSxDedyOKSjlpatohehsph5vT67+A1P7sjOOKS/dl3CVU3vJrP49oifuFE0M9VqfwGex5a8DB3njDMri9M0eWgmAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776491465; c=relaxed/simple;
	bh=ONO3kHytT4urPFptqYQUOHr49DV7CxMb/bXIBh1+QI0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lQDec/xPXdLx6GWP0wnsQU/Xh8VsNbTN638eBnhvF1jRvL5EbF1RgL3sDm3wkLcmH+Ep0FseCXFSnyY2Glt/uUDcq48F8XEdPP3jXq8ZSxQJQneQ0129Hu9/J84maY7uICiNMFtlZvWH+/qDzW0KLoKngvWKiVjAvytfDj5ptok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cQ2bx3Iy; arc=fail smtp.client-ip=40.93.194.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cQ2bx3Iy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMc9sFHSsVsKnd/X6S1JnmFZgJYJ3HKBTRsR5NWrDQ7V6HDPSBVfQJE/WlAopx2OhInO3YTtKX423/d1O5+rQDTuyAZikoOXlLhGEiMJKwgyOGduFcWBkWrSwR6v3Dv/mzMIgxI1foF0Ob+iBBPJrNbQZdUBgPH6MzaaY9tguZETApOSf2KaafxlFAfDlbxXVuXs+BFZ+2X3D+2AOiKiIDpr5XlvBlOtyze0ATFOWnRCXC2+t621PInC+z3aEJugw5iyEurm1+8jQZuJvjSFzu9gnR3vq0OAeEohIbnrBO8bOd7y4DaTDtWGli2KLJ1BjrhH4T0dH2RI1DFHCbpydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ConWqiU7INilTtVKBq+6UvsE8KX4dwccFZ/3xGJ59w=;
 b=yptGIHr/GtAlTN4Ug86Pqot96YXlJWg4V5jgknrXlBzftSGpnuHbzgHZGpSqpDOfw58xrSv/iM6pTkIs7L087GjRhJRJApgvqahvOaSaUUnByluPNJ/M4dLTE9Lo4y8EqY44Dmk0vn0cqGWGpnKFXYlPkpQOcp1S0T1tz9rmhU3xrofMHAbZ3CCiBoA0f5k1QmnMNiTIkyu8VPVdsvIu2xrX8ZLvz38HGPC1dnPK/cXGLY7F2LEdSuj/fERJ8QEuckkYZsOMeTJ06E7n4nOvGqCUq80ODusdkh6PsrzwE2v/WoFIBwY5pjLXVlzVV3iFFvX7yFASm+TrMA1+Xjvjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=canonical.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ConWqiU7INilTtVKBq+6UvsE8KX4dwccFZ/3xGJ59w=;
 b=cQ2bx3Iy9jwRZPeZJ+1+Zrmhd8WFKAhUDFQGhNyu7Ge55Xt9UPXlEJEJSdXhCHM5On+uuH2Pw+5kvt8VMdJWmUo+3HKv561WiRnNPh415IJ1Kq+53NdLlFakDT8g2e5wvn6Q2K92zDFHUEqEfRbqDSTymlLGd6/Nt4pluLA341Y=
Received: from SN7PR04CA0166.namprd04.prod.outlook.com (2603:10b6:806:125::21)
 by CH2PR10MB4263.namprd10.prod.outlook.com (2603:10b6:610:a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Sat, 18 Apr
 2026 05:51:01 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::3c) by SN7PR04CA0166.outlook.office365.com
 (2603:10b6:806:125::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.55 via Frontend Transport; Sat,
 18 Apr 2026 05:51:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Sat, 18 Apr 2026 05:51:01 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 18 Apr
 2026 00:51:00 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 18 Apr
 2026 00:51:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 18 Apr 2026 00:51:00 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63I5otm32986092;
	Sat, 18 Apr 2026 00:50:56 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <shenghao-ding@ti.com>,
	<13916275206@139.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>, <letitia.tsai@hp.com>, <bill.yu@canonical.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Fix sound abnormal issue on some SPI device
Date: Sat, 18 Apr 2026 13:50:30 +0800
Message-ID: <20260418055030.765-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|CH2PR10MB4263:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9ec664-8080-4164-5599-08de9d0e78a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mXp86ftejhAmnfmcL9IW+bw9nvWbMDQ2kdzBWo3C6E5qR1UtCvkwKyjMruKoqMNKGhVTrCY4N1SSZkC+H8wm2BFcRaGpryuBzowghRSsUiYEVC89webr+FUxlBStHFJfGG1D2yXTOuzy1yGbI9bLQIx0W7M0MFvnETyJqXJrUv2TqX/aewStmQ3nFFTIZsknyMLhwIFOARGbb1Q1FldfeemfjPOkmBJoFcyXjwTOsExPK9PWAdHsAckwE1DizAySrDzwjADgNJFNS36z+gs3o7NG9m8dLwL48xI/aOGUZbA0YonrHWgWuMm0Yi0CSet2cXKkCiFnELNNVF0q0if0v+aBH8exVURK6MQ2jbV86bX8T04iMP9J+89ijxf+T2ti+e7aDur90zIuKCqtNgPIGOCqenphWcXdEOTwmpDpaorm17qGjupS7g0Ydm5nRdFoaMvU6qNuUy2mvvh2cKHnhVO5YlwF7PHO5aKc/EblLT/vNOt4BhujMrAqT5r/i7jK6mOaXueA+wfFggbwQkR5aj9yTF9H2DtNxHEUYqhmW3erqG4RLBQDpyZlg4c6dkSO8VEGiEQK8owjWaqAkyGJDiIgdvsB0WkknNJZRBk1VlZg0HUJEBAqEG6zaAEZCtzdfpgFVwWBH6iF8guhkobf8x/CmLs7EptO3/xZzFxbGVzmPa6kPnT7+rxaDy7MrTxyALvlTau+D9KP3U+5uyTmdmDQfiXVT/4KeZqL3EahiXnoQBUVwUGJETztEBYXbkmj2Fs2fDIVD5AKyY+S/yu6JQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QPJjWGWJuv2ClTX6pTk4+esBFKvvKQPWX+zhscbs4yWDfLSlk9pSe2byt4hNNHF992cnGb89Nk0k8fIKv6T1lizsBNSdxFSaKebv17idNDQxJRgB/8L8/0tBRjjQlp4uRfd+8rwh4HaQZYznza2q1dwjAo8IkJsVU3qGo1F0Yuj16VR4SkC4LLvWTkwCMi1VlxJKNNHr5eakkgLICabcnkIjkE0p3FV5r/wzERE9YV0GECgCx9DCTnCva6uTr3gspazm25V5cJdsv4q7BgUbE2vRDVjeCsKkhwmGAs2NBy779T+QNOKkAWKXzmLpAAqUS6aI76mEeDZVYgBXCXDBD8UvZzTbT7TJL/UlWomgrF73hAhUo4NUO4nqkVdMKyvbeckymqmMGUTPZVTOHZ53CJdxj0TX2j+oM2hIJxgnFFXk4bk4kd+P8rB1mTvImb2k
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2026 05:51:01.1356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9ec664-8080-4164-5599-08de9d0e78a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4263

In the SPI driver probe, the chip ID must be set to TAS2781. Without this
initialization, calibration data fails to load correctly, causing audio
abnormalities on some devices.
And update the register bulk read API to handle the distinct requirements
of SPI and I2C devices.

Fixes: 05ac3846ffe5 ("ALSA: hda/tas2781: A workaround solution to lower-vol issue among lower calibrated-impedance micro-speaker on TAS2781")
Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 1 +
 sound/soc/codecs/tas2781-fmwlib.c              | 7 +++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index f860e0eb7602..560f2385212d 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -788,6 +788,7 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 	}
 	if (strstr(dev_name(&spi->dev), "TXNW2781")) {
 		device_name = "TXNW2781";
+		tas_hda->priv->chip_id = TAS2781;
 	} else {
 		dev_err(tas_priv->dev, "Unmatched spi dev %s\n",
 			dev_name(&spi->dev));
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index a1d86bd309f4..885e0b6fed00 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2487,7 +2487,7 @@ static int tas2781_cali_preproc(struct tasdevice_priv *priv, int i)
 		if (spec == NULL)
 			return -ENOMEM;
 		priv->tasdevice[i].cali_specific = spec;
-		rc = tasdevice_dev_bulk_read(priv, i, p->r0_reg, r0_deflt, 4);
+		rc = priv->dev_bulk_read(priv, i, p->r0_reg, r0_deflt, 4);
 		if (rc < 0) {
 			dev_err(priv->dev, "invalid RE from %d = %d\n", i, rc);
 			return rc;
@@ -2511,9 +2511,8 @@ static int tas2781_cali_preproc(struct tasdevice_priv *priv, int i)
 				TASDEVICE_REG(0, 0x1b, 0x34) :
 				TASDEVICE_REG(0, 0x18, 0x1c);
 
-			rc = tasdevice_dev_bulk_read(priv, i,
-						      spec->sin_gni_reg,
-						      spec->sin_gni, 4);
+			rc = priv->dev_bulk_read(priv, i, spec->sin_gni_reg,
+						 spec->sin_gni, 4);
 			if (rc < 0) {
 				dev_err(priv->dev, "wrong sinegaini %d = %d\n",
 					i, rc);
-- 
2.25.1

