Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C34EB8FAD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Sep 2023 07:13:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbjIFHNm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Sep 2023 03:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbjIFHNl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2023 03:13:41 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2073.outbound.protection.outlook.com [40.107.101.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1A9E43
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Sep 2023 00:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMucN56VN3ixP/gL8DMM3IK7wBeaspAwYo4v3vJlMMS3X/SHR2Ll/hw4AeCRaDPJ0aasgaJjgxs8ogJW5SorcxNMax0nlFkgfRO1JOkmpFtOEOIUCWI5u51A2Y/SS/1HhUeboVf+I8nowwAyR9amESz6grFdKK9h+ae7uhZiOcJ0o0KXxL9lw3m6UIZSqLfO8UV8xDP7E/mxFntK8x4vTFbSnTkTjjum/uJAnGL0aV/HTomUB+cFP8S9oleXoQoT29XCEI1HD5QsMqBHUge2yaWvOFukStqmBg2ZWnr18QvHxMJH99nS+FHt8+gb0fh5fymRZzNckQHKH4kv+IRyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/R1oMFy7IUDtu2EehjXsHk0HpvOmCVoqjfBZnGhXZo=;
 b=O/ryi/KSvhHVxzd5VLrRIpjLsdmPJghH81/A/j0vQdpe88G0/0zQYNPW9oK1/SxnG5qfqD3M+s9JUTHI1OiJb1oP7kFypvZsZbf3zH5AyNwzUhByO1yKalZIuvXOoOxABZOBZR10wv1I2uHzdhpsBzFhdJhXaZtM5pmKglJ1swqgvz5IAHzmKusj7s21HMnp21z9lkBV9CaJunJDjK5cQpaHHyTfX1F7tVHTSiOLO8Lud+RyXmmLejvt540Ai7Gbj/WVhcRPEh7FWTNvtFtWx+wx+gNxuXYposxpu3FXcPybAPv6jYgAnot7wuoMYsavCbP0ezJBExgHuAouCxk40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/R1oMFy7IUDtu2EehjXsHk0HpvOmCVoqjfBZnGhXZo=;
 b=083L1g5gegjDxWvHuwDeRzj9H642ZtFot2R81b2zqWZ8UEdDhyj/91fcjlwCrrGTCgaj79eHZo1rewYXH/S6iUOQU7CERj/2GjtsCYTlFj4Ux3crlwzp9K9FQI8xE6iXkTIXX6/ySBs1fXr2ZPKndtcIb+a2z3Ggn1ZIvpJLbq8=
Received: from SN1PR12CA0094.namprd12.prod.outlook.com (2603:10b6:802:21::29)
 by BL0PR12MB5010.namprd12.prod.outlook.com (2603:10b6:208:17c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 07:13:32 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:802:21:cafe::1e) by SN1PR12CA0094.outlook.office365.com
 (2603:10b6:802:21::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Wed, 6 Sep 2023 07:13:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 07:13:32 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 02:13:29 -0500
From:   Suma Hegde <Suma.Hegde@amd.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 2/4] platform/x86/amd/hsmp: add support for metrics tbl
Date:   Wed, 6 Sep 2023 07:13:00 +0000
Message-ID: <20230906071302.291260-2-Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230906071302.291260-1-Suma.Hegde@amd.com>
References: <20230906071302.291260-1-Suma.Hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|BL0PR12MB5010:EE_
X-MS-Office365-Filtering-Correlation-Id: b9381445-ebd4-41e4-e233-08dbaea8c718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IudTw1n/CCi0WP5uvUxXn3mClRXSmSayo4DAJhMp2wXYMN1/Xjakx/tsatScP/HYq8zEdCJXS7EitWnru3AAoqxsw8BuzX1PjL+DVXwJRD2MbAnPqVqwUOGiHJaqlGBzKFYGHA6b4IYwGEMnXzlpCCDmbYvh8YvjiWbpul8tEWblik3CbZv4MIaw8Pt9U1P4qLs5uJWgJavczYuEAbJ4crbt70lV0LvwtRGbLgm1jtGpOn8wDWuKLN3ZU1l0Wy6K+0mfsXsKx4UvF4IbDmew4YEPDNCdSehAamPjEhk9l9qOGLyz06Eq53GAtpaqqr6L+N+HODgLP1E+RMWYpALTzEbZ/67e/wpM/t1P1/TJXLPjl4VwmKIcAf8onk6cChzQrg87yCCcrwhlJrF9b9BOmQ8xJDGuLF2RZYNXO4gibqr8RF0rFGaNlXO6Fdb8Ic2+aJLyalzoMTOOOImpc9js22H6rRwXEHM5mXR84J8qusdZN1o2QqQB/qH+eyruoebWLVcq0vKo5D5CvPATcoior/OthOcWJIdkrR/J4p6pKOSojvsnJx5N8SXokzXrUJxElY94g1dL22pui20VUXjWvzYhDw1v49yikZ0wuVD2xpR9dRPpRID0tW06FSzNLhzjfJF+AddreSb2wQn774Xb0g1ZQNWwNEqg+C8+szWTQJgKdXwdf817tdbKM3+OuHLx6TMWiEL0WvdfKxRR0gjMhnQTLO+Oly8pt2eIwhCEM2tgBavZTqnqrbsg/FIJIK9/BAdl/URNiX5GNGxaJmxihQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(41300700001)(356005)(82740400003)(426003)(6666004)(81166007)(86362001)(478600001)(83380400001)(2616005)(26005)(16526019)(47076005)(7696005)(36860700001)(40480700001)(336012)(1076003)(70586007)(70206006)(30864003)(54906003)(6916009)(316002)(2906002)(36756003)(8936002)(8676002)(5660300002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 07:13:32.0467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9381445-ebd4-41e4-e233-08dbaea8c718
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5010
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Suma Hegde <suma.hegde@amd.com>

AMD MI300 MCM provides GET_METRICS_TABLE message to retrieve
all the system management information from SMU.

The metrics table is made available as hexadecimal sysfs binary file
under per socket sysfs directory created at
/sys/devices/platform/amd_hsmp/socket%d/metrics_bin

Metrics table definitions will be documented as part of Public PPR.
The same is defined in the amd_hsmp.h header.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
1. Remove HSMP_DEVNODE_NAME and HSMP_CDEV_NAME macro definitions in
this patch
2. Remove extra space in comments for HSMP_GET_METRIC_TABLE_VER,
   HSMP_GET_METRIC_TABLE and HSMP_GET_METRIC_TABLE_DRAM_ADDR enum
   definition in amd_hsmp.h files
3. Change check, count == 0 to !count in hsmp_metric_tbl_read() function
4. Add hsmp_metric_table_visible() function 
5. hsmp_create_metric_tbl_sysfs_file() is renamed as hsmp_init_metric_tbl_bin_attr()
   and code is also modified slightly
6. Modify hsmp_create_sysfs_file() to use devm_device_add_groups()
7. Change from cleanup label to deregister label
8. Add dev_err print in hsmp_get_tbl_dram_base()
9. Reword "Unable to Failed" in hsmp_get_tbl_dram_base()
10. Add HSMP_GRP_NAME_SIZE and NUM_ATTRS macros
11. Remove sysfs cleanup code in hsmp_pltdrv_remove()
12. Correct ATRR typo error
13. Change sprintf to snprintf
14. Check metrics table support only against HSMP_PROTO_VER6


 arch/x86/include/uapi/asm/amd_hsmp.h | 109 ++++++++++++++++
 drivers/platform/x86/amd/hsmp.c      | 180 ++++++++++++++++++++++++++-
 2 files changed, 286 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 769b939444ae..f3479b768fb9 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -47,6 +47,9 @@ enum hsmp_message_ids {
 	HSMP_SET_PCI_RATE,		/* 20h Control link rate on PCIe devices */
 	HSMP_SET_POWER_MODE,		/* 21h Select power efficiency profile policy */
 	HSMP_SET_PSTATE_MAX_MIN,	/* 22h Set the max and min DF P-State  */
+	HSMP_GET_METRIC_TABLE_VER,	/* 23h Get metrics table version */
+	HSMP_GET_METRIC_TABLE,		/* 24h Get metrics table */
+	HSMP_GET_METRIC_TABLE_DRAM_ADDR,/* 25h Get metrics table dram address */
 	HSMP_MSG_ID_MAX,
 };
 
@@ -64,6 +67,14 @@ enum hsmp_msg_type {
 	HSMP_GET  = 1,
 };
 
+enum hsmp_proto_versions {
+	HSMP_PROTO_VER2	= 2,
+	HSMP_PROTO_VER3,
+	HSMP_PROTO_VER4,
+	HSMP_PROTO_VER5,
+	HSMP_PROTO_VER6
+};
+
 struct hsmp_msg_desc {
 	int num_args;
 	int response_sz;
@@ -295,6 +306,104 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
 	 * input: args[0] = min df pstate[15:8] + max df pstate[7:0]
 	 */
 	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_GET_METRIC_TABLE_VER, num_args = 0, response_sz = 1
+	 * output: args[0] = metrics table version
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_METRIC_TABLE, num_args = 0, response_sz = 0
+	 */
+	{0, 0, HSMP_GET},
+
+	/*
+	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 2
+	 * output: args[0] = lower 32 bits of the address
+	 * output: args[1] = upper 32 bits of the address
+	 */
+	{0, 2, HSMP_GET},
+};
+
+/* Metrics table for EPYC socket(supported only from proto version 6) */
+struct hsmp_metric_table {
+	__u32 accumulation_counter;
+
+	//TEMPERATURE
+	__u32 max_socket_temperature;
+	__u32 max_vr_temperature;
+	__u32 max_hbm_temperature;
+	__u64 max_socket_temperature_acc;
+	__u64 max_vr_temperature_acc;
+	__u64 max_hbm_temperature_acc;
+
+	//POWER
+	__u32 socket_power_limit;
+	__u32 max_socket_power_limit;
+	__u32 socket_power;
+
+	//ENERGY
+	__u64 timestamp;
+	__u64 socket_energy_acc;
+	__u64 ccd_energy_acc;
+	__u64 xcd_energy_acc;
+	__u64 aid_energy_acc;
+	__u64 hbm_energy_acc;
+
+	//FREQUENCY
+	__u32 cclk_frequency_limit;
+	__u32 gfxclk_frequency_limit;
+	__u32 fclk_frequency;
+	__u32 uclk_frequency;
+	__u32 socclk_frequency[4];
+	__u32 vclk_frequency[4];
+	__u32 dclk_frequency[4];
+	__u32 lclk_frequency[4];
+	__u64 gfxclk_frequency_acc[8];
+	__u64 cclk_frequency_acc[96];
+
+	//FREQUENCY RANGE
+	__u32 max_cclk_frequency;
+	__u32 min_cclk_frequency;
+	__u32 max_gfxclk_frequency;
+	__u32 min_gfxclk_frequency;
+	__u32 fclk_frequency_table[4];
+	__u32 uclk_frequency_table[4];
+	__u32 socclk_frequency_table[4];
+	__u32 vclk_frequency_table[4];
+	__u32 dclk_frequency_table[4];
+	__u32 lclk_frequency_table[4];
+	__u32 max_lclk_dpm_range;
+	__u32 min_lclk_dpm_range;
+
+	//XGMI
+	__u32 xgmi_width;
+	__u32 xgmi_bitrate;
+	__u64 xgmi_read_bandwidth_acc[8];
+	__u64 xgmi_write_bandwidth_acc[8];
+
+	//ACTIVITY
+	__u32 socket_c0_residency;
+	__u32 socket_gfx_busy;
+	__u32 dram_bandwidth_utilization;
+	__u64 socket_c0_residency_acc;
+	__u64 socket_gfx_busy_acc;
+	__u64 dram_bandwidth_acc;
+	__u32 max_dram_bandwidth;
+	__u64 dram_bandwidth_utilization_acc;
+	__u64 pcie_bandwidth_acc[4];
+
+	//THROTTLERS
+	__u32 prochot_residency_acc;
+	__u32 ppt_residency_acc;
+	__u32 socket_thm_residency_acc;
+	__u32 vr_thm_residency_acc;
+	__u32 hbm_thm_residency_acc;
+	__u32 spare;
+
+	// New Items at end to maintain driver compatibility
+	__u32 gfxclk_frequency[8];
 };
 
 /* Reset to default packing */
diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 94c65320bdcd..80c71c6ddeaf 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -20,7 +20,7 @@
 #include <linux/semaphore.h>
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"1.0"
+#define DRIVER_VERSION		"2.0"
 
 /* HSMP Status / Error codes */
 #define HSMP_STATUS_NOT_READY	0x00
@@ -51,6 +51,8 @@
 #define HSMP_DEVNODE_NAME	"hsmp"
 
 struct hsmp_socket {
+	struct bin_attribute hsmp_attr;
+	void __iomem *metric_tbl_addr;
 	struct semaphore hsmp_sem;
 	u16 sock_ind;
 };
@@ -59,6 +61,7 @@ struct hsmp_plat_device {
 	struct miscdevice hsmp_device;
 	struct hsmp_socket *sock;
 	struct device *dev;
+	u32 proto_ver;
 };
 
 static u16 num_sockets;
@@ -331,9 +334,160 @@ static const struct file_operations hsmp_fops = {
 	.compat_ioctl	= hsmp_ioctl,
 };
 
+static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+				    struct bin_attribute *bin_attr, char *buf,
+				    loff_t off, size_t count)
+{
+	struct hsmp_socket *sock = bin_attr->private;
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	if (!count || count > sizeof(struct hsmp_metric_table))
+		return 0;
+
+	msg.msg_id	= HSMP_GET_METRIC_TABLE;
+	msg.sock_ind	= sock->sock_ind;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+	memcpy(buf, sock->metric_tbl_addr, count);
+
+	return count;
+}
+
+static int hsmp_get_tbl_dram_base(u16 sock_ind)
+{
+	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
+	struct hsmp_message msg = { 0 };
+	phys_addr_t dram_addr;
+	int ret;
+
+	msg.sock_ind	= sock_ind;
+	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
+	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/*
+	 * calculate the metric table DRAM address from lower and upper 32 bits
+	 * sent from SMU and ioremap it to virtual address.
+	 */
+	dram_addr = msg.args[0] | ((u64)(msg.args[1]) << 32);
+	if (!dram_addr) {
+		dev_err(plat_dev.dev, "Invalid dram address for metric table\n");
+		return -ENOMEM;
+	}
+	sock->metric_tbl_addr = devm_ioremap(plat_dev.dev, dram_addr,
+					     sizeof(struct hsmp_metric_table));
+	if (!sock->metric_tbl_addr) {
+		dev_err(plat_dev.dev, "Failed to ioremap metric table addr\n");
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+static umode_t hsmp_metric_table_visible(struct kobject *kobj, struct bin_attribute *battr, int id)
+{
+	struct hsmp_socket *sock = battr->private;
+	int ret;
+
+	if (plat_dev.proto_ver == HSMP_PROTO_VER6) {
+		ret = hsmp_get_tbl_dram_base(sock->sock_ind);
+		if (ret)
+			return 0;
+		return battr->attr.mode;
+	} else {
+		return 0;
+	}
+}
+
+#define HSMP_ATTR_NAME_SIZE	25
+#define HSMP_GRP_NAME_SIZE	15
+#define NUM_ATTRS		1
+static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, int sock_ind)
+{
+	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
+	char *name;
+
+	sysfs_attr_init(&plat_dev.sock[sock_ind].hsmp_attr);
+	name = devm_kzalloc(plat_dev.dev, HSMP_ATTR_NAME_SIZE, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+	snprintf(name, HSMP_ATTR_NAME_SIZE, "metrics_bin");
+	hattr->attr.name	= name;
+	hattr->attr.mode	= 0444;
+	hattr->read		= hsmp_metric_tbl_read;
+	hattr->size		= sizeof(struct hsmp_metric_table);
+	hattr->private		= &plat_dev.sock[sock_ind];
+	hattrs[0]		= hattr;
+
+	return 0;
+}
+
+static int hsmp_create_sysfs_file(void)
+{
+	const struct attribute_group **hsmp_attr_grps;
+	struct bin_attribute **hsmp_bin_attrs;
+	struct attribute_group *attr_grp;
+	int ret, i;
+
+	hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group *) *
+				      (num_sockets + 1), GFP_KERNEL);
+	if (!hsmp_attr_grps)
+		return -ENOMEM;
+
+	for (i = 0; i < num_sockets; i++) {
+		attr_grp = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group), GFP_KERNEL);
+		if (!attr_grp)
+			return -ENOMEM;
+
+		attr_grp->name = devm_kzalloc(plat_dev.dev, HSMP_GRP_NAME_SIZE, GFP_KERNEL);
+		if (!attr_grp->name)
+			return -ENOMEM;
+		snprintf((char *)attr_grp->name, HSMP_GRP_NAME_SIZE, "socket%d", i);
+
+		hsmp_bin_attrs = devm_kzalloc(plat_dev.dev, sizeof(struct bin_attribute *) *
+					      (NUM_ATTRS + 1), GFP_KERNEL);
+		if (!hsmp_bin_attrs)
+			return -ENOMEM;
+
+		attr_grp->bin_attrs		= hsmp_bin_attrs;
+		attr_grp->is_bin_visible	= hsmp_metric_table_visible;
+		hsmp_attr_grps[i]		= attr_grp;
+
+		ret = hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, i);
+		if (ret)
+			return ret;
+	}
+	ret = devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int hsmp_cache_proto_ver(void)
+{
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	msg.msg_id	= HSMP_GET_PROTO_VER;
+	msg.sock_ind	= 0;
+	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
+
+	ret = hsmp_send_message(&msg);
+	if (!ret)
+		plat_dev.proto_ver = msg.args[0];
+
+	return ret;
+}
+
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
-	int i;
+	int ret, i;
 
 	plat_dev.sock = devm_kzalloc(&pdev->dev,
 				     (num_sockets * sizeof(struct hsmp_socket)),
@@ -354,7 +508,27 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
 	plat_dev.hsmp_device.mode	= 0644;
 
-	return misc_register(&plat_dev.hsmp_device);
+	ret = misc_register(&plat_dev.hsmp_device);
+	if (ret)
+		return ret;
+
+	ret = hsmp_cache_proto_ver();
+	if (ret) {
+		dev_err(plat_dev.dev, "Failed to read HSMP protocol version\n");
+		goto deregister;
+	}
+
+	ret = hsmp_create_sysfs_file();
+	if (ret) {
+		dev_err(plat_dev.dev, "Failed to create sysfs file\n");
+		goto deregister;
+	}
+
+	return 0;
+
+deregister:
+	misc_deregister(&plat_dev.hsmp_device);
+	return ret;
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
-- 
2.25.1

