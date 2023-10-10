Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F90CD8C99
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 14:50:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233225AbjJJOuw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 10:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233232AbjJJOus (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 10:50:48 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5C3C9
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 07:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlXaoPYB9GbBIG4RYe1DHqA3ujt5CdegmAtRDs2t+qvRz2JQvqFBd69cIvGUt5hLS5q2f2seT0lXEaYX6XvK5OO3G20sqhoUksQb7h54//uGGZOovk031Bv8hBIlsS61fIoaO/LBBLcvd/wuwXOazXWXS73OQAzj22Qy0KJ4uJXdJatcbL5N3JW48tjTM29/qOaIIvAwsxLk45+ovKswHIibypxH3PQcfU0x0qBNcsKAtEbiueGRC+x1pYfLUBpx2JJPdnIUhwer2+w6jdbPcTGDOGmrEYW6pslICriqHl2h09WHqHG4BnckjareS4lI+k3yjG2GyDqKLwgqGYOv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5q7kvMsd4tRov/VaM0dnNnLDyKg/STHZmJwsRLoOVYE=;
 b=aGMuWddgEHjRUuly+rdMgtxg+ClnrBNbqQ+29ev+wVKI8urcbV9e0BCT5LCUmyd3OYSK7XBnXWDlDnEDwKR/Yopuz8IoEIRbaQWHOhdKBA5HUNpONLi4a5fJp3XXxn7gNhnW4jxB8AC+3PcLwi4ar9ObZQ49SALsHIGVPkvczc1LcuDX8sHelr+GNY3OziQz5k3zkKvi84a7lWKLH6H6Kfl0jmpG5ksVT97LAaQatxKXsXtQX5FgrN53zHx3mh56DbpM3KsxAL89B20m7J8tGUBPqdz3iiGUS+MpMV8qWDbCGOi5uKO425NwFoGlB1eolZdwScK9U5Lu+Z7LuUbKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5q7kvMsd4tRov/VaM0dnNnLDyKg/STHZmJwsRLoOVYE=;
 b=OsMIQAY4JFb8iaB5t6bpFPD4IvBSsBP17X1yx1N/6+ngTgUDQEQCPZVBn00PDIbvTTCku5TV4clebfI/JQdzoibAqEFNt2Tq+IZHrwGUnGe6Rfkw82ML/LainkypAH4323KorwkF4mMoXbJDipeRhUDB2U19SLffTzxDWJUeBjw=
Received: from DM6PR07CA0077.namprd07.prod.outlook.com (2603:10b6:5:337::10)
 by SJ0PR12MB5488.namprd12.prod.outlook.com (2603:10b6:a03:3ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 14:50:37 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::47) by DM6PR07CA0077.outlook.office365.com
 (2603:10b6:5:337::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.27 via Frontend
 Transport; Tue, 10 Oct 2023 14:50:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 14:50:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 09:50:34 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v8 1/3] platform/x86/amd/pmc: Use flex array when calling amd_pmc_stb_debugfs_open_v2()
Date:   Tue, 10 Oct 2023 20:20:01 +0530
Message-ID: <20231010145003.139932-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|SJ0PR12MB5488:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad721ba-eefc-4191-cf6a-08dbc9a043ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VaoqcY/12wpZKMEpITFbsNeHj5YaZwOpy5gdxdeGZEOcAlsHtcGmKl6FqcmbfzAmrY17OJP/Uf9fwUwGJ2kgcsb46gtzHEMGZKUSBk9194enZyeo/iJzvuS//Q2bYB5SruYwlVHPkNO1ZiRJGUYvmbeP8Ak6yo0ANpHzXkrxPJ3hJgX73J9tlJioZYlm1WyESYeeA53T6Zxj9e1FxLtFkscwRcSEutThyYak6kBdC2cnx5GnVSjEku16IyY5ze8F7oJ2Dj3DCI5VpNcd+vxNmn95q28oW+t8PLGO7jkFBi6I/l8grBdGdavAQ0SzBr1b1p8l4Y3CW12S/gPbxErOTXSNF106YIRC5mD91j7jtp/ZpfpfUjp2yF88z6csOS7prx4DvwSYu7GRMHdznCtJVBISQhLDBiWsTMsCa1W23sgrF9zWHriTLBgtamRt1vI6U/IyIzO0vAEUSmEque8Db11R0MXKIh96/HzKe+5aElb6nkdt/ed3V2mEY4oJLDi0n6S6ZKNXbWvLZvV+jyFomCV++BMuvoUjVvDWEGTzDenjAgEsKicv0ewWM7NazsX23YX6mhCI0lbc8okr3BlFCu9n6J3/RMiWgkjbx7eD74EptdamEm3tXm72b2Dc4gChf5eD7O81W2phX66qlXZzugJKHYetZvFjuJaGqc/5lwzu8qHkoETmne/bcdpqdcJYHynSeF+0kd99einAhHvQtePRtvgrMuMJtj5w4XhwNWuD0R9rm1h0b3uUncWPAF24Krdw5NKzOu4HblClUqFrjA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(40460700003)(1076003)(7696005)(478600001)(2616005)(6666004)(47076005)(336012)(426003)(26005)(16526019)(83380400001)(2906002)(5660300002)(54906003)(110136005)(70586007)(70206006)(4326008)(8676002)(8936002)(316002)(41300700001)(356005)(82740400003)(81166007)(36860700001)(36756003)(86362001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 14:50:37.3703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad721ba-eefc-4191-cf6a-08dbc9a043ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5488
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently in amd_pmc_stb_debugfs_open_v2() the buffer size is assumed to
be fixed and a second call to amd_pmc_stb_debugfs_open_v2() may race with
a process holding open another fd. This could change "fsize" to a
bigger size causing an out of bounds read.

Instead create a struct with a flexarray to solve this.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v7->v8:
- use min()

v6->v7:
- No change

v6:
- Handle release buffer case as per Hans remarks
- based on review-ilpo branch

v5:
- new patch based on comments in v4 from Hans.
- based on review-ilpo branch

 drivers/platform/x86/amd/pmc/pmc.c | 32 ++++++++++++++++++------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c92dd5077a16..609bad470fe3 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -52,7 +52,7 @@
 #define AMD_S2D_REGISTER_ARGUMENT	0xA88
 
 /* STB Spill to DRAM Parameters */
-#define S2D_TELEMETRY_BYTES_MAX		0x100000
+#define S2D_TELEMETRY_BYTES_MAX		0x100000U
 #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
 
 /* STB Spill to DRAM Message Definition */
@@ -122,6 +122,11 @@ enum s2d_arg {
 	S2D_DRAM_SIZE,
 };
 
+struct amd_pmc_stb_v2_data {
+	size_t size;
+	u8 data[] __counted_by(size);
+};
+
 struct amd_pmc_bit_map {
 	const char *name;
 	u32 bit_mask;
@@ -239,7 +244,8 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
+	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
+	struct amd_pmc_stb_v2_data *flex_arr;
 	int ret;
 
 	/* Write dummy postcode while reading the STB buffer */
@@ -247,10 +253,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	if (ret)
 		dev_err(dev->dev, "error writing to STB: %d\n", ret);
 
-	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
 	/* Spill to DRAM num_samples uses separate SMU message port */
 	dev->msg_port = 1;
 
@@ -264,10 +266,16 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	dev->msg_port = 0;
 	if (ret) {
 		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
-		kfree(buf);
 		return ret;
 	}
 
+	fsize = min(num_samples, S2D_TELEMETRY_BYTES_MAX);
+	flex_arr = kmalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
+	if (!flex_arr)
+		return -ENOMEM;
+
+	flex_arr->size = fsize;
+
 	/* Start capturing data from the last push location */
 	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
 		fsize  = S2D_TELEMETRY_BYTES_MAX;
@@ -277,8 +285,8 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		stb_rdptr_offset = 0;
 	}
 
-	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
-	filp->private_data = buf;
+	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
+	filp->private_data = flex_arr;
 
 	return 0;
 }
@@ -286,11 +294,9 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
 					   loff_t *pos)
 {
-	if (!filp->private_data)
-		return -EINVAL;
+	struct amd_pmc_stb_v2_data *data = filp->private_data;
 
-	return simple_read_from_buffer(buf, size, pos, filp->private_data,
-					S2D_TELEMETRY_BYTES_MAX);
+	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
 }
 
 static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
-- 
2.25.1

