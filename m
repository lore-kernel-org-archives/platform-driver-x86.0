Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5FE3DD871;
	Wed, 19 Aug 2026 07:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124747; cv=fail; b=LPX2RQWghsFup6i68AGywFxXGbQo+KC1kI5384itCTuspj/6GGcKQ7QQ2RNPVqBb3ZqqLwsfrjCJUQherdKBDexeCHUDV6li4wfvzoD1A/5RD5jhkXXx+qQU7UCCPmgUWdnTuIQrP6kk5jQ17LNC8UhglP5GWtZeqXClGlR17Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124747; c=relaxed/simple;
	bh=e8g9O3RtP++UFjesJQcJVBRnZB8GNFL5I6D2jer50dQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRk4Of1fxaINC6k1mIn+1pzNMfe6R9EIt0Gs+GGyJndfOdl+Ot7ktkVTwevOMIXLg9oHJ5wN9uM33ihDD2uYEN2jua6wpYz96lItEukkyOwixD1Ql4pvW4Kd7yuJlrp9TFE1vHeBpuveGaisn5X4WRkXB141XJQdq8cTDFOg/ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nWoeAx+J; arc=fail smtp.client-ip=52.101.52.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nWoeAx+J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kq/TMo72LRBCiPN4eNchS68oh6AgubUsdTWX7I0ThLDdVx/bnPDE73bMFmUxTmSEM9u0qPf8kiFLtDvWTJpZmiagbH0nG0X3LUeriFRz0QQyZ3z9LyJrUADrxcfOuZmWxW9oZvxy5r7g9uFZyyxMKM6vOh9kQTvssECpFXhb3EJOXulYWtdZifFIU2tJj79KTrJO/jWdtXrLkhsT/S5AsN2MdqLOLGGx1UQBIWQVqSN3Cu9Hay2aAT+1+hJvOwWgYilzTdK+mxmsefGy04S5/N2s/n1btg34lFzvLl0akPMvSwbtDFcSnjM2uWFGbtJQE0Qe4z3XNgkS4G/cdMPKTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4/IboRXy1IfZLbZmWuFQsGY+OHZOJWZZJMw/T3hYHc=;
 b=YcbawESFnQgDQdrPXWBoWWI2G7Sz7+cwY2oyrDqkXXy8RSsZXh2VxTPTa1feDPkBUC0AoC1lLaZwCxmXUeRtCbdoSnug5CKuQ9MGn2doK30OQzhUi6VPvtt0X2BtE6yP9omiuhkvLGJmYUiZmiXinrrk5krKuLRvtELD4lfEv6vOetS1bxJPDeL332doFh/nAeqLvghm+aSbjogC/bazLWswDhp0Z1l3vQjsLGtA18YTj4+0PC70xN9Llw+VXQy4DbdmS9taNy3znCmwgCWwqU2rSrXLT/RCXmxJzh6xP0lkTCFUDQh4Fji4sImS1pGEG+WYzFgeK/mq/VaIUZvj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4/IboRXy1IfZLbZmWuFQsGY+OHZOJWZZJMw/T3hYHc=;
 b=nWoeAx+JxLGL7rnagg3eq31fCK7LZuAKK3eBEB4PsR/OGDa4kSd3E9lDaNoZm9eJnrCIhD3gaQGnfpY7HlBTZveR34RcbPzeYbt1lXn+1qJA9UHr0s1JAu97yieUt+tCVP6uQ7UaQOmVSIZubF7Uje/R64aal6SBuN8oMNv92kY=
Received: from CH2PR14CA0008.namprd14.prod.outlook.com (2603:10b6:610:60::18)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 07:32:21 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::ac) by CH2PR14CA0008.outlook.office365.com
 (2603:10b6:610:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 07:32:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 07:32:19 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 02:32:17 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 3/4] platform/x86/amd/hsmp: Add ACPI client support for Family 1Ah
Date: Wed, 19 Aug 2026 13:01:56 +0530
Message-ID: <20260819073157.2426504-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819073157.2426504-1-muralidhara.mk@amd.com>
References: <20260819073157.2426504-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f3eaf3-2281-422f-2a68-08defdc4006b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N1n4G1A4GdXrwOPR+VluQZwFQyNlqJ/d7YnDC7C3yNRbQzkwocEJV/YmhwNURFN3LF5Xa99zNZE0EhrZ8sjOBBXlxNzzpgibmi/UBtS869t8LY3yYvCsceQJ9Kw1V4n6supbHQPz5CJ7G0b39AOkvo+KMlXqfw4PepmuvfOSjpDkmJbs0bwKZxybxy/8+8j/gDppMH3WNImdEGeYFBRGFJ3d5ON8JVszAM8Nfv9OGqILXDkRUIQwsdDD4vnOrj0obwOUl29jle2w9H5Icpi/yDnw3aRmK4j6Cq4JrrwOmdM7h5OHqVRTPRC2qeyAgMzdRd2RqWz+nzqtkmwjgM44iKmDCJwN65TQcd90x5bym9FhVLYmMMgIZC0Wvx3lXqIAmr02Ylmg3eBSbEtTHFGzapIzw2Wv4dHetii/MO/cB7WHdcyUyiZLT6jTwB9fMChsPlAae2k5MfkriUNX6aSG0jZi/8c9Wky6yFmclfY7nqTiNtnaCTfNIHuAZJ7JeF60AzE8BKD32WJgJmP7ZU7/96cqQFeGsVyJ9i+BqRzP00jIIPk5TlbP+jHpw1+Nk+eXCmvQut7mjVv5porOMgigEaX3Vmqs83aZtuwvQjFUFUbGkZWUEYiws/T6hiUV7t9omXP5ONfM4HYQlYY/6XFoPTJ4z/Rfv9kmfmH29l+6CL99KbOO7hfz8l5vMGMhLJoZxbuPHnQ025U8UYgEqxh1iQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iPmYDFtaMZNcqqBvKDkX/G1Lwf2vmI0azMlDFS5XTX/2TpGoNJUfBR8YmMPBGNzk/n0iYo4nKMTl4MYs+PptbE99hjcNeIC7r7oxcOhTP3MNtmSGqF/fFtxH7XzNFAs/rDa/O5dSIE461WcPHJ5DvWekn77rVQYrEQu9tk8k6Ahdgoio0WIVE/DcSCLV/GGn74KGchmQ+d+TTR3rmnLzDuICgS7k57/zoIRYeUotffJow5g1PQtIBDFo27FQWucrejQrIa3rnpUdp6s1ggh9BYpPmkiXCMHxO2Jv0VKldRzAndE4R+CmnIS5ZbJRIrjEK7et+9kUaDumkYzjWvPI9VNDW7PdGsocyux61s9kdFlZnXngBZd3qxwnL4A3e/im8mhQHqaiq1cBGjLI/24QY/z7/ZEcf1l2NJOULXonAT3YvRsPx12qKy3o2DTYFCO4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 07:32:19.5307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f3eaf3-2281-422f-2a68-08defdc4006b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163

The ACPI HSMP device (HID AMDI0097) on the Family 1Ah client platforms
(Models 80h-8Fh and E0h-E3h) describes its mailbox the same way server
platforms already do, via _CRS/_DSD, so hsmp_parse_acpi_table() and
hsmp_get_uid() need no client-specific handling.

Client firmware does not respond to the interface version query
(HSMP_CLIENT_GET_INTERFACE_VER). Instead, query the metrics table version,
as it is the only version-related request supported by the client firmware.
Server-side behavior remains unchanged.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 2 +-
 drivers/platform/x86/amd/hsmp/hsmp.c | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 8257cd1da48e..275258ee86bf 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -557,7 +557,7 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
+	if (is_client_platform() || hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 60889c1b1099..f35a891772e0 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -196,12 +196,16 @@ static const struct hsmp_plat_desc hsmp_desc_server = {
 	.metric_dram_msg	= HSMP_GET_METRIC_TABLE_DRAM_ADDR,
 };
 
-/* The client drives a different mailbox with the Ryzen Master SMC message set */
+/*
+ * Client firmware queries the metrics table version instead of the
+ * interface version (HSMP_CLIENT_GET_INTERFACE_VER) to provide a unified
+ * interface across multiple client platforms.
+ */
 static const struct hsmp_plat_desc hsmp_desc_client = {
 	.msg_desc		= hsmp_client_msg_desc_table,
 	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
 	.test_msg		= HSMP_CLIENT_TEST,
-	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
+	.proto_ver_msg		= HSMP_CLIENT_GET_METRICS_TABLE_VER,
 	.metric_tbl_msg		= HSMP_CLIENT_GET_METRICS_TABLE,
 	.metric_dram_msg	= HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
 };
-- 
2.34.1

