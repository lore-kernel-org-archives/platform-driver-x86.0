Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE43513AD11;
	Fri, 24 Jan 2025 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737730062; cv=fail; b=AxS9E7mZe4qIYZA3dpFQcGFPFIxIpMIS2rCCWA8wN8SdFF4LtpcArCGy6caktycbjCN6OuvHyI6HDV7bprhgfdJM8AjjhIQc7AXgiPvZWCJCfK/JUonYWqZ6GH97lUY6iu4HW2GgIUqLSolprasVrGh+SDFVWw2paeIjvqZH3Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737730062; c=relaxed/simple;
	bh=RpM1VcRXfy4nfEl5YQu3/Si6EUabT9wQCqGjkTx4l6A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TLgbajRA4l1mWyqeQCkWe+dQQcITPrHF7gPD4qs/ngu66XB49nAD1nVNUaw2ME1gJT2KwzmKV96tbi+8R4EI/kqaO2CVb2hl1FgRI0qljwVFFqA4LngM7iEQ2yWT74tGgYXSV6ogekGCmZNrjWr/GZ62tshn1zz2eaJ3SqeCXeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tWbz94kN; arc=fail smtp.client-ip=40.107.236.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tWbz94kN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpPi7Acs45Fxt1ghCEYmKytI0c9GLUXoDg5qAlWfCiI63t0RGjoi8VkZ8kH3vM5TZshGlybd3yCijDHUhnRLqaHBPB9hmufbF3sKDFDNPuH/ZM91BYd67WluVfJTRg0NdZEqIr9tLtsbXLs0HCqJfyPb9+yRMmBP8yZR0LatZeAlW94m9MJ9gMuC9nbvBRfrGlrdgCPx+R8QH1smwT9zBDYTgH47qD6a5ejmr1kkjkCoX9tR/7CHr1EBTQ9ESPDHWgIkTBO/qbdPfyLYmInO6CX9S/2l8fYj7woTYl1xFKB8su7EkqW3bZtzV1hfMnCQMhkTmuGgsyy3AeH93Pl+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1665m62D759SzChTWNOFNu+YXldySHU+wgCZx1A3XQo=;
 b=E+B6O0aKWz2UL7uXQg08U08bTse3420Les4FAAO1uaPO0lSdaef86GD7YvivauWboFncGZmz5HC+rv5xSwt4DDr3YcbjSF9whO19EUVyuSDLMB5yQZSAsV1CsQwOBGSRP4K0LyzWxIinLzi1nzCzgRKWxSNQ/9GqGY60E+U5nNaGOYcRuj2saE7qfGFqIVu16J3UtwFngGCNfjLitJ4wKdueU57Jb8XSgLn1xDkSCGd8i6yw3bP1eJM4yfnIejKyTn8JyF/Odas0nrDMyEnJK/U3cBfttrZ9+PlLiRYMxwnQcHss6wVQHf/1vsi9909jFih22u1hCMJofL7nvVdhIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1665m62D759SzChTWNOFNu+YXldySHU+wgCZx1A3XQo=;
 b=tWbz94kNEN4UUzRiu4wJJ40yLZJi/TQnnu1/RNI2NJp2mGgiRgSq3b2XcWSIIsHPMBriLYO+PuA+W9+RPmD4ZYYyQ6p1w8zcHtRJIGBFh5s3nLrFMziksowzpITD/osElySNzBXAC9QyODIZuLID2Mp+OSqCXq0l+aad6A5CkVE37gLiZwUt0nvPQJQTnIWb7+SDGkYwz2J7rSQ6XV1u4men/R2G40aCRx+QvuvXlJrKWW6/3FsBFsLQSJ2aosr1zT4PnOacwRZVjn+26LlMlmrSFD0/FcliFhIqBH9oD4sDeQrEOcaEnajy9AOG7MKxIb7zWH0UHpCSn6t/HKwPaA==
Received: from CH2PR05CA0048.namprd05.prod.outlook.com (2603:10b6:610:38::25)
 by SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 14:47:36 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::8b) by CH2PR05CA0048.outlook.office365.com
 (2603:10b6:610:38::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.15 via Frontend Transport; Fri,
 24 Jan 2025 14:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 14:47:35 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 06:47:23 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 24 Jan 2025 06:47:23 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Fri, 24
 Jan 2025 06:47:23 -0800
From: Xiangrong Li <xiangrongl@nvidia.com>
To: <vadimp@nvidia.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>
CC: <davthompson@nvidia.com>, <asmaa@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Xiangrong Li <xiangrongl@nvidia.com>
Subject: [PATCH v3] mlxbf-bootctl: Support sysfs entries for RTC battery status
Date: Fri, 24 Jan 2025 14:46:55 +0000
Message-ID: <20250124144655.48564-1-xiangrongl@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|SA0PR12MB4431:EE_
X-MS-Office365-Filtering-Correlation-Id: b37c9422-5563-404b-bcfa-08dd3c860ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODVTMDYzQm81OWpnUCtJWCtWeXo0enc5eU94SFhIYlNNWWtPNEo1UDdrdVFh?=
 =?utf-8?B?aEIwN1lhQzZRbW52SHk0RXBHSUJFbitaS29XbDFYckdMd25oZUxmd1kyK2xx?=
 =?utf-8?B?YURMQjdiZ2RMRHFWdWNiVTgzdTd4L2hwMnRLS0wzeXB2d1ovTGRwVkxXWXZD?=
 =?utf-8?B?QWNCR0VCUWVWMDJPUW9Tc3QzTjJxQ21GeFVvWThRUnIrMWJpSjdzQUt0UTlN?=
 =?utf-8?B?dUJHdEJ2RkxQZFB2SEgvaHlXc0QxWklzM2NxWGx6SDhCN3hQVkRiWUtnTW5T?=
 =?utf-8?B?YUxoUXVWeW5DWk5KaURLVmVCM0ZoWHIwNHFtemhNYWZNaDlZVW5VQUhYY1Jv?=
 =?utf-8?B?UFRGdDdYYUNWOVhHWEN3WEFyQ25RTTRva2Y0TjdlcW1jSFBKUFNkK0N3Y0xB?=
 =?utf-8?B?MWQ1SU13amRVUzJGeGx0VU9qdGpEaXhUbit6SmFXUW1GK0FhR1l5RGdZVnR2?=
 =?utf-8?B?RFRNZGE2TWhuMjNOSlVkS2luNTRBdmU2dmVFYUtLWU43ZndTQXVEbGt3QW8v?=
 =?utf-8?B?M3dzN1lQcmdsUTg2RmwxblZReXJ3czJsKzViUStPQUlmUUFTL1dLaUZCd0JW?=
 =?utf-8?B?OEZTZ1Vua2VEaHlsd0xMTkp5cUQ0eVl1SlF4TFdMSzY0WFFCSkRncG8yNHNa?=
 =?utf-8?B?Mzl0ZWU4Z3ZHNUpRUzRSNXVNaWVsMDFsaUJiL1Z0K29aTEN6dnl1eWxEN1Zz?=
 =?utf-8?B?b1J2b1F2aEpzNERpQkNaWksyV1EvNWcwdHc2NnVnVk1WcEM3RDZyK3VFaG1F?=
 =?utf-8?B?N1YwdkRvTkF6ckZtcm9Pd0tsVCtwY3JxcktKZ0xEYWsxZG8zdHBmTTZUNS82?=
 =?utf-8?B?UjViSWV6akNZVXJpRmxIV3pNTHZrdlVYYVFvQXI1bDB0aEEzYU1hYldTWW8z?=
 =?utf-8?B?VmZ6MzFUZU13WU9ERVBFT2ZQR3Z4SWZ4ZzJDckUzeXdBMWJyMjdsbE1qbGpO?=
 =?utf-8?B?K0g1WERZQ1FFelFsZXY0RjJLN2dwMUs3cHBJR0tUbi9FNkpsQzZwcTdFT0tl?=
 =?utf-8?B?MytTUG9mVXJRdUlFQllvamFld0hSRHVadktJYW8xd0VvZzNEeWljZ1VpT25F?=
 =?utf-8?B?Ymp0RHprNTVDeG1ST2pIQW9ZbFE1NFZNOFRIeHl5OE0zejR6d3BIall6NlBR?=
 =?utf-8?B?azZrSVZkTHhuU2Ztd1d2R0dBZ0F0SWFQWkoyRk81OENMQktlQkJVNmxnMkRO?=
 =?utf-8?B?ZGp1aUg4V2tQcEVsYkdzdHRkUFBHbWx1M1JnMUFpWXYvd1owb3JnWUNRK1lP?=
 =?utf-8?B?K3BsS0cxdWJ1eHl5Ujc5dnZoaFYrMVJZNnhmVk4wNWluZ3JaYm0rdW5RWDJW?=
 =?utf-8?B?SVZCYXN1M1lLYUFoTTNEKzV1ZVBFY0dQMjJKNGl3WExzK1RzSHRrKzlvMmtT?=
 =?utf-8?B?dlNCV1MycHhBaTlaUFJVdElsMS94L3JoRUI3NGJMKzFsN3J4d2hCRVlYaktS?=
 =?utf-8?B?Uzhkb3U0VlA3RkhYTVNDanV4NklyQ21OZXM0STBCYXF5M1pOWlg0SnptR3pW?=
 =?utf-8?B?S2dxRENjai9VczJJZHMxc2RtVlVucUU2V2RiRDRZN0pIbVd6RkFwYmxZMDZJ?=
 =?utf-8?B?WVhxUGxQMWtsa3NWYlpUdzFlMWxPRWtSL2NHTWIwRFRTMmJuRnhQTHYwUDE1?=
 =?utf-8?B?Y1dINFFEMk1lMDJiNXZoYTdDZ2hrd3ExdzZ1U2REZlB1YWNXbVMwQ1dDbEUv?=
 =?utf-8?B?MVBydFpDL0o4cTFGcVVyMFJ5Qk93Vi9YWCszY3pVVEdkUndNOHdmT3c2d1lB?=
 =?utf-8?B?ekZDdE1TVGVzWENFZjhTMDhWTnk3bks4REMrZEZWbkVYVk1icmtyU1cvYW5i?=
 =?utf-8?B?U1hPKzFWNUNqdGVKM2tCMmVOVlM4NmRmSjNaRzBkNFd2b0lyemd0aW9rYWh4?=
 =?utf-8?B?RnVPbU4zUVp6bktYSHliUGhkc1dPVmRPU2JFRWtJTGZ0blNvRHZWWXNnQzlX?=
 =?utf-8?B?c1BPUjdUWXhGR3NSYjcyaEptbm9hd0h0R3FUVFJQVWt0NUlMa0IzWitqNVlY?=
 =?utf-8?Q?tVE/WFyfRptS4UMBRca2XWry96ttv8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 14:47:35.8038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b37c9422-5563-404b-bcfa-08dd3c860ab5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4431

This patch extends the mlxbf-bootctl driver's sysfs entries
to support read access for the board's RTC battery status.
A successful read from this attribute returns the status of
the board's RTC battery. The RTC battery status register is
also cleared upon successful read operation.

Signed-off-by: Xiangrong Li <xiangrongl@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

---
v2->v3:
    - Updated kernel version and release date.
    - Updated the reviewer.

v1->v2:
    - Updated Documentation/ABI with the new sysfs entry
---
 .../testing/sysfs-platform-mellanox-bootctl   | 10 ++++++++++
 drivers/platform/mellanox/mlxbf-bootctl.c     | 20 +++++++++++++++++++
 drivers/platform/mellanox/mlxbf-bootctl.h     |  5 +++++
 3 files changed, 35 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
index 65ed3865da62..09f783fa0a53 100644
--- a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
+++ b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
@@ -150,3 +150,13 @@ Description:
 		The "mfg_lock" sysfs attribute is write-only.
                 A successful write to this attribute will latch the
                 board-level attributes into EEPROM, making them read-only.
+
+What:		/sys/bus/platform/devices/MLNXBF04:00/rtc_battery
+Date:		June 2025
+KernelVersion:	6.15
+Contact:	"Xiangrong Li <xiangrongl@nvidia.com>"
+Description:
+		The "rtc_battery" sysfs attribute is read-only.
+		A successful read from this attribute returns the status of
+		the board's RTC battery. The RTC battery status register is
+		also cleared upon successful read operation.
diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform/mellanox/mlxbf-bootctl.c
index c5b36837e694..bc31061f779c 100644
--- a/drivers/platform/mellanox/mlxbf-bootctl.c
+++ b/drivers/platform/mellanox/mlxbf-bootctl.c
@@ -91,6 +91,7 @@ static const char * const mlxbf_rsh_log_level[] = {
 static DEFINE_MUTEX(icm_ops_lock);
 static DEFINE_MUTEX(os_up_lock);
 static DEFINE_MUTEX(mfg_ops_lock);
+static DEFINE_MUTEX(rtc_ops_lock);
 
 /*
  * Objects are stored within the MFG partition per type.
@@ -489,6 +490,23 @@ static ssize_t large_icm_store(struct device *dev,
 	return res.a0 ? -EPERM : count;
 }
 
+static ssize_t rtc_battery_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct arm_smccc_res res;
+
+	mutex_lock(&rtc_ops_lock);
+	arm_smccc_smc(MLNX_HANDLE_GET_RTC_LOW_BATT, 0, 0, 0, 0,
+		      0, 0, 0, &res);
+	mutex_unlock(&rtc_ops_lock);
+
+	if (res.a0)
+		return -EPERM;
+
+	return sysfs_emit(buf, "0x%lx\n", res.a1);
+}
+
 static ssize_t os_up_store(struct device *dev,
 			   struct device_attribute *attr,
 			   const char *buf, size_t count)
@@ -906,6 +924,7 @@ static DEVICE_ATTR_RW(sn);
 static DEVICE_ATTR_RW(uuid);
 static DEVICE_ATTR_RW(rev);
 static DEVICE_ATTR_WO(mfg_lock);
+static DEVICE_ATTR_RO(rtc_battery);
 
 static struct attribute *mlxbf_bootctl_attrs[] = {
 	&dev_attr_post_reset_wdog.attr,
@@ -925,6 +944,7 @@ static struct attribute *mlxbf_bootctl_attrs[] = {
 	&dev_attr_uuid.attr,
 	&dev_attr_rev.attr,
 	&dev_attr_mfg_lock.attr,
+	&dev_attr_rtc_battery.attr,
 	NULL
 };
 
diff --git a/drivers/platform/mellanox/mlxbf-bootctl.h b/drivers/platform/mellanox/mlxbf-bootctl.h
index 1299750a8661..90bbbdc65879 100644
--- a/drivers/platform/mellanox/mlxbf-bootctl.h
+++ b/drivers/platform/mellanox/mlxbf-bootctl.h
@@ -103,6 +103,11 @@
  */
 #define MLNX_HANDLE_OS_UP    0x82000014
 
+/*
+ * SMC function ID to get and clear the RTC low voltage bit
+ */
+#define MLNX_HANDLE_GET_RTC_LOW_BATT   0x82000023
+
 /* SMC function IDs for SiP Service queries */
 #define MLXBF_BOOTCTL_SIP_SVC_CALL_COUNT	0x8200ff00
 #define MLXBF_BOOTCTL_SIP_SVC_UID		0x8200ff01
-- 
2.43.2

