Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013070.outbound.protection.outlook.com [52.101.127.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7C3F12FC;
	Fri, 17 Jul 2026 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287331; cv=fail; b=K9DHN/WXbg5XPtqdX1zTZQqKhy4si+9HCjyisXeA6HsOaacWr++OJXmDgf/JVKU7DzUV6vfrp5xgw2RFj/92hh4sOgYS5GBOYjGWu54fJYSf5pnDreTtq3qe8gqxyxbBphLO/p018pZAA3XadN41x1lvtUp8BqOguAi58rn4T9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287331; c=relaxed/simple;
	bh=Rycn6iNcF1J0xpW6BrLNy5JH/W0aawC7sD98cPnEaFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tAsTzXZYRdAEsbDT3JRMRtOkeM5iLkHIpBbKxI7+1fOuHsJ+BavTYltH3JhwnVzRYwubOo8ihzUSPgvWeVNEfiGK0kqSi68FPZI9H0QoZyT28KJDDzk/oOTLRniA+pz70iMI92P6ksIimp1/kOeCDd6vnbICAU0/LuyiUoMQSuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=omuDHFxA; arc=fail smtp.client-ip=52.101.127.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="omuDHFxA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9KAQN8qzuvzAqBpH0p5gVGtFvW6ASuMrzPbjih4URFcVALR+imbqzU0G/6jmJsLN6fidrZvaZhp4wwhtoD8EC6tgukbJCoby1Kx1k+Et/I3vxBKSmTbu1QrFgoRFY/No4HxPll92bXA/Y+5CyZNyhBlzF71tb/nn5/jTMmuNBQ74sZI628jVZZerC7XwnFjvgstwmeouMEz40IxWotoDWfUbPnXtibsTSwv5s8SMr70E3UBz2CVlPCNcfd0AXAwRG9sRrTrHgbk+ZfhTInxmfgJKFCQJ4B3I42dBiBzTZjNNSJF1GovxY9WTdzj3v2sMrjAxP4TE3wBph4Y/TzLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WE94sEP695xNttTFmtH11vnLtIz8HrzNoGDsQL88sdQ=;
 b=o3IzgWWVn/VdpMLcihAUJI/QA7LO/jxoruMQ6UsampeEztkIvwp87mPm+Xzpe5ErQt3tUBEM4TL45soLN53LINtLvz/G6u+DuoanuDM1h3NiQ0bzEjR/AAbHvp4HiktqwvHvQCU+HXBwLO3RCbqZwxW5Nkp4OSiynbgqQgV7k6OLwyrxbkswMJmc90q68SwXYMfPN9tX+KFdcgWYtyNoPtEExdQjy/vGDzdCH50/fZYsWWjobPBcLmsRTs2RoLeOcmtGLVhqGWm0CnDbGabjps9k8uPfeCPNc003UAd+Hz3+r9BlqEHelwkAbgkoxYmKC4XvVOXL8THKUr5Wc8lxKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WE94sEP695xNttTFmtH11vnLtIz8HrzNoGDsQL88sdQ=;
 b=omuDHFxAqf837Tm5bZNtCbqlT3fmgecajWbAPhEJF4u28JIMFKN7C/2kO5aZdOPgi1uuyvHUOkUu7BPIt7IlZb6Ok60rWHCO2QQRAB7XCUSvXZeu+PMPf8fQGVCYo9h78GWQa5SGsxx1+DFHr2L7f+n0w+0E3hxdPEKvZshdsUFi8hwu8aFM8fQ3GugZ2aig82S2pS+UZf3X39O8tushbZnYiJD7hKOcGAL3n8eTShFmYiSkZHQmfdcNOzyBW54h08TjWfgSfovBMTXvIfUq8pPBsi6bsc8Eopj8nMy/q5UDNingdymsHBlro4VAQejPHD4P6arxlSTIHocsDlZFuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Fri, 17 Jul
 2026 11:21:55 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 11:21:55 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	platform-driver-x86@vger.kernel.org (open list:ARM64 PLATFORM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 1/7] platform: arm64: Remove redundant dev_err_probe()
Date: Fri, 17 Jul 2026 19:20:39 +0800
Message-Id: <20260717112103.213017-2-panchuang@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|PS1PPF5540628D6:EE_
X-MS-Office365-Filtering-Correlation-Id: 873b05d2-b640-4914-2f64-08dee3f59bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|52116014|1800799024|376014|6133799003|56012099006|11063799006|38350700014|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	W0xsCrygFll1HKk/q/YW9VEcU99iC3pV+6G3Iip2nblgDSch5SZJRzP1bUsPq7t28qg7cYDIxmyv8p2ikn9K+FWh/hbNruKWHbpA8tMGTqQ+xlW9BuaUZ4Cv5rB2sCGu0NZb5lbuoJX3shE0bFfbWnFxB3n1duvnnp9prDZVigs/zrisaGRwWXlii4HP+ROlgQUP5MyVaRDnGh7cFj8Lo746NZnn73oYZbLxH7yFtwTZpqKtGX7ebx/cKRFBqtmjkacW/pS3Dxue3wT0Ur9+pS9bROXMMlY/JEL0IaEaqlVZjVFE65F3YQ27W335OB2Q+REWSB2ygpXU6aK4OoqZ7la8fk+wQHwAEQE5pgTrJITmkvbzx1GRYn2UmNYa5ZsNkmbfz/8PnyZ2A2PWw+6v9/Ke503zYxBv2RCOmGH3WUTXA9sCAWsbDsVaoYZgs6Xli9ezf30xfs6qeKxHVKOFdyYLG+ulmYvZSi5zVxzte03E+ozv/SAgQjqPhCqI6hPD4iIOjgAUHTbQYO3LtcTI8ug933wCT+vW8WQW/PWf817D6eVKyqGCWU0kQ8hA6bmEL5WQCA90ujcXUg6okvRb6YRqeeAf8IfnH91xFWr5uVOC/pgHZF5gWM3NaATpF/oFYWXESG84vBbMuA2QPlUI3oDiX9NI5y06YMCrmweW2LVlErRIxq70n/Ygz+oHEPK+z7siXBzF8/O1AP+TbI1GE6HyUkC0RiKSLEk1faKq2as=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(1800799024)(376014)(6133799003)(56012099006)(11063799006)(38350700014)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qoqO5voQ3PTdj9eGOzS9Qqw+b6SsB1mwHasOs8quzVoFaicJNguiURxuLBPx?=
 =?us-ascii?Q?+8ETw6Ao8jzz6w8KU/wi/+JUHUcRPJKW2GD+J1kKaop10PDk1MaVuBe9WNyK?=
 =?us-ascii?Q?7l0OWu4QViM+eGk/UXRVxgoO0aufISofRcX6WXi+PzwoTnF3OIMoUFAJGxAb?=
 =?us-ascii?Q?c1KHJaCJDpfI8At1T8bkX1XETOBTKoxeIPj/76xamSpjRGwZASEPV/hkMnx3?=
 =?us-ascii?Q?jB0tQblyACuep/QEGZtK3mDZ4B0FwAnHODSsUsvpmua9ufv8t3aP10hZTvyH?=
 =?us-ascii?Q?9SlxXXz1BmiT8+0WLKm97EhjI/TEcZHk0Y0uZLEOhN6HFNOXKbfyCTlKgQSd?=
 =?us-ascii?Q?HeeDsv2DsDlsQN373hty+rAJ+RRV6cMlnunXgB8QB93cngeYpCaA9CnowF3r?=
 =?us-ascii?Q?n8MgMn//9OLlcWHagR/JVcnBG8RYTl5ajZolgQYTAOwqWXvCgjxc+v1NNJqn?=
 =?us-ascii?Q?//LtnrnvZsG/Kok8yEeaZOu6LpVWpjihhFsNwukr2/wB3SSPQAJmo6PxaX4K?=
 =?us-ascii?Q?nRQD/izhyTK6IRZtHlzGDwWnNrBHC9blFEbRqwk5E9582jQucntoSJrVTXxo?=
 =?us-ascii?Q?xs6FSJIU0FhGIPSD86FzSswrXY/Goq4ffRBkTcHZP2zlbZXHNTM8Va53nMfi?=
 =?us-ascii?Q?zFc/5JFPzcQOC64og7h/5DudDvJsdyNzKwqq8/f6j52mg13Ur2ix/9MyBeuy?=
 =?us-ascii?Q?MF3iGavSF6ONZ+i+5aLWT/M5p5T9vRp3908AJ5ds39xtXXKe8FQWDb/aApES?=
 =?us-ascii?Q?6ywPkuj0yqMOm3T2fM5xbdLthrFrM2kRHe4FkSQjLzMVwFQt0eml9lAIVfFT?=
 =?us-ascii?Q?uuJyemaPrjV6kiBxqYL+zPYpl0ByC/XgeUwdOWK7M2kbLFXSiiEYLrwaZ2B/?=
 =?us-ascii?Q?GkZKXupGI0p7Jhh1cUnnuweQEJlachpiG3Ug7kv7nsDhmZrirP12DUzVMYsM?=
 =?us-ascii?Q?RoikRcGOxGfRYqwAOpmiHSLfRZpOkAXuFhZXASM0XnGEKaBZ4I56eWTQzmEQ?=
 =?us-ascii?Q?LdVVS0XNHJjYn7SkZoGwW9N+1PJ58At+++/fFTBFO4jAtOI0VNr1RrMqGE7y?=
 =?us-ascii?Q?M/C99pRZ73Cs35URBWM5V+RIYngpeaCBJJUJ01i7ZE9glxtT9a1l9K0YuYu0?=
 =?us-ascii?Q?Ex4JZjx9PmgPiEkGWjqcJD/c3I9NCNTSLIffNjwpWrSdxMe9/iVyPY/Y8C0G?=
 =?us-ascii?Q?Ov0TQAX84duK1UqLqwDdV7l/W3tXQsX0VfOByzLOkDlTJvXUk0gytiftno/c?=
 =?us-ascii?Q?VVyon+Eaf/4dSg08/UJVOARXZJiIKCsPsWCPFtrHL9fymhvjaa3qJyYVtP1Y?=
 =?us-ascii?Q?YgDjoEXuGUHDqINNKn8O4F4Nv2cE446L6h5bg8n0PLactgt6n2cSTmFFqR70?=
 =?us-ascii?Q?sIF/XYPps1lQ8F/Z006CaM9E5xLu65x1Ut1aCAuALy1Gm1EQeTvXaJGvm/Nc?=
 =?us-ascii?Q?U+cc7S5G6nwZkCvQgoWumoz3PJmIPIwkXRXYqMSAhXjD37gMaH1c+KvIEBTF?=
 =?us-ascii?Q?czTgZBYO0WAGqWWOYqtBWThW6PeYw4KtgBIM3BWun/72YQJ7vYHiirhIVACe?=
 =?us-ascii?Q?l02MYkj31kJZtP/041WvuX1L6b1LfRQjLjI/otg0PnGFjOECFtqbvAWznIG+?=
 =?us-ascii?Q?waKOH8u/WfWj4kXHh37KvwA1MCOBkJ0xosuY2Oe9d11njGInmv+wrvzm033x?=
 =?us-ascii?Q?EwpK5wsBxWekSFZ3NiWt5Sj/b/HV6xjUGY2XiDtNlDFOR+5d9nJHQLCbdPyP?=
 =?us-ascii?Q?VL9MlFjjlg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873b05d2-b640-4914-2f64-08dee3f59bd7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 11:21:55.6135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEbMS0fR2whC8aovNIScjXQLXyehSJ8fd1FFqKQ4eIZcd7glXuLoZWSoWJwg6KvPTZ25f9zD4BVuEirFMX4tHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF5540628D6

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/platform/arm64/acer-aspire1-ec.c      | 2 +-
 drivers/platform/arm64/huawei-gaokun-ec.c     | 2 +-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 2 +-
 drivers/platform/arm64/lenovo-yoga-c630.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/arm64/acer-aspire1-ec.c
index 08d0b155a197..501c62a096f8 100644
--- a/drivers/platform/arm64/acer-aspire1-ec.c
+++ b/drivers/platform/arm64/acer-aspire1-ec.c
@@ -514,7 +514,7 @@ static int aspire_ec_probe(struct i2c_client *client)
 					aspire_ec_irq_handler, IRQF_ONESHOT,
 					dev_name(dev), ec);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request irq\n");
+		return ret;
 
 	return 0;
 }
diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/platform/arm64/huawei-gaokun-ec.c
index 80a8ba8b8dda..d4ce8ad6426c 100644
--- a/drivers/platform/arm64/huawei-gaokun-ec.c
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -783,7 +783,7 @@ static int gaokun_ec_probe(struct i2c_client *client)
 					gaokun_ec_irq_handler, IRQF_ONESHOT,
 					dev_name(dev), ec);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+		return ret;
 
 	ec->hwmon_dev = devm_hwmon_device_register_with_info(dev, "gaokun_ec_hwmon",
 							     ec, &gaokun_ec_hwmon_chip_info, NULL);
diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index e7acb66b77f2..191ecd7f85b5 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -594,7 +594,7 @@ static int t14s_ec_probe(struct i2c_client *client)
 					t14s_ec_irq_handler,
 					IRQF_ONESHOT, dev_name(dev), ec);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to get IRQ\n");
+		return ret;
 
 	/*
 	 * Disable wakeup support by default, because the driver currently does
diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index a8600a977fbc..cad40c58c55b 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -221,7 +221,7 @@ static int yoga_c630_ec_probe(struct i2c_client *client)
 					NULL, yoga_c630_ec_thread_intr,
 					IRQF_ONESHOT, "yoga_c630_ec", ec);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "unable to request irq\n");
+		return ret;
 
 	ret = yoga_c630_aux_init(dev, YOGA_C630_DEV_PSY, ec);
 	if (ret)
-- 
2.34.1

