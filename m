Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B722139C7;
	Tue, 14 Jan 2025 23:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736897266; cv=fail; b=adQ8wq91fONiHOhz7MR9lJxVKTk7RMdj+pQGoSshkgTAd0wKEf8lTwdBlWV0WRsXEU6IiTUgjcnvKkjJ0nZSoiKXMaH50nXUfBSIXxgXpqVP/xU1W5R4WrXPbLUmhgeCG5LhpfOeL9X0xNIIknQ6cfKG8b6QRm4TgifvX2lonHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736897266; c=relaxed/simple;
	bh=YGkIPO2OEthc6gNAGvufVulaLXLKInpEnx4ULP8Fpj0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fIAh3AQJKO7V4bayxjfc8LqrnVyC39TzLtgDq3bWd6EJbDHSYuUx0JUzWtF9wOwVb0b7VWmJig63rdCcKdWe/ZufgXJRWNp3rB2GAig9n1w0a9JCS7R9d7CsxqbyvRRDMJQAxYkK/ol2a/WK83fyUf3x+axl0TVx1O45O9aasvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I3uex8s3; arc=fail smtp.client-ip=40.107.102.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I3uex8s3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEg2dsu7+Q85S30R34D2iA5wG/5VoH1/3BPH8/ZwH7ttGWEZSGZRZ33B4TFGlxEQtgm/Hm6wM2FFY71Kj+WRs8ILBLN+KGx6tnge4H3hNzegZpgowaa9yMbB6lez7zgLqdNQ/m+0aMEPgrzkTwPRgG1olKQFun3B6fyI3LpBP7Hnv3uGDkSjwSUTFQxMSOAFlVHiSUIbMhbM8AQ6HDJVALwkl5cvczFN5Afm55V4hEie0Qa2CPWCcv85nmBFnUY4z0Gpe5bh6kdgNmf+nkh0AWKJINpGc2Y8ufRKpeVAN51Kp1QGw7gCKgSqPU3Ffp4wdiqHJbC6Bqn2EMd7g/+JLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHqkkxxsiMyHl0kguCJfCyIm/ypk8GKMFyHYwaw3BsQ=;
 b=IYjH7HBHdX2JJm+q+/+jTV4v1JgfqWMFdSuiblYMgBWaCM5JOIRJN5NW6sfP842i1BKXrFIVRMuQ+c5P11cMC1ej2IMoZ0f0nbwq0zt+T9O8tWsH3WKPx3ezhkg1DOxb9LZMxiUEgWsf5xqiKSwBEtbcOV5sGhzq17G1d110wlWmZcfdyL6FbRubHVza7uZspb1RIbiR/Hxfr93ySFnTusslcHoDrCV3ExqCaKuSRMmROzsSEpqb54ThjQq9aZM+IP5Afohxe4paYpjWPbJ+boK/+wJPPESHIwbRrB1Vz9vURckpRCUnsgqcAA17N/2/q9xXPnPNwtPHJzLb/5Fugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHqkkxxsiMyHl0kguCJfCyIm/ypk8GKMFyHYwaw3BsQ=;
 b=I3uex8s3LcYp80KHzofC+uTVq4R5bSJLfZM4jmch6cDq49/myDZTZnEa5BR/erE4jHnWx6aL0TCvFCVVdZ6EOKTTwUsdV9b9YN7HuM6Cb8upRfWTcke5oAHHgSWOUt4jWatvbqxzvwt9GfjdkLjSMhYh1wC/tzVj1swfeVT9pIWKVwq8qJxr299sXZ+DSWODLmS0piyhm6vigtPe/TPtGMDonk1CVgNRW2bilxVc2CltsdX2eyQclpNwzGrjnUx7iEi1wh5LpldHtSLV5ZQKqMyMCJR3M/NYaxaAY1FLgfYgTpFAHlKtZR8Bey2G2GVFXSXTl1lq20Qgl+6nJmyohA==
Received: from SJ0PR05CA0065.namprd05.prod.outlook.com (2603:10b6:a03:332::10)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 23:27:41 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::d1) by SJ0PR05CA0065.outlook.office365.com
 (2603:10b6:a03:332::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.11 via Frontend Transport; Tue,
 14 Jan 2025 23:27:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Tue, 14 Jan 2025 23:27:40 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 14 Jan
 2025 15:27:27 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 14 Jan
 2025 15:27:27 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Tue, 14 Jan
 2025 15:27:27 -0800
From: Ron Li <xiangrongl@nvidia.com>
To: <vadimp@nvidia.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>
CC: <davthompson@nvidia.com>, <asmaa@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Ron Li
	<xiangrongl@nvidia.com>
Subject: [PATCH v1] mlxbf-bootctl: Supports RTC battery status read and clear
Date: Tue, 14 Jan 2025 23:27:24 +0000
Message-ID: <20250114232724.48492-1-xiangrongl@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b247f5-6d87-40e3-ba2e-08dd34f30a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GL60NeZNSF+LWKTDcjorxrnH3KzZTkE8FviusZ3oo9TzLAgWMaKNmBvOQAqv?=
 =?us-ascii?Q?38+EYhGk8SM+98kRNCgDoGr+sdRPCsPvoIQPPbL4+izkRT1Cp5n1rr1/iZuv?=
 =?us-ascii?Q?j6aeBPjTUIF2n2OJwmLDguEmgs+UP+JmnGaVHqclIjdwkeBNToSYNaN3ft18?=
 =?us-ascii?Q?BEzPqfBSX5Y9maUfezl0/p8K4gS7ex4pyn8v09r7Ox/nBHJeAnUTT8kPOepS?=
 =?us-ascii?Q?Tb0S2/CtA+9e6thrPVnZGsHxcp7BtKLrumZnLLOj67EijfY3yOtJjrLcbl3N?=
 =?us-ascii?Q?TlUdNgW3+etzwiq8lhE+tuKavdhsL7lWl4j4sVCXaRcpDcodctauivEgHPMC?=
 =?us-ascii?Q?0M9r/BswROKJrUC+c7FAMwfMV6fV76ZCqd7zKtDVSoOiJ4eQYB6wWxgVotl1?=
 =?us-ascii?Q?F8KRxALiReTRo/ufH4ZTtjDJIrZ262LsMrZlLAWpjAcdAZ6mJ8azAEtyhH/Q?=
 =?us-ascii?Q?VDKTAbL4zZh4JLeeF9cX0WoZKN7AXS8M5EGwzff4Lfk1rrjuS7P99LCkfvoQ?=
 =?us-ascii?Q?lIAFw6T9YvJImR9l0G3epm0xjAsKdaVGDUi5tpmuOiGpuJ1HAc+RBYmPkOfE?=
 =?us-ascii?Q?WqW106G5sMH2rq4guxDuRgVGnoIwug2mL866Muq4KtudKYZnVUB7CkpuGFgH?=
 =?us-ascii?Q?r0rX1+WKVJPWQSCPkGsM/P1Ou7FcE0FMhIn9RJUBbelox+mwntzypeHoKYO0?=
 =?us-ascii?Q?XQqSIremkeGnTwi5J+83w6PZ+w01J4bAKRunraoOPgHYrXwRq/DENDAd+/ih?=
 =?us-ascii?Q?H4LlWvKm33aj9ybcFCY+JGAxokyQmAAxbHB1F+OPtSrYg1LaMBlzi8ypxAR8?=
 =?us-ascii?Q?Q851DHjEZXkLzmvjvhOrE37gYTKDx40wS2vKOwErAh0Z8XPS6pjUCK98v0zk?=
 =?us-ascii?Q?EWJ/RpLtdllu6lxx4w6qZxp5OLwQ6SMpTWY5qrQJGxRcQBRI91Jh6hEHBf/3?=
 =?us-ascii?Q?uvcgYkSJMQPVko+XU8BlW2QF7Bux9GKS9gDeDRS/nlwdcPGrMImA+cLkQma0?=
 =?us-ascii?Q?KFsXPcXXGirEQz0R0rm/sk6/PkeBLYXbBRkYH6tK5FCluovAfDR+dMnHRCRU?=
 =?us-ascii?Q?fYezPeehrC3piq+pQ0N5osUpARAa8IWi0lg6+YbkIi6ZCfQ5xuF43dRzqahM?=
 =?us-ascii?Q?0qK5M6SGIUg4JU7A+ke1+tuv64Rg5ehV7q5cUTZiVtAHTMnzDd3laBwG57ky?=
 =?us-ascii?Q?rUuf3k6DUZQ4gvppJc0vlmURdY84HFdLALBy3ABAYX2E8UQa5tAzpPhuPcFc?=
 =?us-ascii?Q?MHqgvJLLcObD9AlQxJ+I7pVXLZW7y8ZwtEoWQm+v9XSrL2wV9VKNIPwd565A?=
 =?us-ascii?Q?nNgv8+TmuVHjckfusyR1rnpwAOlVWyxCMtMA1omQgqNLgAta8UmRIoGohJok?=
 =?us-ascii?Q?BcLKjIiHHkAEutXK0Amswi6iaBnE2GcGIaN74DeT4b3BObyZUpPo1FGkekMi?=
 =?us-ascii?Q?CvbMagCO3gTclQYa9nFTusl9IJnRZegEgdX+1olI0suaecIDCe7JZM/kpS+3?=
 =?us-ascii?Q?MhhCX4dTqxu+zW0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 23:27:40.8128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b247f5-6d87-40e3-ba2e-08dd34f30a36
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350

Enable read and clear of the RTC battery low voltage status bit from user space.

Signed-off-by: Xiangrong Li <xiangrongl@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-bootctl.c | 20 ++++++++++++++++++++
 drivers/platform/mellanox/mlxbf-bootctl.h |  5 +++++
 2 files changed, 25 insertions(+)

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

