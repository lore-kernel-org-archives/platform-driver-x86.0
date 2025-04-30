Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A5D25A2B4
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016751; cv=fail; b=i1eUeMtECiSMoHcxpY/hii1eb25TS/Ns0tE8Q9yJPwQ2SGEtsxYBl3RByftCLYca1KB6EYbrVXPOQMt4Dknxh3YL4hXn5saDN4BqXJlTw6zYj1UgaU2S1mry7zrjJ0B6EKLy8i++Wg+8wEGiquV6W2gEQgXTx252Kkkz0W71t+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016751; c=relaxed/simple;
	bh=Lk+tIRIjac4yZZecXTFOsmGLKHTeETH7L2iwjaipnnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDkPNkP5R3Nc+3jKOh0dA03FFb4RqFfU+Dm50jcOih7Fx6EZTnZisBkqrGOGpDtRvl2YFA6U9b/CedoHHJ99JUy3P+dHx/S6KO3BmWj0Qok4NHGbS8Du29/sL26/5CB9f/yBG1TvsjjNiwDLBtolq9QD/XDGq5JsN/hipdQvqAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2pyvsjZI; arc=fail smtp.client-ip=40.107.244.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2pyvsjZI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWbYVQZV+OvIVu9Lrry0QyrXg8k7wptqUHTjyAHHZ7I29BVoNykaF+nHU8MKeXqAIj95xg3NkNho8D8Umu5Si1TFvOO4YZqUh2BR8aIr7LKX27LmfP4jbxAWm+XYaRFvrQTlfHRhM5Ilo8F6uMVVltESTc1JshddvvrBisVn/qFrpLY2UcEHIuHgG+ZogfDKHEQ3DS9UGIL49iYH4I//FOoY8SYW3QeUkynyu/jYDPs489imauhBlx+A4aw7ktLZpfuCrcOHkLpZ0Y3AI7qiNqQootiK5T1eTTEPAg63/BLwmYgMelsh/0bsmk1MbuzzADsemZkWoLaMi21cHNKsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmwhqYy8Ncw3X1+AHhWUthglBeV0f28EgXdqGUGbd9c=;
 b=u3YrMZXBFU3Bk2dFRAag1aIiQfO/UqZrUNMLloEauZU1n9p/6FR8p9XYMwpymwQyRQljBX3hZDwL9BJtjWuOxg7543sTjV/PSG9slrFvksHrKojOjF51sdovHaw+3ZhHuaq4ZAs4MX7tI2Ry6me2TSZXheT0VWAAQHa+BShubA1dMIE4wk6pkqu7tWNz0Eo4p93W+bVgpjSMLc0YVLoEyjPXwnAfq5T2z3q5dlvQcnSKIHEP1Q1va5YQQwawSyL7b8g03VtYMyZ9IM/2ixlFjtiRdLrowek6XwWYL83psMvXHSe9s4bxtMHnwam4HtaKEiqG8vpCxTT1wHWiqlG9VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmwhqYy8Ncw3X1+AHhWUthglBeV0f28EgXdqGUGbd9c=;
 b=2pyvsjZIUePq0AdHQ48xwB2t/cp878wF3kAwUSPwMtOyB30EpeniNNJaZ9O3Tkc9Wr/6kHak143myKxcHY1Jo1Gcm2ZzYWwOHq/sLg07GZJnFh1sGqm6t65AaXT5gdGxA1Jgwk6EHYTPEJZhejl6UdTLhq3Ib8NDwa07GH6tYcQ=
Received: from BN9PR03CA0399.namprd03.prod.outlook.com (2603:10b6:408:111::14)
 by SN7PR12MB8104.namprd12.prod.outlook.com (2603:10b6:806:35a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 12:39:05 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:111:cafe::21) by BN9PR03CA0399.outlook.office365.com
 (2603:10b6:408:111::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 30 Apr 2025 12:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 12:39:05 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 07:39:00 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 3/3] platform/x86/amd/hsmp: acpi: Add sysfs files to display HSMP telemetry
Date: Wed, 30 Apr 2025 12:38:19 +0000
Message-ID: <20250430123819.1289068-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430123819.1289068-1-suma.hegde@amd.com>
References: <20250430123819.1289068-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|SN7PR12MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9f56f5-08dd-41d8-ba10-08dd87e3fe76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XtkL3mc5oTlmleWdtfwC4EuSxSpJvRwLZz1Rp9FB3URP4LRQ1UZAqZwZzxyK?=
 =?us-ascii?Q?vfAIRYvAyydpvAAqvGqOvuhxBgjaMuBFzTBHa/LmLU8d0/dZr2eQUxFsOU4Q?=
 =?us-ascii?Q?9MNa4j2Ocd5nofIB0XCtjcEsGu9krCY4Sa++sFBJdaz8Uz9PgbYKkLEDeDN9?=
 =?us-ascii?Q?oLkLiPuePKJG9WikPIhlDqdmQAIa7jKpfLVERXKSh4y2t38ogDrRR+ohp6a4?=
 =?us-ascii?Q?x4H9/4C3rq8aMAY1hnAzS56KUp4UCNqXXs3niUG1dLqGGWHksTn0H6V0baZj?=
 =?us-ascii?Q?xo7LTVHRspG69qIpjRB0hye165anNlYRx/kwzv1gUz7qmTi5WybWuCX27WWg?=
 =?us-ascii?Q?31xCWk3nFKlhyQ88d7itvygQ0tbJD7auYQJ52ajnNMQtu6WmE9loIKnJITad?=
 =?us-ascii?Q?LGgUP3TAwnAPG3mtrXp3zbFgwT076rgqQV/M5NscSi/olvIonl+HuTLYZeGr?=
 =?us-ascii?Q?VqIeoYqy1Gp0HRI3AuvpfMpCD2HHd0p/lxsZZKDJlG1+47YQ5A8/IIJgAcwZ?=
 =?us-ascii?Q?GdppB/9pX7ohQb54lXo0f3NlzA8wQiz2SDniHOj4Gt6VtBPdTPCj1CcWlOBH?=
 =?us-ascii?Q?iiR1VIpgyXDGJbWnLEtdVmWHf6vy5L7z53OBmVz8OZoBKLk9Xm+xKYXVdfxY?=
 =?us-ascii?Q?6Bh7XIQdJxhILlJ1TDKJ24pGEoaSgWXr8TzLG4deW4+o4EVpaVqrJ1rIVvMn?=
 =?us-ascii?Q?QvuHJQ/pX57nzemLBxk4eVvrJaOP6SWMSG3DIrmVTHqSVB2VO1s2aVlyq8tQ?=
 =?us-ascii?Q?Yk6sgEXlmc0ASWsZHAj5VYIuLbbhpzGhJU6ZDqEMvANFZxMMXS2aCpM03z50?=
 =?us-ascii?Q?gJLrs9LBuk79aTx9iz+7APV6152L4dZAhWm2wO3QcVv0vRuAw7y6A/KgIjlW?=
 =?us-ascii?Q?7Glzbp20ieznzFCPfi4yFqr7DUlP3X15BG2BpfGZY5vPhjfx4b1nkDiOn8xB?=
 =?us-ascii?Q?MDHJHMLr2jkZQTPp7jxjc2zasCAsnuThEGvoG3+u2w3AdYZ3HTeeXIphyXvU?=
 =?us-ascii?Q?HeOkbLuNc+ezDStZNI+WQfMGBCEeaTDoHQjxcP/2K212iY7urUdz54bFnC9Z?=
 =?us-ascii?Q?Edi9O7uUFMGjPA7sFNIw3jrL0krS1Fgge/Daxbj8Or0iytAH5n9DyT1kCNGm?=
 =?us-ascii?Q?14TQwNGzyyWGqFbmcjv5sf2TuhyilMxK8jKEIqFC0ipAom0EGiwrVn/YHtb/?=
 =?us-ascii?Q?JMfA0WAzG5E66Bb9cDBKxgrULkW6TwRFyvZGJYcyYgmSbucyoUJlHzFQPq6m?=
 =?us-ascii?Q?zxCG2WJhsLpfLFFBpu8tsy/UcE204xMnv9wi8wygqOxcK2Xgp+i/QLSFkqZu?=
 =?us-ascii?Q?UGZh97eR+lBueuVcpE55EIWCa+VzZTPK2r9gS+duIBkzrKNvZI+9x+9QMl78?=
 =?us-ascii?Q?+hk7xGirhaxuljTZFPx+MNk+Ro0Y5z68CiixcIstsAbmMhUtwCny5pTu1EFZ?=
 =?us-ascii?Q?2CmzHTh5JoAdhnhoq4lmIKSVc2wM/y+PoIvTAFy12fmVBTDKc8w15HkjVSbO?=
 =?us-ascii?Q?6Z9+C1b909CjnAG1nsBWjB84JykyNabFIoqd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 12:39:05.2577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9f56f5-08dd-41d8-ba10-08dd87e3fe76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8104

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
 drivers/platform/x86/amd/hsmp/acpi.c | 260 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c |  23 +++
 drivers/platform/x86/amd/hsmp/hsmp.h |   1 +
 4 files changed, 306 insertions(+)

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
index 93b413e0a6e6..4807f3992633 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -12,6 +12,7 @@
 #include <asm/amd_hsmp.h>
 
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
@@ -243,6 +249,215 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
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
+		src_ind = src_ind >> 1;
+	}
+	return len;
+}
+
 static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
@@ -285,6 +500,8 @@ static int init_acpi(struct device *dev)
 	if (ret)
 		dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
 
+	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
+
 	return ret;
 }
 
@@ -299,9 +516,52 @@ static const struct bin_attribute *hsmp_attr_list[] = {
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
index 3df34d7436a9..6f605409cc02 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -228,6 +228,29 @@ int hsmp_send_message(struct hsmp_message *msg)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
 
+int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args)
+{
+	struct hsmp_message msg = { 0 };
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

