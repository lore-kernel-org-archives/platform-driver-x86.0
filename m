Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013048.outbound.protection.outlook.com [40.93.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211FB33FE06;
	Wed, 11 Feb 2026 03:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770779416; cv=fail; b=snE0lblbu/r0G6BpJ1zRwww+Q+avz2hE58spa3gG7YMc1QzmxJ9B/zNh1XIc2Iz0/EvbTRXzaCuUOPQP8cGwVKrXHZUttIzXm6gD6+8gRKdwtFqlM/O/diIDko0AvGt63Z445bTdr/SxaN2qiQkiVKYHt42OMLWLfBUNGISH5Uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770779416; c=relaxed/simple;
	bh=F4cT2cDpQYmIp9uDSPogd72ieMzLzj8uVxdLYXyEwQU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bki4FJhDVqHk0MgQMqKu4rs0/rPyeI63/ElqN1qIIkHtOUvGwnZBFZ6X6om20bqrX3ZlkyBT6Znh4dgDn6wsJ6gnbFobZhiyeMqy+9xZnLDT8YOtbBV1/DuhUUATxG4AOuxe8BZPgCZDPYnN3g+G+WDJ6r9GcClO9MCGKenNvCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wgXNEERw; arc=fail smtp.client-ip=40.93.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wgXNEERw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVcCqWggLvvXGL73a8pFFJmPXYKEs26Eesje0tdoted+fm2cnX/Cv12ss96MM312n/8faY4umKNNAY2v7Slx2wWsMaYmOPriHV6GdFJXoEG0OcsTFQPRbfK5lTW6n0NWOfA+qFlkqsvCuZZWuDrQzOMG4nmFGus+dmpypDW7yb820K3uApyuRzvb5yLVJUsdfq0kNf+JjR8Sh8y/Jtu/gdWTPp3KYqFr2/WiP5TgbFQaYdkq4qFUI3nPAnb5MeujSToc61kneEC5U31wrs5e2j2q3kycSWqJCADmeyPHbFL5P0b3vJuDFCcsa2DFWsGRthZz8kfRsz8M+V+M2x2thQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpUP8L2xhj6l0nmm8XQ0GyP25fssvq1KZAgBcsqhTsU=;
 b=G5BnXEI1DXhhXt6Kf7JZtA0E7mXO4tMXcF8g2wjGDlyo/XGO8EXzkUbOgASP5XPz8a0eh/bAMB56tkjvblQZZuoqrFu2o18ch8La3zeW8n1Ay/5Fj1qGn5EzZGZoWIYwXb6Uw67xGSVISLkkftOEzdzxRwFVZF2QEiRN2iOSrMKHpTwI4WcSrrhqpLPVk/PiWqcWP5dhJ2YUVvSOQcW+PIi8G9rj6ggT6cQxJzSeXO0KI3faM3G9jDqw/LcW3yz40IKR7xTNDeynQWI6pdPl817jtUJhEJQae8H5Tm5wMJ/YKpLyySTT6kVVA/NOZvDkksO3XRedkIUrD3KZSEgv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=canonical.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpUP8L2xhj6l0nmm8XQ0GyP25fssvq1KZAgBcsqhTsU=;
 b=wgXNEERwh6NfQ0ptuWcwikD5ZbUm5VZYyxQi1UAzZ6eBjt/CBtBmbw0a8Egux4+pfgFDdpydrR3PplLpqa49hlfnusSEeQcw8AHthrqLqxtoEM6rlskn5RqDvg8YK2+6BUAYCFQ4yGhFCNxlpCFHJeboF1m4IskfiLHqJxcwqZI=
Received: from SJ0PR05CA0055.namprd05.prod.outlook.com (2603:10b6:a03:33f::30)
 by IA3PR10MB8758.namprd10.prod.outlook.com (2603:10b6:208:579::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 03:10:12 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::23) by SJ0PR05CA0055.outlook.office365.com
 (2603:10b6:a03:33f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.6 via Frontend Transport; Wed,
 11 Feb 2026 03:10:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 03:10:11 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 21:10:10 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 21:10:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 21:10:10 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61B3A5vi893642;
	Tue, 10 Feb 2026 21:10:05 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <shenghao-ding@ti.com>,
	<13916275206@139.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>, <letitia.tsai@hp.com>, <bill.yu@canonical.com>
Subject: [PATCH v2] ALSA: hda/tas2781: Ignore reset check for SPI device
Date: Wed, 11 Feb 2026 11:09:46 +0800
Message-ID: <20260211030946.2330-1-baojun.xu@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|IA3PR10MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: b643cc60-cd52-4bbe-d5d6-08de691b1191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+pZRVdRnyCy3drUNTJRQWQSvima9vK4o/QIW22qRl8DvmH1YTuIHlUHsSXEI?=
 =?us-ascii?Q?lf+GBIsQJV9HPrpOpiIT9Ux1vWn0CvOYNSbb0vS8pyeqIYLx6OPpicWFw9CJ?=
 =?us-ascii?Q?G0kULoPVLviHOze67WAhJW0Uvjbd3HeKkz/O+mBj6L0PGBjjqe5a3SEyH8LJ?=
 =?us-ascii?Q?FBCAe7iiSiTnCIXlq/x8ifD86awb4IB9nlzxFBK8VSZ4Z7PZ5zbSdlXCVs5u?=
 =?us-ascii?Q?SRKDijmB0RScAOJErHf8jZVky9jJa4a1z/O1KRIj0s4d0i1cHHpCBUNI4Xof?=
 =?us-ascii?Q?q4WY3dK29AWV2fuvntjloEl3QD34TFzX+GB1lDtnkvMWhG6Q4AYeAGx1tD06?=
 =?us-ascii?Q?tMObu3H3ZxhT179CIAQTii9Pf8mpoyWlmiAwru4NPxNSMvJO5THgUqPakpHS?=
 =?us-ascii?Q?CkVvvZdiZ8Dugb1fSsh6+XJuDRAwzIuX8WJurOhNuyegW/iJxvHYNsbrFcyI?=
 =?us-ascii?Q?oNLjsyaVexBWoAEKDGSYirJXp07PYsdJs0TbKMcAe40NoXFtZE55Gf1dNM/+?=
 =?us-ascii?Q?SB2DDmZ6MAqBea/XXg7jkH+zH1tRNv3iWICHNTKz86kFuWtNAhwKBWI1lFRH?=
 =?us-ascii?Q?/K6y/JzPp0uamDGzWeLFj8EDF2sndscmPHnJM7A5n/jgfgZLTbW+hp5Sa0Vi?=
 =?us-ascii?Q?LKhd/sS6YZpq4nc49meh2sWYGDkm/YkXilADKC2W9TPwWaLkGyWaRdHui/CS?=
 =?us-ascii?Q?hk8NxnReFTbjZGHKg4CT7BOg/3IM5osEIFyd1UuwJHZg2oiMm1jC8Or6wJBq?=
 =?us-ascii?Q?/Qlv0Ij1T+MDxsfl9ctj3h2XggQNjwX5LkHSb6BqVwyIA4e2WnyPpz7Gfbap?=
 =?us-ascii?Q?X3jEz3YR5xhLY0Qgi0fnBoZtzf+jwzJvHnMhNcj+s9Eeh6R3NQUSNFzkIgFT?=
 =?us-ascii?Q?vU1eVT3hzfIkeH6On2vXpLiaRECEvKV7RUAFbsrgWpFVA0E0Rhx7URk1UEiE?=
 =?us-ascii?Q?11KXK4GZ1yY3qVUr6SdfVFpxVxUTtsbIdLagWSUQlklVZb0uKr5wVXb/zGvH?=
 =?us-ascii?Q?F3T3NaQUhqGJuP4eYsUCjGVtyRsKuijkR9L3XzTfiIrIz75utsVeziIeBvGp?=
 =?us-ascii?Q?OaH0QWysBGVn+ye4xUSy7sdINpTrWHhEwbKnFpuWbc2t+qc58VoVoyj9MoBT?=
 =?us-ascii?Q?bsc7sxCae07QBtT2FcKGaWrczbbFrbSYVXg+5fUeQ7PlAVoeg9Ksy/HJC/VX?=
 =?us-ascii?Q?S2TZj/1wLqJuiVL0+nulhLsYCTIu8JSrTmO/w4zvYA4JniiqzC5FEJj6VnPC?=
 =?us-ascii?Q?Itrh7kh51Va1gDkz0S2wrPPp+CDRHz6oqSwDhRCDFL7b1Ca22vaHApVfAAmC?=
 =?us-ascii?Q?WXojCfC7p9C55NOrZ2n+GSmBXNQUVYNUj6zhqZ+YfYhXsQ0pJ11r7+jsxir9?=
 =?us-ascii?Q?pvgSYMgaBoHgDIgsIqt1hwli2mLYc/T+yD37Bfk+iTQ6J1GY5c/2zJlg3bRS?=
 =?us-ascii?Q?epZceZZYSRqsFo8ELNNRcOwfhLNvXj6kJRlkNtvMt8/RQe5B4wRjQD4kji6Y?=
 =?us-ascii?Q?0TNY369kvuPdeBV82Sr94fdYDPEC+LNGQdilCTPVfqKKp2voPFbkc2OofSHi?=
 =?us-ascii?Q?/QAhalFxQi+3s3eJveH6dJT5k5vgO2Ak/KqCq4Ku61D2ZrrKVtic2oxXXpmj?=
 =?us-ascii?Q?/FPtosHHg3I7e1CfE6JC4gNT84tp7/mN9kVcTLXY2/zwJpieIRO6pmcg7LM/?=
 =?us-ascii?Q?fn6FMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X3OylGUbms3d4iRJnoT7kqHUswRGl+3EmIWkJfakELvRgQ0U6w8sTcGvvUGa9CUH6Bapt909vRdFeyzqriKeBsrO9zRAZpzhgu6s874a+H9Ci73jdt4QpKThTiskGZXECj/uZIiN2CCl2EEThiSO68mxWtuhy8ekQioQHaLSfPp87vl6Qx1EvXp94tcnvP3ap3Asckg7iLk+b3QSj1IUVMhic+TLp/iEjuLyg+UHTRfYvE9+UUUkmdkkp1SsZH84TSgbhVTuz7T3a0nI64540K3hIW4DcmBAyeFrAoUqJUPKI/MlENbaimJA4zlYvjwRt3vybtFsuF7uuKC9TlpafABIsdoScDZ1O2CrXUnxtKsXgLGg5PFQiEt3zFRedvfX2r3MSKPR/7Rf2B3lVQhV9nG0cciO3xCnz28XY3s8KZeuaeaQ+OVJ3NqkruQ/Ri4b
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 03:10:11.1604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b643cc60-cd52-4bbe-d5d6-08de691b1191
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8758

In the SPI driver probe, the device should be in the default state, so the
device status check is not necessary. It should be forced to do the
firmware download as I2C device.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
v2:
 - No update, re-send.
---
 .../hda/codecs/side-codecs/tas2781_hda_spi.c  | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 0c9b57b6ff55..f860e0eb7602 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -631,7 +631,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	struct tasdevice_priv *tas_priv = context;
 	struct tas2781_hda *tas_hda = dev_get_drvdata(tas_priv->dev);
 	struct hda_codec *codec = tas_priv->codec;
-	int ret, val;
+	int ret;
 
 	guard(pm_runtime_active_auto)(tas_priv->dev);
 	guard(mutex)(&tas_priv->codec_lock);
@@ -670,20 +670,14 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	tas_priv->rcabin.profile_cfg_id = 0;
 
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
-	ret = tasdevice_spi_dev_read(tas_priv, tas_priv->index,
-		TAS2781_REG_CLK_CONFIG, &val);
-	if (ret < 0)
-		goto out;
 
-	if (val == TAS2781_REG_CLK_CONFIG_RESET) {
-		ret = tasdevice_prmg_load(tas_priv, 0);
-		if (ret < 0) {
-			dev_err(tas_priv->dev, "FW download failed = %d\n",
-				ret);
-			goto out;
-		}
-		tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
+	ret = tasdevice_prmg_load(tas_priv, 0);
+	if (ret < 0) {
+		dev_err(tas_priv->dev, "FW download failed = %d\n", ret);
+		goto out;
 	}
+	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
+
 	if (tas_priv->fmw->nr_programs > 0)
 		tas_priv->tasdevice[tas_priv->index].cur_prog = 0;
 	if (tas_priv->fmw->nr_configurations > 0)
-- 
2.25.1

