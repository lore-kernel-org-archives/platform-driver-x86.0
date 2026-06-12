Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931091E9B3A;
	Fri, 12 Jun 2026 04:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238410; cv=fail; b=AQB9zY/m0vc1X5aH8Mt+7MCBPvrEjSeIKPMNyvJWqR5ntDYdaRDfGsjTBM1hTuzITLdsXEYmnSnzwA1+Vj+UPUvxR5KnSZlHmd0ZNePhaQAocBF1SkIg9+H4eUcbJGmhXiVXhSFsqOLUNPZtEjV0wzJqQF8ENJ1JJOpl8xVm9RQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238410; c=relaxed/simple;
	bh=vWKjZ7KhgGyNAV2Vt7SnRCln+UogBeUzEZ3g6+LqvxE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fqgpf5MuJ86z7pnyuxN5eXCDXfBW5IEXwW92JKjn6vYY3umCZ/wChBSJezG0u7HbygOnpwuNHpR/X4sGqNNZtHJO+fn6Hj46PkrmsAgd95NtxYvc34ZBt9vw88tMfcMGBr04dGvS5QBaymyBgQLhD9YGM/d/+G/4BB7tFUNqVXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BdeofhJt; arc=fail smtp.client-ip=40.93.195.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BdeofhJt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfmQcPlq6voZS5zdWfcLXUnkAL6LG+kssQnhB5X4Hk6EKCNEpoAd2PEocSoe62FnD8tmwwfpjVgENXb0af0imLCP/tWkRqWvbDDVMKVdpW59N6SK5+oJFnFfJSest4ECEEWO9pHa2tHDHRa/M5njQY938caeR/VaGCx1kWi/HI5Ek9DHzb/XLQb8qtZIgvWXXJiq1GXZE2MbKZM6z8dkuYy7KEDJ9xoPLlM/zpspIz9NieCEmtbwehaj2bGNx5VG005t3pw2fENaq6imIFwClQwUkNLWUoUqXsEtpMxHjEcnEfocN5yRySfIElLqQ7/ydUlgc/DJJojZh0gOQziAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kLmqlDYtsrrQ5Gv5OUhz0Gt/vZMDM2OtRGu39fLR/M=;
 b=gAlu5WbJbgTOkDJyd13NTTprmjoBlTUsv/hg0ltrNt6EBGA22rw6hqGq/YS7LitvR9BbNSflKiorrWsOIxSmfrAzoovWNUUCs92gADG48c3seWiQy3wz/hiI2jHtBUtowTgsDG44Jo0p4ZlpX4tErFN60qF5kTFzt7ouX8d2D3XiHMyBSLMbGdOs5pO8m7XLtZI1QUXzOh+8d7x86cvfSznx1ycBxQl4e7mY6ep24j614HZ7yWQEB0kOy9cTEZPZ2kTdpQhBe67HtabeEJVpssqDXqLzgUKRYGGUE0y7fBrXlW5abBC/Dl6IFJTom+o5JhLhK9xS9aGw+FPa0v5Cnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kLmqlDYtsrrQ5Gv5OUhz0Gt/vZMDM2OtRGu39fLR/M=;
 b=BdeofhJtQCphHSBQHGjIFcVDSqSvZGpY7i5trXCYFrd4HBgRXCPu/x9spWgniNRHM8/9b4U0VM+cOQja3VF/iVU+cHteDzNvBGoZpjizb1fFoveXHFmroEAub6cZyokqkn26zXb2+7qwCzGbweriv86c6v6GK6PwmK5yZz5Sazs=
Received: from SJ0PR03CA0228.namprd03.prod.outlook.com (2603:10b6:a03:39f::23)
 by MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 04:26:40 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::6e) by SJ0PR03CA0228.outlook.office365.com
 (2603:10b6:a03:39f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Fri,
 12 Jun 2026 04:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 04:26:40 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 23:26:37 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v6 4/8] platform/x86/amd/hsmp: Source metric-table size from firmware
Date: Fri, 12 Jun 2026 09:56:06 +0530
Message-ID: <20260612042610.1629037-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612042610.1629037-1-muralidhara.mk@amd.com>
References: <20260612042610.1629037-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2c6973-89d5-4955-89aa-08dec83accb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|6133799003|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	4celPMX7iCFIen+mmLdVrg2c7e/qy5U9fdQSB4ZBAyW+JEhu+9R+fMgFtOHSieXSf94PpZdXRzXyRUmCLTHcQzw+6Az2kQoinF0eg2UsxKFUzjy/2bePyGNB3U+O7NqyVOUwYMt5da52WRbaBTQyAvMOIOjqQuVzn3J2BdGcOEGUjCnot/9FK/peeyOInkMf4ir6FA4G2167ImoMI9UJFqzEGIpE2r6f4DzoOUj8N1OWAWFdZHXgUUWI024oJs3u6+No1xuQI09oJrCFXBNOnSmGQepic4dMxuL3Nra9DL7LVvstWl/giJvANPXi+GhiVhrSd4zqwioztHc/UimWxLP6LrFnJM4ABBTNQEQDpu09BSOpvurcKd5Bvksy1xZY2SNCTr61P4HaemxUvjtC0F0Jra5yW+1P/+2oL8LZKb38Jf+eamPvr1gKryAwEQZYKvXgoEwP4w7seXHpwd38Ossfvv0eM0ZwfZ2pBnihPNlpfow21QumeTIqV78S9rDuZPcITm5OdJOvlE5sXmC0WPaLN61Q9WNA+/XjK4dUk1r3f8JiVT+q1bB7jEV7B/ruazcWzYclOYLJFwq7cZUGKlv4reGobdUnH33urNgereEYSrgTevF3JS4PMBvJMCAEhvDpYSh8QwT4W9GwYnLBxvuflRWt9tFVicVYryTJRZyCQ3g0stDU1t9aBzFFcDyBAzQbkNLh/lzOCZGPAAbWfcDCxf+Xu8vEixlDVur+44w=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zLr6l0Q/5E4VPD0ceU8VAGKDrxXGPJYbN0JSCsyExfdlBmagG/fha0PDhZeNH87rkEVd3DksXZ/661w7KCllKt4co+ONQZxkbC69Lh+r7ZlXg3QNxeMNxROZ0Jhb7up0rHVt+yqaOHwGQAE/7I0opDdcYQW6POF/WdcY0IGNccCPRJxfee7tSCP8pw3u61uBG+17MORlvLmX7VtPJ8hzZvqUNk7x4tXDbvchf5P0hED+zMQLmJI7Sy5cPar8UEM114n3fRe02rn4qhUa2md7REpM8FMe0oovD7T625NZJv/UA1pA3JPGDhYTbOO1VghKo2rvW+tvUPCH8sBj+5ntOUthXcgCbqJ9sJo8L+wU06tijexGQpVQpOBtVc3/d7W0N5mDNXgGFI6XDUjR8qYW3APQ2VG5l9np0NF/C7WZ5XHMJnUq5Q6YIIJOU4CgEgpz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:26:40.0340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2c6973-89d5-4955-89aa-08dec83accb2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

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
 drivers/platform/x86/amd/hsmp/hsmp.h |  2 ++
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 34e25d9048d5..77bea5ab7ade 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -367,11 +367,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
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
index b153527e0a0d..7343f8a1681f 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -18,6 +18,7 @@
 #include <linux/pci.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
+#include <linux/types.h>
 
 #define HSMP_METRICS_TABLE_NAME	"metrics_bin"
 
@@ -55,6 +56,7 @@ struct hsmp_plat_device {
 	u32 proto_ver;
 	u16 num_sockets;
 	bool is_probed;
+	size_t hsmp_table_size;
 };
 
 int hsmp_cache_proto_ver(u16 sock_ind);
-- 
2.34.1

