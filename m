Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2085.outbound.protection.outlook.com [40.107.212.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209331B042E
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 May 2025 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526585; cv=fail; b=pYSxBnvFV21UqNdumUiaak+aYZH2iAZHSBsXHHLVsevg9tKhAtWsRkW+vOxXVkSwnN4bRynwUSi/m1a6UcUyCb9KEYiDl+D13+AqkgAvCR6ZPKNqX03I/t4CxxQv/VHmutPjZmMs2XTvcx3h6lqTIMDagqZqVm0lv6H75XEfAuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526585; c=relaxed/simple;
	bh=Klm2oB/pqGAk1soIRvuwcDDqUFt3w+cBsBOBdx3RjS8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+YCBgUX33xnyNC791JU951snE0Iv8fgwaZoZ9Z4R7lLSn73XifTPoLzRDyq8lhM+mNHyrhCt9PzMj8/zhXhT7rnRPiww/osMJH4oalsHu8NPmeVTdv3+m8yzRmEFX5ID57axsLj9eNKWeNoc+NJLxUhrTq3yMzkyiDqqIlDptY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5RE5Ail7; arc=fail smtp.client-ip=40.107.212.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5RE5Ail7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJNgx3I5Cc67No5950tnjDJMZkCuErVR3awuAZskipcz5Grj5PKAPtGC70W/SzMU+mUFMuSigwNUYnpHmiALFhXcO+yI4w9QRr3RZtuvKxkZ7ULgdi8IM6uqvFEDeTqPjURmdEtTDFPgl/BnD8LqaKSv2RKIqWaDuskMc+/dRx+RUdF4CpeIKg7KykxTl4in0eUafOPkmy0H+40R8SR+Q9Z3ESNTAUi/70/CuhUDhverhXpFbTo0qRhRjaUhNN0+gzo/i2dJxwvlDgaYCNTb2r8mww8opeJ1xE/T/FIYnnM+ynUloe2xzd2OtJaHuv/UA+UG8eB6p1gTEv03XeMq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5N6fuO7WdMYWqNrM6NVkgAraWOZDFsYVUdfEjGKDZbc=;
 b=pqZcM2xU3KLysnDTV8kFR72Fh36mVa4PltUlfWmDpPVrzKsHqkNEIoBDuvxk7u+qOlOFz5x96S51y+I+cKSCdJbESTY0EsUDbbaZ5zAxnUilFcFqNt1Fy5/pwyTGVC6Ree3XMBHdChkh6BnZU4B7RZE6DhP8mAPcZhjwO0b0DdhZXnXK2bIdCgwp+eAtES5hm0+J9KijHk2sl4nHhhXV/rb5a2pZ7i68Es1U6QggM1rP3uAXNTEcqttZh8IGD0d7AHc3JJqPUyJ/ct2aFUfRhVQ5/2tDLDyQ5OPcoWVk4y8Us+h0hdaMq9YPlBN5D5GFkBXvPrsTYN79VVFmFh+pxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5N6fuO7WdMYWqNrM6NVkgAraWOZDFsYVUdfEjGKDZbc=;
 b=5RE5Ail7kXOvzEzB6Gj2S3p2poja8skuftyY0V7ZifrqM10VjiVY2v7lniKMNycfIXJ90PmpG7MD5MbawIb4vU/sDuwf3d3cNrJXEHDLc2IC8Z5ud13TqyngTYUUEAnE716sR6Fe2GkN/XuLXSSKKEnIqd5f540mUzbrPwvDyy8=
Received: from SN1PR12CA0056.namprd12.prod.outlook.com (2603:10b6:802:20::27)
 by IA1PR12MB8286.namprd12.prod.outlook.com (2603:10b6:208:3f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 10:16:18 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::e0) by SN1PR12CA0056.outlook.office365.com
 (2603:10b6:802:20::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 10:16:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 10:16:17 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 05:16:13 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4 3/3] platform/x86/amd/hsmp: acpi: Add sysfs files to display HSMP telemetry
Date: Tue, 6 May 2025 10:15:42 +0000
Message-ID: <20250506101542.200811-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506101542.200811-1-suma.hegde@amd.com>
References: <20250506101542.200811-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|IA1PR12MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbe4bb0-f946-4766-5b10-08dd8c870a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q5Xl4vhRS3RoB65FMZ+Zz/aKMTu6odMBNWkOab89TtPdzZXdbDK1Swn57COi?=
 =?us-ascii?Q?qrd453XZR8+WDXJL+vbNa7Asx7HGXS7o9AS0K3y6abkly17xSGoluCp7eReo?=
 =?us-ascii?Q?ruevpnve4uqvwTuYb7wZwR41cMG1t5aS4n9EcKlWWQxHfRQIW1GsfPNT7Aaz?=
 =?us-ascii?Q?Wir0LN+I2XNkJa+OPyxlBjd4GW78iZsSRvPA+GabkCi7VFkrYds4eb6JLekk?=
 =?us-ascii?Q?+qXFphcc5d4NnmmcioPfbBn7dZm14rltX8lQOc9MLkeR29QXvPtMo5sMS2zg?=
 =?us-ascii?Q?D4TroexSGajGjOnfeIHKxifr3+D8WJhOSR1mlQr8A7MzBhVsCAQYvFEgxTXE?=
 =?us-ascii?Q?aAv5MUEvtfokIPfUt3dI6kQKxbTcL18FXyQ2EGOJ2xH6GvIxVaPemoti5pzL?=
 =?us-ascii?Q?C2Djk93S3RlFVxVlS/st1Fa9Zi9J7Lz7vqYicBwqwMmo60IdR/ng7N6Vxymn?=
 =?us-ascii?Q?QbZxmtsuNSX0YT7zNTHDEHtLz2HA43XoYRX2Ie6x0BmFwwSKmO3usnHDAm4q?=
 =?us-ascii?Q?mbiN/EMsGDZKmPApDXx3WP1fH1sUkx1w4a8E3M74Mb5Ud7BUU1YAkpezLKzu?=
 =?us-ascii?Q?i17eul9vwTCelmBXF62/DIPmJaIg25sJXVjaV44hMqXG0jrHD1BZDzHjl484?=
 =?us-ascii?Q?IDYco3OOqx54Vonfv/Hw+xy86Dc9WDsPQiBYQaH2tB3lbKhLjzCKIiwnspK8?=
 =?us-ascii?Q?idFULm4lIrk9UtDW9PCbRc6phwMDhuElMYDMdKZqKouR5xYj6V0dDV6TJw5T?=
 =?us-ascii?Q?h8WVsAcBVv0R5Kxh8HeA3DffYwklWUeYurwkwgvAGtW7lkdQzoBTPmlSMZJ2?=
 =?us-ascii?Q?VegMv+vtIokO2xxcKR6nk8cBGIH+Rwn0q4GpyDCsEruCsCam1INyobZVpIBZ?=
 =?us-ascii?Q?icsd+1Ejx6qc3NkeaFy3WK6OiCsFSoisF6EdRDWdkk6iqyi6Sb5cT2XOsePu?=
 =?us-ascii?Q?xAQDTg/AWsC9PSORmfZ+cD5kWYNCq0btyYmT+1/wLuC0G74jLZbUj8wr1oQ4?=
 =?us-ascii?Q?JZj/F5X1vQYKzKjIjtWoLL/WY+Z0E4BSWnQ5nDKH+MtbUt5dhoA96HLM5GAX?=
 =?us-ascii?Q?v08DgKVhgdJ9xAd3uOmow5cmzJYFqAnBseq5dj8rAJxQFe6lFJ3ICul9qT1n?=
 =?us-ascii?Q?PNjGzZD98VIHuYBg+pewPkb5fPKrgGq0/F/hpNatgkwMu6dpfmTSfZGyxW+P?=
 =?us-ascii?Q?yrz88va17YY7RPWrhTEI2n/OTCvcT7UTDLAQZeLyz9ZD50NkI4E9IgYg8sSc?=
 =?us-ascii?Q?FyjjCF9UP3xj1ht6w4hkr/5lMLu8EvnQqQLj8EoXUzhJlIE0YMcbN4YZ5vWF?=
 =?us-ascii?Q?5KcSrtTV24azuc5azpavEXEzXdb/y/vCubng4llv+pkDUJvYmI70dWf4VGtZ?=
 =?us-ascii?Q?sWy4jvicmcNG86yVLAmw9okFBSCn/AK937unMkza6nx/RZFprNUpkaiGfjAc?=
 =?us-ascii?Q?3RzfU5kGTuZz5bWOSBeo+VbcunB8gY9rRtkiXBJkuvgUmxwqa5e/19FBXVjV?=
 =?us-ascii?Q?KpwRtkMf2DRTf0+ww6KbMoNVFnjhz2bQGRqG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:16:17.9472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbe4bb0-f946-4766-5b10-08dd8c870a72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8286

Make frequently fetched telemetry available via sysfs. These parameters
do not fit in hwmon sensor model, hence make them available via sysfs.

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
Changes since v3:
1. include array_size.h
2. include bitfield.h and bits.h
3. Remove bitops.h
4. Remove comma from terminator
5. Change { 0 } to {} for initializing struct hsmp_message
6. Change src_ind = src_ind >> 1 to src_ind >>= 1;

Changes since v2:
1. Change commit mesage and description
2. Update documentation
3. Remove hwmon related documentation changes from this patch
4. Define FIELD_GET_U32, use it everywhere where casting to u32 is needed
5. Define masks and use FIELD_GET() directly instead of defining function like
   macros
6. Return early on error cases from all the functions
7. Add comma after hsmp agent in freqlimit_srcnames[]
8. Make index as int in hsmp_freq_limit_source_show(), remove
   unnecessary intialization and change the printing format
9. Change int i to unsigned int i and return early on error in
   hsmp_msg_get_nargs()
11. Change n to num_args in hsmp_msg_get_nargs()
12. Change __attr to _attr in to_hsmp_sys_attr()
13. Change "%u" to "%lu" in sysfs_emit to avoid compiler warnings

Changes since v1:
1. Add linux/bitops.h
2. Define DDR_MAX_BW, DDR_UTIL_BW DDR_UTIL_BW_PERC FW_VER_MAJOR FW_VER_MINOR FW_VER_DEBUG FMAX
   FMIN FREQ_LIMIT FREQ_SRC_IND and use them in functions.
3. Return early in hsmp_msg_get_nargs()
4. Change while loop to for loop in hsmp_freq_limit_source_show()
5. Correct the GENMASK size in hsmp_ddr_util_bw_show()[bit 19:8, instead
   of bit 20:8]

 Documentation/arch/x86/amd_hsmp.rst  |  22 +++
 drivers/platform/x86/amd/hsmp/acpi.c | 262 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c |  23 +++
 drivers/platform/x86/amd/hsmp/hsmp.h |   1 +
 4 files changed, 308 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 3ef3e0a71df9..a094f55c10b0 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -71,6 +71,28 @@ Note: lseek() is not supported as entire metrics table is read.
 Metrics table definitions will be documented as part of Public PPR.
 The same is defined in the amd_hsmp.h header.
 
+2. HSMP telemetry sysfs files
+
+Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/.
+
+* c0_residency_input: Percentage of cores in C0 state.
+* prochot_status: Reports 1 if the processor is at thermal threshold value,
+  0 otherwise.
+* smu_fw_version: SMU firmware version.
+* protocol_version: HSMP interface version.
+* ddr_max_bw: Theoretical maximum DDR bandwidth in GB/s.
+* ddr_utilised_bw_input: Current utilized DDR bandwidth in GB/s.
+* ddr_utilised_bw_perc_input(%): Percentage of current utilized DDR bandwidth.
+* mclk_input: Memory clock in MHz.
+* fclk_input: Fabric clock in MHz.
+* clk_fmax: Maximum frequency of socket in MHz.
+* clk_fmin: Minimum frequency of socket in MHz.
+* cclk_freq_limit_input: Core clock frequency limit per socket in MHz.
+* pwr_current_active_freq_limit: Current active frequency limit of socket
+  in MHz.
+* pwr_current_active_freq_limit_source: Source of current active frequency
+  limit.
+
 ACPI device object format
 =========================
 The ACPI object format expected from the amd_hsmp driver
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 93b413e0a6e6..e9075b129213 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -12,6 +12,9 @@
 #include <asm/amd_hsmp.h>
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
@@ -36,6 +39,11 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
+struct hsmp_sys_attr {
+	struct device_attribute dattr;
+	u32 msg_id;
+};
+
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
 {
@@ -243,6 +251,215 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	return 0;
 }
 
+static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
+					     struct attribute *attr, int id)
+{
+	return attr->mode;
+}
+
+#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
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
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", data);
+}
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
+static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
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
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
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
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
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
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
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
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data[2];
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
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
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data[2];
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
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
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
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
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
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
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
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
+	"HSMP Agent",
+};
+
+static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
+					   char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	unsigned int index;
+	int len = 0;
+	u16 src_ind;
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
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
 static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
@@ -285,6 +502,8 @@ static int init_acpi(struct device *dev)
 	if (ret)
 		dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
 
+	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
+
 	return ret;
 }
 
@@ -299,9 +518,52 @@ static const struct bin_attribute *hsmp_attr_list[] = {
 	NULL
 };
 
+#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
+static struct hsmp_sys_attr hattr_##_name = {		\
+	.dattr = __ATTR(_name, _mode, _show, NULL),	\
+	.msg_id = _msg_id,				\
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
+	NULL
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
index 3df34d7436a9..1f0cda87b6e6 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -228,6 +228,29 @@ int hsmp_send_message(struct hsmp_message *msg)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
 
+int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args)
+{
+	struct hsmp_message msg = {};
+	unsigned int i;
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+	msg.msg_id = msg_id;
+	msg.sock_ind = sock_ind;
+	msg.response_sz = num_args;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num_args; i++)
+		data[i] = msg.args[i];
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_msg_get_nargs, "AMD_HSMP");
+
 int hsmp_test(u16 sock_ind, u32 value)
 {
 	struct hsmp_message msg = { 0 };
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 02eeebfcb165..027db8e1de12 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -69,4 +69,5 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 #else
 int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
 #endif
+int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
 #endif /* HSMP_H */
-- 
2.25.1

