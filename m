Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14988E95A96
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 09:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345863AbjJIJrd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345708AbjJIJrb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 05:47:31 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192178F
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 02:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQJq72LrOCukhFfKYfU5NRq8ThG+2ZofI38SVxYouU6us9rCJrEoQhNQreEXd1vk+GBvf2/pbQgClWhiauhLNzc/O/cHE7drz8QJm64kopbKEnHhbEg7RIE1mV5PZucxAa0kvUPfzblO5nlPaPhj3VSVH5g+BY6XHTa86Mpo2lboNC8JVYirxBAh+V2ATrZDMbvYFFAlpm2YBJzmc31fEgTNf/wMEnNR1aL8XfRq0jUi4TdJwqa9JjXdWKVGYwnl59l9dtqWcLW4e5qH8TUNfI8APCo9buAmtUYqrOz8z6tYjasJKQA+ZF8wEPZ8OfV5XuuoadMwj9QElLEJs08NfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpSyQV5s37yD7+4rw0u3TMVtSnvvo3tg9MRY1F8Tmeg=;
 b=GMIrGAjt08r7b6dps4u7X8OkWTf8MOZbWZU6C7CdsmQwQXYQdoOUzSDvi23AvkN77hYe1YFDM5IiRA4FGlBAZemYXhrAznEJSyr7/91psGE2Aa/dBbtvVlasC+uQJYHdd6vBTCwjfAhTV65jy/j9an+zKPrvUyYvOWVCx8T46KKAnGJ1brhOUvG5s9XZGDlfpr/WB7SlLtHm/j+YL1zlfobWv19ZdaoWD/ASh0d2vtFKybEKiALEQlb+TCGTOgFhJvKBfhVu7SwdRPtZoW3JmynRPvJn0xD2Oo9QR2psf1TNjYJIXbt1UFOHGWshJk13vneRHVpcO3Yc8Xh/62w+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpSyQV5s37yD7+4rw0u3TMVtSnvvo3tg9MRY1F8Tmeg=;
 b=wU0wm/W0y30AsXblYgAAsZk/Ao0cc2s+BbOf0BxYh3CLnNja/pZ0WjKufYOUq9hKS2pWX7kLlFfjLoWhVBSOkGZN3aMO0cShIwNpdNqNEog22o7k/vcRgmN87YTOejYwnmRXyIB99TnV7pzLtIaHY1Rtyg54mb07KoiFueb3DBQ=
Received: from PH0PR07CA0024.namprd07.prod.outlook.com (2603:10b6:510:5::29)
 by SA1PR12MB8947.namprd12.prod.outlook.com (2603:10b6:806:386::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 09:47:25 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::49) by PH0PR07CA0024.outlook.office365.com
 (2603:10b6:510:5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Mon, 9 Oct 2023 09:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 09:47:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 04:47:15 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 1/4] platform/x86/amd/pmc: Use flex array when calling amd_pmc_stb_debugfs_open_v2()
Date:   Mon, 9 Oct 2023 15:15:36 +0530
Message-ID: <20231009094539.6746-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SA1PR12MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cfc0aa-7733-45bd-7037-08dbc8acbdac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qZqDnfKxHDaL9F5zKb0f0Pbjwvm7t4MU5Ni+3z0zXvS6wgw7kYdAPp1ACVJAfE9yVMbFAxZf+P7A+jbqTsdAFIk3+o34iWlmqciqfXb/39Yqu/9ZyA3SJgnd6N6NU81qC7QNJJuI4T9i1v3WvE2hb4vE6rrccXUJzrSyS4mQc/0GRe/qjIkjUeo7H/4nbrMPvPPKMhXvMSXzpaKcdpdgp9XYOQ+SwNgAffL2DyOq/SjYo0rvHXBtlR4vPCHpDkuEn61iRwR9OzIfR1AbxAuIDzT5oGCMi99grGC+mioHP47w69ciY7UcTp5T5ckHcxsArfROThEkueTQtchDj6x2u7G+QFuXi2WBGBO5ZvHhm2S8rCSbieSaQYbCZh9K8+GavMZwznmiAKxKAkVt5zxh2By0GRimET/dUl/1rgF7DVxsJ4KBJCpjbLxgDCjkfcIj9/z7uGaaqDJjrtk3zkA5khQWARRYOMnSs4H5BXGXuyy6+NZQ7Z+PbRi3U5ntCkrB23AlT1PAFsA+upVLzi/IODCCXnEppXw98E+SZKIC2HzoVSM0LXg+1mBeXHEaDGXfOR/R0uiynCIuPV7l/lBmk8PRZvFQkHEqs3X+F/5oi8dl7hEh1g0oN330M27OF62fF/mPRAVDKiHNP5fqCfoRu4m2KOE9+1wSo4KwIy22XjXgBd6K0eO5RlA5wvq///GFjaPNVzm82//7cpa8wEGyN/Ow9k7OHjQOIDXDdiGlxJcuObJWVFMUGiYwedeCZHJq2i7sIKM7cCvAdo57w94Ajg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(426003)(83380400001)(1076003)(2616005)(336012)(26005)(16526019)(47076005)(36860700001)(110136005)(70206006)(70586007)(54906003)(316002)(8676002)(8936002)(5660300002)(4326008)(7696005)(41300700001)(6666004)(2906002)(82740400003)(478600001)(36756003)(356005)(81166007)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 09:47:24.4557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cfc0aa-7733-45bd-7037-08dbc8acbdac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8947
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently in amd_pmc_stb_debugfs_open_v2() the buffer size is assumed to
be fixed and a second call to amd_pmc_stb_debugfs_open_v2() may race with
a process holding open another fd. This could change "fsize" to a
bigger size causing an out of bounds read.

Instead create a struct with a flexarray to solve this.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v5:
 - new patch based on comments in v4 from Hans.
 - based on review-ilpo branch

 drivers/platform/x86/amd/pmc/pmc.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c92dd5077a16..e00d69801369 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
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
 
@@ -264,7 +266,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	dev->msg_port = 0;
 	if (ret) {
 		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
-		kfree(buf);
 		return ret;
 	}
 
@@ -277,8 +278,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		stb_rdptr_offset = 0;
 	}
 
-	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
-	filp->private_data = buf;
+	flex_arr = kzalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
+	if (!flex_arr)
+		return -ENOMEM;
+
+	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
+	flex_arr->size = fsize;
+	filp->private_data = flex_arr->data;
 
 	return 0;
 }
-- 
2.25.1

