Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92415C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 07:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7739B6323A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 07:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhKPHnl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 02:43:41 -0500
Received: from mail-sn1anam02on2055.outbound.protection.outlook.com ([40.107.96.55]:64711
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231274AbhKPHnh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 02:43:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F05MydmgBBfHXGEu1hhRxq1zuTdWmNd2QMDuX+jgjXfv2MVsHXBBZS7RARVDVli7CIBc64WZxqDcHrF1TWIGlCqHHlXsUCCTUCHeycc0thb4Pn5U7/6wG1k1iG7py0+s7KKaRh0ZH6Co/VURJEJ7dZc6MNFS7ejPGS22ZvGWZhZsQ26FX+bWt7GamTwpcVsNxt3pGZRFCP9gtLDhw60nQ+zU5+LGzzIVO7QR8auVD7TQNeOK2dtmdZNQcqU1bqGNOmuAWiYazdLvI1K5r7edz3TX3OquOgja3Ez0SGO+vqaHMaqPEYJykXYje3tiL+IaAR2nvCF95P1Mv8iwgmaYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urBnSfbdc16D5XU/KXyLWd4QNLvRHymYSWEL81CCNus=;
 b=DSWhMjcv8a1X4uh6bpD7NfaENU/jq4JsZA6QWPHpkVjZD5rNYE4gKZso94N8S5uCh6sE88xnzZv+9SZf4hE8CxhppQoX34cIk9gVbAuJZVT5djRqAvdsyfVFh0srIG2OOx5bZkDbZ2gJ/MoHpMmYnPfkAMff17pLY5oJpiJe2YZfFJdJZRw+jpJUYS+abYNQ6Kd1ixTMdRD6LK3zjE3mpIB9DVzkBDzgwmaK65wencPpGSNfw+1Zs2xXXbSI/FfdFtn0RQ7T9h3gF7dWe9vKP/pWsmVYNCY6ZAI9WhZEPyw6c7FUeXK2Ah/VmGNTkmVDM8gQs22glsT5HRRovHd4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urBnSfbdc16D5XU/KXyLWd4QNLvRHymYSWEL81CCNus=;
 b=vHapWYP4VWVZzDxRpgGd+Qhf7OiHCNQhT68MxA7V4g/+YOsxSjUfm2/AYxUHGH/xbK0cs9S5M5XljyZ5MG3fDUbY5uPnKkpctwry38vP9DAmH4mSVllWkSkU7FuFpz5IX7+pE/pzW8qcKoMov+vsLw7QygVWCDKsUCUr/GlEsl8=
Received: from DM6PR11CA0046.namprd11.prod.outlook.com (2603:10b6:5:14c::23)
 by BN8PR12MB3507.namprd12.prod.outlook.com (2603:10b6:408:6e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 07:40:37 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::cd) by DM6PR11CA0046.outlook.office365.com
 (2603:10b6:5:14c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend
 Transport; Tue, 16 Nov 2021 07:40:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 07:40:36 +0000
Received: from Mayan-RMB.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 01:40:34 -0600
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH 0/2] Updates to amd-pmc driver
Date:   Tue, 16 Nov 2021 13:09:58 +0530
Message-ID: <20211116074000.28626-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e1688b6-c46d-4778-fde8-08d9a8d4616f
X-MS-TrafficTypeDiagnostic: BN8PR12MB3507:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3507B4A2AB178B02747B41569C999@BN8PR12MB3507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 14p54vqmzu/rruRsUQDXRAhvZBlzbyjFJ8+5o0Vj5Ba/VSSFRlMchcTMBWXDw5ROvnFVe2B3FzmyXk9RgJ6aNMTfl/hdoU8S1BKVciHAtLawxd9G3Rzm6f2DaTHVr2BjJ+ndLCWSMcgeIWkDKHwsHdoYCKFjMBIp3qOlxHnIwR86AXJ3Yu0BOnCJcUhIMGAmeB9Cb+OQiiEedXQrN2tmg3VieZQvt6Sz4gPZH6bTPNZjK5gHq8raItAjH0q2UqmB44qmczdsxr1Z24FQzP0jlJwaGMQ5GlnLw/NkUOHMakxfYaNHCGMbHztDRRSa8OBZ6Jbaan+toal8i2KDy1QvH/9bH0iXmCXnxfmeBya4OPF7y0KYui3d2HXeJaHJ7FM8QCVn3XEMbBrJaMBDmKgWb03sVFmGXOfaw8FysGNsqH7Huaw0Yinc2mRSjFMlUvZmK7FH5z6GYBi+NxHhgap+qOFVA1EwvIUxLl4cGZDcaExK3+RosHpqdJtpdi6MpXcTLUxIdaA7xikvLl3PeYDFQV3Y2MICaXb7Tss6iGxpRjZa1CqiS7HVl7EBJ4VLoFAYYtncCbhhdw5SVqs4b4PqM+iCXvlwd04BXO9J9CmMfS1DZtQaKXA7PuVDgp15QA8x9lnvt9IsirKXD/FGBN0pfxqocVn4H7o5tnX/jWzKREvAE8K1Kr1BAwuwgngDwUTA4VH4gBuv+F3H48hWjyJECGEiMIgLhAYrDTL8hbBRIVc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(6666004)(5660300002)(15650500001)(426003)(2906002)(36860700001)(316002)(70586007)(70206006)(36756003)(54906003)(7696005)(4326008)(110136005)(47076005)(86362001)(81166007)(1076003)(356005)(83380400001)(4744005)(508600001)(2616005)(26005)(8936002)(336012)(8676002)(186003)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:40:36.8949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1688b6-c46d-4778-fde8-08d9a8d4616f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3507
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes:
- Introduce msg_port argument to amd_pmc_send_cmd() function signature
- Add support for Spill to DRAM on Smart Trace Buffer feature

Sanket Goswami (2):
  platform/x86: amd-pmc: Introduce message port argument in SMU routine
  platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature

 drivers/platform/x86/amd-pmc.c | 159 +++++++++++++++++++++++++++------
 1 file changed, 131 insertions(+), 28 deletions(-)

-- 
2.25.1

