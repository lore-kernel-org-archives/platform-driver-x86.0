Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED452CD54A9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Sep 2023 09:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjISJVx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Sep 2023 05:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjISJVv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2023 05:21:51 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F5DDA
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Sep 2023 02:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxmKsC4VkwZQ6WufQKRBIGRo5m/RuIk+0OIiR3OPw+cdLxgGWVc2aFIc1tQ6XGxp2lOLmKfdopNuNhHWpETac+erqYwrpkDD9Apphh+l/JLQY0cbLsLUI0EEQPpqyeekHxWRcHJfC/YkefRNitchUEmPpEHRYL31QriP8U18gdyxmA99BbZan/wQMspYz1Qop2PrvqfAsPQD93gFL7Vgb9FG4LMERK0cwFDL8PshXucEomMFWZu+hEs3OAqzT4VdQMcSEitEt4Fn+OUsvF9BAHmK51JZ+euhtiuIEq4MApJkv2L33+LgoN9xIfjE/0htxd9zaN8ylupXTLmjhBujbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G89uNKH1NXMHr6HOnGWqWfTh0U6RgnrDSH4KyPT+f3U=;
 b=iKchI/l414BIQkCz89AEYe0fWniiQeWUpKqsHC3WrWgtfaCe7Vlm7K2REUauzt576pHmkbYSFbVbm28c4It4pfNos0qLv0nc8w+vCa8KAqaZi7lVaR9ceuozXlFP8HlRTkWAnBejoTvkUVtE0RhTmHA81kZ38cpsLd+I9xgRCO7oIm7nZZSzb0HETubgQbFgVeJVmR2wcs1wQrpLMd4/EDCdB0N9m7wnUmedEc9sewcFsGDS3GwvFFTfCHJ68o+f1tK8tAhojTYsBN/KNUIQegxSjmZA/btijs+1DCm0cXMNaw93RbR4BYMpiOHAG7lmVD6y8c+U2KpmIytDSfMUWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G89uNKH1NXMHr6HOnGWqWfTh0U6RgnrDSH4KyPT+f3U=;
 b=r98SUUPyP033zt34SkogCdSE9VmLKH+RNJVieMnmi5xHnbdK76ziQ4cphfMhmyU2HTE0kHQ8XKgjO6tqXkLdHj3jR7gLi073FWvWT78hKb3rrActSMUG1RvHJY0GInqXvGDt93rO2alvTWvaQAMEEZ55MZJcAfhj4u/QxW4OUdY=
Received: from MW4PR04CA0148.namprd04.prod.outlook.com (2603:10b6:303:84::33)
 by CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Tue, 19 Sep
 2023 09:21:37 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:84:cafe::44) by MW4PR04CA0148.outlook.office365.com
 (2603:10b6:303:84::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27 via Frontend
 Transport; Tue, 19 Sep 2023 09:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.0 via Frontend Transport; Tue, 19 Sep 2023 09:21:36 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 04:21:22 -0500
From:   Suma Hegde <suma.hegde@amd.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3 2/3] platform/x86/amd/hsmp: add support for metrics tbl
Date:   Tue, 19 Sep 2023 09:20:56 +0000
Message-ID: <20230919092057.2235437-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230919092057.2235437-1-suma.hegde@amd.com>
References: <20230919092057.2235437-1-suma.hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|CY8PR12MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f99c646-ee44-45a7-a093-08dbb8f1d306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aWwllw6ItY8po56/Dlzlx7SDVvpnJ30fSIrlSkSn+ZN/a2lD+JZkO5Juja8h1K91TkvuLXd+qap4gfdAsYQ+rl18fkZ59TTLAMF/29gOTNMgVsPNeya2qO8UxxGVXQTmTjV/EPE8tmiWZM+QIopXk/VlnLbLa42gVSrNGnjBiN2hMvgWz0i7M93DvC/ELAJ5HNoEIWLUApfDpy2T707P9y+xynDuCElzkTYztBk0QuILmbqCZImBxecqLa6rgb6D6AVGdOmYkZR4lKXhCmD8esLIMGZoVZ+TrgYF6FzA49RP+YaaUmzhpW5G5W2jiE53GbH6AE4OEs4+5tp4lKJ/myhDjjVp75wsAJvTGRhpIyZxKgLEpCcCPccpzfFEP4SxJSgOgM+/HMkbiav1ID82LduuBJfiqQMBJeg8ZOukkg7pivi7x86QXSyApZFl/6MmTQPMUayKBxypIqMijwW1XWgtgM2iruLiUP8xmP35+bq3IZi/lcpytetE7EJNtZ6p0Rj1Q8egUtFKp+C6huVANCMF1vp/rQAOJYt2b6vQlsupwW0245bDRYhBIOzsUnEOFuWRbF48u6B3DYZpkKXVOjpRr9Kpy9wkbcFIjFG6akHTkoSAR1uTUnal8kn0PNztM9/jQms7b5F5FqgL2iQg5PGrtdtxDLsyL6Oan9f3GCu5tRyEEeLEN7Ys5iS7ZRxvqfIOWqc+eO4e+GTGT4PPeZVsxPGIrPgpAlb9quR76GF2XHxQTUHKM+JXSussbEnLwV2pkrlCPOXC+kbGe43uZg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(82310400011)(186009)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(54906003)(8676002)(478600001)(8936002)(47076005)(2616005)(44832011)(316002)(6666004)(426003)(4326008)(40480700001)(70586007)(41300700001)(70206006)(6916009)(1076003)(7696005)(83380400001)(26005)(336012)(16526019)(2906002)(86362001)(30864003)(36756003)(36860700001)(5660300002)(81166007)(82740400003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 09:21:36.8706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f99c646-ee44-45a7-a093-08dbb8f1d306
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

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
Changes since v2:
1. squash documentation patch into this patch
2. change from num_sockets to plat_dev.num_sockets

 Documentation/arch/x86/amd_hsmp.rst  |  16 +++
 arch/x86/include/uapi/asm/amd_hsmp.h | 109 ++++++++++++++++
 drivers/platform/x86/amd/hsmp.c      | 180 ++++++++++++++++++++++++++-
 3 files changed, 302 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 440e4b645a1c..a4c308784818 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -41,6 +41,22 @@ In-kernel integration:
  * Locking across callers is taken care by the driver.
 
 
+HSMP sysfs interface
+====================
+
+1. Metrics table binary sysfs
+
+AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
+all the system management information from SMU.
+
+The metrics table is made available as hexadecimal sysfs binary file
+under per socket sysfs directory created at
+/sys/devices/platform/amd_hsmp/socket%d/metrics_bin
+
+Metrics table definitions will be documented as part of Public PPR.
+The same is defined in the amd_hsmp.h header.
+
+
 An example
 ==========
 
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
index 99727cd705cf..fc6fba18844e 100644
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
 	u16 num_sockets;
 };
 
@@ -330,9 +333,160 @@ static const struct file_operations hsmp_fops = {
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
+				      (plat_dev.num_sockets + 1), GFP_KERNEL);
+	if (!hsmp_attr_grps)
+		return -ENOMEM;
+
+	for (i = 0; i < plat_dev.num_sockets; i++) {
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
 				     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
@@ -353,7 +507,27 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
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

