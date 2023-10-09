Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7199AE95A96
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 13:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377393AbjJINnd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 09:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377398AbjJINnc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 09:43:32 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B0EAB
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 06:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bC+WphPfqM4M3aGAvyl8+d/J/736tJcWpNA8U/kpNPp8KSKxCBCpS1A/aHa/2tD9M9gThlD8MU45SrMn9vUQiX+SrydU+leyGOBH7m1bTLdmAy+lrkK6k/gYZqx4OrHSQiC3WgpBHkIVuS8bPOPlR9HCPU6E5GSMAiW6gButcpbAzAdRpykOl6wlZo1JBxEEmQyIF/Cf4g2F5xI+jRa5SIVbxOBy5wnjZCQoCYDNqr5cGFW+/RbR29CqadpbDy4uIkvbKlNq8C3IYTjmLz9XqUPNF6TrBbUh0lqnQnLEk4YGgzUmKnYqfdgrZKl/JDnrzf4+E5OC8L1VP809dDaGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NopFAgzsLg7bXt1u126yemGvzB0Db8qzpuWN7OsY7LE=;
 b=Wybt6IT5v7dKTlqdNjnTlm6yASWoOXSM7+FCCu5MzeZN98lQXjBB3cK9v2OKqdB7a8QbIPfNPxdy90Pf0wc+B079blYe7ApvqMu8QKBiYLlSZkrKBIR3nzifuKfZbGa5g412x6Muk9623KVaSPXR9IvQJaMcKinotnhfICIOHWaHe3qro1YHxI/n7qBC0VQ8XCNbGl6AvHz4A5Be0xIjVT3OTYtTJ/OpwDVqFv1Y6Ge29We1JrdIaALi9DA0qqKKIH2FtXB12DKuMUGsi+aJsnqDJVjvxVAR6u+Pu4IsmPg8Cg9wqMI83g1ZLQ6i2URLOCUC5bpQVTczVt55Sp1bCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NopFAgzsLg7bXt1u126yemGvzB0Db8qzpuWN7OsY7LE=;
 b=5SPXxWExR02gPR8ctcQQVrDrvaBBpW1tN2wpW49uIdfMWurmDBueNX4pClOKPieYT3aV6gCDHazcCUNQkiYtCWhsdRAsjKulKboXSuzUAeKALrBB7acUPNYamDTmiCf5cINF+6ejvA7tbo/RSkRsw4dOWejMFydrUsQne3IVJ6k=
Received: from SJ0PR13CA0108.namprd13.prod.outlook.com (2603:10b6:a03:2c5::23)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 13:43:28 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::d1) by SJ0PR13CA0108.outlook.office365.com
 (2603:10b6:a03:2c5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29 via Frontend
 Transport; Mon, 9 Oct 2023 13:43:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 13:43:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 08:43:24 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 2/3] platform/x86/amd/pmc: Handle overflow cases where the num_samples range is higher
Date:   Mon, 9 Oct 2023 19:13:06 +0530
Message-ID: <20231009134307.21001-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|BY5PR12MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac7c227-7028-4970-b3a7-08dbc8cdb80b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rK7G4/zivIWN64AIlpjiyX+qso5wFksc4vOMYqV8Pk8J4Wx7HQNKDesmS0Ug1cdLZvZ6ExhDS50IF9Bug93fCeu1BhnkQx0XpYL/KH/Ixftrhnafingx6yT3Vy90lAZYcnXsa4GHeTr2NgU+2SdQMd9L0efR+D9fICf+OYnxinZD6aynNikjxMlmV84Mzr8eMH3gW8jgvyemIl/vOWtnaR1K/3FN25lRBGR5rDe2icqgZrUABBXpvC71Uxs769R0lP1N5EX5CeuRrdKdFdybri2DAH4X483WtxB7EBY8Rp+uXSjtd71ddpL97XjHy8e8IAR5chR1K1uRyELQ3VkcDyjALd/bO5ppRxmk9nxrUkCgrYyLO3jkMyqJiTeKVbfpYBReZLzqJzScKbMtnE9Tll51aS3oqzZCv5Gb+zQX8rpwc60d3zbrIGgJiso/LvI6x4p99MWb3av/7uD7N9QxcAOYvRyZYwwVjluaDYPU4bFU02RHQno+FhCx7+L25SeBnejX4expDrb0AZUQ9KE++ARJpi0bFZNXpSV7HN6/DUf2SQNk7dfBE4h3eeU2T64X8IKHR1kBXq18j9H0KSVLtsg7HyZAne9k/ovAa8H8Ro2TUNv2somltvZl3PHUE8T1t91CgICFkbSvo80BRGHHYeJoqMYckzvLL8NI+DUtVXVPB4saUDI33yura2+fzDqO5WDtoTUuR0DSpnDyrvQa0FBoJZCIA6dNc7emTRNRr5paskPXbGZ/A4wpyilYNHF+
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(82310400011)(451199024)(1800799009)(64100799003)(186009)(40470700004)(46966006)(36840700001)(2616005)(426003)(1076003)(26005)(336012)(16526019)(47076005)(478600001)(6666004)(7696005)(41300700001)(36860700001)(8676002)(83380400001)(4326008)(2906002)(70586007)(54906003)(110136005)(70206006)(316002)(5660300002)(8936002)(40460700003)(81166007)(40480700001)(82740400003)(36756003)(86362001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 13:43:28.2651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac7c227-7028-4970-b3a7-08dbc8cdb80b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In amd_pmc_stb_debugfs_open_v2(), the stb buffer is created based on the
num_samples and the read/write pointer offset. This holds good when the
num_samples reported by PMFW is less than S2D_TELEMETRY_BYTES_MAX; where
the stb buffer gets filled from 0th position until
S2D_TELEMETRY_BYTES_MAX - 1 based on the read/write pointer offset.

But when the num_samples exceeds the S2D_TELEMETRY_BYTES_MAX, the current
code does not handle it well as it does not account for the cases where
the stb buffer has to filled up as a circular buffer.

Handle this scenario into two cases, where first memcpy will have the
samples from location:
(num_samples % S2D_TELEMETRY_BYTES_MAX) - (S2D_TELEMETRY_BYTES_MAX - 1)
and next memcpy will have the newest ones i.e.
0 - (num_samples % S2D_TELEMETRY_BYTES_MAX - 1)

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
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

 drivers/platform/x86/amd/pmc/pmc.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index fdc1e104c437..e0b5d9de473a 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -276,16 +276,23 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 
 	flex_arr->size = fsize;
 
-	/* Start capturing data from the last push location */
+	/*
+	 * Start capturing data from the last push location.
+	 * This is for general cases, where the stb limits
+	 * are meant for standard usage.
+	 */
 	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
-		fsize  = S2D_TELEMETRY_BYTES_MAX;
-		stb_rdptr_offset = num_samples - fsize;
+		/* First read oldest data starting 1 behind last write till end of ringbuffer */
+		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
+		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
+
+		memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
+		/* Second copy the newer samples from offset 0 - last write */
+		memcpy_fromio(flex_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
 	} else {
-		fsize = num_samples;
-		stb_rdptr_offset = 0;
+		memcpy_fromio(flex_arr->data, dev->stb_virt_addr, fsize);
 	}
 
-	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
 	filp->private_data = flex_arr;
 
 	return 0;
-- 
2.25.1

