Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795055254;
	b=v7p2Rdkt/MoDFWOygfoGqKVdaUzs7CnA9qxCuNNoJ3oxkjnxYvGIsmqXrrxJ38eCDrfz
	 JpC9Hq2cDHiBffgmm0kfFhJVl7DD5O3c3XhNxf5XOg4I/ADZaqB7WE0ErYvSL/n3p+fO6
	 UFtYLTe2SRUApzFEt5hjKctZMVkEelZ+OZWBZtN6AfnEQLaYwW/ohGc4l0MjfMBOUIeAV
	 xcQY1tJ1E24IM3r1gcVgkvZ4BSc6oquFxbOHzZQTUNHWj7HvklOo8vp4CedopG/Pw5brZ
	 qaB37Zjhx4qGhoR8ac1GtYfGX7yiKBvLQqVUuDNPUPXyOQxYMk36nuVgKDMDLIEwrYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055254;
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
	bh=d9q6iLoWV5U3/6VYqLlaiAcXVq2p+Mg4xJWp3thxi/Y=;
	b=n9hO3BVWQjuokdxtcgMukBN1IlgqmB1Inw14wDOaa7yZkfSoRsal0Rca+/kKo2IFxxB9
	 MgizI9LOe+ArEV31Lg5x4JOKrch2g5y8VBca7+19qFW78f15NfHUnDveZ1rwV23aHiims
	 XuVtMWt/7624KEMfm4PtuiqSiHncTWa9uAyCItn8wvBXAPs6iQEuqr6PkAn4i9vjOHOG/
	 b7dk54ffZkgWpCesZs3ZXtUzMzv5JijlgLbcChPt7IDmkNE/0doJ53eEFjVIjbjVoHmeC
	 uOwVRKITSm0niX3i+qT9yTyQXChNzKsR0CsPCZdMal6Dr+WCQwolOFi3pRVgSr2ytzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jsU0Tiy9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.44
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013044.outbound.protection.outlook.com [40.93.196.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779BC60A262E;
	Thu, 19 Nov 2026 02:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779BC60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jsU0Tiy9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B54U2jXMdfnbsUP/NNpKCW3uTbOYaoiAffztqj3gaJVlCYZ62wZOPnU/yzD8jgbqH+EOKZfjC/B4xV8m29HWiGorMoAHvhZTEcZTDOhgY4pKEbLPO4DfQtqxpxp7z5jbJavOTIqLMYr31c1fZObCQIzmwxaVrUT1UcxzfqpcyvUbU8K7XoPWym2huDTbFvoys/+9gRxnVgEHfVMmC0wz7uWXVgR6uBzeOmI+WDgq7Vkaf5deNHM/LAzBudVNlKN16dKR+H1ryk2yiFOBTE+JPMVqf0YcOQ9ByJUihRSS4KitsOjEUXercAJIy9r2nbNBD0glmADlHTOjTIOMAPOeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9q6iLoWV5U3/6VYqLlaiAcXVq2p+Mg4xJWp3thxi/Y=;
 b=M8w55adDiNe+UDMXtw4IPVJ3RXBsCNjataYg3kWETobkTFYLVt1hwgpi5eOKX3X6NrPI8ZmxDJEPHJv1ZWsQrC09Bz7adhBpVGDJ5LnQYyubD/j4X0C7vr3gRIa8T3GSeIF4AXmtogW3/eFJwEvl/BAeAGqfbQRm7Xymzsw05S0KjEaeUsEqfE7JXLtMvoXw4Mb3hw2oL6fXDNORbQX047JkkYsu9yq23M4e86cL8Zb089TMYC+D/oloG4I22Q0+k7KRJ4QHhmmKDoL4i4nMOb6+MkVXiNWuVENkp5TboMvVU1lJxsy8rbD1qf5QjWnwLA5fxQrWwGmKyNKJNhVM2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9q6iLoWV5U3/6VYqLlaiAcXVq2p+Mg4xJWp3thxi/Y=;
 b=jsU0Tiy9Z2z90ZpLwpwrQD7tIWngmDKOBYNVKyfDXQ+ByOwhSJIKlnFF+UBKDACjBQmwaHvhQnLv5b4LL1crkjtTVqBIbnBBo1xkJYwfUwITRNKMWppUpJ8blYhUjbcQvPMPmkkrdV7lSr9veJAdraUoMxyFb63UREdHAunhx8rwLrUpyo7SLMXtA0WfHVt8Jv+KGkmsr1ruJF2O3s+eZuRHOaWxc28v8WIXgrcItNEtmaCfGRQuRQkujt+k4aUV0nxHcrD/K+QJHOk6XKtrV+XbNrpItmtTbVadHACXgD47dyqsKRcD/4D/UQ0gia6iByviXMCfHJZhxEdeirZfZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:27:30 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 02:27:30 +0000
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
Subject: [PATCH v2 2/3] platform: lenovo: add WMI hotkeys driver
Date: Wed, 18 Nov 2026 18:27:18 -0800
Message-ID: <20261119022719.3089229-3-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119022719.3089229-1-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <20261119022719.3089229-1-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:303:16d::27) To CH0PR12MB5089.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: a3bd61e4-5f56-4c92-7385-08df45e4a92c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|4022899009|23010399003|6133799003|261009223327099003|22082099003|18002099003|261009223027099003|261009221227099003|261009221727099003|261009220027099003|261022113327099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|11063799006|56012099006|5023799004|10067099003|4143699003|261102130727099003;
X-Microsoft-Antispam-Message-Info:
	1mjj70GcmKQSVb1dFrWXJhvsis1A6ZoJ0ypDKYHM+4uazBl98jJoDUbkAf0uRqiQyN28+aZXh7ps5+mHQ8NfIKRJ6vR3MH1MAwFIsZQjFaixM6NsjlJp+zrTvmPNF20jB8RlCyJ+H8qJAosAu5EiNfSE56smud3G3Atks8HSYKw3sqCWSV2prwPA6Rp4RV6w9zp+6vuzt1o+ONrTcfL9vpt/qBQaErle79lBwleGf4CyViWlJDSWdFN5JVpI8KNeekMmzLqc+jb9gVvsfuf5qJEBqwqqDaVCu4MW+g1HB7WE3gK/peb9G2wLP/TKvXhnJjiFSFXEDkMXEDNk/MAYC2AvRjBvT6kqrHV1mJ1GgnKfOePfVo1uqBrZEBo8nT2W2SWoJsUWEDs1kHHEtzQFlHufCuzVPsqDjduCiJ9z7OFopmloZPe01DONtowR4zG4JULCgVszZsWaiysS+mx/d7Zoy0MKZpFBHOSnjNn/O84C9CdHBT5aQYllXFsGGFHmyk7wvf/nv6UfUZ3KFDkCZ7+hKQlmzQqMAHM/JFspmMvUtytNS5eFCLp/EyD1/DVrySNDdAfB0N9NZBlQMujE94dZ3u+Fk5mNGOYgKQD6+ghA3O4uKTsiglF/XmCtSuu9/HrRRQX/FOKkZCK//D+TT491ujSOG0obBAeUB6pop9M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(4022899009)(23010399003)(6133799003)(261009223327099003)(22082099003)(18002099003)(261009223027099003)(261009221227099003)(261009221727099003)(261009220027099003)(261022113327099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(11063799006)(56012099006)(5023799004)(10067099003)(4143699003)(261102130727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xA69QVOm4WXhnWkyM9NOqV9tjWC0qBbTrbNRgeKgcmQ4QHQsqtUrc0v0qyYJ?=
 =?us-ascii?Q?S5/YVOJq7xDwtSMIplJjlqx1MBq4lWkoE4xGmSV7S/mXebRKxq3EBItcxMbE?=
 =?us-ascii?Q?SWK1Zb4kNKhQFL7x4zUBcoVAR+ec2lGgCZ9ZEKw7Qb7Osz89j2Z0FBPC6M+K?=
 =?us-ascii?Q?j7qt9HbPUekV9LNFL9zmEox2BxNNwirHhzkJXkmOHvhBiq2YzA7od3z2csG+?=
 =?us-ascii?Q?AuoOsk8+7Bkdvb2JpPJhcKwvltZQwco4QZyDAPNdOXaJVS/WwxQwhFMMoTzF?=
 =?us-ascii?Q?V2ojV6M/KEayiwYK76qHZ66T2+557mT/oQ2qAVrTRMYYj9Ct4fd6/uMcegIP?=
 =?us-ascii?Q?7dSHIYX11poA41crAuFlahPWZeIB94QYueAfu4sTiT8KZN0XqAZ44e7Ge6Ni?=
 =?us-ascii?Q?xPsqmcYrd4BFW24zvF2PBReBtloxXOfWNpPyRq2RyT7fRbqep2yGVJFoMpXY?=
 =?us-ascii?Q?6XJsxsHO2uXy7YwU71um1oTEeCqeYzRmaV4KwZqKUyLbKiwklvSVpC5DnL91?=
 =?us-ascii?Q?z7KTpUKIoOaBz6KR2kQW4mlGb7IYgj5AeHc6L8kClwEX40+SBPDlz8IQmJ6Q?=
 =?us-ascii?Q?NmULC00onyHt0Q+6Fy0YjtoNeLOZ8M8FX6KNkNTJDI3KU2v6TWRyX0sQCdr4?=
 =?us-ascii?Q?ACxlk5IdyBdPWUnxmluPDfuk7cedcgi1SPtt/PWJf0+RaCpIfYzfZCX9Dejj?=
 =?us-ascii?Q?GiopC45Ivk+JH8G0zTEwIrmNpfaUSemm+LRK17oKFct+u72DPO9/M/zeT+Xo?=
 =?us-ascii?Q?O+5hDBRYsZ5B7tZAiLU4JgFhQvTuaWKalIn60XUl5aX2cMJUdmTER1cZGoKH?=
 =?us-ascii?Q?vW6HtGTH0umRIZH5mJd4x+RWS2Sf3J0rojyhs2HEXan9fvgDoaISnm4m6+zH?=
 =?us-ascii?Q?rmnVWOWHMu3Ido8TLKwXdEJpAF6tIO9DUpiIKnnbCZMx9TA84577Fv2VqtHB?=
 =?us-ascii?Q?7RVXa9oVae6pr3F+piuTCaHYLORFVE7bI1Amkxh6ZWAWG1KKkdsAZ+H0/D0J?=
 =?us-ascii?Q?JqGYgvE/wMr12aZGsFA9VjL4ewB3QIlxWfncfgrOrnj+F0liu0ScEFWZOR1L?=
 =?us-ascii?Q?eUouTQ4hfaL5TduHRVJuXhzVFnT2/fqYpMVuXOndYStkfYQtwlxrw9c1jXbc?=
 =?us-ascii?Q?agVHLFG9l52PTbwYT8OG6FS5mRSdi3GpixWta3kzyNkX+OEXW86S1dMsux0V?=
 =?us-ascii?Q?W52SqPbEm1OuIiBXCFqYpetyS/yQOnSnDPREhKHEthwq87vRV96+GpGTY2jV?=
 =?us-ascii?Q?iQRj1qnexw2yncn95r0xxIpbCU6IX2rH8NXhRE3HZiBxHNKxntJ5CzlhWljC?=
 =?us-ascii?Q?YJMiXvKbgBJmtjp19o4I+RrGb+3I4/Dg1JBA/VhhYRIsuFpVPtliWbXvsiyX?=
 =?us-ascii?Q?re/HP2+JV+7ikHuqBoQRUhA3wq7zfMYhfMaqSwAiaz+zWzfG1cJgVV+ip7O5?=
 =?us-ascii?Q?OCqCypzLN0q+4r2qALYlEUF1dPwfH5W2lcQFQMeobMvNOo74Lx11ufG4EXsJ?=
 =?us-ascii?Q?1IUihrT48ZRmavGaRAgBfWNXZcugtDWFxd9Q3E+3QJJCQlfN0yK3jSOysAUQ?=
 =?us-ascii?Q?QeprMVzybRgJuv7o3QNvWmwKvDaqrZnl2v1ihEL7+N7onpulzW1ElFcD8+t+?=
 =?us-ascii?Q?mhFVo+G9pCUMYPVTjKGd5D7feHPrZ+sPgMKZGSySuJNiBm8mV+Ssz/dDku1j?=
 =?us-ascii?Q?uzsER52q9DOlj6NXY2XpMll+Dcw6EqfSI9A0PjlOvJN1ihgwHz8xb2ohl3SX?=
 =?us-ascii?Q?saP6GNYF+w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bd61e4-5f56-4c92-7385-08df45e4a92c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:27:30.4222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zl+VC2Dywq8icIOUboC514nWGEj/DcEn6c1hXre5KsPvAQ/u6VKXFBz4jGNzXIlEHaOVpIH0L17weWRWxmiQ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174

Lenovo consumer laptops deliver their vendor specific Fn keys (microphone
mute, airplane mode, performance mode, the Smart Key, Smart Connect and
others) as WMI events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294
instead of keyboard usages, and the Yoga 3 and Yoga 700 generations
report Fn+Esc on two dedicated event GUIDs that carry no data. On x86
ideapad-laptop consumes these events together with the IdeaPad VPC
device; that driver depends on i8042 and the VPC, neither of which exist
on the ACPI based arm64 models, so the keys do nothing there.

Add a small WMI driver that owns these event GUIDs on every architecture
and reports the keys through a sparse keymap, using the key codes
ideapad-laptop has used for them, including code 128 for the Fn+Esc
events. The input device keeps the ideapad-laptop name so that the
existing hwdb mappings for these keys continue to apply.

Drivers with platform knowledge can subscribe to a notifier chain that
is called with the event code before the key is reported; a subscriber
that handles the event itself returns NOTIFY_STOP and no key is
reported. ideapad-laptop uses this for the Fn lock LED and the
performance mode button, which cycles the platform profile instead of
producing a key.

The camera lens cover switch (events 0x0c and 0x0d) is reported as
SW_CAMERA_LENS_COVER, as ideapad-laptop does today.

Tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone mute, airplane
mode, the Smart Key, the Smart Connect key and the Fn+Q performance key
report input events. The Esc event GUIDs are not exposed by that
firmware, so that path is compile tested only.

Signed-off-by: David Cemin <dcemin@nvidia.com>
---
 MAINTAINERS                                   |   7 +
 drivers/platform/lenovo/Kconfig               |  14 +
 drivers/platform/lenovo/Makefile              |   1 +
 drivers/platform/lenovo/wmi-hotkeys.c         | 244 ++++++++++++++++++
 .../platform_data/x86/lenovo-wmi-hotkeys.h    |  28 ++
 5 files changed, 294 insertions(+)
 create mode 100644 drivers/platform/lenovo/wmi-hotkeys.c
 create mode 100644 include/linux/platform_data/x86/lenovo-wmi-hotkeys.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b0ad5a3debe..1d5b08c033b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15173,6 +15173,13 @@ F:	Documentation/wmi/devices/lenovo-wmi-other.rst
 F:	drivers/platform/lenovo/
 F:	drivers/platform/x86/lenovo/*
 
+LENOVO WMI HOTKEYS DRIVER
+M:	David Cemin <dcemin@nvidia.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/lenovo/wmi-hotkeys.c
+F:	include/linux/platform_data/x86/lenovo-wmi-hotkeys.h
+
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/lenovo/Kconfig b/drivers/platform/lenovo/Kconfig
index 8222322ca671..2810c995ee8c 100644
--- a/drivers/platform/lenovo/Kconfig
+++ b/drivers/platform/lenovo/Kconfig
@@ -41,6 +41,20 @@ config LENOVO_WMI_HOTKEY_UTILITIES
 	  such as LED control for audio/mic mute event for Ideapad, YOGA, XiaoXin,
 	  Gaming, ThinkBook and so on.
 
+config LENOVO_WMI_HOTKEYS
+	tristate "Lenovo WMI hotkeys driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	help
+	  Say Y or M here to enable the vendor specific Fn keys (microphone
+	  mute, airplane mode, performance mode, star key, Fn+Esc) on Lenovo
+	  laptops that deliver them as WMI events. ideapad-laptop subscribes
+	  to this driver for its Fn lock LED and performance mode handling.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-wmi-hotkeys.
+
 config LENOVO_WMI_CAMERA
 	tristate "Lenovo WMI Camera Button driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/lenovo/Makefile b/drivers/platform/lenovo/Makefile
index 1cac115dd735..d3f5e3ac14c2 100644
--- a/drivers/platform/lenovo/Makefile
+++ b/drivers/platform/lenovo/Makefile
@@ -8,6 +8,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
 lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
 lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+= wmi-capdata.o
 lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
+lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEYS)	+= wmi-hotkeys.o
 lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
 lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
 lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+= wmi-other.o
diff --git a/drivers/platform/lenovo/wmi-hotkeys.c b/drivers/platform/lenovo/wmi-hotkeys.c
new file mode 100644
index 000000000000..f412652e9f72
--- /dev/null
+++ b/drivers/platform/lenovo/wmi-hotkeys.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Lenovo WMI hotkeys driver
+ *
+ * Lenovo consumer laptops deliver their vendor specific Fn keys (microphone
+ * mute, airplane mode, performance mode, the star key and others) as WMI
+ * events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 instead of keyboard
+ * usages, and the older Yoga models report Fn+Esc on two dedicated event
+ * GUIDs that carry no data. This driver owns these event GUIDs on every
+ * architecture and reports the keys through a sparse keymap. Drivers with
+ * platform knowledge, such as ideapad-laptop, subscribe to the notifier chain
+ * to act on an event and may stop the key from being reported.
+ *
+ * The key codes follow the mapping historically used by ideapad-laptop.
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_data/x86/lenovo-wmi-hotkeys.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include <asm/byteorder.h>
+
+#define LENOVO_FN_KEYS_WMI_GUID	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
+/* Fn+Esc on the Yoga 3 and Yoga 700 generations, no event data */
+#define LENOVO_ESC_WMI_GUID_YOGA3	"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6"
+#define LENOVO_ESC_WMI_GUID_YOGA700	"56322276-8493-4CE8-A783-98C991274F5E"
+
+/*
+ * The Esc event GUIDs carry no key code; they are reported under
+ * LENOVO_WMI_HOTKEYS_ESC_CODE, the code ideapad-laptop has always used for
+ * them, so the existing hwdb mappings keep applying. The Fn key GUID codes
+ * are all below 0x80.
+ */
+
+enum lenovo_wmi_hotkeys_type {
+	LENOVO_WMI_HOTKEYS_FN_KEYS,
+	LENOVO_WMI_HOTKEYS_ESC,
+};
+
+static const enum lenovo_wmi_hotkeys_type lenovo_wmi_hotkeys_fn_keys = LENOVO_WMI_HOTKEYS_FN_KEYS;
+static const enum lenovo_wmi_hotkeys_type lenovo_wmi_hotkeys_esc = LENOVO_WMI_HOTKEYS_ESC;
+
+static BLOCKING_NOTIFIER_HEAD(lenovo_wmi_hotkeys_chain);
+
+static const struct key_entry lenovo_wmi_hotkeys_keymap[] = {
+	/* Fn+Esc from the Esc event GUIDs */
+	{ KE_KEY, LENOVO_WMI_HOTKEYS_ESC_CODE, { KEY_ESC } },
+	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
+	{ KE_KEY, 0x01, { KEY_FAVORITES } },
+	/* Fn lock toggled on / off, handled by the firmware */
+	{ KE_IGNORE, 0x02 },
+	/* Esc, handled by the firmware */
+	{ KE_IGNORE, 0x03 },
+	{ KE_KEY, 0x04, { KEY_SELECTIVE_SCREENSHOT } },
+	/* Lenovo Support */
+	{ KE_KEY, 0x07, { KEY_HELP } },
+	/* Refresh Rate Toggle */
+	{ KE_KEY, 0x0a, { KEY_REFRESH_RATE_TOGGLE } },
+	/* Camera lens cover closed / opened */
+	{ KE_SW, 0x0c, .sw = { SW_CAMERA_LENS_COVER, 0 } },
+	{ KE_SW, 0x0d, .sw = { SW_CAMERA_LENS_COVER, 1 } },
+	{ KE_KEY, 0x0e, { KEY_PICKUP_PHONE } },
+	{ KE_KEY, 0x0f, { KEY_HANGUP_PHONE } },
+	/* Refresh Rate Toggle (Fn+R) */
+	{ KE_KEY, 0x10, { KEY_REFRESH_RATE_TOGGLE } },
+	/* Sound profile switch */
+	{ KE_KEY, 0x12, { KEY_PROG2 } },
+	/* Dark mode toggle */
+	{ KE_KEY, 0x13, { KEY_PROG1 } },
+	/* Lenovo Support */
+	{ KE_KEY, 0x27, { KEY_HELP } },
+	/* Lenovo Virtual Background application */
+	{ KE_KEY, 0x28, { KEY_PROG3 } },
+	{ KE_KEY, 0x29, { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_KEY, 0x2a, { KEY_ROOT_MENU } },
+	/* Shift + PrtSc */
+	{ KE_KEY, 0x2d, { KEY_SELECTIVE_SCREENSHOT } },
+	/* Performance mode toggle, Fn+Q */
+	{ KE_KEY, 0x3d, { KEY_PERFORMANCE } },
+	{ KE_KEY, 0x3e, { KEY_MICMUTE } },
+	{ KE_KEY, 0x3f, { KEY_RFKILL } },
+	/*
+	 * Keyboard backlight level after Fn+Space, handled by the firmware:
+	 * 0x40 off, 0x41 low, 0x42 high, 0x43 also seen
+	 */
+	{ KE_IGNORE, 0x40 },
+	{ KE_IGNORE, 0x41 },
+	{ KE_IGNORE, 0x42 },
+	{ KE_IGNORE, 0x43 },
+	/* Star, user assignable key */
+	{ KE_KEY, 0x44, { KEY_PROG1 } },
+	/* Eye care */
+	{ KE_KEY, 0x45, { KEY_PROG3 } },
+	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile */
+	{ KE_KEY, 0x46, { KEY_PROG4 } },
+	/* Lenovo Smart Connect */
+	{ KE_KEY, 0x48, { KEY_LINK_PHONE } },
+	{ KE_END },
+};
+
+struct lenovo_wmi_hotkeys {
+	struct input_dev *input;
+	enum lenovo_wmi_hotkeys_type type;
+};
+
+/**
+ * lenovo_wmi_hotkeys_register_notifier() - Subscribe to the hotkey events.
+ * @nb: The notifier_block to register.
+ *
+ * The callback runs in process context with the WMI event code as the
+ * action. Return NOTIFY_STOP from the callback to consume the event.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int lenovo_wmi_hotkeys_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&lenovo_wmi_hotkeys_chain, nb);
+}
+EXPORT_SYMBOL_NS_GPL(lenovo_wmi_hotkeys_register_notifier, "LENOVO_WMI_HOTKEYS");
+
+/**
+ * lenovo_wmi_hotkeys_unregister_notifier() - Unsubscribe from the hotkey events.
+ * @nb: The notifier_block to unregister.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int lenovo_wmi_hotkeys_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&lenovo_wmi_hotkeys_chain, nb);
+}
+EXPORT_SYMBOL_NS_GPL(lenovo_wmi_hotkeys_unregister_notifier, "LENOVO_WMI_HOTKEYS");
+
+static void devm_lenovo_wmi_hotkeys_unregister_notifier(void *data)
+{
+	lenovo_wmi_hotkeys_unregister_notifier(data);
+}
+
+/**
+ * devm_lenovo_wmi_hotkeys_register_notifier() - Device managed subscription.
+ * @dev: The device whose lifetime bounds the subscription.
+ * @nb: The notifier_block to register.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int devm_lenovo_wmi_hotkeys_register_notifier(struct device *dev,
+					      struct notifier_block *nb)
+{
+	int ret;
+
+	ret = lenovo_wmi_hotkeys_register_notifier(nb);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_lenovo_wmi_hotkeys_unregister_notifier, nb);
+}
+EXPORT_SYMBOL_NS_GPL(devm_lenovo_wmi_hotkeys_register_notifier, "LENOVO_WMI_HOTKEYS");
+
+static int lenovo_wmi_hotkeys_probe(struct wmi_device *wdev, const void *context)
+{
+	struct lenovo_wmi_hotkeys *priv;
+	int ret;
+
+	priv = devm_kzalloc_obj(&wdev->dev, *priv);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->type = *(const enum lenovo_wmi_hotkeys_type *)context;
+
+	priv->input = devm_input_allocate_device(&wdev->dev);
+	if (!priv->input)
+		return -ENOMEM;
+
+	/*
+	 * Same name as the ideapad-laptop input device so that the existing
+	 * hwdb keyboard mappings for these keys keep applying.
+	 */
+	priv->input->name = "Ideapad extra buttons";
+	priv->input->phys = priv->type == LENOVO_WMI_HOTKEYS_ESC ? "wmi/input1" : "wmi/input0";
+	priv->input->id.bustype = BUS_HOST;
+	priv->input->dev.parent = &wdev->dev;
+
+	ret = sparse_keymap_setup(priv->input, lenovo_wmi_hotkeys_keymap, NULL);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(&wdev->dev, priv);
+
+	return input_register_device(priv->input);
+}
+
+static void lenovo_wmi_hotkeys_notify(struct wmi_device *wdev, const struct wmi_buffer *buf)
+{
+	struct lenovo_wmi_hotkeys *priv = dev_get_drvdata(&wdev->dev);
+	u32 code;
+	int ret;
+
+	if (priv->type == LENOVO_WMI_HOTKEYS_ESC) {
+		code = LENOVO_WMI_HOTKEYS_ESC_CODE;
+	} else {
+		if (buf->length < sizeof(u32)) {
+			dev_dbg(&wdev->dev, "short hotkey event (%zu bytes)\n", buf->length);
+			return;
+		}
+		code = le32_to_cpup(buf->data);
+	}
+
+	dev_dbg(&wdev->dev, "hotkey event 0x%x\n", code);
+
+	ret = blocking_notifier_call_chain(&lenovo_wmi_hotkeys_chain, code, NULL);
+	if (ret & NOTIFY_STOP_MASK)
+		return;
+
+	if (!sparse_keymap_report_event(priv->input, code, 1, true))
+		dev_info_ratelimited(&wdev->dev, "unknown hotkey event 0x%x\n", code);
+}
+
+static const struct wmi_device_id lenovo_wmi_hotkeys_id_table[] = {
+	{ LENOVO_FN_KEYS_WMI_GUID, &lenovo_wmi_hotkeys_fn_keys },
+	{ LENOVO_ESC_WMI_GUID_YOGA3, &lenovo_wmi_hotkeys_esc },
+	{ LENOVO_ESC_WMI_GUID_YOGA700, &lenovo_wmi_hotkeys_esc },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, lenovo_wmi_hotkeys_id_table);
+
+static struct wmi_driver lenovo_wmi_hotkeys_driver = {
+	.driver = {
+		.name = "lenovo-wmi-hotkeys",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = lenovo_wmi_hotkeys_id_table,
+	.probe = lenovo_wmi_hotkeys_probe,
+	.notify_new = lenovo_wmi_hotkeys_notify,
+	.no_singleton = true,
+};
+module_wmi_driver(lenovo_wmi_hotkeys_driver);
+
+MODULE_DESCRIPTION("Lenovo WMI hotkeys driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/x86/lenovo-wmi-hotkeys.h b/include/linux/platform_data/x86/lenovo-wmi-hotkeys.h
new file mode 100644
index 000000000000..cf07eb00f3bb
--- /dev/null
+++ b/include/linux/platform_data/x86/lenovo-wmi-hotkeys.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Lenovo WMI hotkeys driver, notifier interface for drivers that want to act
+ * on the vendor specific Fn key events before a key is reported.
+ */
+
+#ifndef _LENOVO_WMI_HOTKEYS_H_
+#define _LENOVO_WMI_HOTKEYS_H_
+
+struct device;
+struct notifier_block;
+
+/* Code reported for the Fn+Esc event GUIDs, as ideapad-laptop always did */
+#define LENOVO_WMI_HOTKEYS_ESC_CODE	128
+
+/*
+ * Notifier callbacks receive the WMI event code as the action and no data:
+ * the Fn key code from the Fn key event GUID, or LENOVO_WMI_HOTKEYS_ESC_CODE
+ * for the Fn+Esc event GUIDs, which carry none. A callback that handles the
+ * event itself returns NOTIFY_STOP to suppress the input report; NOTIFY_OK or
+ * NOTIFY_DONE let it through.
+ */
+int lenovo_wmi_hotkeys_register_notifier(struct notifier_block *nb);
+int lenovo_wmi_hotkeys_unregister_notifier(struct notifier_block *nb);
+int devm_lenovo_wmi_hotkeys_register_notifier(struct device *dev,
+					      struct notifier_block *nb);
+
+#endif /* _LENOVO_WMI_HOTKEYS_H_ */
-- 
2.56.1

