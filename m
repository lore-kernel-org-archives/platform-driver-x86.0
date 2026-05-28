Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF393B0AC6;
	Thu, 28 May 2026 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961231; cv=fail; b=VswGSq/Fc2KpQWzKD0AkgIXZ14ddz0chRRp8RvqVDOWV6nnf3n5ZVG4Y9EAHfW7H/+602A2fpaEHNmCtPw2O1vJTPydvX+01VFl9BUp8lKnhGRn6g7oFUIU+v2+BWOm+Inrh94iYVXpATERYNjaOg8/Wi/T/I7MrjH1prwdXjYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961231; c=relaxed/simple;
	bh=MLAjFuaM/SkxUEtH0R2VGYs6BHUwEZgU+i2EcQFjATs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=olNOYPsTkBXmzxHtuxZv+bx5H7f81UfoUGDeJEdFWMio+JMPz3GpldkCqAM14bPowU4mtDtJwobJfk3TFBPmnRQ7d2XBBvP4nFyjLechqkathpqtWPHyQcZzFPkpuR6e/DGoVBXc5Zs+7Nv82UO2C84NCHAyM7MMxChiR4HJScc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gSI6pL17; arc=fail smtp.client-ip=40.93.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gSI6pL17"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgXG0ZFGsgbQuDhscKzkzdznRWze9F0kvHI4SpGfTUHxwl4qNthWIJ08AXYviMeahqzs8lCvm9v06ryXm4BLzpsjIdnOfDq8FAmK6LxLbyKuiU2gbKTbYMqtVFXEIW44Nl1AWV2ofHtgYPel9b9+vo6RFUZVM8EtxTEa1YkMuAatxK4tCNf3xluqggk9ejBSJ7fHXKOi9mt2gBIkoAQKc568C2gdRyITaJ/o9tBYP62c1WwA0GOep+5uUIdyzLPp069yLDwJIPQ3x9h5xefIIG1dr3f4BEOKjc1NrvxDtk/o4u6tPGdBWkiw4zg/n95bR6ty400i42JMs3h7EgHkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+udk7GCMxUlEQihZUamLzFS5wxkGB3A/fyJa/nwnrCw=;
 b=T8TINP+llSzdan2e7vPz2WVifaFMWn0xlCgumwiQLNnhCYHgopRn1bRhAYeKSWWr6khxoqVE5KeT56R534fdOjK2ebH7y9ZkJiu9L99aM9uM5Jz/3SNPn3ZekdG7RWef9N+UWEY2Xj3EeG1ALhoZS6kw45cAVxlKIPytJGhqdJvy3cjmRMMEEwvhkmIgJYvtSrLBZrC5zdyzRdHNATbCd2YhYY+NNOh6BvLFQKtsH8e5Z0mCYgbAAAXXFJz2A6lmpCCOO8P1WqwiX+HHUY6kaiAZvFklyzBeohQqWplt/FQMmOlIxPzeW5wRlHuZ2TdKOoI6TctdzKrD89r7FC9chQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+udk7GCMxUlEQihZUamLzFS5wxkGB3A/fyJa/nwnrCw=;
 b=gSI6pL17OP1fVnMeEWNYuEtMHWSxXL+0z5UkZJbUCJ3EClZCfysEMOR0Vf2n6RDoScJvnV1YOQii6tf2U8ynX9eHZP3yOduXGm5beKIfg6lxGOvgXqZECeZMAJGKTOZu3DxjmBFZE3Rv3PWOFDlKN0Bp9wLfHzqYDjvbD7V45kY=
Received: from CH0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:610:e5::33)
 by DS7PR12MB8347.namprd12.prod.outlook.com (2603:10b6:8:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 09:40:23 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::a7) by CH0PR03CA0268.outlook.office365.com
 (2603:10b6:610:e5::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 09:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 09:40:23 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 04:40:21 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v4 4/7] platform/x86/amd/hsmp: Source metric-table size from firmware
Date: Thu, 28 May 2026 15:09:51 +0530
Message-ID: <20260528093954.2461272-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528093954.2461272-1-muralidhara.mk@amd.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DS7PR12MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 0040e223-c758-4e1d-b68f-08debc9d2436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|3023799007|11063799006|6133799003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	fklZnYRwe9VLNQEirQX99VS/RhWR8b4aFN6sBzbEFqOqC4GUpDS5zVAOb0Ji3PBe4S/nepksSup55ZI/GxqUlmV9QRTY7U7BCppKrjhAxOgEB4IeFJcSUlAOum8Ags1NWN5+YOynH2tqHdK7AGVTiBhBLb7dR/R/bueuJEKPpbtNTp3DwQWmxazPn4+bCPh/xRzrbchAh8aRI7hhlLCH54Qjdq1oHUHx3Dgv9aZtoHP6xMZEDplq9Un5bQVelfkqFGjvU9MRpaJLIC5+sd9aSc3sQ2Zmb/spJe+u/1zGQATF8o6ZOP2SGxMZ05jlYOfmEhzrXI0/bzrurPcFoJkoK43j0VPdW/6ZJrcqE00KZn8DgXaHHdYxBsAHSw3uzef93nvP63RRkuS01rxHSrDLgfENEDz19Qf7I3ZXKf3tzXqzdGYaWrCq4FPzK9BBGeMURwLhJCAeYMgUKZNjNRhCY0zoZDSFI+aLZ9sxqYH77HiajS1JuGaoYu8w+fX+qvVWO3O6fe2d8oG50al9d8eAtEyyd3x+PCBn+joCw4tI+vP2Lmi+bOnj8QlePpQvqho9p5PiTKDcE1RfEsEU4Nrh3y6AuyGpYRskHCDmb1pZ4svsSmpDT447XdeVZTUxNbv9J9w3Cshf2VI4l/J8puSuIaHjDmleLrvu1feYwJfpV9hvcUCxRz7goK7UJX31i7VxdtwjLlOhPkkAEEG5LPngCY1cqMM+CsyHudmc+BuBxts=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(3023799007)(11063799006)(6133799003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RGwxFgMP1MOnp1tf8mz7PelRRLdHFtrPcVtX5oB/nT/5PeW8nKFsnhP7IEPZKmuAJX0MyxV45VN0fu1P8TIl5JRlNgcfLHxuc1VnhrF2rbVZfdNIYW6E/1bMO1spn9XUgo0eIBHyQhUss5DVqeL8Qye35EiZyuCJ1L38oRhwn6jiC8PeEbvv07xdLsjWUAJqVTnv1P479mWLC9LPY4DjRzDFEJOsbxUkOXAmsAGnQWWfzc4nBO0XlFKT+aqB6y/rh3SB0dpzfyBwgyKj3hpWpwgEk5oWJQjgoA4fODDjLcTWhCV36hu9ryJGSqVTxS1AY2EUCDa7LEK9pJzaWOCj64qGfZ0Kb32ptr+/TyOtTxv6QTpYGn2a1LVAaInE8CmqGJBeBCWg4eRs21XcNyHWndmu2Y4viXB+ViuAQw73JuLaXYkJENrGVaq5h6nDBXdf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:40:23.6228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0040e223-c758-4e1d-b68f-08debc9d2436
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8347

The driver hard-codes the metric-table region size to
sizeof(struct hsmp_metric_table). That is correct for HSMP protocol
version 6 but mis-sizes the ioremap of the SMU DRAM region on newer
platforms: Family 1Ah Model 50h-5Fh exposes a ~13 KB
hsmp_metric_table_zen6, and the table is expected to keep growing
on future firmware. The same hard-coded value also forces
hsmp_metric_tbl_read() to reject any read that follows the actual
firmware layout.

Pick up the table size from firmware instead. SMU on Family 1Ah
Model 50h and later populates HSMP_GET_METRIC_TABLE_DRAM_ADDR's
args[2] with the DRAM region size in bytes; older firmware leaves
it 0. Bump the descriptor's response_sz to 3 so the field is read,
store the value in hsmp_pdev.hsmp_table_size at probe time, and
fall back to sizeof(struct hsmp_metric_table) when firmware reports
0. Use hsmp_table_size both for the devm_ioremap() of the region
and as the upper bound for hsmp_metric_tbl_read().

Behaviour on existing protocol-version-6 hardware is unchanged:
firmware returns 0, the fallback yields the same value as the
previous hard-coded one, and both the ioremap and the size check
produce the same result as before.

The ioctl interface added later in this series uses the same
hsmp_table_size to validate the userspace request and to copy out
the full firmware-reported region.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 arch/x86/include/uapi/asm/amd_hsmp.h |  5 +++--
 drivers/platform/x86/amd/hsmp/hsmp.c | 11 ++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index fce271282348..438ac38d0dc8 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -365,11 +365,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	{0, 0, HSMP_GET},
 
 	/*
-	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 2
+	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 3
 	 * output: args[0] = lower 32 bits of the address
 	 * output: args[1] = upper 32 bits of the address
+	 * output: args[2] = DRAM region size in bytes
 	 */
-	{0, 2, HSMP_GET},
+	{0, 3, HSMP_GET},
 
 	/*
 	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 9bad58fef304..cf9392f99298 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -356,8 +356,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 		return -ENOMEM;
 	}
 
-	/* Do not support lseek(), also don't allow more than the size of metric table */
-	if (size != sizeof(struct hsmp_metric_table)) {
+	if (size != hsmp_pdev.hsmp_table_size) {
 		dev_err(sock->dev, "Wrong buffer size\n");
 		return -EINVAL;
 	}
@@ -398,8 +397,14 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
 		return -ENOMEM;
 	}
+	/* SMU returns table size from Family 1Ah Model 50h and forward */
+	if (msg.args[2])
+		hsmp_pdev.hsmp_table_size = msg.args[2];
+	else
+		hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
+
 	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
-					     sizeof(struct hsmp_metric_table));
+					     hsmp_pdev.hsmp_table_size);
 	if (!sock->metric_tbl_addr) {
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
 		return -ENOMEM;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index b153527e0a0d..e7f051475728 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -55,6 +55,7 @@ struct hsmp_plat_device {
 	u32 proto_ver;
 	u16 num_sockets;
 	bool is_probed;
+	size_t hsmp_table_size;
 };
 
 int hsmp_cache_proto_ver(u16 sock_ind);
-- 
2.34.1

