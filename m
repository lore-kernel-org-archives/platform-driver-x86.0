Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03CE3F58E5;
	Sat, 19 Sep 2026 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789823470; cv=fail; b=NhYrwKK0SYzLjhuiSuUEjfq9/DiG2tCDPuIo5iPO98KVJ30VpCLofy2q/HhhcPGqHo6icoJ253Fj59m/UnNdZe+mlhuSAjhBAz4IJzUWwgNtuyTo8WkUlidSUjJ8zH1Zm+ZysvlGuLmQJ9T/9/JDDPOJ3N40bvTiuJS+KOiaDmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789823470; c=relaxed/simple;
	bh=CGUoMk+inPz73DTgmtAnVFfliTLFtR83X3LNa1gCag8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LqaKJj/smGKBkIQYR5eRgzNUfDYd4RVSgDjpmnuZSp84SH984agg74I5hY3S5jfkf94Vr6j1WrU3z5XsvSjSMpXf7hBq8FlmeHTNXgu98YrsotJvVmTcQPKFX4MIk+pqi33b/DIeiWegyBmaHRhoqOOVtuWOWEEG3/24m9QNUuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Fdp5QVpX; arc=fail smtp.client-ip=52.101.72.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Fdp5QVpX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnIl7pkJJc287TnbQuhxIa0hZr6drRO46L+ULhxBvHi4qKz7KI+0gBjru/cLCeuxXHAVAz6MJ+ISfB2XrDIvX1MXoQE2bnk44AmMIvmMxcSQdKC302+i0fubd/mMn1fId3YrvG3Pn12bt9WbSuYLat9YmVFVvXEiHGz2tulsBDWzwveHsdiX9CuObIXG7EoD6/sM6sKxp7WvCWHtS8wf/TQo++8aJet4Cgvywhwc/QxfBe2jGm7peHO4+BeArIyeSlocLhL6F17lbsyryGUtY9VeQz6hgdW1FMojqNRtGBeFgl4x2DHDG4pxBikGw4Xk5j05OdqPiqcjuogQF+75zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xYPWozaWuXviI/XZlCZXZDfJKf61Aq0v8QRA0jJbfs=;
 b=tdfBZuK1U7xEv+EUBsC5/+6MhcpgzQorxMk/0eMtVZbmeCBTZJXJ0OTWtipfd/Zuhjdeq3tJ6h+B6zbWFEVlqM+QRdLgcTAjMlw0HFHbYg1p+fZNJTpbF9kB5MLUkm6qNVavz9zsMUwLXxI01g005Slu0GOA37mibUlS9dJeP8QCLchw6FQC+n06NoGWnXdF4jYn1o1S7yqcmQXDMPd3IiYTcfy1egLUzvyi+7ojdnFT/TSmIjCFVd9ExAodiRx4KDjMDS8P/Ahq+r5OtJlDbGKE1HfBXiwxAnAgDf5kra6chYci92mYwVZxcZUsWw9GmOtdbMNQ28RZ1eKOJpkqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xYPWozaWuXviI/XZlCZXZDfJKf61Aq0v8QRA0jJbfs=;
 b=Fdp5QVpXWmQ3WdwWe+1Wn1D798OBkMu8qRq7FI2Cr/pWJR8gW1y520HAWqk3U1AIXpLng1K15DDqeBIPLRXZY7bssLGV0YsDxKSNrKLDibwp56l41Sgf+II+BqmGRCofz3/Ggvm09pWJI8yUHlaC2Lx246h2D8MMsvkXK2fnY+BAqGJx1l2Y8zlgM7AZVelMnnRTPzB1u7Tk29C7Fpi8ZSGx8psiQQ0HgrX9WScQhUDW/rha7SuArzpzjzeMwzwKWdzjTGOX4shIdu5fhDkRmS5LLLlaOIeESmb2pcX4QyoiBCGRwfVFd104gmuS0Otv/o8EvYcUZM9ve7oNU8xyMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9507.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 13:11:06 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 13:11:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: yogabook: use assign_bit()/change_bit() where applicable
Date: Sat, 19 Sep 2026 21:08:28 +0800
Message-ID: <20260919130829.3041568-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0272.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: e2dbaabf-978b-4090-4a78-08df164f76ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	wvp4CG1QpGdgxU8odvmu8/qD7NURwp1Se5Q+VfPca9iZIj3GfGVBlD8kwYfSXh88lNVw0gaUgR2Qyv1jdZE/gEUErO64TIYiCWzOIlndjZV94LVLENfpdFX0FOvYo2erbkOG80Okk+CenH3dnZ09bAt6d3mQ3YRXQahOziJf+0BOs9HUx8wnTuMlrCl1oBbMffAcUYQrlQ8xu+xelFrGlPIC8Ed9tFVcztg6QVqnIt3WtDRoHwJXwREYNMzSdNlR2yT24KyqzDjz/G2oc6WdQFCr7N1O67VuOaeXiQJlO6N+hQyHK+Roqr+e1A+ZRoLUIm18jPTfbkmA2CNd/4wCT3RbQEiWqTmQuX6NdCjTs7+oFeuvY3cyefUFoqVA/89cG7n4v5mqE3oBgd60A+W3MvzqSHkVcdEg0XiKslnvLJ0wU59ZbvZfrHaEY901RCh00ooSclCDMe4EXmMZb3BwmaXy53KI4+bVStK+vtouxwPBqvYCBfstTvAi/kyZ2DA17QpZ1lG8EHwum7A8F5PhUkfV7P/c3MclOzI0Q8DRGKXEjHHQe2oYKeg5RzclL1h3LxDDuyr8WM7+U54eAfaiQGdKecwilMJtvUV2O4YPgn0Qq3+PAGQTw7K365bZhwourn8dUS1lDCEgeD5nxr21cJVUwiH67Wc6vZFotv/pXb8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i+XV1tId4AY5Sce39c1U2qydNZlmi/2s4X79Cpd9AlQfsoz4/jKpSbAjpImZ?=
 =?us-ascii?Q?Cjin1Q0slQgzZlkrQewpwQXVa0Mp95CfVKD1sNsW+i/mnm0SWDCvAb9j0HEw?=
 =?us-ascii?Q?D+um2Fnjk2diY8mVP+hzBGbbnYuW9eeMJF9L45qzrSHwDeI9hxwZY55it3Z6?=
 =?us-ascii?Q?UhrXOW3EPTjs9MWPll8ogU/P4wTwldGUYXPtZ1LPLZmXkeXWtdNWdsTfmpdV?=
 =?us-ascii?Q?M77cWQ6WfrwWMyiAHaOP9lIh/8/FGsX7Dksu5yLNRv/ncJU8T+3TXEZqBtYl?=
 =?us-ascii?Q?h+ZbwCOYC6J3CznOUy9AIGIS0FaTFnXTrGdti6Z8yzjy0E9Pnc1kkDBJaVpo?=
 =?us-ascii?Q?x1GiSXmHHxhc3EL9alhdkrSS9i0wb4K2ncUVx3vW3uNg83zTDBAwb2VZDwjB?=
 =?us-ascii?Q?tnDLcLpu7yq8yh6OS1Y7ZiX3z6IgZ08jx3J6e5i/51gQSxjGQHO2+z/bPv4O?=
 =?us-ascii?Q?aATqQbV0PD7yoMO6OxvLMFIGjB0KjURxTj+DWSUDbgodwS6ss1KzO15evRgF?=
 =?us-ascii?Q?ZqQieTyTnMId976UHnowBXYRiIzUK22lxF1UqchkogqugP0HuGlAfrcXg6N0?=
 =?us-ascii?Q?YjP55IJkqCM06BqOhCZXsXwHzCocSPqmtYxgY/fLTIp3AMR73S2y3Tf33kPt?=
 =?us-ascii?Q?34ZQ6pczKkSJCur3HTYGhGVHroRrIKwi4bzZGoeih95gOLt3PCGBHpVtVnJ5?=
 =?us-ascii?Q?li8cezi8CIAA9gPZHM0HKs0wA7t25FAQdqcO26Zz7FO0ripjFxbU12BY+Jvc?=
 =?us-ascii?Q?9za6LZm+A1MudWWYZ61Kh3K2bvOw6K1vB277pG0yEDySTECzyU4cWNON/2ZQ?=
 =?us-ascii?Q?haZtZ0uKF53RuxyH6qAqTJDLMhrPfsGiSGDTamiuM1h9xfzTXpvMrHGeq5mn?=
 =?us-ascii?Q?owGAXGCL8KN7K5PnsNcLWzEsGGeoaZOwfzo6lmctCfXpT9LNcUATgqngJhCt?=
 =?us-ascii?Q?7Ld6aGzeUPFJ9cJ67dNa0IqmPT6JjN63BFddGofK1xVF2wQazGg/ZLy5sm0t?=
 =?us-ascii?Q?xcTVUBxFvmM5YEDgdwxIVrmaJ4zKpxKi6eoKrAKgjzYFEHeuDrRLXViaurJr?=
 =?us-ascii?Q?bppys95FJvX792kygmGmKiqMFXx5n4evWypF9BOvHE4A3JLyZNeOQt8pqUjR?=
 =?us-ascii?Q?T9kP80p5jQ3/dq649QvuRM5pJlgqD+uGQRB0dtcjGeNrR5zVCvKDWSItoZhV?=
 =?us-ascii?Q?NkW/AN3O0fi3firqLgddZLetYK7jRdPTbWro7Mu/fTGMKxbwGTLp/YEtryuc?=
 =?us-ascii?Q?HjNlZD9tZgNqYlViHLzjr+CqimPFWuOYmAIN85kOt/L8hlSfkHg4Unk0iUkO?=
 =?us-ascii?Q?Uz87S4UunphSQO+ZanTC0LshuAuF0F0x07voB+UftIPCsAommI9tIrUxh16f?=
 =?us-ascii?Q?7ZVtytIIvPs3CGbTO/vyoMDiWcJpApdmODbL53qFT5E2rPkG+eDrYf3tn+zI?=
 =?us-ascii?Q?hvelFPpPvjuneoc3kcIzG5F0bVlZXpNevbYJjrSwX9mxDqhIex0PtsTDOtCr?=
 =?us-ascii?Q?9K/B+G4Z9FT3hMyu8o6NhI9rHZxpapltPuiS5+wNTXvyMsiAD1RIMBUP4lpe?=
 =?us-ascii?Q?FkZmO1jLLDcgq6aZ+YaD9m/RcZJ+6wxwjSlupQ5ZtIeBJMCmdVPNa21F3VHS?=
 =?us-ascii?Q?6A2e4QXuB8+s5U+dH3JqwVdC5iG4AdyYSP0GuBjyN7PGvqVeQU2a/UMjMauR?=
 =?us-ascii?Q?XkyRVNWwe8PhCwDVYe+Gzt8KU3lD+0yBgijSDw4GGEmBe0+8498frr6+qAS9?=
 =?us-ascii?Q?+1/P5N9aNRJCWfJhaHSwoJh/bSVMuOo80shiaZPZlagKgG4p9wDj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2dbaabf-978b-4090-4a78-08df164f76ba
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 13:11:06.0867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vvkCMaBOC99ks4BhGJUXlFPe7+pPxXaFFD3y+BSWy3h4ZGbfzt7SDkMiKKPx2Jw/WrZB9ELwsusfrdn2XuLkST0w4gKPN+NoJJjXDHNhCynnUm7pypshhoxBUAmHxwh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9507

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit to the assign_bit and
change_bit APIs.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/platform/x86/lenovo/yogabook.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yogabook.c b/drivers/platform/x86/lenovo/yogabook.c
index 1a4b2ab1f35d..f4c99508c6e7 100644
--- a/drivers/platform/x86/lenovo/yogabook.c
+++ b/drivers/platform/x86/lenovo/yogabook.c
@@ -120,10 +120,7 @@ static void yogabook_toggle_digitizer_mode(struct yogabook_data *data)
 	if (test_bit(YB_SUSPENDED, &data->flags))
 		return;
 
-	if (test_bit(YB_DIGITIZER_MODE, &data->flags))
-		clear_bit(YB_DIGITIZER_MODE, &data->flags);
-	else
-		set_bit(YB_DIGITIZER_MODE, &data->flags);
+	change_bit(YB_DIGITIZER_MODE, &data->flags);
 
 	/*
 	 * We are called from the ACPI core and the driver [un]binding which is
@@ -136,10 +133,8 @@ static irqreturn_t yogabook_backside_hall_irq(int irq, void *_data)
 {
 	struct yogabook_data *data = _data;
 
-	if (gpiod_get_value(data->backside_hall_gpio))
-		set_bit(YB_TABLET_MODE, &data->flags);
-	else
-		clear_bit(YB_TABLET_MODE, &data->flags);
+	assign_bit(YB_TABLET_MODE, &data->flags,
+		   gpiod_get_value(data->backside_hall_gpio));
 
 	schedule_work(&data->work);
 
-- 
2.51.0

