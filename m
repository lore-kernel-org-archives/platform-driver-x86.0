Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0626BE95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 13:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377400AbjJINng (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 09:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377397AbjJINnf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 09:43:35 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436A19D
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 06:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFD7XqJ3PiDl0fTkKDVSIyWvkeZ/INducgXvgg4Jj5qUAz0Uv1R1gRupyKTTYF9cjLaKLAJgCYb2dbAfjrRekwEgAQVRt9qfdBC+K9mnBO2ERVcpumj7JwVOBADSl9jRwKODxHd904q0fQmIyKEvwmAuzGvSuxxfVqBZuDCR6UPOn2nwGOIJ1Nk7QZ+DOa5S8NZk1hqylE0yu6W6FTZ4L4v3c0iqRaVMsUbPHuxJCdnimwYLP7XrCxtakv6tZyf1gKf0Hmwa0/t+fjvN+AIYDP8Jlo2h76h8t/oOckHFwmF9zsy+nDLXruB1lfgLyOrLEvNGP4sjxKvymfjbqtVl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98rcSl0grgcCMung6zgI0v+qmR3j+wS4i8BXJJEmr68=;
 b=UZbev/ejTGRyfA1oXJWrSGrXCY8Vdp2uq8og+A8noE8owlvxLyGrN8DiRow2JkbmrEO+pdiNSX7EcwDtQaLCuqSYJhS6H4vLXl13AJtQoGBgtfCyrCCX5hlbNUVDXxbj5M9vqBOCvcgYQRNENz9KjSoZSraMJhCeu1f9D67AjYh9EEuyyUvsB8v08KGFJBHBWK7jg+PlsMwQp4gzEcDRJimfce/b/irnXErzFEkqHE3loaid0XKFwaL1caCZ3rv+AZjAe8RN5tPHbIou4m/HZS1UkZfkbrII4Qqgp2U4byTQwrk6kqWvTvUnRe8024RoD4OKU5R6v/ELx0FoIY9bVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98rcSl0grgcCMung6zgI0v+qmR3j+wS4i8BXJJEmr68=;
 b=vJwVRb0fcbrhqjUnXJVL2yDIDfQQU6uIBvkIR8ActY8E5+R+lqVZIkfOxlfHApnzdtH+exM/t1mgTD85SDy6tc+SeXAcNk8gGPyjbmLljlwamR318goCk3lzh3RhHvlef8QVu+WCqSf5Kf+JhJILIrhpPIPIzwCHcyCcLr+za8U=
Received: from MW4PR03CA0088.namprd03.prod.outlook.com (2603:10b6:303:b6::33)
 by DS7PR12MB5862.namprd12.prod.outlook.com (2603:10b6:8:79::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Mon, 9 Oct 2023 13:43:31 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:b6:cafe::e3) by MW4PR03CA0088.outlook.office365.com
 (2603:10b6:303:b6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Mon, 9 Oct 2023 13:43:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 13:43:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 08:43:27 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: [PATCH v6 3/3] platform/x86/amd/pmc: Add dump_custom_stb module parameter
Date:   Mon, 9 Oct 2023 19:13:07 +0530
Message-ID: <20231009134307.21001-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009134307.21001-1-Shyam-sundar.S-k@amd.com>
References: <20231009134307.21001-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|DS7PR12MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: a54bfa89-67a6-4006-09a9-08dbc8cdb99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /NqjBwvrlFVUWHDCQt7FAI+4Vaf6XNNswas+ot9m215Wpw5v3k9l2qHV6aEj/G8E3Gr3OwPBDBLlzt2fLhOr2PgNJroBHfj5jycOXb10RowDbNUL3gG4C6MrN/6Pysi0RoivzrWuYusfUTgTP3Kcw3AEinr3mRBHbXymUotHnn9IqTb7ESL1gl81NfBdV8fGxUEZpmTpimkj9Bp1CmH+NFXPSaJttK3q6bNLrxTUHV+utOohrzpxDTXJdVo6QdGjVTeFRgwqNhhtLp9iSx4sx6OLAx5MhjQcFKNf+pXT+SgJa5M3WdrWkygCgleQ8tObBrMCgQNZWEjfZ7ScT6NxtQRBjtB6iHhvnHfZCISMc7KzqmFn0rSXQEd2ovtj6Nb+m7mdlgrRQcTGbsBZKJV/h1rjbTMx1qVNucDO0+QgjnZw/V+lLOHk3PePfNcsyq7Su3Yt+zQwJ40fxbUvhUJ6pgDZqwwCsupYHzOldNAsipIYAcXMBTQnhUfJfqCGAOzAROQlHc/0srik87ies1aj9lteEHL3S0Od8r9w6sw4Rc/97ErNAZvzHUzQLya2Ns0RrVjsHN7fu2FF4dKEn/ZgTj7Lu8hZwGGfC4C6Bh5+1MDbJ2BKmQ2NeXomPJwfBZnJK7xO1dSvqF9iROky2dUghdZbl1MCTcGp9GT1ZzhGGWdTr6WUj5n3gXvRgVwOYExOjh+cpEnZ3o5H4F7wNc+6Njvprj+FJv740vMH3FbvjGvF5FtsoEWluzifyUwuaQgWX8nXuEMhZRI7+szN34i9Ww==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(40480700001)(16526019)(336012)(47076005)(426003)(26005)(83380400001)(356005)(81166007)(82740400003)(8676002)(36860700001)(8936002)(40460700003)(4326008)(70206006)(110136005)(478600001)(54906003)(41300700001)(5660300002)(1076003)(2616005)(2906002)(70586007)(7696005)(316002)(6666004)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 13:43:30.9553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a54bfa89-67a6-4006-09a9-08dbc8cdb99f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5862
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

Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v5->v6:
- No change

v4->v5:
 - create a new function amd_pmc_stb_handle_efr() to handle enhanced firmware reporting mechanism
 - based on review-ilpo branch
 
v3->v4:
 - Update code branches and commit-msg as per Ilpo's remark.

v2->v3:
 - no change

v1->v2:
 - rebase to 'review-hans' branch
 - drop 2/4 of v1
   (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)

 drivers/platform/x86/amd/pmc/pmc.c | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index e0b5d9de473a..fae47854800d 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -53,6 +53,7 @@
 
 /* STB Spill to DRAM Parameters */
 #define S2D_TELEMETRY_BYTES_MAX		0x100000
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
@@ -260,6 +284,16 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	if (ret)
 		dev_warn_once(dev->dev, "S2D force flush not supported\n");
 
+	/*
+	 * We have a custom stb size and the PMFW is supposed to give
+	 * the enhanced dram size. Note that we land here only for the
+	 * platforms that support enhanced dram size reporting.
+	 */
+	if (dump_custom_stb) {
+		ret = amd_pmc_stb_handle_efr(filp);
+		return ret;
+	}
+
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
-- 
2.25.1

