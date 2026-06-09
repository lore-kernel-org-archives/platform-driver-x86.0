Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8B23FADFA;
	Tue,  9 Jun 2026 10:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002415; cv=fail; b=Qtp+0DGTVHmFhNyioaPZrILQKjJfYZEnH0J/Y1nbpopZGpOz4gr3KTbr0cn+wE4VbAso4ZU/Tkt7z1+ZR5xxY5Glgf8RNJH9CyDqQYtiB+f01pz5U4iEjRICRi77hnJxoT3kWN15Rm17qvwIF7VVqAPvesjs1lb8o/OUJB7lFE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002415; c=relaxed/simple;
	bh=lKtu2QaOeSOlUVDyt/2by+jQrfWq3ppXeCu8t0pLXZA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TBfzV/NngJlvZUoeGQmDC2RdGgweGKWAtLcl4+LgPKZB73PvPxFZJBDD0hONtkagKVsuzXUj0zB5uMqalQzCLV8SSrlSxTIKUSmQ6Lv7freu51wZ1TfrUxMMBEiZPPtaR796xRqfG9+ANP8e1zggJe8nwmqVWk1shVUoGb8BlD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ec73LiHy; arc=fail smtp.client-ip=40.107.208.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ec73LiHy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y96ewjOe2J6yqfyBL5YIk5qIBoNLAHMOBd3HdEAEyakr3GaNm72ldmk2y9s1V0rwbMdhcxr5kmXORM+F0NjFDAKVPX4FOOEYUlM1UEcNBKen1WM3Q7HVagZs6kCyZJF4XyxsEWj5Zv0rgKqHzhEnxExh5HYsMyxE8rRSerQqP0FCYCEjJyqJqMAzjhCRIFChDE4u+2baH+fb0CUbtrvAUUPPKGwJ4qc8IUPijtKqSVIUYDynbi0lpewDkrGJSJMYsmEHj/M7HIm29U5GZdFHY14aRkDiTiZIeidWnC8c+XZwmEF+Cxmoq+LQIrBGCzd2UltrAMsVwfXzT5lJMP2b6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dr+i2fxQxf5fGBHvyEkak5IKxmrh09ciVMZ7jV6bCMM=;
 b=JQXRriFxS6VqjcCaQjzobRkCF9A6B4fx6UF215j3dz1jk+PZtUfUXVRSUylAegNNAmt6e+LgnbBWkx7q2C7+gVsFXDri+LOmfU5XIj1q1KBnpTY9tz44vYMhM0QR2eFqrz+JCOl0pTZ4ryqXgGNqiu2VjDJXWqAVpe2IqSp4wRCFo4wAuf7ypHje+9x9TMo5JOSxofwzbvjqDg3KUhx2j8MrNZg15xf3MbSQv9ETmVLtFfI12Br7Oyh2GiB3JCfU87KvMMrb/FAkCAJHAZx6Hk+oc8e5O62SwoIaw7haDAOlFkDWP/AeXaDXbEF++w58jGF5XfuSh8J7/9fUJ+IO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=hp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr+i2fxQxf5fGBHvyEkak5IKxmrh09ciVMZ7jV6bCMM=;
 b=ec73LiHyGbTm8llaRd5q5sTZqNqry+vezlDFBslnUOuyVXJQTQJJPq8fH7vcskwu36wJVGeB3t514VyPfor6rfoUcy8L5Qbr2cjVTbvdh4L9EMO0xjeeM/8454Ur8DeV35dfGfOv2s72bSANI8dPu8APemvFODx6bNTZVNx326U=
Received: from BL1P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::28)
 by SA3PR10MB6999.namprd10.prod.outlook.com (2603:10b6:806:318::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 10:53:30 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::48) by BL1P221CA0008.outlook.office365.com
 (2603:10b6:208:2c5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.11 via Frontend Transport; Tue, 9
 Jun 2026 10:53:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 10:53:30 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 05:53:25 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 05:53:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 05:53:25 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659ArJGA1492810;
	Tue, 9 Jun 2026 05:53:20 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <shenghao-ding@ti.com>,
	<13916275206@139.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>, <letitia.tsai@hp.com>, <bill.yu@canonical.com>,
	<pin-hao.huang@hp.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Fix device-0 reset issue and handle -EXDEV in block data processing
Date: Tue, 9 Jun 2026 18:52:53 +0800
Message-ID: <20260609105253.19510-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SA3PR10MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 90438710-cdeb-4e8c-3c00-08dec61557c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ucef/OjuzA1mbctWhPAI1rtyPI78CluBRAmb+mRcVvlMLcs1ic2JCgUb9ZgqBeXY6PkMH+wuNkbUJtgrylKebaz7+zV3xjkN6ZK61GeZ0gmuoDNIi7lchgOHQ+tA4n4lGonnZqUE9kf4/qRsQNoGSp/9WwaWvcUGQ6zPyG/JV2ZoinR7hU9gnAmlx4NRWdz74EyiZ72x6ceRJC7Sqt8jZpiRollfLRA05S1inblZEdI4VKdimowlqeNzyf8NpF1gHZuBTz1qg9i+/QhQQVRFBY2hjZ/WpaiopIOqP7zRQr+tSmAHUbab5HSHZ3DeI9zIN166/5VDX++HsZ5wxUjL2pyTLg/vBAwKejLc0AJq2kTRqna7cR78Nd7TVpjyEr7nX3dIawXVey9S5xy4u4vI3+vIgGRTSCAVPcPBwE9LZ+yTj+LJZZU3wanqdDyxYhtaKk9AhvGSRUimn2MxMsXlKg45+Rvc3ptwsGo3QKbdGx6yrWLiL7bXGJLB60x4E/XYa9ZOrKeFR3+Ws7RtKOM+zfJmMC46tnB3/qBI3i829N8tshKeKEgfSpmX8EXqGpNT8R4kBGYanh2f2U1MqXH0O/vgV21nsD7rAy1vvLZg3QzMLHXuvjvCqZ3hCE8cqxFlrpQbC2eyKdz8cQgE64gXE7PAOTur5BEYHicJno6ipXJ6dsgmZZHAoVdf46Lhvzt6XFB6KE0ixDkyRgnTH+9Xt78BC66FWuJvZyYFRBh6EAU=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RsBwETNLcWX5BvDKP4isWUXyMOKwLci7mmEwrZx/V+gwHAxqlmEHCyG//Pu8EpZ25uZ5UCMxzMDBxI79ncZ/JYy+DkHkFZkt5COvRii9VjdjqutYoC8OmsbggKaTgkYQT7iTrqS7KNoT0fh5/OfltvE5wRnL0MJOoMih/rzNgzouL636aokGbbb21CK6dubn1G217zod1j8zUbaHGHqCOltJUj+m2eC2G4494gK88kwYTA0lN1OM4JokzDb/5omG+VofBBsmCITeIe+9e+BgHbIa+Bm7LbTRmp70WE4enBrJuHy4WHwEa4nf2ZmR21IQQDTssT81H7u35pwC8nqjnair1BiUXJ/neGnLI7GxtUy1e7//8kChyWWvzAYg0eDrLqpc8Kl+C5GuzBIXtV10swj4ktATdA6g9pCZZVDjSrLC8JH05UCc/2G3mPlvpNle
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:53:30.0978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90438710-cdeb-4e8c-3c00-08dec61557c2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6999

Fix reset for device-0:‌ In older projects (e.g., Merino), the hardware
reset pin for the first SPI device (device-0) is ineffective, causing
initialization failures. Added a software reset sequence for device-0
to ensure proper initialization.

‌Handle -EXDEV correctly:‌ When processing block data, if the data does
not belong to the current SPI device, the driver returned -EXDEV.
This error code is now ignored to allow the driver to continue iterating
through the block data and correctly calculate the total block size.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 16 ++++++++--------
 sound/soc/codecs/tas2781-fmwlib.c              |  7 ++++---
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 0efc476abe8e..3978d58ad020 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -190,15 +190,15 @@ static void tas2781_spi_reset(struct tasdevice_priv *tas_dev)
 		gpiod_set_value_cansleep(tas_dev->reset, 0);
 		fsleep(800);
 		gpiod_set_value_cansleep(tas_dev->reset, 1);
-	} else {
-		ret = tasdevice_dev_write(tas_dev, tas_dev->index,
-			TASDEVICE_REG_SWRESET, TASDEVICE_REG_SWRESET_RESET);
-		if (ret < 0) {
-			dev_err(tas_dev->dev, "dev sw-reset fail, %d\n", ret);
-			return;
-		}
-		fsleep(1000);
 	}
+
+	ret = tasdevice_dev_write(tas_dev, tas_dev->index,
+		TASDEVICE_REG_SWRESET, TASDEVICE_REG_SWRESET_RESET);
+	if (ret < 0) {
+		dev_err(tas_dev->dev, "dev sw-reset fail, %d\n", ret);
+		return;
+	}
+	fsleep(1000);
 }
 
 static int tascodec_spi_init(struct tasdevice_priv *tas_priv,
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 885e0b6fed00..bd16d5326a23 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -921,7 +921,8 @@ static int tasdevice_process_block(void *context, unsigned char *data,
 						data[subblk_offset + 1],
 						data[subblk_offset + 2]),
 					data[subblk_offset + 3]);
-				if (rc < 0) {
+				if (rc < 0 &&
+				    !(tas_priv->isspi && rc == -EXDEV)) {
 					is_err = true;
 					dev_err(tas_priv->dev,
 					"process_block: single write error\n");
@@ -953,7 +954,7 @@ static int tasdevice_process_block(void *context, unsigned char *data,
 				data[subblk_offset + 1],
 				data[subblk_offset + 2]),
 				&(data[subblk_offset + 4]), len);
-			if (rc < 0) {
+			if (rc < 0 && !(tas_priv->isspi && rc == -EXDEV)) {
 				is_err = true;
 				dev_err(tas_priv->dev,
 					"%s: bulk_write error = %d\n",
@@ -991,7 +992,7 @@ static int tasdevice_process_block(void *context, unsigned char *data,
 				data[subblk_offset + 4]),
 				data[subblk_offset + 1],
 				data[subblk_offset + 5]);
-			if (rc < 0) {
+			if (rc < 0 && !(tas_priv->isspi && rc == -EXDEV)) {
 				is_err = true;
 				dev_err(tas_priv->dev,
 					"%s: update_bits error = %d\n",
-- 
2.25.1

