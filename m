Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7285F34EF03;
	Mon, 27 Apr 2026 15:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305134; cv=fail; b=RTNhd9YlBtiGw9plHDpYdo9jXWk2NIbJsCG6ZQJpHR24GVMIjl+8F/EjOgXTP8aPJAv5ItKRaOUGqE8r6WJ3EbPgx8NEDW33Vrx7XCYaV83Ji7WdzIXLE6Wq3UM4yv+BSYPLvdc+Xk+J458ccSf6mFvknQL8D0EkAN7OeYhPOMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305134; c=relaxed/simple;
	bh=TIGhrN7hj1hN+QvueF+lwNLEzoQ6GI1l0hxxXxwkDU0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYRKdqrqXdMug94O/LJ1i7G1Vn6KV3iaMVUPi522dkLDN8VWqWpHXAoapopstqihiGmZTP/fuLwMNNqKcg0hYl5kAXbYPeIUeNLwWjEjHqxoUWnzQijWJn5lJs6j/HawJFcp5pAYNXhij3+rhImj7qaEGO3VmyEvx55Q+oV+uB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AYD92YMb; arc=fail smtp.client-ip=40.107.209.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AYD92YMb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyaDArN/fU91/hXAgDahNzDdc6HZXn3Ze9TPUK2B4JN2TFWKetkgQMjgD0mSky7gBLxYnMVP13LA5VPLVqN/4XW7sbYpZ+jnSV/9Y13Sxsk/uHPYEnL5zayTj2tatJ9qs8lbspXyLUeFYcGqmQeKkMpl7m9mY0rzxXsgoCULaSjiRgl1ud6vjM9ybMSLmkmTLC7+0HqPQINu6jaPynRaVq9jpItBF+6tZz927/ez0ioAQwNoJVXUWwtUlWvSoAoIOYdjVXX+nDzRXEwYW4/sbKbYhNabKmazJZCjnvTku+ZoutvMs48XbZMwY2sYiZSFeKnGK5nbvK+NizF24xekVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTI9Z1u1fSbev944WmoiKucxnD9AqHxNDQvBF7YVWx4=;
 b=wEkm/TI1oW8NlhJOvjMMWggUwbYt0GovYEU2TyJOzzrddr3+foXYji9PnIXiSketfzaxuskTjyA3fnJdda+JqkakF+ZHTDKuOPmj1eBck4kpovhJNLxV3l2Laopfau20D0OB+R+8a9oZFF0iN7Fn8u2hGg0JnDf29SQtvxCCRm3rdqpDG+pVN/TFCZrjnEhnE8mJeIaynMF5/4sM3Qvb7f2cAr7bS/8szYxrjqslXw1aRDSrQvnI/yzkAjzTBVLDVtmWyyEbBxLlYKMOatynMPTuVvAZGmwsHmCbzidB9jI5DQ1Q3ih/POs7eubE3h74NlflH1N9xGmGz33fAjY22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTI9Z1u1fSbev944WmoiKucxnD9AqHxNDQvBF7YVWx4=;
 b=AYD92YMbwOJtGeO3RZae1yGFpgAyG/A3xQnnB+1SKJ7cln01lc/kK68AbN0ukefkXNcycbA/v23rJr8E5lZEreHmK3uubH1+jreBaCEue4D1AKBvcAzIzpkfC8rI8hquOjiwxZ1cnKzg+QxctavE2jenXFjuldGiHGorkupAMJ4=
Received: from BN0PR03CA0032.namprd03.prod.outlook.com (2603:10b6:408:e7::7)
 by DM4PR12MB6544.namprd12.prod.outlook.com (2603:10b6:8:8d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.16; Mon, 27 Apr 2026 15:52:06 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::d3) by BN0PR03CA0032.outlook.office365.com
 (2603:10b6:408:e7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 15:52:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 15:52:05 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 10:52:03 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<driver-core@lists.linux.dev>, Muralidhara M K <muralidhara.mk@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v2 5/7] platform/x86/amd/hsmp: Add dynamic table size for metric table
Date: Mon, 27 Apr 2026 21:21:27 +0530
Message-ID: <20260427155129.545327-6-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427155129.545327-1-muralidhara.mk@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|DM4PR12MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 633f893f-2e41-4175-c4c9-08dea474eea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	agoG1/pd6/doGpusm7GcZBYGwN4J/6HmA4/8hQQXgfSPbAHLGXkkRrwEGnuIzlWwrnCPbtVcx/oaCWMeqn5PF7vxu5Yw7XX3JZ65QCkSTp44n98Cyf5eq7lTAROhxm12QDkNlpp/3purJMhcLBrB7pOyvj8CthFPuPRo5C/HqxSuXOGd5wfAQWgQmQ4r+bitbuOx15wYzQjsp1LG6Slcm0FHLA4M/F8Q4Gf3FFPQPpNp+hqkVnezXx0pW6T+kitr+/34ck04Ql2Vd15l3cjAGSVUejDQRLI+8xfY8I6mWiYCmHqt6+P46UQQyeE1I5aX80InwswL1T0AiHdEbQpzDAdjMp/VOn7iV2W73YQKBSgp8SQd6IerqpCF/MH8b9+Rn5wmfeChJuSc3f78sEDuIzjySfssq7FAPGdYMKL8GgsO4D1u1CspsIKLhlmDmvsk7bA/Vy41BMXNgwrrT/mUmX5P0eIte0WorLhTRZ2dnUP81JYks9O93LTzI94OEtAMqnwcDCVSSpQ3i6pSl13NGsjzaLwQgUWJNArzmAYS9vwXUCKRj6JrSXHlzCFqsDLLIdqBxMxtUST0PzMOWFdypL7viNmfUBrqzYdPJWqM7hzmLAjRTu4L54I6445Wj0jdXppVw6250H00BX1YbEYGIFVBx+1JQPrf80GLL7m/O+7IeT80Al4aaa8OZ4stoOl8O1jcPEeZ3D+ZmmQpXmL1jkBlQwpnkNnwODMSB2jEt9nqPr5VwFi4PrrLY25e/NRD5HygAQ5M5ciLVLttmhYDyw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H+h50LvjVu7rBHtZh5zx0h+eu7Aie6rzcK9PdmFFovSnshl3YILbz4YX0HB3kWSW+72RSp+h5v8qyVAHeuaIB5NdykWBcJaKLCYbuWJYm38zPz/hPy5BNq5fZ1ssPdbktwGy3/sofuWtweKBt1qNF5pfBOnYG+oSa7Li+OylaP8a0rpxBWWoUR25Aa95xX/WlgrvGjxnIlnA1BYEd7oTzBdORKOXFOxBaZrisT6C+VjUpX6JbvnTozYSq/w8OwRtODqXue8kv8Q5zxeE6xygNONhMlbmiXG5Ff0iKkfJD+j00aHwl7sF7shllJqsI2Kz/WZo8GzCf8grr+H78/F5s0vBAOrPek3Vjq43my89Ll7Ovl9iZ51wXsjZ6u+mDRWM9lsUB9pJNXUZcVDDb06vTfSTqL13Ep+ZxPOvJrFtRV0imCEr+3EC9Yt/wbBmCDMe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:52:05.9666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 633f893f-2e41-4175-c4c9-08dea474eea4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6544

Prepare the metric table infrastructure for supporting variable-sized
tables used by different processor families.

- Add hsmp_table_size to hsmp_plat_device for runtime table size
  configuration.
- Update the HSMP_GET_METRIC_TABLE_DRAM_ADDR message descriptor
  response_sz from 2 to 3 to read the new args[2] field that carries
  the DRAM region size in bytes.
- Use msg.args[2] from SMU to set hsmp_pdev.hsmp_table_size directly.
  For older firmware that does not populate args[2] (returns 0), fall
  back to sizeof(struct hsmp_metric_table) for backward compatibility.
- Use hsmp_pdev.hsmp_table_size for ioremap and size validation
  instead of hard-coding sizeof(struct hsmp_metric_table).
- Add a bin_size callback in both acpi.c and plat.c that returns
  hsmp_table_size, overriding the static bin_attribute .size at sysfs
  group registration time so that i_size reflects the actual table
  size reported by SMU.

This makes future processor support automatic as long as SMU reports
the correct DRAM size.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes v1->v2: New Patch

 arch/x86/include/uapi/asm/amd_hsmp.h |  5 +++--
 drivers/platform/x86/amd/hsmp/acpi.c |  7 +++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 10 +++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
 drivers/platform/x86/amd/hsmp/plat.c |  7 +++++++
 5 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index da3e3bbfa33e..b86bbc929395 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -342,11 +342,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
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
 	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0/1
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 8044df862275..f3cfc99ef73d 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -250,6 +250,12 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	return 0;
 }
 
+static size_t hsmp_metric_tbl_bin_size(struct kobject *kobj,
+				       const struct bin_attribute *battr, int id)
+{
+	return hsmp_pdev->hsmp_table_size;
+}
+
 static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 					     struct attribute *attr, int id)
 {
@@ -563,6 +569,7 @@ static const struct attribute_group hsmp_attr_grp = {
 	.attrs = hsmp_dev_attr_list,
 	.is_bin_visible = hsmp_is_sock_attr_visible,
 	.is_visible = hsmp_is_sock_dev_attr_visible,
+	.bin_size = hsmp_metric_tbl_bin_size,
 };
 
 static const struct attribute_group *hsmp_groups[] = {
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 9bad58fef304..d6e377078182 100644
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
@@ -398,8 +397,13 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
 		return -ENOMEM;
 	}
+	/* SMU returns table size from Family 1Ah Model 50h and forward */
+	if (msg.args[2])
+		hsmp_pdev.hsmp_table_size = msg.args[2];
+	else
+		hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
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
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e07f68575055..d8dd90dfeb4e 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -62,6 +62,12 @@ static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj
 	return hsmp_metric_tbl_read(sock, buf, count);
 }
 
+static size_t hsmp_metric_tbl_bin_size(struct kobject *kobj,
+				       const struct bin_attribute *battr, int id)
+{
+	return hsmp_pdev->hsmp_table_size;
+}
+
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 					 const struct bin_attribute *battr, int id)
 {
@@ -114,6 +120,7 @@ HSMP_BIN_ATTR(7, *sock7_attr_list);
 static const struct attribute_group sock##index##_attr_grp = {	\
 	.bin_attrs = _list,					\
 	.is_bin_visible = hsmp_is_sock_attr_visible,		\
+	.bin_size = hsmp_metric_tbl_bin_size,			\
 	.name = #_name,						\
 }
 
-- 
2.34.1

