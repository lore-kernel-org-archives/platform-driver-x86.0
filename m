Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB524633B
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Feb 2025 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739882379; cv=fail; b=sD3SG7+MU1aRb3Z4XCgg3goX5nLWd3xVGzOsksR0ZWFCw5fgc1lKdp21fTwmv4jR92M+7s6oOUs6RWtLMCZ9hPWlRizGUMhs3/tudQbXDqnC4w3cVzB74iqhX9Afsdv9SPKkv5f0sTfUvNmxEoQ0uiqBqtAuUGjJ2y7BebfXYLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739882379; c=relaxed/simple;
	bh=QZ7PFlAF92x7//13btyHrKeeLUBcavHtMVjeWau8jfE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZUC86oRNPlrJIaSiGAmSZao5LN8yydw5/Wqt9RfwtkoP79xX3TMkoZ4JjDNdis+naZJbndBhcG/l3aOEoe3LBKepuNCaNsT7iMA4rvzL9r/TisaHzM9Es0wN6pT1NyviGl9m2VPUJTxDMCytR/65eMl/lmx0cEWOWrLZRAbXZ14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=THanMlRQ; arc=fail smtp.client-ip=40.107.223.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="THanMlRQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfHwioJfWak2VBmzcWrCQyd3uHXVOW/C3AAF+lNv9irBpLb6Sh8/4ALTtrv3qJzrgVpKzCqa1AHBbOQ9T/bF2FF+lMMuESbJEehCPk1ru+34AqqanbWmx8MbRddfcSEdAyMg+UCkj+Id5idCE4KJqaN6AGRvUnvtj7sWbiCjq4RBMRCDni7XgOoNI9GNwu0hzDyafSZaH2l6Nvh3asBa6pQGotH17OiIB4gCCYGGKipmbulu8AC+3spMQr8qAJzJRVyRoeOvpdK45VI2RUIGPFZHAXKXy86+LATDl8FCqehWFoIHK7QwKD28EvsKbi5KVsGlkpjt1Fwv7WRytzs/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQmBNhYrRsO5UK+WnezZPCGS+W+jy6erIirt+SdnrLY=;
 b=RqdAWv5Xqx8xCJvSCV72MSGD9zmuRSLa68CQRFoWALaorgEbu7K1f+VOz1sEk8mQl4vZOBegZJW0VXIZO+R4Vp2iN+Qm4cxmvDTz/QdZr0NZ8HsGGZmE0iESg+QaMNQXxcWTsLwG1Yhg/pH14jsw0VzOYWP8hA4wNaKOsRAba0WsWiJXsUKtXkYZsMP1bddgVU3WreQPYEKUpWOUResGmmOblT9ZLXWlFem8WFf9Zypy1/UfUp0SagAcfjV2zhmsxs1Nu6/KsI+D+49dY4fia+ZbmnahuEa4NV4F9c/eL790sf2ZxiXUQFYDcby6jF91LUSrqo6YbJPhBGf4ZOxZmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQmBNhYrRsO5UK+WnezZPCGS+W+jy6erIirt+SdnrLY=;
 b=THanMlRQzB/GVHV81vbpUpcym1oy+tk5Hy1/2uImMCc/4BSNhYEv/t4sYPdjrTpo3AG1DtOo+sa1WxP3q33TBnklH7dH/QkewjIpK9zXX0yFK0EY27YqPXUhJQQ1me37cTq1SHsgf6jzApFJwIzTv1oaIx/XnGS/tDC4hjF5nnU=
Received: from PH8PR15CA0007.namprd15.prod.outlook.com (2603:10b6:510:2d2::10)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 12:39:33 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:2d2:cafe::72) by PH8PR15CA0007.outlook.office365.com
 (2603:10b6:510:2d2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 12:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 12:39:33 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 06:39:30 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 3/3] platform/x86/amd/hsmp: acpi: Add sysfs files to show HSMP telemetry
Date: Tue, 18 Feb 2025 12:39:05 +0000
Message-ID: <20250218123905.51984-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250218123905.51984-1-suma.hegde@amd.com>
References: <20250218123905.51984-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d15c6ad-521a-4f06-b020-08dd50194bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pt1jg3vyDprwh5fzpC+nR88k3PRA8qVM6c8JBOS6lPlgs1ImlpJusNLNIUUI?=
 =?us-ascii?Q?Ek8m1G3o+sCQYGlZCPeiSVayfNvhTMVZfw/mLakaLENLtIdZA3TS4eA8o+qF?=
 =?us-ascii?Q?jcQQGqLQkFr9tF14Gg9+pxfxJbT36Oz7nx+LKbYZG9Z34/rUlpDzZQUAczG4?=
 =?us-ascii?Q?kmNlp3gPJU6hByDIbr0xtm4DZJrkNU4eVqdwipwuaFC1j4mMGjGZ6lDIsrBF?=
 =?us-ascii?Q?uXWsMds/B+FBstXrE3Sjb/YqKhmy7q1OUj7twWGTcnB/hqlzOHhHftRr4Z/Z?=
 =?us-ascii?Q?DsVyIBlMSkWFkiivMuhglg81ubYugB984y9FfhWxcStyRSCIkqL0E2s2WbDl?=
 =?us-ascii?Q?W8vw+3FKDmVvAFw4AtqJNyBQdOH1ii5KRZNUq6AW2gvphyaXboiQVA8UQ+zI?=
 =?us-ascii?Q?OGOC467T27MyfiDA7LD5edcCcgP+cfMLvIlAfFHHZSriTOCMY95eE9CQUt7+?=
 =?us-ascii?Q?aDHcixy0f+gLoiufHn/KM5gGnIjIL+//MI+ZPsX/WR6YpclwvUn0tLdkoLwW?=
 =?us-ascii?Q?ZGBisARMZKHBGHI0LUx9YaCmOXAkz5i2BTXl6PiGocx7wkl/1az4JAsNltFO?=
 =?us-ascii?Q?dxrFM2MgFfBXYsfKfqKZm+V2VZoWcUnhwZmY9ystREDWhUTf/bCGWL1XT0dQ?=
 =?us-ascii?Q?WAA9lq+enL4cBS6nAXHDmwbDiQm2u81z0jBkbVJHBKlN5nbmJa/2ra7iLeXG?=
 =?us-ascii?Q?X65OrphgVqLbAvQ8Af4wUAeFacDC9U8GWsBvfv/ddiW3Zr5XSRRHLBnSWwu+?=
 =?us-ascii?Q?Fej02xDDnQ1NoqjbCYBAv+SaXsDnCev/tFTrEo1pUyi+RUjgY6Vq51JI+zEF?=
 =?us-ascii?Q?r3cbmYPrzjgUnRXG23OpmlS6WIFP6BOEqy7YqNqWlJyqaZ+cYFISBGyDQnCo?=
 =?us-ascii?Q?QGstc3kL5LKmwvYFZrTUZqKyDMsXzGzNX3KjFwHYsqeTrwkEwgA7V6Yw4QBv?=
 =?us-ascii?Q?hkeJBA2euZIpwnP0EEgBdfH2NnmTrpdeC90e/uGmVSjIa4k6Ql5WnDgklNfx?=
 =?us-ascii?Q?YaoSfNp0nBM0T944P3fbmYFuiX3nlTMEzL0vSfIsr9AaHSeAb0gp5nQNBBwR?=
 =?us-ascii?Q?7yMv8cAZa+3Diyut/beL67MZt6Ovw7onfPM53CtWVCHAB+1eH78EUfR89xmX?=
 =?us-ascii?Q?v3etVkOrtCo85LaLHrCsuATNuwU7ugBkWg8pEcfETL4rm7jfWPQQnC7R2Tnj?=
 =?us-ascii?Q?5Jmcs2vnf+ogyzbE8awYO1X3hSKCYRphE+DB6AXdduZw8x7Y4OVlvpi8aFgW?=
 =?us-ascii?Q?hct+2zT/RxPy4Wgb0wTnMWn1mt2F6QAoVsYuYAoBa6vjqtoIh+H0GOAeY8bN?=
 =?us-ascii?Q?+QGmKBpJiAfBQbuPMywJdLRxV8MwOAljdJko/Pl3vPXfF1u9UVMHze8Jicdy?=
 =?us-ascii?Q?rW970iK5YT+ZIIqdNF8omZ6G2iNHAf5YlO3DEbPbVmn7/UGXQPpL298d1lIM?=
 =?us-ascii?Q?OYCxinXNWZydyzNY53Tn9saHOYiOqJX8niPUuioDxBTz/zfrpuBOmbdJ91oS?=
 =?us-ascii?Q?FF7oGbUHY9is9Is=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:39:33.0632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d15c6ad-521a-4f06-b020-08dd50194bc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892

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
 Documentation/arch/x86/amd_hsmp.rst  |  19 ++
 drivers/platform/x86/amd/hsmp/acpi.c | 269 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c |  21 +++
 drivers/platform/x86/amd/hsmp/hsmp.h |   1 +
 4 files changed, 310 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 9e5fef538f4f..1bd13279461f 100644
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
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index f73b6aedb986..5c327f94032a 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -36,6 +36,11 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
+struct hsmp_sys_attr {
+	struct device_attribute dattr;
+	u32 msg_id;
+};
+
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
 {
@@ -243,6 +248,226 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
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
+static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+	u16 mbw;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret) {
+		mbw = data >> 20;
+		return sysfs_emit(buf, "%u\n", mbw);
+	}
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
+	u16 ubw;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret) {
+		ubw = (data >> 8) & GENMASK(12, 0);
+		return sysfs_emit(buf, "%u\n", ubw);
+	}
+
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
+	u8 perc;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret) {
+		perc = data & GENMASK(7, 0);
+		return sysfs_emit(buf, "%u\n", perc);
+	}
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
+	u8 major;
+	u8 minor;
+	u8 debug;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret) {
+		major = data >> 16 & GENMASK(7, 0);
+		minor = data >> 8 & GENMASK(7, 0);
+		debug = data & GENMASK(7, 0);
+		return sysfs_emit(buf, "%u.%u.%u\n", major, minor, debug);
+	}
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
+	u16 fmax;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret) {
+		fmax = (data >> 16) & GENMASK(15, 0);
+		return sysfs_emit(buf, "%u\n", fmax);
+	}
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
+	u16 fmin;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret) {
+		fmin = data & GENMASK(15, 0);
+		return sysfs_emit(buf, "%u\n", fmin);
+	}
+
+	return ret;
+}
+
+static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u16 freq_limit;
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (!ret) {
+		freq_limit = data >> 16 & GENMASK(15, 0);
+		return sysfs_emit(buf, "%u\n", freq_limit);
+	}
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
+		src_ind = data & GENMASK(15, 0);
+		while (src_ind != 0 && index < ARRAY_SIZE(freqlimit_srcnames)) {
+			if ((src_ind & 1) == 1)
+				len += sysfs_emit_at(buf, len, "%s ", freqlimit_srcnames[index]);
+			index += 1;
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
@@ -280,6 +505,7 @@ static int init_acpi(struct device *dev)
 		if (ret)
 			dev_err(dev, "Failed to init metric table\n");
 	}
+	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
 
 	return ret;
 }
@@ -295,9 +521,52 @@ static const struct bin_attribute *hsmp_attr_list[] = {
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
index e0227247c995..78cf63cf2613 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -75,4 +75,5 @@ int hsmp_get_tbl_dram_base(u16 sock_ind);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
 struct hsmp_plat_device *get_hsmp_pdev(void);
 int hsmp_create_sensor(struct device *dev, struct hsmp_plat_device *pdev);
+int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 n);
 #endif /* HSMP_H */
-- 
2.25.1

