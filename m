Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012045.outbound.protection.outlook.com [40.93.195.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8831C3803C8;
	Wed,  8 Jul 2026 04:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484683; cv=fail; b=GGGZssJuYzu2bZFH1W/25xGEJk4lV6r37PIt7zvhJTr1ntV+QBN2Un57C8eGeJpVrrXudN3T035LwkIp4jJ/Ho+UjcmZ4XC05MmfGBj2OFpGwyz9nNgGXZVCfqNSRSk88Seugt/MdSZpTVGDZ0APLvyb/RWb0NvQpZ4OkjcR6sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484683; c=relaxed/simple;
	bh=1mMseSnkUwituq26m0WCL96fQ7OcK08PHGqsxPzN2k4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJ1JAK0JH6q997GbPVZPUHW/tuH4Vt1YZtxY4zipBkSsQeFFGv+ALA2/n3Lf0fJNaZq2U1BQJ6cMbvc+tFNKakCpif+OVQLl/pK+v6BQbAKp5dBJb9jPjXNVOyWd8jmnUUlskD+ymmnwkGftZwCOHlWpybRWNh8h74lhGTMrw9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ybWSR3+/; arc=fail smtp.client-ip=40.93.195.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ybWSR3+/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/G1TcxTwJ7x4KzEPsI7xcCyCAKFpG8dZd5CnsOAiQl/CXAczA4bjCf0hBNWE7jQZZ+Pu3UvCI9JXmz7oOcCaQtNOtnKQ88WfvUaIj0Bt0HYsVSy9xJWWwNFiN3WXxOvGA0ZtZuSrVcNYR9ykYBgw+8K7eRnaopTArXEmiks31V7hNgvI7H3t+lqTnkgXte7k9eSIR9i7n6VWHEywvwFHQiW0PNS+uVQ34Fq54Lnjv/oRtoFaHM1rLlmlC5Dy2utbQ6EEPa//GP6U+EY7lL+tp+wRrnIAyzgZhP1IG4Kr5cq+srwJtibQ9GYKDrA/mp96O0wvU4D37usUQc2PxZh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVW+NsMKN3eN63B5ENTvDUZPf60jvBtOHQRzTAAWjKk=;
 b=lDwJerbZW/h0+RYQhxciAnLYTemiCWNQZTl+kIHXrZicSLWkdgXQ4XFHg8irfBq7c1W4pXRx9wLzXTI+p4v+TjVW79jHEDe7BIPgJUj72c4JZrSMGppo2/B62d6xBwmnERaULdw0vqqrajk+RzNIXpvW/LguaE90MvZy0fMUd/KAO51j4n26iI8q1QAEsH0k7pEn5QNgxpdi5rzPqVj3wp43ggOZza8555P+bacLQraFK86wRD+K240XGnEqKpLvqvqwn32SZwZrLullXJNS8LMfzt1Y1jER04NeLpCAHGlFo6WH9r6mQCacWEs8Be7oKjqZrZz/Aq/R49XPFrc3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVW+NsMKN3eN63B5ENTvDUZPf60jvBtOHQRzTAAWjKk=;
 b=ybWSR3+/SQC8RxT/d5GC9gtdQ1+j+Tly3UDKZlX48HD+XOic7CU8vpVaAwbJBkXMN8GoPc0IGcBO/lJnqwSICiXpWkkQTO5pp7WiiOfjmNDQHIS09qlbJUjrh9KjRE+c7oISFTDTNYY6hTR3LbCfomOvLd9Blw+L/1CmgALMklk=
Received: from CH5P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::21)
 by CH8PR12MB9765.namprd12.prod.outlook.com (2603:10b6:610:264::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 04:24:39 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::76) by CH5P222CA0017.outlook.office365.com
 (2603:10b6:610:1ee::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 04:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 04:24:39 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 23:24:35 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v4 4/6] platform/x86/amd/hsmp: Clear mdev.this_device on deregister
Date: Wed, 8 Jul 2026 09:54:03 +0530
Message-ID: <20260708042405.3758294-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708042405.3758294-1-muralidhara.mk@amd.com>
References: <20260708042405.3758294-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|CH8PR12MB9765:EE_
X-MS-Office365-Filtering-Correlation-Id: f744da09-aa91-46d9-bb90-08dedca8d34e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CJ4bk0ju70TFqP2QFrTBQAB79YUfPx+CUIFaA7fbz76JI/omjGSAIEgI0kc4ai0S/uTwIj7tig5kqrg6IrPKZu9YOcXKUKIN/T49sRUwKFtnLv9qotWahi5kS6AOpslfT338fcTA7+MuOaATvr+/sajUhzaNXsQwUY9xrjAHL9r4dqtECC9JnfyWFPJjVCtvQPYg+T8vDXWXuFJSG+RfHgxGfeCM6F549fWeQoXfh2JSkHbgo9SZzzKCG0cVuCP5ysQ7Tzu2Mdqm0cy+4kWPjjulM0tR2a7eY3Yk9GMbSm+1zVTLhHuaeQ6yKjUycKKyy/bIUKqKSRDJcPhIdoHneSzj/PMR95ZkKiXx/e0csEA4rtSHg713Z6KrmChF+PF7f4ZaMBRxlvbhrZlQln/lpc1qhCrb5tgxZsQPCbyWkPDR8YQoAPxhhfb6+yiM0cOQYQYzOajB5BLOOijJ+OCJQFIImhp38XiH0U7PxmQJyZGPchPvYz5qKEcjlRWXCh9VOaKHv5HJ2zXWJYuUGeRTMnNtTu0OaSfrc7IXjx13u6UN3HLV4zFG8Gz6kF9mTxNVPKXkbF/oHHjFIbo7xMklEJ0BwLFcVq/yrQTVy4RLXd9GIIgI73qbTE1KWUWNedWxpfKhbc1YH3n7mmqykSlJGWHzC5w+0G6uv6//4TBPPRBi9JlCBfBhFSnLksq4us3RY6RNidxGjja0nPJY2X5OCA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pj2Xicso5TIpgpJzS7ra0JwsDtQMS81X+btblnKPOKGWuKdzrLmwI1Lt5nR1IuPCWuvk0JfD0GEj+wwHUW+PwZKlawgOUm/GSz/ZTML0dpp1e4WXg3k63isOATCct1mTaX+327tYdyuW1XV0g65b1qDVZiGHLXzIoUmvvMT8+P+f84yH5x4htkRtbazyExK9Oo34PVHSCyznNbqO8LICvJdmR3hgIpwzDXKDSNnFrTx/sNkGTFt7j4v0HI3pYr1WREmrFivu4XM4x/BYl/YMo0uUe5OV+rHkw7jdZnlxd0T1JqKVqMIyVzOVZXHFMw6V5zlfH1B926Gzy615ynpjClzjSXEVkhcVt7ceHjG9niqzjlOqo971r7adSROihksdh7PqN1FoleXaXbArhyjNAK8mJINilRD/X9HH7uwB/S2j49E7ibrCYjOmww8alGBz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 04:24:39.0160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f744da09-aa91-46d9-bb90-08dedca8d34e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9765

misc_deregister() destroys the device but leaves miscdevice.this_device
pointing at the freed struct device. Clear it so any later check of
this_device, and a subsequent re-register, does not observe a stale
pointer. An upcoming change uses this_device to track whether /dev/hsmp is
registered across the shared ACPI sockets and relies on it being NULL after
deregister.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 10fc21887308..ccd19c7bf115 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -531,6 +531,12 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_register, "AMD_HSMP");
 void hsmp_misc_deregister(void)
 {
 	misc_deregister(&hsmp_pdev.mdev);
+	/*
+	 * misc_deregister() leaves mdev.this_device pointing at the freed
+	 * device. Clear it so a later re-register is not skipped on a stale
+	 * pointer.
+	 */
+	hsmp_pdev.mdev.this_device = NULL;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, "AMD_HSMP");
 
-- 
2.34.1

