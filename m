Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA062E92707
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 14:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235146AbjJEOiO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235424AbjJEOfh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 10:35:37 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::60a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E879559D
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 22:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWM8AFPifHBTaJL+f3/+rNTxwZ+TAdPqaCziQ6VvT61eGfBv+75zZSN9w9fSzrvEpTTsG/bWSqL2qAI23kLKjSax5rhrjPEam3bdPXJclHbwsmIZFHcTDbqd24VHrgBhmkXu59Q/GIzRznizY181G3tmNlGjSzTpclqI0+pxay/AQxEvR2gNGgtVAJcfmRBptZQ/8taFmw+xOHVvkcOY2kWVLmMVeNApnogxCYrX/Tp6udtxybA2Wyfdd7yuR7oY2FlpsI6KFuH/g5fvVhjKOddODpHu04G7BSwXpHqlBQhXmwuyqBmDz8wfvWZGVNeMZmW8jADn5HxucChgJIa+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKmqP9LZYrAMA1cqgqmMrhNf7FSaSm/J8YEgO88WILo=;
 b=Gt3AdB43OZYZgeAAclkRYyW2qVQqVGpqsiKM0XDdZxrk3tu4S0Kke/2yz+ipNR/C1Ng0Hq/Exs0ZU+Oj/nNs1znaqvELruUoTjsafEJAqTy8dEOjglKPscD0o3eNwISutc9kgA0+Z/R3aY+KexhEsfz+Li12cvIzDL0eUdXe0+bJNv+MUle8rJxLE+f16nWZhcA0uA8xmtfY7IN3pSztBcywKJc0Gr22178KNw7+sB2lAOafd8EFb6jbiHFVmcu/JL6VDPn5l2uOfS7vywiQjOEovoz4GQuuHOlI8kxboI2I3VJ4mpRI3gOGKIAh7UsIUBxe80IVdVOY/R7/MMX1IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKmqP9LZYrAMA1cqgqmMrhNf7FSaSm/J8YEgO88WILo=;
 b=gtJgkGLByja3mf5i+d09wV8gcvpT7MBu6UKwxhDWOR7SEMVcICGWsXLHOQCDcQEtNCBLG93w8ZWq1JscH1f46wCZkO8HHIaXnVa/EgRWgmZR2BK+20rKCeors4kfdJCIb1z9j4AIVPeUZQpZ7zgzlwT/blPMB6LZJzaL7NHtSrs=
Received: from MW4PR04CA0120.namprd04.prod.outlook.com (2603:10b6:303:83::35)
 by IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 05:40:00 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:83:cafe::cc) by MW4PR04CA0120.outlook.office365.com
 (2603:10b6:303:83::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34 via Frontend
 Transport; Thu, 5 Oct 2023 05:40:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6863.21 via Frontend Transport; Thu, 5 Oct 2023 05:40:00 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 00:39:57 -0500
From:   Suma Hegde <suma.hegde@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 2/3] platform/x86/amd/hsmp: add support for metrics tbl
Date:   Thu, 5 Oct 2023 05:39:31 +0000
Message-ID: <20231005053932.149497-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231005053932.149497-1-suma.hegde@amd.com>
References: <20231005053932.149497-1-suma.hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|IA1PR12MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e07060c-58d3-48b0-953e-08dbc5658422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tquvt/SXAqFMYPK6Osuqj3YdyBP2+O6ds+3JhtIA3Eowjqm5uRxAEbwtcGOPWyn8O1prametldeHgleab+VlEnsb+8J7TaQZ9OI6h6zIaowqs9pczNWIA1vOI6BcWle7jqas0m13i37RvkN/SzhUm8c+jj2Tn7mUrOrFxG9L2au61XAcwQnhUzLZ7eXVGeg5NmN1iMZ7wbLWZ+hGx2aAEIefRHbAbVbSeX00Pg6032+z0+rQX6wXKPs8ojgruUq0shEOdzcKO6OzXlUI4sayTueu0rBt1VUzCeUqoM31LDkuw67J9DsfhCPI+rnDuuJ5V3LDqvZn3EMyaE/lpIZHwP0AiLB0z6zF5Z68Cwc/8BInjXgweyRZWOJxR8n8TalLpTWlgduLBsI6ju1YjnzSR4TcHLe8EHuyxQAFlTikk/JdVxB7JGOuZBhoBPajgvY+YO1EPZh8dYzO3s1T9hfvxiKRaG4U7TWgS7YeGVaW9lyboXYqVwSXxb526WruFMFM04XSijAfuWSIzJdmysINF/tI5J1PI+V2cQA9uyH6VKGlxAycahpu4kG+XMZ0SOuiotG5AAX8H5H3gnsOR5Y2ebPP19TxOuGvY7pHDsbU+lYMjvB5doJjcZs+FKfasTHAJ72AjpGtpoGiXj0by66uvw/TNu2q48HEBn4FvoAeUNC0zr1vgr93wNzsLigueEEonkoDQF6N6Ha8eqCnUt4IGnr0Uu+nmih/9v6OdEOUcmErTHAK+9cXaNTUoZmWhhuxaFvOlkgtozFAK8KkyjP69w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(70206006)(70586007)(478600001)(6916009)(54906003)(41300700001)(2906002)(316002)(86362001)(5660300002)(4326008)(16526019)(1076003)(26005)(36860700001)(30864003)(82740400003)(36756003)(83380400001)(44832011)(47076005)(356005)(81166007)(8936002)(2616005)(6666004)(7696005)(426003)(8676002)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 05:40:00.0566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e07060c-58d3-48b0-953e-08dbc5658422
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6532
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

Changes since v3:
1. sysfs_attr_init() to sysfs_bin_attr_init(), errors reported by
   allyesconfig build
2. "C++" style comments in amd_hsmp.h to C style comments, fix errors
   reported by W=1
3. "i" data type to u8 in hsmp_create_sysfs_file(), fix errors reported
   by W=1 
4. remove devm_kzalloc for attr_grp->name in hsmp_create_sysfs_file()
5. rename HSMP_GRP_NAME_SIZE to HSMP_ATTR_GRP_NAME_SIZE and define value
   to 10
6. move hsmp_get_tbl_dram_base() call to hsmp_init_metric_tbl_bin_attr()
7. hsmp_metric_table_visible to hsmp_is_sock_attr_visible
8. use condition check "if (count < bin_attr->size)"
   in hsmp_metric_tbl_read
9. Reorder misc_register and hsmp_cache_proto_ver calls
10. remove devm_kzalloc in hsmp_init_metric_tbl_bin_attr()
11. Wordings in documentation and header and add some more comments in
    the code


 Documentation/arch/x86/amd_hsmp.rst  |  18 +++
 arch/x86/include/uapi/asm/amd_hsmp.h | 109 +++++++++++++++++
 drivers/platform/x86/amd/hsmp.c      | 170 ++++++++++++++++++++++++++-
 3 files changed, 295 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 440e4b645a1c..72083124b9ca 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -41,6 +41,24 @@ In-kernel integration:
  * Locking across callers is taken care by the driver.
 
 
+HSMP sysfs interface
+====================
+
+1. Metrics table binary sysfs
+
+AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
+most of the system management information from SMU in one go.
+
+The metrics table is made available as hexadecimal sysfs binary file
+under per socket sysfs directory created at
+/sys/devices/platform/amd_hsmp/socket%d/metrics_bin
+
+Note: lseek is not supported as entire metrics table is read
+
+Metrics table definitions will be documented as part of Public PPR.
+The same is defined in the amd_hsmp.h header.
+
+
 An example
 ==========
 
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 769b939444ae..fce22686c834 100644
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
+/* Metrics table (supported only with proto version 6) */
+struct hsmp_metric_table {
+	__u32 accumulation_counter;
+
+	/* TEMPERATURE */
+	__u32 max_socket_temperature;
+	__u32 max_vr_temperature;
+	__u32 max_hbm_temperature;
+	__u64 max_socket_temperature_acc;
+	__u64 max_vr_temperature_acc;
+	__u64 max_hbm_temperature_acc;
+
+	/* POWER */
+	__u32 socket_power_limit;
+	__u32 max_socket_power_limit;
+	__u32 socket_power;
+
+	/* ENERGY */
+	__u64 timestamp;
+	__u64 socket_energy_acc;
+	__u64 ccd_energy_acc;
+	__u64 xcd_energy_acc;
+	__u64 aid_energy_acc;
+	__u64 hbm_energy_acc;
+
+	/* FREQUENCY */
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
+	/* FREQUENCY RANGE */
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
+	/* XGMI */
+	__u32 xgmi_width;
+	__u32 xgmi_bitrate;
+	__u64 xgmi_read_bandwidth_acc[8];
+	__u64 xgmi_write_bandwidth_acc[8];
+
+	/* ACTIVITY */
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
+	/* THROTTLERS */
+	__u32 prochot_residency_acc;
+	__u32 ppt_residency_acc;
+	__u32 socket_thm_residency_acc;
+	__u32 vr_thm_residency_acc;
+	__u32 hbm_thm_residency_acc;
+	__u32 spare;
+
+	/* New items at the end to maintain driver compatibility */
+	__u32 gfxclk_frequency[8];
 };
 
 /* Reset to default packing */
diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 99727cd705cf..5d8efff201d3 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -20,7 +20,7 @@
 #include <linux/semaphore.h>
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"1.0"
+#define DRIVER_VERSION		"2.0"
 
 /* HSMP Status / Error codes */
 #define HSMP_STATUS_NOT_READY	0x00
@@ -49,9 +49,15 @@
 
 #define HSMP_CDEV_NAME		"hsmp_cdev"
 #define HSMP_DEVNODE_NAME	"hsmp"
+#define HSMP_METRICS_TABLE_NAME	"metrics_bin"
+
+#define HSMP_ATTR_GRP_NAME_SIZE	10
 
 struct hsmp_socket {
+	struct bin_attribute hsmp_attr;
+	void __iomem *metric_tbl_addr;
 	struct semaphore hsmp_sem;
+	char name[HSMP_ATTR_GRP_NAME_SIZE];
 	u16 sock_ind;
 };
 
@@ -59,6 +65,7 @@ struct hsmp_plat_device {
 	struct miscdevice hsmp_device;
 	struct hsmp_socket *sock;
 	struct device *dev;
+	u32 proto_ver;
 	u16 num_sockets;
 };
 
@@ -330,9 +337,158 @@ static const struct file_operations hsmp_fops = {
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
+	/* Do not support lseek, reads entire metric table */
+	if (count < bin_attr->size) {
+		dev_err(plat_dev.dev, "Wrong buffer size\n");
+		return -EINVAL;
+	}
+
+	if (!sock) {
+		dev_err(plat_dev.dev, "Failed to read attribute private data\n");
+		return -EINVAL;
+	}
+
+	msg.msg_id	= HSMP_GET_METRIC_TABLE;
+	msg.sock_ind	= sock->sock_ind;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+	memcpy(buf, sock->metric_tbl_addr, bin_attr->size);
+
+	return bin_attr->size;
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
+static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+					 struct bin_attribute *battr, int id)
+{
+	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
+	else
+		return 0;
+}
+
+static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
+{
+	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
+
+	sysfs_bin_attr_init(hattr);
+	hattr->attr.name	= HSMP_METRICS_TABLE_NAME;
+	hattr->attr.mode	= 0444;
+	hattr->read		= hsmp_metric_tbl_read;
+	hattr->size		= sizeof(struct hsmp_metric_table);
+	hattr->private		= &plat_dev.sock[sock_ind];
+	hattrs[0]		= hattr;
+
+	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
+		return (hsmp_get_tbl_dram_base(sock_ind));
+	else
+		return 0;
+}
+
+/* One bin sysfs for metrics table*/
+#define NUM_HSMP_ATTRS		1
+
+static int hsmp_create_sysfs_interface(void)
+{
+	const struct attribute_group **hsmp_attr_grps;
+	struct bin_attribute **hsmp_bin_attrs;
+	struct attribute_group *attr_grp;
+	int ret;
+	u8 i;
+
+	hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group *) *
+				      (plat_dev.num_sockets + 1), GFP_KERNEL);
+	if (!hsmp_attr_grps)
+		return -ENOMEM;
+
+	/* Create a sysfs directory for each socket */
+	for (i = 0; i < plat_dev.num_sockets; i++) {
+		attr_grp = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group), GFP_KERNEL);
+		if (!attr_grp)
+			return -ENOMEM;
+
+		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", i);
+		attr_grp->name = plat_dev.sock[i].name;
+
+		/* Null terminated list of attributes */
+		hsmp_bin_attrs = devm_kzalloc(plat_dev.dev, sizeof(struct bin_attribute *) *
+					      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
+		if (!hsmp_bin_attrs)
+			return -ENOMEM;
+
+		attr_grp->bin_attrs		= hsmp_bin_attrs;
+		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
+		hsmp_attr_grps[i]		= attr_grp;
+
+		/* Now create the leaf nodes */
+		ret = hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, i);
+		if (ret)
+			return ret;
+	}
+	return devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
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
@@ -353,6 +509,16 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
 	plat_dev.hsmp_device.mode	= 0644;
 
+	ret = hsmp_cache_proto_ver();
+	if (ret) {
+		dev_err(plat_dev.dev, "Failed to read HSMP protocol version\n");
+		return ret;
+	}
+
+	ret = hsmp_create_sysfs_interface();
+	if (ret)
+		dev_err(plat_dev.dev, "Failed to create HSMP sysfs interface\n");
+
 	return misc_register(&plat_dev.hsmp_device);
 }
 
-- 
2.25.1

