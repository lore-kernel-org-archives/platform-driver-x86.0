Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D029AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 14:38:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345005AbiDKOka (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 10:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242727AbiDKOk3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 10:40:29 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC6BC03
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 07:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+bqItwFpSRxT3l6mjrtx0gGsUZP+9nA3+DbIhN+kFBj64Q+mpedhkNzoqnCtqSro3X8hWTIwjQxccYVRWgm/lQ4gQTaVj/dK+Rtyrd5Mr0fAW8IgKukNrSpaZczKsiU2CI2c6e5GAFxK7CElmRTXx+/LkaHYUjY9lYRbZIJrp5rgDJrSPOg/n12B/pRpljA1VKnloBpugjm48VuZtaBvi/YvNxA+eBl3SecrJmw3RaCGvHlXrocoUEBDi/kHjOchD7JQxnoHyT/MPMZ0JR/9YggGAn/lhDdW4bzBekLAY4AaMm4WgfdCXBLQW5cTHekQtanBaEN+ONP1TUO7Wt/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKO9K0WovPERNOodPJfJDIKAQcU/m0iTaBrVifPfuIg=;
 b=f+B86Qxq3+UFRwMojk039Aoc6C70fPd0cPWXpAbDk0FCi7VityjZyv7ZWfTbbk7CeCPMjiZKl1ToXXSLqJv/zRExdKj818+1tr6FU7j8PiWLj7sC1ShwB0X2kmrCCtfhsDAzZYyrdJ7yUFA7kI8C3cLPmgqTVeVl6yr/fNJVapqEChgcyCBzv1dXvI1lebrKXCTS/9ElXVlvsSNrrbHooAf7pydzr3YI8nEF/Hmq3k9gcdjpd0yh3jeibs1zd+mNniZSN+naNdCzAaq3JjJd/goJqU4ZFzgac7MhyYtiZ1203VFuMh6WJPlvKpK3lLtAor49li+CCDIga8UU2ffXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKO9K0WovPERNOodPJfJDIKAQcU/m0iTaBrVifPfuIg=;
 b=2KuJXiT9TcXDV8QuYp7nQf07Clq8/dTLysBEdRFb4CV+TVnThuu0FbO8r/aRBTSVr9tQkqZhuhbFVGlH/tsqWuCNpHktl3AP/JQRIyI7zVnBmwuPhLAAKcCWHEfJ1bRLtHZExI8nG410QUItRIudEz5Fzt5Sa/4jW6DKp7fyU2g=
Received: from DS7PR03CA0064.namprd03.prod.outlook.com (2603:10b6:5:3bb::9) by
 MN2PR12MB3424.namprd12.prod.outlook.com (2603:10b6:208:cc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Mon, 11 Apr 2022 14:38:09 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::b) by DS7PR03CA0064.outlook.office365.com
 (2603:10b6:5:3bb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28 via Frontend
 Transport; Mon, 11 Apr 2022 14:38:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Mon, 11 Apr 2022 14:38:09 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 11 Apr
 2022 09:38:08 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        <rrangel@chromium.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 2/3] platform/x86: amd-pmc: Move FCH init to first use
Date:   Mon, 11 Apr 2022 09:38:19 -0500
Message-ID: <20220411143820.13971-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411143820.13971-1-mario.limonciello@amd.com>
References: <20220411143820.13971-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3729be27-046c-460f-9549-08da1bc8e611
X-MS-TrafficTypeDiagnostic: MN2PR12MB3424:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3424493C28206C431BB5D6DAE2EA9@MN2PR12MB3424.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXH6s14R2iyfSPFwh1BHaMNRDDb9D7QZf28iWTr9TiyhEfO0+JKLwrXe3G6892lBAzYLMYfoh3Z0fbNTjYxMQOMUJmtATQyrGZ/N8Sr/7yEsYPXb73uYf1WoTlKGeKMjAVE3xTD1opBcGv4sVf0p563YPtypLBQm4bCIM7VdvtmCr6HYGWT0Bxa7QDMFVXcOMnYCBfjFYCnm6h26mP5udbIuto42GG28qMHp6CKacGype51NrHTPlS1wVjMOmb5+A43Yu8wRtsoYPqTZYLZazPFyjLWZE2OwU0tAOPAtFtAL4EOe6t/WgloUgfMePA+TSPGT2cCnONwsuGy6TeoDthy8IiudOyPqGZ/c4qb2Kp/Pco7rh2Q0OCdLtboUhX2iFuPuUVNbPeyIsskt9PIVvIHmqlgZSzI43GnyXypbwhQ+RFxb+VEMCRyY/o8vgqtxqeUGz10qzh8RtXpb7/Bwza/NW1tKH7wfvAfNril7fkj115rg3d/NB1ikL+NY5OPGTp/OFm7628QwFAavWrd2mY/8gxhMcBBS11Q/8eMk5soL6gmZVLLHTARxKyI6v5KiTgCALUpsZDXj6Hl7qSDu965Gp5HhO+eROnoxK5t4ofqD3wBsLPiLU2acvY1S7grGzf1qniapKN91OyF8VDafYMKLCqpE1n96447pvGYUaGJpk3FjnXr5CeWkpEa9fcDht/eIdp3J4q77vWUCp1VtTg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(316002)(110136005)(44832011)(1076003)(86362001)(36860700001)(26005)(16526019)(186003)(336012)(6666004)(36756003)(426003)(47076005)(54906003)(7696005)(83380400001)(5660300002)(4326008)(8676002)(40460700003)(70586007)(70206006)(2906002)(81166007)(356005)(2616005)(82310400005)(508600001)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 14:38:09.2573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3729be27-046c-460f-9549-08da1bc8e611
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3424
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

FCH address is accessed only when looking at s0ix stats.

As this is unnecessary for initialization, move it ito the first
time stats are accessed from sysfs.  This descrease startup time
by about 200us.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * Add tag

 drivers/platform/x86/amd-pmc.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 103ba0729b2a..1f68a3cb1973 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -383,6 +383,17 @@ static int s0ix_stats_show(struct seq_file *s, void *unused)
 	struct amd_pmc_dev *dev = s->private;
 	u64 entry_time, exit_time, residency;
 
+	/* Use FCH registers to get the S0ix stats */
+	if (!dev->fch_virt_addr) {
+		u32 base_addr_lo = FCH_BASE_PHY_ADDR_LOW;
+		u32 base_addr_hi = FCH_BASE_PHY_ADDR_HIGH;
+		u64 fch_phys_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
+
+		dev->fch_virt_addr = devm_ioremap(dev->dev, fch_phys_addr, FCH_SSC_MAPPING_SIZE);
+		if (!dev->fch_virt_addr)
+			return -ENOMEM;
+	}
+
 	entry_time = ioread32(dev->fch_virt_addr + FCH_S0I3_ENTRY_TIME_H_OFFSET);
 	entry_time = entry_time << 32 | ioread32(dev->fch_virt_addr + FCH_S0I3_ENTRY_TIME_L_OFFSET);
 
@@ -796,7 +807,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = &pmc;
 	struct pci_dev *rdev;
 	u32 base_addr_lo, base_addr_hi;
-	u64 base_addr, fch_phys_addr;
+	u64 base_addr;
 	int err;
 	u32 val;
 
@@ -850,16 +861,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
-	/* Use FCH registers to get the S0ix stats */
-	base_addr_lo = FCH_BASE_PHY_ADDR_LOW;
-	base_addr_hi = FCH_BASE_PHY_ADDR_HIGH;
-	fch_phys_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
-	dev->fch_virt_addr = devm_ioremap(dev->dev, fch_phys_addr, FCH_SSC_MAPPING_SIZE);
-	if (!dev->fch_virt_addr) {
-		err = -ENOMEM;
-		goto err_pci_dev_put;
-	}
-
 	if (enable_stb && dev->cpu_id == AMD_CPU_ID_YC) {
 		err = amd_pmc_s2d_init(dev);
 		if (err)
-- 
2.34.1

