Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CB16AAD
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539680; cv=fail; b=pIhlyfjz5gAKcLJ0N6wwybLNtPDrxmt1Zh91nRe/v/mvPnz3LWv4aak55QI0ztt481piRWd8pFDqpF+UqTxi3gFzWOwCr/n7n4kpklgfX4Sa99X0MZkecYaR4jblyIS/bhKExZthLSOfRK3pccuLJ6LGpz/WS0BT9QZajmbKWzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539680; c=relaxed/simple;
	bh=pot13sHgnqkn+1gprONY/HxLCaNBgkXD+/fMERSILXo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oafa4R4HFwogYfqS3aLTGBsz36fO67SPYSMERDCoFgwNkjiT2st+nLSp50EberuJERQ/HE9jPc1mvm7UNDVRjzAx1zW9Fty6JcBYD4J3H7YuWfJxV0nUcAlNfPwIpg+/TJJfEOGPdmhaBD/8+BlAA3O0GU/uUnzPuOG7Ja+vJr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0pI1Uzxr; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0pI1Uzxr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pG9PNqQWQnIsAxJGk0Jj3josO+JUWwQdyXB3Kywl6oU3Kzd6uH1znJ/iPD+tv6EGNFXIMREQbrht7SCmfresQlT/5pDI1cIB5UFjVxHS6iflVTfKP0pD8bEZs4VQ0KLJgUA0wOfXrQgKtaCl7OfcDIBKFOzOhDhUumHl42BwtQSpS0l48eG/rIjhXnAUdXNr7aL33SlXBCzESjjtZOzkXsbtc3qM6nWRaVxZf6zefG5ia9SfEE604cmqqtCRCLr+eOiGOIgk2YmZM29O0v7D5i+WYWYl7HDhv+uJ66LEp3BA7BNfCIeZbPwbnGe+E8z7Nd+PB8l7askEnGQDo2M6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDf5tKmMkNzm3qv13AbvDaWWJER9rJtRZbL6ZzEGrKw=;
 b=cZuQGZEGSRjSH0IY8aBU7qPYsI+gHafyuERH7KXCe2TxZ8ZWuBk7oPtdjY1UpOe06D0YMzJtu5twBRAyZW6WhsvjuRRNCeWXgq3cTImYDzhMhIFGzUiLUZvOg/jyYXhzkx5E3aWpI/frhtW9yVV8RQexz1uon8u7+1YTcwKrGu/87x7bQolytguvGJWZQ4JqAcTmMvRuW/D3PH8SFPszhByYdeCLIQ4D7M/dj7RZ9hSL4XKdZHqultldx6ZeFTUUh0/35uqbyZJfDRORQD1CWUZPdFz9VJkHcZSZ2D3QvOVJXDkbFHE9xgzI9thaxwMgU6nCx/MppgLdKHZlllE4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDf5tKmMkNzm3qv13AbvDaWWJER9rJtRZbL6ZzEGrKw=;
 b=0pI1Uzxr2BGJMj01UcmfVhv4r15ZKzkbQwK0OqG2gkl8E8ozi9aj6FZcbYogX8dOxRDbvbWF2ggLXrJ3Tbgvf/EMf+Ff8cLjZdGEGT3oUCOOwe5qxyF4FR9/v2ybERlo5P5AGQXeQxzIVOcK2cqbId/R6dmwdIHQUqep3ReCJJ0=
Received: from PH7P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::33)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 09:01:13 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::f4) by PH7P221CA0003.outlook.office365.com
 (2603:10b6:510:32a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Tue, 13 Aug 2024 09:01:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 13 Aug 2024 09:01:13 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 04:01:11 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd/pmf: Relocate CPU ID macros to the PMF header
Date: Tue, 13 Aug 2024 14:30:39 +0530
Message-ID: <20240813090040.364504-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd9c6d3-e6ce-4c63-8536-08dcbb767ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h/G9DEP1SMUU7YRImCSSgGluIbgkzZTsfF/FmmSRT9r/j0HVskfsXdAryA7m?=
 =?us-ascii?Q?PbikeXUPYxgFKRenRPeORg6Y/xdVu6derzY0BdT+nG4OIQgQaRrClG9jlCHx?=
 =?us-ascii?Q?bqd76ETKgjiNyKous4FK1FBtt6PXFwxLLffIN0xd48lPd65bs4hwEeRTU2k/?=
 =?us-ascii?Q?7AuucNbx4VSpSa0Vv36eNqcRTK8o8vGj/QkFrFtzlM/h1ArKrWcpWAzd2pS8?=
 =?us-ascii?Q?HYQIo6rZ+CvyxcK36hjxLgK/Z2bMVZH6+UETfX2NaXYwLLGNPezJ+sHsGdN5?=
 =?us-ascii?Q?pvJkslfmQNqgUGkuom5Bas5h2NfpO1xUtK9gyFXCdBpu8oRbVxNJKzQ0IKO0?=
 =?us-ascii?Q?daEDEC9/QuMObld68vD4lz+leGAF05apeFbXdpW7JaxHSnZeGvO7qmjoFEbc?=
 =?us-ascii?Q?qTdZxmNqWRcNUFXIMkOlZsLDQHcIcNYXy57qjoOt4ywYltY84GNPBKlpF3c1?=
 =?us-ascii?Q?oQTkoHZZHm6dPuSVBv1TO3nNP/yPdtrM06/qd/pAue2cGXxqQ9IDYPmV/ITC?=
 =?us-ascii?Q?TZ07VMDTvy9uOAwa8+nqoDRvNxXzwbCwGUlvRe7TqWLQ6YVu5rv657izRF4R?=
 =?us-ascii?Q?Ieue/T0gKlTS7XOJXkskroX0YO+U05WOEH1KLVD0UrD+WzWP04OkBU7f94kt?=
 =?us-ascii?Q?RM22kQveEOmzw+7HqqPs2pkjaptCPw1b+cpSHS3NznJf2wIocksAjLYfnYhm?=
 =?us-ascii?Q?e+Wwai7RFv692itiMLmmSH9/9F59D2jeJf6YazWvx9Dc901z+FZNcXcxUplu?=
 =?us-ascii?Q?PNvFS4rtWWhOgoZdpRaZlChE2YrSsjrCsX1rCPqwB9eGuRSpgSFit1rr1b7v?=
 =?us-ascii?Q?PBQZkK3X2euLlgp5LGhOsNYHMz00DtdcOIAaqFsBdX5pl7eSVwt6n6mkl5qz?=
 =?us-ascii?Q?Zv5WZU+G4BzIVD2qb1zMka+JozaPZmVGbIqVIhpVsogE0Q6DJ25WGctj0MvW?=
 =?us-ascii?Q?wTb/8gCoNei8DxKqOKbj9aRSDGVvfE7MFBYv72NWK3itqweIBeQpBa6Oqt3u?=
 =?us-ascii?Q?KppVNBn2OtwSXOF6eQxsWdGLTdbQxDEiK4/A//iOXEh4O8qQzz7CMh3YhCi0?=
 =?us-ascii?Q?1PPdwdMGxnshAUUtACuZgtXpupZs1KbDkHPjsFm22M4LV5eJT6xsF7VEy4xR?=
 =?us-ascii?Q?1X4aqhs2bnCKOVxEMu6T+eGOt1XrAxSBqXVM14H2hY8f4bklOsI6YFq5IR6t?=
 =?us-ascii?Q?k/MR4SX0mZeR5YwHt+Hj0v3aZZWBOGSlgSeLp+1swrda6vA8quyi7cHioPHn?=
 =?us-ascii?Q?iaiWuEr2H9hNejcPMX4mRNqCJyMnslo17iHjFqqxwMnWrGBx3DwBWJTrVkJy?=
 =?us-ascii?Q?rMNux5Ahul3+4O8ywaSgjBcDLVDHB4Fr1R9aaerU4vRUSXMPpP6/1Ov2881N?=
 =?us-ascii?Q?la6EtfORPuw5Ts8A0+ur7wp42TkUvHOJOuN5mZNqG15oamRfntOdlDs2gMXz?=
 =?us-ascii?Q?t/F3KRCY58y3s1+LwRwOg659vIwurVFa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:01:13.3875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd9c6d3-e6ce-4c63-8536-08dcbb767ba6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312

The CPU ID macros are needed by the Smart PC builder. Therefore, transfer
the CPU ID macros from core.c to the common PMF header file.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - No change

 drivers/platform/x86/amd/pmf/core.c | 6 ------
 drivers/platform/x86/amd/pmf/pmf.h  | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 8f1f719befa3..88314b0277a3 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -37,12 +37,6 @@
 #define AMD_PMF_RESULT_CMD_UNKNOWN           0xFE
 #define AMD_PMF_RESULT_FAILED                0xFF
 
-/* List of supported CPU ids */
-#define AMD_CPU_ID_RMB			0x14b5
-#define AMD_CPU_ID_PS			0x14e8
-#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT	0x1507
-#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT	0x1122
-
 #define PMF_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9bf4326d06c3..9fc26f672f12 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -19,6 +19,12 @@
 #define POLICY_SIGN_COOKIE		0x31535024
 #define POLICY_COOKIE_OFFSET		0x10
 
+/* List of supported CPU ids */
+#define AMD_CPU_ID_RMB                  0x14b5
+#define AMD_CPU_ID_PS                   0x14e8
+#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
+#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
+
 struct cookie_header {
 	u32 sign;
 	u32 length;
-- 
2.25.1

