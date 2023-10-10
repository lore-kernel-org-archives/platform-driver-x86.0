Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD92CD8C9C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 14:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbjJJOu4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 10:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbjJJOut (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 10:50:49 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B87FB
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 07:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVHl4UMrkY4oLuUhDvU2+DgUUp5EoI2EY8h51G81K8SyfKMSNwS88b2DhrqkkQsl9HV4BXjdR92vMxNlGJAD5jUFJifRyrAspLI3mez/Lbse+lH1B+MvJBbZ0rY1tkdaw6mBFq1wzkuXJip5H9nAJTQrAaz/xCzTSQrALvWGv/UcqUZDdnlFCYC2vH/Lt6wosG21Wljs+k1I7ILRQhArE4Csx2z0wzTKyMOCmQpX1GRiPkj1Aukd/nEdQQLYpBV18WdkYfY5jUr7SNM7Hg6IZfGDwTkZN0YwqyrqofqcsZzqMM74uDz0qi1typd2/cA3AfAezSOv4pzLSgw1CDx04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECPdvIAd0uxE7XigW/bUUoSdua5hGv8kmyGJc9fa3Pk=;
 b=nbU2Iv2+tg0WscRqwc3gY0SXIQRPKWW2y9R6i0MSpXo5kVmaIgHbRV1g7I7GDxOz9EXpcCbz/OoFEH7qvncYWadrjM0/dcl0FXHTa2XzC/PI3JmArQfF7wDZRKPzAGtLBcwflZHVFdEq7Kvn5XuqzWH9+TEpBJwHsw2oZ6vRMAp6DRQTha+0IMtc05xcRzsUorzVLSArTQRfd66irXx3ywsOj94MG4gCJw6SJsQxlcFJg1CIEd3FHPJdLC7dFajujvuXTQajujruNpY6D8onfzhs7swsFkkCvhCGxtXidAUMJWmeK1YFr+tjNTyu1V0UY4mVvZF0zQs+VeBBjF/+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECPdvIAd0uxE7XigW/bUUoSdua5hGv8kmyGJc9fa3Pk=;
 b=ZF7KeCXLts04oI98bQtifmEJsT4CTb9gp+KN94n0mGqirKg8j2PWj5HxuOP5wUeMW8KszxZ8h2phDhcRbLozdNqNIcxgBd72sY9FbuMxZOfKKMIr0sqBNF+bKkRNPDOk01CtXo6lmCrAOlybFDCUqN6xOE2M0HNCdTMrrQ/bUjQ=
Received: from CH0PR03CA0002.namprd03.prod.outlook.com (2603:10b6:610:b0::7)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 14:50:41 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::4f) by CH0PR03CA0002.outlook.office365.com
 (2603:10b6:610:b0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Tue, 10 Oct 2023 14:50:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 14:50:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 09:50:37 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v8 2/3] platform/x86/amd/pmc: Handle overflow cases where the num_samples range is higher
Date:   Tue, 10 Oct 2023 20:20:02 +0530
Message-ID: <20231010145003.139932-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010145003.139932-1-Shyam-sundar.S-k@amd.com>
References: <20231010145003.139932-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3a4cfd-6bc4-4c42-13bb-08dbc9a045bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b0wqiI98PvOS48pkgrK69fcLOD7hO0rU/XZsjUSTVb/nGdTrmkNEYdYqgSc4zhnzQEh5Mhb0aruVS3EFOZ8dMkZcSm4llIEPKbD5eJ7Vr+hoAQGXfEVcgiaAGpKIFWUIHXKeZUAfzeVShNVyYlVtVhB5qRlVu5YvsBF0bT9J72qPB826fo3UYjItD11lfkd2btj1RxulbWDqksuBQv+pcBDQVxPRR4dvdMY3OTEZLptV2JGEDsk5Uzt21g4ZxJW013wmXlHYaRI6M2f0PKBemadBhBA8OliVUWmpEPmOnYuLXkhRewhkzpFxF7rXQTS/KsLub+VOqU5Gw6A0ObTDNBXuxOByeaWpaUdTxu/ci8+74naq+xGq0fbJJwfM5xp2wUpqWYfl9p9ndMXouDBwU2kIsx2n3175zWjSMmx6eByf33F6PSISiUsdFoG+K2LpRkpnx4W0DcqNmrLtjnTEIS7etHNASYgAWSDoq79smfQn/SLAXy0cVcRUQH0lCUHAi1p3R6ZVF3gN41r9Z1sA+7rJI+IZUlBseAe7O/ic3+e/Gk5OdgynRgqBh3sqHoShvEgvdONMY4I3ix/HhCeD3yZTx6lJSVFCAr4XDqJbM2aqXLfJl069iZ6Q6s+/aYzn07yd3IlHjwaPq/vp8X8YCvCNG9l4MUcaGHooYxd2rFtzRzrbk+RAeJfM0tXoXnQhVJzhrolh+tLsdZlFCwKAtAqvMRwGmbqUHx4ZoaUhzHWEy5AAGM6xc1NNBwImIqrA
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(82310400011)(451199024)(186009)(1800799009)(64100799003)(46966006)(40470700004)(36840700001)(82740400003)(2616005)(7696005)(1076003)(478600001)(41300700001)(2906002)(336012)(83380400001)(426003)(47076005)(316002)(70586007)(110136005)(5660300002)(54906003)(70206006)(8676002)(4326008)(16526019)(26005)(8936002)(40460700003)(36756003)(40480700001)(36860700001)(356005)(81166007)(86362001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 14:50:40.3907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3a4cfd-6bc4-4c42-13bb-08dbc9a045bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148
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

 drivers/platform/x86/amd/pmc/pmc.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 609bad470fe3..e190ec5a602f 100644
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

