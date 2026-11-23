Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475437;
	b=e7Dx9jVQEFaXEQJJVc8P3bhWh/WonptJJO19fD6CcRn1UVc8JtChUPIj/skuHjUpVuqA
	 YfyvmNNAiw8oE9TqEe8kafR0MQ1gNAhlNYJjw0b6b/GIJpDx8sH63hD28ldYCYF87n+vJ
	 JIFuLPr7iiYjoxo8hpB5YwL3BPJUIblu+3WmMz8aposrfpaxvcGVfC9vGqHkSjuiMz/sF
	 SYYbr3U6Bj8G96WEJ9IpDKd3aaYb1IxNAE9W2chARWlE0pNyM0+1wlx1Zauij5V5kTdeF
	 WEKjsfO0dyp2MIym3lNvxLP/QkQvDk3jrPdKMX5OzdgwCBsLuCZ/TMFyn1vSvB+9QWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475437;
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
	bh=CEuUqEpgS5a0Us45lFWTVnNuj6IQc7+0kB04ZvoGIDI=;
	b=cafLXO6Yor9Gzuxwe/cdz7YzfKKC0grcMEvRcYni8PofeZD9/3+u8lOlxK6leX9hj+sI
	 4z6sgZ3iBnvQ7z6Ok9idWd8BHjV8E+EHovSFixynrKl4Sxk2WPj6R5ORuoxqs4kDoe9P9
	 Bnt3yuYKHTwr+x8KopkpJhFJTCbbwSb8APnu6Pu6IPyME1ZSrxEcSSge8gIIwntNUmFn0
	 2ia03W+3hzRZg8YmfGMtw/ufYspU+Az/DwPgCatbFssl3bzdg5cHWYWa9iBh8BdRMMstq
	 e0p/9o/TkzuF8xo+7cQoZInDtCsgTpeNqY20QMbR435JLIrqT2OLKpkSigtiPYxYbFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GIhVt1V6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916DC606A33F;
	Mon, 23 Nov 2026 23:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 916DC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GIhVt1V6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHRBTfPP7X6nNA4VKA0wUaMmCsE0X5atbloiZttXSC4Nx6ZoyjTs0msSfLKwLHE4UbO3HNg+f+0okOhrI+zf4XDKTmUI4ZPI/HOHPP/RJWvISZ+0BGj5vRwRHAs4ba8WZZMgHYwqOpf0vZyy/4eEXMDNe01b7q0kc/Jvu7hyRSlXEm+GzgsmA0qMppAR3cIHcvlyK4qu8HHWKCBXmBR8mIx9Yk/48MXO9tM+Mdl9gfgP40MnealN+h4GzcYpkfrtWJAVrHL/rY7GgeGJKwcWkYhw8HCORtQuVdCh+nxgy2hc/THV25ymQOeYRwZOtg84Y3fqBtrqfwmB73mg6YbJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEuUqEpgS5a0Us45lFWTVnNuj6IQc7+0kB04ZvoGIDI=;
 b=K0B9vw9zmyO3mqHpYWzfPNtB4UcmeAWGxpF3NHlumRx12hf2IBa2yiIqUAWVHAA+Dp5COvBueZ3jPQeaaC49aj+720EfRLA2Yf8zNGGxDWB17sIj003/sU054SMCdw0LK6PHZ9PXTbkAR2piKyivvhBc62dvXFPAaltGR6t5hUuhP+HZGYlWE7Qh1P4lGQI5KY5+oloVw+8zqyVdmvoVs7bUzNZnYglJGUpShJwA69DLoZJxYiclC/YrPHOYAPDxKM3M4oz+Ktd1tHi8YwGu0PgGub175x8pQJ8NH0JcVZ81jsCsxvJBwmshlld1AoeM61V3Zs+jNliBnAv/bO+ibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEuUqEpgS5a0Us45lFWTVnNuj6IQc7+0kB04ZvoGIDI=;
 b=GIhVt1V6aME90i7t1mojbzgOmdITVDWytDBp1BUt5fS6qC1hn0OwFq0ELRidZrNhADJ1gmBv0qEM5cgluTfBIs8GAxutnBvuGocDfEUoWrryn5N048kHkfitqkCSxSZUU6B6H3e8dY5sVOW8j5jnzuHFvmmmwgGUTxytK6CCXWj33HkFoy8Tn6Xla3vEwacj7Pnh6nNetfswjszhSmvKDAqGvRPw2A4ePF8h7OefbT0la8092gIPg5lQuP7LB8S19LXW4GViPSP2Ev3XNiXwPvTqRbzafhOAISqiHuiCd0FvX31ORh9zd8UTGOeZ6xZJg26G3E29J+doc+Y8QQKGcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:10:16 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:10:16 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: David Cemin <dcemin@nvidia.com>,
	Lucas De Marchi <ldemarchi@nvidia.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Mak <bmak@nvidia.com>
Subject: [PATCH v2 07/10] platform: dell: smbios-wmi: Fix probe on RTX Spark
Date: Mon, 23 Nov 2026 15:08:58 -0800
Message-ID: <20261123230905.13899-8-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123230905.13899-1-bmak@nvidia.com>
References: <20261123230905.13899-1-bmak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MN0PR12MB5786.namprd12.prod.outlook.com
 (2603:10b6:208:375::13)
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
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 321f7d69-3192-4eb8-9ff8-08df49b6eed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261022075727099003|261022105027099003|261026140227099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IwRvueP0xCjwxRYhFcnswVvAxsTSoB9YRqyWwYUKcdlbRY+IIpaXuTwbmgnccqcnE58JyI0hVdo2/yIAa7qX/eVjzW1MJ14CNH/0vNzcSnFwy1PjyErJes27uDCSUJ3VT1xbLaMImLoJIV8jlPcWtM8jK7W1czpc7Nu5B4DzuRV3PJmJPO0Ia2arv9zgrslpl1ryD1tP/EFX53dZRqMf/f4V9wx6WlShPXNsfE53OHV8ELKLrt3J1RePQo7+2VAPu1UmFN+CHcko/lHrbWy8/YvxiMWT7mrldXZ0e4pBcA1WEF3GbQpAf7ZQJtqSupKb7CSQyYEKisJ7PnqOfTqM8FLRl4RP6TcYRCuOEpZtrQZeitAoAqknk2NGIdt2GMjGvRUMl8HZOtER0gs5DB4+74F/ZwfUDDSbcH7fUUL39/u9KETAvJI/ypT144SP62aGbU/Br8a4lykBrohklX1yEYQMLlEdCQ7OmK7CwLs9g+6FB1pdRVSqzfb+YtKyAnxTXeDFATLflSCfAQ2BZQdurjCYfMGVYD5MlsfAT4RKpCGK66od85XjbivDpTyISGCE0UadfzPha5ZMYIzGAkMEc13wcGEokQoTD2StIZNor0VF1s2lVcFIBEii32dgHOxEQD6YYSUjYyYgUqizTZHCpCfrLO+Dl08bC1wJeuzKTU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cTaEVrb5cmMm4hWbvITWfgv/1blo8ROK03ufhtw64xL/zflxnqqvpvm7EKr8?=
 =?us-ascii?Q?WeWgxjbOPDsJktixDJq6EZGNKR6f72c/sB6XAUWno9iBe/imEJ52eBOgASF3?=
 =?us-ascii?Q?VO1dUzR7YEbKrZZ8zf9nBV1TfaPIiUh74Fd2k2F9KNwx4xoO4ezs2u1HiGC5?=
 =?us-ascii?Q?7jmAxC4TUvvZIx9P9rgav7CJQgUanr6Ka5ltEY5r7GEIxrVwBHxeUxUmBjmg?=
 =?us-ascii?Q?4s9WtI/oT6OV2UwhZjAESWY4HZZ9jy32FYs8i+/P3z2g3LkWoMDZ1d7YoJbT?=
 =?us-ascii?Q?EVxIZcbt1JxKhAncvdjQy9PmZ1idjqvjfkH0ObBmP1I5INZf44LJO3Wqera1?=
 =?us-ascii?Q?g1f6TXVaD9q++2sGlvBBjG0H12rXDtee8wfiLLAX99U/ViVyt2ELejhHQIkq?=
 =?us-ascii?Q?2N2O+UG0morXRjZZtjVYi7XfTL2ydboRgMFHvPW26BfarrAFVFAvXwND3huO?=
 =?us-ascii?Q?skZIXMFlJBMMhteWc6gTP0/CtpdLbYRgW/qXAUdxRhEUPEq6jsXPcTSsDVjz?=
 =?us-ascii?Q?Gp4Vuncjt1nhx+rFjguWalMBS/RWBhMo+Nzd+nGVGAadeVbxBvA2LXPllRb2?=
 =?us-ascii?Q?CHzefOh6FlBqt0vj6Fsg36eZlJdgWoEaWshrCi7vcNrnUu3I54zOJyPakQwP?=
 =?us-ascii?Q?iHzijO1DgVCR8/f6hYVDrfouoCotjeoaA/yhVYGk7izngbNhETPRy+shaUwr?=
 =?us-ascii?Q?dYwW3xaMkOcI+7dpcmpZ9Y/XjeiGq6dkjhM1rjxZvwJv6YOdVeP+t5PxZr/W?=
 =?us-ascii?Q?jfJ7pXlAs+6YoorC3QH4Ac9RriXsk/be9AuO2GVVk3vpb0OP75xWy5/iGSf4?=
 =?us-ascii?Q?cWYyLwKllB9brXR/g21UU3h7nhdG96AC1MXuy/5FsnlJqtLIGKDJgsRt5trc?=
 =?us-ascii?Q?Wjinlf26cafkqBR7cvysIyp6xGKN2anaZSBV6IWPfocb5pJqtxiqzHP7L+7O?=
 =?us-ascii?Q?DxVK++RMUG7qaJY0Iqbjir9Aowc0g83VkQCIwCnk1t7BpTYIBFxeHlsBu4Up?=
 =?us-ascii?Q?hF/Q7iOviVfamP8rS6FfwEt2jw9Awybf70iR7k0ukoe1BPN2wRBG9PuXchup?=
 =?us-ascii?Q?M1ii5SZhyIIn4I0dop9jz2btLRQv2cQu1uGul6Ro3l9sSwbWxt5M/FQOLoSD?=
 =?us-ascii?Q?1N6s4n7bFQAmnjp2mdR2TRhGxnKrinsg1oi97eiYSYgPN8Cx2lgwRrcP/BHQ?=
 =?us-ascii?Q?nK6eMANgYtRv7HI5FCydp7aTwKy4uVwah5Fxfw+oRz13AicCRUDscwRIfvh2?=
 =?us-ascii?Q?FNRPZHd/gIc4ZnIlQ0vb5DmxQt014heZYLqVN5Ci65+Tl/gDGYHq7Yo6jip2?=
 =?us-ascii?Q?QukcCgLG4ZLvFouFwhM8DdWWEvwpd0EgD+mzLKI6FwL50nBPWI+Yp95SOzIg?=
 =?us-ascii?Q?CfTdV+WrSKMmbFCtnvVxGzLRzYHdn0iWeYw8g4j/TVKnQ78bCPR7z3lb3zaj?=
 =?us-ascii?Q?J2wKSDc29zQ48b1vzN8e7xon+wk1hk52J6vqHsJNCMOqBQMS+ok/a1rdQI6y?=
 =?us-ascii?Q?6r7M4xJ2NfKMiyOmvZapvt0a07EWL3qnea0BjHEZcXL8UDI9xs0FAKuTH3vl?=
 =?us-ascii?Q?zRcXw0l0JrGhmVqRZnHeY/yfSNawoJRDMuLX/j4D8gHICzKHubH1+wYKTvit?=
 =?us-ascii?Q?aDb6zY8buJ6g9pAbHbCV8TLAaE3iDNiMt8Prsx0iW3BcR4KifKXzdAhln/++?=
 =?us-ascii?Q?cm7e+ixkqtkwGOSkUuGjtO/xKZ+akU1BrXxaClEFevBIyOzv+cEz5h1+btn0?=
 =?us-ascii?Q?rDgC0qrHdA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321f7d69-3192-4eb8-9ff8-08df49b6eed2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:10:15.1717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/lYaYZdXPQhjv/ueSuYtTmNIlq5wnPt6xT9gA/1fKMAk6Z5mOaQS+ejf9e6+pEJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

dell-smbios-wmi fails to probe on RTX Spark due to a hardcoded SMBIOS
handle (0xB100) of type 0xB1 (misc BIOS flags) that is numbered
differently on Dell RTX Spark laptops. Remove the hardcoding of the
SMBIOS handle (0xB100) and only match on the type (0xB1).

This fixes dell-smbios-wmi probe on Dell RTX Spark laptops.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/dell/dell-smbios-wmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/dell/dell-smbios-wmi.c b/drivers/platform/dell/dell-smbios-wmi.c
index 7a5c6d7730ab..d6353c9ea485 100644
--- a/drivers/platform/dell/dell-smbios-wmi.c
+++ b/drivers/platform/dell/dell-smbios-wmi.c
@@ -281,8 +281,6 @@ static void parse_b1_table(const struct dmi_header *dm)
 	/* 4 bytes header, 8 bytes flags */
 	if (dm->length < 12)
 		return;
-	if (dm->handle != 0xb100)
-		return;
 	if ((flags->flags0 & FLAG_HAS_ACPI_WMI))
 		wmi_supported = 1;
 }
-- 
2.53.0

