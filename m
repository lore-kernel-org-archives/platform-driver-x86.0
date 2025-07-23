Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E9626E6E9
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 06:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252937; cv=fail; b=f/JcQawAZcFZVi556uu6jTq1zslC8eUajdLSHoaxGcB8Yl+9iVx4lNYHTcFVvykwV4Csh1iAfNwJ01qm6qzntRj//8oYleFVtHgb5i0y8710L3YuJEkDDVTQpISVOqSMtkqSkyLIm6KQFdEujh6s+5U/nfChOmUf7n35owN5+7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252937; c=relaxed/simple;
	bh=AEU5LdQpNc1l4E3Fw/kr43dgDsNllvREO7bBHbihuv4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKGm8j+nAg/VoJOslofFeyd10fKWjhLDvq1CbJOhOdKQJGIrP3+VxC7MRkIKQt3HSLs83op/lJuEjOi1L7QFyQgpuFCXvnRpLav7ZARv0iGmU+iQa9vlAHeMiDapjGGP8EK82PhNaVgglCG++tYLUA/wdwy5D1XIG8Gdt1FxNCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dmHoeKrX; arc=fail smtp.client-ip=40.107.95.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dmHoeKrX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WURYc8xJ5w+LYKqjsvBd7L+/XtKr0q8S1FcUDU4GrR5et4lsaE6j3G+75rVsZ/L/nbQsa9w7xKBaLP7oTqgEcmVUWe3cNQ+5oNWYFgsrLPHcjmXYGTVKs1Thvxxr4Fi/cDm40aAfVablgGk3MPN3Re/J2VF70cRx/mynwzOEMFpYFN2ZcXRBCHvBBoPsq8htroRf8fT9+GYCXHhYF3KhdLACbA4KXY/KNbBiaKRxVTnLkKfbhnvZJQjUGG1upRp+B9Wg6deMABKDnxjKqNe/KI7zxtGI7X45DekvDW5c8M3/pezU05l8X6QImrqnXeCfo7lKlT95OwVgyyBSQe64xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfu95u6yxdhbAc2M7ouVQ18gTvGHPCGsxz3Zow1ZgqE=;
 b=FTnN20qzBq16/VUY6NeR8A4ElTwjADBkAB8ieVICMO8zhDk98a2d9pt+dTXvEIHc8vZFAuKd7rK3gqAiV6gubY/o+BYDqDq/bgcUvjuIuptOU+Q5NTS78rmT63woEi6WisX7pY19rZqbz+UkuGIv7huiUU+veXuR++wVESNxlYJRQw2rsdJ0woq0Qqe9Iw3FiCGy2lCyMNGu6gJZmeWl92fGetwI56WPU3FjCnbqAmZYYyUTHN6MK3EuoKHQOpPCai/TOju1CotHNQ9CayBJlllFRk6ywsIQwT8SNhLwJEMp8QloZCvfYs3IissUtn5Fi2vvIYDa2qOmGqO91KsD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfu95u6yxdhbAc2M7ouVQ18gTvGHPCGsxz3Zow1ZgqE=;
 b=dmHoeKrX2k3D5SC48+tQW3W7o4brV+3yMSbPPx1ZnGiwvj+vlQP7DBz3fuMNfEZhJZsv7OsFb7jutGhFIQ/xj3k2+wVi9jgsQV6eEYAfrOQy4TvSJOBMBwjBnkXR8Ek3n3YVu2jyMu764dQdQHaBE7Y1yK2vLCLm2VaPKoTMZIQ=
Received: from MW3PR06CA0007.namprd06.prod.outlook.com (2603:10b6:303:2a::12)
 by DS0PR12MB8527.namprd12.prod.outlook.com (2603:10b6:8:161::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 23 Jul
 2025 06:42:10 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:303:2a:cafe::b6) by MW3PR06CA0007.outlook.office365.com
 (2603:10b6:303:2a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 06:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:42:10 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 01:42:00 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 6/9] platform/x86/amd/pmf: Add custom BIOS input support for AMD_CPU_ID_PS
Date: Wed, 23 Jul 2025 12:11:18 +0530
Message-ID: <20250723064121.2051232-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|DS0PR12MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4d51b3-3255-414e-e56f-08ddc9b40cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3M9rbGFgDD7Q2BLrPt3HmsbmBP4AkIcz4ceebyaqpXiZdFbv2F7JH+CJUKfK?=
 =?us-ascii?Q?ZebT8VgaA+GHcyfjUvU+f34iZJihZE7Y82CQs8K+PwoSMh2w54qfZb+6jrQA?=
 =?us-ascii?Q?CidqjuWamhPmxOx1f4+qA7KaPAIdwvjTeW5Nicc5NyopxG83vBayOtjg5pgm?=
 =?us-ascii?Q?s4TvWMmWpOrbZOKXtQ0CEj8R1DPX29QAyT8enY0yUPheEzqyANfduz6v5lko?=
 =?us-ascii?Q?7JAa+GWFs/3o843Z3cOtGTMaUmR1Qwz/81/79VahAIz9WZb0Zn0sZ5B7Chrw?=
 =?us-ascii?Q?ACaRUAyVNwxOn5mWzLys7C8ABomD0y7KymGML5rE6LfGxak5e0GmJunvBfz0?=
 =?us-ascii?Q?xwhK0uotTzEcAvyN27VTn9Q3dhSJEw1LYhO2yi0ECmdAtMJwIGoDd64ywSL6?=
 =?us-ascii?Q?tDGkgDdYRqiazjD+PeJCH/QgQg1v6tNk5Kj7vMS/EVOeFeumexbmgXFP4i2J?=
 =?us-ascii?Q?Re7YBO/GNpthyvRdAOtL5r7SfxTJKhP3MtemiMKVpsajllS8ZmO0+SYTF3ab?=
 =?us-ascii?Q?Aj/PGSRpOmc/HSD2rWcyDXGhV+JH8hmJB03VuFYCP83x2C3seuta128ZJODj?=
 =?us-ascii?Q?nKXjCv9ikWrmsmOrezivZtv/hnareslWsfPtMYZKHDa/ZZPseDpoLzmFMej4?=
 =?us-ascii?Q?x/zBG1aylxjPKRq4o5+NUFoAOsy+mlbpdRMqzpCOL7dA9m+qDk2BhY9fxr20?=
 =?us-ascii?Q?vvb4S6ZqaCNMUESCNZBkNifKdrJen0suF5bVIsA276YyzSZnqVpJO5J/6rXv?=
 =?us-ascii?Q?f/xmkOVLOTCmA6Zscq/TAiAIaCqrFy/tXA1AWvE859n0Z8G/FbFRHp/+Dw65?=
 =?us-ascii?Q?6RZ9tmzD6lZ5WsKSntMZSLoFVxNfwO3BnaOBTF2MaRr+qPkxdjs4HD7prD09?=
 =?us-ascii?Q?EgIRYG29PbJUS5GkXjI+PPefj2xTugpFrfAcgSbYctmrS4TLYJAwkP82497Q?=
 =?us-ascii?Q?kABNrM/W58fVYRugYG5RBNXDZPZKK/L8YlPoIJzEPBuZqwbtiQyeZBAzY+/P?=
 =?us-ascii?Q?LqSK9NJpica+eJ8U++cjs2cq+4Dowi5nbzfTRCmJrOLzGMrFRLgVzuAmo74l?=
 =?us-ascii?Q?aC0kvbSXO29YID8ZlvOPEIs7vrh91Lt2O7sgnHC8Cfrb5SZys849lL5HeNsE?=
 =?us-ascii?Q?BeuaEO/MrVVKaMAAI706EO7Inzd6U66Rkn4ZoEC1bnsDoSsiFKIrNsOlzpx7?=
 =?us-ascii?Q?GQNr7+amVUj+p0BTmO3CwZslt0xRI+x/ng7ga/aQdShzNnnXRsv9kaF4Y4ck?=
 =?us-ascii?Q?VKSENu2rgWzvIYgdCquP1xY47pVJzTQnkNTMXfPhoVLxaNBOK9p/ZaasfKEW?=
 =?us-ascii?Q?Y5jH9h36k4vpQ2kHH23xFwnB3kx+sTJSNaWnZYMpM/ee8151/8Zb0YFma/gB?=
 =?us-ascii?Q?BsqPy5nsGlZezPpTjrYh3QwPU/jknd4kyc+2771Jkccl32g6W/3P5DKQlr8q?=
 =?us-ascii?Q?Tb1ymbNj2pPGtVWtVtyJEm1Lj4X706ufqhRkf5yZODDLG/DvEvkp9PBsYDUT?=
 =?us-ascii?Q?9fQFvCsxb9BX7wmMoYKu5+EJwhxZg/caZthb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:42:10.0071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4d51b3-3255-414e-e56f-08ddc9b40cbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527

The PMF ACPI Specification (APMF) has been revised to version 1.3 to allow
for additional custom BIOS inputs, enabling OEMs to have more precise
thermal management of the system. This update includes adding support to
the driver using the new data structure received from the BIOS through the
existing APMF interfaces.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 33 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 20 +++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c  | 27 +++++++++++++++++------
 3 files changed, 74 insertions(+), 6 deletions(-)

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
index d945beeaf30a..0af7629ee713 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -190,6 +190,24 @@ struct apmf_sbios_req {
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
@@ -382,6 +400,7 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
 	struct mutex cb_mutex;
 	u32 notifications;
+	struct apmf_sbios_req_v1 req1;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -838,6 +857,7 @@ void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
+int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req);
 int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
 
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 5e0218ec8872..ce13b8cb85fb 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -137,21 +137,36 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
 	}
 }
 
-static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
-					   struct ta_pmf_enact_table *in)
+static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req,
+				       const struct amd_pmf_pb_bitmap *inputs,
+				       const u32 *custom_policy, struct ta_pmf_enact_table *in)
 {
 	int i;
 
-	if (!pdev->req.pending_req)
-		return;
-
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
-		if (pdev->req.pending_req & custom_bios_inputs[i].bit_mask)
+		if (pending_req & inputs[i].bit_mask)
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

