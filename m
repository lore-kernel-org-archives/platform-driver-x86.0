Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3CF1E7657
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509313; cv=fail; b=jaCqNhYnf3ITcJcm/9zoSF5oR152/Voe28LhHUkWldRtlC/eJ7CayJz4tnGqDIgqcUG+OHdhvSeVLJaKmKLy0VPka+gYqpXsVqOX6T8agXYcmyJrpkNv/xNMYrmxuoWvDREUKuBpKzQfcOOCCuOWxHCtZoV8RcufVwvzozxofZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509313; c=relaxed/simple;
	bh=cDT4wx4xlEexHnFVR8A35jf0NfzQCMFqRQwgzsHjo8g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O0X4vVVF6qCYVhMzIlC1O7ko7HSGz+3ZZxyUVuBZDfoMM1heaZDLYlBf7EoPvkcdp8tR773+j71S1RcMLiSg6dBKP8g3+xiAKf/KPQ52+ObFY4badI5DKPxl+OVausi85AC8plyPGa0jM8pbAzrXfdfTqaahhjlMMLtrJDlQDgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KSTVaAQx; arc=fail smtp.client-ip=40.107.92.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KSTVaAQx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOv/cDsCci/6FJ6rkmgTyLAPS7UP+KHgeIgB3GLCqQwwn5vTkfYh/x+Icd5sLvzCkv9CBE3Ff+4m5i3zW32nB0FMfSjPkaKgMuL7/Gp5UCJa+ev0udBvOqaDO8NvCXFftRYUJ86gWNvZ9c+c6SLvuIGpJj1pNsPRgYkgAhOQXrXfw3rHtKBfOoTrDVCD1LZRsXqt6AciYIzh5l0rt9JT4KjTV33queKFHY3mOVWtEaTGNk3kbaVEwyEiAd6yV0fqeuGXdn/Vdh1u/yLJTivSoVjLqoGEzYarOKi+HH6AfL5uZL5s6txXbEc1qLSB0Dhosp6nvy8WaC4SrglhZr+MJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7FL2Wu7sXmPOl356pDKIA4bj6t24fMtDFZnFfjz+dU=;
 b=hTexACSq2PzzCaxbTZ87D4LseCMKIuVGr6UyvckPm2cInKes44jrqvQvnFLJndxek/kzBwhqtsIbT6VRShNKgfygIACcBPTRQam5TQMbQS+vRUxgvPVuDHsaVMPUmDB9zLWZSQpAz/7GS7cRP8s8oTUhcwdbnDTNJiXPH0CyV0gjCe6UX8MLLhwXWVzFEo7fI3RwiIokCLUt+kf3Xg5dBkBXUIfX9oo+T5AOUWCZ8lMLxCbnF0fBt0njS8B9ODW4pnP7ajfattICQE5fUb2/nWT4T7yWwIAOqSu9xC5IJc4jEmKDfVrb86NGNqi+VsdpZB3k4JS80lfyIRK02V+cDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7FL2Wu7sXmPOl356pDKIA4bj6t24fMtDFZnFfjz+dU=;
 b=KSTVaAQxXiZe15GwTxfHApyIwVdPJRjkJ0j5LMaRI0HzgWTsJflovmkFwi5CzhHF2zoKlHrLsX72dkKn02OGbsWfcVYdpORtlPMaOTsMiabKExuCMJ5JlPm35/IxoFlxkNaxD3XGP3d89BBZJBSfxXMiR0Y1gqboGBFlnWtbcfQ=
Received: from BN9PR03CA0078.namprd03.prod.outlook.com (2603:10b6:408:fc::23)
 by DS0PR12MB8502.namprd12.prod.outlook.com (2603:10b6:8:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Mon, 21 Oct
 2024 11:15:06 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::95) by BN9PR03CA0078.outlook.office365.com
 (2603:10b6:408:fc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 11:15:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 11:15:06 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:15:04 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v10 09/11] platform/x86/amd/hsmp: Use name space while exporting module symbols
Date: Mon, 21 Oct 2024 11:14:26 +0000
Message-ID: <20241021111428.2676884-9-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021111428.2676884-1-suma.hegde@amd.com>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|DS0PR12MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb5fd6b-8885-4455-d454-08dcf1c19e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nyziwD64/xpV4PW6WPlhQ3/1mXNVlYx/HPXa1h4L9arMlXs9d5U20kTQMdnn?=
 =?us-ascii?Q?ONS+/j7WA6s0WYInYzsrgP8vUuoUFY282MD8fYKQLE5D+gCfFx12KOFp1s63?=
 =?us-ascii?Q?5F5UBjZAt0MFP3+OmJLIOKxDEJzq4t0CYvXJeC2v1XHb7a1sWpdYpM7TGh63?=
 =?us-ascii?Q?gzHdxxyE2mZUrbbrd+wJ8ZQYt3xwvrRpD85knPfivM9XBXoT1HswUzpQPpFe?=
 =?us-ascii?Q?hjhxJfHIU3tGAWQEvzyDivv+EkMNLHVk4RDZtoZ7YJgvNe1dsdx6l9aHLp/u?=
 =?us-ascii?Q?mAkezBn8GIYthGOb3Qwd5NcZZ/7E33aony5Mc2kSa2zVPt+8Gy0X5j8bguag?=
 =?us-ascii?Q?6qqsqu1mU/KPzCVw3Lsk5QY0raW6W/US5gKYFjsb/xKSoyctkKEIPwqzZNwN?=
 =?us-ascii?Q?huuLXsfJunCuxgs3nyBWN8ibuInN0mlPlfRTGcdu7iM3mA18J4MulQIFZGs+?=
 =?us-ascii?Q?dEOB+y+HCm2hJ47MKX6RenTHKwq9iXFjlcD8TucLyMb42YALWLCDHhQcxIYL?=
 =?us-ascii?Q?LxD7ZhhcnN1yD9iECrNAeoSZfzpLfK6D6CAUbTTq11U+qbnlPzR1c7LWzPI0?=
 =?us-ascii?Q?Gk3/IFBS40ElR4FxyMUWkO6DWaxjfRrbDdxFYI+cEl/hrwEE6NnXaqRyGxBE?=
 =?us-ascii?Q?P0v/okTgQ5eRjRjo3+h0PLOGmM6V8UmoJpL8wQYj8fnFzTYJXzvIXy3c6XiG?=
 =?us-ascii?Q?8bYaX0rSKc1PvzQgUXVUV4TU6pSx65SYG8RH24HBABn0vYoZU9b24KjD7ODa?=
 =?us-ascii?Q?Yxwjynd9WApghUqNXnpbPlwWhdGEWNrsPTzPv1jfk8mFdlca88d18u5dNazN?=
 =?us-ascii?Q?6ehERnhA1J8kw0j1U+mPDrpxzMHsjnuxB+YCSJYjT/s8MSKzhhgK2onnGw94?=
 =?us-ascii?Q?uf68J/l7h/IRjvxR3b9vNF6HAAZCpjyK91fXnKcujXmEBwcBLcYjgYt8oect?=
 =?us-ascii?Q?MsQI9zZefVOkrNY1fwQWVJF5+BvSezd23AptXl/miNDaP4jQr3WezUA9pxnQ?=
 =?us-ascii?Q?EbcAKK3n2Kwgc4ER5I8fW2pbDh4+jGRJhFFFHK48XryibKEZSVRlczlraBPF?=
 =?us-ascii?Q?381tdBN5SknnPfVOG7elDSNBYuD+Bfl7r2OKS4gTvNSjtjr3E661t89DD9+/?=
 =?us-ascii?Q?+7KeO07BMDHEfMlh3MpgRII0E5zGIqmOqZNnpGkym7jeHWVofprWI34sav/Q?=
 =?us-ascii?Q?CNgtuOorcp06pLXtvjSG2mopwZ9dRarOlXPiH2NH4kCjT/717OlXKzqlFW0J?=
 =?us-ascii?Q?QKnPZjhL0dyW9O8M0yt8Wpz7f9fk7glMORazNxSrzTEbbiTGuDju+WtQ1Bpc?=
 =?us-ascii?Q?DdoXpvSEORP2kMrZI7uyMkJWt9g5r6nC7zPorKtWbBZI5E/CePxteMc+X2ae?=
 =?us-ascii?Q?d+gOjSj36Z/7wlrHkv5lb0unaDJHEUVjbdgd4d6GqyqRF+jCKw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:15:06.6328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb5fd6b-8885-4455-d454-08dcf1c19e54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8502

hsmp_send_message() is exported with AMD_HSMP name space.
The other modules who would like to use this symbol,
need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
to get away with warning.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v9:
None

Changes since v8:
None

Changes since v7:
1. Changed from EXPORT_SYMBOL_GPL() to EXPORT_SYMBOL_NS_GPL() for the newly exported
   symbols in hsmp.c.
2. MODULE_IMPORT_NS(AMD_HSMP) is added in hsmp.c and acpi.c.

Changes since v6:
None

Changes since v5:
None

Changes since v4:
None

Changes since v3:
None

Changes since v2:
None

Changes since v1:
None


 drivers/platform/x86/amd/hsmp/acpi.c |  1 +
 drivers/platform/x86/amd/hsmp/hsmp.c | 18 +++++++++---------
 drivers/platform/x86/amd/hsmp/plat.c |  1 +
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 098c879798e7..06315ecf0b5f 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -343,6 +343,7 @@ static struct platform_driver amd_hsmp_driver = {
 
 module_platform_driver(amd_hsmp_driver);
 
+MODULE_IMPORT_NS(AMD_HSMP);
 MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 4fa0850c7824..6fd08f16933a 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -36,7 +36,7 @@
 #define DRIVER_VERSION		"2.3"
 
 struct hsmp_plat_device hsmp_pdev;
-EXPORT_SYMBOL_GPL(hsmp_pdev);
+EXPORT_SYMBOL_NS_GPL(hsmp_pdev, AMD_HSMP);
 
 /*
  * Send a message to the HSMP port via PCI-e config space registers
@@ -193,7 +193,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_send_message);
+EXPORT_SYMBOL_NS_GPL(hsmp_send_message, AMD_HSMP);
 
 int hsmp_test(u16 sock_ind, u32 value)
 {
@@ -224,7 +224,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_test);
+EXPORT_SYMBOL_NS_GPL(hsmp_test, AMD_HSMP);
 
 long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
@@ -309,7 +309,7 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 
 	return bin_attr->size;
 }
-EXPORT_SYMBOL_GPL(hsmp_metric_tbl_read);
+EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, AMD_HSMP);
 
 static int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
@@ -352,7 +352,7 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	else
 		return 0;
 }
-EXPORT_SYMBOL_GPL(hsmp_is_sock_attr_visible);
+EXPORT_SYMBOL_NS_GPL(hsmp_is_sock_attr_visible, AMD_HSMP);
 
 static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
 {
@@ -391,7 +391,7 @@ int hsmp_create_attr_list(struct attribute_group *attr_grp,
 
 	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
 }
-EXPORT_SYMBOL_GPL(hsmp_create_attr_list);
+EXPORT_SYMBOL_NS_GPL(hsmp_create_attr_list, AMD_HSMP);
 
 int hsmp_cache_proto_ver(u16 sock_ind)
 {
@@ -408,7 +408,7 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_cache_proto_ver);
+EXPORT_SYMBOL_NS_GPL(hsmp_cache_proto_ver, AMD_HSMP);
 
 static const struct file_operations hsmp_fops = {
 	.owner		= THIS_MODULE,
@@ -427,13 +427,13 @@ int hsmp_misc_register(struct device *dev)
 
 	return misc_register(&hsmp_pdev.mdev);
 }
-EXPORT_SYMBOL_GPL(hsmp_misc_register);
+EXPORT_SYMBOL_NS_GPL(hsmp_misc_register, AMD_HSMP);
 
 void hsmp_misc_deregister(void)
 {
 	misc_deregister(&hsmp_pdev.mdev);
 }
-EXPORT_SYMBOL_GPL(hsmp_misc_deregister);
+EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, AMD_HSMP);
 
 MODULE_DESCRIPTION("AMD HSMP Common driver");
 MODULE_VERSION(DRIVER_VERSION);
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index ce6cab23dce8..a41aa0979da5 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -265,6 +265,7 @@ static void __exit hsmp_plt_exit(void)
 device_initcall(hsmp_plt_init);
 module_exit(hsmp_plt_exit);
 
+MODULE_IMPORT_NS(AMD_HSMP);
 MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
-- 
2.25.1

