Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0BD32B108
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791659181; cv=fail; b=KD84QEFtRhGD1i9rogWWEuF6WBYqJUj2pWQ3VMigaPAkxrd4yCIhUckgSyE8x1yPTFqGR2Y5HJmN9nw/kWn3vyZvFhf3b2aP7uHOW5egHbHVegN4mnCzL3K+CIMIHnenlhe+anwIuJrTv/YS+g4qjc1SUvb4JSXblAY6oJYg5Ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791659181; c=relaxed/simple;
	bh=Tpb6dR2zcz7DHo1y/o5+1QJb20u6TBqg4XD/Dda+kLU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lFDwjA0j9EYmizJxdsbgCClvhIGJJObX6Tfw1ZSNtK9mSRK9AEcORYSbrkqDZPk2gGRyJ0RxmPJmLJ195Nia2lVu3NqAt5UKYGwYkjeos/dIsu+nA4d3E94vZNM7rVx7sSbXhUuOTRZuQk39OBRtx/UAzlTGowsKjEs0u2IaoP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mk9Tj0hL; arc=fail smtp.client-ip=40.93.194.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mk9Tj0hL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2YNoTQrHb9ad/0W6GgQTN9/1pTQ8ojOAQFePbHLEsBibs8tNiVfaTtq6ApuHUtafETMwNksXvvgmSj4QvL5SNHW9aIz7KKw02UBA9YkhNHTH9JRQOOli3A8ZSfG94f9ytGCMIsY963Ya8w3MR/Ibpk4J6QqUftDVZpG9OM3mtz9VR8yCQPK51zb9aW7koec20Y5QU+ckgOEQ3GUx3qte8qyBeEGBUCJv0E5MT2Jzy8xnfKzpwojXoKQc1shQnziFrDjpYqeVNxoQqTTarfUc3dCmdLb6OOaN7XJaxBhsOgTF48hH+urKnuKpPSFs0oQnjfRPqu/DLJLGbn9a0uuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4D68z4Q//0wO1WPUbGe2wT3K+HgKBs0PggxErvW0eM=;
 b=Ah80Vn9JsEsP2+LVEDk//I22OrXjpqsKRtiIYOg4gc4vEm5YNTdEGzLPbqvBZof3xtEIACyAJGYd7LOTUJNOomDu5IuoJE9rn4iyNMQXeI9gzmVNldcEXDOoC183IHSXTA1qZdnVVPuOsP+nc1EElbDP1/ycK07hWamPLRKse6+3v9vQX/KFnQenQBfpqOey+EAtERyiUE35xTMuZJ3QxWHPY0L1GZXS4zG93kaCU7LtvdQEWEcu5NGnlmzxlfU+p7d45iHV1k4R9943ONcwv82OqOpxoHtsrSTGtUZdNiApNB8E00oZqnrFhs2QciLBW+G2YT+mZmk/vEv3IUB8Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4D68z4Q//0wO1WPUbGe2wT3K+HgKBs0PggxErvW0eM=;
 b=mk9Tj0hLjsEq1EwwXs8ksm5ZHVaeyyToS0VEvvXjSPy53pi8N+ftnbMECjg/rmaTRKVKnYail53c6G1/Aa9EfAyv9zlg9Nhlruea7mqKORiejEXexTjddiffEeGTzRwmKoBwNsI3IkHnWZgT95LAHCnhHHJ8X9Hc/rM231emDE4=
Received: from BN1PR10CA0001.namprd10.prod.outlook.com (2603:10b6:408:e0::6)
 by PH7PR12MB7306.namprd12.prod.outlook.com (2603:10b6:510:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Sat, 10 Oct
 2026 19:06:14 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::a3) by BN1PR10CA0001.outlook.office365.com
 (2603:10b6:408:e0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sat, 10
 Oct 2026 19:06:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 10 Oct 2026 19:06:14 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 10 Oct
 2026 14:06:07 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/3] platform/x86/amd/wmi: aod: Add debugfs interface for raw WMI access
Date: Sun, 11 Oct 2026 00:35:42 +0530
Message-ID: <20261010190543.563161-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
References: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|PH7PR12MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e0c4d3-5367-4f6f-3714-08df27018e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|6133799003|18002099003|22082099003|10067099003|3023799007|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	EJgUkU0iT1kAy3SUPlMd3rMUN5g2lWaKdKpGBxO/OVOR781WqDS+Y4Ok/CVMXWUcZPzBMIqLw3emWbzX2kBUd/+dCZRK7clUf8i/ZPYKNq3KomnKXZjKL7kuYc+6r9VRcut4ohEk+ECVhsfy1bEObFvtpFTOFslZIKhzYaY6qZHORgMHEczCd8xoh6Z9ac1SS739pYi4FmfqAGHMpR/Ut/Bp5a9gQwvVTAlv9yi9vEEpYZ809AEmZMm1hTclhIXeVPeNqY0L1ksR3UHDabeAA90y2sqJFb956pqdUgn82PRUJMwj6Tmj0QZeeIiHjDRG8sq8S5b3t2HSTg8q6ItNC4hxVJYBU07sf+Nqo+mQ0nnqYgFRv3zvbiZVDIQklpkMBD/3qcHhwR44iGUixQFLTSehW4HpGVohHdt/WaHtLtFUBoseZj2q7JqotvXIpJLxq70HiJxUJW1VEnMNFvsmFAH/1P6Fz/gmMgSiX1Rh5MKjgfGgs+SLFU06WOIVMNbILMlgrVDW9GSIi8iusIlSKCXbejEP+oD/MXfGNDH2nq2+yVE9z6sM3Lm9SlWibTYUxtl2smneum8j5VKaitOOG6m52lZlp9UANwC153OWqm9M4fc/zGXHuRaBOBPaoOKBabbZiiJnmqc21+tAhUflz6otqZ9QhPm65eL9oSVzamJCmQQ3Q91AITW/3/O7ouBbLtdC5dbV5YHApAkzjvEUOg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sOg30Tm7Fg33JgV+t8AzXf6sEqOLXo3LA5pdD2l2BeS7Qeyr8IsYKpdd44iiZcJUPkvfoLJpYTnnjG0gUV736iCtz6bZPymL3GGA2S/1U/MM8KaiUhna3hDMHiNLLSwrusX5Y+xDqeCpz/XJXYS4u3rYW//Dhhs0NcWITCiIDK+9hciCaK7Pg2zWTYBNAchvqd3j7syD8LpMuOU6JKbhEY265cIILikQ9peg95tCxKLgGZOaxccN3bBrrVGTYLgMTeEKQgQMJdcm0THImv+va3GZZL8/JJyaC5I0IgbcoxyShDuwlNSU1LOLiSSj6+0N5I0JMJHZAKaPWL9boenz47tSvBm+Jlm6YodKhNTZN+oBjt9JbnvhnSc8vOmZ0/rber8X40Dp77S5jqk4DAbwWbTS+xwtO8bBog27mWdiF4pQuDcPeOB8gR0YgYw5p+zl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 19:06:14.2133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e0c4d3-5367-4f6f-3714-08df27018e1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7306

The AOD firmware supports many more commands than the ones exposed
through sysfs, and the set of commands differs between platforms. For
debugging and platform bring-up it is useful to have direct access to
the WMI methods.

Add debugfs files to list the supported commands, query the range of a
command and execute a command. This interface is not a stable ABI and is
only accessible by root.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/wmi/aod.c | 320 ++++++++++++++++++++++++++++-
 1 file changed, 316 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/wmi/aod.c b/drivers/platform/x86/amd/wmi/aod.c
index c64a02b5d379..b7331930f4c3 100644
--- a/drivers/platform/x86/amd/wmi/aod.c
+++ b/drivers/platform/x86/amd/wmi/aod.c
@@ -8,20 +8,27 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/align.h>
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
+#include <linux/seq_file.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/sprintf.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
@@ -49,11 +56,15 @@
 #define AOD_CMD_EDC_LIMIT		0x00050003
 
 #define AOD_MAX_OID_COUNT		64
+#define AOD_OID_STRING_LEN		64
 #define AOD_DVALUES_COUNT		100
 
 /* Property flag of a command: discrete values or a linear range */
 #define AOD_PROPERTY_LINEAR		1
 
+/* WMI strings are aligned on a 2-byte boundary inside WMI buffers */
+#define AOD_WMI_STRING_ALIGN		2
+
 #define to_amd_aod_attr(_attr)	container_of(_attr, struct amd_aod_attr, dev_attr)
 
 #define AMD_AOD_ATTR(_name, _mode, _show, _store, _setting, _field, _scale)	\
@@ -103,6 +114,7 @@ struct amd_aod_oid_package {
 	u32 length;
 	u32 id[AOD_MAX_OID_COUNT];
 	u32 property[AOD_MAX_OID_COUNT];
+	char id_string[AOD_MAX_OID_COUNT][AOD_OID_STRING_LEN];
 } __packed;
 
 enum amd_aod_setting {
@@ -126,6 +138,10 @@ struct amd_aod_data {
 	struct mutex lock;	/* Serializes WMI calls and protects the fields below */
 	bool supported[AOD_SETTING_MAX];
 	bool linear[AOD_SETTING_MAX];
+	u32 dvalues_cmd_id;
+	u32 stepping_cmd_id;
+	u32 run_command_status;
+	bool run_command_status_valid;
 };
 
 struct amd_aod_attr {
@@ -199,8 +215,35 @@ static void amd_aod_parse_object_id(const struct wmi_buffer *out,
 	}
 }
 
+static int amd_aod_parse_names(const struct wmi_buffer *out, struct amd_aod_oid_package *pkg)
+{
+	const struct wmi_string *str;
+	size_t offset;
+	int ret, i;
+
+	offset = sizeof(struct amd_aod_oid_result);
+	for (i = 0; i < pkg->length; i++) {
+		offset = ALIGN(offset, AOD_WMI_STRING_ALIGN);
+		if (out->length < offset + sizeof(*str))
+			return -EPROTO;
+
+		str = out->data + offset;
+		offset += sizeof(*str) + le16_to_cpu(str->length);
+		if (out->length < offset)
+			return -EPROTO;
+
+		ret = wmi_string_to_utf8s(str, (u8 *)pkg->id_string[i],
+					  sizeof(pkg->id_string[i]));
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* The command names are only decoded when requested, the driver itself does not use them */
 static int amd_aod_get_object_id(struct amd_aod_data *data, u32 method_id,
-				 struct amd_aod_oid_package *pkg)
+				 struct amd_aod_oid_package *pkg, bool names)
 {
 	struct wmi_buffer out;
 	int ret;
@@ -210,9 +253,12 @@ static int amd_aod_get_object_id(struct amd_aod_data *data, u32 method_id,
 		return ret;
 
 	amd_aod_parse_object_id(&out, pkg);
+	if (names)
+		ret = amd_aod_parse_names(&out, pkg);
+
 	kfree(out.data);
 
-	return 0;
+	return ret;
 }
 
 static int amd_aod_get_dvalues(struct amd_aod_data *data, u32 cmd_id,
@@ -508,6 +554,270 @@ static const struct attribute_group amd_aod_group = {
 };
 __ATTRIBUTE_GROUPS(amd_aod);
 
+static int amd_aod_version_show(struct seq_file *s, void *unused)
+{
+	struct amd_aod_data *data = s->private;
+	u32 version;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = amd_aod_query_version(data, &version);
+	if (ret)
+		return ret;
+
+	seq_printf(s, "%u\n", version);
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
+	ret = amd_aod_get_object_id(data, method_id, pkg, true);
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
+	struct amd_aod_dvalues_result res;
+	u32 i, count;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = amd_aod_get_dvalues(data, data->dvalues_cmd_id, &res);
+	if (ret)
+		return ret;
+
+	count = le32_to_cpu(res.length);
+	seq_printf(s, "id: %u\n", le32_to_cpu(res.id));
+	seq_printf(s, "current_value: %u\n", le32_to_cpu(res.current_value));
+	seq_printf(s, "length: %u\n", count);
+	seq_puts(s, "dvalues:");
+	for (i = 0; i < min(count, AOD_DVALUES_COUNT); i++)
+		seq_printf(s, " %u", le32_to_cpu(res.dvalues[i]));
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
+	struct amd_aod_minmax_result res;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = amd_aod_get_minmax_stepping(data, data->stepping_cmd_id, &res);
+	if (ret)
+		return ret;
+
+	seq_printf(s, "value: %u\ncurrent_value: %u\nmin: %u\nmax: %u\nstepping: %u\n",
+		   le32_to_cpu(res.id), le32_to_cpu(res.current_value),
+		   le32_to_cpu(res.min), le32_to_cpu(res.max), le32_to_cpu(res.stepping));
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
@@ -533,14 +843,14 @@ static int amd_aod_detect_settings(struct amd_aod_data *data)
 	if (!pkg)
 		return -ENOMEM;
 
-	ret = amd_aod_get_object_id(data, AOD_GET_OBJECT_ID, pkg);
+	ret = amd_aod_get_object_id(data, AOD_GET_OBJECT_ID, pkg, false);
 	if (ret)
 		goto out;
 
 	amd_aod_scan_settings(data, pkg);
 
 	/* GetObjectID2 might not be implemented by all firmware versions */
-	if (amd_aod_get_object_id(data, AOD_GET_OBJECT_ID2, pkg))
+	if (amd_aod_get_object_id(data, AOD_GET_OBJECT_ID2, pkg, false))
 		dev_dbg(&data->wdev->dev, "GetObjectID2 not available\n");
 	else
 		amd_aod_scan_settings(data, pkg);
@@ -579,6 +889,8 @@ static int amd_aod_probe(struct wmi_device *wdev, const void *context)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get the list of supported commands\n");
 
+	amd_aod_debugfs_init(data);
+
 	return 0;
 }
 
-- 
2.34.1

