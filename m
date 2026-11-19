Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795055255;
	b=lxLIHVuPKJZZVaQev28mhJVBmj/uN0ci3qC7RAAeyoOu82zje1AT2fL57sNcO7+a7o6m
	 z0P+9xVqgJEJQtvfwjQ5k0PcciGgOZFUB+DynTqhkT3Hng6h5OPO1vkIeRZ3icnvxGqkE
	 8+YKfUiVV5DCziCmNZbMrGPCabfUo46ez/U67Xa2/TspJZKbO4JzDcF7FmNpx0BPUPJl6
	 EI++06QakV8XDLEp+oK7cZQk0riRyHkmxuCK2WDHK5XL5o1J1txel/TVZhD00nTx08vPC
	 DhE2Oui9qS2U/QoGSbymXxL2VaJBwU/xjcO4GpuaIa7fns1cXyp8RN6m5wGiVac8WpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055255;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KeaIVLJ/U0URc5+IeaLedxUp/mJcywcf0W1K34meTao=;
	b=hz5U+C+UIwwGiAENFgI2rFGpLd5cAWesaZq/5nkQJhZfwM6DFeEU2bYLSEuGmI4HLcNB
	 KuMApgKWPKFtCcG9yZa1jjEWWy9QtF9RFGp0tKl/DPg6khNJDCKuhbo1iycVpSKa5oqI6
	 6QIacO5UY3NzQqOz9NjKDfsDm7Z+cp0cMPWRiNzDKkdfHAZX9DQvF1+mG/zqLiGkrg2u4
	 2CM1kGxZrZslchDcR81K0ishKezJCXzZk9baXZi712vdq0JrB8A7LhDsKZYIEON0Hd/7X
	 lbrHo/TC1n3joxV6N2HPCn1YfGZlkZecQ5NI4Ou5Bt/rG6SPhAnHSW/jr3TVqxW1BDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VqYYHaQc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.68
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362F9606A325;
	Thu, 19 Nov 2026 02:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 362F9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VqYYHaQc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeKsJr1Y1Qa2V7rDL5a4O3olyyab88mqZtlrBqks6prjOmujG1lKbsFMbi/e93f+opQcfwXliahak5qnk2ZcL3nd/nKss2zF/JBUjFRhOQhtTmjlaYHsDIVU+axteHwkBtig5Mvk/BTQU0TgmKF8HcJMgxziGyRg+jCO7tADagM4hTaqY861/cfrkFgnYT5ZBJh8CowU1sU7r136+d7OLFWyFdPyGjyHD5pgnaMsSzr4dO+WHfPGoN1wPTzB/tVZSq3BUrXw6B5JtkiXeyvh7PeVueaQ1v9MSSpoY/ZZ2Nm9gYzwswAx8/GlCgE+bwmpksybq1Qd6/PUVtSjOI7DHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeaIVLJ/U0URc5+IeaLedxUp/mJcywcf0W1K34meTao=;
 b=sJb/rGfOsKPfRYTqop7h7nH3utMhuwHYTlrEvsLDUfBeN8k8KpuwydfyLyhi/mwVJMzu+f+WEM9UhMQo7cx5ICRG/Ze03YntfGDWFMtpeJo3tvM0wEzGDF/uAKfhaLn9HF9jNF1BuvVQdBjBMnbDhUy/PBkf881IatbbEtg2uzwFLw3pZ1gjYrTLBj6Sq2wGDStY1yun3jXyAfLbJFrr54X/SLkhcdLRlldWhBQdphY3svAUTkQB4zNOTdeKQDjd7nrHStY9p2v3Mdn2ltjAvwjl7rfbDuMnfqPY0vzF58kAnrxe6swodp2OTD9uzcUA4E4V9cUYu/YWLdo/2/LcZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeaIVLJ/U0URc5+IeaLedxUp/mJcywcf0W1K34meTao=;
 b=VqYYHaQcNlaoGf+mV4WnD98IGAoElUDf54suOpWrLJoaGhQbOi8UyAb0mom8JL4xJnMMs0NUben5F8m1fVUArMWBI5WY07dntPcnx0e+E/iQhWsuJXyxP/vnwcIJdjAXfL54E8snZSwXa1AXRcNc6X0lo05wx2jjzqqfWVNdiiOcmyToF0R5Rlumf8KsbDFmCWsV4qb1vLX2aKihMbd1YJGZmSZzMwzkazT9Xh8/BZzNzBMsXpb4obfcW+LLiyyrbBBKnRDUXb5F1Qoc3Q5NM/6YODFpOq+Rf5xTWAQsa/J3oDAg6Hyy2YNRIk4EM8F7SsquAYB0kbWT5gnUk8ECjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:27:32 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 02:27:32 +0000
From: David Cemin <dcemin@nvidia.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	xy-jackie@139.com,
	ikepanhc@gmail.com,
	i@rong.moe,
	marco_giunta@outlook.it,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ldemarchi@nvidia.com
Subject: [PATCH v2 3/3] platform/x86: ideapad-laptop: consume the Fn key events from the WMI hotkeys driver
Date: Wed, 18 Nov 2026 18:27:19 -0800
Message-ID: <20261119022719.3089229-4-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119022719.3089229-1-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <20261119022719.3089229-1-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0062.namprd04.prod.outlook.com
 (2603:10b6:303:6b::7) To CH0PR12MB5089.namprd12.prod.outlook.com
 (2603:10b6:610:bc::8)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fb003b-c93c-4cd3-6957-08df45e4aa65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261009223027099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	m5vb0h5ygNQLh8qE3NjrrFKx9tkpb+bmaZmzkwZHB4xPp1Xo7vtP+ZlOeRksg+LS/7dw8M74RvBlOSaRlhkAUaW/CSLYWj8G0SyeJQACBQXYFY1yRDb+6RfL0kG6ofpIptvdTY5gP8zI3ebrOclzm2hJ10xEmzB2xOzwdXyz2mEajapYuXFCtvLW0/MNcpSLM7KxDBTQxMq6x06xZmPDpnMKek5X5EIqfjcbyxRsnaXlj81vgdFcGfKDDS6aEC3slLV8hVGZDIrm0gAUnEhxqxUb8yv7R7mC/z4s1iUOSxpQU8QU2C/D2Tax6JiRLi7EXiq3I6CGBUmb+ghotB60vVjEMBZWoBonJBUQfXq2+4YdiydWejYqS4Bu4QVm/vC63teew8VrWWHZKIZNWAeRgFESWmQ9R7shEq3qWDoIEl0ZrutE7IU0bwIznta5GjWJ8prkPsDty6Ul03C620VjBlkFlfMcUjI6aZcIsNaYMeRey8wZKv1gkiDJVxtaKESjnxQVT8rmO8iM6mfAOG7ateBkJUya1x/mI+UldGVkaSnyZ8eEkFxD3FnT+MYHNfNXfSA8uHBAVXSIicLyAZazdM78nGfOvwdiIwUn65rtL9NB1V/hnBGsWECGmZ5EbMMAPXlicswg3c5FsjPIBs2aAtGY7/eHyQoZ5uNAjoztpws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pGG/PvLxYBnJxswEPaqUHwIOTuIn9De+s0vCh4bV7wy57M/oVIixmNXecE/1?=
 =?us-ascii?Q?wNWANIDshwbB2jUbSmgLyAPmzEBw54WpuVZn2/0I00t96bBXnaM/qvqKfXqS?=
 =?us-ascii?Q?ypy2ZMddO1wHvCU3T5dcidqSNQtZ2HTXlPZx8JNyeunv1j6dnclaAg0W6u1x?=
 =?us-ascii?Q?Iya7actk6srL9atTppPNq1ua4LlzavDdZOhPTCqgyaajgJ3hgQf7ZVSEIxPi?=
 =?us-ascii?Q?c4Z70x7THeODVABqoRFi7yOBId1r4dklAGrTo/dpHIYVq66ejS1IVmUgNFim?=
 =?us-ascii?Q?YyfyTGzZo0lHRj3rT9FcSlOIFmomNuHU8UdsgkBDiUphARiiP1AD01jVRzI4?=
 =?us-ascii?Q?4Il/1RHbQleZGRivsx/iJXcnBVVrcUDwHJdO7aUhEpl07/jdFj3aE7P1Rt0r?=
 =?us-ascii?Q?oW4BSHUYvepAXjjgsqG1c6Pa5Vumf8I50kC34RScV3KkVPjFT7IEbra8Qkq/?=
 =?us-ascii?Q?iR8H0oxVjpU8Nkq5yEZIRlz2vlWM7Kas9ndb+e4A8fB3AKauhnyYRggajjq3?=
 =?us-ascii?Q?Gw3Ka+zU77LJBFzSPtNuRpBXhfkGQG+apINUyd63z/+exdC2pZc4l7wHW4mX?=
 =?us-ascii?Q?S74vCOIm8CZNvCxTkFrJR95aZIPbtlKtNveL1XdIYaEydy3FCc05fRxYZdaS?=
 =?us-ascii?Q?SEgoiELOfJc1PMXcVomLShVzC1UM02cgSHN7sS77OjUuGOQbqlcl8jcoIhne?=
 =?us-ascii?Q?4q5rgdBWYYOCzuOdfGDVgwR6iXnE1FVn+NK9IHjTQpU6dWK4tTePYQPlcPgl?=
 =?us-ascii?Q?5ILl1CyCeqkXBtWkPFmneLFuj/8/b1LgOPh7XRuuqy4z++h2A1tHWa9iDGcA?=
 =?us-ascii?Q?Ry0XxwOEzRsbeOtmwHASo3RKsQuLmwHBirE+tWrVA3oY6RgaCJXvukRsrCid?=
 =?us-ascii?Q?GUAfLnrvErexHr6MhKqD3zYTWtS8wVL6GDyCtUD4DatLp+4hP7z5JpgMZrMD?=
 =?us-ascii?Q?qBw3jJSRV2psLnHG7C1BJfl8Jtct8t0ayP1jytBK+SSb7wa/zK1ilmCh7z5+?=
 =?us-ascii?Q?MBv9sACq3AYd4RoioD1sV84tb9LKUzed590HQVTPvUciFIh1/O6N/x45qrYP?=
 =?us-ascii?Q?7feWzPn6evwVdUo0u/qkV/KpFc1yBlu08w8cyZCMRlMBEaj+t3DyHqSfoVsc?=
 =?us-ascii?Q?s49WyM8E8gsklKgd17RHiFX21KfXgPLk9um1yIDhpS51wXZ0AWEs27gw2RKk?=
 =?us-ascii?Q?FoISdrajFq6/JBLyjRR+FYbFIUmX8xSxpcqgOgOAUhHTgBPgvqEV58qPBWS/?=
 =?us-ascii?Q?mFJY9V8QF4b7y+gKYXBgw3tU6qmBb6h4qD8AXIUtOQqTftAmLKHLHEo1nhg/?=
 =?us-ascii?Q?mCLJCbna1ATlDxGG6h5z65rwjkfDCFv7GBSCBhTQ6A2NoYxlXovLXeuTo+p4?=
 =?us-ascii?Q?grcfjcbNG9i2mYcNPcEe8wCU22fNKFDWFRmnfvH0h+HEeNEPXMie8Z36c5ni?=
 =?us-ascii?Q?fELSnYjX+HuxIBpIuNK4mq1m9iW+q+rsRfwDH5cp77O0SbwKVChGPFpgEWWG?=
 =?us-ascii?Q?130jUq/gbVUrh20aktpBWTSiBEd4pm9Wvu6sOZtF/1hwfvvd2+o7Pm+/ug+g?=
 =?us-ascii?Q?+DkIA5bg/Jy0t8iNqVCtVei3iUR1/BPmMLtXWjQFDG3roXIXnKcLNDqGwKBk?=
 =?us-ascii?Q?9EZFIEm2vEJnsvVoT6mW86afDScCW19HVvFwCw5NbgnMpr4Nm9xLhcFmwAgY?=
 =?us-ascii?Q?JVUrfJ/5ILmCgTl90yy6/BmkbBku7G6ZZqoXqajVudOlP4E5/Q/EcnVEQmvq?=
 =?us-ascii?Q?vILJ32BFAw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fb003b-c93c-4cd3-6957-08df45e4aa65
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:27:32.4596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lvuu/uzJunIlV0umKdP5+x1p0c3GvLbPggECa8TrcYsp5Aunzev34/Q4uh22RcYWNcz6m84XrFYkTmEdBntEAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174

ideapad-laptop binds the Fn key and Fn+Esc WMI event GUIDs itself and
reports the keys through its own keymap, but the arm64 Lenovo laptops
expose the Fn key GUID without the VPC device this driver is built on,
and now have the lenovo-wmi-hotkeys driver reporting those keys on every
architecture.

Drop the WMI event driver from ideapad-laptop and subscribe to the
lenovo-wmi-hotkeys notifier instead. The notifier callback keeps the two
platform specific behaviours: it refreshes the Fn lock LED from the EC
on every event, and on the performance button (0x3d) it cycles the
platform profile through DYTC and returns NOTIFY_STOP so that no key is
reported, as before. All other key codes, the Fn+Esc events and the
camera lens cover switch are reported by lenovo-wmi-hotkeys with the
same key codes this driver used, so the WMI entries of the keymap are
dropped and ideapad-laptop no longer registers any WMI driver.

ideapad-laptop now depends on LENOVO_WMI_HOTKEYS being enabled or
disabled consistently; without it the Fn keys are not reported, as on a
kernel without ACPI_WMI.

Signed-off-by: David Cemin <dcemin@nvidia.com>
---
 drivers/platform/x86/lenovo/Kconfig          |   1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c | 225 ++++---------------
 2 files changed, 39 insertions(+), 187 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 4d9a25d0e3b5..25817e2f0e1a 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -12,6 +12,7 @@ config IDEAPAD_LAPTOP
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on ACPI_WMI || ACPI_WMI = n
+	depends on LENOVO_WMI_HOTKEYS || LENOVO_WMI_HOTKEYS = n
 	select ACPI_PLATFORM_PROFILE
 	select INPUT_SPARSEKMAP
 	select NEW_LEDS
diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index f9453de6df76..7461f4a59347 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -34,7 +34,7 @@
 #include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
-#include <linux/wmi.h>
+#include <linux/platform_data/x86/lenovo-wmi-hotkeys.h>
 #include "ideapad-laptop.h"
 
 #include <acpi/battery.h>
@@ -185,6 +185,7 @@ struct ideapad_private {
 	struct input_dev *inputdev;
 	struct backlight_device *blightdev;
 	struct ideapad_dytc_priv *dytc;
+	struct notifier_block hotkeys_nb;
 	struct dentry *debug;
 	struct acpi_battery_hook battery_hook;
 	const struct power_supply_ext *battery_ext;
@@ -1317,8 +1318,6 @@ static void ideapad_unregister_rfkill(struct ideapad_private *priv, int dev)
 /*
  * input device
  */
-#define IDEAPAD_WMI_KEY 0x100
-
 static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY,   7, { KEY_CAMERA } },
@@ -1331,65 +1330,6 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,  65, { KEY_PROG4 } },
 	{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
 	{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
-	{ KE_KEY, 128, { KEY_ESC } },
-
-	/*
-	 * WMI keys
-	 */
-
-	/* FnLock (handled by the firmware) */
-	{ KE_IGNORE,	0x02 | IDEAPAD_WMI_KEY },
-	/* Esc (handled by the firmware) */
-	{ KE_IGNORE,	0x03 | IDEAPAD_WMI_KEY },
-	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
-	{ KE_KEY,	0x01 | IDEAPAD_WMI_KEY, { KEY_FAVORITES } },
-	{ KE_KEY,	0x04 | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
-	/* Lenovo Support */
-	{ KE_KEY,	0x07 | IDEAPAD_WMI_KEY, { KEY_HELP } },
-	{ KE_KEY,	0x0e | IDEAPAD_WMI_KEY, { KEY_PICKUP_PHONE } },
-	{ KE_KEY,	0x0f | IDEAPAD_WMI_KEY, { KEY_HANGUP_PHONE } },
-	/* Refresh Rate Toggle (Fn+R) */
-	{ KE_KEY,	0x10 | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
-	/* Dark mode toggle */
-	{ KE_KEY,	0x13 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
-	/* Sound profile switch */
-	{ KE_KEY,	0x12 | IDEAPAD_WMI_KEY, { KEY_PROG2 } },
-	/* Lenovo Virtual Background application */
-	{ KE_KEY,	0x28 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
-	/* Lenovo Support */
-	{ KE_KEY,	0x27 | IDEAPAD_WMI_KEY, { KEY_HELP } },
-	/* Refresh Rate Toggle */
-	{ KE_KEY,	0x0a | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
-	/* Specific to some newer models */
-	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
-	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
-	/* Star- (User Assignable Key) */
-	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
-	/* Eye */
-	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
-	/* Lenovo Smart Connect */
-	{ KE_KEY,	0x48 | IDEAPAD_WMI_KEY, { KEY_LINK_PHONE } },
-	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
-	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
-	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile */
-	{ KE_KEY,	0x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
-	/* shift + prtsc */
-	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
-	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
-	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
-
-	/*
-	 * WMI switches
-	 *
-	 * Some devices come with physical switches. Whenever a switch is
-	 * toggled, an WMI event is emitted to inform the software about the
-	 * switch's latest state.
-	 */
-
-	/* Camera switch */
-	{ KE_SW,	0x0c | IDEAPAD_WMI_KEY, .sw = { SW_CAMERA_LENS_COVER, 0 } },
-	{ KE_SW,	0x0d | IDEAPAD_WMI_KEY, .sw = { SW_CAMERA_LENS_COVER, 1 } },
-
 	{ KE_END },
 };
 
@@ -2297,123 +2237,52 @@ static int ideapad_check_features(struct ideapad_private *priv)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_ACPI_WMI)
+#if IS_ENABLED(CONFIG_LENOVO_WMI_HOTKEYS)
 /*
- * WMI driver
+ * The vendor specific Fn keys arrive as WMI events owned by the Lenovo WMI
+ * hotkeys driver, which reports them as input events. Subscribe to act on the
+ * ones that touch the VPC state: the Fn lock LED and the performance mode
+ * button, which cycles the platform profile through DYTC instead of
+ * reporting a key.
  */
-enum ideapad_wmi_event_type {
-	IDEAPAD_WMI_EVENT_ESC,
-	IDEAPAD_WMI_EVENT_FN_KEYS,
-};
-
-struct ideapad_wmi_private {
-	enum ideapad_wmi_event_type event;
-};
-
-static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
-{
-	struct ideapad_wmi_private *wpriv;
-
-	wpriv = devm_kzalloc_obj(&wdev->dev, *wpriv);
-	if (!wpriv)
-		return -ENOMEM;
-
-	*wpriv = *(const struct ideapad_wmi_private *)context;
-
-	dev_set_drvdata(&wdev->dev, wpriv);
-	return 0;
-}
-
-static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
+static int ideapad_hotkeys_notify(struct notifier_block *nb, unsigned long code,
+				  void *data)
 {
-	struct ideapad_wmi_private *wpriv = dev_get_drvdata(&wdev->dev);
-	struct ideapad_private *priv;
-
-	guard(mutex)(&ideapad_shared_mutex);
-
-	priv = ideapad_shared;
-	if (!priv)
-		return;
+	struct ideapad_private *priv = container_of(nb, struct ideapad_private, hotkeys_nb);
 
-	switch (wpriv->event) {
-	case IDEAPAD_WMI_EVENT_ESC:
-		ideapad_input_report(priv, 128);
-		break;
-	case IDEAPAD_WMI_EVENT_FN_KEYS:
-		if (priv->features.set_fn_lock_led) {
-			int brightness = ideapad_fn_lock_get(priv);
+	if (priv->features.set_fn_lock_led) {
+		int brightness = ideapad_fn_lock_get(priv);
 
-			if (brightness >= 0) {
-				ideapad_fn_lock_set(priv, brightness);
-				ideapad_fn_lock_led_notify(priv, brightness);
-			}
+		if (brightness >= 0) {
+			ideapad_fn_lock_set(priv, brightness);
+			ideapad_fn_lock_led_notify(priv, brightness);
 		}
-
-		if (data->type != ACPI_TYPE_INTEGER) {
-			dev_warn(&wdev->dev,
-				 "WMI event data is not an integer\n");
-			break;
-		}
-
-		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
-			data->integer.value);
-
-		/* performance button triggered by 0x3d */
-		if (data->integer.value == 0x3d && priv->dytc) {
-			platform_profile_cycle();
-			break;
-		}
-
-		/* 0x02 FnLock, 0x03 Esc */
-		if (data->integer.value == 0x02 || data->integer.value == 0x03)
-			ideapad_fn_lock_led_notify(priv, data->integer.value == 0x02);
-
-		ideapad_input_report(priv,
-				     data->integer.value | IDEAPAD_WMI_KEY);
-
-		break;
 	}
-}
-
-static const struct ideapad_wmi_private ideapad_wmi_context_esc = {
-	.event = IDEAPAD_WMI_EVENT_ESC
-};
 
-static const struct ideapad_wmi_private ideapad_wmi_context_fn_keys = {
-	.event = IDEAPAD_WMI_EVENT_FN_KEYS
-};
+	dev_dbg(&priv->platform_device->dev, "WMI fn-key event: 0x%lx\n", code);
 
-static const struct wmi_device_id ideapad_wmi_ids[] = {
-	{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc }, /* Yoga 3 */
-	{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc }, /* Yoga 700 */
-	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys }, /* Legion 5 */
-	{},
-};
-MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
+	/* performance button triggered by 0x3d */
+	if (code == 0x3d && priv->dytc) {
+		platform_profile_cycle();
+		return NOTIFY_STOP;
+	}
 
-static struct wmi_driver ideapad_wmi_driver = {
-	.driver = {
-		.name = "ideapad_wmi",
-	},
-	.id_table = ideapad_wmi_ids,
-	.min_event_size = sizeof(u32),
-	.probe = ideapad_wmi_probe,
-	.notify = ideapad_wmi_notify,
-};
+	/* 0x02 FnLock, 0x03 Esc */
+	if (code == 0x02 || code == 0x03)
+		ideapad_fn_lock_led_notify(priv, code == 0x02);
 
-static int ideapad_wmi_driver_register(void)
-{
-	return wmi_driver_register(&ideapad_wmi_driver);
+	return NOTIFY_OK;
 }
 
-static void ideapad_wmi_driver_unregister(void)
+static int ideapad_hotkeys_register(struct ideapad_private *priv)
 {
-	return wmi_driver_unregister(&ideapad_wmi_driver);
-}
+	priv->hotkeys_nb.notifier_call = ideapad_hotkeys_notify;
 
+	return devm_lenovo_wmi_hotkeys_register_notifier(&priv->platform_device->dev,
+							 &priv->hotkeys_nb);
+}
 #else
-static inline int ideapad_wmi_driver_register(void) { return 0; }
-static inline void ideapad_wmi_driver_unregister(void) { }
+static inline int ideapad_hotkeys_register(struct ideapad_private *priv) { return 0; }
 #endif
 
 /*
@@ -2496,6 +2365,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 			dev_info(&pdev->dev, "DYTC interface is not available\n");
 	}
 
+	err = ideapad_hotkeys_register(priv);
+	if (err)
+		dev_warn(&pdev->dev, "Could not subscribe to the WMI hotkey events: %d\n", err);
+
 	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
 		err = ideapad_backlight_init(priv);
 		if (err && err != -ENODEV)
@@ -2600,31 +2473,9 @@ static struct platform_driver ideapad_acpi_driver = {
 	},
 };
 
-static int __init ideapad_laptop_init(void)
-{
-	int err;
-
-	err = ideapad_wmi_driver_register();
-	if (err)
-		return err;
-
-	err = platform_driver_register(&ideapad_acpi_driver);
-	if (err) {
-		ideapad_wmi_driver_unregister();
-		return err;
-	}
-
-	return 0;
-}
-module_init(ideapad_laptop_init)
-
-static void __exit ideapad_laptop_exit(void)
-{
-	platform_driver_unregister(&ideapad_acpi_driver);
-	ideapad_wmi_driver_unregister();
-}
-module_exit(ideapad_laptop_exit)
+module_platform_driver(ideapad_acpi_driver);
 
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_DESCRIPTION("IdeaPad ACPI Extras");
+MODULE_IMPORT_NS("LENOVO_WMI_HOTKEYS");
 MODULE_LICENSE("GPL");
-- 
2.56.1

