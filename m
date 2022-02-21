Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629D3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Feb 2022 20:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbiBUUM2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Feb 2022 15:12:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiBUUM1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Feb 2022 15:12:27 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92A910E7
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 12:12:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCz/PGvPJEIb7KMCLOBNu8yLyiJtfQ7oHoc3+opn/7/9AEsvpIfkrkJd9KTrrKY1W6iJ+FjcObpwy4xtqV+h2TV3U2jPlRLFWj2ZCZ3JPNKODW5JKEnfI//r6zenoHnderSvDMoYjkFKaceN0OwkJdnCaCWaiE3y+R/m4T7UWHRUvsd63WpmjOGrsoSj5JdLI9+U8L2vt0edmIcgvp3WF2tjNN8eD7MU/g6cuExCeGph5J6DRxHCJ+FpUzvJKhEywNRs4gWk5iawbQlWOzbbs5DK7BmWR8JS90+dxPcS4IpXDkfBqBug9sPGjCAJHCHTDItWbuXrre+T+Qpso1wqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Thct5LQjsdAH+Jnon6SlZaoB1Gl56+mSW84JoWkVeSA=;
 b=JkK4VARQKzBOoLQPfWCkqyM5tA8aXfBQCqvnEzfSHBCzzWZ7CyM5J8ll0dkBHkrqRf46htppkEy9xcLanXV6SXqqEwBQOelAcaTvT+Y8DdHNMvF96OLrje4H7vXUAzfimAKNwtxObcGmHX4RvHHqULrrnjTXyOfu6FjPKAxncLvMMbQyjncVz0sx9p1K3rgYZVJlNJiSFu0rx2XgF+4ueZAIUDKejFjVYfwu5v7m9U+C8BNA6K+ip76rYhZ/wW3FghpsYEiqtEObvChA9RX53pi2URP/ZRAsoBo2LQYDK3gMMSo4CEl+BukQLNKAsldIA0Z3AcK9Xqi0y62SOGVQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Thct5LQjsdAH+Jnon6SlZaoB1Gl56+mSW84JoWkVeSA=;
 b=U26mOMxTOMf9hh5bU6Q3OXr/YrbHU7hNlEv/XqtPZLBFG5DTJRIH3Dqau4fRSiFqMVfI9l2EDQdaF8Dxh/ykrhRJhrJpmgCqJqL8gLEaPf56aK3kjVg2NxzRdbiMRCsEMRWT5Jd60XQSXHLk0riZ/AKWk3erMYe7qwbZoF0UOc0=
Received: from DM6PR07CA0062.namprd07.prod.outlook.com (2603:10b6:5:74::39) by
 BYAPR12MB3111.namprd12.prod.outlook.com (2603:10b6:a03:dd::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.24; Mon, 21 Feb 2022 20:12:01 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::1a) by DM6PR07CA0062.outlook.office365.com
 (2603:10b6:5:74::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Mon, 21 Feb 2022 20:12:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Mon, 21 Feb 2022 20:12:01 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 21 Feb
 2022 14:11:59 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH] platform/x86: amd-pmc: Set QOS during suspend on CZN w/ timer wakeup
Date:   Mon, 21 Feb 2022 14:07:28 -0600
Message-ID: <20220221200728.2323469-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac04931d-bb9e-4601-6aaf-08d9f5766bcd
X-MS-TrafficTypeDiagnostic: BYAPR12MB3111:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3111AA8BBBDA0E63F5681122E23A9@BYAPR12MB3111.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 64tlAfoj0fkAHtsX4L97XZZDCIMjQBFjjh19q7gsEywQxyQzIsuCzOAVlwuH3+rAwKKjDJfWtyNSqAC9JnEzfDlc0l749iYIXKYVqbyAy3TuLcEsoUt5RuY3xcZgghKYKS6myIELZ312u0IlY2Q6Rrwlj4WXw9LPVj5Gy/CAoJ6fXdeRYjGghBQc/Mf3PYeUkPBiKA5XYHrkBuXkJ95eR/qub5B/K5UTFJLQKaIWlAOFd4jnQNxVMm2vzZwJV42qTtRw7gNCWbzxAH+0B7quRwqBNmdKH5hMfoPx5e+n+30R1FjJtmPOmHtRNSoSEsKZBheUdFXdlziOr7uuS9N4uW+MyQxP0mBy7otUwj6hf8/vesL33nXwUsj3unwbKFWs2zadjxGWr8dv3i7Ai2sDoKHKk9834+3GqBDEnTQehausTFWQ2t1x1fU/z/vY+P4tLcvSTxp5mmCcR56IBAb76ZwRCJFmcrj9AV1jEF5QBuWTlAwYSOj6ozZEr1aiaflEr/PprH46xmMJeMrKgoErENvXzsA6qynsBSR9/AVZQvRra/ezRbgb/lgELkVH/VMr09RJZ+08xSsTO9xpqgZeoLp31/GktoNVgsETv/B77tRP9kDKDReUw3t9aj3OvgOt77RiYTW5ctxHFIaSqwM3n30FZcTseamdukPi13MD9FTxlqsUPpikNRskEGwNjIIMTLedxYCOio2jFF7AMwDlkRYqHOYsJ4iFeDGLPAtNKwQlgRIi9shL6CIcUls0i5Ygs3MH4GUPhmViNTRsxSIZVsjIfA8ZXo9VTsFT7qhOy18=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(16526019)(186003)(26005)(2616005)(70206006)(70586007)(1076003)(966005)(6666004)(86362001)(110136005)(8676002)(54906003)(82310400004)(45080400002)(36860700001)(316002)(508600001)(356005)(81166007)(15650500001)(426003)(336012)(83380400001)(4326008)(47076005)(5660300002)(8936002)(2906002)(40460700003)(44832011)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 20:12:01.1956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac04931d-bb9e-4601-6aaf-08d9f5766bcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3111
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

commit 59348401ebed ("platform/x86: amd-pmc: Add special handling for
timer based S0i3 wakeup") adds support for using another platform timer
in lieu of the RTC which doesn't work properly on some systems. This path
was validated and worked well before submission. During the 5.16-rc1 merge
window other patches were merged that caused this to stop working properly.

When this feature was used with 5.16-rc1 or later some OEM laptops with the
matching firmware requirements from that commit would shutdown instead of
program a timer based wakeup.

This was bisected to commit 8d89835b0467 ("PM: suspend: Do not pause
cpuidle in the suspend-to-idle path").  This wasn't supposed to cause any
negative impacts and also tested well on both Intel and ARM platforms.
However this changed the semantics of when CPUs are allowed to be in the
deepest state. For the AMD systems in question it appears this causes a
firmware crash for timer based wakeup.

It's hypothesized to be caused by the `amd-pmc` driver sending `OS_HINT`
and all the CPUs going into a deep state while the timer is still being
programmed. It's likely a firmware bug, but to avoid it don't allow setting
CPUs into the deepest state while using CZN timer wakeup path.

If later it's discovered that this also occurs from "regular" suspends
without a timer as well or on other silicon, this may be later expanded to
run in the suspend path for more scenarios.

Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Link: https://lore.kernel.org/linux-acpi/BL1PR12MB51570F5BD05980A0DCA1F3F4E23A9@BL1PR12MB5157.namprd12.prod.outlook.com/T/#mee35f39c41a04b624700ab2621c795367f19c90e
Fixes: 8d89835b0467 ("PM: suspend: Do not pause cpuidle in the suspend-to-idle path")
Fixes: 23f62d7ab25b ("PM: sleep: Pause cpuidle later and resume it earlier during system transitions")
Fixes: 59348401ebed ("platform/x86: amd-pmc: Add special handling for timer based S0i3 wakeup"
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 43 +++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 4c72ba68b315..1615a3bb9a0b 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/pm_qos.h>
 #include <linux/rtc.h>
 #include <linux/suspend.h>
 #include <linux/seq_file.h>
@@ -131,6 +132,7 @@ struct amd_pmc_dev {
 	struct device *dev;
 	struct pci_dev *rdev;
 	struct mutex lock; /* generic mutex lock */
+	struct pm_qos_request amd_pmc_pm_qos_req;
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *dbgfs_dir;
 #endif /* CONFIG_DEBUG_FS */
@@ -521,6 +523,14 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 	rc = rtc_alarm_irq_enable(rtc_device, 0);
 	dev_dbg(pdev->dev, "wakeup timer programmed for %lld seconds\n", duration);
 
+	/*
+	 * Prevent CPUs from getting into idle states while running the code
+	 * below which is generally safe to run when none of the CPUs are in
+	 * idle states.
+	 */
+	cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req, 0);
+	wake_up_all_idle_cpus();
+
 	return rc;
 }
 
@@ -538,24 +548,31 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	/* Activate CZN specific RTC functionality */
 	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
 		rc = amd_pmc_verify_czn_rtc(pdev, &arg);
-		if (rc < 0)
-			return rc;
+		if (rc)
+			goto fail;
 	}
 
 	/* Dump the IdleMask before we send hint to SMU */
 	amd_pmc_idlemask_read(pdev, dev, NULL);
 	msg = amd_pmc_get_os_hint(pdev);
 	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
-	if (rc)
+	if (rc) {
 		dev_err(pdev->dev, "suspend failed\n");
+		goto fail;
+	}
 
 	if (enable_stb)
 		rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
-	if (rc)	{
+	if (rc) {
 		dev_err(pdev->dev, "error writing to STB\n");
-		return rc;
+		goto fail;
 	}
 
+	return 0;
+fail:
+	if (pdev->cpu_id == AMD_CPU_ID_CZN)
+		cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req,
+						PM_QOS_DEFAULT_VALUE);
 	return rc;
 }
 
@@ -565,6 +582,15 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	int rc;
 	u8 msg;
 
+	/*
+	 * Prevent CPUs from getting into idle states while running the code
+	 * below which is generally safe to run when none of the CPUs are in
+	 * idle states.
+	 */
+	if (pdev->cpu_id == AMD_CPU_ID_CZN)
+		cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req,
+						PM_QOS_DEFAULT_VALUE);
+
 	msg = amd_pmc_get_os_hint(pdev);
 	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, 0);
 	if (rc)
@@ -579,12 +605,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	/* Write data incremented by 1 to distinguish in stb_read */
 	if (enable_stb)
 		rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
-	if (rc)	{
+	if (rc)
 		dev_err(pdev->dev, "error writing to STB\n");
-		return rc;
-	}
 
-	return 0;
+	return rc;
 }
 
 static const struct dev_pm_ops amd_pmc_pm_ops = {
@@ -722,6 +746,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	amd_pmc_get_smu_version(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
+	cpu_latency_qos_add_request(&dev->amd_pmc_pm_qos_req, PM_QOS_DEFAULT_VALUE);
 	return 0;
 
 err_pci_dev_put:
-- 
2.34.1

