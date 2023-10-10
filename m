Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2903CD8C99
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 14:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbjJJOuz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 10:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233242AbjJJOuv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 10:50:51 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6CC107
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 07:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEWnyXWef3LtgDYw0dUhcO9Dc8uEEMaH4Pgp0w60t8cDPSdv3J708/b4iNs+vbHfNiHWJtXa815Z/xGDOtyrotX0i6jQ2rE/7/N2ouXV0rV41mYqQ9CvXvEYVTjpBTxo57kgGLLLnH2bXyR7nViXZpi3aMyaALarg36eZzu5SQjJGqXmTDwPhQVrYwYG++bzO3IweiB4zao0g2x8gkbhWj0ZU+cfVJZZmjSLCixwhIcZboNrVQfsmCospCYtDpMbjDYtigYxR/qYs3/QvgY+ujLXqsvtXgk5KTW46QiX9pfE3NUmPF7r2QbT75w7rwyPS+MrYcTjyEdi2Qsy2vmBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Udzed/WCldWJJ41c4IuGDMu/UPJj+kTrXMjUQ0ELEk=;
 b=DybEAoFMDOT9TyUU5yrnY34mwX+enaEjaKtAM6UzyxCeZklJfAX3RIgLgSHh70oYPo1T5F0A936AkGsdiZW3LwNZkpxr5dFYTeW/w6O959IrTXizsMubNywQNGqBCBuKBKSxIU5Spz20/Vh1wwtgMUFmgUX0USyKbXakj5xRw5l4I2SZbHssuyEVf6BmwmkDbb01NY4E5A+/ZqFmNAVdt9fdCEGYhButv30gdTG5A7lKmaabCJQfTh9JrqFBzAUTKMDQVsGCpBmK70BPEpaLKEixiZCYJDUVOidEtNhTjk4ZSty6GAFNlK6xGyreAGehvEC5ufpi79XArx7OvUyArQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Udzed/WCldWJJ41c4IuGDMu/UPJj+kTrXMjUQ0ELEk=;
 b=2fLRWzMAKIcxI4ZzKyE3I2nZSAQwLiZXXozvHPVvPpQYonWeWpFSjOWVUjb0aqdY+nXX9Zk4ifNVQjQmI24FJ0Neb77DumYDt136J8nBic7zYODr8VaROVfciHgTX8iKXOWOPIUEfpnY+8Dhz3vhgLgM+N2qzsdVPUyzFdxhZDU=
Received: from CH0P221CA0043.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::23)
 by MW4PR12MB6976.namprd12.prod.outlook.com (2603:10b6:303:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Tue, 10 Oct
 2023 14:50:42 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:610:11d:cafe::1b) by CH0P221CA0043.outlook.office365.com
 (2603:10b6:610:11d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37 via Frontend
 Transport; Tue, 10 Oct 2023 14:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 14:50:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 09:50:39 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: [PATCH v8 3/3] platform/x86/amd/pmc: Add dump_custom_stb module parameter
Date:   Tue, 10 Oct 2023 20:20:03 +0530
Message-ID: <20231010145003.139932-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010145003.139932-1-Shyam-sundar.S-k@amd.com>
References: <20231010145003.139932-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|MW4PR12MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e999fc-6ef0-4a06-24fe-08dbc9a046f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z1/yIdc0Ye0p9a6AdFCaC+/JYJbwjqYAWJZlK34Tr7T1+xz8eTraj+ZgaQfzgLUdo6GnFwLWonSDeYNQJ+8lJHLo5iWXNo6nOZMocE4uk5UHvIQ8/zJ1amSFps1g0HuCwHXAlvylJMns/hOaEk4cvDLIrANCOU+4BopPzDE2Ayhqhk4Uiy7AGhDoqQxuNFBuXbiTqMA6igJtGOL/Buy8WxmRa/8sMWrwmWueJbWKvrJlAQp7se1OWu0NP7bGm4Rd8+J9Fs2fR/AUe+3cqMHbMS7in1DUeRXnsYIepGzkWjFMch2QR/XXwjxU2RJUbVfw7QjN7EYiil2J5svfiJW/vpeUR26Rx9czYcshbMPuDCIfLSnOhxyKiFb+v3S3Icj3/kVmqkB/RxsDkcQfGAX93Ppm1kVfxcwpVv32pB63LsXe5aPM+M8px9PdWrVA6xvK5uAAu7GHGegApBeWflrjIzSmzqOf0vAcLCtYCJiy+YHhkTsrRHBpQdz2L8SdoRueJ+qAXdJP19FRwIYzHgrx16YfBCCIuFhJ2YGEHkpcsr/5aTg1wb+G8BUAh+5oPTdK4TOVTgTbRJwzoG21KT2ATl7TZpH9Z5jjmK5JrK24/UciIct1daFlhLNv8PD4DeVsas2KURTssErSYFJSpnhVVQVG6MM+8REXt7BTK4yMTpwZXomojvsVyuHT/NgXKF+JB9XHifL6bIuya1GNm4iuS6hg2OrAUqM4fY5wQwUnKyK5I+KOner1bjq5p/Wq+kpjOmkhjQv23vM9JNjpxouW5w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(46966006)(36840700001)(40470700004)(1076003)(40460700003)(356005)(36756003)(40480700001)(86362001)(81166007)(82740400003)(36860700001)(16526019)(26005)(47076005)(426003)(336012)(2906002)(83380400001)(66574015)(2616005)(6666004)(7696005)(478600001)(4326008)(8936002)(8676002)(41300700001)(316002)(5660300002)(70586007)(54906003)(110136005)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 14:50:42.4737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e999fc-6ef0-4a06-24fe-08dbc9a046f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6976
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There have been instances when the default size (1M) of the STB is not
sufficient to get the complete traces of the failure. In such scenarios
we can use a module_param to enable full trace that shall contain more
debugging data. This is not a regular case and hence not enabling this
capability by default.

With this change, there will be two cases on how the driver fetches the
stb data:
1) A special case (proposed now) - which is required only for certain
platforms. Here, a new module param will be supplied to the driver that
will have a special PMFW supporting enhanced dram sizes for getting
the stb data. Without the special PMFW support, just setting the module
param will not help to get the enhanced stb data.

To adapt to this change, we will have a new amd_pmc_stb_handle_efr() to
handle enhanced firmware reporting mechanism. Note that, since num_samples
based r/w pointer offset calculation is not required for enhanced firmware
reporting we will have this mailbox command sent only in case of regular
STB cases.

2) Current code branch which fetches the stb data based on the parameters
like the num_samples, fsize and the r/w pointer.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v7->v8:
- No change

v6->v7:
- No change

v5->v6:
 - Make changes as per Hans on v5
 - based on review-ilpo branch

v4->v5:
 - Fix exisiting code problems when reading stb buffer as a circular data
 - based on review-ilpo branch

v3->v4:
 - Update code branches and commit-msg as per Ilpo's remark.

v2->v3:
 - no change

v1->v2:
 - rebase to 'review-hans' branch
 - drop 2/4 of v1
   (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)

 drivers/platform/x86/amd/pmc/pmc.c | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index e190ec5a602f..9d041000084e 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -53,6 +53,7 @@
 
 /* STB Spill to DRAM Parameters */
 #define S2D_TELEMETRY_BYTES_MAX		0x100000U
+#define S2D_RSVD_RAM_SPACE		0x100000
 #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
 
 /* STB Spill to DRAM Message Definition */
@@ -165,6 +166,10 @@ static bool disable_workarounds;
 module_param(disable_workarounds, bool, 0644);
 MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
 
+static bool dump_custom_stb;
+module_param(dump_custom_stb, bool, 0644);
+MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
+
 static struct amd_pmc_dev pmc;
 static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
 static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
@@ -241,6 +246,25 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 	.release = amd_pmc_stb_debugfs_release,
 };
 
+/* Enhanced STB Firmware Reporting Mechanism */
+static int amd_pmc_stb_handle_efr(struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	struct amd_pmc_stb_v2_data *flex_arr;
+	u32 fsize;
+
+	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
+	flex_arr = kmalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
+	if (!flex_arr)
+		return -ENOMEM;
+
+	flex_arr->size = fsize;
+	memcpy_fromio(flex_arr->data, dev->stb_virt_addr, fsize);
+	filp->private_data = flex_arr;
+
+	return 0;
+}
+
 static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
@@ -260,6 +284,14 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	if (ret)
 		dev_warn_once(dev->dev, "S2D force flush not supported\n");
 
+	/*
+	 * We have a custom stb size and the PMFW is supposed to give
+	 * the enhanced dram size. Note that we land here only for the
+	 * platforms that support enhanced dram size reporting.
+	 */
+	if (dump_custom_stb)
+		return amd_pmc_stb_handle_efr(filp);
+
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
-- 
2.25.1

