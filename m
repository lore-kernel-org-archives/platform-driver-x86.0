Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06AFC197A0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Nov 2023 17:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbjKPRCG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Nov 2023 12:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjKPRCF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2023 12:02:05 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4AA1A8
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Nov 2023 09:02:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e00mwlV0gyBxk/8eXDob6NpSu2I45UGWKgGwhxx69rKnDpdhxUT3V2tWWlpnMcY9blQmpYpIuFmWGFjftRJ+VCGse8qQFObVFBJVZKzbCPENu+3SDm/8MBEp67bcu7ISsZFMIWdSC0h90iTwOrYf+Sl1YBwrwz9Q+cJKRccBy75JUtpye+EPbH825xPg71hAXcCPXMusaUls8ApJ+LJwMggxkLmSVEHixb5+SbbPSzvf8ooZ0mmRdEHZnACMXMr9EQrKWyaVl9sUNasDSygo+HhTvpgzQyaaD8mJBER0XlguptX1nre9lBgs40mB5TYjI27lGVvDPW7fUUN+QYQZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqpqx+uV49i4o0Xu1nD7mc+IArs74QD7gdh0mrD1YX4=;
 b=MyxMjB5DuhiE50w8kN6N92TYrkJ1JTeBnALWjY5ttM3oD51AJkTWRiSkw0cA3LJK+ceVM8SRQVdaxLAI3LKQBkTrPNGtad9gzJ8n9HgIt6LgZUf0vdxjbxS6wztTiNSXaDmNJxAos0quH87FC9Yt9kubMuRTZxHAUtZ/lo+WkbdsKAo53T+oM+1KLIju+waaC6XDE7W/lLt8VDF6SxEUYZSOQt2LyNksuqp6t64A9295yPe7y/eZ3/A8gKF3KrMaMnDOY9epGRubVUX3B+1w+MvOv48aeMMbJubez3YtmilA/J54eQrrRknkudtEkhLF4eZamp65Ttp9+Pp/PB4gIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqpqx+uV49i4o0Xu1nD7mc+IArs74QD7gdh0mrD1YX4=;
 b=ZqGqoVrKN+OvSkq72LMyY5s2XKU8Q1TtRhrS0zXqCgZLMW5sVGj6ZI2oZL0FnaXsK85dpleS1avoIUWmHADghyZMLEibPFXTuuR8fr1p8oewEkAv5cNOdr2PQNqDlJbRhmvjb51CHLFEqrLYE69T1xSf/n+rX2kB/3LU5X/Br7M=
Received: from DS7PR03CA0117.namprd03.prod.outlook.com (2603:10b6:5:3b7::32)
 by DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 17:01:58 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::6a) by DS7PR03CA0117.outlook.office365.com
 (2603:10b6:5:3b7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 17:01:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 17:01:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 11:01:54 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Hasemeyer <markhas@chromium.org>
Subject: [PATCH v4] platform/x86/amd/pmc: adjust getting DRAM size behavior
Date:   Thu, 16 Nov 2023 22:31:21 +0530
Message-ID: <20231116170121.3372222-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|DM4PR12MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 74bba2f2-d272-439d-862f-08dbe6c5be95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BTnZTpuSt5St12THvnkanEWphBka9kbqCNEiNFI+GTvHbTMuy0J+hTnjF5pQDfhuK5nX/l4RxOFXtxZuOzwtpIYoOey8LBZUDP6w08olO3azJw5xSbVuBtOvpPckMEGxfaOF5FfKHXOBwM/jzwHrv9gr3glJ0QOTISfb43hf0P+1Fe/8lPRIT8UN3RnFBARhdrRq+o3SO/8+OgRAI05hyGegWheVPYB3GczdOU507k/KUWfqlsoAXn0b2AQD82+AKlNnEMxli7ZEeyP8O2tDxb7dKelTn9CUNIy2Q7j6nvL4/Dml2Om/gI2xSefLfMswCeNfuv1tvLqJlHmEA3yVZ1ApyE55qr6X9e+kHjfmO2I13JVrZqf2LvPshRA1g2Mc6XFIl6oc7AaIcP/0/3F30jKme85Ucf1NWnGQIC3uvgE0Js7Vmpfr2nni0VLrE81GerVSIiBBvO47WdGPGouBxZlxJg43eGKQ2dQMjGvzL7MEHfZmkVd8CKMTTQnrFqNVVkd07/yKio90Ear0bremW84KzZjSmDg3Mn59NU/FgT8qBrjSgYVlieKx3SB3crXXoBAdtjV58aat6wDkf12zDd5nscxBY80FfuP6oEhVMKn/MgG8Vk5tj9/YOCR6pJaMLyJu4/CqTvLZnQMys+0WKjrw/N55AHF46d1HScKrqQiQXME8INWoieI67tlaEM45GAajMR9qnc6acqwI4t/qWdxgAU59ehnoNX9M6dhrs2wl5P9BCbcVsaRE8qhZ7k/RERVu/4oA33i6sW6p+WSLuw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(64100799003)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(7696005)(36756003)(4326008)(8936002)(2616005)(1076003)(8676002)(6666004)(16526019)(26005)(86362001)(5660300002)(40480700001)(82740400003)(336012)(426003)(316002)(54906003)(70206006)(70586007)(110136005)(2906002)(36860700001)(66899024)(966005)(40460700003)(47076005)(478600001)(83380400001)(356005)(81166007)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 17:01:58.2535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bba2f2-d272-439d-862f-08dbe6c5be95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

amd_pmc_get_dram_size() is used to get the DRAM size information. But in
the current code, mailbox command to get the DRAM size info is sent based
on the values of dev->major and dev->minor.

But dev->major and dev->minor will have either junk or zero assigned to
them until at least once a call to amd_pmc_get_smu_version() is made which
ideally populates dev->major and dev->minor.

Ideally to suffice this, adding a amd_pmc_get_smu_version() call to
amd_pmc_get_dram_size() would solve, but that has a downside of elevating
the boot times.

After talking to the PMFW team, its understood that the "get dram size"
mbox command would only be supported on specific platforms (like Mendocino)
and not all. So, adjust getting DRAM size behavior such that,

- if that's Rembrandt or Mendocino and the underlying PMFW knows how
to execute the "get dram size" command it shall give the custom dram size.

- if the underlying FW does not report the dram size, we just proceed
further and assign the default dram size.

Simplest way to address this is to remove amd_pmc_get_dram_size() function
and directly call the "get dram size" command in the amd_pmc_s2d_init().

Reported-by: Mark Hasemeyer <markhas@chromium.org>
Closes: https://lore.kernel.org/platform-driver-x86/3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com/
Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v4:
- Based on review-ilpo branch (tip commit: 94ace9eda882)
- Add Mark as "Reported-by:"
- Add more commit log notes.

v3:
- Based on review-ilpo branch
- Remove amd_pmc_get_dram_size() function
- Remove prints that are not noisy

v2:
- Based on review-ilpo branch
- Drop calling get smu version from probe.

 drivers/platform/x86/amd/pmc/pmc.c | 31 ++----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index cd6ac04c1468..c3104714b480 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -964,33 +964,6 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
-static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
-{
-	int ret;
-
-	switch (dev->cpu_id) {
-	case AMD_CPU_ID_YC:
-		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
-			ret = -EINVAL;
-			goto err_dram_size;
-		}
-		break;
-	default:
-		ret = -EINVAL;
-		goto err_dram_size;
-	}
-
-	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
-	if (ret || !dev->dram_size)
-		goto err_dram_size;
-
-	return 0;
-
-err_dram_size:
-	dev_err(dev->dev, "DRAM size command not supported for this platform\n");
-	return ret;
-}
-
 static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 {
 	u32 phys_addr_low, phys_addr_hi;
@@ -1009,8 +982,8 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 		return -EIO;
 
 	/* Get DRAM size */
-	ret = amd_pmc_get_dram_size(dev);
-	if (ret)
+	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
+	if (ret || !dev->dram_size)
 		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
 
 	/* Get STB DRAM address */
-- 
2.25.1

