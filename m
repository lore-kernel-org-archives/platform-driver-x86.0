Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475441;
	b=GWgbcR43HT7zHzWWynWeFeIfdEG3PB4fQCG3cUZMxZjRIAkeFciaLxAYecKvlQTySGEp
	 AAA5GcM2ga7cH+6qpZdZkpgL6fIEwzuM+qu/DnJvPdKNpPjoMZRjJFWZDJm2s1/y+Ohzl
	 4YhfD502Q8SZpIYLyPPBXnfnNS39rur4uw2HprWb8c2gMO/ss3Papp4SQoDgXV/fy1elP
	 6uZAG47+1WFS1NPSWP4FTeIq8hBXsvo8Chd9TQZ+GbrkLB2xfaUVeFIy8SNQ1ew8Bktti
	 k4CMZ6mob3QiEFUGeVlFlWMe8MUytr53KfuBh9TcfL5ThqsF0NCAxvqyNf0/t659/Eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475441;
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
	bh=RXuY32Rkta+RWudogjyStrawmFr7bBxB2STdu1O1+p0=;
	b=KU4whT+Z2kj1+JFEj7awD17wctDiE86qMwU+QjZAP5KLulZYyZnvzrbSCpDQ+t5AjVCS
	 Pu7wNa4WEmR7TKXq5goFvM30PzJDTbZFQC2jQGdukMScxTzuLDmTDpJMmwC3WjzClnigx
	 bXEIkzq6zUnUk8cbgGj2FzHwkGbztZ+HqKyZ2t4mHP7xjd3YRCuVEvBeVT91qNRDRUesc
	 9tHW576dGt0U1AB6KZMoOZ7W1D5X4hAcNqov4dT02vPuDZK7KRtod1AxoG/yMI9pcsKJD
	 /kqbtHI+LYqEXwO52NYqW7llqQ3tB4LRrmnU8ABtPp3BOOBxFNnke3XUufBuGw51Ffg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cLa3yY0w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879D606A333;
	Mon, 23 Nov 2026 23:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5879D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cLa3yY0w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIWvilxt92yly7dJG1df5DbLqzTdpKdTSvl9T1zU/gRi7Xpn8AgvDPvskoJe/AP1W8V7MERn6SX1LopxG+6KulWUCyjokSPMKST79IvrZLdmSruXASyiRZoVH1gNPWP/s3IGOgKugkyddoohfNhyCfsHqogDI47wyD1AI5rWwktbVngoHzTy5fQ6NeeshgiA4KPdBvtUujAZxMwUt+rS8KVEd3gHoRSJO1IDSOmBhgcJpGrXLaASve/SgpweqG9HWObhIthtV9m+yqSNAGL1LE3EoFVeEUNAAnr5XjeDc1SlKZwgpEE1HGK5iWOl/KC9U6Q7SYKXWAdEKrjW9P4HYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXuY32Rkta+RWudogjyStrawmFr7bBxB2STdu1O1+p0=;
 b=gz/cwW0EeqkFqSWQQ1aEbNNqHn0zBxaVK4Gh9Obx0x3LobsLEcSqziApT5yFqHn4sMe3+SV3KDfbq/Q3FEPQYDhcft2kBVQtolUoLc7bRsrQdsL0rL0OxnZag9+mZSGLG+DNkSdPwnkc0fd2siwICZdvioDORdnn2sPY5KtyXQgC8t9qW/XqDvjsWFphMdAZHATwuD9xVPtP/PmfY2Ai0BxAhIhcY7iQWPdddaSyqYdiEgPAE1CxL8tS31iJkpKLsxxWf3YuCeJa/xQ5KpkHqJrOwZb4hnufJjGtg7ey+sMSRxjDf93Jp+51CpE3s3k5yb/iLRDyXEpJuKhCAOmZEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXuY32Rkta+RWudogjyStrawmFr7bBxB2STdu1O1+p0=;
 b=cLa3yY0wU4Zynb9/FScaj+RrZY3jLNFsjgS7+uWPUuh3FqJQdJH/fEHkvq/X4rbLQslvPTxhUlhkW1CfDNarbGUBWsIoW9Z0QAFHhEJ10wuzN3ZzFk8ZjflWNimKSLfwi3xnb1VLClWPooBs048gduIBXWswFc+4+EmZhZz9V4DpJ4CIKfspv7uakaLZrEX+oz6YIaXEjf9gSTpHO8W1SAnYK9K+rLWdz27+wu24Sl/nahFYedQfU1hQ13a+3/tGIbxC+1y/cIjfNoELD1YUTlQgxzLRlx3YZPXZTfJxxMr+u7brd5/4aR5d1bUTtA4II/dD9jx9RjL23uBL+ZzXKA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:10:18 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:10:18 +0000
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
Subject: [PATCH v2 08/10] platform: dell: smbios: Add quirk for non-functional calling interface
Date: Mon, 23 Nov 2026 15:08:59 -0800
Message-ID: <20261123230905.13899-9-bmak@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6127a55b-44dc-4742-8b30-08df49b6f0c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|261102130727099003|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261021130227099003|261021121427099003|261022113327099003|261022075727099003|261022115727099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NiNMpwb/3y9EMGiKtCwq7qS73mYwkBLL7mW4priLeRXhrjcDdN+Kbtbl4zsz7kOJ6J56dDhaBGVF5zljcuMjIbPY3s/kPlhWVHRzii2s5xKtziX5iCkZQNh0TqN1TyQ2+Pok5LuhUgbOzXIGi4k7pUkiUAWh/rCsthZPaL4ajuzYDt0QpDLGBqyXtjvhyiHpvU2F+jPkQNmoRVQZ4JMBwh8hXDz7zVr6Mm79x2dcO1kKcevfhVAdgKQMtOilYF+4Ss2jdg2ORJkbRV8uIW+j16lrPjOxwTiYtD9VkD3May/9cwjSAoW42o4jcFeBBHfxbRIPpACLU4pAg8+HCHOM62tJ1qHz1nd+51UxT98ILWeXDDET6bufx8lyqm87oyzuOiZMvi7tt7kU4YdpZ3r0Sg1gxjRdgOLihRNEAdrUbzDnXEcas5mmF4myJuwVCNyIO8KJs9yE12dA2vcKXqkj3lXSy4ifnMxbt7ZHYOumrPmUTty8i2TEbq77r89fuhDnsnLMn4CPUZ5uaxGOIGQ0KUGhz52S6UJ//rCPXGcqH8gY7hGSXooteMH6jdyTPzNpoguGaxtFnVJn6CegAt4smMnUHrfp6Gh8l3/YygnGPrqE/dieUmRNh7H3QQ/OQTsGS0cN/Pa+neSPmBx7X7v9QQVzeH80WUMECvJ/nNPBafU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(261102130727099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021130227099003)(261021121427099003)(261022113327099003)(261022075727099003)(261022115727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EwyzSdOIy0FOR1LEEQ4CP3SzaLA+XyN2XxXOUEjISPzCFs+lsTwHPdwEdrIf?=
 =?us-ascii?Q?veuHOUeWj2UYydZJy1PZVeYm/3JEASqUVcisl8Y3D99WoChs1WEZe3JIeJfT?=
 =?us-ascii?Q?5b5A53wkLLQUc9A/EI4Ocxw0OtCLumMg+LvKpSso8Eb/EtzOja6DQnLzG8+T?=
 =?us-ascii?Q?emxSHpmPVIzCw7ur2mE/6m46sh5WPYmLbe+VKj8hUsoCMGTCqTfhJdgfyH81?=
 =?us-ascii?Q?BCrJFRZOWUwxgFNwJiSQa5Y+G27rkhXqw4d2DHefi44gapRsq7Oxkj6oO6l3?=
 =?us-ascii?Q?kXNiIxqjSB31/dtMYkE5MAuyhm89aj2Dr2eIAHJBkVdn40pOQ80lsoV3wpmN?=
 =?us-ascii?Q?rtsfreaFmFykPX/ld5LSHd21TK3aWxIBWMHvFosQRs7P/B5s0HQAdtWTv0dP?=
 =?us-ascii?Q?1v0pOwUormNetAv38g08y9m/GafBo9p0o//KpIHUwavk98onEnX3CPa+TB4O?=
 =?us-ascii?Q?c99tWIZBVPnQO+ZHPC9ZIpupEwvkLM4L7G53lVeKn/oPLm2aAQww28mpWlDd?=
 =?us-ascii?Q?JXgzEMtnSBJh0+k0jBh6MfqjOwi1wZEMijgP9OhT5cKYb3MQr4CVRfwmyxip?=
 =?us-ascii?Q?xiG1++SuvzBTf+WS5Gf/oA+HAN+mZBmWLcW7keoaG6WwIteFsj5ewk82NtM2?=
 =?us-ascii?Q?lktsHBup1p2ZraPHDAkIOMmOR2zhWAAi3DT4dh7ntqLJc3ZPxsuU0thk/cng?=
 =?us-ascii?Q?VaCKAKKhicvZn+OTnpWJ3IM3CRHYei/8LIKwJzDKbmdnfpo+K6DxX/NEtoDC?=
 =?us-ascii?Q?h5t0G8jQsgYkahgmG3Out21Vmp0hHy1LlFszHuJr8Z5GbH5Kxsy6KLrhDzV4?=
 =?us-ascii?Q?Myh/vd900SrfwOPD3YOuIbVm10YQJZqSjHKccMicv6AsIaQ0OU2FM8iSyg2i?=
 =?us-ascii?Q?zXfRQIH3OMY3ljwm7IyleFBi4jtkH8eGe4HaQ2s7/TrtAOmgSC1fig3AGeSf?=
 =?us-ascii?Q?pkNKUgo+POeVdOfL8de1BO+M65usal6pA5xzbbsvFTXFer+gLF0fM7/kB+0Z?=
 =?us-ascii?Q?B3DimqTtd6y5tiJRICB9MWzBDkePEN5KsxRVA0420VafMbC8S6i4+b0UiPKS?=
 =?us-ascii?Q?4SvwN3Y2m80qixL0M9VsTGqovIa85SBax6fBt5h60XMNsHuoFHf/mkSONISn?=
 =?us-ascii?Q?ygV0p4LFYbm/fQRocfclSYQ359XMUTxZXbUiz4+es9s7ifDOWNieZ0Xye632?=
 =?us-ascii?Q?PsLUzoP5XklHNiQzcL2AD5dBfqNZpB1BZu0QGbPNw4NjsD4JZeh+OVx5eLXg?=
 =?us-ascii?Q?znCmDGTGEgkosNiXf1mylzsbQCZkqNIQ0E/b+1ruxJiVovJR3JsadRfa8f/5?=
 =?us-ascii?Q?ozTkIACAg6tu3OKmXjmkVQV06X0tLsT9sLttRKxDtN/wMFsB9Fr/lopkarOl?=
 =?us-ascii?Q?hTIG/MW1iq1aDEHXzjCtM2xqoAOuFsG39I9bJ/3ql316lK131kVEx/A2qpKM?=
 =?us-ascii?Q?MHqKHTBu3gYLQUyr5XYo3vCBieQ7ZBjJAY+J6DapAYYu6seIW4NwpvscQACT?=
 =?us-ascii?Q?77fRt9nhGDfXiU+hd7pN55rOZnQqtjYZCqL0LoNzABxTcI9OX6rbn/JxcWD3?=
 =?us-ascii?Q?J1q7iFIKT84DXirDmhOtydkBf7nRX2bHDxfrkwhYPrC4l6aqvYoeUyECFPnE?=
 =?us-ascii?Q?+qcVFrl65iJPGD1Ik3GuX7iNbxp+UCbjfPIoLmSHpR+1V/RFFvv2ZvS71FAi?=
 =?us-ascii?Q?zWqfmTF301WHZEg0LHjcubMMhucUy60zY080wqhuaNCdDk6XjU7aLy+ZFtLp?=
 =?us-ascii?Q?+CQ6qFIVhg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6127a55b-44dc-4742-8b30-08df49b6f0c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:10:18.4309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iX6I2bHAG5jXOO8vpppPVRd3qwi0D0cfKsCDqoTlMTnJkIVC9p6Zlej1rzbkNkvQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

On Dell RTX Spark laptops, the SMBIOS calling interface completes every
request with an all-zero buffer, even for requests that should fail.
Drivers that rely on it, such as dell-laptop and dell-pc, end up
reporting bogus state, like battery charge modes and thermal modes.

Add a DMI quirk list for platforms with a non-functional calling
interface, and export dell_smbios_calls_functional() so that consumers
can avoid loading on them. dell-smbios itself still loads, as dell-wmi
depends on it.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/dell/dell-smbios-base.c | 22 ++++++++++++++++++++++
 drivers/platform/dell/dell-smbios.h      |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/platform/dell/dell-smbios-base.c b/drivers/platform/dell/dell-smbios-base.c
index c8e93c12c445..e07cbb0e8a6a 100644
--- a/drivers/platform/dell/dell-smbios-base.c
+++ b/drivers/platform/dell/dell-smbios-base.c
@@ -390,6 +390,28 @@ bool dell_smbios_class_is_supported(u16 class)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_class_is_supported);
 
+/*
+ * Some Dell firmware completes its proprietary SMBIOS calls with all zeroes,
+ * so any value read through it (tokens, battery and thermal modes)
+ * is invalid.
+ */
+static const struct dmi_system_id dell_smbios_calls_broken_list[] = {
+	{
+		.ident = "Dell XPS 16 DX16263",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 16 DX16263"),
+		},
+	},
+	{ }
+};
+
+bool dell_smbios_calls_functional(void)
+{
+	return !dmi_check_system(dell_smbios_calls_broken_list);
+}
+EXPORT_SYMBOL_GPL(dell_smbios_calls_functional);
+
 static void __init parse_da_table(const struct dmi_header *dm)
 {
 	/* Final token is a terminator, so we don't want to copy it */
diff --git a/drivers/platform/dell/dell-smbios.h b/drivers/platform/dell/dell-smbios.h
index 1e64803bc00d..26f54364ffde 100644
--- a/drivers/platform/dell/dell-smbios.h
+++ b/drivers/platform/dell/dell-smbios.h
@@ -89,6 +89,7 @@ int dell_laptop_register_notifier(struct notifier_block *nb);
 int dell_laptop_unregister_notifier(struct notifier_block *nb);
 void dell_laptop_call_notifier(unsigned long action, void *data);
 bool dell_smbios_class_is_supported(u16 class);
+bool dell_smbios_calls_functional(void);
 
 /* for the supported backends */
 #ifdef CONFIG_DELL_SMBIOS_WMI
-- 
2.53.0

