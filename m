Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E586EC83F12
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Aug 2023 03:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbjH2Dxu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Aug 2023 23:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232427AbjH2DxR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Aug 2023 23:53:17 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896221A1
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 20:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhJI0S+UEJ6carY34Xu4CyQnbuszxVHZgcIXRc/gODa0rCWOqG5hYqk/O4nJW10tHJnc4XLZTfqOkjELE6xrV972PJIeeN5+Azj1iXc/Y//czuMVzRcF2BdhdT1bRdbt+RVz/rncmFEJDgBtD0iLRSbgYe6SeHpXMcJtHnAAIrFa9xq0H3DwGnnl0i5vaOgsJC6dOxFCSCJTA4X77dR2iF3nRkmylHbuq84KlZGmxAomlD1Y+iQoVmKKu7aMq7bCFeKFvp4LP38z5ZpYDvdR2xzul8tdIxHP3+60vFLs/62+SnKzHLOg5/TVwkPzg9pNf6iDn0ukMg2knX/iNpjGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMqFpJaDnl4JgqUFtIQa7gJlJLCns/LIWF8RVWGty0Y=;
 b=WbGFSvtgBSvw78S4MWwPn+zSMbiUHxxECoQgfa23XELshbi6Mz/PgPWz5HowTRmdthBLImM0qjNCbDLKP0hcncTWpssWTjHJ3HUOG9tm2pbxzbR/tq9Cpy5F/tqyfWz2ooRuTj8OgNP6qpKjQ9c8aghw/Mnc/89CrYzKT63wz3bKu1sSy8HwYiaggwwtAqNOek0NN/VUKlPnoQCOZy8S4QkIlfAlluDXUhESH9o6isTy510WT1rdnkazfZfJW4iPqld8l0int34vGOERX7IoESweN7rWM7rwRX2+2ywJqy+tYvUD6rYQx6kgV09BJ2uAjygHu8dxDpeZ1E9kUeHopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMqFpJaDnl4JgqUFtIQa7gJlJLCns/LIWF8RVWGty0Y=;
 b=P+dhv+LzF6pw0HYkY9dq8TYWtTetMxm4pClVR7i2EutuAOqZPNtyeaqOE0A1f9GP6kDpJZaUG3+MYXSlSl/5UhCBWdl0PTHsdORQvdS2w3/l1lDrVzbYlKxS7ussz6bhMj5yOX4CVwhoFTLFVSSt5Iha3USUiQADpkdbEpyts0s=
Received: from SA0PR11CA0082.namprd11.prod.outlook.com (2603:10b6:806:d2::27)
 by MW6PR12MB7087.namprd12.prod.outlook.com (2603:10b6:303:238::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 03:53:00 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:d2:cafe::ee) by SA0PR11CA0082.outlook.office365.com
 (2603:10b6:806:d2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Tue, 29 Aug 2023 03:53:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Tue, 29 Aug 2023 03:53:00 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 22:52:57 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/2] platform/x86/amd/pmc: Add PMFW command id to support S2D force flush
Date:   Tue, 29 Aug 2023 09:22:38 +0530
Message-ID: <20230829035239.4132737-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|MW6PR12MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 442676f7-c390-4a6b-187c-08dba8437027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OKkXsyA++DOW62EpfLuxqaetTcRlIDOf0Teg3UvCQ7ZkHn25XmWZEqvB4lqe+k5yTL7e+0VBG7kq1QARQON0To1xKc0I4dZYy3VliXhN0tKyzkjVQtxjYw68QevATgyiWkGV7xZHVEN0aGWvZGR3krJVejOpbHKniu+OtWH9DInEyQQ337uwnBIkt6krGbEc7NwKKKsAWM/70nqPpR4cLvkA1Y1rgFoHHBodxsJn9e59vQZFIHlrJQ+tuxTpFx7GTDD7uzS1Rui5JGcUK/DaRHNj0QKwnnTPC/S2EUQt3CWWFtkpE5qaiLfCNzXRa8QbTq3dPdRZBfDkuJyXroXFOapUUy+IXwTS1WM4dyKNaEcoRwxyKpShpsihoUAn9rjxylcwsJMQvq+nWCWT5/45XVD9IbtCy72RXza3lYCck98pLrRwLBR+z8O+qXIIyiM5aYd2yr3sYKvI9a21lZPE064agFz0/W52Ph6iMCQVe5JlWEMPzEUQ9ikhOanLd304+7DSGeACvTMUevjiwPfuT9wNTz4l79ZVDH7df83G3g+297jxd4Ft9ssSWjZ4RuqpUA+xUeEJ7ARG7eua9EYRMgnoC18WIPfhT/A3Y9LsCUZM4j5SIFSKl3Jfwbupgza1XrFSnI/xZA4rrNSLiEeqDwtOPN9+QghRE86WN4xSL+B0Pqm0qULvQN72br0rdUW28mX0M14ll+WtBGpQmHTinFTkdjB6I7/uCqHUK3H486DpJKPu3WBNIGmXvZ4cCOLuLhI252BUi6FjdUc9sL1Iow==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(6666004)(7696005)(83380400001)(478600001)(336012)(426003)(26005)(16526019)(2906002)(1076003)(54906003)(70586007)(2616005)(316002)(41300700001)(110136005)(70206006)(5660300002)(4326008)(8936002)(8676002)(40460700003)(36756003)(40480700001)(356005)(36860700001)(47076005)(86362001)(81166007)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 03:53:00.0317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 442676f7-c390-4a6b-187c-08dba8437027
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7087
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recent PMFW have the capability that can force flush the FIFO
contents to DRAM on sending a command id via the mailbox. Add this support
to the driver.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2->v3:
 - use dbg instead of warn
 - print return value of the new PMFW cmd in case of failure.

v1->v2:
 - rebase to 'review-hans' branch
 - drop 2/4 of v1
   (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)

 drivers/platform/x86/amd/pmc/pmc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c1e788b67a74..443bb78ea5f4 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -55,6 +55,9 @@
 #define S2D_TELEMETRY_BYTES_MAX		0x100000
 #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
 
+/* STB Spill to DRAM Message Definition */
+#define STB_FORCE_FLUSH_DATA		0xCF
+
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_MAPPING_SIZE		0x01000
 #define AMD_PMC_BASE_ADDR_OFFSET	0x10000
@@ -236,7 +239,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
+	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
 	int ret;
 
 	/* Write dummy postcode while reading the STB buffer */
@@ -251,6 +254,10 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	/* Spill to DRAM num_samples uses separate SMU message port */
 	dev->msg_port = 1;
 
+	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
+	if (ret)
+		dev_dbg_once(dev->dev, "S2D force flush not supported :%d\n", ret);
+
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
-- 
2.25.1

