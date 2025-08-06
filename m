Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8238D1FF1D1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Aug 2025 06:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754462328; cv=fail; b=F2cF48DUdkMtfM/vvo8jTFtdxlyKPAmY1i/amca3Af/FnhuXSOvI7vzEtBl44wBnOX9d31iN85Y0+yjTrLBz+OGMeYZeTOYQ/1I8Qx6rfIlaOEKHw2EsqZd0z6sBSJlOoVh8F2O5XKq7Cm1a27EcpTqudQu+Q50ttiSXBMY1vEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754462328; c=relaxed/simple;
	bh=cvJi/q5RN4i/c03lwTt70wDCBWI4sPrMcH9U0xVQO+c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJrFn0upLURdmkpv1mB8ubkfYnwM8uXdvKpQs4GpTpKRBVhNpzEduDClPPDUGakkaUJ/mx10ZTU8zltnVAHaJyziBOO9FZRC4SRleOre1JsrYCIaKRsw4OjDTsAntEfKrhwePnsaYNJOujTkSvIso59QSFrTGH+vG7yPpZzK3LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mm5lS2B/; arc=fail smtp.client-ip=40.107.94.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mm5lS2B/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atao6JQfstLL5jqEpjWiEXVuJ3m+sQWzq3kQYLzR4JYu9LArXPp5RnZulKGtwrPFmobKUYHUIS1VOdH9G8eV0+PTVHM5ufbSvbVum67wb6UYfZP+jm9PYiB58gBWd8F+m9KT9PizW0bzBIWX3S/znRRdUtHb1XPwS0lwCgK1O8ZbU9FnldoBvUbQjcWJDjfesRiq9JaLty1rmLA3XURYifeoA3f1Qnp6F/QfWCyDwMN9S4KN7kRysP3kcxEq4RZr6eZANSCuLeeeoSrPrfnYpAv6oRpli7hvgdj0RIsAG4vm+cGjMmcjJKZCTOI6sU1e7VI3IWD3AKGSaRkb+uplNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/uOOigHntK79eYhEq0Bvq6urJLgu8MH7GqrHwfJ27s=;
 b=yw38MYyTPP0CQOnHqEIu/kTmdk267lhS4/3Z715w0N4CEdeDQdgdOzElean7g9l16YYR6/7pI3RmJoAWfI/Ip+AohU4PcZf4CheipnMX88wB88XyIq42ad4gi7DvkplUsGD/ZBD8HrJ2ux13IpIWOzHXiuM2zur+dTiY5Xq3T9I5IGY25o7PxYzKU+Fe2Sqg0IcTcFcNVPn0cgOVIM4ty4xcl/Wq5aeP26fupgrxelWU2Ybwxc5vtWtOqzEBQx1MnMRXlu7OFfJ5rDxREtpW6TNXQt+8FCPcCVTIGsXHlz9ky0C4g0pYGWfATYAgPJt8cdCsgjqWhHO+SG3wsSJv0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/uOOigHntK79eYhEq0Bvq6urJLgu8MH7GqrHwfJ27s=;
 b=Mm5lS2B/YvZhIq1kPDboFrNqI9dQXLnJp41d0TupacX2GEIWVXhZWLieSyyxn8RGwd3Zye4D479BBvZZDn2OXywb6loGvjDZ4/q0ZvraFfufO+wFCkLKk/v/KQEky8RVPM2qwLJnlZUP7HE5B9GpG9OYKHpi86MCRWoBCv4JXsE=
Received: from MN0PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:52c::22)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 06:38:37 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::cb) by MN0PR05CA0022.outlook.office365.com
 (2603:10b6:208:52c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.5 via Frontend Transport; Wed, 6
 Aug 2025 06:38:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 06:38:37 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 01:38:35 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/hsmp: plat: Add sysfs files to display HSMP telemetry
Date: Wed, 6 Aug 2025 06:38:04 +0000
Message-ID: <20250806063804.693481-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250806063804.693481-1-suma.hegde@amd.com>
References: <20250806063804.693481-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|MN2PR12MB4061:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9c1b4c-8a2d-4d65-63bb-08ddd4b3dfd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6EC0L+Zc/8g3AV5iFpbSzFRtE/v4CIetz4mjXq9IYRlwjBvzeZ6zez3ImVJs?=
 =?us-ascii?Q?dxIvA3ug8O8ztuEZJMP0aQWthbaPdB0dut4vzKkIqBQSjDqCUZPnDWA5FicZ?=
 =?us-ascii?Q?gfoayV64hkQrqzn11Nwd7TQCmBtqwvDHYI44isIENUCOhT3dV0jcBVWaZC34?=
 =?us-ascii?Q?Wj4bKVafM2pcUVDPO9ALxojQpodBw60+XCYbiEZ9lejToILV4xWVtlznE7U0?=
 =?us-ascii?Q?WdKApJhbdWYuEk/DQckLrFmRq7fMUpPbxBp14mGGldfJo/VbquY4iPH4KSEe?=
 =?us-ascii?Q?EpT61quLFgyCcFdZq7WP+a0Rh3REwx2A2AUOdTtVg5Fj1iD5NCuWz7/i/7zH?=
 =?us-ascii?Q?OFGxkIjKu2XKdJkcCZCNLlS+QpLA5+mwefiHmwwo07cZxMMnR3kYhLdxG2UD?=
 =?us-ascii?Q?q1bNYlfCO+FlL97q6YIdRji/kGUo1XqON94AuGGeEjNO947Kekvp5IY2inhQ?=
 =?us-ascii?Q?jx9ngj0yrz5LC95gpt6JC2hyPa9qKj09yq1pa8y4s9B04ERAkA0W6r6bDBir?=
 =?us-ascii?Q?NTisF1cWTMq7RmtjzvxWm28/jQL/WCfpRr3+5nOLScJXAYWBu8E87IK2bmF3?=
 =?us-ascii?Q?jDEe1ryrpZoea5PeKoqGBF+q6tID6tEzOMbJ3smuHyMkY/CekD2x5GTxfcal?=
 =?us-ascii?Q?R+/AC+EcdHjl8OBuaF+UMVSpJ0ouEHjJPCyXF7fln4vE/e5C9LCOFOI3CDHY?=
 =?us-ascii?Q?KSQGoYS80PV5oaNDZEiD5bVR/7LC668/iVpLwZzYKD/tRsoG6nX2jYQhXWs+?=
 =?us-ascii?Q?dQtnJx74MUkctuuGI6mVi8nJbGNZCgonUgD/sJRn2Om78SfI5wZdJUZt/32K?=
 =?us-ascii?Q?WM2mNgVt/IZOJ03gE4L8LOfAbcXYKTiCDCa/fSuNmFzQMLMOxI8a9FzIz299?=
 =?us-ascii?Q?7DHo1FByJphcjziOxdWAWrWutE5euQg9d8iE7t33ynr+/YviVHEkTtII+ATN?=
 =?us-ascii?Q?o5LLwfWRUqC1IH0UvDEMP+zN+wzcgMUWDOGC3tDDj6Cawxe/YoHKCcCAXABi?=
 =?us-ascii?Q?ePMjjZxFch32B7TTCGxnJb5mrKnFW2fO6Mbwc3ddBuqSOGCMRuhcxPplPj1p?=
 =?us-ascii?Q?Kj6mOpoZaaK0TlPB85qYQ6cBYGnBOE1kIXRPpvTXasB6Ff8CKDvee4SkaBpw?=
 =?us-ascii?Q?fLMRwzOkBVeixNa5JoOwelC0uM63fqOb5/gWq8boKvZnwXnv7DcZ0oL4Za7a?=
 =?us-ascii?Q?MfFwKLUVhQC5k8QB73IxBofU03tOgI9Fd7qd1LO3wltb07mVL1YwfjLndIHL?=
 =?us-ascii?Q?hcL852XQ2kD7NpheoMmBcVU8cBK3g8T723tS/Tn/U84DJBnX4oKJ/aXu3HPY?=
 =?us-ascii?Q?zjkEb0cgSONYeYcj8F4FoxxBQVTU9pkgpVpBRBlfSwgNyG+RUFO+aBvwS1Ql?=
 =?us-ascii?Q?RYl+S2OohM95Gzjg5z2UEbGl4wQuIQ3PpRYAKVqJNO9eZ6pgc5kLl+1+9LbM?=
 =?us-ascii?Q?UGJvBVT/7mpeeC9V6D9HaYhe7JMPYzT+7rusGhNML/z/sKx8OLZg3soZyl9t?=
 =?us-ascii?Q?EiOhuTGbSgKrqvYRprKEbrO5sdg7KLLkS0so?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 06:38:37.5466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9c1b4c-8a2d-4d65-63bb-08ddd4b3dfd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061

This patch adds sysfs files to platform device based driver.

Following sysfs files are added similar to those in the ACPI based driver.
* c0_residency_input
* prochot_status
* smu_fw_version
* protocol_version
* ddr_max_bw(GB/s)
* ddr_utilised_bw_input(GB/s)
* ddr_utilised_bw_perc_input(%)
* mclk_input(MHz)
* fclk_input(MHz)
* clk_fmax(MHz)
* clk_fmin(MHz)
* cclk_freq_limit_input(MHz)
* pwr_current_active_freq_limit(MHz)
* pwr_current_active_freq_limit_source

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |   4 +-
 drivers/platform/x86/amd/hsmp/acpi.c  |  33 +--
 drivers/platform/x86/amd/hsmp/plat.c  | 388 +++++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/sysfs.h |  48 ++++
 4 files changed, 433 insertions(+), 40 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.h

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index a094f55c10b0..6dd9948d8c21 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -73,7 +73,9 @@ The same is defined in the amd_hsmp.h header.
 
 2. HSMP telemetry sysfs files
 
-Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/.
+Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/ for
+ACPI based driver and /sys/devices/platform/amd_hsmp/socketX/ for platform
+device based driver.
 
 * c0_residency_input: Percentage of cores in C0 state.
 * prochot_status: Reports 1 if the processor is at thermal threshold value,
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 19f0ca7958b6..f6434cf07f6b 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -13,12 +13,12 @@
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
-#include <linux/bits.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
@@ -29,6 +29,7 @@
 #include <asm/amd/node.h>
 
 #include "hsmp.h"
+#include "sysfs.h"
 
 #define DRIVER_NAME		"hsmp_acpi"
 
@@ -39,11 +40,6 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
-struct hsmp_sys_attr {
-	struct device_attribute dattr;
-	u32 msg_id;
-};
-
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
 {
@@ -257,8 +253,6 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
-
 static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
 				    char *buf)
 {
@@ -274,17 +268,6 @@ static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute
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
@@ -423,17 +406,6 @@ static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute
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
@@ -521,6 +493,7 @@ static const struct bin_attribute *hsmp_attr_list[] = {
 #define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
 static struct hsmp_sys_attr hattr_##_name = {		\
 	.dattr = __ATTR(_name, _mode, _show, NULL),	\
+	.sock_ind = U16_MAX,				\
 	.msg_id = _msg_id,				\
 }
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 10e8f98ea12c..3a0171ee4a80 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -12,7 +12,9 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/build_bug.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/kconfig.h>
@@ -24,6 +26,7 @@
 #include <asm/amd/node.h>
 
 #include "hsmp.h"
+#include "sysfs.h"
 
 #define DRIVER_NAME		"amd_hsmp"
 
@@ -78,6 +81,186 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	return 0;
 }
 
+static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
+					     struct attribute *attr, int id)
+{
+	struct device_attribute *dattr = container_of(attr, struct device_attribute, attr);
+	struct hsmp_sys_attr *hattr = container_of(dattr, struct hsmp_sys_attr, dattr);
+
+	if (id == 0 && hattr->sock_ind >= hsmp_pdev->num_sockets)
+		return SYSFS_GROUP_INVISIBLE;
+
+	return attr->mode;
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
@@ -110,21 +293,208 @@ HSMP_BIN_ATTR(5, *sock5_attr_list);
 HSMP_BIN_ATTR(6, *sock6_attr_list);
 HSMP_BIN_ATTR(7, *sock7_attr_list);
 
-#define HSMP_ATTR_GRP(index, _list, _name)			\
+#define HSMP_ATTR_GRP(index, _list, _name, _dlist)		\
 static const struct attribute_group sock##index##_attr_grp = {	\
 	.bin_attrs_new = _list,					\
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
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
+	      0444, 0);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
+	      0444, 1);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
+	      0444, 2);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
+	      0444, 3);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
+	      0444, 4);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
+	      0444, 5);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
+	      0444, 6);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
+	      0444, 7);
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
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
+	      0444, 0);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
+	      0444, 1);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
+	      0444, 2);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
+	      0444, 3);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
+	      0444, 4);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
+	      0444, 5);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
+	      0444, 6);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
+	      0444, 7);
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
+#define HSMP_DEV_ATTR_LIST(_name, _sock_ind)					\
+static struct attribute _name[] = {						\
+	&hattr_c0_residency_input##_sock_ind.dattr.attr,			\
+	&hattr_prochot_status##_sock_ind.dattr.attr,				\
+	&hattr_smu_fw_version##_sock_ind.dattr.attr,				\
+	&hattr_protocol_version##_sock_ind.dattr.attr,				\
+	&hattr_cclk_freq_limit_input##_sock_ind.dattr.attr,			\
+	&hattr_ddr_max_bw##_sock_ind.dattr.attr,				\
+	&hattr_ddr_utilised_bw_input##_sock_ind.dattr.attr,			\
+	&hattr_ddr_utilised_bw_perc_input##_sock_ind.dattr.attr,		\
+	&hattr_fclk_input##_sock_ind.dattr.attr,				\
+	&hattr_mclk_input##_sock_ind.dattr.attr,				\
+	&hattr_clk_fmax##_sock_ind.dattr.attr,					\
+	&hattr_clk_fmin##_sock_ind.dattr.attr,					\
+	&hattr_pwr_current_active_freq_limit##_sock_ind.dattr.attr,		\
+	&hattr_pwr_current_active_freq_limit_source##_sock_ind.dattr.attr,	\
+	NULL									\
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
index 000000000000..c4cd7e71e404
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -0,0 +1,48 @@
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
+static char * const freqlimit_srcnames[] = {
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
+#endif /* HSMP_SYSFS_H */
-- 
2.25.1

