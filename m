Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD50C71144
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Aug 2023 12:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376975AbjHRMwI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Aug 2023 08:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376982AbjHRMv5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2023 08:51:57 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E631988
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Aug 2023 05:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=id1TCe+o0ArBFqjbOCE0s8LLR6lYJuzo2d3Bv/iLPYHXI9azB+E1wEtQYndaiyx59eGpxqRopPsJ9dQzGQ3LOlzlNulf7AmXVm27LoQrpUIyrKpe0l0Xt4tgbh0WRSh1gKY41zrfoN71J4lXtxgaSUOGUYOsCulsWP8XXc5/18A/+nRSZzPMku4pChtrqo3S9ASuAf1iRF/CO1mKN8Ow4XFJ76wJbErP8aTCBHNaPam6D28/eZOyBw5PnBxhhNtFCqilroFxw7XBdEcDSthwTWYrXh2ea5X3uDLG1xKjV8ayIRltBNBSdDSJevdpM6YQRx0akvTENME4OZfiac1QpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXpCqT5LUkPaMq4PRzDnSMfT1AWNHw1q6ToETN34hdM=;
 b=kBXrvsWONQ0c6ohUD9+oT82zF5bGDvPIM8D+tb6SRtDw+hNJ6Nvbw1CukV2o9I7f5WjGSelHTeeXZTdpA4uJs0HdCetzpQ+rS3ajeGaGDjBp7WxK2SyYjFdC+/te/k9VHMcSmPyS0OluaOe5z5bzxVaUzdxvMUpiaIWcgjhfbyUm0AzARhn0PcrpxJl/N5IAjG/AR6d8GS9ah0AQU1ctuTjcnxHQkece/aDDkrGphMacyOACthV2WUdgSrOhG2cU6z2bT56mh9Gj1efjz8B3GgL5oAFzzPqYEWq9VkgVc/7QdMngfa+uUWtwLwtFKwUoj8TAX/w0rchtUZYz8SxfVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXpCqT5LUkPaMq4PRzDnSMfT1AWNHw1q6ToETN34hdM=;
 b=SJUckihtFhoXA2brkPogiTRjOhFajBku7lEsiAIoGHrwiehrQDpZgXKv5ZQhR0kD6frgZiV0uty0AJPjxdL9jokL2OXUQJcXMF+KAnmQpvZGy+V5Vfm+t+aot4DmsD9mi3Vu0DRLpFT0Bk1+bU9DFGfh4aRk6VHTYKlWQ/7vahY=
Received: from SN6PR05CA0012.namprd05.prod.outlook.com (2603:10b6:805:de::25)
 by CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 12:51:52 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:805:de:cafe::df) by SN6PR05CA0012.outlook.office365.com
 (2603:10b6:805:de::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.15 via Frontend
 Transport; Fri, 18 Aug 2023 12:51:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 18 Aug 2023 12:51:52 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 07:51:49 -0500
From:   Suma Hegde <Suma.Hegde@amd.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 2/4] platform/x86/amd/hsmp: add support for metrics tbl
Date:   Fri, 18 Aug 2023 12:51:18 +0000
Message-ID: <20230818125119.1323499-3-Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230818125119.1323499-1-Suma.Hegde@amd.com>
References: <20230818125119.1323499-1-Suma.Hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|CY5PR12MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 84aebebb-79f8-4cfe-c39d-08db9fe9e504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AuZ7rYLg9/YjSVeetOyhAhuO+247KIwIOlFZWgImyHYN1DH5Bc63MuXJmqYTSAN7D9/z1osuKFJJpeJHVnhcxgDYFOEIKCxY6As2IUHuaqrxccM81lBu+te6bl5vY/jqekUDKTOMZ29BzgDXocKEUTDHE0dO+Vus4Y0hIWOHrPljuQh8ColumgZs/XUo2oE+cQpwYe/21JBNgeXO6T45jUYyxHETAVkk3Egc3CbZ9qUGw8Ps1U0kqcsyLiVzFN03WbBDuDRXuci6S2qsOgSFjPnUtdCAHkenjpuKzVAu6Sy3M/PL4TRUR5Y/YQlSFrNYf6H/vuSHjUefwgd3o7hcIIE8//xulLiKlLx8tyRHVlfqe1rxIK89ePChf8kuAz+NWAyO4BV+CBXybTP2CY3UzKgCmoHldAOTLKd8L6dGkrPl7oia7JwPRnI3VKlclyKPjOyCAVW9hs4wsjH10nZ77WQShNxyRm3eYy3otXakkHrvsq7x2ubXE0jYajfnsyS4lMrOgiN9UectA8LJ88wdBwD8MiX8SkcUzUYXu74O7FUE0WkBRrp7hqgjoZ0e8TBO7NwvMe/5n4cpqpc8CDy+S2dlAxKRR/imOsLl9/Kq9ONJKw6MO7WoyKrZGyL+rwGgGOXn/yRMejA2P0fHlxH2MKaeKh+bKeJ25BO1IMiwAm6pATCyEnZAfmMKfvQq2B1OauYjAr2TApEx3SOgCVFMbTpCHtEn9VTabpAdzLGJ4XNhY4k4DsbTCiCzzS0W8Jy25g6+QIdV0uFUiBcI3vC76Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(356005)(40460700003)(316002)(2616005)(36860700001)(426003)(1076003)(336012)(16526019)(6666004)(26005)(7696005)(47076005)(83380400001)(4326008)(5660300002)(8936002)(8676002)(2906002)(478600001)(41300700001)(70586007)(6916009)(54906003)(70206006)(82740400003)(36756003)(40480700001)(86362001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 12:51:52.0923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84aebebb-79f8-4cfe-c39d-08db9fe9e504
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6429
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Suma Hegde <suma.hegde@amd.com>

AMD MI300 MCM provides GET_METRICS_TABLE message with which
all the system management information from SMU can be retrieved in just
one message.

The metrics table is available as hexadecimal sysfs binary file in
/sys/devices/platform/amd_hsmp/socket%d_metrics_bin 
Metrics table definitions will be documented as part of PPR which
available in public domain. The same is defined in the amd_hsmp.h header
file as well.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 arch/x86/include/uapi/asm/amd_hsmp.h | 109 +++++++++++++++++++
 drivers/platform/x86/amd/hsmp.c      | 155 ++++++++++++++++++++++++++-
 2 files changed, 259 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 769b939444ae..832701b41c7d 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -47,6 +47,9 @@ enum hsmp_message_ids {
 	HSMP_SET_PCI_RATE,		/* 20h Control link rate on PCIe devices */
 	HSMP_SET_POWER_MODE,		/* 21h Select power efficiency profile policy */
 	HSMP_SET_PSTATE_MAX_MIN,	/* 22h Set the max and min DF P-State  */
+	HSMP_GET_METRIC_TABLE_VER,	/* 23h Get metrics table version  */
+	HSMP_GET_METRIC_TABLE,		/* 24h Get metrics table  */
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
index 699c22f7cd42..cab59750cde2 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -20,7 +20,7 @@
 #include <linux/semaphore.h>
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"1.0"
+#define DRIVER_VERSION		"2.0"
 
 /* HSMP Status / Error codes */
 #define HSMP_STATUS_NOT_READY	0x00
@@ -47,7 +47,12 @@
 #define HSMP_INDEX_REG		0xc4
 #define HSMP_DATA_REG		0xc8
 
+#define HSMP_CDEV_NAME		"hsmp_cdev"
+#define HSMP_DEVNODE_NAME	"hsmp"
+
 struct hsmp_socket {
+	struct bin_attribute hsmp_attr;
+	void __iomem *metric_tbl_addr;
 	struct semaphore hsmp_sem;
 	u16 sock_ind;
 };
@@ -56,6 +61,7 @@ struct hsmp_plat_device {
 	struct miscdevice hsmp_device;
 	struct hsmp_socket *sock;
 	struct device *dev;
+	u32 proto_ver;
 };
 
 static u16 num_sockets;
@@ -328,9 +334,122 @@ static const struct file_operations hsmp_fops = {
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
+	if (count == 0 || count > sizeof(struct hsmp_metric_table))
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
+#define HSMP_ATRR_NAME_SIZE 25
+static int hsmp_create_metric_tbl_sysfs_file(int sock_ind)
+{
+	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
+	char *name;
+
+	sysfs_attr_init(&plat_dev.sock[sock_ind].hsmp_attr);
+	name = devm_kzalloc(plat_dev.dev, HSMP_ATRR_NAME_SIZE, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+	sprintf(name, "socket%d_metrics_bin", sock_ind);
+	hattr->attr.name	= name;
+	hattr->attr.mode	= 0444;
+	hattr->read		= hsmp_metric_tbl_read;
+	hattr->size		= sizeof(struct hsmp_metric_table);
+	hattr->private		= &plat_dev.sock[sock_ind];
+
+	return device_create_bin_file(plat_dev.dev, hattr);
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
+	if (!dram_addr)
+		return -ENOMEM;
+	sock->metric_tbl_addr = devm_ioremap(plat_dev.dev, dram_addr,
+					     sizeof(struct hsmp_metric_table));
+	if (!sock->metric_tbl_addr) {
+		dev_err(plat_dev.dev, "Unable to ioremap metric table addr\n");
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+static int hsmp_create_sysfs_file(void)
+{
+	int ret, i;
+
+	for (i = 0; i < num_sockets; i++) {
+		ret = hsmp_get_tbl_dram_base(i);
+		if (ret)
+			goto cleanup;
+
+		ret = hsmp_create_metric_tbl_sysfs_file(i);
+		if (ret) {
+			dev_err(plat_dev.dev, "Unable to create sysfs file for metric table\n");
+			goto cleanup;
+		}
+	}
+
+	return 0;
+
+cleanup:
+	while (i > 0)
+		device_remove_bin_file(plat_dev.dev, &plat_dev.sock[--i].hsmp_attr);
+	return ret;
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
@@ -344,18 +463,44 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		plat_dev.sock[i].sock_ind = i;
 	}
 
-	plat_dev.hsmp_device.name	= "hsmp_cdev";
+	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
 	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
 	plat_dev.hsmp_device.fops	= &hsmp_fops;
 	plat_dev.hsmp_device.parent	= &pdev->dev;
-	plat_dev.hsmp_device.nodename	= "hsmp";
+	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
 	plat_dev.hsmp_device.mode	= 0644;
 
-	return misc_register(&plat_dev.hsmp_device);
+	ret = misc_register(&plat_dev.hsmp_device);
+	if (ret)
+		return ret;
+
+	ret = hsmp_cache_proto_ver();
+	if (ret) {
+		dev_err(plat_dev.dev, "Failed to read HSMP protocol version\n");
+		goto cleanup;
+	}
+
+	/* metrics table is supported only from proto ver6 EPYCs */
+	if (plat_dev.proto_ver >= HSMP_PROTO_VER6) {
+		ret = hsmp_create_sysfs_file();
+		if (ret)
+			goto cleanup;
+	}
+	return 0;
+
+cleanup:
+	misc_deregister(&plat_dev.hsmp_device);
+	return ret;
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
+	int i;
+
+	if (plat_dev.proto_ver >= HSMP_PROTO_VER6) {
+		for (i = 0; i < num_sockets; i++)
+			device_remove_bin_file(plat_dev.dev, &plat_dev.sock[i].hsmp_attr);
+	}
 	misc_deregister(&plat_dev.hsmp_device);
 }
 
-- 
2.25.1

