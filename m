Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53565C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 17:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30E1C60F92
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 17:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbhJZRRW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 13:17:22 -0400
Received: from mail-bn8nam12on2077.outbound.protection.outlook.com ([40.107.237.77]:31201
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230160AbhJZRRW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 13:17:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goCN66BfmHAEzMyOx9QTglxkz63nt1to0Pz0t54Q/opQl3amjVa4LhhIjT7mCYfGfTyes0Ei677bUfe83SR8P00su7H1eVv/eymrUtnLpvEWwdIUKXCpqzyqMvIoSPq/piPObOyQJ7rh8wz6mPBryRf8+qQDYrnp86RY6vBCXpHe4VmupbvP3z7NoCs4X6ya5keGZJLl8TrRdbB9DDZsWcGpZHpxnbLouN+fuVoSoxrR7Dk0X2NMLsRtyN+77ggqRzGs2JpkvxpvDJzrnK07WyDpBAP8vyz76wBAnaAVItd/mXSnL1PxfWK7YzdNRENvI83vWU6ijfS1mvyrejJhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhd/YSjIqL9r2ZOypwufMbILDfsLV74k3WJksioIfmQ=;
 b=AMn6nb+KyNdV5yxzVTHsNHPfSwmJ2OrHEKjmAmfl51OUA/jbCsWjNOkWP/5Xq+Hv1jstoiHDkprIZJBMe5kAUFb57MAbVPkrypLLYvmYc0xfFBpyjyWetSqyBbdS0UZf1mSw6It9ME+lR8138XPAMliaAYVwsroSzxPIDP46+udOW6rPDoL22bBs3s6ub9MLF2XJGzL1zN6BoL2mmNe81SD2Rvqf+IQZ/c/9NNhNqX/IouOJ/s6ev/frwFNX2TEya6FAzL1RGNCMdDLRpf1/otNasgszcZiS3ZdLscJ0y6FfrZtBRzrOrSVZNALl3MMLCFOfaPUnkJLOCU5OVkRoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhd/YSjIqL9r2ZOypwufMbILDfsLV74k3WJksioIfmQ=;
 b=EWdRCeoUm79rN1tBgTcNprn5DJM3DBffZObtjLLxnufxSFDK58jTVuQ5wBvWr05lwK9Z82VYARnXj92gS/AlXXBkBnLa6f9eJn6NOeoENqWkqJP4ZanwKEeZxP/RoPFtKzVjrmSn/uzlCi06nwYB1IIM5nyYafAGvOfSIUK9b4A=
Received: from BN9PR03CA0376.namprd03.prod.outlook.com (2603:10b6:408:f7::21)
 by DM5PR12MB1754.namprd12.prod.outlook.com (2603:10b6:3:10f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 17:14:56 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::c2) by BN9PR03CA0376.outlook.office365.com
 (2603:10b6:408:f7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Tue, 26 Oct 2021 17:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 17:14:56 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 26 Oct
 2021 12:14:54 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
CC:     Mario Limonciello <mario.limonciello@amd.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 2/3] platform/x86: amd-pmc: Downgrade dev_info message to dev_dbg
Date:   Tue, 26 Oct 2021 12:14:42 -0500
Message-ID: <20211026171443.289-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026171443.289-1-mario.limonciello@amd.com>
References: <20211026171443.289-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d97963e-f79a-4075-9f1c-08d998a4221f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1754:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1754BA8387E6F0906C729F4DE2849@DM5PR12MB1754.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HLGSdVTXcMJ/q0y2N9VrrgFLNHI+JxNkHDjZ1HKXIEuhZRFxdsX2ZNSR5cZPOaEkXJmurm7wKbjSmUJ/NEUHwMtPUkAXrC+xJ1EY5bADogItA4naRMdHGclkfPmoECYdu8cp3Sm9B0/1eoLjEiBCJvZmCHlVCMFYLcLGVy8Sip+tUOAE0FKvUbGvWXny168YwiKrTmnOYgLRfHanRxMQqkd03nXUnD0WDorYzN88FC8/D+QL9AVh4eu4U+Vow2ODEV0vH+ZUJX//8VQ6TO4X5jL3mt0XunXoh/lklUKz2BHSZDosGLA5FNLB/U8dYsn5Blxzuooybgryd6ebW/sRhtZphYwtk5AeOYn3yT3o5aq5asdnOSQWmZ1uUacsFHllQu3TEY3l9QQZ1omffayobAv0yI0ejVQIDxv7VBJ2gDY9KNYiNvuwAQG2p0EDZZe5N9eQkk2/iPJ00bC2WAfJeB4iZCLZzD1nKHuZn9lV15vDOTm6oIIYZFnJ383/rCsCp/DBrQuxJs1xPQkKt9I8MVL1zhEOhOKlHhSVeUcJaXmJoveYS8qDNUV1C6VR8gyEguxkgqfVqK946F40fVXlKuI7k/a0luL6fp84k2SZZt6xK6Nl7g1GP8frA8EkS27V4Ia63k2dEeUWUDeSKRhyTPMAmjmhlVKrjali2qsYaUdngRrOkfdn2ZM/lG/QIn4IWmVm2FTKyBotuv1DqJhkpbmyf0G9svHjx9RzZkNGPAo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(2906002)(1076003)(36756003)(6666004)(82310400003)(36860700001)(4744005)(356005)(4326008)(426003)(16526019)(47076005)(70586007)(2616005)(6636002)(83380400001)(70206006)(8936002)(110136005)(44832011)(26005)(508600001)(316002)(54906003)(8676002)(7696005)(86362001)(336012)(186003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 17:14:56.3752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d97963e-f79a-4075-9f1c-08d998a4221f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1754
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For the majority of users this information will not be informative
as they've chosen to program the RTC before going to sleep.

Suggested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b8d77a18e95a..81f3b9d79f43 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -457,7 +457,7 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 
 	*arg |= (duration << 16);
 	rc = rtc_alarm_irq_enable(rtc_device, 0);
-	dev_info(pdev->dev, "wakeup timer programmed for %lld seconds\n", duration);
+	dev_dbg(pdev->dev, "wakeup timer programmed for %lld seconds\n", duration);
 
 	return rc;
 }
-- 
2.25.1

