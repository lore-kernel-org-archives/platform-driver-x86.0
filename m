Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3973618B46C
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2025 06:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742882733; cv=fail; b=ip1ASuc4eBJepx8xaPxk4eC0xjYw016wfTNAvjE03hsOzb1GaCmN4YZ9EFDzrtyz4Q052MQcRvw0yE4IdXyFM8MyrGwm/oNxHN29RcJEvUV7vYQlv/TchfRDzDzKVE9HwQYQ/XRQJDEWsm9ZYeB1O/bpiC5Tx8bh8Q8xlP/XFz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742882733; c=relaxed/simple;
	bh=5gFLxVOj0wDUA5MQ1bmbqgTHdlADA0SYJ4WRHjyANtQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwH6C4Ri5YdMfo28HFh4pbsIy/NxJA9ii6NYrtU9GUdIZxobdunSUsYaagOqrMeSfY+Qr3k08C0TTa+budys7m7jSFXCLmGS45hFbO9PMq0H6BBaLPP4szfgBvZriOJAMZZf+byDe0HP0DuvJKPiZXcTVdBMLRAVCbosa4UY3mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0fijY2rN; arc=fail smtp.client-ip=40.107.100.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0fijY2rN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drouSvfHzwLJPvLr/Yk5eWW3JqJAvxCk4a7Qbo/H2Hojn/8Hdv+dapl/w0zF3+/a57Czdnlc8WXUQFVYms3lvQo4c9sVzZctRmKNaFNyoDkl3cfW7XXhVO6Jm52xFedpzaUvt7PT8jQe28VozBaudgZ0Xu9CGaRhIztV42dg1YZu67X2+7bplFQwqpabwT5cX169a2Lrp3JuKcexH63WU5tvPnADO4dAnH/ZUtk7in3s4G0NLyPP836bCxq6gD82J4khReQv3suKPXOWJut0kEoz4u7Ap2rLVXj1l83LS21+Vlh/Yc+OoHjcn18kmzxmTDJ3OcRRr5ScGZzUEaS9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fliewW0opu2JjA5JWJcnUM0hCDCez8qmk2e45SRJEGM=;
 b=ZrPN6OEMZO+apdbtdVy8T893rPh+2+8jB84WdpobbjnUnCA8+Cw+h9SRGSHfLfky8NT3HVsLlO9zbZK6HYAjLtvwEyrSJRiNTMXEtxJr0gARRbCUgeD4vLz8YQt12Jn+//XcJnerqhQ5GB3xXvypTKhVsNGrfurUIa43sw18SH+9tfQNpFKuz4X5t/h5KqYjLL87hFR4svnfN2Ywyw8ysD4FeLuJH2K8MG/OQU2QGy2cXzRPLW6pP84wrlP8pzH4J3wKihNAS8bVyNcXvuDknW7/y6C/pbKmUt+q70jdnf/8y9/1KaXbMqfF1/UMQhvhR//zcm8kV8Bpf7Vbzvdpbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fliewW0opu2JjA5JWJcnUM0hCDCez8qmk2e45SRJEGM=;
 b=0fijY2rNWRLEK6vB7ZXACFJGtPvEH9OlcgTaVBRIvbxq33gXWb4hcqERSRkmiVJzj/BZm4vWUK1felulBvYD7aXh47RiGk6APNNpIJe/l8ZSCGPdDd6DYBaeFEBh9BXyDT3CQ/RSq0QdTkJc2g57XD/ccnrK8gQaoqufi1aSVnU=
Received: from MN2PR17CA0033.namprd17.prod.outlook.com (2603:10b6:208:15e::46)
 by MN0PR12MB5929.namprd12.prod.outlook.com (2603:10b6:208:37c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 06:05:25 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::e) by MN2PR17CA0033.outlook.office365.com
 (2603:10b6:208:15e::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 25 Mar 2025 06:05:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 06:05:25 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 01:05:22 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 3/3] platform/x86/amd/hsmp: acpi: Add sysfs files to show HSMP telemetry
Date: Tue, 25 Mar 2025 06:04:57 +0000
Message-ID: <20250325060457.3643613-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250325060457.3643613-1-suma.hegde@amd.com>
References: <20250325060457.3643613-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|MN0PR12MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c77136c-5083-459c-9306-08dd6b630946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xm/sl04+gJr4Ky8LV9P+0f6KIUFUHQ/n/qbvyMCJRt3Ba0hVmYq5wW12Dz9j?=
 =?us-ascii?Q?Lwn0OaOwb148G44zbft1k414a6GWleS08Yr8G5msYl/SxUpvd89piEfosEQ+?=
 =?us-ascii?Q?XNZlEkDsSvvjzmzTuOMQE/850KbLl/YQ9Omjk3IiB5gdoV+TBpYoO+MHnQJQ?=
 =?us-ascii?Q?Hmtq9tlfiP0s2xVIZp7OOn/30iC5dVHOJNluZBu1f3xQSvQdb9YQb7+Z9VRu?=
 =?us-ascii?Q?M6+jPe+83FlqR/DRnYnPRbjNqwHhGky0sQXQSInJSk5ErbQXeZ5NpdxzCmvA?=
 =?us-ascii?Q?WLvqNcePBMITh9PwsFeOzpJqgNYmC+JW52lZhM5wxPf4j0EwKLgyeW6RUk7Z?=
 =?us-ascii?Q?31s4wOOTKWQUycnbnvkxq7j3S+X7vzgyDzhO/Ajwn47JCJZbsn+zKAA+bDW3?=
 =?us-ascii?Q?Ulzh0rDA7/xPl0t2Ly7IKZofwLXj5gB6VZpJLJJmVT/aaD5K2NhP8t3Drv2l?=
 =?us-ascii?Q?F7X5Q+q8tjzeYxp4o0sOVe+uU1BpYl0O7n0H90/uB3+0X6yHz9br/MZgEjLS?=
 =?us-ascii?Q?P0V4W1zb+FNjtVPl/Si32mCcvWOCkzqUSGDmiOZyVAO9cmE/5fYx4FYXarIA?=
 =?us-ascii?Q?2xQoKtED6GuBdY5Q49Xg7ZJQrhmbcY4UIXAp6WWpMr4wSIkh3NehMmowIjJJ?=
 =?us-ascii?Q?O1Xhb8hNHH+/dYk/g8KigaQ3uV4QO2F1+PwPvOPkq1yhxwz+IAvcNcAkWZHr?=
 =?us-ascii?Q?WWS9w7sMSn2lGmA4HPEP/fevb17tRSmG9PXQ8FYmK8HDxH79UO4vUnlqPfOX?=
 =?us-ascii?Q?B755ZgY0VFRr3WOXHK9GIuR7O/6qiJMJEwFY/9M2ZxnpamTTVl4GjPczyYzJ?=
 =?us-ascii?Q?JWcjK5AYaU5BTX+3vUyMHRMVKVnFF8/rQMSNT3LhPcxNq5pYRtJAaUEvxueE?=
 =?us-ascii?Q?RdEpFZQj9RPMYRsdmKa1IxfiBEC58oOYOImFkpygiIBV+mPtjHXe64hRgAYC?=
 =?us-ascii?Q?XOukGPj546IYQ2kxYeuj83EkDQfseCEZQN1WMu5+VjxZR2vU93L00cgoNOkr?=
 =?us-ascii?Q?YdGz9Mlc4QUK2OXqCMcbql1Uvxy54MO2DES1Hmw4VA8kAC8QgoEdpVwxM0h/?=
 =?us-ascii?Q?AA2hVOTqx4pllHAizDzx+6vruLQ51M5QwZGitGJp0nLTutUNAyCLIkMzer3k?=
 =?us-ascii?Q?sQrBSNslEqX9v5Dl7jwe3da29zvG/O0sMNPc+JaB5vZCl6gUqGg4hOLDDuRx?=
 =?us-ascii?Q?WunYaWJimPaHiIigNn6EzGYgfY+ZIwfTDCQ4BoifcvcesfY8V4LDZbL32kYF?=
 =?us-ascii?Q?XE6RLG29fc5BsHH1r8x3TKzXuGGpb6QWjB4Z7wDqpaxBIjssx7G2XCF5/Kf6?=
 =?us-ascii?Q?H8RJHSD0PaP7Sld581+SmsZTTna+jaYpETAa74QEe9ZN83y+NpDWYtXBHaMy?=
 =?us-ascii?Q?xxCXxjIkBMTARFhjJYXcLy8d7m0/WxnScEdr84P53HnPSzwftSAKfieFeVvT?=
 =?us-ascii?Q?WIJ/m1zHi6CgQgkUKUO2hPHioZzQ9sbfNs37XT19l7JgQpT5XVlRzYYXHaYC?=
 =?us-ascii?Q?RaAn5oBTc87wTx4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 06:05:25.7720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c77136c-5083-459c-9306-08dd6b630946
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5929

Make frequently fetched telemetry available via sysfs interface.

Create following sysfs files per acpi device node.
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
Changes since v1:
1. Add linux/bitops.h
2. Define DDR_MAX_BW, DDR_UTIL_BW DDR_UTIL_BW_PERC FW_VER_MAJOR FW_VER_MINOR FW_VER_DEBUG FMAX
   FMIN FREQ_LIMIT FREQ_SRC_IND and use them in functions.
3. Return early in hsmp_msg_get_nargs()
4. Change while loop to for loop in hsmp_freq_limit_source_show()
5. Correct the GENMASK size in hsmp_ddr_util_bw_show()[bit 19:8, instead
   of bit 20:8]

 Documentation/arch/x86/amd_hsmp.rst  |  31 +++-
 drivers/platform/x86/amd/hsmp/acpi.c | 259 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c |  21 +++
 drivers/platform/x86/amd/hsmp/hsmp.h |   1 +
 4 files changed, 305 insertions(+), 7 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 1d7b159a35d5..45a209fd5861 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -71,6 +71,25 @@ Note: lseek() is not supported as entire metrics table is read.
 Metrics table definitions will be documented as part of Public PPR.
 The same is defined in the amd_hsmp.h header.
 
+2. HSMP telemetry sysfs files
+
+Following sysfs file are available at /sys/devices/platform/AMDI0097:0X/.
+
+* c0_residency_input : percentage of cores in C0 state
+* prochot_status :  reports 1 if socket is in prochot, 0 otherwhile
+* smu_fw_version : SMU firmware version
+* protocol_version : HSMP interface version
+* ddr_max_bw : theoretical maximum ddr bw in GB/s
+* ddr_utilised_bw_input: current utilized ddr bw in GB/s
+* ddr_utilised_bw_perc_input(%): Percentage of current utilized ddr bw
+* mclk_input : memory clock in MHz
+* fclk_input: fabric clock in MHz
+* clk_fmax : max frequency of socket in MHz
+* clk_fmin : min frequency of socket in MHz
+* cclk_freq_limit_input : core clock frequency limit per socket in MHz
+* pwr_current_active_freq_limit: current active frequency limit of socket in MHz
+* pwr_current_active_freq_limit_source: source of current active frequency limit
+
 ACPI device object format
 =========================
 The ACPI object format expected from the amd_hsmp driver
@@ -119,13 +138,11 @@ for socket with ID00 is given below::
 
 HSMP HWMON interface
 ==================
-HSMP power sensors are registered with hwmon interface.
-
-One hwmon directory is created for each socket and following files with 0444 permission are created
-inside the hwmon directory.
-- power1_input
-- power1_cap_max
-- power1_cap
+HSMP power sensors are registered with hwmon interface. One hwmon directory is created for each
+socket and following files are created inside the hwmon directory.
+- power1_input(read only)
+- power1_cap_max(read only)
+- power1_cap(read, write)
 
 An example
 ==========
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index abbb680b9c71..803da111a034 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -13,6 +13,7 @@
 #include <asm/amd_nb.h>
 
 #include <linux/acpi.h>
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
@@ -36,6 +37,11 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
+struct hsmp_sys_attr {
+	struct device_attribute dattr;
+	u32 msg_id;
+};
+
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
 {
@@ -243,6 +249,214 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	return 0;
 }
 
+static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
+					     struct attribute *attr, int id)
+{
+	return attr->mode;
+}
+
+#define to_hsmp_sys_attr(__attr) container_of(__attr, struct hsmp_sys_attr, dattr)
+
+static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret)
+		return sysfs_emit(buf, "%u\n", data);
+
+	return ret;
+}
+
+#define DDR_MAX_BW(data)	FIELD_GET(GENMASK(31, 20), data)
+#define DDR_UTIL_BW(data)	FIELD_GET(GENMASK(19, 8), data)
+#define DDR_UTIL_BW_PERC(data)	FIELD_GET(GENMASK(7, 0), data)
+#define FW_VER_MAJOR(data)	FIELD_GET(GENMASK(23, 16), data)
+#define FW_VER_MINOR(data)	FIELD_GET(GENMASK(15, 8), data)
+#define FW_VER_DEBUG(data)	FIELD_GET(GENMASK(7, 0), data)
+#define FMAX(data)		FIELD_GET(GENMASK(31, 16), data)
+#define FMIN(data)		FIELD_GET(GENMASK(15, 0), data)
+#define FREQ_LIMIT(data)	FIELD_GET(GENMASK(31, 16), data)
+#define FREQ_SRC_IND(data)	FIELD_GET(GENMASK(15, 0), data)
+
+static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret)
+		return sysfs_emit(buf, "%u\n", (u32)DDR_MAX_BW(data));
+
+	return ret;
+}
+
+static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
+				     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret)
+		return sysfs_emit(buf, "%u\n", (u32)DDR_UTIL_BW(data));
+	return ret;
+}
+
+static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
+					  char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret)
+		return sysfs_emit(buf, "%u\n", (u32)DDR_UTIL_BW_PERC(data));
+
+	return ret;
+}
+
+static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret)
+		return sysfs_emit(buf, "%u.%u.%u\n", (u32)FW_VER_MAJOR(data),
+				  (u32)FW_VER_MINOR(data), (u32)FW_VER_DEBUG(data));
+
+	return ret;
+}
+
+static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data[2];
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
+	if (!ret)
+		return sysfs_emit(buf, "%u\n", data[0]);
+
+	return ret;
+}
+
+static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data[2];
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
+	if (!ret)
+		return sysfs_emit(buf, "%u\n", data[1]);
+
+	return ret;
+}
+
+static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret)
+		return sysfs_emit(buf, "%u\n", (u32)FMAX(data));
+
+	return ret;
+}
+
+static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret)
+		return sysfs_emit(buf, "%u\n", (u32)FMIN(data));
+
+	return ret;
+}
+
+static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret)
+		return sysfs_emit(buf, "%u\n", (u32)FREQ_LIMIT(data));
+
+	return ret;
+}
+
+static const char * const freqlimit_srcnames[] = {
+	"cHTC-Active",
+	"PROCHOT",
+	"TDC limit",
+	"PPT Limit",
+	"OPN Max",
+	"Reliability Limit",
+	"APML Agent",
+	"HSMP Agent"
+};
+
+static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
+					   char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 index = 0;
+	int len = 0;
+	u16 src_ind;
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret) {
+		src_ind = (u16)FREQ_SRC_IND(data);
+		for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
+			if (src_ind == 0)
+				break;
+			if ((src_ind & 1) == 1)
+				len += sysfs_emit_at(buf, len, "%s ", freqlimit_srcnames[index]);
+			src_ind = src_ind >> 1;
+		}
+		len += sysfs_emit_at(buf, len, "\n");
+		return len;
+	}
+
+	return ret;
+}
+
 static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
@@ -285,6 +499,8 @@ static int init_acpi(struct device *dev)
 	if (ret)
 		dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
 
+	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
+
 	return ret;
 }
 
@@ -299,9 +515,52 @@ static const struct bin_attribute *hsmp_attr_list[] = {
 	NULL
 };
 
+#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
+static struct hsmp_sys_attr hattr_##_name = {		\
+	.dattr = __ATTR(_name, _mode, _show, NULL),	\
+	.msg_id = _msg_id				\
+}
+
+HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
+HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
+HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
+HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
+HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
+HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_show, 0444);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_show, 0444);
+
+static struct attribute *hsmp_dev_attr_list[] = {
+	&hattr_c0_residency_input.dattr.attr,
+	&hattr_prochot_status.dattr.attr,
+	&hattr_smu_fw_version.dattr.attr,
+	&hattr_protocol_version.dattr.attr,
+	&hattr_cclk_freq_limit_input.dattr.attr,
+	&hattr_ddr_max_bw.dattr.attr,
+	&hattr_ddr_utilised_bw_input.dattr.attr,
+	&hattr_ddr_utilised_bw_perc_input.dattr.attr,
+	&hattr_fclk_input.dattr.attr,
+	&hattr_mclk_input.dattr.attr,
+	&hattr_clk_fmax.dattr.attr,
+	&hattr_clk_fmin.dattr.attr,
+	&hattr_pwr_current_active_freq_limit.dattr.attr,
+	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
+	NULL,
+};
+
 static const struct attribute_group hsmp_attr_grp = {
 	.bin_attrs_new = hsmp_attr_list,
+	.attrs = hsmp_dev_attr_list,
 	.is_bin_visible = hsmp_is_sock_attr_visible,
+	.is_visible = hsmp_is_sock_dev_attr_visible,
 };
 
 static const struct attribute_group *hsmp_groups[] = {
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 8c05e1415820..65d37605bf88 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -229,6 +229,27 @@ int hsmp_send_message(struct hsmp_message *msg)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
 
+int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 n)
+{
+	struct hsmp_message msg = { 0 };
+	int ret;
+	int i;
+
+	if (!data)
+		return -EINVAL;
+	msg.msg_id = msg_id;
+	msg.sock_ind = sock_ind;
+	msg.response_sz = n;
+
+	ret = hsmp_send_message(&msg);
+	if (!ret) {
+		for (i = 0; i < n; i++)
+			data[i] = msg.args[i];
+	}
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_msg_get_nargs, "AMD_HSMP");
+
 int hsmp_test(u16 sock_ind, u32 value)
 {
 	struct hsmp_message msg = { 0 };
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 0063904904ed..febc1672bd65 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -74,4 +74,5 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 	return 0;
 }
 #endif
+int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 n);
 #endif /* HSMP_H */
-- 
2.25.1

