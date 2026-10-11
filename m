Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010044.outbound.protection.outlook.com [52.101.201.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015942FD69A
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 10:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791713238; cv=fail; b=XrdI46QncUxlSlR5Ay1MWGNXzdgSaHgKGp5g+kI4/14B1FqMNeMzWRNcLGoOaJSXu6pmj1mwY4GrToX0GPgBOetTsrPy74aCMNqg3W0oTr1A7WMVMPtegIOeVqdDkCYzcIQiLA3w+XZNVsE/lqEHpUDFWTJBx5lONeG4EuHV1Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791713238; c=relaxed/simple;
	bh=DSnxdRQxgyUy91fSVXg9nITAN+wONrSEZP60TPHRT+o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JgDY1oEfLiRTwkKKxAWO5FFc4FqfUxRTadpsEQfDoU7kaZgJ1CXyr+OeNFLu4WQpN3FanZPBi/r374IASEzxQdd9ueEbIc5Z2fykak8Cb32RbkIDi/lWI0tItlLXXjuCt79gdF/9ahz+3uYPp2VxXah60KW61vBPt2vg4fPd/K8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K21suEEC; arc=fail smtp.client-ip=52.101.201.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K21suEEC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyjzHw5RNcjQsLYc8oVKZjER/p85QesudaN/DS2EHVZxQEjZpx7Vk+llvomXMMg8UBTDAXEs8/5m4ZuW0aF/dRu+QuIPf6M2/7tm1darEGnm99iSiTJTEF1KBDEsJWEqhA4byl1iFuUZBBdQjHU6mdbVFKhdqdkRMqZTKUZ4xxU8JNIzr7aHBnTzi+upr6zelGRTnbEcbOsLbbXaQ0Wm+xo5wz5PTL7MX0R8yjqY8uLgEX099EoEMy+RGDG/LnLgHVDBYBTpV3+WuoPnQSLqBXRoYnGR3zoT03QGv9Mjcmkps8C/txLlaMiYLbf/QLc4TfjnUK+3R2QdTn/WbaHbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUz7nlJ76UOVdR1gQ4301XOgGhGIT28Z7ptExYGeG3A=;
 b=g/sqIj4oMAeikwi9Lg6xea2YpV9sPhQuU3bWgvyBW0EEqp8vcDDd1Tnk8aWN9uZjd7QWZ0aEQOWpTe046bSJXzWrKT1u+vztsDyFS/vX71IN+4ZQ2QD7E05bmI8zifjzDoqW7fp25v9EOY8T09eeTvjM98msOoc4CCwYyiC1Qh4BhFPiddowqbsnpsbvVpHyX4FiRgbwYmQ/WTSwIG4fUDK5i/0upRtOpIKSniHcASbcgIUKoSeMylXKdwMBZv1xlDHsyuavd9EoICAyTqq+53J4vqADoMaExXvxN3551ki2nMEQForKeQE2GeoQ+bFHxXr4SID5pJt3WZKMJtw53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUz7nlJ76UOVdR1gQ4301XOgGhGIT28Z7ptExYGeG3A=;
 b=K21suEECi94FEHi/VotgAs0uYmji36rOkC3bhOBycc8TkQ7OI/CcZN7eCdo1Y+j3u8SlzYS9ozdGH3/jtw8eflrg9lPLB3oTS1IO9rDP/3MOoEn5DCkYkPW1wjC85J3sz6eb7QfCrqpkrH2v7RZ/SszZqj2zORAHDHMW8W3n0WM=
Received: from BN9PR03CA0479.namprd03.prod.outlook.com (2603:10b6:408:139::34)
 by SA1PR12MB6846.namprd12.prod.outlook.com (2603:10b6:806:25d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Sun, 11 Oct
 2026 10:07:13 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:139:cafe::a1) by BN9PR03CA0479.outlook.office365.com
 (2603:10b6:408:139::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun,
 11 Oct 2026 10:07:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 11 Oct 2026 10:07:12 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 05:07:05 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/8] platform/x86/amd/pmf: Get policy binary signature size from PSP header
Date: Sun, 11 Oct 2026 15:35:50 +0530
Message-ID: <20261011100554.1841309-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
References: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SA1PR12MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a30edff-b898-41ab-7869-08df277f6b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|261009223027099003|56012099006|11063799006|5023799004|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Z/Kk5+rLH1UnGXenVoMyt+5CfoMWLgcGCH5AOqMSx5Awa63Z9dlwpNOc2a5EHkLJqQAsJ34wFSXxnaVV4RjkOZ0vqsXpxxz/c3PPVsSDqh0aWyLdQVKikbd88c/ZRGXPri0ZaW00BcGjNe32R1q5EHJbx9iiS0GvS9GL9SZqLOMHCX8CdweJn13FtKzlSiVbzEQlGh5pr+SR7pXBAup7rKzwCy+zZeFoLy/SZLKGcWzrjm98Rkl2xJ0odkcWkKX++q2MMCG0B+/pXCGHNOox+299/33SfKlxQxYV3c1Uq1k9BmjPuKOtaFeoHgeeQf4MSRoHWl7Now1SM+M40NPAzTiHmb+bMk9S4xrEmjBLr9/8JQM9iuM2/c643Tm7CzA/JJsYM04kFMk86XAg58qmnYpuiX/3sWLQlkyO8ReZwJQSV7zqjrSTvTnVmcuMghvtoeZyZbFbx4cWuNn0cE5lGRXXV318izotdonjY3yMiil4m2Yt/jo1lppM1KXnnjfLsDl+BEAXF4rZuUSwB5aSL2IbuxolPmKtmMPQO/ofiuHG6d77LHqL92l9GH7+iG8AWd6NcpfOljsCPVuWgEzEmT+RU2PDAb/nL/VQrlm5yBzrlC6ne8kiH00s5ssiaEkQGyMN7ZOk+b2VbdVc9KmDCL03iQrFXK0aleaXleGzW2wTGC1E0kIxHCXd8kjcC3djCNrnxLtY97kmGuPsrkvQrg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(261009223027099003)(56012099006)(11063799006)(5023799004)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KtaXtCsHkAFMPZkx0Jv2x+75Vublokw51uZQXW6ldlWg37Py5I7AE+pEFB/q6bFRu0Il7YAIBLm1J7J3u1roGCva0xbmdSwnN4CMXFn3ap8SnexgBttO6R2yn0WkRx341R82aaTMh2bU8Ko8cNb59XQ0C2XLOoxBlThW9GJhDOXV5842E45VwsrTB6cAqh6j+bR5x7mR0VgSmVoSEHd6HejOCfX3TjfKnHOHXGsnnzkE7YmOCOz4ORyrqCkupPzIn8SxApbFunbNcY99yeRfC2eg+ID177p3BrZYYacKVwtVcv7FdauMnBltYvwklWEz6mGJaMar6CbxmH/9KeKknTKm/dOiD/XHCtq8nstE4A8w6u0t7s+waZcNjgROgPyzzT1gvt4oWyBIFMCJl7yH1rddQFggi4q4kFXhPsKRQUO45muPx5ggbEqfP5SnJKuo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 10:07:12.7971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a30edff-b898-41ab-7869-08df277f6b89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6846

The policy binary size is calculated as the payload length plus a fixed
512 bytes, which assumes a 256 byte PSP header and a 256 byte RSA2K
signature. Newer policy binaries can be signed with RSA4K, which has a
512 byte signature.

Read the signature algorithm from the PSP header and use it to get the
signature size. Check that the buffer is large enough before reading
the header field, and that the size calculation does not overflow.

Policy binaries with an unknown signature algorithm are now rejected.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  8 +++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 34 +++++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index d9fa99c2750f..86999802602c 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -29,6 +29,14 @@
 #define POLICY_SIGN_COOKIE		0x31535024
 #define POLICY_COOKIE_OFFSET		0x10
 
+/* Policy binary PSP header */
+#define POLICY_PSP_HEADER_SIZE		256
+#define POLICY_PSP_SIG_ALG_OFFSET	0x34
+#define POLICY_PSP_SIG_ALG_RSA2K	0
+#define POLICY_PSP_SIG_ALG_RSA4K	2
+#define POLICY_PSP_SIG_SIZE_RSA2K	256
+#define POLICY_PSP_SIG_SIZE_RSA4K	512
+
 /* List of supported CPU ids */
 #define AMD_CPU_ID_RMB                  0x14b5
 #define AMD_CPU_ID_PS                   0x14e8
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index e145eb7b03cd..9b328be1e8f4 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -11,7 +11,9 @@
 #include <linux/array_size.h>
 #include <linux/debugfs.h>
 #include <linux/dev_printk.h>
+#include <linux/overflow.h>
 #include <linux/tee_drv.h>
+#include <linux/unaligned.h>
 #include <linux/uuid.h>
 #include "pmf.h"
 
@@ -327,9 +329,32 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
 	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
 }
 
+static int amd_pmf_get_pb_sig_size(struct amd_pmf_dev *dev, u32 *sig_size)
+{
+	u32 sig_alg;
+
+	if (dev->policy_sz < POLICY_PSP_SIG_ALG_OFFSET + sizeof(sig_alg))
+		return -EINVAL;
+
+	sig_alg = get_unaligned_le32(dev->policy_buf + POLICY_PSP_SIG_ALG_OFFSET);
+
+	switch (sig_alg) {
+	case POLICY_PSP_SIG_ALG_RSA2K:
+		*sig_size = POLICY_PSP_SIG_SIZE_RSA2K;
+		return 0;
+	case POLICY_PSP_SIG_ALG_RSA4K:
+		*sig_size = POLICY_PSP_SIG_SIZE_RSA4K;
+		return 0;
+	default:
+		dev_dbg(dev->dev, "Unknown PSP signature algorithm: %u\n", sig_alg);
+		return -EINVAL;
+	}
+}
+
 int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 {
 	struct cookie_header *header;
+	u32 sig_size, total_sz;
 	int res;
 
 	if (dev->policy_sz < POLICY_COOKIE_OFFSET + sizeof(*header))
@@ -342,11 +367,16 @@ int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 		return -EINVAL;
 	}
 
-	if (dev->policy_sz < header->length + 512)
+	res = amd_pmf_get_pb_sig_size(dev, &sig_size);
+	if (res)
+		return res;
+
+	if (check_add_overflow(header->length, POLICY_PSP_HEADER_SIZE + sig_size, &total_sz) ||
+	    dev->policy_sz < total_sz)
 		return -EINVAL;
 
 	/* Update the actual length */
-	dev->policy_sz = header->length + 512;
+	dev->policy_sz = total_sz;
 	res = dev->ta_ops->invoke_init(dev);
 	if (res == TA_PMF_TYPE_SUCCESS) {
 		/* Now its safe to announce that smart pc is enabled */
-- 
2.34.1

