Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B2EE95A8E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 14:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376702AbjJIONZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376431AbjJIONY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 10:13:24 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7AD39D
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 07:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2cbMSln7uR8ICgFEPorxnZOL6SU8ptZdvm3MGeXfTG18QRh7IRn7rExDN4nVkVguc8Mib3/5ZZv9Xc07v3CnBvMqGn17e3YhQsyaGuFAP59cKr8qAjqsU32JNETvllaodSlDu9y4n6SmkcudotfzsTt1aXkAF4F6P97xrQvCtJqKnEzvGjKVIlGcLbYONHlZYNnmpDWVymyKRuCqS43Af/76tXF7a8OLbMWT2fWg9pEQgkcBsjBgK6sfyUPr3MtCXWsZuP+bRDsxNTXYczz0tXSbe8QYuOhUCcFyWfs0FvoLBa42Na+cg/W+76A8OJJvwaUAS59MboENZC8AmsuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGVzcANdGplGZd1B9w4bK6K4PHMzcIYuWdWECQiNd8A=;
 b=SSQA8WQ2SDYDsUXP68dgsA4iEEIXTBUJuGMqb5if9lTKzHcDUs+xGBXQOpX06MMjfuEGaVHInC2pA7L4BJpnNWJV/Y/CBdgDg2ncHqreU+uJo6Rk+y8jndDj4C0iECjP//bXT7D7Wrs6bAo0wo4BbHol0X9Wm6LCZ91t9e8OGvcJ9R78NYc0U4CuKJJ2B0OtXXfP2MLBQorIrfMyBjfls8tXlSVP8tuwXHmzQBUFYicoToQ20iBP1SVaAASUr65BTbmeRCOnVhairlt6kvPtyH5QzOUi58QdqtDgq4H5olt7QuHc9xvARwmPe4rVsHjKBJai+ls5xtxAmNqcEplaeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGVzcANdGplGZd1B9w4bK6K4PHMzcIYuWdWECQiNd8A=;
 b=dkY9HR5LOfymRUP1N2+PLr+xxZnUb71xCiUqsrg7NyvwqqKBlBxZ7cUddq1p3M02JRVzt02IBBqfHn+YWCGP1nHEpl4tQofIBZuAUrODuBHh+d7KIHGzDuAadPDeOUBv3Uu4bk4+N1ICsMN4QpDrlQdL0pM5C8bLCS7OP7+pFJA=
Received: from CY5PR03CA0003.namprd03.prod.outlook.com (2603:10b6:930:8::11)
 by SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 14:13:20 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:8:cafe::8f) by CY5PR03CA0003.outlook.office365.com
 (2603:10b6:930:8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Mon, 9 Oct 2023 14:13:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Mon, 9 Oct 2023 14:13:20 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 09:13:17 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 2/3] platform/x86/amd/pmc: Handle overflow cases where the num_samples range is higher
Date:   Mon, 9 Oct 2023 19:42:53 +0530
Message-ID: <20231009141254.22114-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com>
References: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|SJ0PR12MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 77fadac4-bed9-474c-987d-08dbc8d1e418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9nIekYUwvdFJXSjvu2g1XgCmgbWmLzURv5f9Y+z6S2aiLliad0te64MRwYEWqh3OZ7sQjIwQXM/1PF/U+bcafsKO25TPQGtHuQ9McatEUwy6IJTBw+GBPlVNf9bz/6/9fco5z/al061SZL0Cr9hNHiRuVCWih8K3jVsd20erUh/ESNEKtmk7dU4bN2iYiYA64+YL92P6vG/7Zz9F2Ltg5Quq5C7KREoClt/BfmUMsYEnZ/tUbwlu4tZ7zFiyO0TERfTUeSsfsmOYk4O3iBX9QST6yASPLLPqWw0p+KljTsysryRTIt9S1vbwnCFNd1fmJtcj9tz150sdi1DZ/XDCMAGzcdH0kIgVsKio5i0moHBY9TrSMZvndhjFadKOdySffsaH1Q0EkLbKnMU7bGm6JPADrsP6sfXt6unoyjBRqO2C8vq5S47uYF+neoxJbRxYQQishZZifxEV4RYIFPfS9SGJ8/TOOqPXQMuefb1h/Jce1TPc6u8wd7do4V0akdYr4NUNBAc8bCQtdD0B48JLTUqyqn5ytIJYqsv+a98XhNEx+RqagGkGn9CZ4rA643uRjoRlOG47fPJkEdYM7hP66g9AuseBM2DLiKIkYNO6iQheOlPTLBrNdHDSFKWqA2M+lTiJxGgJRxn3zCv8oddmFMAtuIDwyr7McZX9nkW8Mf717tby4/DK0BYQEGRseGL1Ofh0lYE/PvPj3PtZsSEEsYQGDb43DCt1Q7axl23SyL1bIYiae08qesLazZWhWJA9
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(82310400011)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(40480700001)(16526019)(83380400001)(336012)(1076003)(426003)(2616005)(26005)(47076005)(54906003)(70586007)(36860700001)(316002)(110136005)(70206006)(8676002)(4326008)(5660300002)(41300700001)(6666004)(7696005)(82740400003)(478600001)(8936002)(36756003)(356005)(81166007)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 14:13:20.2500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fadac4-bed9-474c-987d-08dbc8d1e418
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6855
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
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

