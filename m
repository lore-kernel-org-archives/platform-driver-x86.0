Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F473A28D
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191963; cv=fail; b=gB+MallvKpoPXY+sNDx/lPErPXMTJPcOaDU5VLOkB/Fkgn8h+lGzyWa97AvsWVA+oKizWzt+EoNpYsHAU84FiPlInw/sVCAiQkBd23UbhZk9MlEUs1jt7PiifoLaDqybMnmqtUdp4sU7yknJ7ICvYCY5cpoqCmWPjQHg7dUJoWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191963; c=relaxed/simple;
	bh=ST7Nwg1iFWCiGD0S7qbCKkhpj80BI/7zOfiiTOgp+Bw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NDYf8yPj9sdXxIV8oTLTHdiK/Dfd2GngAx0x3nq3HXkjJVxy787cVLmsAFixB/8knMV7i5Be2Gl5me9SiUCGyrZImxFH+GhXX/0gWPaGZwmuBxbM1eSpZxcph6ehIucDO8bFK4VJsro82zr8fBRh+9JebPAbtjQNa+caphq4pEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ElSebhEW; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ElSebhEW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiU7655J64f4/garXwmy6RxmnAszwejPvQ1YmOd7V3t2+LxlSO9x75qZu/wBi16b0BIkWBbsWizrONjTE2R32kEGhWPAs6ONmsBEiCxcCuJ+z/lH7Nx8QJwtYBy2cdAT5RprgbsiMFpvoiUATUWgGgieW8IMHBk1HbqpNsYJ0H1Pfa1VNfxj92h/nzGSoaRRaQR/rA4OWS8yik7SBWu21erxGuzWqzBqZtQT1Ty3LbZwA12spcFBbWEMvzVDr2c0dtaKuRNnI3yZoR4iO1VnsvJCtWcHqijbjdarDx6WroUQaFH32MmNzxRUf6jzghhSKQgS+sUFQ0sQ+nd+yO46yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5SMekNnpez+YXFfCn1xq1+j6uJLxy1QHV+SH0933eA=;
 b=IP967jyb2MKFIR94b5zuO2iRaDy58IIPrHqqPfEpPpoCIgeKMftqbNXN7yzQwsK8DpsS6PO5CjJj2MYUdTSEFgdvhseLk57KQHc0iZUmCJkh2rp4yecN6HAQXDz4bpE4UNAxsmERIluY7EBKSKhE9EVInonf4j1iohPFTAGzCfmsYFrOrVjWyzxwJruR0F2I/DFDLRFt9082er8RK6LaOTIN27YIW+lssTL8ZGALQc9seXQcwNJRVKznkD3ykveQNPq7PgNGowUX8vB5Dn77c5sID/B0ombS++I/Y4wPdYhe4V39vLMSgbbQZvhYHnB8dFNQ6t4zv76EzIbN4Aum6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5SMekNnpez+YXFfCn1xq1+j6uJLxy1QHV+SH0933eA=;
 b=ElSebhEWaqSVWAa9yO14m1Ad1leuDM1DpJzSsP+jmOcOs5Uc7XURMfUsYR4M+DWj1+rwvrr+mIAxtpPuLLQd2cshFWrabS+nvK+SManjo4MZci8B2LEcO/GLdLTk5VX0TOyw62eL3AewSsUNV3CxaztTwDLFQuy0I4Qb8dGW3vQ=
Received: from BL0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:208:2d::23)
 by CH3PR12MB9080.namprd12.prod.outlook.com (2603:10b6:610:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Thu, 29 Feb
 2024 07:32:39 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:2d:cafe::96) by BL0PR03CA0010.outlook.office365.com
 (2603:10b6:208:2d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.28 via Frontend
 Transport; Thu, 29 Feb 2024 07:32:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 07:32:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 01:32:36 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/7] platform/x86/amd/pmf: Add support to notify sbios heart beat event
Date: Thu, 29 Feb 2024 13:02:04 +0530
Message-ID: <20240229073207.4092698-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
References: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|CH3PR12MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: dba162bb-b61a-43f8-3409-08dc38f89b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y+x/ZHqFkxHsQ6Ck71hvc+XkuCk1jZv4QFHK93ZaYSkTbw7gjUw9rCnORn/6vOsgXJJ8wXLKTMKzFybKT30DjnrL9E7Yf0LcsjHrpxNh1vmO+LyInLH9LT9U5YaSg7dV+7jr8PQMDScw+5U91eVRujkNp/qF3uO8cKH5oNrTJ0UCReg2pkBSIvWurioP81PofXPUcxLChSQCpkjDXd7om8qTBlXCLzUa16oU83f0OdltT6Hc6mnUrXe97/jxEg6r7k1Zlr2DnQZr+PLHXBZNfxWeFRZe5A4YYcl/tb6kS9qXFtTiX0zOKN8/KoZj2owAIUx9A+HjacUPp2UR8K+jjwSyMJKNO9l88b0b1oNvptOKVm1AEyC0SJnCCaNHbPbxKpJEUuKi7NYSAgCuLqB3O/SKflnHkZJ6rfZzvOBkTsO0PX2v1Ew9DkEGklcdV1OoZ7VhlXxWhYGt8rtDEBODqLUAaL5gks2csyKg7V9+xEMVWjoGoX+hNsnWtQhPvFiNu8WMbTrZDpLgZTMmbPiMo5jQsbYAbb6j9Ai4HUYntb41hqqamKNQj6TC5lr9Ec9MC6nT8IY4YrKFF1jkoXnE97ln6zNgR9kbm/cPB647OVMfgcGuAMnRBX2tyG0xZXAuqdVoPhBQTQeDDl5Zn89f3sFfNgFmjIL/XXjgK0DUVHArQqZZk68otltUduHFNprN18vdaQQ2IiArZ1Iud3IOFAvY8AQdY0zsM0XfRxyJSeWg6WcRrSC1g/U+d3qxiXR3
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 07:32:38.8729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dba162bb-b61a-43f8-3409-08dc38f89b66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9080

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
 drivers/platform/x86/amd/pmf/acpi.c | 41 +++++++++++++++++++++++++++--
 drivers/platform/x86/amd/pmf/core.c | 10 +++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 17 ++++++++++++
 3 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 13af83b187ac..f0360eea81e6 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -140,6 +140,43 @@ static void apmf_sbios_heartbeat_notify(struct work_struct *work)
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
+		dev_dbg(dev->dev, "Failed to send v2 heartbeat event, flag:0x%x\n", flag);
+		return -EINVAL;
+	}
+
+	params.length = sizeof(args);
+	params.pointer = &args;
+
+	info = apmf_if_call(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2, &params);
+	if (!info)
+		return -EIO;
+
+	kfree(info);
+	return 0;
+}
+
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx)
 {
 	union acpi_object *info;
@@ -327,7 +364,7 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 {
 	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
 
-	if (pmf_dev->hb_interval)
+	if (pmf_dev->hb_interval && pmf_dev->pmf_if_version == PMF_IF_V1)
 		cancel_delayed_work_sync(&pmf_dev->heart_beat);
 
 	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
@@ -351,7 +388,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
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

