Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E5146A8D
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jul 2024 17:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721497607; cv=fail; b=LpCkkMdp4Lz0y8lkTv1oMx8hIVZbT87u1q6hlwKs7F3kab0p/U75tFmfTqkesBXf4XCAzO/Sj+Nj8NPOLzcmPBm5eXfT31wbUuEfmB8aAkwjGqpUWPEMtCCzXuJtLFN8ryhJhzJGmnErSlAoSR85wJoUd9iUb55rV1/bnyyQbZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721497607; c=relaxed/simple;
	bh=V1atZGi9gg5EZSwO8s8VbLOZuX86+NYQutuWxuoIFNE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AGmpK1B/F08AMnl5GvqpWNKZ3AfqThM7ofqNFzqcX2c4tsyKUDp5S/CyA7brMqg2Dx3kIwUHQU9Au3DI/KtHrZVz4HK5zD6+/qeAWCi7eou1cA8lcdp0MHsHuFbAJlrnqWIQOqGsWGZd2IgmUxxzbq5m30yYqrUHzbC29eHyaBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u305X1y0; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u305X1y0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMByCyD/2TxsK6VEmYn56PyxA50k/hvBjaSlEqOYmF36AOP3N1PaY/gDI2u56bAHpOnNtp4XXeX0IbSE0oJDDhYC0kWICDOQWTVYsbLvy7/nr+hix2dOprBi+j3Vm2TyITMhK9psHTqNld38MKmp6kc7lyOut/MX0d33B7O2rqeQRw8tBeGRWCIPCgztVkHniwpc+Yp+grEWtPBaTVNS1GBOHPhZrdWNFutmWo9NilFO702zBOCwo0C6CTwIOq065SNDhUpLoiZ9bq/GUsdmEk2AR1p4PCHG55JWszFLeuOlptJVu0C2Q7S8jaTVzoCg49Jy19vqHNazTay3dqLnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubH0sVXjEg9a9Chq9GizBuBEaahpQGGvYJxoE4FsiNo=;
 b=dlhjIbIvkyU4mD4ER6ljc008ZrfKQzA+cy7mklWyzKplV+U6/eQvgC1QEXBzW9MP0oxemOe/IV1/sv3PqMTBlgJGVyh+ecqjGTOpJ1S0Mi5Z9SFtxAFpFp6PBNjS39mdvF7SofDVEgz1lk5NlRvKxokxfPvI00/Tsm6ofGIW6TDbQLs3NuK7q7CMpuus9tfB5GoT7+xe3mC9PWZ1fT8OxBNl26HMQdgyWgwePGibsCE8/YJfb4OWMgtBZ2WfabITVEC0AJZO5Ufvbw/Fvs5yCL6RF0BmXH/EaxLqRDiu3rh9XkdVETB6KrF3roB0evL0PaabbmrtpdcBZF+QOwsw+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubH0sVXjEg9a9Chq9GizBuBEaahpQGGvYJxoE4FsiNo=;
 b=u305X1y0eT9ipAM+Rfb5cC+I5jO9tCZm5t5ziJaDYCSnTe+Jke6kTcv4D3jJZXgJWLShG2qnf1Jnf1tjajBQcKHeDw2eGALigfk+rdr5gthxt4U8U/8VEuj38Qf33sFjIcuCTgfO4ZptUM/xE99kLSPUubOtPnX9L1Lbs/GchY0=
Received: from DM5PR07CA0075.namprd07.prod.outlook.com (2603:10b6:4:ad::40) by
 CH3PR12MB8849.namprd12.prod.outlook.com (2603:10b6:610:178::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Sat, 20 Jul
 2024 17:46:40 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:4:ad:cafe::4e) by DM5PR07CA0075.outlook.office365.com
 (2603:10b6:4:ad::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Sat, 20 Jul 2024 17:46:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Sat, 20 Jul 2024 17:46:40 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 20 Jul
 2024 12:46:38 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 09/11] platform/x86/amd/hsmp: Move read() and is_bin_visible() to respective files
Date: Sat, 20 Jul 2024 17:45:50 +0000
Message-ID: <20240720174552.946255-9-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720174552.946255-1-suma.hegde@amd.com>
References: <20240720174552.946255-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|CH3PR12MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: b57c7c57-4c3a-4d61-12db-08dca8e3e968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uAkLGvkG/oIJDpFP2PRTwnYRpPMyHE3i02HJkHbk+BY0I+8Tx3zcFKzFaClg?=
 =?us-ascii?Q?CqjnRxN0GSHUfbxd8nUw8ziWSX7vUxqDbUTDnnXZGwsXsRbJUcxJFeWsQFje?=
 =?us-ascii?Q?O/ZPN+kAvdKHziqa+ECPdDo5pHr7oWqx6GS4VJJsOaOo0q499xeJYVWtbCtV?=
 =?us-ascii?Q?KNL3MrmAVzJ5WpWD8ZViQJKuqnLUkeWQbBtbEIOKYosZLOGytukKAkEr6PpE?=
 =?us-ascii?Q?ctGPrr8npkkrgZWomnFoGzS+tSbIdHfJ8NbdOtrd+WmTk8Ni1X8mCuzYNUj3?=
 =?us-ascii?Q?frk8FY98mLwEe/rlEfsdeY6g/G25dfMi7s2XYBRe121FBruvc79PWolt86BA?=
 =?us-ascii?Q?QYmyRnzElZu3LjjRJAsoPO/DNsl6vR48wEGk46/bM5jI/zzJXUNNJ7RnBNIm?=
 =?us-ascii?Q?qEZ2TOPGojFl9PhVjKASslOmNQJTg7vXs+xAGDsCJ5vZXrqmA1jgITSgBVAZ?=
 =?us-ascii?Q?3BlVPxwHC6gn8Z79GnVbiIzsbF4fbMJ9w+m5YmAm/9E2QtSwmQcvW71eodiW?=
 =?us-ascii?Q?KV0CYuylR0I7xBH3BAIfLBW/BLpOVAIsfNhbDBgekBeyCn92oTgya+mQIEV3?=
 =?us-ascii?Q?PQChE+u1/KPBH3YaMAXKKDzMo0JUiZh4pH57haBTp6a6lNkcATglDOfJ5sgt?=
 =?us-ascii?Q?T3Fzahk+3qDLKk6zbl6neZU/51b8fvhJ1w8dBYGE97/IZPgxO2ZiAFk8nPS5?=
 =?us-ascii?Q?ONNiBlHvWaO21dt2PHJ2OSipzYsnLsCO/1lZEZzMZG4lhRrS5v+puvyZhkYP?=
 =?us-ascii?Q?NRrIxvxfzdJ595hpMyQfFQpCkbsoSkNQQxJg8xLt1fe4r7fm8KWsZhF7MJBC?=
 =?us-ascii?Q?zZgzoLmmvAM0VWnreYLIYYyZZHBYuf0cK8HXPK0K7ITi0UszVJXxFob5lfT0?=
 =?us-ascii?Q?N/JOCzZhYexTyT2TkInleKdQLam68Ftk4GKn4dIDFZ2rLhirx04+2bky5M6S?=
 =?us-ascii?Q?Bx5OEDnIRXjK1g4JA+E3vCnV61Id3SEFHM0PKX8BaYeuccLLGXNzK0ii3guI?=
 =?us-ascii?Q?5EmskbqK+YVjIoJxrCJVP4S5Yi1jpVcIlhtqG3pcLWGrBjdhxVPjReMHK1Ft?=
 =?us-ascii?Q?d5PrXyzTzDRJSkTgVRRLohkSpqpSkU5a/M1eSOw3HFWXhyRqMNoLXxEQRBHE?=
 =?us-ascii?Q?IBro81OZQZdoy1IhddddVTf0rDbWlbLky0ERWvalHmuxRFZZkADs6dbxbGnU?=
 =?us-ascii?Q?DJ+WnsHdmKetimfbNgUbI4mNMjJ29QsfClaokcMFcSOLCvzpr2rDWCUS145f?=
 =?us-ascii?Q?fgEOzss+drWlnVep8cMiF0vbptJ9hxL+ZZga7Fw7MpM293YSgYg3WMiEPH2p?=
 =?us-ascii?Q?p09Cf8dt2l/l0B6lUczGi6GjA2ihKo6YXYNo5L3jYBg4nLbaWKUKvqI0VlT4?=
 =?us-ascii?Q?kt8Yod6cbClRn+8OKhh0XQuPHpvulk1zNVtet8PD38XaivPyRLVYtVSMlOiO?=
 =?us-ascii?Q?z+zgsbLEI8JChjtRpuz+itUTnal1vjhj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 17:46:40.5628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b57c7c57-4c3a-4d61-12db-08dca8e3e968
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8849

The .read() and .is_bin_visibile() need to be handled differently in acpi
and platform drivers, due to the way the sysfs files are created.

This is in preparation to using .dev_groups instead of dynamic sysfs
creation. The sysfs at this point is not functional, it will be enabled in
the next patch.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v2:
None
Changes since v1:
1. Change is_visible to is_bin_visible in commit message
1. Add parenthesis around read and is_bin_visible in commit message
2. Change plat_dev to hsmp_pdev, hsmp_device to mdev
3. Remove unnecessary if, else conditions in hsmp_is_sock_attr_visible
4. Change un cached to un-cached

 drivers/platform/x86/amd/hsmp/acpi.c | 41 ++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 37 ------------------
 drivers/platform/x86/amd/hsmp/plat.c | 57 ++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 86100943aadc..7cb38c8dc627 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -11,6 +11,7 @@
 
 #include "hsmp.h"
 
+#include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 
 #include <linux/acpi.h>
@@ -214,6 +215,8 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 
 	sema_init(&sock->hsmp_sem, 1);
 
+	dev_set_drvdata(dev, sock);
+
 	/* Read MP1 base address from CRS method */
 	ret = hsmp_read_acpi_crs(sock);
 	if (ret)
@@ -246,6 +249,44 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
 	return devm_device_add_group(dev, attr_grp);
 }
 
+ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr, char *buf,
+			     loff_t off, size_t count)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	if (!sock)
+		return -EINVAL;
+
+	/* Do not support lseek(), reads entire metric table */
+	if (count < bin_attr->size) {
+		dev_err(sock->dev, "Wrong buffer size\n");
+		return -EINVAL;
+	}
+
+	msg.msg_id      = HSMP_GET_METRIC_TABLE;
+	msg.sock_ind    = sock->sock_ind;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
+
+	return bin_attr->size;
+}
+
+umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+				  struct bin_attribute *battr, int id)
+{
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
+
+	return 0;
+}
+
 static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 119a1f8895ca..c906723ae2f2 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -274,34 +274,6 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
-ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-			     struct bin_attribute *bin_attr, char *buf,
-			     loff_t off, size_t count)
-{
-	struct hsmp_socket *sock = bin_attr->private;
-	struct hsmp_message msg = { 0 };
-	int ret;
-
-	if (!sock)
-		return -EINVAL;
-
-	/* Do not support lseek(), reads entire metric table */
-	if (count < bin_attr->size) {
-		dev_err(sock->dev, "Wrong buffer size\n");
-		return -EINVAL;
-	}
-
-	msg.msg_id	= HSMP_GET_METRIC_TABLE;
-	msg.sock_ind	= sock->sock_ind;
-
-	ret = hsmp_send_message(&msg);
-	if (ret)
-		return ret;
-	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
-
-	return bin_attr->size;
-}
-
 static int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
@@ -335,15 +307,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	return 0;
 }
 
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id)
-{
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
-		return battr->attr.mode;
-	else
-		return 0;
-}
-
 static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
 {
 	struct bin_attribute *hattr = &hsmp_pdev.sock[sock_ind].hsmp_attr;
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 3bce2c570f2b..c2b83363713f 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -11,6 +11,7 @@
 
 #include "hsmp.h"
 
+#include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 
 #include <linux/device.h>
@@ -90,6 +91,62 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
 	return device_add_groups(dev, hsmp_attr_grps);
 }
 
+ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr, char *buf,
+			     loff_t off, size_t count)
+{
+	struct hsmp_message msg = { 0 };
+	struct hsmp_socket *sock;
+	u8 sock_ind;
+	int ret;
+
+	ret = kstrtou8(bin_attr->private, 10, &sock_ind);
+	if (ret)
+		return ret;
+
+	if (sock_ind >= hsmp_pdev.num_sockets)
+		return -EINVAL;
+
+	sock = &hsmp_pdev.sock[sock_ind];
+	if (!sock)
+		return -EINVAL;
+
+	/* Do not support lseek(), reads entire metric table */
+	if (count < bin_attr->size) {
+		dev_err(sock->dev, "Wrong buffer size\n");
+		return -EINVAL;
+	}
+
+	msg.msg_id	= HSMP_GET_METRIC_TABLE;
+	msg.sock_ind	= sock_ind;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
+
+	return bin_attr->size;
+}
+
+umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+				  struct bin_attribute *battr, int id)
+{
+	u8 sock_ind;
+	int ret;
+
+	ret = kstrtou8(battr->private, 10, &sock_ind);
+	if (ret)
+		return ret;
+
+	if (id == 0 && sock_ind >= hsmp_pdev.num_sockets)
+		return SYSFS_GROUP_INVISIBLE;
+
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
+
+	return 0;
+}
+
 static inline bool is_f1a_m0h(void)
 {
 	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
-- 
2.25.1

