Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219691;
	b=OIdODKG1tKt7usR1Ei8bibSOIR1bQ6cj5Le1S3SdljsmAdEbX7i6mveYBR9+RndwAUcp
	 A3gXZGPb9JpQ5BYJTkwC7BUI1calyy+lR4LZM5GBIE3ckOZmWfqREJd4uqASS5DneZkuF
	 1TzK7NqysOl+GNjOBeTtM3ZXV53H0nUE57u2OH1vyEbQ4ZJZLeEVu7Ka/lnVlkqy0F/TU
	 cFP5nXhDpEy49or1BWIQb9jmWcRCz94xWgF2IpnCTYfh9oho3cIF62yhY2pgBmcUAPdMv
	 utmRkx8Rd5+e03T2i86QVzt80lLL4NWZjKAKEWSULRj2Aa1PlMTLVvhC5srq2jl2hkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219691;
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
	bh=AD5z6zFRLWzWFDARiSO3tHz5UB82Cs5iu/wad9NrQzU=;
	b=zPoWIH3X65/30S62vTW7S/SOWc2bxc6edh3V6WD5XlbNgmvHP1pGupwt/8HZKqGywdmZ
	 X9V1zfoENf7wXh39ea051OfznlXU8P5Qg+yqs67tB9l5f4goKKG3+xby/Q3HxCBu7C/yo
	 aWTW4D5hFUQz/3V9DmgCpm32V7rncmFAW4q3durEmGRgekxt1V5U7I37bObyn7MbKQKQm
	 im3RBkHRlDHH0pb9GjHPZagbmat4zY0L0htleGtawz/jvCE2bmFnmNp160nuZ2XGNg8BV
	 wnQRUTfixXH16Xp6tu1LNVZ5P81Gct5JKard262bKUuF005La0zXIuA7Qwuu1HgyMUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NGQrGJkk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6C9606A691;
	Sat, 21 Nov 2026 00:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F6C9606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NGQrGJkk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQDWKMAsyrD/BGIAU8vDV3RM2alSijJWbNqiYnJ7oyS2H7c1WQKFB0111DCBelbcIhP3Wn4xXGj9YiFJ1Czn9hhMUOGERIEJ1Zjn2WndpB0VjmFGKkr0LQ1d5CrpttfTTeEqBEQ0WiyiExoK8z0NoHRpQ2ltP01YmX1ubfnUsfT1dnRSIbi80TGAOfLXIrLCq5ROMwpHgQCqMpW4NuLFNAq1e38P1/249cnDDEj6vOVGc59Sz0HzzBc3i+2AERKZ1OVE1u3jktKlRRvpSamj3b2AiGOD64DFC/UCnLEZcaAxxZL0YWxJbksHITw7y6mRg5ivCZPryuy3Yxt73kuJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AD5z6zFRLWzWFDARiSO3tHz5UB82Cs5iu/wad9NrQzU=;
 b=wT9sQGAxzhutOGgGFqZY07wBBl6V/LAse4SKIuDmc0Ql1Ng/boBMfHTsLvPoU8A4e6S2ti1tfIvt93hB6a6bo/kpxALIwXVfokFG4osc3MaWsOa3YHC13hMynUpeFje3IHJeLpkVBowQPC6lcv3dGDF9ak/jT3RgtVDnD7jB4gB9pwJ2J+AsDhiVKp7eksbXroZyKBPxXGcFBXNlYATkK3bfTGbKMG9Awgb81is0j8e8+9hAEJS67viW/t/tMZajITf8Wz0x+s6mLadbkeYg1cwsyAUG3hC7+jmKgRo6/rBDWgkfa/dJuAZvkVJnFyDxobYaEAx5THMgfjgIY8eMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AD5z6zFRLWzWFDARiSO3tHz5UB82Cs5iu/wad9NrQzU=;
 b=NGQrGJkkgSs6FzmRgjfxxsoILnksrgpBoTYGYIc4wHPeg2OqXIUbW8o+q3DOJgdJNoYPe8q3jXuJR8vhst/lBm13amuqhOd1J3Vd6zXl4eWFxUjYciPmJ/7CWVewZyMc+lhZjcUnMFwVssIMmUFK1+tA6jumoekKBpzI3z0sMNilcgdEjlG7Pbuw/y2qokTYbdhHy3PaBQmhiNtVMno3Yup66SQZUzQmOheIAsAzsB0QIjEw0y5q9w1kNShyJHVsVckFw/bGLuQVBpqCM/y+O/9ZdGE3mZcoafju7aFtrdBxz5ht+nJEXlqVIOLjfPiwlox73l1qS+IGyW9OIv3QBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 00:07:49 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 00:07:49 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>,
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
Subject: [PATCH 3/8] MAINTAINERS: Add Dell platform drivers entry
Date: Fri, 20 Nov 2026 16:05:49 -0800
Message-ID: <20261121000556.173028-4-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121000556.173028-1-bmak@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:303:6a::33) To MN0PR12MB5786.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5ef2af-16b7-40df-e98d-08df47637a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|18002099003|22082099003|261009223027099003|261021121427099003|11063799006|56012099006|261028144727099003|261026140227099003|261021123027099003|261022105027099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	T+bbc/JuvEIaggn4UT3iK9qSrHsDkNSO/Q4+mS6ybVIi25jTcxEVQOdzicd3MjTLdeBkudLJt1oYguh1HR+P/mRrVdo+vVdBpZvsGuHbnrPDqANGx4nKpfLesy21TodDyR1anK+qyreEIWSiOszHRbsycL4Tj/qbGBrYF8x2/kYFF6Kk+gUH58e0uO6dqzG+0qSRHXXbxWxMIFBvABswf3ukXD/qpo5XyFcepjFZcoJJ60/8U0p6w9+BTzSLQaWUQLhCgXEEtAjJAETntn/GFtaA/wFNbYpkTZR4UT65rEMGvXOxo0mJFKBMj10Qmk3zhzomo0NNPzPPFlLDrSIj/cTBDgdADMLliVnFud3fSLeYTqtZPhzc2fiCmtpqqUEgS7T8RxxPJjr/btkDHpQLcyBTrRoaMa8R88P/dPnHm+oaRM1RVF6ghs/xQnUbEa7PiTKGWsLVboVvk0jY+EfYo+X8KjhR0Ylp6thskEDIqCNWbf+im4pLpBdL/fn4YLZ7R8qz0bpF08fJbpt3UWRAK/siF5WPJQqAOZ5C07ecjStrOEaTfjPpCMwrNrzWNNM7I93AjTb3JEhn3MUwNy9xMD/SR95CjKVAg6YbGGl8NcLz7UEvGW27UuFr03XsmROfki17/hn8vUAwe/1jxrSM+3ZdgGCMD6ycG+snAkr3970=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vMvA7tGHSxUCh2skxNkAyuC8z/7KtJ+Uthy7N98FKWXSAx4BsLA6kSoZwA+N?=
 =?us-ascii?Q?gFW9SwMmAIkFYhj2jH7DUqO0Ff6dQ+1RWASJqoMWWx9NXbW50cBgXqJ5rivU?=
 =?us-ascii?Q?IcCIVr1a9hVRg55Ox45bb3DcubYedZ2XYAVarzSzoRS7M9Mhf/qIXx7U69yK?=
 =?us-ascii?Q?9+daO6w8Cf182RkE1AcJQiVEYgg7ZavOGFisePHzVxqKfHFJe/Y2GYO5UXP9?=
 =?us-ascii?Q?n8vbGiB1aLpdex+8MLSOeACP2ey+gICFCrp6G3GsWIQWi87eaA7VByqOY1yp?=
 =?us-ascii?Q?h0IAipObvI8RcR6T86YYzZYsp9M3xPHds7Prkgiq/gMvE63CyiM4Atxb9sDd?=
 =?us-ascii?Q?Q4avlXwFDGbuJveHnkZBFJDK8JmxscN5/9w4qEBPcGLd6FJCjMaV3dlymY0X?=
 =?us-ascii?Q?H0DlktRcqZp6or91hFhvlLXdW1W/WqPTZP1woFQN0UWlK9fWDvndtCeXV/Ew?=
 =?us-ascii?Q?cJusDQekwqK/694ELBBkjeBXGQwiHjzVMcBzGkSLHGFOnB/5sOXsq0Y/XupK?=
 =?us-ascii?Q?YftF/9sq1+4Skhju+z6c32l1ZtYZokhp9jR53KFxRnrGgY6uhRJMXhe+TKL7?=
 =?us-ascii?Q?epQaXPor/jR1g7Xd3hlvi4U3R7LYfzx7hpxTKY+BKzDdaEar7qU6+rd5QVLV?=
 =?us-ascii?Q?94xbxd70G6aD2LhB5NpHPh6Ih4P/hcR7pogK98SXu+1t/84OMqJqRpoXY9EQ?=
 =?us-ascii?Q?GAno+HmLWpWhs0GYq4zTm3MgSfIyltiZxI42I89JpAifI0OgPfY9iEhgMXOM?=
 =?us-ascii?Q?wkKK1gW9qQzGG1ZBVIVoojZDTlQf/klxsaUe1i9kOPclg1BHDONfvcxrZAuL?=
 =?us-ascii?Q?xhfe9syCRwkqLUMOZGrj8GJmh/SMAtmCTX/csm/BGAlpjy8hRYAX9Pz26VfS?=
 =?us-ascii?Q?S7XhZSHC/ezcWnAmqr+FX1PZBJljIwSy2rGPkqve8R4fATAYeZ3RFRecm8Uc?=
 =?us-ascii?Q?fXZZux2iiOA3nF4BMsDnvLY0DggyMbhwFVJP9sL7ZjiIlhbemfY/u5s3Xptl?=
 =?us-ascii?Q?axlrMET6FsVs/JUrbKHXSriZq/wUdDF+hEf6oA57a0ftiPJPkS1yN0B+9SOu?=
 =?us-ascii?Q?vkvvXW2zbbWlYr6t2eijNKmStaNcgHdqn7bawuKfVCxM0Fx//YU6+FbhCdpB?=
 =?us-ascii?Q?ObkRpZfCwks8DVbYo7gmVsJxMTDd1jlnzqnYLwax308eb6P4cirrNtOmr38z?=
 =?us-ascii?Q?Z9Tu7eeOb7FrKprPZKK+3Trqv1O8XKNcnh+cmQKoL6ZbekdoktbaZPc1VifA?=
 =?us-ascii?Q?rsPd1rTNztrqTxGyNn5c26IqaRokShIWZUW8cUNoXRykL6ZPnvCPUUkE4VAU?=
 =?us-ascii?Q?n8z+pD/DqHhbmcDtxwodqlU4orBivPskDKSEFX0VmGmR3J/li9mFiG4Dqsgb?=
 =?us-ascii?Q?aGJPo5aCVfR3seiJBGGGhB3UZPKXbmV8qpwpJ24awKo30QlrZ/ONi1bxeRRG?=
 =?us-ascii?Q?cYhXg/dqIpmIQK25tWl/c9buCKQPUqXtWXo+4oDhWT5h5c1u63B5OnAyz3cW?=
 =?us-ascii?Q?w4bpecEyrGNb26Rk6GHpiCFw/CkFPOx3yYKp0G2ikxuqSvBuB4nBUgOpC7Lj?=
 =?us-ascii?Q?OaOGcP6Bb3i6MrLBaKjgTKs+FQbo9jMlOsaCKaZGr4MAYAni4P7rdplmC0qF?=
 =?us-ascii?Q?ZmIS6+TaAMeM+FhQxaGlyEQh9o18WV5LQj+eeu3993OaL4XOYMSFQ6wTk0zA?=
 =?us-ascii?Q?1vuUumWLZOg7O+HnX9nFn/9J/hJiStzEqLcSqpWKwHARSagR0hxuNeJfLBH7?=
 =?us-ascii?Q?uTuS/PS4pQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5ef2af-16b7-40df-e98d-08df47637a9d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:07:49.5359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AP+3SefVdA8KUZ1hBU/ZVTkRQdXWyQF9e819aoPKqQw9p4tkvNKdB4TTi/y8cKxP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446

Add an entry for the now-moved Dell platform drivers, so that misc files
like the Kconfig and Makefile are covered.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0de02594cd30..d058da22a9c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7477,6 +7477,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/dell/dell-pc.c
 
+DELL PLATFORM DRIVERS
+L:	Dell.Client.Kernel@dell.com
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/dell/
+
 DELL REMOTE BIOS UPDATE DRIVER
 M:	Stuart Hayes <stuart.w.hayes@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.53.0

