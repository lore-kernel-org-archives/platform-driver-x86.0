Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2752441C6A;
	Thu, 16 Jan 2025 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737048830; cv=fail; b=TwaXb4VsLKlJhWeDXV1nwak9jMDPh9kjQJ1ABDwonSMpWsJkiViktcm6Y1SIs2SpVJx2bIL7AaYgIlE8o1XilAW3Tuuzo+adcbdXhM+ycBommKpBSsT/eKKxrTOkpZ1y5/pmO2R9OkgMW+S4v5lN/CW6QU3MlfNhw658CkKZVAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737048830; c=relaxed/simple;
	bh=Sb0JHJ+DNBh496WdM3dTv3hLTiTh5M6YLlrFcz2Nsdw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tnLoPr6RfUuSf2EOmB1OTJxEUTNSHN5Vw7Sm1QkNVAO4nyF3DeQSaGuVSR2phqxgEYm6M3zcc/oRpkTMaWG/alM16SyAdNBX6+77+8LzCrZPMFAtmOl9qfWERZJ+rEB2fFt7TtuvKpQSnE/ZBpbTnAQlIRcpxQr93rYOGpR6kbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DBLvOw0t; arc=fail smtp.client-ip=40.107.92.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DBLvOw0t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNSxlxEs80VosjocSrrUTaiMyO6fl68XpY2slOYubBa6vJj1jZly1Ld4Y/atKYPbnZDv8U/E0HDrrHKyPO0DzTPjp8uVnabrxGCWGb9tyS252Ckg9Bt5UUh7Oz6XSf4Lqr/rf7oAqxfV0xxbotspzGizFq1KazaRcQcNu+F4G98Q7TzodacnJh6177xBAPN7THLtBFaoMzP+mtxvKy8ne+bmd3j+2V0zhkn2zyEETUKfzYM77J1IicBIivIQzzqU1Ma6TYpCO8539spJdGKKu+LxJDgpAptCZJHOaULKJViDkO2t6i4nOzQe7yRRsvYywZz5dFcmiyvU3ce/818naQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJaJF5D3A3XWsV2a6QJ9T+f75MK9NfE3Qx0HD9THoeM=;
 b=oa1jnkga46KQq8TFzvhh0DHhjlzSzyOGOLv5DZWnG1Vwr2n0lxdbViLgZON8PYdgKr9Lr4NbJL4LRoree+FvFSQ6VZ91sm0mpOEoLVo3tKgXiqBe3hDoTAwMTWX6wTBqG7c5fADCz96oycIx7Kq8yovy1rc9VsNkPCZB6VRBjDkLX8feamLK5k1ghv31CFmNyeFTIpWaZINDxbQZ+AW3UU5+vwhPvqg9vBVhEcxwqWGs1qSPJRN8HW/cxRolEbHvbifFY9ihX6jfKqQ715hchNxjrlbXAmh8qpAqXPTpAGNH/EFuj1dcVMMxTzc4diUvifYunVAOspPqLnGLfOeieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJaJF5D3A3XWsV2a6QJ9T+f75MK9NfE3Qx0HD9THoeM=;
 b=DBLvOw0t9abSYg1pL93Z5bWC5QwOISs7IfsEt/oI/CrY7JIOPnrf4pUgoBqF99necqKeVdjlsoZiaUn/NxDL75TKHX++Nv8rbgEusHKYyoqJWMrr/3ZtgFQ7HNEB8lpRtuXeLCZ8D0aNhBJV7oohKEVZrHIBElZ7SaWBEuERH2rgztA0JbblXllEVxmB5HY/ImcTYUUw9biZU4YsKrPcjbyuLpmI+COFmlD7q9XrHEZcJZo6KvlRC0xOfsK0ujgP3LUzRkqqJZpbUv3H2XD4U5HkPG/HNLKu7mqXremawxplhjKu6iMo0MMyVmtC4XaeFxBGe37Q36l0UwEgILB9xA==
Received: from SJ0PR05CA0020.namprd05.prod.outlook.com (2603:10b6:a03:33b::25)
 by IA1PR12MB7760.namprd12.prod.outlook.com (2603:10b6:208:418::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 17:33:46 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::bd) by SJ0PR05CA0020.outlook.office365.com
 (2603:10b6:a03:33b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Thu,
 16 Jan 2025 17:33:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Thu, 16 Jan 2025 17:33:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 16 Jan
 2025 09:33:29 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 16 Jan
 2025 09:33:28 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Thu, 16 Jan
 2025 09:33:28 -0800
From: Xiangrong Li <xiangrongl@nvidia.com>
To: <vadimp@nvidia.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>
CC: <davthompson@nvidia.com>, <asmaa@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Xiangrong Li <xiangrongl@nvidia.com>
Subject: [PATCH v2] mlxbf-bootctl: Support sysfs entries for RTC battery status
Date: Thu, 16 Jan 2025 17:33:26 +0000
Message-ID: <20250116173326.48532-1-xiangrongl@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|IA1PR12MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9ab556-4a20-41c8-2879-08dd3653ede6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DolBRo7cyalATMjSY5xteFcUn4DgW70UPb8OwsU/CtfDtvw7gL5YIVuRtEKO?=
 =?us-ascii?Q?b4WkMb6uTtBBp5IwKfadffm25z3+6o43GXHduycMwaGmpi3g8nhKnKkC4SQT?=
 =?us-ascii?Q?kMEakoGzWcxTRWlW9omJkzEGSQdtIPw2fdgGrCiMNUWXXLgHPCmvaHOqk9LE?=
 =?us-ascii?Q?wKIlkA8J9gZpFRmkMgjWsn9WYcFzv/O4GMy98j4mEApf8a0DC8iUXm4uiObL?=
 =?us-ascii?Q?Zx/u0GZuzK7QXEhokp3GGId+bM+TdgUUlrEbq5I+q4PlwAhp+k+NjhEMwVky?=
 =?us-ascii?Q?v3GPx2tw6IlEObKbEHAFHGJKQzTY/R5B3BW3tEe1f+4LGC+n5fnxLBgjfC/F?=
 =?us-ascii?Q?HUmzvS0p+aElMuUI+ST6JhrgPlSCfHxlN6quDchh/NQB9vCEQPCTX7IrqZT4?=
 =?us-ascii?Q?txjTPzknwhIdDcc3Q/ihu8GedU5AX98XJsu0gWgtJcRpyHhAWZ8+WcGN7S0F?=
 =?us-ascii?Q?LI4Y8D68kg4xSTXXnluPyekLb3L3DJGyPtrYZB5UPntwpSMu5HnlgnQcvNhO?=
 =?us-ascii?Q?Wc32JAymIT3th3wKcEaKHH6CfGtgch1FPBlW/Sx2NIcs84ygiMkyYalWROf6?=
 =?us-ascii?Q?na+uJWxIUNpzNOxpuLXosyVhBZ2ihJW7KYSeGpbAm4lCDNIE+cnRdTPX31Js?=
 =?us-ascii?Q?9GZan1WvZH8GAb/gUTgm+gCBK0bw4N66xbbY/4Rz58b5rvjRYwUMZ074a0Qv?=
 =?us-ascii?Q?wCQjPurX+YVsDm7imwsaNrHfgFVk71lXr0iYHakDRIVVoGZM7CdOBoUbXbcH?=
 =?us-ascii?Q?ZChG5pZvZRujQ+7pm3BfiDBeWH30it8My64CsRPDnKCvmfhSPWRH1JiuVhV+?=
 =?us-ascii?Q?5iIz9zYJuKAqFQxVcq0EpdmBQX0c3KChS0gsmuBJijPIfLBcukRo8axmFX0Q?=
 =?us-ascii?Q?wGbei+Qb1OiKUkk7uBVDBgBEIOkkubIBh1W7rWEwu3p4EpYPcGmg8pKqGs5A?=
 =?us-ascii?Q?PLjDOqQDmBOTbhHds6cyXxestc0eOAgsbcBXtbb2EOVBqDvUsFfNXw5zogSe?=
 =?us-ascii?Q?knO9sc7oP1HRR0Rtg5MN6jQFZ7VzV+cQzILGn6o0+gXm+OJzpVJayH4ZGBwm?=
 =?us-ascii?Q?E1KTPr6r9g0jd3ZpqCUxNTo+fxhAPsZecz98O+cxzekI43c46pXesiWlLfut?=
 =?us-ascii?Q?IEfHvlSatBYqjAsTk8yGw9b5PAWCAz/FBsAHCq8xL4cRwcxQ4wUJ5O7V60+L?=
 =?us-ascii?Q?Cpru+LKEdyR+aOfsrdPfBcAUpSSW4In6NEy8ya2wHOTJRTuEgBU8SbtQmN0g?=
 =?us-ascii?Q?9Cv/FLK743nEYayfKpYduv0UVyhTB51zCqdXKaTLqzn/pbRtOHTMu/C9Q+nL?=
 =?us-ascii?Q?jNVZchh2JkuMmAM94hyPQ7NU56BzYw0n1eB1UJLAv1iQxE55LKJQlut/Cquh?=
 =?us-ascii?Q?3RZbjKBm7W5zkFq8cga8HW9oZx/8Uz23KS64DVxKTr/FRadTFNljIZXaev34?=
 =?us-ascii?Q?2IcNZ0ggulEjCHi3tkxQUf5qGNirVHCcYADsjB+2oGQoYfd2k929ooritXz8?=
 =?us-ascii?Q?/JqbbNDo1hGALyc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 17:33:45.6854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9ab556-4a20-41c8-2879-08dd3653ede6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7760

This patch extends the mlxbf-bootctl driver's sysfs entries
to support read access for the board's RTC battery status.
A successful read from this attribute returns the status of
the board's RTC battery. The RTC battery status register is
also cleared upon successful read operation.

Signed-off-by: Xiangrong Li <xiangrongl@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 .../testing/sysfs-platform-mellanox-bootctl   | 10 ++++++++++
 drivers/platform/mellanox/mlxbf-bootctl.c     | 20 +++++++++++++++++++
 drivers/platform/mellanox/mlxbf-bootctl.h     |  5 +++++
 3 files changed, 35 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
index 65ed3865da62..65614fba62b8 100644
--- a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
+++ b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
@@ -150,3 +150,13 @@ Description:
 		The "mfg_lock" sysfs attribute is write-only.
                 A successful write to this attribute will latch the
                 board-level attributes into EEPROM, making them read-only.
+
+What:		/sys/bus/platform/devices/MLNXBF04:00/rtc_battery
+Date:		January 2025
+KernelVersion:	6.14
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

