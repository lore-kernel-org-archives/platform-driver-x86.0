Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F882E36E6
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690699; cv=fail; b=hwCnTj88SWBRx1FpicrwNE1FksDa0oHuQXCh5VmW6L7t+RfC0ruw/UK8nrqN2w8Twa7KhowxaK59eGFXZfLZy+M903l9ddgJrczDVc8ANhMWSv0fC6abDjm2DTRzkDLqV3jxVSNVmnb1yVYvr4fiZWKdzIDAzH7BLBBbIapifRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690699; c=relaxed/simple;
	bh=mV3Mq0kY/326gainAu6peAHCEPEb5jLK6qyNXAK0L2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kud+RckSzOSvd0+yjT1wwVN5Rs1OAHI1mjy70vUZ+e2/s3NQbgWxAX83vFTuMPnaqifzawf9VCPnokBA4xZPsCDXGhwBQrql6G4nPYx9RhnOmQhKXgnOuLKAEdiQUeSLEhxQMsJ3DjpjcUZ9dL9Y6Dd9tvFWcOg9M7gX/0Lz8YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MtTQkhk7; arc=fail smtp.client-ip=40.107.236.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MtTQkhk7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRpTDJL8NvfkCDG/VGNA+nZv0jHFqEbxVN3iY9OKJkjheIUxDhkjeeXSw8RQ0rb6JaXYbE6E5Mcnv75BaLIX7e9SQQxI82q1rgCZ3At2m8pkHIPrtWk2u1X+21HR2ik7+Cr5Q1V64jA+eV6BW+W5kNq0vnYKp6t40h3rM0ZBAMMjBtIVPlGZUTLW9aosOvbOUR9z5ebCjQhLlX5thuWYn6WGtvyb1meg4QjsJwGdd2z1mA0eXzh8oKLV1C9s0ZD22voUBq4rDCqU6AVxeMz2xV3a6i9uIZgk/1qns2GZ+97x8Ok89TLID++MddbV7RbMfICub7SjZRngIs3KX2hb6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KOf4MzbeVFL2Nb5xjr+ZVX4dWdcwEnFzT8Jyt050wI=;
 b=kphPY7n8fsgbV5wTSdu5k2q2yt3iYPbefV2FRg+VwrpkTf0HuQvQhXfSiAHcN2A/S2h+VPbsLVkZmvZEKgfUyYEG379c9Jm2fOX5rylyYzWC55cM6TSaXtijohYm37YcKjHM/VFNem7fjkoWfKiaC9orChGIZFf0PruPAEgiOLGGuf6ahhHgbjK0e/bbVlWGv5lWd+e0qoEbmcjDrM7UcxlcLIPueOVp/Oy8/XpW4g1Gy0S+0e+G426P0OEpiZcFA++GW9myPzHzfZVigR82V+cxEA8RkXBcuDG08nhXuV4uBUojeQrkTb6C9aSJCueJJurIhR2FpEtsdHfd7MosDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KOf4MzbeVFL2Nb5xjr+ZVX4dWdcwEnFzT8Jyt050wI=;
 b=MtTQkhk7oV/LxDG9lXXn5txta3eVZ8NwaWAKSd8VxCK+MmCznV/wErTNt1s4oNKwcY/K1R/ngQ2uCH6CQNlCylMlz/CoRRFewYaKVKvQtQYQ52Z/nLJSi5gYN8p+1rBiiZA5mpDvWSRu8IWtcQNfN18XpFTsxTPR71SZudpRldY=
Received: from DM5PR07CA0114.namprd07.prod.outlook.com (2603:10b6:4:ae::43) by
 DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Wed, 20 Aug 2025 11:51:31 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:4:ae:cafe::d5) by DM5PR07CA0114.outlook.office365.com
 (2603:10b6:4:ae::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 11:51:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 11:51:31 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 06:51:27 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v4 6/9] platform/x86/amd/pmf: Add custom BIOS input support for AMD_CPU_ID_PS
Date: Wed, 20 Aug 2025 17:20:08 +0530
Message-ID: <20250820115011.1448026-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
References: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|DM6PR12MB4217:EE_
X-MS-Office365-Filtering-Correlation-Id: a064bea1-bab4-41da-188b-08dddfdfe78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/jShVy9O+DvG3piD9uOAb1cfCRUl5or2cMVz3u1pM2Xg7U5p8e18RR5Zvgrk?=
 =?us-ascii?Q?rbSWgZF342Kbzjh9aV5gOE2bK46HBnyZSXiE/ZjB0gS/RRbfAxXqX0PSfdjf?=
 =?us-ascii?Q?wM8XBgQuFFdRCEjuJMJQccCGc0Fck/Qpoiuov9tqwbXHMEgCaAjeS4Np4pKi?=
 =?us-ascii?Q?2cbzKoSnfUMaoiizfptt5iNQlzqeoc1yvbQ0rl92iHr6DtLSwAvJSI4cUYwL?=
 =?us-ascii?Q?9sUEWouc906CTsrFlGZXESzCcLORQkMBEBSk4jY0boYF8HEoMkzKFEEIKqID?=
 =?us-ascii?Q?Q9K4OcZFBWAMNGW6YbaR21GbeXz44D97lVxUY3pZRKxFiDcgU0arHhmvEEZO?=
 =?us-ascii?Q?g3fOsjDxuCJKyjEI3enBWMFMIw8FGUkoPh/I46vxOZMw0+ZjkjS7eGKeOXAB?=
 =?us-ascii?Q?e8WtFYqunpm3786AsEpSC9o6xHpf2Aj92ltvX3ksEfZFqRzG9UPjVPUymjLq?=
 =?us-ascii?Q?m9bNRe91BuJRbSu/XrND5yE5XXFRgRvQLr2mA4v7CO8rZaShX0kWcXkpc58o?=
 =?us-ascii?Q?zHoj/AolNtCEdQVXYAOEPhxIiUE+tXfcCMIYF9bTvYUJMkm7HQfcZ6i1D1Dp?=
 =?us-ascii?Q?lLkTHljkDni1gC/hwuiJO4W8D0lsbfLqTRBi6fMfzI29jswuFZQf325cT6CU?=
 =?us-ascii?Q?8d6nLg8kFo5YPUvXg7/GYFf+LH887ZweH1NyO6ImbG4PfKVIbyZfG1acqRCu?=
 =?us-ascii?Q?XrfCCiaOvP2G+ofmpm7ogi5uMPQcSbMINZoTNAenHl3eoIsSrhWP+8TE4roy?=
 =?us-ascii?Q?On7CzIql3HJgQInc50rKqMAm+2M4aeSiNGwX/0WDLVXonlkG6hlWp3lI1ZCx?=
 =?us-ascii?Q?AhTdmbDAkYKFa/Q+a2xGJFb7SQIBqiKUFCaAp++e2tZ7HLzERWnEK0JArXfC?=
 =?us-ascii?Q?PHDhMjutijq3EI7+drGBDjAfiBN1lAkg1x/Vc5Ams2HAbtB+6jDicGupU93C?=
 =?us-ascii?Q?tqGviPgmkCuaS68J+VrRT3GEd6xtXzPgVhXgXSNZ2spvmtB/mivXLb/ocKji?=
 =?us-ascii?Q?xTKS9GVSguXxus5cS9yS2tPlRs5AFMYKpergSHnnx0HuRLPb7XWjYuYNKEF7?=
 =?us-ascii?Q?BGDZ7TQm4BYRV/YVaY4iRNNmYhgztFdYYUgxGAq1WwogDjrw2yvKpnMD1jsY?=
 =?us-ascii?Q?MFIEYIsIVO0tZAfqBBudhobofwAe/jlS6Lj2DrG48+NbyuIENWS1AB3t+I5E?=
 =?us-ascii?Q?IKCDE+gjP4Y4Igf+/bI0txTrUupK8HcLmq+1OoCPRvkyQ8xpxqTR1kV52vin?=
 =?us-ascii?Q?Poo9sHnyefGwOaGJ2OGuUyka9d+aMcr6ugpbh1PykbJIUbzBTzWYlRnk+daE?=
 =?us-ascii?Q?TxhwvnH+Uvyxgqzgk7Tw4uxBni/3fd+Dlzaec6bQpOPW7w/xrYG178cQT0/F?=
 =?us-ascii?Q?bnnOjLSAWO2ZvoTQVWAxZltbTFSW02bz5Jh3wFoJPi/rBJvMpr4wcjXNKxUK?=
 =?us-ascii?Q?HUmeetIC0GFdMTFYwnAL7xVCObSWMFqrEdo5qMeXfuYrbC46EPr4+PFDUumD?=
 =?us-ascii?Q?jKVAYOrHwFrdFegxJEbXQXQvxVmgd8dAPj6W?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:51:31.1018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a064bea1-bab4-41da-188b-08dddfdfe78b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217

The PMF ACPI Specification (APMF) has been revised to version 1.3 to allow
for additional custom BIOS inputs, enabling OEMs to have more precise
thermal management of the system. This update includes adding support to
the driver using the new data structure received from the BIOS through the
existing APMF interfaces.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 33 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 20 +++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c  | 29 +++++++++++++++++++------
 3 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 4982311ac045..4b8529c9bdd4 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -320,6 +320,11 @@ int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
 }
 
+int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
+}
+
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
 {
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
@@ -338,6 +343,18 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
 }
 
+static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
+{
+	struct amd_pmf_dev *pmf_dev = data;
+	int ret;
+
+	guard(mutex)(&pmf_dev->cb_mutex);
+
+	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
+	if (ret)
+		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
+}
+
 static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
 {
 	struct amd_pmf_dev *pmf_dev = data;
@@ -446,6 +463,17 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
 		apmf_event_handler(ahandle, 0, pmf_dev);
 	}
 
+	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V1 &&
+	    is_apmf_bios_input_notifications_supported(pmf_dev)) {
+		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
+						     apmf_event_handler_v1, pmf_dev);
+		if (ACPI_FAILURE(status)) {
+			dev_err(pmf_dev->dev,
+				"failed to install notify handler v1 for custom BIOS inputs\n");
+			return -ENODEV;
+		}
+	}
+
 	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2) {
 		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
 						     apmf_event_handler_v2, pmf_dev);
@@ -508,6 +536,11 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 
 	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2)
 		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v2);
+
+	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V1 &&
+	    is_apmf_bios_input_notifications_supported(pmf_dev)) {
+		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v1);
+	}
 }
 
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index b705461a6ff8..54bd33104ded 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -188,6 +188,24 @@ struct apmf_sbios_req {
 	u8 skin_temp_hs2;
 } __packed;
 
+/* As per APMF spec 1.3 */
+struct apmf_sbios_req_v1 {
+	u16 size;
+	u32 pending_req;
+	u8 rsvd;
+	u8 cql_event;
+	u8 amt_event;
+	u32 fppt;
+	u32 sppt;
+	u32 sppt_apu_only;
+	u32 spl;
+	u32 stt_min_limit;
+	u8 skin_temp_apu;
+	u8 skin_temp_hs2;
+	u8 enable_cnqf;
+	u32 custom_policy[10];
+} __packed;
+
 struct apmf_sbios_req_v2 {
 	u16 size;
 	u32 pending_req;
@@ -380,6 +398,7 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
 	struct mutex cb_mutex;
 	u32 notifications;
+	struct apmf_sbios_req_v1 req1;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -836,6 +855,7 @@ void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
+int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req);
 int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
 
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 06b7760b2a8b..f50cfd37b480 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -132,22 +132,37 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
 	}
 }
 
-static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
-					   struct ta_pmf_enact_table *in)
+static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req,
+				       const struct amd_pmf_pb_bitmap *inputs,
+				       const u32 *custom_policy, struct ta_pmf_enact_table *in)
 {
-	unsigned int i;
-
-	if (!pdev->req.pending_req)
-		return;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
-		if (!(pdev->req.pending_req & custom_bios_inputs[i].bit_mask))
+		if (!(pending_req & inputs[i].bit_mask))
 			continue;
 		amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
 	}
+}
+
+static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
+					   struct ta_pmf_enact_table *in)
+{
+	if (!(pdev->req.pending_req || pdev->req1.pending_req))
+		return;
+
+	if (pdev->smart_pc_enabled && pdev->pmf_if_version == PMF_IF_V1 &&
+	    is_apmf_bios_input_notifications_supported(pdev)) {
+		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
+					   pdev->req1.custom_policy, in);
+	} else {
+		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
+					   pdev->req.custom_policy, in);
+	}
 
 	/* Clear pending requests after handling */
 	memset(&pdev->req, 0, sizeof(pdev->req));
+	memset(&pdev->req1, 0, sizeof(pdev->req1));
 }
 
 static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
-- 
2.34.1

