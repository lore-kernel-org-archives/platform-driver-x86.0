Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABC013329D
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038573; cv=fail; b=qow5BYJkD7RNNnqxZszZ046WJR6Ho/5sYcAO9JQSXWoKXMsL8yqMNhTgRIw+bFfncxGBtwBt+sPYlI2tEGiwPBiOUehrH6SGHhiBFUtFT3d4OeEYRecHOl5NBnJ2/Uz2zLa9z9tiSOCnGmWMQTckOxUHt7kwpsbKsnpZ4/L+lL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038573; c=relaxed/simple;
	bh=ZHQSEDDwWAXZvt00fzNtOWtRp4doBKZDDF+ZqVzoAGs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SFHsqozIri8K5dU258qnw5G4oAOAmyWAQ5QwymZCojdc9D7ZLgrsSOdV6fplEvMKYnQwv6nLNmHnaZj8K+DbttFWrGLUSYLyYfe5p+UTdaEDa7v32A6vWm7KfjBFLVE9yp2XuXtaTStVFSARwe22tt+yJUJWfp3nEKYba4b+sY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EI1RqkVY; arc=fail smtp.client-ip=40.107.95.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EI1RqkVY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kS4rxB2ON5PxDGThQygieuDQq0iI3KRcpq23ep4/3SwAWhDyUc7dM1lxHIiZ9Aljd4R2Ocq3oxuxt7zZMz2tQm5qYTJJnErncwEoX/j0vZmDGapmCPV0RUkYisaJHWJvw6tikiLx7a6VzY8xlv/fIqXszFD1PSYpbuXajQkVPUnj+F8cnHQySQIHlvO3Q3WcDo6UmGLSCfgiFqFZM+YrH2u29r+f0rs9DhMcUdN4sXsAKYEcV8yFb3HssKvWg+ccQNqBiA1nx/qeTWhTFT68HKG8yVAWExlj4/VJh9o7t0BpqKXHQTLuR7qWmvZ/KHYUiM+BYkwzCjJaRMCXy72osw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AS9RZ6f6P2/thvFucTjQOBWUceaJOjUDsyWJG572dA=;
 b=KBLZH8B+5rWeLWt14GpQfY5k9SvqJwtYdhuXQBzIBHf0z6YvrCgAc9stv2/xQj35L0++ANvZEQMth7xxL/wCFQiwOwym5Bw3CoGP85D9K5+j4A5Vxr9bTkY6d+kHWVvk68MmBPq9VnPMXucNquCpPAYFYYnj4Sfl27CmE2jHp+2GCY9XV4UyziUqkawFaYId2T9VmAFMhDEHQ4z0KcuLJ/Lv8hRlXVCng/h2yuoswujgkR+Q3FnHroZ8E1X/PnyROvAYcH/rV04kugdOl7yKJc5128d7X6HQ8tIhDqsBgsW5v2lvFUt+mrRbCBBilZeyma0HNXkVJ8is6L6xGaLbsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AS9RZ6f6P2/thvFucTjQOBWUceaJOjUDsyWJG572dA=;
 b=EI1RqkVYOJvOF6cLg+VNAnLHT3gvsZrzlnSub+1SzGcjOsyyhGmEjRroFWtzmP2l/xcrB+NwFAKEBLDq+YMp2rf+A1POFfyE9l9+yChmDrF5CR4lAjurInjkLgQigV1Q4+KIZIGOs3a1SWMfCtmQuMRI5KhLZCwKSosGtoPMhzM=
Received: from DM6PR06CA0098.namprd06.prod.outlook.com (2603:10b6:5:336::31)
 by CH2PR12MB4278.namprd12.prod.outlook.com (2603:10b6:610:ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Tue, 27 Feb
 2024 12:56:04 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:5:336:cafe::de) by DM6PR06CA0098.outlook.office365.com
 (2603:10b6:5:336::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Tue, 27 Feb 2024 12:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 12:56:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 06:56:01 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/7] platform/x86/amd/pmf: Add support to notify sbios heart beat event
Date: Tue, 27 Feb 2024 18:25:17 +0530
Message-ID: <20240227125520.3153140-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|CH2PR12MB4278:EE_
X-MS-Office365-Filtering-Correlation-Id: e40350d3-8d54-4c24-ef92-08dc37937516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BHr0eAQ/5E+p0UYRrMp/NMNWjyPgbYpkHgLDWBCVihOCQptXrDWtMK4TP/OSWNp3Jzx53AaCYZITlVNV9FtuTf4lwxOliHBsrAlS+lu+feBB4E5/biwvoskVuDCh0A99jtUvNbW7EpQ2RcAsFNf8znTec1G9Be92v2xOu6rMzfvSae0AF3t8KHMn773W2Ep7zxQI9hZZsskcfR8c/2xkKvhsKpq4dibDQFyXDUpeBTlpQaiGelx36b3mqPI9ROxfRrM3xXzFq1Bilc182898+YB/t1f6WMmc+vMkY8LAfatg5KuiwXzF4Lozlk73ZyU3COfXzcyPlGNnZiYhI/Zim6w/e6TYL9xaHd+wsSrZfj5gNo4s+SAijyKjOLxj5T1KGqkfJmy4Tm3uIR1OwPdvXQrkIFetDGchCRJaaoAcpVhd8U3Z/wKEFC9/iB0kOoTwiqg7ChRALv8MZ8XSmPji4PSvpmLa3RywSpnTZC49/pRF9GAg1lZD059Uozo00qVpp1jKvTWWEPTZG6HRM5rLJ0S4kYvKK+AbkD/VaTSP3CkUEqFwJJCazCRNOj6C1cuiX9oYjjqt5EVsKcNqhDJbfF8rZTt7KBzIwD3C0UNyf70Y12Ubeor84YiQogUk4qWT7WWLQJ2TiUzqwJn8ri1DF9g/vvRCvNdmNVzID7e66AulKukLJrg2xmT4l0gDb1anxA8gJxp1Jh3tqmy3bRC9diK7fLSv0VneTQCgB80LCOkrK9wYxvRqSxguFRL/9SWY
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 12:56:04.2831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e40350d3-8d54-4c24-ef92-08dc37937516
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4278

Add support for newer revision of the heart beat notify events.
This event is used to notify to the OEM BIOS on driver
load/unload/suspend/resume scenarios.

If OEM BIOS does not receive the heart beat event from PMF driver, OEM
BIOS shall conclude that PMF driver is no more active and BIOS will
update to the legacy system power thermals.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 42 +++++++++++++++++++++++++++--
 drivers/platform/x86/amd/pmf/core.c | 10 +++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 17 ++++++++++++
 3 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 1b2a099c0cef..0fc8ad0ac3e9 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -140,6 +140,44 @@ static void apmf_sbios_heartbeat_notify(struct work_struct *work)
 	kfree(info);
 }
 
+int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag)
+{
+	struct sbios_hb_event_v2 args = { };
+	struct acpi_buffer params;
+	union acpi_object *info;
+
+	args.size = sizeof(args);
+
+	switch (flag) {
+	case ON_LOAD:
+		args.load = 1;
+		break;
+	case ON_UNLOAD:
+		args.unload = 1;
+		break;
+	case ON_SUSPEND:
+		args.suspend = 1;
+		break;
+	case ON_RESUME:
+		args.resume = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	params.length = sizeof(args);
+	params.pointer = (void *)&args;
+
+	info = apmf_if_call(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2, &params);
+	if (!info)
+		return -EIO;
+
+	dev_dbg(dev->dev, "Sending v2 heartbeat event to SBIOS\n");
+
+	kfree(info);
+	return 0;
+}
+
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx)
 {
 	union acpi_object *info;
@@ -328,7 +366,7 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 {
 	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
 
-	if (pmf_dev->hb_interval)
+	if (pmf_dev->hb_interval && pmf_dev->pmf_if_version == PMF_IF_V1)
 		cancel_delayed_work_sync(&pmf_dev->heart_beat);
 
 	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
@@ -352,7 +390,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 		goto out;
 	}
 
-	if (pmf_dev->hb_interval) {
+	if (pmf_dev->hb_interval && pmf_dev->pmf_if_version == PMF_IF_V1) {
 		/* send heartbeats only if the interval is not zero */
 		INIT_DELAYED_WORK(&pmf_dev->heart_beat, apmf_sbios_heartbeat_notify);
 		schedule_delayed_work(&pmf_dev->heart_beat, 0);
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 2230bc2b1f59..5e52eb32ab2b 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -300,6 +300,9 @@ static int amd_pmf_suspend_handler(struct device *dev)
 	if (pdev->smart_pc_enabled)
 		cancel_delayed_work_sync(&pdev->pb_work);
 
+	if (is_apmf_func_supported(pdev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
+		amd_pmf_notify_sbios_heartbeat_event_v2(pdev, ON_SUSPEND);
+
 	return 0;
 }
 
@@ -317,6 +320,9 @@ static int amd_pmf_resume_handler(struct device *dev)
 	if (pdev->smart_pc_enabled)
 		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
 
+	if (is_apmf_func_supported(pdev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
+		amd_pmf_notify_sbios_heartbeat_event_v2(pdev, ON_RESUME);
+
 	return 0;
 }
 
@@ -444,6 +450,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	amd_pmf_dbgfs_register(dev);
 	amd_pmf_init_features(dev);
 	apmf_install_handler(dev);
+	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
+		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
 
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
@@ -455,6 +463,8 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
 
 	amd_pmf_deinit_features(dev);
+	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
+		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
 	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
 	mutex_destroy(&dev->lock);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index f11d2a348696..5cad11369697 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -30,6 +30,7 @@
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 #define APMF_FUNC_DYN_SLIDER_AC				11
 #define APMF_FUNC_DYN_SLIDER_DC				12
+#define APMF_FUNC_SBIOS_HEARTBEAT_V2			16
 
 /* Message Definitions */
 #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
@@ -85,6 +86,21 @@
 
 #define PMF_IF_V1		1
 
+struct sbios_hb_event_v2 {
+	u16 size;
+	u8 load;
+	u8 unload;
+	u8 suspend;
+	u8 resume;
+} __packed;
+
+enum sbios_hb_v2 {
+	ON_LOAD,
+	ON_UNLOAD,
+	ON_SUSPEND,
+	ON_RESUME,
+};
+
 /* AMD PMF BIOS interfaces */
 struct apmf_verify_interface {
 	u16 size;
@@ -600,6 +616,7 @@ int amd_pmf_get_power_source(void);
 int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
 int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
 int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
+int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.25.1

