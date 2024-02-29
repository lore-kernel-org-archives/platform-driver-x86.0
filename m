Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BD679DA6
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709204488; cv=fail; b=EDiqQpnODmY5DV5Eb9/OqwddKFp45C/TPFBnzMWK+PzE+Gz5/bHOactLSMAy5AiKX/nExRwN0MFBZr9yXglcDyzhdkWIDGvfXJtTdgCWcR/sKs/RfLUGnUTAI7xlbT5B7dZ5UjmKdEoKaGc7NR8E8PthT30NUNhZZSH9ev0TWcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709204488; c=relaxed/simple;
	bh=ST7Nwg1iFWCiGD0S7qbCKkhpj80BI/7zOfiiTOgp+Bw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZm26CmoiBXeCYeZv0ZCHqi+BiWMWO+Co49ENr9mLfCL6RlxfjRkmQi3Ps0w//eYpuZAkS4LrXv08h65zUHCx2YgOqn5+RYwPE+Q/n5ezUVf3f5n11fGM4nrFPwciwn7yYrq2LQYqouRqn96J4P2cF5vLfoHLfxC9VQvFlmLP6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EfDKvTBa; arc=fail smtp.client-ip=40.107.223.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EfDKvTBa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXhg2KSBY3cjm/GGOqclS5cuZDEklFZQqV1rpF+KOVgRL+FakaSOPfuf0DNiC3s7QTSR9Xzt9VgKFdY2kCof74Ff5DLocpfT0+H5THw2HDPxRaX74zwvyao3/E8USeeDu02j+1udL6EfZOxYChyVynPEimXxTYFuiLAmGz+Hw+KkuyuTGpZZqIM/KSaM0LI4ED1xKzKK+kMr6JyxAorUhVGIMWp2pDutRS5edf+o91WLbVu5yy5G7fYbz/4uCn1FUwxnGRRALon/YjScjJ1j9+wWAojEbh3c3s3gZ+7xv32gKhFX8z62jpC7ZmRgJvrEcd0vlHluneW8LmeU9CnhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5SMekNnpez+YXFfCn1xq1+j6uJLxy1QHV+SH0933eA=;
 b=nmXEZxh+XuMgFmoe3IMauQaNmfwqx5Q8dDdTTbd4AqFHuEJPOfdw6TZBK38KETwtXTA/GYMEs4JnISmsPzhdM4LY4AdpblWUCAATnYnZnhCrXjFa/lvOOSOt5oBts2VBryzPXtkaCVgFP3DcHRiwZoWJplN5uoiwgr4vIY5gJMIszSWjYjv6vcWHmI/IgVgoUBqjmO8no5uNtROC3QUZ7HTT1zRFv+L3g9ys1l/9akVv2hi/qbG1KQBXIL6V7HFejyjF1zZp0pzcalRpHC54Q76sZZFaiu6zwG1+oFmgROOzcteIAIF4eaT5c2DgncZ/CDXTOMV7YmqfCNQQsQX3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5SMekNnpez+YXFfCn1xq1+j6uJLxy1QHV+SH0933eA=;
 b=EfDKvTBaA2huj3c3KCypewMaiczH3B/dst1SoWfAbd9K8JCXwwTyyzToBsoFzoZVu6iDLzeMKWsIY3dU/Zfd90njHQ6ixcVK4Yzc4A2UnktK7QcA9e+OYEgyJdW2NVvsWhpMAXm43oqVZwcHSCHdbOn0hKykoCsgLxYMQEgBXfY=
Received: from CYXPR02CA0004.namprd02.prod.outlook.com (2603:10b6:930:cf::7)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 11:01:22 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::a2) by CYXPR02CA0004.outlook.office365.com
 (2603:10b6:930:cf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32 via Frontend
 Transport; Thu, 29 Feb 2024 11:01:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 11:01:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 05:00:00 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND v2 4/7] platform/x86/amd/pmf: Add support to notify sbios heart beat event
Date: Thu, 29 Feb 2024 16:28:58 +0530
Message-ID: <20240229105901.455467-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
References: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: e5de840f-e2de-4887-007c-08dc3915c432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DsUpAKZu+ml0oO8yiP0HfRims3u1A1l/OQWVJYs+dQqrZftUuotSC6z5UYJ3Q3r8mKlJHRSNrMJmLFI3zu38zguZ6WHZe/dLeNRqgVbYq3GMoyQ0oc02venYnhgRDzq7a0VC4Y120gyc4adzSpQraypZZ3pnGTsyJc3yLEcXQvRp7QWeWWBqYb9W4IywZ/lyJWs5yvyVOr9aa69flDz2RuXKrx2ED4iRmoPLW3E6JaNfmcdSOPTWKImfWCuXjC8r2NWzKaTJF5zB0+qtd89h/ONlB7ohnLNVkb/20uBfmyYi4XO1M2lNPuKJT8ppD7aNyC3JF2V2JAMZWqH/Htpaw1OyAefcefBBsbhkTAO3FL98aMe5i8P03s7CfVQPBjsQLGLx38wSK875SG/QNScQA0IknL2bIVD6XdLyO2woFDDl1HSGyMZR1nMqXIWG+3I5q3450P0Da8lOxhAAdoTolr9F+XcNZes4eactmChJNhNdEIbOewIuew7olF3rC8sDZcMvO8MCQO0ST80VhTCxljWo3bHTcfzVId/BlWb6MLi3/gehaksmJs+8qgDOkzSTf+PsItXOY/ZrCJyOiARiaBQW++HoT4onRleocV1JJxAmYtIVo+009Cqz/XHmafI7SDc6VoUZKTHroihtec+hnbpWnbv3eW+XD94fK0cLcKE+xyZ4cQ4NiaAO6SgsyDa4FVjcztx7ZbXKLJxE64lwd+lFRaJhqbVtcfB7HMI5V2iwJCYoXW4AbcQrHdRlzYzk
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:01:16.8475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5de840f-e2de-4887-007c-08dc3915c432
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288

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

