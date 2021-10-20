Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1CCC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Oct 2021 16:30:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 585B76138F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Oct 2021 16:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhJTQcZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 20 Oct 2021 12:32:25 -0400
Received: from mail-bn8nam11on2085.outbound.protection.outlook.com ([40.107.236.85]:51041
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229817AbhJTQcY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Oct 2021 12:32:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAm9EAWxifii0F3QBg/SQ9nWS2bllfzjE/ycuWCAaqTyXQFJO9JJqhkZiH9Ic3tlSHXKbXCks/xLYC6eSPRiB66cmcQA+/276HpGmEonVxAXpMxZzOCL5wlKcoWXpGcnyEvi1iK2H0034YGVNAiKD0J7a0pCSlgsfhTCVrsof5G+5NpLDUdKdUvLXvsUBuQurO3Sl+Pju/wJWnKqGMThJXEPBoqR2SeMvPhLgvMKODIJ2cWsPubSwuQpcE0FgANsD/LBsWtau64XdELxu/NkeHyPARS/xTlMGpeD4X7LDRbG7EiscbDAJNh6ttkGfQbFK+hUl0TcCeCJkqMF4Ln8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUxBWgP45RU91FOsBPrmF4Fxrqx2k2/PmtJFD06iKsA=;
 b=JDUaaUdzLQSYWUgNvYqBFDaXXydiCL4JkhUZMUFALxEC+Fmp4VmkY2XpU9Nl0RTX86aVuLQUoENoNDCl+ouyschKRMz3tzZOCDLSW2Elora53m3yIVh8MKGTfhmlj4CEHb4KXvDmHnQETfX4o3hHg2DW9RpPBkMOVEGhf0AitZYGqzobXZvcMHDZ4IaybeUT9zz/eJsNkIe81BFtTGgGdst2JKSKKu5VEv1UcTcpY8TBhbD3gzrlXwYCWg/CENGPwBJnV87elh842fGGZx5Iv0CpSZQ4U8pwpv6uqFMGjmMxVePXWfLLYbuD7pwBsTK894A+I6yHX9E4yoQ0g4GR7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUxBWgP45RU91FOsBPrmF4Fxrqx2k2/PmtJFD06iKsA=;
 b=V76GfHuNZxyZgKdidjmpqXYA73Qwsqy+6tDT6KZYAvak4VJygAICUAWIvI9jms1qEvGmwds/8jI9oVMpnvzMjyRNpvPKjYStZ0EYOyh8c1clf6D3h/8oK+gAu6vNc/bUH+xWgvjFKnj0Lo8sOoXAAYO9NKmtaVVwbeE4VE5oSgg=
Received: from MWHPR15CA0041.namprd15.prod.outlook.com (2603:10b6:300:ad::27)
 by BN9PR12MB5051.namprd12.prod.outlook.com (2603:10b6:408:134::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 16:30:02 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::7e) by MWHPR15CA0041.outlook.office365.com
 (2603:10b6:300:ad::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Wed, 20 Oct 2021 16:30:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 16:30:02 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 11:30:00 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 1/2] platform/x86: amd-pmc: adjust arguments for `amd_pmc_send_cmd`
Date:   Wed, 20 Oct 2021 11:29:45 -0500
Message-ID: <20211020162946.10537-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da11e1f7-99c9-4f5f-8dff-08d993e6dde9
X-MS-TrafficTypeDiagnostic: BN9PR12MB5051:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5051D56378FD85A7C7470436E2BE9@BN9PR12MB5051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WQsbmWQgl8fbMyluwpQZPORGagSFVa2nipvkjnqLkOPU96mNUFaOyOlxcAv5+NN85xmE2ZMZrjoQueKVTdU5iFTEnz4xAkbfnNvhJLLMz9AoTgYBX4A5bQBDJWoFWCxOPfg1K4RzdxOLYw0qrOqQu36OglJD60MwlDxVhGaXY7dFezPQfV61S2seat7yyi+eNZf1x4Ojv38LeSdLo826KFOTlbPXfHxfF5iiMc22j1Ms1HkJM1aHJIjP8lPmX8FhNGKda9HxHeAQT1episeq4hLWx/pJUC4oWjwdTDhrwamLjbldY3i4UaImkTd2bnE0d8jENsZL748cuJGQ4qKEYiPsdC3pIYlohoAkHu6HYp68DbUOe7Htzx8mllqpXQoPkhToYOmv2bUd8vaME3IqdyGv4yjMvwFbKQw2AhJKqCRD1qZBvBtef1X0u7DXLX4Ooe5kA6PkiWGdtmUyU4P+EGsFTVrQsSubCPvcR6Kml2VCUtcKbQISsT1oePFyLrEpH4EtY2eBX9uUw5PhUUHzJSmgLmDwy7sT+Wxzhfy69pnLyKEF+xKQHqs6tsn/dN4i+x3Ozc/P24U6hUb+4sgAalrd8gX554Bu+jgDB/i4EVqyRICqZ/LsqYY2rQxD4USyK8vSmEGKGFaBbQ7hJdOz9H6HYdtOxZhku0KTSIFycrM/gXub1KJV3khCrXmXG7bxTlGHvsKW4yVuCT3LRyE/COILTY/e29AzBXf7CnEO6r8ItDzAMGvPP2WF1ZKudaL+F/mZ83cQgYutYuqxDvfeHg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(316002)(86362001)(186003)(7696005)(4326008)(2616005)(508600001)(6666004)(36756003)(16526019)(44832011)(2906002)(110136005)(83380400001)(8936002)(47076005)(70586007)(5660300002)(336012)(1076003)(8676002)(26005)(81166007)(426003)(70206006)(82310400003)(36860700001)(356005)(81973001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 16:30:02.2928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da11e1f7-99c9-4f5f-8dff-08d993e6dde9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5051
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently the "argument" for the "message" is listed as a boolean
value.  This works well for the commands used currently, but an
additional upcoming command will pass more data in the message.

Expand it to be a full 32 bit value.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b7b6ad4629a7..99ac50616bc3 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -126,7 +126,7 @@ struct amd_pmc_dev {
 };
 
 static struct amd_pmc_dev pmc;
-static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, u32 *data, u8 msg, bool ret);
+static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
 
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
 {
@@ -337,7 +337,7 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
 }
 
-static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, u32 *data, u8 msg, bool ret)
+static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
 {
 	int rc;
 	u32 val;
@@ -356,7 +356,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, u32 *data, u8 msg
 	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
 
 	/* Write argument into response register */
-	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, set);
+	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, arg);
 
 	/* Write message ID to message ID register */
 	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
-- 
2.25.1

