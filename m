Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795016164;
	b=ds1GqZP7c3KXdg4+gY91SD+olgFj5gbQi+0OTLqGIQ3cKCXhaonxGiRGXYn3PXnjOmpT
	 xSKBAAIPn7dhy0XKl8DmczDhEnqkEtOMQqTGy7yPyS1zhoykt3NQfnKnXH7rJeUygozbX
	 9lDUIpybWe53P3jg7B3yArazG2P2XmxLLzvlLmF5/FIThwC3CrFWSnGvkUWuRESmgkeyU
	 Ri7SJ4hSYDVvlBZrgztmr5En1MFNejWfOFsjnwinbX+c78plx9FUCi+nWHY3tAwKTIjR6
	 XWqKZRTq3j0R5jbZ3bbRTd3VRgWCmxEACxefl75m0EwMV2WyThxZCT+qVzNbdHVy67w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016164;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tr0IsAHb1V5cSUDDIP6RSME8YxJ+w9N3pYVuQttshyg=;
	b=5QMPfucokbb/Nx97eCygxZMeuZvQNRKiv2rFuhqNr7UTJ84AagPu12VFD2lpxb9zT9gn
	 r4DmelB6ejVIJhSO3cGKr8gx7nNH6x5b2296wZcgYB2Q0mMUbL+lFf/XNphzt1AQP476i
	 MGQsx8WKfSu9kY6PFZF9FGAT7KXcaAxuTqKNc6MF6HC6Qi9EtlAy8EB7dpIg2XUFuoVKU
	 UqMhipoSeOUgUBV+R1h8qTqX84yonRF421dt6NyEAgD0NKnGg3dPHas10Oalmt29hMQhf
	 v3o4TiapWkD0mUGe4ntSl1wYGrWtTqIyH8EYFXa1TD/zcDQtyB2MI2I3IpM6ICjDISw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RAV1fvYy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.71
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010071.outbound.protection.outlook.com [52.101.201.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD724606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 15:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD724606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RAV1fvYy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqoO3xE6hJ+zv8lTV1m5hkpLgl3FIdzbt9iKfdkOeAiJyFCwIA1QVpe9VadLKdTy9luoWvQWGg1SDB3yTCXrICDsr3lwF2N16vLSFNQ3pLNN8B8S8AlUc0r1gb7WjAqLD9SoKGVDCjvVo4sm0ao3nO6xbF8OwP1C0H7Ntat0ZYiE1vzb9k1qaJdDN3A4jXNgGkYPeZ8fu00W9ddbNwJ/yvJWDBsx84WoJqU+z/TuG2L2udOE5dtdxXkLh/WMkbwiyPE4Remn6mEPAmffZuMA2zH7/AUMCnkd596vzn0vulxD6Zi0R5hMBrXNvGZwjQeR4aR/trpXsgCTTBz9eKvkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr0IsAHb1V5cSUDDIP6RSME8YxJ+w9N3pYVuQttshyg=;
 b=i80Yws7rbZvKfkDEJFK/QkuZIusJqbL6OdqH4CKs/jHV3Ul3i9wBuNnAQxOZlQnUGiVJhCvWOVI7rYOTxgzxX19V3LQrJw/FY1olC6r/rjkDo9O76i2xOUlFvMPz2crIfsrC5reF+dTivkDpBFMsFF4y/kzbpJT3s0nNovSMxZoF5Chymeycg/hVR33YuH+LH8w2FrSsH6YaWeGWYrD6p+dAUTtMVD43yyhlLnEN6MfdSu8mxT0wcaqmntLTNZ8FFIFKz3Wj/KMo6yoUubH4e94CIiJ7VOODOA8Cu7vj7j5mcaikZ1Yia7qoewuU3XDGE69ZQGR9YyFrAa36qBYBSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tr0IsAHb1V5cSUDDIP6RSME8YxJ+w9N3pYVuQttshyg=;
 b=RAV1fvYygagaAsvXwg1l/t5hqss+OaGi/RKjULcWKSOwXdd442hbQftYa4vw1MDcsjZMAspUZQWUYXNtKESMkv1pa5q0DxHo/s8e7XQRtJQi5hT4zp+GEXA8i95R9IDLpX3iNvEkFLTnclSCN7npdG+i4jxQ7vrMcdDmTzD22EU=
Received: from BY3PR04CA0026.namprd04.prod.outlook.com (2603:10b6:a03:217::31)
 by IA0PR12MB8302.namprd12.prod.outlook.com (2603:10b6:208:40f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 15:35:55 +0000
Received: from PH7PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:a03:217:cafe::1f) by BY3PR04CA0026.outlook.office365.com
 (2603:10b6:a03:217::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 15:35:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF0000000A.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 15:35:55 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 09:35:52 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v2 2/3] platform/x86/amd/wmi: aod: Add debugfs interface for raw WMI access
Date: Wed, 18 Nov 2026 21:05:22 +0530
Message-ID: <20261118153523.3627870-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118153523.3627870-1-Shyam-sundar.S-k@amd.com>
References: <20261118153523.3627870-1-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000A:EE_|IA0PR12MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 34938d22-fb41-407b-7048-08df4589a2bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|18002099003|22082099003|6133799003|3023799007|11063799006|56012099006|261022075727099003|261028144727099003|261021121427099003|10067099003|261021135927099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	yBP1fY+tm4GKn6OURsDGjVzVALATt9T5hTfU4jqE1Oa+Z7vtCkyTTRmxkkHe85La0szQwOclOI4fzsYMNkkOZ/FRgPXUoHBFSy5JwJxkDESbaaEBcRAYVJ1mjWBzB3L67kWuJjfcM0llkZ7JCQRXDA29VUCfMTUx1KxmRFo6nsi8lHME2TPmCf44oJhQ9Rqc1VWpoaU6+c7s1wXtIWeNAo9m/8qwlj76Vme4pj9DLCvfQppfliqW0tOYEaeNgE6E6udNSrnxJnCUr/z/2a7CypQYgTwt16NmgYBeUo/QR/73wPiDsFnod2foRu0fs98I/Pwh3HN1PyGCXmuTg4K4cPQ+sWP5xj2/MFHEnyHtEn63UXNf0ZjzWm3BLRIhMnUOgJqaE68rYbi7yyK5zVGuBvNNXHD50NKiUKMNcoheslJMyEGA5hi4qDuE8QJlm/iGNpMmTBX5MY7ARQIoURuU5Wzm8D8qW2Hxji1ye4mlHTU0Nnu5NIMVDcHdQl+jBf0BL8BK1UNeyn3nbRF3mA4vIZ1EYyjpt29od3uMlLNasb7XDK8ODeMy+2e60QiGc+IC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(11063799006)(56012099006)(261022075727099003)(261028144727099003)(261021121427099003)(10067099003)(261021135927099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W9O9WB7eB07jAv3wqQpwUiYx6trKmYqTqvKy4l/34ZSBHdSdI0GQh8ts3AZx2lbe251Wforcxbo/CIoxx56ULyUzmPqPUUwBXbko/E2wJ2ysWGa9crh8Hg/2KwjGPyyx6ypC/pyjoUf0sndnFW0UH/jChcdRpL1Ye6GNlUbNdMERtU23Bd+rJR+2Ic94Du4xXRM/cTNPbd63jfAKE7C5r5eZ72CIkVD2Ab80nq1VzZJF0qDx4UdXaXvUDNAGoe+pP1T0CwrT1Un3094nHG0l/6taYnCJOLvkUKWzH43nmBVXYFCz9tFLUJ/3W9gjKfyftY/QDfbCpzKbmgjBu6+3G8Stf1OYBG6SZSELUZU9/VyPqLOC/nGMN0HwhjqD3z6DihwqZXLMz2/4+4GhJOyDRLs6D/hjzeDRsHCJkFveJfIwFG0Giuz3nZ5avdD7X+6J
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:35:55.2154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34938d22-fb41-407b-7048-08df4589a2bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8302

The AOD firmware supports many more commands than the ones exposed
through sysfs, and the set of commands differs between platforms. For
debugging and platform bring-up it is useful to have direct access to
the WMI methods.

Add debugfs files to list the supported commands, query the range of a
command and execute a command. This interface is not a stable ABI and is
only accessible by root. Executing a command this way skips the checks
done for the sysfs attributes, so it taints the kernel.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/wmi/aod.c | 273 +++++++++++++++++++++++++++++
 1 file changed, 273 insertions(+)

diff --git a/drivers/platform/x86/amd/wmi/aod.c b/drivers/platform/x86/amd/wmi/aod.c
index d92d073a27d5..db61a33b9eb6 100644
--- a/drivers/platform/x86/amd/wmi/aod.c
+++ b/drivers/platform/x86/amd/wmi/aod.c
@@ -12,17 +12,24 @@
 #include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
 #include <linux/container_of.h>
+#include <linux/debugfs.h>
 #include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
+#include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/fs.h>
 #include <linux/gfp_types.h>
 #include <linux/kobject.h>
 #include <linux/kstrtox.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/panic.h>
+#include <linux/seq_file.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/sprintf.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
@@ -146,6 +153,10 @@ struct amd_aod_data {
 	struct amd_aod_minmax_result minmax;
 	bool supported[AOD_SETTING_MAX];
 	bool linear[AOD_SETTING_MAX];
+	u32 dvalues_cmd_id;
+	u32 stepping_cmd_id;
+	u32 run_command_status;
+	bool run_command_status_valid;
 };
 
 struct amd_aod_attr {
@@ -586,6 +597,266 @@ static const struct attribute_group amd_aod_group = {
 };
 __ATTRIBUTE_GROUPS(amd_aod);
 
+static int amd_aod_version_show(struct seq_file *s, void *unused)
+{
+	struct amd_aod_data *data = s->private;
+
+	seq_printf(s, "%u\n", data->version);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(amd_aod_version);
+
+static void amd_aod_oid_print(struct seq_file *s, const struct amd_aod_oid_package *pkg,
+			      bool raw)
+{
+	u32 i;
+
+	if (raw) {
+		seq_write(s, pkg, sizeof(*pkg));
+		return;
+	}
+
+	seq_printf(s, "Length: %u\n\n", pkg->length);
+	for (i = 0; i < pkg->length; i++)
+		seq_printf(s, "[%2u] ID=%-8u property=%u  \"%s\"\n",
+			   i, pkg->id[i], pkg->property[i], pkg->id_string[i]);
+}
+
+static int amd_aod_oid_show(struct seq_file *s, u32 method_id, bool raw)
+{
+	struct amd_aod_data *data = s->private;
+	struct amd_aod_oid_package *pkg;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	pkg = kzalloc_obj(*pkg);
+	if (!pkg)
+		return -ENOMEM;
+
+	ret = amd_aod_get_object_id(data, method_id, pkg);
+	if (!ret)
+		amd_aod_oid_print(s, pkg, raw);
+
+	kfree(pkg);
+
+	return ret;
+}
+
+/*
+ * The command lists do not fit into the default seq_file buffer, use a
+ * larger one so that the firmware is only called once per read.
+ */
+#define AOD_OID_SHOW_SIZE	SZ_8K
+
+#define AMD_AOD_OID_ATTRIBUTE(__name)						\
+static int __name##_open(struct inode *inode, struct file *file)		\
+{										\
+	return single_open_size(file, __name##_show, inode->i_private,		\
+				AOD_OID_SHOW_SIZE);				\
+}										\
+										\
+static const struct file_operations __name##_fops = {				\
+	.owner		= THIS_MODULE,						\
+	.open		= __name##_open,					\
+	.read		= seq_read,						\
+	.llseek		= seq_lseek,						\
+	.release	= single_release,					\
+}
+
+static int amd_aod_object_id_show(struct seq_file *s, void *unused)
+{
+	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID, false);
+}
+AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id);
+
+static int amd_aod_object_id2_show(struct seq_file *s, void *unused)
+{
+	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID2, false);
+}
+AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id2);
+
+static int amd_aod_object_id_raw_show(struct seq_file *s, void *unused)
+{
+	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID, true);
+}
+AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id_raw);
+
+static int amd_aod_object_id2_raw_show(struct seq_file *s, void *unused)
+{
+	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID2, true);
+}
+AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id2_raw);
+
+static int amd_aod_dvalues_show(struct seq_file *s, void *unused)
+{
+	struct amd_aod_data *data = s->private;
+	const struct amd_aod_dvalues_result *res = &data->dvalues;
+	u32 i, count;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = amd_aod_get_dvalues(data, data->dvalues_cmd_id);
+	if (ret)
+		return ret;
+
+	count = le32_to_cpu(res->length);
+	seq_printf(s, "id: %u\n", le32_to_cpu(res->id));
+	seq_printf(s, "current_value: %u\n", le32_to_cpu(res->current_value));
+	seq_printf(s, "length: %u\n", count);
+	seq_puts(s, "dvalues:");
+	for (i = 0; i < min(count, AOD_DVALUES_COUNT); i++)
+		seq_printf(s, " %u", le32_to_cpu(res->dvalues[i]));
+	seq_putc(s, '\n');
+
+	return 0;
+}
+
+static ssize_t amd_aod_dvalues_write(struct file *file, const char __user *buf, size_t count,
+				     loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct amd_aod_data *data = s->private;
+	u32 cmd_id;
+	int ret;
+
+	ret = kstrtou32_from_user(buf, count, 0, &cmd_id);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&data->lock);
+	data->dvalues_cmd_id = cmd_id;
+
+	return count;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(amd_aod_dvalues);
+
+static int amd_aod_minmax_show(struct seq_file *s, void *unused)
+{
+	struct amd_aod_data *data = s->private;
+	const struct amd_aod_minmax_result *res = &data->minmax;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = amd_aod_get_minmax_stepping(data, data->stepping_cmd_id);
+	if (ret)
+		return ret;
+
+	seq_printf(s, "value: %u\ncurrent_value: %u\nmin: %u\nmax: %u\nstepping: %u\n",
+		   le32_to_cpu(res->id), le32_to_cpu(res->current_value),
+		   le32_to_cpu(res->min), le32_to_cpu(res->max), le32_to_cpu(res->stepping));
+
+	return 0;
+}
+
+static ssize_t amd_aod_minmax_write(struct file *file, const char __user *buf, size_t count,
+				    loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct amd_aod_data *data = s->private;
+	u32 cmd_id;
+	int ret;
+
+	ret = kstrtou32_from_user(buf, count, 0, &cmd_id);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&data->lock);
+	data->stepping_cmd_id = cmd_id;
+
+	return count;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(amd_aod_minmax);
+
+static ssize_t amd_aod_run_command_write(struct file *file, const char __user *ubuf,
+					 size_t count, loff_t *ppos)
+{
+	struct amd_aod_data *data = file->private_data;
+	int cmd_id, value, ret;
+	u32 status;
+	char *buf;
+
+	buf = memdup_user_nul(ubuf, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	/* Both values may be given in decimal or hexadecimal notation */
+	ret = sscanf(buf, "%i %i", &cmd_id, &value);
+	kfree(buf);
+	if (ret != 2)
+		return -EINVAL;
+
+	/* Raw commands bypass the range checks done for the sysfs attributes */
+	dev_warn_once(&data->wdev->dev, "Raw AOD command used, tainting kernel\n");
+	add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
+
+	guard(mutex)(&data->lock);
+
+	data->run_command_status_valid = false;
+
+	ret = amd_aod_run_command(data, cmd_id, value, &status);
+	if (ret)
+		return ret;
+
+	data->run_command_status = status;
+	data->run_command_status_valid = true;
+
+	return count;
+}
+
+static const struct file_operations amd_aod_run_command_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = amd_aod_run_command_write,
+	.llseek = noop_llseek,
+};
+
+static int amd_aod_run_command_status_show(struct seq_file *s, void *unused)
+{
+	struct amd_aod_data *data = s->private;
+
+	guard(mutex)(&data->lock);
+
+	if (!data->run_command_status_valid)
+		return -ENODATA;
+
+	seq_printf(s, "0x%08x\n", data->run_command_status);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(amd_aod_run_command_status);
+
+static void amd_aod_debugfs_remove(void *dir)
+{
+	debugfs_remove(dir);
+}
+
+static void amd_aod_debugfs_init(struct amd_aod_data *data)
+{
+	struct device *dev = &data->wdev->dev;
+	struct dentry *dir;
+	char name[64];
+
+	scnprintf(name, sizeof(name), "%s-%s", DRIVER_NAME, dev_name(dev));
+	dir = debugfs_create_dir(name, NULL);
+
+	debugfs_create_file("query_version", 0400, dir, data, &amd_aod_version_fops);
+	debugfs_create_file("get_object_id", 0400, dir, data, &amd_aod_object_id_fops);
+	debugfs_create_file("get_object_id2", 0400, dir, data, &amd_aod_object_id2_fops);
+	debugfs_create_file("get_object_id_raw", 0400, dir, data, &amd_aod_object_id_raw_fops);
+	debugfs_create_file("get_object_id2_raw", 0400, dir, data, &amd_aod_object_id2_raw_fops);
+	debugfs_create_file("get_dvalues", 0600, dir, data, &amd_aod_dvalues_fops);
+	debugfs_create_file("get_minmax_stepping", 0600, dir, data, &amd_aod_minmax_fops);
+	debugfs_create_file("run_command", 0200, dir, data, &amd_aod_run_command_fops);
+	debugfs_create_file("run_command_status", 0400, dir, data,
+			    &amd_aod_run_command_status_fops);
+
+	devm_add_action_or_reset(dev, amd_aod_debugfs_remove, dir);
+}
+
 static void amd_aod_scan_settings(struct amd_aod_data *data,
 				  const struct amd_aod_oid_package *pkg)
 {
@@ -657,6 +928,8 @@ static int amd_aod_probe(struct wmi_device *wdev, const void *context)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get the list of supported commands\n");
 
+	amd_aod_debugfs_init(data);
+
 	return 0;
 }
 
-- 
2.34.1

