Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010058.outbound.protection.outlook.com [40.93.198.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF55509EED
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 17:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751040; cv=fail; b=lgGsaPqpx27unjae5dUS6JjdDuHd3i0a3U5Np0t1ZpnW7BqYNcVFJmsrR4c3R+nNmgLooJp+snRq2f0LiUFPSCPdNSW9ZIiZj00Sqh15wuOAsaFIh/EQZ+z44XkM+9du7mQ8rZAEWY2vuRSf6U0VsTPUfExc91yamGU+4A+Izss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751040; c=relaxed/simple;
	bh=Be1kurNo3TjgLSatxf08UC+7tTnD6p99A7w7MYvbmNg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NH+LNmWGqP5AV5zs+QhZD3JKi+o1aOM77ZVkcsAd0giftTCbF/8z1DiiZfgYlhDmg04NvBvDA8EK4xGBplPvNlbvh5auMas3gGlx1PuwV4Y+0xtQYaM5AWqmYK/zkhu67jHyljQoZ9ZRMZAg+AQgivw+aL5SwmnkjetrF1twhBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C8f7OAqB; arc=fail smtp.client-ip=40.93.198.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C8f7OAqB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D67St+S3curlB8WZjEl1HgN2ZAF9RkLkxaQJAdtaOIMcj3aIqhyRsMqgs6WPZTYkKb7XjzBrrvr1Gzs82QajV3iI23M4XraQSHf93Gtxjjb3JXpt+cpzo1pXkCC7V6dsFOMHoXpTe1jpkclHQ/wWRPQAxuv1dZCMIDdws7+2HhEZaNhCITFoQE8W5JS4j1Js274ImM9ek+J0D4puJG3DaApX3uRM9vUz2ohD0kQHV8UeUFUAYhQSo3seAAseGC0rw67baM9vXYqy8v40PbMzfoDbL6NFOs1c3UVTn7Fu+DtzyzI3meyB0ox4TbYcy+/1IVph0oa7Mw+Auvt/v3C+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yykgGVjfQdW2URMxSLiK1Xb7VAcVOMEJUVIcurJTyog=;
 b=lSXdcyeOt4fvnC3NwHAgQFMT+V1ennYfIBKOAy5hyAjXviXwvfBHf/8wtM7aYaOcaoxrnnoY2llVZ8CZnYbqsGKaafjiVWqqBG3Dwv0mAFMVIlcpvD8eynyuFJpTAfaV/VUVWwt3ZLseR6IAGpcQROBHP0688cG5M0NJcPWta2fIve+/GXuA6pXoJccs4cIBItuXPdQ1gLwZ7l5xIxylUW9CInKvaGMjzPfldpsI9btLgaZr0bSxuvft7nkvU5Ng5dboGhhkoCRAXtRsTu9SSmUBJWClxVX7NjzqadlqVQfbPZfKGWTjpxu5J1GFDXZYjpyav+JfxNpw9truSWh8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yykgGVjfQdW2URMxSLiK1Xb7VAcVOMEJUVIcurJTyog=;
 b=C8f7OAqB02//67qQrkzQwY9kKFvM2rUhFSd0dHEWc+ZMmpqWidxThegONwlH4pl4Nm5yvG6sD1G+Vn1Y0GjFtoYt1f2ahqz8RztWwFMz3bF/KewKEBSwHy8l4gw/gDns2c95wiaZ8/m6rDY63hI1AdBQuwGvQnULzDOOU7/2ts8=
Received: from BN0PR10CA0022.namprd10.prod.outlook.com (2603:10b6:408:143::30)
 by MW4PR12MB6998.namprd12.prod.outlook.com (2603:10b6:303:20a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 17:03:51 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:143:cafe::89) by BN0PR10CA0022.outlook.office365.com
 (2603:10b6:408:143::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 17:03:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 17:03:50 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 12:03:49 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <Shyam-sundar.S-k@amd.com>, <hansg@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <superm1@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH 1/2] platform/x86/amd: pmc: Only create amd_pmc_idlemask if scratch defined
Date: Fri, 18 Sep 2026 12:02:15 -0500
Message-ID: <20260918170302.352054-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918170302.352054-1-mario.limonciello@amd.com>
References: <20260918170302.352054-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|MW4PR12MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a9b893-6480-4ca8-bc0f-08df15a6d00b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F/pdeogEacv0/BNVEsEjNKisG9yWoxO+z2QB49q2Po92mBZmmGtkRDqTHFwKFBToDCR5Pve83RXOM3RtuAXDMwFPH9B1KAdDfHbYwk8WIoe49N+g/hj4k9vXGxj9ZKCjGOEtcPF+ML7pwqA4rDR4PwgkaRu/ZTO79o6clfA2q6YheEqFSE7OWqg/aQnraOl48sGITuD7ynQ2CPKGXg2jVU42x1vJfeJBCe63R48ayUUg8n6Y4PJyWZyyTPJFvY2XLBtoYkHkriuYzdaRB91SnDkZvNvWKdf2ntoeqBAyI9VVD7iAhssKH6oI7Ncivi2q6u0sUJr98PXM0lXL9839NZ84ikIWle6j7Mq5GU5AX9A+jPg1uMZlGbKuXtGoKakwUeiUHubnC9LFP1uudvGPvXDEeVoYJLerYYAA2JtZjQq7gMPBWR1AZW5avc9GICxI+kDLXWqlaVUqYiTBAHYcFshsN0A15LY5o3dNQHUtPmk8yBPIPY0KUAYssZs9Fq04TDRoFO8xKPvMDZ/F+gX5pSVWfJAfjlY/VBHEPKltacQhP7D/bI5aHHLQdAzTlu2s1QEh0+Qnl58q/kYnzgrvtUvau8HZ7MUEEWme5yZ2I82MRLlckigEIl//zp2Cc70JBlqJ0bC1nxGwywxlciklymr8AK+JHLbl7O3baX13MZ32CLX4pxYkj1a6XjMbBQwAjTXyho/Vjpxe7k2ohWVuog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7FltJezLehr1Rk8IEK8vO7imhVyLjw8CowzCYPjWy5mauyzUmB08mMBjbUloQyBkGhXIN7bH3fSgZVlWfoB0XsHuFAXkpo27Y2NPKoHj2wUFIFOfkjtf6NA9orRBE4oOMADuuUXG5h/HGEJgA5D4C5HOqUGlWmH6eK5A9ckJbToOXvXcGi7mgMU7nXiszSuP20eRu/2UY4lk+A/8xTnkMZQiz+8ZZfdGnSKAsTCPBWDGLNSdbfxN8dcksbYyZZbi9X88iLdc+rH17657iR4MJ13KOJdbMmnN0e3x5WmDR0y5RmVrf71RPXJyuo7LaFDxAFjfcaxQD3x07lue/m0vJkp+nvp0PvUNm9GgoMYlJmz61eu4wwi1qDUHJoKq1aPzLmVRDjnpaSVjo8uLACuUpwrTzSt2W2PD9YjcScicWB5Y+oYrsXf3OsinDlfby1hu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 17:03:50.8661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a9b893-6480-4ca8-bc0f-08df15a6d00b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6998

If the scratch register isn't defined for a platform, the debugfs file
will always fail.  Only create it when declared.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index e384b56d67559..666ecdd8888b5 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -517,8 +517,9 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &smu_fw_info_fops);
 	debugfs_create_file("s0ix_stats", 0644, dev->dbgfs_dir, dev,
 			    &s0ix_stats_fops);
-	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
-			    &amd_pmc_idlemask_fops);
+	if (dev->cpu_info->scratch_reg)
+		debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
+					&amd_pmc_idlemask_fops);
 }
 
 static char *amd_pmc_get_msg_port(struct amd_pmc_dev *dev)
-- 
2.43.0

