Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8830C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Feb 2022 20:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235429AbiBVU75 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 15:59:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbiBVU74 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 15:59:56 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F02B3E6E
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 12:59:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkaYjEwZw5rE59qZCKF+SeVi/kJWQIen+JE/MDO1W//0CtfxXzxZWAqUyLRh42rImkrU6jhFOHsgh01IeR9gh/afzpk5Dwanfg2A0QucqyBVl8fatmyyCdQFNMRgChClTW/D9cSWYhvTlBVupmvE1wRVCFYcI0tzM04oxn1ACuRZigeRbsu5XIPDrtTFIuMGYypsrioXwuWENOxRH7NTa1JgbiB1qFqhCppFGnSDyGf3I6nbzmk0FWPrjH4wY1H5X7OidSVmUxTELbabo1zL4RfA8ufMopF77/oIVhNpVpjAASmbJyGMgJd4zD7/U0L5Nrd8JE4CV2tJjIrnK1PaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBipF7PuwfDqS9Co1oh7qfg2T3fWv60+2ksA7EtfDao=;
 b=dUfx73lUoKVz1WQrSqXybu0e/aoetvjdMSFpgaOjp8ElZt/cJUMKHibhlc4yEyBcRM2B5bTquT44/hAvQAMXUcwVopooGvZWhXn06O/guQ5y+aI0m38iFlH7CW9FgZRfyeskg976g6EOQDhO4cXoCGhadQCBnbJBOiAsa4t3lbW803UfPR7hgSY7eIfNQcezMx13Or8YYEO4Y+0uAGtWfaUcHL+Hf7QeZ3DHY8l2NJWeqNbqc5MBVXFOFVQcEKmhAPKjmrl8nzbGYP/CYWdWJzo/3+vN5sLivxzIIlFzwEl7rz7sB2wryJ3Wq9IR0Fmkdg1Nh9pPorBcwHKLgMFUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBipF7PuwfDqS9Co1oh7qfg2T3fWv60+2ksA7EtfDao=;
 b=Ou32+do0aTnN9y3JWz0+J9WuF5mDm0mx91ENP3PAmwGGSosS26LBaPFmfVijVvBSpFdj2wpdaT/FLgvtXnXdUJumibiO3HdwD7rihJqO3OkDOSNliLMb+5ynZ/YzMSWKLH64PBolSkUrQvv5Dcb06HQzHHIlYdmIaTKYFsYxP7M=
Received: from DM3PR14CA0141.namprd14.prod.outlook.com (2603:10b6:0:53::25) by
 PH7PR12MB5733.namprd12.prod.outlook.com (2603:10b6:510:1e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Tue, 22 Feb
 2022 20:59:28 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::90) by DM3PR14CA0141.outlook.office365.com
 (2603:10b6:0:53::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22 via Frontend
 Transport; Tue, 22 Feb 2022 20:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 20:59:28 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 14:59:27 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v2] platform/x86: amd-pmc: Set QOS during suspend on CZN w/ timer wakeup
Date:   Tue, 22 Feb 2022 14:59:26 -0600
Message-ID: <20220222205926.25779-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c26c681-2ebd-4cd3-16ad-08d9f6463746
X-MS-TrafficTypeDiagnostic: PH7PR12MB5733:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB5733ECE0F53486262AFD53CAE23B9@PH7PR12MB5733.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kIOEnDnq1F2dtOlxIZ0DSMfIryyvn4hNVTssw17i4GL7M9NUKQknM9QYQSy08pynrfqz8lvLkKww0TldGMnZ9w2/q5ebURNdpi0643dfC3mgREKB+1puUvKPG2tJIAfGgkqYXXmXYXO02c5SLpAN7aeKnACqt/E61Gg2BkcsIZKEXe+RoSQ+c1bMcAyQs0xQDznTtA5HpsWw4Gj1wUvn7zUqAOFvZIsxxniYkxLLIegMVPUmebCfJ0qaOoSEJjG2JfpwSNkyhC66TG/YmRs2dY8kJtzsKhjVfIKEgGi1ZtAGiNccKd2EANLGAZf0ZqSNBxdhL/038wRqYHO5lo6BKCUo3zqVOX9sTQVaDZdVtkKt6Nc12HOGNxmegzpztVhgLw9UAsQLZe96Q7kqxGleqD+XREOVGVepGl/Wy/QzXX+qhKJUX9Lt61NKfDkGHWxsUfiYcXMhx5pJkQILEJFaCz6U3Es3OVCTF+5LjzlQOpWBokmRC6NEc5Jydm3bina7QdiPcTKxI9F8ShVjDIN8F7UHcqFmCsDnL4/OXpdH8pmg5YspNIl3YeQvHiNBY30Gh8bnJ9vqG3yNvM5aEs5zXqGs85DoxDDpaYVUar5RgEHoi4flH+a0q7ucmGDMB9fY3yGK1oyF4YD6nF7hBgQxjVORT38E/ujhYMm0hP1n45SfhpGfKYek1/E2fmRoyfg5tN0RSkl7OzFLdeJGy1N5OPo2UKok5jchNK4rRXFFkU6cyzQKcSLEaUJuvrW1MGtlHhPXWfqfNtCPfA51JO8YqUtsbdQH4bNiGrRQdSTb/tI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(7696005)(508600001)(16526019)(26005)(316002)(4326008)(70586007)(45080400002)(15650500001)(5660300002)(110136005)(2616005)(966005)(83380400001)(47076005)(70206006)(8676002)(1076003)(36756003)(336012)(44832011)(186003)(426003)(8936002)(36860700001)(40460700003)(2906002)(54906003)(86362001)(82310400004)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 20:59:28.4025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c26c681-2ebd-4cd3-16ad-08d9f6463746
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5733
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
Changes from v1->v2:
 * Update for Rafael's suggested changes:
   - fix resume comment 
   - undo QoS at end of resume instead
   - Use smaller number for QoS to allow C1 entry

 drivers/platform/x86/amd-pmc.c | 39 ++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 4c72ba68b315..248dc6735f5a 100644
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
+	cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req, 3);
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
 
@@ -579,12 +596,15 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	/* Write data incremented by 1 to distinguish in stb_read */
 	if (enable_stb)
 		rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
-	if (rc)	{
+	if (rc)
 		dev_err(pdev->dev, "error writing to STB\n");
-		return rc;
-	}
 
-	return 0;
+	/* Restore the QoS request back to defaults if it was set */
+	if (pdev->cpu_id == AMD_CPU_ID_CZN)
+		cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req,
+						PM_QOS_DEFAULT_VALUE);
+
+	return rc;
 }
 
 static const struct dev_pm_ops amd_pmc_pm_ops = {
@@ -722,6 +742,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	amd_pmc_get_smu_version(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
+	cpu_latency_qos_add_request(&dev->amd_pmc_pm_qos_req, PM_QOS_DEFAULT_VALUE);
 	return 0;
 
 err_pci_dev_put:
-- 
2.34.1

