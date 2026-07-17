Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012053.outbound.protection.outlook.com [52.101.126.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4123BE627;
	Fri, 17 Jul 2026 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287362; cv=fail; b=Cq4t+oim6evIYivkM5gRED4267X9KIeLG+dCTzjqP77xcadxhyulmEnrwpijErY5iHcJDKGDi1XG0i31TlbaG4wWTYBzDANCPMXZjj1R9U97HUr3glZz49+0+Q5YT/ftXDg8fVZSk86RV16egm+CpoLUQUGiqR/guNx2UHOK8DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287362; c=relaxed/simple;
	bh=qweM8MU9p0ZOKBzcsN81UAs+twUCR6LP+shvSq4hQuI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YPeuVbX2YdFllXqN5V3IOGQQYm0qEPZslcU1wKoojnMc3NyKloElejgVV442gMYWKlHqUscF5RCu0Y//I2pjCqPT5/04j43ZIMC5//wlaO5WTYVw2G5HPK/1KrtUE91JP7qD4sZ2eFLUtUNQd5Kf/Cb13R62+MdlxYUfCal/R9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=h41H4Za2; arc=fail smtp.client-ip=52.101.126.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="h41H4Za2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGbSaEQrl3smU57R6lm2DAf0s6vq+yB7X0I+XjNlq9ihChidCMCEQS1AhHn5J3CucH1xqHEzkw2P8tO9STJhmBoLqN+f9EVXx+Ipchr1J0tdp9HUHWRXSo3Odk52AwM8zDYXPnX0NR1rdhUEZpi9MPR5cXe0Clfy5XhVUFr+kHgzJYb7Guier5q/xhmtyCd3McjvLVf8bbHai3sp/CFOfCiwkbqmLN1IQifL6h4aHbdEF9skcpNAd6q1MTZW4CFfoemVh6dXXC0yhBr01WDmTAuYj+xXwcIW7YFvQzTmYqflIV8kk+k7yZ1E2amm8ahd+pvvrq3hsXfZu2AcdQhQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZXn08gmqQdSzVDneXAECvqkejPF7HksHYGcMzsIOSs=;
 b=XZQVWixVxhOPht+QU+XXcXHK7/6d01jxn1/Dd171iM1/heCThDnLC4aZRNSU3CmG4qDhxWe0zEtRFNH3tlfZ9LlyN3jlE0RU3femGGNMRbxFp6pgvGfpoPkuQ5Z4QIZ2zpQswx5alNY7FUcfqSzM/zu+YoRveQHp9wW/dE28+D2LUVlJNzgWraac1447AAZKRaJYbMZgQS+aumYQftQ3BwHchcRQnj6QQRzTgHH3EG5uz1GNotHM2JdIrPsbOX+oWMV6MY4DJQO8m3Ztpitmw81E6l5PTTyd+I+cdUpPOfTXADMLVtj0SRafZPZrYcmYzn++SG7PLYIpv/6NIl4TkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZXn08gmqQdSzVDneXAECvqkejPF7HksHYGcMzsIOSs=;
 b=h41H4Za2Sptxd3IlhBzMbnE4b3w27oXZ8OxYweA1bI1fREdbiUYJ179Vut5YPZDvyLlOOss5X5iGkzcJ2dyNaZR5Rj75exI0HjUDXwCtxxRBbXYRoPPQa1PLX2ZVV7skOBot6YlVCbWTUJ8w/fuf+nx29aV7uQwoCDpsxjRppesz9EJ6yYJH59Fx6KPnTqcwDZOL5ut/AW05S+ZxqntDehgQKwR5pPYSWyKHawXlVWQbhfI2dZj2lCEdoWrBwqXE2GkIxNKhoy6GSY/TrRsSV+waknDGoB17eqsS7SBhaTL35CnqxLNcCXOiX3IteZqBL1hB4zHYJBokVNAqqZAuhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KUZPR06MB8075.apcprd06.prod.outlook.com (2603:1096:d10:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 11:22:23 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 11:22:23 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Pan Chuang <panchuang@vivo.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	platform-driver-x86@vger.kernel.org (open list:ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/7] platform/x86: Remove redundant dev_err()/dev_err_probe()
Date: Fri, 17 Jul 2026 19:20:45 +0800
Message-Id: <20260717112103.213017-8-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717112103.213017-1-panchuang@vivo.com>
References: <20260717112103.213017-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::15) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KUZPR06MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: 70dab3fb-fdf2-4d41-6c0a-08dee3f5ac4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|23010399003|1800799024|366016|18002099003|22082099003|10067099003|56012099006|11063799006|921020|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	dgaoh5H2gI+ZetO2UkBYRWIpv+3BIWBVQV5saX7+W2bpy7FAF1DWB+kubaalzargSefzQMCISs/DcALk6tT23uC7sXqa79caw8P8LkP61XRhBYsKGUKk4RdEwqnRyIvYNYypRE6gF0/GHM9igrVGLHaqMGJsKNieQGjDZIPBGaaRpYBQOJrRiWfL7Uoc7qL/IXVDh0WFmTviv0eKDKKaOxQNRWn7NYh+RMr61VeLDCHCVPCjRJ2mfT3VOkUuTamDHWiKOGcgVTgnhys3WK7tttiZH6/0EysVbCi6vCbNhaKa86XY/yR9TKrUA2X1SFpVgBBiK2oJx6JS1ww1YhFCOIM20FCEW694XX6pbDrI3XsQ8CNOHckXms+LwhlZbWnPmHRNRVc/AAmU/wq3/cPQtxk15CfOTgwNhQaENe6EAJZDoDqWtimXO2Li+uR4h8Y4m68V1zxnnIx/j0sG9op2ljHrQQDOwtzdJgLmzSqKeDH1Y3ykiAZ8X/fFx224vDYIQOzlrnLmrOtgRUf9vw1TSDXCJnDKdjpZXKIMDiwCtmg84kc0H2Tllplv9zd1j/YHuAs6znLqHlPeJfiFDCOUyCkzIhgv6idtdLSSVPYDC88i/H9DHYFio0+WhiLeaK7gN3Z+aJOmdQUUggCnBBHL4yX2k5lSI5FuHrnPCzZToLXed2LKxkLYdpPemX3ikYRUtJ4ww4z+BpLsjmjHm5dJQS1DdOxJsaO8XSp7RMoUhet0SJukesdT3okGprJfzMKU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(921020)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qkX0252rtQHdNcylVe25H0YJaRSNX7ZbFk/6MB78aymwShRsQ0Ka1vVmNWFA?=
 =?us-ascii?Q?zs/0Hm1nkDw1/cYyq1fJuTqLXC5wQ/zFv0LCFlMtqhY3Xvqbr929FewPbqwq?=
 =?us-ascii?Q?0HaM1kd2ZKXG/fkqGkewA+S2Rfvi1N4QNVatRdYvREQ29/pV8c+PvCAt3M+H?=
 =?us-ascii?Q?lwRIRXTSmfN0brbBLfbEfw8xOI24VYvX7MBr664Fvh1CFYeID9ZYpHIXMYZS?=
 =?us-ascii?Q?ZwijR+J0951iPuRVYVBkFBCnQVoZwqM90D/wiozuO7XgrGhYUk8BDx2+LKwE?=
 =?us-ascii?Q?2pB1ZWzIvpoFz+AXoD/jdeZaLEGIB3xzSyZQUD8YrDYwY6Ar+87RoXDaI3s0?=
 =?us-ascii?Q?MlrYSmaMtZjYU01bnpnI9eY0DfkcPOkhJTIvD+xoJuyfCE4EH9yVdAvnQL0m?=
 =?us-ascii?Q?v8VBip/TnA4erMwpw3EPyuDNMt4tTMmU2IscGXQ5ylIAh3pkWlw6oXOrg4mS?=
 =?us-ascii?Q?5cmHukSltbeEF/xTZyG9guC+WHeFzeqPqPAM8TRLTJqilfy6Y0/N4jGY3hcv?=
 =?us-ascii?Q?VGRuYAasZO00kiX6Tx/Zmo6jcoVtVjn2iliU7vaSsFxK64ZGaFOQKBJzQunb?=
 =?us-ascii?Q?sQn9xTrLpPDp1M9ZyhVtRTEkx+hBl8pJzzdBleqCgzaEPzcbhK55QNXXWZfz?=
 =?us-ascii?Q?JBkyZcb7NbfwyuIK+B3LE29R7pTCiEpdJ0s+zcTe/OTD8xEEdt4bx7iCyZ/4?=
 =?us-ascii?Q?5NOyKG6TMF8j2/MMyq5zlyXa5F4l0PnJCcq5VzfOU3cyHTmCG2Tdes+TUXS6?=
 =?us-ascii?Q?yj4bAWAxlC3lWYkSzjG0YyO9zZYUfqTfpEMHH9MmB1lnU854E5tWu1x48xk2?=
 =?us-ascii?Q?BvKji7i7ig3Gvgv52F9ji2otch0B3oGZBX5IRpDzzvAuXeTyC43tsyceM0to?=
 =?us-ascii?Q?liu7VJvnKsUyDoycpE36wSmuxMSzx7DGfOG5qa4HymUPPgkmroFZBMt2Fpiv?=
 =?us-ascii?Q?3irq+jD2RC3xBJjnnnmjSeMvZcj0oLqxt8Y9ZyXO7E11CJrXA3SpKSeJkK9K?=
 =?us-ascii?Q?PlcPKnSP7Umr1zBa03rVi+6cWzYVAyFZabYL/QoJXhK/CDHCTQyRg99FBVzM?=
 =?us-ascii?Q?xvNoL5x+sPqtrlJIdM164ZrLPspNrFIpZeL21KUtToET1iYLar3nA0+0lzJ/?=
 =?us-ascii?Q?TPl40IkkltvdY5BRJ6zeC/a2mhH4Ieggj/mWoydgRdCFYEkTc0/sNNi0wGCj?=
 =?us-ascii?Q?Nnp/MfEX90fWXb8Up7hu4D/sNSNOrN5Mo4jyehzIF0r0msCa0Sb0Vv4prmBu?=
 =?us-ascii?Q?3yG06aO/8a8OSf6cKcRFeQ+0t8Jb8065vy99xDnELhkvlPT0nSk7/I18tbFu?=
 =?us-ascii?Q?b3omBJLYBfbf3n9ZG9ssxCz+C4kMOUpKCItd7Pmbk5Nc1CNCH7kX2zVcv2a6?=
 =?us-ascii?Q?jQs+saM9upIZjGqZR4lFA4rney7iSUHCAvcDxU24qMwhelnLE4LZS+hIzptW?=
 =?us-ascii?Q?5eMvXrQHewEPyIVG32UN40uL3oGE8gBAUE5CHdLH5Yn/5fLfCtxcCIsMbdu4?=
 =?us-ascii?Q?g8mK5W/DM2seu1Kxo+EgM7mZKzdkhh+bTRvdaXcvV0A20XE2PBi/RSnPIoqi?=
 =?us-ascii?Q?olPS39FG2o4yZhRI2NA4hMwt4uj/6r8CKHs/ikSfMjZNVPlxYZC0BOx72AK/?=
 =?us-ascii?Q?sJ7GEkUrdngBFuaCpQ4EE4NLpCT87ynnzP1UOyWnPXDH9MZ3HxrC1SRDXndk?=
 =?us-ascii?Q?Jfqn3GTYzw67RqpyRsTeszqAKEK61c2bfTWqE6xbiYETD/iHD4oDhcJxmv/u?=
 =?us-ascii?Q?ixN1p4gGeA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dab3fb-fdf2-4d41-6c0a-08dee3f5ac4a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 11:22:23.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urMKaKKovLg5a8f/sarK0W0A2hTtHIgOUV2x2xVTiu6dhSEfR9lCrISkvaHfVCZoYjOpB3ctxUQ875StBkZHmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8075

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"),
devm_request_irq() and devm_request_threaded_irq() automatically log
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/platform/x86/asus-tf103c-dock.c           | 2 +-
 drivers/platform/x86/intel/bxtwc_tmu.c            | 5 +----
 drivers/platform/x86/intel/bytcrc_pwrsrc.c        | 2 +-
 drivers/platform/x86/intel/crystal_cove_charger.c | 2 +-
 drivers/platform/x86/intel/int0002_vgpio.c        | 4 +---
 drivers/platform/x86/intel/punit_ipc.c            | 4 +---
 6 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x86/asus-tf103c-dock.c
index 92466477de9a..3be5b96de548 100644
--- a/drivers/platform/x86/asus-tf103c-dock.c
+++ b/drivers/platform/x86/asus-tf103c-dock.c
@@ -772,7 +772,7 @@ static int tf103c_dock_probe(struct i2c_client *client)
 					IRQF_TRIGGER_LOW | IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					"dock_irq", dock);
 	if (ret)
-		return dev_err_probe(dev, ret, "requesting dock IRQ");
+		return ret;
 
 	dock->hpd_gpio = devm_gpiod_get(dev, "dock_hpd", GPIOD_IN);
 	if (IS_ERR(dock->hpd_gpio))
diff --git a/drivers/platform/x86/intel/bxtwc_tmu.c b/drivers/platform/x86/intel/bxtwc_tmu.c
index b3666704d85b..73d7f71b2fd0 100644
--- a/drivers/platform/x86/intel/bxtwc_tmu.c
+++ b/drivers/platform/x86/intel/bxtwc_tmu.c
@@ -64,11 +64,8 @@ static int bxt_wcove_tmu_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, wctmu->irq,
 					NULL, bxt_wcove_tmu_irq_handler,
 					IRQF_ONESHOT, "bxt_wcove_tmu", wctmu);
-	if (ret) {
-		dev_err(&pdev->dev, "request irq failed: %d,virq: %d\n",
-			ret, wctmu->irq);
+	if (ret)
 		return ret;
-	}
 
 	/* Unmask TMU second level Wake & System alarm */
 	regmap_update_bits(wctmu->regmap, BXTWC_MTMUIRQ_REG,
diff --git a/drivers/platform/x86/intel/bytcrc_pwrsrc.c b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
index 68ac040082df..1f39850b80fd 100644
--- a/drivers/platform/x86/intel/bytcrc_pwrsrc.c
+++ b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
@@ -221,7 +221,7 @@ static int crc_pwrsrc_probe(struct platform_device *pdev)
 						crc_pwrsrc_irq_handler,
 						IRQF_ONESHOT, KBUILD_MODNAME, data);
 		if (ret)
-			return dev_err_probe(dev, ret, "requesting IRQ\n");
+			return ret;
 	}
 
 	data->debug_dentry = debugfs_create_dir(KBUILD_MODNAME, NULL);
diff --git a/drivers/platform/x86/intel/crystal_cove_charger.c b/drivers/platform/x86/intel/crystal_cove_charger.c
index e4299cfa2205..425c7eb32442 100644
--- a/drivers/platform/x86/intel/crystal_cove_charger.c
+++ b/drivers/platform/x86/intel/crystal_cove_charger.c
@@ -135,7 +135,7 @@ static int crystal_cove_charger_probe(struct platform_device *pdev)
 					crystal_cove_charger_irq,
 					IRQF_ONESHOT, KBUILD_MODNAME, charger);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "requesting irq\n");
+		return ret;
 
 	return 0;
 }
diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
index 562e88025643..96b36cfcd9e4 100644
--- a/drivers/platform/x86/intel/int0002_vgpio.c
+++ b/drivers/platform/x86/intel/int0002_vgpio.c
@@ -208,10 +208,8 @@ static int int0002_probe(struct platform_device *pdev)
 	 */
 	ret = devm_request_irq(dev, irq, int0002_irq, IRQF_SHARED, "INT0002",
 			       chip);
-	if (ret) {
-		dev_err(dev, "Error requesting IRQ %d: %d\n", irq, ret);
+	if (ret)
 		return ret;
-	}
 
 	girq = &chip->irq;
 	gpio_irq_chip_set_chip(girq, &int0002_irqchip);
diff --git a/drivers/platform/x86/intel/punit_ipc.c b/drivers/platform/x86/intel/punit_ipc.c
index 6d770b950dfb..a3d2b0b64135 100644
--- a/drivers/platform/x86/intel/punit_ipc.c
+++ b/drivers/platform/x86/intel/punit_ipc.c
@@ -250,10 +250,8 @@ static int intel_punit_ipc_probe(struct platform_device *pdev)
 		ret = devm_request_irq(&pdev->dev, irq, intel_punit_ioc,
 				       IRQF_NO_SUSPEND, "intel_punit_ipc",
 				       punit_ipcdev);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to request irq: %d\n", irq);
+		if (ret)
 			return ret;
-		}
 		punit_ipcdev->irq = irq;
 	}
 
-- 
2.34.1

