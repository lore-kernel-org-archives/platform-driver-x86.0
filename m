Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F313EC48BC2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C699D61185
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhFWUEf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 16:04:35 -0400
Received: from mail-bn7nam10on2068.outbound.protection.outlook.com ([40.107.92.68]:7137
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230083AbhFWUEe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 16:04:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWxHidgtjaGKJm62T1wvoEet7i2JM2dc5E0/XVnekdt/yI5Tbh+bvOz/Bsj96a6Q0Nq6WqQ+FsmISSRoFXyQ331dmBtE6H0haTeAxEqmUnvDsYkR7sV7McqGbxkHF9d+e++/mLbqUSB6krjkQr4d/UgrXWoq1GKn3+VimAQUxV/1M7TDpK2y4375it26cEpug/WUHWl9fRP6rNOAiNXOUPqT746VVC94df3KCaE1aX5cTNMawAAcl45cE+M9czu7a+gyBFk9sSHfEvw3V+IRkpE22XBB1EUWoBuYzIHG/PJlQomYV/xfSp3PIGvLuQcWVGzxvvAsLhyTbdghk6JW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/YbEc4E8mb/h87QjDzqoK3mSVVP/iUqKe5RWnBx53E=;
 b=en0PWumUnemrOFpxJx0D7pJfqPMXN0F4UpNcr0QfU4SoTsAxFf9Yph1GUSdmhKCOs5KB40NHR2dMkrTqm0ckn1D64wYIbL0Z6q62BFAuWBM6GTdyvolAmBmPdLLVbqemHa9JuzIXcrFzv4DikyWX40cJ75lhydpJ79X873NMmYMgXL5nbhyjUch+JTxqPv6wdE86VaXTcwVuR5oUhSMo/BK7unmnhkb/vsjSvg9NuyLNllfsNDpbBG6salL0lwrpt7NC0TbCZFWBoLmjciaoRB0B1BEQvHufanvvxMhAxTn8FvewGw3EHu2KPcCXQo3Pcalr9+ZAb6ilW4buRrQQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/YbEc4E8mb/h87QjDzqoK3mSVVP/iUqKe5RWnBx53E=;
 b=aNgBqJC+0/zgIwnxXQXwHFUdHrxk6rORWEDVPqGu3jGJB/MdkB6NvikHFiquHW1Qwf3tankXQ6AgX3N01iIEBQfkF1Go3NIe6HtjU2s7J0dqrDMo0MPFADAtTgu9WBu0a2wVBnpPRLtLFL50y37TS0azTymoDIznk9jlSOohsjs=
Received: from DS7PR03CA0145.namprd03.prod.outlook.com (2603:10b6:5:3b4::30)
 by BN6PR12MB1682.namprd12.prod.outlook.com (2603:10b6:405:4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 20:02:15 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::44) by DS7PR03CA0145.outlook.office365.com
 (2603:10b6:5:3b4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Wed, 23 Jun 2021 20:02:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 20:02:15 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 23 Jun
 2021 15:02:12 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/7] platform/x86: amd-pmc: Fix command completion code
Date:   Thu, 24 Jun 2021 01:31:43 +0530
Message-ID: <20210623200149.2518885-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
References: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e88b0e32-7d80-40ab-870a-08d93681cc14
X-MS-TrafficTypeDiagnostic: BN6PR12MB1682:
X-Microsoft-Antispam-PRVS: <BN6PR12MB16829ED70C29816EFD07ECA79A089@BN6PR12MB1682.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YTMgDyLT8tAO7ockGM0ARpp5ZvOs0Hi8kXMHqtExeL1iWXUFcpt0wbJCn/ky6zjZh7cx0W5Hz00qPGBXr6iDtxcTnk97pcPLda7GZxN5L9IWWrfETo+elIZHUBX8tf3o5MMzwndCfgs91IZog/99X9wj+kGuuXSa+udFmXrcJRvetlxN0JAhkgoS6FZ0dcuGCE3wwcaU44zOWlvxGFcm7yQ+n6jXC6TMQDFyhkhxBGKEmP1TiXAw2omdEj9nLMFt33Jg3nY0vBoGLvEsIzpZg3yB4TT8tpGfXQaWH3T1KmkRhcFRTkyiOTBBZnVYLsj4lZHBUn7bfzKQgNfUw2VGjEDgXB93a/KvgEcg36WO8ucnEt9Be0Uyi4FH2EKOWDvhyOBdun5AFkX2Ay1imtG+aavrbqvJucU9dOHNUut490uF2wVqWFsTri1VmSRLIc1daq6ot1Rg9QcZkQkeBdpVwhIN4fBOJZGSnQy7Xz5Z3cH8JwRscTFwe9w88OkL5WeWvbLKbkwxcAmS3V/bxw2wXeiipptH49QW11sE4wP4TKu7iHOHr9z+4Cp7d2RnssH9bbPP3FW8mpL9JeNVpYsEy+QIfRC36Om9i45YZbGBPoUpur/i4Xqocrv1tUO2l050Xdj0zD+F+SS81ZBxtMFa7yOBmpIY+LBfrsyG0hm0r8EwFcFLZTxKKtHhHix2rp5h
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966006)(36840700001)(8936002)(1076003)(478600001)(5660300002)(2616005)(2906002)(81166007)(186003)(26005)(16526019)(36756003)(426003)(7696005)(356005)(82310400003)(86362001)(336012)(6666004)(8676002)(36860700001)(70206006)(110136005)(4326008)(54906003)(83380400001)(47076005)(82740400003)(316002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 20:02:15.1054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e88b0e32-7d80-40ab-870a-08d93681cc14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1682
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The protocol to submit a job request to SMU is to wait for
AMD_PMC_REGISTER_RESPONSE to return 1,meaning SMU is ready to take
requests. PMC driver has to make sure that the response code is always
AMD_PMC_RESULT_OK before making any command submissions.

Also, when we submit a message to SMU, we have to wait until it processes
the request. Adding a read_poll_timeout() check as this was missing in
the existing code.

Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: no change

 drivers/platform/x86/amd-pmc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b9da58ee9b1e..9c8a53120767 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -140,7 +140,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 
 	/* Wait until we get a valid response */
 	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
-				val, val > 0, PMC_MSG_DELAY_MIN_US,
+				val, val == AMD_PMC_RESULT_OK, PMC_MSG_DELAY_MIN_US,
 				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
 	if (rc) {
 		dev_err(dev->dev, "failed to talk to SMU\n");
@@ -156,6 +156,14 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 	/* Write message ID to message ID register */
 	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
 	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
+	/* Wait until we get a valid response */
+	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
+				val, val == AMD_PMC_RESULT_OK, PMC_MSG_DELAY_MIN_US,
+				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
+	if (rc) {
+		dev_err(dev->dev, "SMU response timed out\n");
+		return rc;
+	}
 	return 0;
 }
 
-- 
2.25.1

