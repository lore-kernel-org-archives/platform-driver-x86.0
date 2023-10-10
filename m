Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A73ACD80BB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 12:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjJJMEL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 08:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbjJJMD6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 08:03:58 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908391B1
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 05:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXKVXEgu6jkK9q9ZLuZEFCqow+X1JykOptOiVIqjOuWfxtUV81GjO0y/Sexv7Z/glrUQpTNwxk1tio0JtcemmbGSQfR7DR5l2OPVNX+bB2UXMQmY4eR5vKkX2TyfAcAqcM6XftCLuGJl5h0ocHmpRXGen0e6OX8xPAdZlyFSl9yCD4qBu0Midl6pP2lXFZO2T2XasOvZ0jTtIKdoSceUNbLVUA3bJjOuGfXP9PMPJJCwZMnpfIA5eiuFoG6Yf54kMCqSoECa6RbPhlL7VgJYkrFbpVY9XDYOfCMDyPycd8zlUfDjT2mYvVK2FJyde9PCCKRM7MVCKhwO17rug1W6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLrmeBpyu8DCw8fIZPFpdom8c5Lmrb2j64ap4DwJDH8=;
 b=BZAIZFCozr2ti9y5xro0zvlMdt9DCcv8oqSb0RnItEKRcKrbAIDYZ6Nxflc0w9vgC7s7CR/GF+8p+amiHtxvkYpcaIhcmnUiyRjpl/o5GfMrhd+TaIcS9sw2JETC7eUoN6AlSGZmsTTf4ZlRed5ag0KTkvhhdS7aC5rjkjWbwBlEIAgI9oIPc+j+QlLC9X06WJ8dt8JzH31JWmTlYMWQOuRIXaPD+nfgQ3bP6H1f58EOQ0DljK2mMU1pqgihzzyGAlDGq/zGrgE+GJEuwM1pXKUqSa4kLB9l0mAzUlkiwB1nzZG9Li/zwiS/S130kgYOCaqTyfZ2HSN2aYXgNbexow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLrmeBpyu8DCw8fIZPFpdom8c5Lmrb2j64ap4DwJDH8=;
 b=xGj5X+Lr2mfv4ILa8aJt0ajIWrIEtip3PPSOWaji3e+qhPbdOb5BVyHeG93ulNxIxvTe/AsGBzE05WTIL+V0iqL6+wDweE6mk8Mic4eyrcj1+sHao17MyLhvte3C8ak2uOFmwWf17AU//QH7zCnMugLRyyqEqVvuNCnSeZ7iToM=
Received: from BLAPR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:36e::27)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Tue, 10 Oct
 2023 12:03:37 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:36e:cafe::94) by BLAPR05CA0022.outlook.office365.com
 (2603:10b6:208:36e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.23 via Frontend
 Transport; Tue, 10 Oct 2023 12:03:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 12:03:37 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 07:03:35 -0500
From:   Suma Hegde <suma.hegde@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 2/3] platform/x86/amd/hsmp: add support for metrics tbl
Date:   Tue, 10 Oct 2023 12:03:09 +0000
Message-ID: <20231010120310.3464066-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010120310.3464066-1-suma.hegde@amd.com>
References: <20231010120310.3464066-1-suma.hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b300d5-43cf-46d3-0570-08dbc988ef90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sBrsmLXAOHQFu3ean2xkQzX8qK6jTtduCeveGP3cmS3IYsy91uUQ+rJLI0JmckVs9oU5M6fqa9PwRNPaCi3whXb8B5V1KMGDa92sJpDuMJA0b1IMsPmiBOALIcBMHCagQajrzASKA8iHk5zMQiIBi5oFbl6Hilo91HLW+w7rgWtF089UIu07Eiv5Z+jZJ6IjtCu3RgJDCoNmvbG7/DQZUYVjQs7dX6CooiVKhRpHWjz/MGrqxHDHbxbQ1ulzyyWkrrkg/rjNYvqGIapskjtkdMHlEWQtad2TU2jmWHNm4QJ106Etpj1NDoxUJuMUvQtaPdgSdIWzptHHLM5zKCPbCS8hVQDR+HcrTW2zk/JdO+9EHf3Pus/Nr6vXiYRyjgEz4j+PL2I8Z5GzchwRGEQx4foCzqB1s5htb5uMTFjXtY7DObqaM7t5D9cjwmnxSa8U9+nbSOpyOn3MnU4LoVVdVyNI1RcKnu5+xYu97ulGjMd9qHDzuppSPF+rzC/Utlhx21Rsr5gRSvdafQMeGzZO/lU7CYbj9yWGq2CdAvT8zEBNqTgV1fjJoWWcytTyaqW5lAfKlYFN5rbKvHioRsijgNhQ4Ex2LUloJ4uN7jvHuV8dg6Mdgl/4+wcyg7h9i6e5nyEdAAatP8hO8J1BJjuP1u7mttU6E9dXM8i+/ZZBzPNs8dIwEu2uEHGLzsfgpgb11Qp1mOq2twCrKCgDpqCsdGW2MjRGvLEiZ+bL4TpSZ5BSzRCt7I0r5viKyXOGOvbCbQFnU5jF04VP9o3h00ISHw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(36756003)(81166007)(356005)(86362001)(40460700003)(40480700001)(478600001)(82740400003)(30864003)(2906002)(41300700001)(5660300002)(7696005)(4326008)(44832011)(6666004)(8676002)(8936002)(83380400001)(336012)(1076003)(2616005)(426003)(36860700001)(54906003)(70206006)(70586007)(316002)(26005)(47076005)(16526019)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 12:03:37.4516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b300d5-43cf-46d3-0570-08dbc988ef90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173
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

Changes since v4:
1. add WARN_ON in hsmp_create_sysfs_interface()
2. change i to u16 type and typecast it in snprintf

 Documentation/arch/x86/amd_hsmp.rst  |  18 +++
 arch/x86/include/uapi/asm/amd_hsmp.h | 109 +++++++++++++++++
 drivers/platform/x86/amd/hsmp.c      | 174 ++++++++++++++++++++++++++-
 3 files changed, 299 insertions(+), 2 deletions(-)

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
index 99727cd705cf..c620967a5162 100644
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
 
@@ -330,9 +337,162 @@ static const struct file_operations hsmp_fops = {
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
+	u16 i;
+
+	/* String formatting is currently limited to u8 sockets */
+	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
+		return -ERANGE;
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
+		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
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
@@ -353,6 +513,16 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
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
2.39.3

