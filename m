Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D9B26C39F
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775691; cv=fail; b=azVhXqvnvjISxnrMYO/MxCySjuPs7kMxMbmLVP4+YuZMmTlAlbOVKbKpcVVuZPYsOehjkyXR+fzBNr7FNMVf9A095j7e0I8xwMWAq6bt07dg3jKrFo7DhE2n4YS8eObELzAowNbgWKqm9+JsHx/4i8DXxKAC9UwPVXPziwGrY8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775691; c=relaxed/simple;
	bh=LXYuqi+QGp426GXs4+umCtwo9kvxWACAV692UqoVMMM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/vkr82329UksFmKgj0dt2WNu02zQKfMLaaGt0BNpCoxf1NdXVhNuiSHSkAc3ASDTWzM1ZrslHzZ3N7+6eye19FzBe/xhjJOGcROL0KRdfDOFD7iQnCy9sPjpn08Bl81hF65lBzkKS1FDtUBITTXLPOc+CMYCwhMh6AmrFAf+y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r41IKVnW; arc=fail smtp.client-ip=40.107.95.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r41IKVnW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1DcUE1kbrbe7H4Vy+wdNthFuPJAzwiJEZHLXQO3c6EMpvLHs2TJBOKDxTCXCT5+vk4+YWA1Yr/L/KJIQ+RKS8jbY5gj2kQneMA5DKLAmDasWpZMcZrAZWu9uuFXqJHwiwqrX0h/SXtBheKNw0wrPduoT0rFrbwQi94m0KBvFPVRjc0mdOxXKBiobb4Vsehvp+YLAZSkPnFRPIlzvV6ekdz3PvO+QzZynha/jVJeTVglZcL84hsxfwmsNB9CvWabp/PMAmmQ4Tko0q37sKy//j9hfjJR8Y9nxvyVb6W5zY8tew2Rmg1YgriidRyY3xlif9aB6RgPGwgXPWg/IsY85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7jMsYYnleiGdeHLkQCDegknuwE4J2nbaHjXVpQw/yY=;
 b=UsutnRFQ2ng6PAB86vy9P5MOWEJcD/rTYpB6vATQ4MC07F9XeoxJ/11C2pfrjNZja43B3ETuJ6t8/fHOBsct+BVgFjKntNS/iX3su7BeXR7p9KR1Mtn0RqNjf3EGM3Qyo11z6xsjsxrEzI8EICmgsySAmvlnEJhjSJDPbVEFG5RshG4h2uqZi92k8gOMA4QWLE/24wUhFD2kHgshEeo9KUe+oLE7SkQiquYJg0r020xrF2TfBdjhYtJww5j6W3JE4R93JgJzZkG01lTQ09v7wgd5NNPE296Wi1g5DH9GBDId0wdM+VfkEX1G6yKenP7FOx/DgaJekYlBb+lKZK00ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7jMsYYnleiGdeHLkQCDegknuwE4J2nbaHjXVpQw/yY=;
 b=r41IKVnWsw1UKRGLGishwdrWoLMc1A+wgwx7uVC8SbxqtsnkGy+z6is5/ak/TxenFnHyWqzGd9w3xpAX0dIC4q8c8QFRgMC2whkilU/ZsutuJG/Hc1L/lpwmsCj3nA/BU2h+b8pg0//LZmKWNgwpzijsyQfE0tnw/zyG8VElvMM=
Received: from CH0PR08CA0024.namprd08.prod.outlook.com (2603:10b6:610:33::29)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 07:28:01 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::62) by CH0PR08CA0024.outlook.office365.com
 (2603:10b6:610:33::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Fri,
 9 May 2025 07:28:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 07:28:01 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 02:27:59 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 09/10] platform/x86/amd/pmf: Call enact function sooner to process early pending requests
Date: Fri, 9 May 2025 12:56:53 +0530
Message-ID: <20250509072654.713629-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 148d7cfb-0d8d-4037-66a1-08dd8ecb07db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ksueFrKdO1SuUYn4ZAwIdzcz8IdClGxDaJhjGEdxj8FmZxt47vYhqLYCJb5S?=
 =?us-ascii?Q?FrhNa5oegGEO58XINt0Mj495/5H3fB+Dar00mmvwZ5pkuxity2mWclXE4kmo?=
 =?us-ascii?Q?ysxCGMlk7ktemiLXHdhfJA+vPrn1Xue5hbcRiZAWsy9+VnBgpFF6UdxesW8D?=
 =?us-ascii?Q?4a8QQd+j+zJm0ZFdc+sY+YWf0ox1MsmZoC2GI/3OvQ4bTM7Y21nwj4Qz4heV?=
 =?us-ascii?Q?+Sq+IlwONUjFo04Lgl7RAD+6XuAsYnmQuitd0GT6HEtoqkZZEgYmjTPpxqZL?=
 =?us-ascii?Q?4+jXssemDB7/dUM5jfy735ZRY/pqSK56y6oswuP9p1k5bqI2QrUU+Oahdtmw?=
 =?us-ascii?Q?5Xt3EaSlfv4B2MJv90Q/ZlTdKYN+D5JF0dD24Mu/ocRCsAlOnSSYf1o5+rh6?=
 =?us-ascii?Q?WEmWDCCPlHPrZQY0Ei/NWyGrWPbUkAGyfiFBAQq/mIyaNunll0dRshDjUUwH?=
 =?us-ascii?Q?uZRMLAoL+Ib04HJdJOd7Tur3AaNUo5olz9GCq1Al7Nz5eXmxDChRdF4zrJTo?=
 =?us-ascii?Q?x/WjhIhdyYfZRIzHYjveCz4Mu89zwBh426O8ErsgzdKjhiqvSee/hR3Tgj/o?=
 =?us-ascii?Q?gYCj0K+/Zy5y6YQ0NWul7ksJTQMORfyjLKtyl83MJgnAX/DlSdcemcjnTu4B?=
 =?us-ascii?Q?W92tRj1BW1Qj/FuAzVD8Y+6mL4sDhFPq0fNjB9tRnvGuv221MyDyqxFSYA4Z?=
 =?us-ascii?Q?PfPlkVd/qn+ACAitstnPv4jkFAGTqpZ0dS2JBMwW6B2PAgPrz4af+ORdbsER?=
 =?us-ascii?Q?x4aIXWHO9b8f4krWo+FkVHXzTZSHp2oSstCDjWq1Nn5rJMowAdhJ2icXCMb1?=
 =?us-ascii?Q?cOUwqLCxDlI6Zw6BXUQzfzPrJ5S1FhKMr7PHP/rqxPRLM9WplJj/rlIyJbRk?=
 =?us-ascii?Q?JLpHCtnJmTfzGzx8R25nNnHDb/MKKmvsRo9Gb6FfUlTckVax9BJkaK5u5KkL?=
 =?us-ascii?Q?64Nr/nf7bSyZjkz0I2+zhFkFQhdaxcvwDW/RznfyTgOnlNT7FLzYjva2K77O?=
 =?us-ascii?Q?G9/25xwvYdqGhAvAlomETcq6sfRKQ/bz0EKmxK3Vu1PAZx8XDcSc5cwATO2i?=
 =?us-ascii?Q?WU7gYp0SjkPOxbcJqXarD62pXuRi1s13Y1sJHOm6XYIk4haoEMmqMrr7mdI8?=
 =?us-ascii?Q?g5tXyvla3pyrnORnS/4EX+Vt2Ii+7S+cgcLXLDu2TE4QpGSRzKCQcjCJBnx6?=
 =?us-ascii?Q?/7V3UfeE7VIhTL+cVZ/4l6epVWQE4fh6Y7/Gq2oojVJ74jasiboP1YXmOBxR?=
 =?us-ascii?Q?cwoVimxmoqVaqw9qpQe6DNpogMxTPi87tZnezdd7czPlkxqhcK85uk9X0DLH?=
 =?us-ascii?Q?MSkASij/qkdden7bzSdKOKiqyRiTh118sxPrn9aJHrgRL8xTNyNVJgjmXs0T?=
 =?us-ascii?Q?IAgj7N7j2WKepibekggkYd/L1PMiJOLkg1jnV1C0zTDYrR01G/CnOedKub0V?=
 =?us-ascii?Q?Xm29h29IYNxd22kjttX0vjMKOvdJ6qc8La9Xgl1S6IuCwsmb4uMHl5TRRPZc?=
 =?us-ascii?Q?H3IFTL6jaVHbHnCIXPOcgHaiRicVv1gHUxvA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:28:01.7239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 148d7cfb-0d8d-4037-66a1-08dd8ecb07db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658

Call the amd_pmf_invoke_cmd_enact() function to manage early pending
requests and their associated custom BIOS inputs. Additionally, add a
return statement for cases of failure.

The PMF driver will adjust power settings according to custom BIOS inputs
after assessing the policy conditions.

Cc: Yijun Shen <Yijun.Shen@dell.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c   | 18 ++++++++++++++++--
 drivers/platform/x86/amd/pmf/pmf.h    |  2 ++
 drivers/platform/x86/amd/pmf/tee-if.c |  3 ++-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 1521988c1002..a3319ac89fd1 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -339,8 +339,15 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 	guard(mutex)(&pmf_dev->cb_mutex);
 
 	ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
-	if (ret)
+	if (ret) {
 		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
+		return;
+	}
+
+	if (pmf_dev->cb_flag) {
+		amd_pmf_invoke_cmd_enact(pmf_dev);
+		pmf_dev->cb_flag = false;
+	}
 }
 
 static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
@@ -351,8 +358,15 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
 	guard(mutex)(&pmf_dev->cb_mutex);
 
 	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
-	if (ret)
+	if (ret) {
 		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
+		return;
+	}
+
+	if (pmf_dev->cb_flag) {
+		amd_pmf_invoke_cmd_enact(pmf_dev);
+		pmf_dev->cb_flag = false;
+	}
 }
 
 static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index d9e6467be852..71cc94bdbd32 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -404,6 +404,7 @@ struct amd_pmf_dev {
 	u32 notifications;
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
+	bool cb_flag; /* To handle first custom BIOS input */
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -891,5 +892,6 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
 
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 679c5bf5faca..249683509635 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -223,7 +223,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	}
 }
 
-static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
+int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
 	struct ta_pmf_enact_result *out = NULL;
@@ -559,6 +559,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		switch (ret) {
 		case TA_PMF_TYPE_SUCCESS:
 			status = true;
+			dev->cb_flag = true;
 			break;
 		case TA_ERROR_CRYPTO_INVALID_PARAM:
 		case TA_ERROR_CRYPTO_BIN_TOO_LARGE:
-- 
2.34.1

