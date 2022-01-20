Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFFCC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 Jan 2022 17:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiATRo4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 Jan 2022 12:44:56 -0500
Received: from mail-dm3nam07on2073.outbound.protection.outlook.com ([40.107.95.73]:58838
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232221AbiATRoz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Jan 2022 12:44:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zwy6WIIv6WAa7U8n2rxEN/wpTYYFV/N3jKQvfmQVzhjVGHFHbNBN+Xko8HX15MVA6fpGqkZVWPRD8iup81tvl+Rb56aHIOyWy58xB1E9zSnG9/DVT0p35/WbmKelPGI6nlJ1NkpMgAp+Jvwe6DFi0APs+O+4JOCb+L85pMqcm2BHXxyRyR/e7Ng0RJDzGylrU0RRkLcSRC+u9a97ovewIpapxM50IptFBSoFsOhd22Nv1IGLuo9Rz45/GjTtYWG85J52C1b2ebR+wSWqxoQ8imbg/d65cUuit3Dkbc+1xe7BHncQE/B/pl1aeXK/8GieivQ7XR+hbJjuzu54XBt3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+siujHLVZ0/+7BvfR/Y9zkS3J5vExtaiTvZSO8OjauI=;
 b=OGsXIqUE4yCrdiegPiR/fUonhIfhz+TWeP6nBgYls8WPGAZR1qaQmAVMokkXPN4vd1+MCNJlcgkHk3ZoGRNrvTCGJ2zifJK/VvRX8qgKD36s0FgscAGwTYQJhPPuQbJsknixybQEVS2wzl5pintat0oGQbibGl0vnI46+B+QABqOUWEG6r8t4+wVZPiDeqJBOMOVuVh7Fs9IoU7wx8caGpbZyq6PPdcEa9bovycFFth3jFNHgFmmpsRDVGgxfhCotqJf2RCE1/B5fVmJr1q20SGL/Rp6yYrYPhXE/p6X9pDvJp2byT6TmD+wFIHeBK1N1vT776tFprIwDtfrWGoJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+siujHLVZ0/+7BvfR/Y9zkS3J5vExtaiTvZSO8OjauI=;
 b=mTRXC+4a470DmINACn0fk5MCkj6aqFQi8Zo9RVW+HYCiY+nv+e8WHrPSnYdduJoavbVcojr/jU9gOIQJNr77HbEky9QfMEwRUxGXMUufseaHn28BTjKYTAuBYhrOoEmK8ZzLMsR/qBYHLre4g+PpGi130tC00GEKSNqeyyTNqCw=
Received: from DM5PR20CA0002.namprd20.prod.outlook.com (2603:10b6:3:93::12) by
 CY4PR12MB1477.namprd12.prod.outlook.com (2603:10b6:910:e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.12; Thu, 20 Jan 2022 17:44:53 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:93:cafe::d3) by DM5PR20CA0002.outlook.office365.com
 (2603:10b6:3:93::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.11 via Frontend
 Transport; Thu, 20 Jan 2022 17:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 17:44:52 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 20 Jan
 2022 11:44:51 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] platform/x86: amd-pmc: Correct usage of SMU version
Date:   Thu, 20 Jan 2022 11:44:39 -0600
Message-ID: <20220120174439.12770-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62d3b1c4-8bb6-4d61-fb38-08d9dc3c9061
X-MS-TrafficTypeDiagnostic: CY4PR12MB1477:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB14775B89338005196367566EE25A9@CY4PR12MB1477.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SxQxKF20bROy3V7L3caHqHqymVAOruiMzUB2DnadtYOWrdoxCeYhYONLKO88hKImVgnWo0BoBXNZIN2ilJntJUIvBBCF74Akt/NJWbK70Ve9y3QtvxdGL4bskZdpvBkXwt97X++dHwyEiykUjYL8Xvn6HEIUo0se/wbx89NQPUS1X5uNGjIYclXCna095ghZd/rryLb4XU0K4S+CP0hBy7+5uayvgCovG/BBdASaI0BNO2KvbZ0f+bCEkGwziPa/cqAcbllcU2c+IDtRMAvWKpVdOVJzOYw19iHN/APuqMY0JivyJRTApEM7oHO1VmyR4J06gwNI1jx6hRsJNcWPmP82hRp3icIsHUTxiUQSZAvRasMoe0GPy8sytV1IwDE/fFXH6JlJwv3xrumeZ4LlKRbOKilbLb5LL9K5dfexkyj09B0oTsVExUyHnI/PxsHS2PohCd2qOeIuB4gZ1+n/qeRjaXoknnsuJbiyQ+h7EK2ZzjEQ/rbaIviYXZAkfL1WawreLZKOZadw3oVdqpCuw8aJTaozOkrn63tpHYaWG5sSbEAAzlQ5M+NzjVrPQN/PqkfCooWSodBpMAtU4nZNKOMEfA9UsrUAPRBJRPQvbBCElvqUV76lX79GX3rzbBIHob98APZdTNm75FRNCcFHc5ouFSMSodCijb9W94vGn8WG5zqzVK8mr3TapiOPHuBoLkyAzbVI26VhIhCIRtw1J+na5ZOWratGXolbeXaGtVYvNrcNKhfSRiqqdd6I0oICbPnTa7dkrLNYFu6GnHd/mawN7RyT+hKBXLEZdVh9iUs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(1076003)(7696005)(36860700001)(70586007)(508600001)(356005)(2906002)(82310400004)(6666004)(8676002)(2616005)(110136005)(8936002)(47076005)(36756003)(40460700001)(966005)(426003)(54906003)(44832011)(186003)(336012)(16526019)(83380400001)(4326008)(81166007)(5660300002)(26005)(86362001)(70206006)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 17:44:52.7187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d3b1c4-8bb6-4d61-fb38-08d9dc3c9061
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1477
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Yellow carp has been outputting versions like `1093.24.0`, but this
is supposed to be 69.24.0. That is the MSB is being interpreted
incorrectly.

The MSB is not part of the major version, but has generally been
treated that way thus far.  It's actually the program, and used to
distinguish between two programs from a similar family but different
codebase.

Link: https://patchwork.freedesktop.org/patch/469993/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
This change also has been submitted to GPU driver.

 drivers/platform/x86/amd-pmc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 06b73d5c928f..c9c4db39ca62 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -124,9 +124,10 @@ struct amd_pmc_dev {
 	u32 cpu_id;
 	u32 active_ips;
 /* SMU version information */
-	u16 major;
-	u16 minor;
-	u16 rev;
+	u8 smu_program;
+	u8 major;
+	u8 minor;
+	u8 rev;
 	struct device *dev;
 	struct pci_dev *rdev;
 	struct mutex lock; /* generic mutex lock */
@@ -180,11 +181,13 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
 	if (rc)
 		return rc;
 
-	dev->major = (val >> 16) & GENMASK(15, 0);
+	dev->smu_program = (val >> 24) & GENMASK(7, 0);
+	dev->major = (val >> 16) & GENMASK(7, 0);
 	dev->minor = (val >> 8) & GENMASK(7, 0);
 	dev->rev = (val >> 0) & GENMASK(7, 0);
 
-	dev_dbg(dev->dev, "SMU version is %u.%u.%u\n", dev->major, dev->minor, dev->rev);
+	dev_dbg(dev->dev, "SMU program %u version is %u.%u.%u\n",
+		dev->smu_program, dev->major, dev->minor, dev->rev);
 
 	return 0;
 }
-- 
2.25.1

