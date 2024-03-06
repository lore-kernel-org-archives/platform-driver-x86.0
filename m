Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DB97FBA0
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725492; cv=fail; b=E1msDVFKqGIp8XqEtPpTbpzexhyZ+c4Uz27Nst74rLZoCjoA2A/QF3QHINlVht56NhJm3Pn5LY+/FbGpPzMmpeuVWs2cCWoRrUYg7E6IN0tJLEbGg7yhNgZq4P+gVd9A3PMXJ8vDi2LajbWhB4nv/RmQJFX8RaIJU23srSEHaq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725492; c=relaxed/simple;
	bh=BaGx0CwHotXvGYM5uP3cdo3z2teHSXZaq7UHfjNGT7Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YuXnHt7dbdev6p1NpT1/VPHhH3IUpVQEPH8WIG7EJqm9+zJsekhyCDA71qn+Zc1WVl1ievgfS0gCOEPLUqeMYLIlg+UlT8OdO+UiZGentszL7Pu/bnLrxPw2dzcwy2wUzuSejHpvIeTgPsx5tF5CH4xAnLSHmFGkOMjQwQ1As6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nGnDOecY; arc=fail smtp.client-ip=40.107.92.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nGnDOecY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xw5FXP3xmYnxfTZhNYmGIo/sd1LTp9xJa0y3CzS/JhAZ4k1RMXW2ts0Tpe7IjqEIFhLTTbVEZRaH8LazY2NSaeZ+L1yRibOjXDtK8iIJtwWyZd8Jzna7K9mSVXeYU4bOpoZClHNzSkNlWQ44vKYLs0qEpU9fcPQ2AuevAf2n30SKGcbKhXHRcfh+EtUWU8hn4C/Gha+5iTZtN7wz/H70rMJbWmqLXDd0wWhnvDtK9tN3wVdHzwH01U9CRMxzeFD9s/NJ/RD6SIeCgLRyr+7YGNwMV2YwGu4T4xYti1YHkcVtIThMr6HyyFKsXdhp+FDG0+TGpBbzTUxnl2+lG2Hkhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyQ71t5FCRgxZgnTsaidr+RjgO1PEEKH7y8O+DYuk1c=;
 b=hqoE+iXucik0MGOVGvoFuXb9MjlPpF4yhCwSnFc3lTBOBLaUNxvQm5TG9y9HnsCFLCxTIBu0UPJ+fvDx/IEBejV49OxbgvdSt9YCrYRhOshgF74ZEZybFyVEDobWVOHnjyklvHTDQ6dpyhJiFI7geIC+14m//7+1Xsx1mM7Q04GU0Dl/wwx70aL86TMR5u6TUQSZV53ot2Xky3uBNzHvAPIUWNeu0c84OclUydT0gn0AVWgASPMLqpbGCw4ryHwxyu+AORjuuqGlWTLJYIiULQT2DuFqpaB1iMyDfX6Xo/woOYrlPbUQ1M4X/9wUGs8B/wkl7ndaGar/Oy+V30gMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyQ71t5FCRgxZgnTsaidr+RjgO1PEEKH7y8O+DYuk1c=;
 b=nGnDOecYYI6XC8y898Rp9BzIbuolCEFxWQExrqRxq91fsMiT9iTIERzGktRLRHNGJyUuHVOiCq0ziLZNZy7mNe9mgPvIJuGZYdFq1sPlpH4LBN4fye5ImYd01rtg5T04+JEkfBkwdz4DnMVj8xRfHI2xPtmJQXAEVvp/YA2Tzu8=
Received: from SJ0PR03CA0184.namprd03.prod.outlook.com (2603:10b6:a03:2ef::9)
 by PH7PR12MB5711.namprd12.prod.outlook.com (2603:10b6:510:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 11:44:47 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::b2) by SJ0PR03CA0184.outlook.office365.com
 (2603:10b6:a03:2ef::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32 via Frontend
 Transport; Wed, 6 Mar 2024 11:44:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 11:44:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 05:44:43 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v3 4/7] platform/x86/amd/pmf: Add support to notify sbios heart beat event
Date: Wed, 6 Mar 2024 17:14:12 +0530
Message-ID: <20240306114415.3267603-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
References: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|PH7PR12MB5711:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f38cf1d-6cee-4949-acb7-08dc3dd2d2b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mRl9ZS+Sri1QJky43tHyVS1qHDq30rt4VU/gbK+scaI1jPwWBf7NB2s8zDY4wDCatVz365fJOfwyeCXKd/2tF4mFPG4XQ074ATnLFREZuELO+wK5HVY+ybsc5/aX7tiYGPr3R6rPDus1vlELXofLoB5+HdtKRGzhwX3iagxeQ/NWxODlIlba0WJ8xp4G9BgUuXwnhvZhs1t7XUDXiRuc1XJg7kWsSI75UFze/w2WiyjaD6K3H9Tit+PU4wlEWbkMr6RVnv+VDzS3aWaycI6ULyDLrfAvc/vWCSauMk1q/UXLufDp4/YbusXK5xTWJfg49wVf+t7x3FHk3H/Vl+OzOmMeStLq++SvogLbk0pCiqdlzQJcXHp+Gb5d/hQ/bMhMvB0tL/PqBDqLvncGona+XmwIdMttWYd6SfxFiiMlO7KbBXVBNtYb7OXZEKBdY4j2X7qf3Q5fSqmk8+GI/22TFrpRMwrIDNCfb+rwnCTGSn7ST+mY3dIBqiqXHSy8iq2bPGpKH1783m6fGQVAXy9keCzzaE/xCAjSV7dffsVSj6sAILGd6vuc8+WgNXzyrxmfecixqkvSBBiwhwWFONcsbnmVjPFV/rfd2YzaLMMZgYWz79kUmygfSk+X4ZJGmVNEr753JH1b658MNBP+3zIs6piWt9QQDkhPEGTEcp8L+VHtHPVCCiIovojZZDKJOy6VxIlRtei9YzYXaRCe/Ss4ZPe3lq0IjGYouNR7t4M7TaMZl4LaUv6Vfex01RRRQV8g
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 11:44:46.5596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f38cf1d-6cee-4949-acb7-08dc3dd2d2b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5711

Add support for newer revision of the heart beat notify events.
This event is used to notify to the OEM BIOS on driver
load/unload/suspend/resume scenarios.

If OEM BIOS does not receive the heart beat event from PMF driver, OEM
BIOS shall conclude that PMF driver is no more active and BIOS will
update to the legacy system power thermals.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
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
index a6bdde4f1c68..53c0f61e5c5f 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -299,6 +299,9 @@ static int amd_pmf_suspend_handler(struct device *dev)
 
 	kfree(pdev->buf);
 
+	if (is_apmf_func_supported(pdev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
+		amd_pmf_notify_sbios_heartbeat_event_v2(pdev, ON_SUSPEND);
+
 	return 0;
 }
 
@@ -313,6 +316,9 @@ static int amd_pmf_resume_handler(struct device *dev)
 			return ret;
 	}
 
+	if (is_apmf_func_supported(pdev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
+		amd_pmf_notify_sbios_heartbeat_event_v2(pdev, ON_RESUME);
+
 	return 0;
 }
 
@@ -435,6 +441,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	amd_pmf_dbgfs_register(dev);
 	amd_pmf_init_features(dev);
 	apmf_install_handler(dev);
+	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
+		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
 
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
@@ -446,6 +454,8 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
 
 	amd_pmf_deinit_features(dev);
+	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
+		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
 	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
 	mutex_destroy(&dev->lock);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index aeaaff290bff..bcd1ae71109e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -34,6 +34,7 @@ struct cookie_header {
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 #define APMF_FUNC_DYN_SLIDER_AC				11
 #define APMF_FUNC_DYN_SLIDER_DC				12
+#define APMF_FUNC_SBIOS_HEARTBEAT_V2			16
 
 /* Message Definitions */
 #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
@@ -89,6 +90,21 @@ struct cookie_header {
 
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
@@ -609,6 +625,7 @@ int amd_pmf_get_power_source(void);
 int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
 int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
 int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
+int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.25.1

