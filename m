Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A98C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 17:24:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F036610A0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 17:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhJ2R1H (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Oct 2021 13:27:07 -0400
Received: from mail-bn8nam11on2047.outbound.protection.outlook.com ([40.107.236.47]:15264
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230044AbhJ2R06 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Oct 2021 13:26:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0zcBWV6fV0MrIv2LpXUjl8ljRpE1qy1GRfYkPKPdre2+N89DCCDv6x+A0rb+8q1bySDowonwIHPUTU78eFt2Wv3CWAo0gF3Vmv19/nLZKamwDjQP+yPjoFL2R7Ht7IA0IOslQYCRtpnzIQy0s5+Yc2AxDFPEJicYhamzgNsSMzb7hhKimvUQvBlBLGMIxVczXTdUKAZmhKC3ljp/H9VSv1S9BG9i28NWW5TioQyRb0+IajnUgWTTkZTNxCCeeaDLIVZLPA3jRVYoW+43k7Z4ByuL2brJFpJ8k2RlhzmK3L+UgWhaEwTLyAUVW6LdR89/9e9j4tREXIDAEJiU+Fing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U38hRrotluqqmKsx3sfLbDofZQKG3uuhJBhUGIjlquQ=;
 b=OjcOQ4F2nRqii4pTv0RKXqwdwSpMWazVeR9BQaH1BxxOfHp6lPwpLT4xhyksiX2OD8YTgF7x6di9z5Edff6i/gNmbDmm8vyB3XoGWmdlk3U0ut/LRKQEsY1IruCnWNymxHY+ARIk/lWFVfp8gtfOQsOZ4YfAdCVe9K7UYzX1CcZsYxCZbeOpRS0PGE3HVxVITCkm0AdRctwtez3+d+XONyD763chmmsMvN84RePxNp9vV2CIxxXhPb1mNBCXIKCfCY2Lq51rWkiVeIZX3/XIfY/OQLcEAyWETekEvdVgeH7vsaf9JITTXP2RiKRbDRIq0fL84/Gmnbj2qr4UJZjBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U38hRrotluqqmKsx3sfLbDofZQKG3uuhJBhUGIjlquQ=;
 b=raVOChslC1yRfGSp2g8lMjCz5PmX4Aktrj/Inf/wi7m5lJK6Lw8RxECClXSF6IC1IdcDkEm4h7Rq9ZDMincEo0uFmKaJQgomjfc7FI6cPyPcz7fEIg1dGai/Tm2/FJNqxSNZZNxpVjejDcmIU2J+oDNBNe8xFk/VeKYN3s5166s=
Received: from MWHPR2201CA0056.namprd22.prod.outlook.com
 (2603:10b6:301:16::30) by BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Fri, 29 Oct
 2021 17:24:25 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:16:cafe::a0) by MWHPR2201CA0056.outlook.office365.com
 (2603:10b6:301:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Fri, 29 Oct 2021 17:24:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 17:24:25 +0000
Received: from Celadon-CZN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 29 Oct
 2021 12:24:22 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v5 2/3] platform/x86: amd-pmc: Store the pci_dev instance inside struct amd_pmc_dev
Date:   Fri, 29 Oct 2021 22:53:03 +0530
Message-ID: <20211029172304.2998-3-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172304.2998-1-Sanket.Goswami@amd.com>
References: <20211029172304.2998-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d633dff7-9c39-47c8-f0d5-08d99b00f497
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:
X-Microsoft-Antispam-PRVS: <BYAPR12MB31767DDB0418A68F87A575FF9C879@BYAPR12MB3176.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LdNpIjH+3Y/V2+0art0YrSUyd5f+sdNgGjcyn3SCncjijMVXuoIkdlx5/VpH1bCO7r27tc2ya7bI79q0iWbdTubc+ZczrlY1PnBf3cp4K06bk/Hd0HSpHizZuBKI5XThMe1GLu8Babplmj9bl2EU2ixHBYYEkfxj12PUtGVZiCQT13oHaJdmnX68C7Xxxs4cphyzkmC9mfUcmGtm9+DTRvIq8g9aBIYcQdd+bZ/3tS8poxOPN83F3qcvM05NfO1iN0hwUOTXb0BAaQqdK/xhvE8wIntfasYIHsbv2MxKjDVSTKelsHv7zTJWK7o5lwaKTopBF96I5Q4YjC0FTTtNL1KqU13DBdX13YOrpHJWAerqPtMV9wx2vNGXHjEnfYazPT4kI+arTOL2j29zoR1o43Hc5Z2Czf3ndZ7id9DcviIoredkkgXirWZiIx7GR6LdixTG3vlwnZ/ed75C7UDCPOZsyvHuE4ucJpy2GJrd7/9OQ2wNj4SilRF00jbh486k1jskYS/2uBWs/2/Uf5VY8Zm0nQiqdvL+GJG4++DZNE4qU5zxJdpaVRX11QdkcR8+VJDAhu1/vqaspk3u7tbH9wsYW5qRZzLE2Ps2O3+c+Z2qAx7M7CyxICXOKnkhN7nprnsoxJhUKDrqUttGheESbZXpDMsKcrl4FkpkwdjTv+GXsB4igbyRYRsa6HYZLXUPx/BeV0Jhgj2VedYk92EhpGRC4WQIYQbgv5VDzK5hpiY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(70586007)(110136005)(4326008)(47076005)(86362001)(5660300002)(8936002)(54906003)(316002)(336012)(426003)(2616005)(8676002)(356005)(508600001)(83380400001)(186003)(16526019)(82310400003)(6666004)(2906002)(81166007)(36756003)(1076003)(7696005)(26005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 17:24:25.3970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d633dff7-9c39-47c8-f0d5-08d99b00f497
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3176
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Store the root port information in amd_pmc_probe() so that the
information can be used across multiple routines.

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v5:
- Remove pci_dev_put() from amd_pmc_remove() as its no longer required.

Changes in v4:
- No change.

Changes in v3:
- Add pci_dev_put() in amd_pmc_remove().

Changes in v2:
- Store the rdev info in amd_pmc_probe() as suggested by Hans.

 drivers/platform/x86/amd-pmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 9af02860ed59..ea099f7759f2 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -121,6 +121,7 @@ struct amd_pmc_dev {
 	u16 minor;
 	u16 rev;
 	struct device *dev;
+	struct pci_dev *rdev;
 	struct mutex lock; /* generic mutex lock */
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *dbgfs_dir;
@@ -538,6 +539,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	dev->cpu_id = rdev->device;
+	dev->rdev = rdev;
 	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
 	if (err) {
 		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
-- 
2.25.1

