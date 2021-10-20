Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD0BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Oct 2021 16:30:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D038D61260
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Oct 2021 16:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhJTQcU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 20 Oct 2021 12:32:20 -0400
Received: from mail-bn8nam12on2082.outbound.protection.outlook.com ([40.107.237.82]:8288
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229817AbhJTQcU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Oct 2021 12:32:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqiqucESDpHhV8nyjjYUjragvz9QKSdoAXru0WRkb/b8xn3bQTCqkgXEHeFP6vxS9X+QmMUAqqMYu6ZdVOOYaKlmTSMhNwwX4Say9OBRbhL92hENlh/RHLKPWFvGxks6YEvLnsqsUewZK202JKs8fmZYI5kDNlRwuQiDPYHTy/qO4CPtPY+/bXQF+zFPTqYTohRAPlfgfGkuHdFfAggC1t0VrMLekEUOmlyVSUWY0qR3GIAftds7aWg6RG7tc1fYe2xU76oqxvASwvpoeVTzO0VOrF4j88hlvZ2FGIAI8zFKUvaTGfwSbrFd5i5zafCOZwdzv5nAekqFx1f/PadbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qPoC+BxRaVZWQcXAKoMxJhyPguyx3ypJiyGdgseMPs=;
 b=Z636X/tbpcgwU/wHoz+PyAZ15/ksf6aQOgtcuP6dFSSAmSwOyehAXIHxkuX05QTCW7LiiuLMGwHM5rIgF/b43r2viqGaR5CsXKiBSGFhVjnpGHNxFMD6X6xG0Z/J6t44RpFsIJejK1JJgYwyeIuDlBPsviyzQK0T4WjZZ85MFc7wafG+zt5gpGOsEK7b2t5JPUdgo/xrbliMiSZNlQ5TIzSmbUCcW5x5lh0bX0TrEZMg4nScpwUhwh46/wWignjG+K3RwRD/Thk7BypxXqtsGyYgsollHqV4q3p3c9M8S8lbu23aVLiO3NBCsKUX6IGPR1bbZFTdo2H0ahMitGXv6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qPoC+BxRaVZWQcXAKoMxJhyPguyx3ypJiyGdgseMPs=;
 b=ThH2/N1vdconY2STBuSx66YxNtPZMhUsYFeZovy196K1wLo0XnzQe6Z3d5F9LNynTI43Qkmqm87aWy/h3Loxyo6zlRYmWB40MUX9UA/JzpD4nu8fomXhyseColPi+7Nb82ipMRAlbSE7j0Edoaoy+PvBy00KeOrEIPv32I4Lf1w=
Received: from MWHPR15CA0047.namprd15.prod.outlook.com (2603:10b6:300:ad::33)
 by DM5PR1201MB0187.namprd12.prod.outlook.com (2603:10b6:4:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 20 Oct
 2021 16:30:03 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::82) by MWHPR15CA0047.outlook.office365.com
 (2603:10b6:300:ad::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Wed, 20 Oct 2021 16:30:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 16:30:03 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 11:30:01 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 2/2] platform/x86: amd-pmc: Add special handling for timer based S0i3 wakeup
Date:   Wed, 20 Oct 2021 11:29:46 -0500
Message-ID: <20211020162946.10537-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020162946.10537-1-mario.limonciello@amd.com>
References: <20211020162946.10537-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edeaf4e0-273b-4407-e403-08d993e6de68
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0187:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0187E9C6B5CB5FEAA63F26D3E2BE9@DM5PR1201MB0187.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Kiqb89lgZOdGkepwTSJl3ogOEN2i00l0WdzX/IlZvG237a8VEchc9iMdQVXo22IPRtxx6mWyimxo5lLvi6loZGzlz81Muj9QttaYlPXeS+3cAaqW5TMIWgAF3zYqRMpSXrW9p/Mmv3mqDia/AnBOxnUlLo1BlrXWfAn717SA8TeRecRi1OXlU4jXDMwYH2ZuGtgJ9lrsd46TqzhirEM/vfrZO3pKhkmPuP0IfBcczsc2gdPmCWLzZ/yGxvZ0t+q5KiAig4x2wOtYM728DBMudqaF2A/E2k+RF+96a0716fODDfyc8jMrR2EQ0wDiJdT5xeVlhieGBQ/6AzYkgy+3jV16+0zSNqV0edDIFWajfpq538AtPGx6KwVscTlB5ebReD/7n8BbFYmVoyNQFiqMUpxgLj4SE3+NAQweRdZHvN6JDC/cumnnGeC2ZlbRSIfCUuQf9UGfwhZmvDTme4bBK0dN0wTWgF83w+iD2B8O42VT6B335ZMjV0kifURszjON+ancelOuTsQQTzBWYujiQVZTIos80smvuaovmHlPWhVXJDn1P5Qr2VniArZk1Efp8tmW7dOG1/B89B5zvMCWyW1lZacGUIUNRypcLPWPHyKtriBvWqINJrqik2x3Qe1HJnaeM1xmisuckYvOn9i72S6gAxau41ypr80k3Tht6ECt9KZf0DS8vGRuFaTJaoBXotDxgp5fsCstqMm8juUxxEv4hb7Kx78ByVxWH4IpLw=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(82310400003)(186003)(44832011)(70586007)(70206006)(83380400001)(110136005)(81166007)(16526019)(4326008)(36860700001)(1076003)(26005)(356005)(5660300002)(2906002)(316002)(6666004)(7696005)(2616005)(47076005)(336012)(8936002)(86362001)(36756003)(8676002)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 16:30:03.0894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edeaf4e0-273b-4407-e403-08d993e6de68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0187
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

RTC based wakeup from s0i3 doesn't work properly on some Green Sardine
platforms. Because of this, a newer SMU for Green Sardine has the ability
to pass wakeup time as argument of the upper 16 bits of OS_HINT message.

With older firmware setting the timer value in OS_HINT will cause firmware
to reject the hint, so only run this path on:
1) Green Sardine
2) Minimum SMU FW
3) RTC alarm armed during s0i3 entry

Using this method has some limitations that the s0i3 wakeup will need to
be between 4 seconds and 18 hours, so check those boundary conditions as
well and abort the suspend if RTC is armed for too short or too long of a
duration.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 60 +++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 99ac50616bc3..678bf6874c63 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -17,9 +17,11 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/rtc.h>
 #include <linux/suspend.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
@@ -412,20 +414,76 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	return -EINVAL;
 }
 
+static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
+{
+	struct rtc_device *rtc_device;
+	time64_t then, now, duration;
+	struct rtc_wkalrm alarm;
+	struct rtc_time tm;
+	int rc;
+
+	if (pdev->major < 64 || (pdev->major == 64 && pdev->minor < 53))
+		return 0;
+
+	rtc_device = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
+	if (!rtc_device)
+		return 0;
+	rc = rtc_read_alarm(rtc_device, &alarm);
+	if (rc)
+		return rc;
+	if (!alarm.enabled) {
+		dev_dbg(pdev->dev, "alarm not enabled\n");
+		return 0;
+	}
+	rc = rtc_valid_tm(&alarm.time);
+	if (rc)
+		return rc;
+	rc = rtc_read_time(rtc_device, &tm);
+	if (rc)
+		return rc;
+	then = rtc_tm_to_time64(&alarm.time);
+	now = rtc_tm_to_time64(&tm);
+	duration = then-now;
+
+	/* in the past */
+	if (then < now)
+		return 0;
+
+	/* will be stored in upper 16 bits of s0i3 hint argument,
+	 * so timer wakeup from s0i3 is limited to ~18 hours or less
+	 */
+	if (duration <= 4 || duration > U16_MAX)
+		return -EINVAL;
+
+	*arg |= (duration << 16);
+	rc = rtc_alarm_irq_enable(rtc_device, 0);
+	dev_info(pdev->dev, "wakeup timer programmed for %lld seconds\n", duration);
+
+	return rc;
+}
+
 static int __maybe_unused amd_pmc_suspend(struct device *dev)
 {
 	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
 	int rc;
 	u8 msg;
+	u32 arg = 1;
 
 	/* Reset and Start SMU logging - to monitor the s0i3 stats */
 	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
 	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
 
+	/* Activate CZN specific RTC functionality */
+	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
+		rc = amd_pmc_verify_czn_rtc(pdev, &arg);
+		if (rc < 0)
+			return rc;
+	}
+
 	/* Dump the IdleMask before we send hint to SMU */
 	amd_pmc_idlemask_read(pdev, dev, NULL);
 	msg = amd_pmc_get_os_hint(pdev);
-	rc = amd_pmc_send_cmd(pdev, 1, NULL, msg, 0);
+	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
-- 
2.25.1

