Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08DEC77B61
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 Apr 2023 18:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjDISy5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 9 Apr 2023 14:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjDISy4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2023 14:54:56 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D0330E0
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Apr 2023 11:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHmqRm0dABK5C2Mspx/0K3SAHqtqnGh5TxXHc7sM+4udzIW2/6V9wUg4+TBQ3Fl53SUivuPpy7GStZBY4t7+5XUq/sASVSOZJoF5cd3grPNoQeJ4OGP6cxVVvQ43SmSMQS+avQlWEmQEi3CTVLB2CGS5hXnjKomJdW1FEv6NmlaZm152NXHRdhoQgofhhNLwNvwTixBeKhWjcww90EWvCmFm1ZWZTdsfr0T9zTHihPRZvdGKs6rvBf1H33VCCuHoKcHKWQyFJwA4rMQnfJ5HdzRxBE75WkVfLX8FHQjQG0WxMfJQ49czyuKD2zmuLyjsxZaxj9KVGqP4gSt7E4XKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaRy9OqQDGeG4Fhn9PIDAf4ro5lrtIbRlbe4zTye75g=;
 b=g27nP9Qwwqaf0Q7LpP6KzEZNqAClEtG5KW9SXHJZengt5V8CaMoWqgScNL5L5jm46u0QYKmdilAI0f7htbo5dS+MZS/2D2m6hBt/RB2q127xeqGNBmagnJ8N/lzIKhuye/Q3YIvJioOCp7hhMwNAtJKyZtMzX8Hc+FW4DI10W9smzz+1Ftj5K66SGzz4NgzBqeUfxsrWdLaOszMyIOpJLBUIqLRL8y9YGxkD8WEPnzy7mMjqpSo8RKG8JWE8seK5dgb7tO2I3RXl3S8EmBvleJlCPePGmaihNUAFC5KLuPInswSp3oEzwDgL0xcX/ELquSKl6W83D3a5Ar3zaFrE7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaRy9OqQDGeG4Fhn9PIDAf4ro5lrtIbRlbe4zTye75g=;
 b=c1Z3teJ3y/LerdGnRZwNVyAxdSl6JL/OC/1NaCCQw5WK1VOVSzjsVYjbI0GsY2+AGNV/9QDSfmP1bfKW8xP0iRkfevt5mYI54fw1lmogvAwnC2J+202+yxDTGFSgQpxNsPBVb3X31sIqH5XGKNkytk2BkuJgCHd7UYy+EwE3xbc=
Received: from BL1P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::10)
 by MW6PR12MB8951.namprd12.prod.outlook.com (2603:10b6:303:244::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Sun, 9 Apr
 2023 18:54:52 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::70) by BL1P223CA0005.outlook.office365.com
 (2603:10b6:208:2c4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Sun, 9 Apr 2023 18:54:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Sun, 9 Apr 2023 18:54:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 9 Apr
 2023 13:54:49 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 6/8] platform/x86/amd: pmc: Move out of BIOS SMN pair for STB init
Date:   Mon, 10 Apr 2023 00:23:46 +0530
Message-ID: <20230409185348.556161-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|MW6PR12MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: 06373569-2765-43a6-1fec-08db392be69c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sXXD4hTYoE1NeJ33xart044sjYmMoeohQCrbrT6TNqB2MB+JWBQmgpy11LJ9RGtXa9fVl8Vr3efwbiIgLGPCB1/O/CSapaYJ9wfac4+zBprsiS+kKr94HhnIWs7uJFE6v8AJk5mVlI3dZfLBR7s0ovrlARA3dTzz5fy0iMW3J6v/Xq+gjWfm+1EFapQRhPtzRMbvmulsr+PWvheHVwRsCoBmec8wp9sMtmFzTcfmxj1IpWD3mX+U4jNa1PCuXcYlTGXmMKKHmM09GdubQfQhP/JvBc/WtvKWQ32Pcl+V1D5MyWTj3L6t0gtR9Zvpi1JfgMKKs1AQE94BCj8ocQLFHvlh3Lse/DGG9FjeS3pV/58d9LHFOHBRKA+vmyirLKYJ59p+AR1PVgXHyq+XtB5j67nskCrtQC4nQOjyM3RO0cie7CStxUQ7PvVV4lupucyEztNEKcHofaRY2SIspbaA5RktYulgb7rwV3cgeq9hEsKmFHMibMPfGnDrs3ndGHIm0wVjDdhxeiFvwn9zQUoZIrn0Z3aQZRDw9GT810VXSIfagBNji41dyFTi9YS4r7J5R/QUg6LA/eU4qv8wrxXnAx/Yo5UhQImr9wZkgu802hPsdTblkBVYJgPgutZvnRCDmQuo7rG37NaVO5RpRyFt/koKvPqiqHJ69SRwA2mWeYhxZ0AqOoKQjT7rpWbkZRyBiYQHRbtA2ItAtGsDqxrqkEXGkUdA9Q6uyZiPDX42l00=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(16526019)(6666004)(1076003)(186003)(26005)(7696005)(2906002)(47076005)(2616005)(426003)(336012)(316002)(41300700001)(8676002)(70206006)(70586007)(4326008)(8936002)(478600001)(110136005)(54906003)(5660300002)(356005)(82740400003)(82310400005)(86362001)(40460700003)(36756003)(83380400001)(81166007)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2023 18:54:51.7956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06373569-2765-43a6-1fec-08db392be69c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8951
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The current SMN index used for the driver probe seems to be meant
for the BIOS pair and there are potential concurrency problems that can
occur with an inopportune SMI.

It is been advised to use SMN_INDEX_0 instead of SMN_INDEX_6, which is
what amd_nb.c provides and this function has protections to ensure that
only one caller can use it at a time.

Fixes: 426c0ff27b83 ("platform/x86: amd-pmc: Add support for AMD Smart Trace Buffer")
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index b7f736e7cd0e..b14d068a6474 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -38,8 +38,6 @@
 #define AMD_PMC_SCRATCH_REG_YC		0xD14
 
 /* STB Registers */
-#define AMD_PMC_STB_INDEX_ADDRESS	0xF8
-#define AMD_PMC_STB_INDEX_DATA		0xFC
 #define AMD_PMC_STB_PMI_0		0x03E30600
 #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
 #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
@@ -931,17 +929,9 @@ static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
 {
 	int err;
 
-	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
+	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
 	if (err) {
-		dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
-			AMD_PMC_STB_INDEX_ADDRESS);
-		return pcibios_err_to_errno(err);
-	}
-
-	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
-	if (err) {
-		dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
-			AMD_PMC_STB_INDEX_DATA);
+		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
 		return pcibios_err_to_errno(err);
 	}
 
@@ -953,18 +943,10 @@ static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
 {
 	int i, err;
 
-	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
-	if (err) {
-		dev_err(dev->dev, "error writing addr to stb: 0x%X\n",
-			AMD_PMC_STB_INDEX_ADDRESS);
-		return pcibios_err_to_errno(err);
-	}
-
 	for (i = 0; i < FIFO_SIZE; i++) {
-		err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, buf++);
+		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
 		if (err) {
-			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
-				AMD_PMC_STB_INDEX_DATA);
+			dev_err(dev->dev, "error reading data from stb: 0x%X\n", AMD_PMC_STB_PMI_0);
 			return pcibios_err_to_errno(err);
 		}
 	}
-- 
2.25.1

