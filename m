Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176894ED199
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976518; cv=fail; b=JE9Tng8xjg8qfgZfQKs5CcQf2woLvGel69laXn6Z+ggl8I8ywE8im/VsKO8sUdEssNWQVvAcYpFI2wip/RvvZBb78aa2xoygtIZEPaAlfJRQPmhJ40zjntpdoJh2YjVsjIdtY8KEZKvMBJqUs47FVK4pJgBdGva3EZ3mtplkwLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976518; c=relaxed/simple;
	bh=+Uc99Ygt0pqsnKY9pssMXRPcVshWlw/jVt3EaZY6EKU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uypX5wPBC2f8nVIx6v5gr0dbKvh8LQhHAO5ZQWiAsEFw4zjftKkWTapg2IoeEWT8h7K1FVqo4ElOD+a58Hwj9QwrJYsxY8PzxwSzaugFCuumg2WsSu74bTuGTQTEGlJF0nx17GddnczmtsNGu/0cx0pqQQqeM1w+GJGEyzKS7DU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PImoF+5e; arc=fail smtp.client-ip=52.101.193.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PImoF+5e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weyVK7ajHUZF4rUnoY9+dLO7Cy05wQwuT+z1va+1A001SycSRVsuCA86mW77D8DT35VICGDoD9dll4U/abHobyr9iuHEMYvPmYxMVPUFl7AOh+sQOwOY7yVgn2IcIwGS0CePaayqGIzJKC4xo1HLvF+DWEVJLJor8KXwNC2Ou8q14Cc2pvxNapWEyp0C7xe/4PJwBmd3Z+0c3F1aGNBBOT8lSh0zXwy9vokWJmmRb9ksj+AhKhF/UKc29cb5bIrTzhoP5pVGMaKKyMm4oIUh9nra8BlnxaR8t1NWfIPLVDU1y3AJ8cNWK/zHkQIpyQInph34+6fjtkUkHpxckQrnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV2/H2MOiNVwoGGv7hy8dFluTJ5IRDu1uzlK+cfJCKE=;
 b=TWnyU9h7Rqe6ISPieQU/zIdHxO0YjUWgOahz5RK/cJRvC/c3iy3ke6LjGK0WUMG9k/d0pbGQC6jJV0Ej/KcIWBq8DUuoM6mlTd2GbT0eMVdHWKUcHEb00v/PKHYoiK4fsAE9lYapAMXYg3PAau/vVvhay+MxPsYcA1DFQgoI6cwQu3SkQ3+RolOLOlVqnRZRpkoSgQB/M8ob3X/v7lafNidzN7XXV06SN2O4UWzXn5bBFzjcZu728f+h+U2tjHTnPX+aL8w8pYk4XmNW1jwPCFGMcllWXIZjFhWeOlK+efcy6DHR0978aPOyhymUaeTxkN4W8I1T8ClmolNfyia3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV2/H2MOiNVwoGGv7hy8dFluTJ5IRDu1uzlK+cfJCKE=;
 b=PImoF+5ejYfp9O2MtEksafi6MS2v/57iUQzGaOHSYFA+JGssxx8z+SKPelTxb2ee2We7i+Zg6/icYBRYEg1xILEB3CSKL1yUF7W29vf/9Rw3x/URfUafQsdP9nZ4s8NS7fcn7OereME7gfFmITJ6YfCk8oQtc4lc81Mm1EbnjXM=
Received: from PH3PEPF000040AE.namprd05.prod.outlook.com (2603:10b6:518:1::59)
 by CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 11:15:10 +0000
Received: from CY7PEPF000000F0.namprd05.prod.outlook.com
 (2a01:111:f403:f912::1) by PH3PEPF000040AE.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 11:15:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F0.mail.protection.outlook.com (10.167.247.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 11:15:10 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:14:56 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <muthusamy.ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Suma Hegde <Suma.Hegde@amd.com>,
	"Muthusamy Ramalingam" <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 4/8] platform/x86/amd/hsmp: plat: Add sysfs files to display HSMP telemetry
Date: Wed, 14 Oct 2026 11:14:26 +0000
Message-ID: <20261014111430.23156-5-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014111430.23156-1-suma.hegde@amd.com>
References: <20261014111430.23156-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F0:EE_|CYXPR12MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa3eb36-62ae-4ec5-255a-08df29e4692d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|11063799006|261009223027099003|56012099006|22082099003|18002099003|10067099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	zPISkwgAAMDAqC8bqG6q+HdfeL5Bh7j9fcbQP0pc53Cy4+GRmBgJ3e+LFJyZl5oKN2G5KOZp/qss3MTo6qxrgJwKYWk5i6L1NaUoSiygDEXcID71OzxzViyLO5xH6Qz74c2rffpAtD1AmsRfL85UANxpcPDo74a8ExvdeKkNfImHmImZKI/NT2LcnLtPkcbvWOq8sKDlCwZXjtPvm8pND5rbaeAao9SE3l4AaRUOB7pEEkh4cAGqM22/i8RoIArfAxR3I0RiaZ2BOq6zYtCHrXKZEhnTHn67IEw9JFueR0oGU8eWmFJiWHaQiQdVFPgPlBjscN/k8RUYkZEjR0Qgc3PGuOxx38N7BTWkENr+OUUAMrw08fkWjECkzQCEOzLuj5uzXjJ29iyGdO8GX4v+a+SekLsKapDZOb063ak9P5A+Xh+/Igh1zyqFwzbRyGkRjxYLBNBIAOCTVGl4SDgts/dO44WDpQo9SDq2gldgDsD+TVU0HT/SUTAMLw39a2Io+LLWZCqPuENQM89MA7xmw8/Gp5u2uIBdWG3Mw30Xv+Z9xj5ovcyq4vMgf/LRyK9YgU3szuyeD5K+iDYW/1+tYH1kjmVX2+03lmRz80LdPvWteft4aIDC5ek/kBbQncSaiIehGmi4xIZ6nklsVcYSktekhxcb9FVM23+1aUxoS8+phgIuCrZ3jizZD4jIRRIHOC8nF+svXwdNVlDX5FWN+w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(11063799006)(261009223027099003)(56012099006)(22082099003)(18002099003)(10067099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7QsxGOGrImGWAZuxGK+tQRJwt/rv9RfgtOM6fGxwcoBfs/GF74LPZdPYQ5vKVxWc04EHiLb05BqAEGIrjCVBNUa7H4Iem93LrU/LaUOB2p7CqBIklv66Vbr4jA77LrjuItYrD51a7BHFKDAS5Bi2jas4P3OD+/+o+jkJzyjN6WU3g8i42EpMCvm8rHMnG6Ne2d5rctJP4j3/8W9GLX5q6FcLorXv+YjPG7lX+vJbIT/o11YJ3TI3XeP7tYTIBciPVV8GQHhtntuxZP/0E/bUbtcONlMxz0QiTzHBL16s9Mva89PwB4FQMidb5k9hCLJJjhc3Hy5U0z54rYsIk72EZzC3Y7Mcq3GkVlQGbqo6/R3Ik0e10MYu7i4Wx5r5NhnRDKQwagCHtJsylEgWguI6RWyDNhXGJ6qA2N2TA4QFMVp/I0pACfY+Ts7DYRXYa7b1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:15:10.2872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa3eb36-62ae-4ec5-255a-08df29e4692d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9337

From: Suma Hegde <Suma.Hegde@amd.com>

Move common sysfs definitions (struct hsmp_sys_attr, GENMASK masks,
freqlimit_srcnames, to_hsmp_sys_attr macro) to a new shared header
sysfs.h.

Add sysfs telemetry show functions and per-socket device attribute
groups to the platform driver (plat.c), mirroring the existing ACPI
driver functionality.

Update documentation to reflect sysfs file availability for both
ACPI and platform device based drivers.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |   4 +-
 drivers/platform/x86/amd/hsmp/acpi.c  |  36 +--
 drivers/platform/x86/amd/hsmp/plat.c  | 421 +++++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/sysfs.h |  49 +++
 4 files changed, 469 insertions(+), 41 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.h

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index c483c68dcfadf..3c3f02157edc3 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -88,7 +88,9 @@ The same is defined in the amd_hsmp.h header.
 
 2. HSMP telemetry sysfs files
 
-Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/.
+Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/ for
+ACPI based driver and /sys/devices/platform/amd_hsmp/socketX/ for platform
+device based driver.
 
 * c0_residency_input: Percentage of cores in C0 state.
 * prochot_status: Reports 1 if the processor is at thermal threshold value,
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 2813dec12d3c4..ce7fb62a49c65 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -22,6 +22,7 @@
 #include <linux/ioport.h>
 #include <linux/kref.h>
 #include <linux/kstrtox.h>
+#include <linux/limits.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -35,6 +36,7 @@
 #include <uapi/asm-generic/errno-base.h>
 
 #include "hsmp.h"
+#include "sysfs.h"
 
 #define DRIVER_NAME		"hsmp_acpi"
 
@@ -59,11 +61,6 @@ static struct kobject *hsmp_sock_kobj;
  */
 static struct kref hsmp_acpi_sock_kref;
 
-struct hsmp_sys_attr {
-	struct device_attribute dattr;
-	u32 msg_id;
-};
-
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
 {
@@ -296,8 +293,6 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
 	return hsmp_metric_tbl_read(sock, buf, count);
 }
 
-#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
-
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 					 const struct bin_attribute *battr, int id)
 {
@@ -398,17 +393,6 @@ static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute
 	return sysfs_emit(buf, "%u\n", data);
 }
 
-#define DDR_MAX_BW_MASK		GENMASK(31, 20)
-#define DDR_UTIL_BW_MASK	GENMASK(19, 8)
-#define DDR_UTIL_BW_PERC_MASK	GENMASK(7, 0)
-#define FW_VER_MAJOR_MASK	GENMASK(23, 16)
-#define FW_VER_MINOR_MASK	GENMASK(15, 8)
-#define FW_VER_DEBUG_MASK	GENMASK(7, 0)
-#define FMAX_MASK		GENMASK(31, 16)
-#define FMIN_MASK		GENMASK(15, 0)
-#define FREQ_LIMIT_MASK		GENMASK(31, 16)
-#define FREQ_SRC_IND_MASK	GENMASK(15, 0)
-
 static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
 				    char *buf)
 {
@@ -473,7 +457,7 @@ static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute
 }
 
 static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
+			char *buf)
 {
 	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
 	struct hsmp_socket *sock = dev_get_drvdata(dev);
@@ -488,7 +472,7 @@ static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
 }
 
 static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
+			char *buf)
 {
 	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
 	struct hsmp_socket *sock = dev_get_drvdata(dev);
@@ -547,17 +531,6 @@ static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute
 	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
 }
 
-static const char * const freqlimit_srcnames[] = {
-	"cHTC-Active",
-	"PROCHOT",
-	"TDC limit",
-	"PPT Limit",
-	"OPN Max",
-	"Reliability Limit",
-	"APML Agent",
-	"HSMP Agent",
-};
-
 static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
 					   char *buf)
 {
@@ -706,6 +679,7 @@ static const struct bin_attribute *hsmp_attr_list[] = {
 #define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
 static struct hsmp_sys_attr hattr_##_name = {		\
 	.dattr = __ATTR(_name, _mode, _show, NULL),	\
+	.sock_ind = U16_MAX,				\
 	.msg_id = _msg_id,				\
 }
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index b88a05498cecd..a8e4d7a15e2a1 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -12,8 +12,11 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
 #include <linux/build_bug.h>
 #include <linux/cleanup.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/kconfig.h>
@@ -26,6 +29,7 @@
 #include <asm/amd/node.h>
 
 #include "hsmp.h"
+#include "sysfs.h"
 
 #define DRIVER_NAME		"amd_hsmp"
 
@@ -88,6 +92,218 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	return 0;
 }
 
+static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
+					     struct attribute *attr, int id)
+{
+	struct device_attribute *dattr = container_of(attr, struct device_attribute, attr);
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(dattr);
+	umode_t mode = attr->mode;
+	umode_t mode_updated = 0;
+	struct hsmp_socket *sock;
+	bool readable, writable;
+
+	/*
+	 * Always bounds-check sock_ind. SYSFS_GROUP_INVISIBLE is only
+	 * meaningful for id == 0 (group visibility); for later attributes
+	 * just hide the file.
+	 */
+	if (hattr->sock_ind >= hsmp_pdev->num_sockets)
+		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
+
+	sock = &hsmp_pdev->sock[hattr->sock_ind];
+
+	readable = !!(mode & 0444);
+	writable = !!(mode & 0200);
+
+	if (readable && writable) {
+		if (is_read_msg_enabled(sock, hattr->msg_id))
+			mode_updated |= mode & 0444;
+		if (is_write_msg_enabled(sock, hattr->msg_id))
+			mode_updated |= 0200;
+		return mode_updated;
+	}
+
+	if (readable) {
+		if (is_read_msg_enabled(sock, hattr->msg_id))
+			return mode;
+	}
+
+	if (writable) {
+		if (is_write_msg_enabled(sock, hattr->msg_id))
+			return mode;
+	}
+
+	return 0;
+}
+
+static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", data);
+}
+
+static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
+}
+
+static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
+				     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
+}
+
+static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
+					  char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
+}
+
+static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu.%lu.%lu\n",
+			  FIELD_GET(FW_VER_MAJOR_MASK, data),
+			  FIELD_GET(FW_VER_MINOR_MASK, data),
+			  FIELD_GET(FW_VER_DEBUG_MASK, data));
+}
+
+static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data[2];
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, data, 2);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", data[0]);
+}
+
+static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data[2];
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, data, 2);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", data[1]);
+}
+
+static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
+}
+
+static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
+}
+
+static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
+}
+
+static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
+					   char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	unsigned int index;
+	int len = 0;
+	u16 src_ind;
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
+	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
+		if (!src_ind)
+			break;
+		if (src_ind & 1)
+			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
+		src_ind >>= 1;
+	}
+	return len;
+}
+
 /*
  * AMD supports maximum of 8 sockets in a system.
  * Static array of 8 + 1(for NULL) elements is created below
@@ -120,21 +336,208 @@ HSMP_BIN_ATTR(5, *sock5_attr_list);
 HSMP_BIN_ATTR(6, *sock6_attr_list);
 HSMP_BIN_ATTR(7, *sock7_attr_list);
 
-#define HSMP_ATTR_GRP(index, _list, _name)			\
+#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, _sock_ind)	\
+static struct hsmp_sys_attr hattr_##_name##_sock_ind = {	\
+	.dattr = __ATTR(_name, _mode, _show, NULL),		\
+	.sock_ind = _sock_ind,					\
+	.msg_id = _msg_id,					\
+}
+
+HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 0);
+HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 1);
+HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 2);
+HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 3);
+HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 4);
+HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 5);
+HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 6);
+HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 7);
+
+HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 0);
+HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 1);
+HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 2);
+HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 3);
+HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 4);
+HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 5);
+HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 6);
+HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 7);
+
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 0);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 1);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 2);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 3);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 4);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 5);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 6);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 7);
+
+HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 0);
+HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 1);
+HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 2);
+HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 3);
+HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 4);
+HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 5);
+HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 6);
+HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 7);
+
+HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 0);
+HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 1);
+HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 2);
+HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 3);
+HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 4);
+HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 5);
+HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 6);
+HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 7);
+
+HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 0);
+HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 1);
+HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 2);
+HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 3);
+HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 4);
+HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 5);
+HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 6);
+HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 7);
+
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+	      hsmp_ddr_util_bw_perc_show, 0444, 0);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+	      hsmp_ddr_util_bw_perc_show, 0444, 1);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+	      hsmp_ddr_util_bw_perc_show, 0444, 2);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+	      hsmp_ddr_util_bw_perc_show, 0444, 3);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+	      hsmp_ddr_util_bw_perc_show, 0444, 4);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+	      hsmp_ddr_util_bw_perc_show, 0444, 5);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+	      hsmp_ddr_util_bw_perc_show, 0444, 6);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+	      hsmp_ddr_util_bw_perc_show, 0444, 7);
+
+HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 0);
+HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 1);
+HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 2);
+HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 3);
+HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 4);
+HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 5);
+HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 6);
+HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 7);
+
+HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 0);
+HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 1);
+HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 2);
+HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 3);
+HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 4);
+HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 5);
+HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 6);
+HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 7);
+
+HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 0);
+HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 1);
+HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 2);
+HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 3);
+HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 4);
+HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 5);
+HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 6);
+HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 7);
+
+HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 0);
+HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 1);
+HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 2);
+HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 3);
+HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 4);
+HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 5);
+HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 6);
+HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 7);
+
+HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 0);
+HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 1);
+HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 2);
+HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 3);
+HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 4);
+HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 5);
+HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 6);
+HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 7);
+
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_show, 0444, 0);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_show, 0444, 1);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_show, 0444, 2);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_show, 0444, 3);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_show, 0444, 4);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_show, 0444, 5);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_show, 0444, 6);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_show, 0444, 7);
+
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_show, 0444, 0);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_show, 0444, 1);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_show, 0444, 2);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_show, 0444, 3);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_show, 0444, 4);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_show, 0444, 5);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_show, 0444, 6);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_show, 0444, 7);
+
+#define HSMP_DEV_ATTR_LIST(_name, _sock_ind)				       \
+static struct attribute _name[] = {					       \
+	&hattr_c0_residency_input##_sock_ind.dattr.attr,		       \
+	&hattr_prochot_status##_sock_ind.dattr.attr,			       \
+	&hattr_smu_fw_version##_sock_ind.dattr.attr,			       \
+	&hattr_protocol_version##_sock_ind.dattr.attr,			       \
+	&hattr_cclk_freq_limit_input##_sock_ind.dattr.attr,		       \
+	&hattr_ddr_max_bw##_sock_ind.dattr.attr,			       \
+	&hattr_ddr_utilised_bw_input##_sock_ind.dattr.attr,		       \
+	&hattr_ddr_utilised_bw_perc_input##_sock_ind.dattr.attr,	       \
+	&hattr_fclk_input##_sock_ind.dattr.attr,			       \
+	&hattr_mclk_input##_sock_ind.dattr.attr,			       \
+	&hattr_clk_fmax##_sock_ind.dattr.attr,				       \
+	&hattr_clk_fmin##_sock_ind.dattr.attr,				       \
+	&hattr_pwr_current_active_freq_limit##_sock_ind.dattr.attr,	       \
+	&hattr_pwr_current_active_freq_limit_source##_sock_ind.dattr.attr,   \
+	NULL								       \
+}
+
+HSMP_DEV_ATTR_LIST(*sock0_dev_attr_list, 0);
+HSMP_DEV_ATTR_LIST(*sock1_dev_attr_list, 1);
+HSMP_DEV_ATTR_LIST(*sock2_dev_attr_list, 2);
+HSMP_DEV_ATTR_LIST(*sock3_dev_attr_list, 3);
+HSMP_DEV_ATTR_LIST(*sock4_dev_attr_list, 4);
+HSMP_DEV_ATTR_LIST(*sock5_dev_attr_list, 5);
+HSMP_DEV_ATTR_LIST(*sock6_dev_attr_list, 6);
+HSMP_DEV_ATTR_LIST(*sock7_dev_attr_list, 7);
+
+#define HSMP_ATTR_GRP(index, _list, _name, _dlist)		\
 static const struct attribute_group sock##index##_attr_grp = {	\
 	.bin_attrs = _list,					\
+	.attrs = _dlist,					\
 	.is_bin_visible = hsmp_is_sock_attr_visible,		\
+	.is_visible = hsmp_is_sock_dev_attr_visible,		\
 	.name = #_name,						\
 }
 
-HSMP_ATTR_GRP(0, sock0_attr_list, socket0);
-HSMP_ATTR_GRP(1, sock1_attr_list, socket1);
-HSMP_ATTR_GRP(2, sock2_attr_list, socket2);
-HSMP_ATTR_GRP(3, sock3_attr_list, socket3);
-HSMP_ATTR_GRP(4, sock4_attr_list, socket4);
-HSMP_ATTR_GRP(5, sock5_attr_list, socket5);
-HSMP_ATTR_GRP(6, sock6_attr_list, socket6);
-HSMP_ATTR_GRP(7, sock7_attr_list, socket7);
+HSMP_ATTR_GRP(0, sock0_attr_list, socket0, sock0_dev_attr_list);
+HSMP_ATTR_GRP(1, sock1_attr_list, socket1, sock1_dev_attr_list);
+HSMP_ATTR_GRP(2, sock2_attr_list, socket2, sock2_dev_attr_list);
+HSMP_ATTR_GRP(3, sock3_attr_list, socket3, sock3_dev_attr_list);
+HSMP_ATTR_GRP(4, sock4_attr_list, socket4, sock4_dev_attr_list);
+HSMP_ATTR_GRP(5, sock5_attr_list, socket5, sock5_dev_attr_list);
+HSMP_ATTR_GRP(6, sock6_attr_list, socket6, sock6_dev_attr_list);
+HSMP_ATTR_GRP(7, sock7_attr_list, socket7, sock7_dev_attr_list);
 
 static const struct attribute_group *hsmp_groups[] = {
 	&sock0_attr_grp,
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
new file mode 100644
index 0000000000000..771ce5e2b43f5
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2025, AMD.
+ * All Rights Reserved.
+ *
+ * Header file for HSMP sysfs interface
+ */
+
+#ifndef HSMP_SYSFS_H
+#define HSMP_SYSFS_H
+
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/types.h>
+
+struct hsmp_sys_attr {
+	struct device_attribute dattr;
+	u16 sock_ind;
+	u32 msg_id;
+};
+
+static const char * const freqlimit_srcnames[] = {
+	"cHTC-Active",
+	"PROCHOT",
+	"TDC limit",
+	"PPT Limit",
+	"OPN Max",
+	"Reliability Limit",
+	"APML Agent",
+	"HSMP Agent",
+};
+
+#define DDR_MAX_BW_MASK		GENMASK(31, 20)
+#define DDR_UTIL_BW_MASK	GENMASK(19, 8)
+#define DDR_UTIL_BW_PERC_MASK	GENMASK(7, 0)
+#define FW_VER_MAJOR_MASK	GENMASK(23, 16)
+#define FW_VER_MINOR_MASK	GENMASK(15, 8)
+#define FW_VER_DEBUG_MASK	GENMASK(7, 0)
+#define FMAX_MASK		GENMASK(31, 16)
+#define FMIN_MASK		GENMASK(15, 0)
+#define FREQ_LIMIT_MASK		GENMASK(31, 16)
+#define FREQ_SRC_IND_MASK	GENMASK(15, 0)
+
+#define to_hsmp_sys_attr(_dev_attr) \
+	container_of(_dev_attr, struct hsmp_sys_attr, dattr)
+
+#endif /* HSMP_SYSFS_H */
-- 
2.34.1

