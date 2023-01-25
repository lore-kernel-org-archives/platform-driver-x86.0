Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A311C61D9D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 11:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235233AbjAYLcI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 06:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235312AbjAYLby (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 06:31:54 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937C59EF8
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 03:31:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLtFeMbxlxkk02K1ufL+PR4eav832MGbYmP9fH9X1r3FONpDxHLm7S7QpQP1ne8KSv1L2fqagOCRIpeAgdf3A5u4V/A998VArC3ArCmxFZodqA5tqex3VqYc77GND/gG2iEkh2TXkVWXHpC15GXfLfMOdiBhRdzhkPYg8dyx88UM32nPzUazRkC6zgdskn+nW2L98B63X4Eoz2Fh2KXajhsRgt2nDctQmvTa7rFbYL/rideDMM+/mFU4Yy/mo7lHga4nVe1PEgzEpx2DkO9NRH4RtNlRra4c5SwfXE+K2AMlJtoNOgEAkYmdst6Q56BY2r9lx/6vuUKD6HJHNYuqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qu2kDZttZlJeFcdjBUeptWiErJu6SW6rTdUXMk+5/cQ=;
 b=LgO5O5S3J1ZViaILovErEgD/kT//PZseOirRLLFVJEOgdBBXbK+LxbXmztWxiwX5w4W0uqCP2ke2HlvB/y9y/hGpGFr/USrDNxl+/aCMkhgrqn+QsISxbx07NM1PnTvYz2kbklGIFvrvOSNY/UhHs1xbTJusC2+fSCRD6+qX0YKSnwGTs89gCzngjIXm3GcfWSbK8ZyZP+raDrBdL5mJtCEhlvGdk0PLFgHjNwfevj3sXa7ODeMCNAuXDjS32RFS7y/TZV06aVfsSt/vUuTWz7eCrXXVrkfJZDZxSchH4R4RHSDKkqfzevq1T15OHOCjZggTaJCZ1aeDksAKVF/4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qu2kDZttZlJeFcdjBUeptWiErJu6SW6rTdUXMk+5/cQ=;
 b=NqBsJCA2XLZ5AMtJH2nz5vHe9YHnoDwfV5asfRCV56GF4pEh2+DiQ7Api8bLal5td4xrKp29yna61DYiN5NnQ1kcudC8oXW4NW4Q/xk0b+JtCWFv7uz4+GoxnzMnj4ikX/kA0bNS9I3o9mjOptwZWs9IvdT+YKtkRy2lXUCeYVg=
Received: from DS7PR07CA0021.namprd07.prod.outlook.com (2603:10b6:5:3af::23)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 11:31:50 +0000
Received: from DS1PEPF0000E62E.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::67) by DS7PR07CA0021.outlook.office365.com
 (2603:10b6:5:3af::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 11:31:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E62E.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.12 via Frontend Transport; Wed, 25 Jan 2023 11:31:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 05:31:48 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/4] Updates to amd_pmc driver
Date:   Wed, 25 Jan 2023 17:01:23 +0530
Message-ID: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E62E:EE_|PH7PR12MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8a3def-b6dd-4192-2835-08dafec7c05b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WfxvNm64t12kAMWLkdNHsWPDt05hpc5h75V8AqN9ka/qYgiZ1oHU9Qsc7oIF7XbF7H2D8YBWZZDSIO+5Pa+2iRXP+HLjioKKPiTxx4oPdtQvKBnJR07b+DrV971RnfvOjwFsiMr4OlMtOG4jPgZR1xSJkHVDCeNoWSL33WskL8qxAsDja2F6Vml5auTI/2dwo6JjnFLHonr6Z70yloSoj7ObFOMwa7iCPM+3RypU2+4v2OdDIsxDN1gYgPl0LiQaa/nek2W7oidfgjEXK+0VxQDdncoioEtHW2vOA1oE2YEq8wvtl0HcAF9e1PN/OXg07dl7mHIQvTaIyQE8vLy5olMuE0GN5CnQhkQ+uG1c6Wnpx3/Mkod2YVTSj5Sm0UPvr/N86MyF908ofnScs8oUtfeqN5MhtVup3jxXJXLDzGwVurpKD1Et+q9AYVI+fFzs7EuIdyPGzMKQcvF0/XwtwBfQDt/L+dYnXQSTsvj/KzmLyU+qSCsmp955KBK7BuC/VPvPpkhblgtu0RyJhbYxYEw3eVLuMEECBuPM+S+HglNHerv3hg3EeZFLLusvFTXLBPEEkTkDalKyfRQUHFDAxkNG+JXbOE6xgU8zCLP4m0KINFLN3b2r6pkjBpxqK1d5kwXfjCzIPYJ5f7UwLPUsahlkfVUDwSul+nG5hyv0CBbyBCcpK0dDqRn5jfPJWV1Dc6gCylYVERmPWkCvMdKD8UXArxB3KRHjbV0LCH4Qck0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199018)(36840700001)(40470700004)(46966006)(70586007)(41300700001)(4326008)(8676002)(54906003)(36860700001)(110136005)(26005)(316002)(70206006)(2616005)(336012)(8936002)(356005)(1076003)(81166007)(5660300002)(15650500001)(4744005)(82310400005)(40480700001)(40460700003)(426003)(2906002)(16526019)(83380400001)(7696005)(6666004)(82740400003)(86362001)(47076005)(478600001)(36756003)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 11:31:50.4712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8a3def-b6dd-4192-2835-08dafec7c05b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E62E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes:
- Add num_samples message id support to STB
- Write a dummy postcode in DRAM to get latest data
- Add proper debug print support for STB
- Add linebreak for code readability

Shyam Sundar S K (4):
  platform/x86/amd: pmc: Add num_samples message id support to STB
  platform/x86/amd: pmc: Write dummy postcode into the STB DRAM
  platform/x86/amd: pmc: differentiate STB/SMU messaging prints
  platform/x86/amd: pmc: Add line break for readability

 drivers/platform/x86/amd/pmc.c | 43 ++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

-- 
2.25.1

