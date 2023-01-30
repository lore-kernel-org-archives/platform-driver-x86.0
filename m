Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F044C54EAA
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 16:49:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235958AbjA3Qti (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 11:49:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234744AbjA3Qth (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 11:49:37 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB0C3CE36
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 08:49:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nROHwmZCRPZLiQtbhNh8OvWN3YNJVgjjybAVQEkOgpiKq8bdO0jjUTvMiu5NgnvevjmPG6b3dmgu+QAYCPT/VVYWrGRRT3ube4bGZ++AxwEgKPLaT9pF34feB1OXypZjSSGe1FSMOR1SsaLEEe8JXM1dW8/HMWn+z/5AATVGGYUoQUVMPcZWsrlToc9dPMkjD5YOF548C1jpSMooVt7S2o3SpLtxVCBg9KUfn8rn8UGlBkfcCWpky2PeJ0HuvDJPWRwvSsE41iesbnzUPLllrgID6fwn73qeqiEpeN/mtfePt0yKiR034xMVerGl6koBsjwBCiGGwdD6f3ih5rTruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/Y+r16Z+m770+meDvbsuTZSgunaeWVbfx+DzkfF8I4=;
 b=YnCpu1mLi+C5LrUnfRNnM1PGK8Zj1xlkl4XC3Lw3RBHSzbjMsjYHsrTr+h6XqNNImEFYLre54xfrwdyoTU+ie1V8vCH6f5LbUiZ5hmmyOxRTHA3bbdZ0RgPsLPaHWw5EtC82fbBnR5UyFT5Qq+bBLdnNxSZU/y2j3t/omzBlKYcvAFBUu84/sOIDdGnUHyJGfby0PeDQ/bR3DwqlJEGnFaP5NfMvZuoJpxjBjKHG0KtHpqUYf/MyO+4bE6DJm4OU/6K6o10Xy4SJJd+CAZxcbwm84Q8t7cEaVCGTwKbrQNLoqqXdhGzECbZwqff7HVs7rUNyz/rRmSVmAPL/V7+zBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/Y+r16Z+m770+meDvbsuTZSgunaeWVbfx+DzkfF8I4=;
 b=WL4ruevmr6m0vnlNN+ufMVgokg94bRjgcv+N3CaGMbiQH4vhQVHHB5wNW2m/MEhmX10/Y6YTMBlJq71lGFDk2SEJfQe/YJDwp3RyFU0VT7COLB+bObhcl2zd3dCa9+Q1gGC4Fw2l2BU4Mr6FxRub0STaN3mSifoKjKaiKxMAJWc=
Received: from CY5PR17CA0049.namprd17.prod.outlook.com (2603:10b6:930:12::33)
 by SJ1PR12MB6026.namprd12.prod.outlook.com (2603:10b6:a03:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 16:49:35 +0000
Received: from CY4PEPF0000C977.namprd02.prod.outlook.com
 (2603:10b6:930:12:cafe::94) by CY5PR17CA0049.outlook.office365.com
 (2603:10b6:930:12::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 16:49:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C977.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.18 via Frontend Transport; Mon, 30 Jan 2023 16:49:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 10:49:32 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/4] Updates to amd_pmc driver
Date:   Mon, 30 Jan 2023 22:18:51 +0530
Message-ID: <20230130164855.168437-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C977:EE_|SJ1PR12MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: ba31a513-e268-42c0-c547-08db02e1f7a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +NcUfO/v3c2USsEdn1sqqUuZmSTQFp3qEy7UZ3wEx820ko4qQxacPs+lfnyRcESn31e5731aamcm2GkZPKdnxHIvQNZu6+Psj4pgDWgoWVyGz7egAhLii5nD4ZS++bpE5PtBY/slpPmPY+BaPYFXtksxESL27NPKWYePy4pCLDT+t7XwWKsVLndW+glAJ7rIsvxJVXWqF9qPCod7BZt+kMesq19vB50DVBPzrWbJwJBhxCBlwWtDU2pkRY/PLJ3fpQmEyTd4E/Da8vZ/HvfZyh2XC534psN3RkmNxjH04QTLjxoPR5g897ehEYAXkLBQStClsCIC/E7VNA6WYw4NLdRxAsp3GotYb2l/0SI9/3VhCxElqwvWgnzkigua73BY69GjA9RbqI4XDZtJro6NT+M7l8cPNLu+PNdM0NmCJFGNP0Cqk6hfrxbpc3z27AJ+Vxbqj291mh7X+/dieH2Jv7oNO+Z+3r5VDvy+AQ0T0Se+7Iqqr9nMV15t3EtFEnN1tELm7cyjzJ1PyZ8gDip7zNTWYYrZZorcKYClq8CVYWg/ExzrwSIyUZkkB7w2v+/QCgfmKmKg6aDcf8CYMLw1BuCDvkb8VS2J9F9hNf+EuQbc9JWu/SIgnRse4hRc9z1t17nPMuCsIdkBNWXbvcE7Sf08cGZs+PfiGD4QduwUHCVPMNuOAMuKck8hcoZaW6KVa+OB1otVa0RXpyrXGd3cfI+eFY27NWjlzOXNrMtkLmY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199018)(40470700004)(46966006)(36840700001)(41300700001)(83380400001)(86362001)(40480700001)(2616005)(47076005)(82310400005)(426003)(336012)(36860700001)(356005)(81166007)(82740400003)(316002)(36756003)(110136005)(54906003)(4326008)(8676002)(70206006)(1076003)(70586007)(26005)(186003)(7696005)(16526019)(40460700003)(478600001)(6666004)(15650500001)(4744005)(2906002)(8936002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 16:49:34.7450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba31a513-e268-42c0-c547-08db02e1f7a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C977.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6026
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes:
- Add num_samples message id support to STB
- Write a dummy postcode in DRAM to get latest data
- Add proper debug print support for STB
- Add linebreak for code readability

v1->v2:
- Fix incorrect pointer handling while memcpy()

Shyam Sundar S K (4):
  platform/x86/amd: pmc: Add num_samples message id support to STB
  platform/x86/amd: pmc: Write dummy postcode into the STB DRAM
  platform/x86/amd: pmc: differentiate STB/SMU messaging prints
  platform/x86/amd: pmc: Add line break for readability

 drivers/platform/x86/amd/pmc.c | 41 +++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

-- 
2.25.1

