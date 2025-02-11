Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0E01EF0A9
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265601; cv=fail; b=IDZ+rxym6JbWsg46hRC2Und/e3n2j2sv1ZPLfG5rz3LTOLIVKMvdYFKg8QTgisLSqWzpw0y8bCoU9zJT5TeQ8SsfhYK2JpFWLXDdxEeedKkRUqbTY/RwieGguSuziyWIiMTsAf6wBVkJnc8TPl0m6xAIbCbRHyMgy7/lslobb6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265601; c=relaxed/simple;
	bh=1p2XtTrna7mJ6xKVyrPD59vaysOCum74uNCVz6jZ02M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ENYgv9f09admsDiNqaL1UUpPNgl9/1rWl+3uktCSeAdIwiZVK/7occyldD0pcY/oYb2WAJPcD4XKZSrn2IxPrDvTiQzpTXaTqUGyjFHnypU2uwbaloH8KrZoUodseWoj26MT5hjD9rAOF+AP24wgU4h8uF41Us/OTWGsU4RxViI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CZ0lzU91; arc=fail smtp.client-ip=40.107.94.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CZ0lzU91"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buiThxMc0TzBMPRQRXJ4zRmFGrDMaISqj12qzjRg7PpWqhHYHR84vcH2+bzkyVKYGgA/Hu9stFbiPJtmQlUtI8k+iiaIEo4cPgI7hNp6ozFqIImm5E036wwpkOacHe/Z72zgIKuJ4lqO7RogcASVbO1Uydl7Jrg9H7ChuwK5AM7kD5PwZBqL7cCLdmwtbDPWQmhTs1TfYv4Fy5U4TskT/QrL1xw3s6A0TOEEq2wW6TH44zE+V9KAW27LQXcLUTcqorazKAyDbDab2o568HNBwDFF6boPsIBzTDDHlv221NRql/36l4UPBXPbNUB+5bM4SzyhuoibvEuUzd/y8FJBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS/pQyiVA5aaK4UiuXWtZ66kccBNS7qsD9XUiFSasW8=;
 b=OaxE/KfS2/bydx2/rEG7lr14YIGY3f1b5QKOHy2tniudjUYkEfRiA4Aggk4xoH5mWHTYpND0ndHNhMOJB+I8+cQE9e9tifWMxKXdk8j9aXUnruzYBHy2Ni//CE/D5KrN6Yf4N4FTnQf3KeaZX6IGy7nYV3GHFHEndY655Pk26Bip4r7oJwJiRPCQxIGH/y/r1agmLgA16PISifaG1TwQnjQ0f48JWOQG7E7TMkb9ZE0ZlxWuPPtaD2aMopTGGrkmFbS9CkhDmyLw+4fsCkblUuMIc1kwtOiL6GBF/fLy1BfHyuuqaCfCXwXq+0ulgXLQqu8kQ+gy5daPr5HYpuKelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS/pQyiVA5aaK4UiuXWtZ66kccBNS7qsD9XUiFSasW8=;
 b=CZ0lzU91m9UWSw/M659m9pXpWF1jr34jxYU/kJNPaYk5cnKz1MgCMuHl8cZwd/Tiyw2xRq5+DRwA3eofsDJED31oFnBKYYzvSRmWZ3jIrSGqOQYwAwBVSBvnXFLl+Q7j5KyovCxK2uiGGIakoYlhQlwCwuRITMf14h5ZWb+Ar/+IdOonnxq3Uw1JgGdewgnt9kO3a4dOtdObFUo+xpH1F80VSNkyjsn+G66yOqYcCpqfx+2HF1VU4sawag5QRAa27gRi0jTrtXS3gIYol6Vaa3cm1WoqzNplJxIMZBvZVDnr17d69QVSXL/JYhfI+68C1qhpinDLUZEiYlMbnXNxUA==
Received: from MW4PR04CA0092.namprd04.prod.outlook.com (2603:10b6:303:83::7)
 by MW4PR12MB7014.namprd12.prod.outlook.com (2603:10b6:303:218::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 09:19:54 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:83:cafe::e9) by MW4PR04CA0092.outlook.office365.com
 (2603:10b6:303:83::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 09:19:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 09:19:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Feb
 2025 01:19:43 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Feb 2025 01:19:41 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v6 1/9] platform_data/mlxreg: Add capability mask fields
Date: Tue, 11 Feb 2025 11:19:04 +0200
Message-ID: <20250211091912.36787-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250211091912.36787-1-vadimp@nvidia.com>
References: <20250211091912.36787-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|MW4PR12MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2512b1-c1af-403d-8abd-08dd4a7d3f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2MxeTdaSERoNFI5SjFWMlhaR1NwT3RoWVFrcHk3MXQxYWNsNzg1R0NUaCtB?=
 =?utf-8?B?QTMwQ1RRR2tJZ05LRGdWMDRKNWdqd2VjWVVIRExuSC8yS0JjRnlUQkROaU1Q?=
 =?utf-8?B?Z3dXQndMZDJRMDBNbk1oRitUMC9ITWE4UVkzQzJ0NkNpemRSZzZaTzZjR293?=
 =?utf-8?B?V3JsTzVoN0w2akhjdXdZdGxrajBjRVlrMkZWTTlYUEdyQ2s4ZktwRWFXTERP?=
 =?utf-8?B?YTJnbzV3aklTUzBUeUo4QXc5aVpkNlFwUG15NG1KT3RMcXlBVFhjVWhMMnNU?=
 =?utf-8?B?cWo0ZmpRQVltaGttdjBzVGM1WXV6dmJsckRQdkpyK1U0dTlybEVqQmtWdDgw?=
 =?utf-8?B?bU1RTUgwbm1HZUZTS2FzQlBuZzVTci9LM0dtaW0zS3YvVmJOeDJWL0FUaGxh?=
 =?utf-8?B?czllQjlTN3pSVjdxaGRsOWlCcUY1QWQ3bEhUOXBSeU9IUU9ZZDI5L2tIR01E?=
 =?utf-8?B?OVBveVBYNHhzakRwWXBvOGtySEs0QUxVQytsR090UUFaWUhQQytjN2hROGVx?=
 =?utf-8?B?bTV1d3RneFRJdTRMYS9LNXBocE5UZmJnWld5K3Ryc2lYa1gwbFdtR3MrTkRa?=
 =?utf-8?B?MDlIT1FBblZVVkRoOTJKbjZvbkEvZWdXOStQdXZ3NGNHcEhDam9mQWhQVlFy?=
 =?utf-8?B?RjhvY01sTllIK1dHSzBLTUt5eVpWMWI5VVVNc1BvSXdnVExJWFppdW5OVU13?=
 =?utf-8?B?bmc1akgreWtqOXJQNStzZUIvOXVGMkdud2pONytIcFJSUEFSYnlTcldYc29i?=
 =?utf-8?B?Z29XME9yTlBlb2hmSFJEeEYyRE5Ec1BSc2xseHRFemdKTEZHN1ZPUWRpNTFE?=
 =?utf-8?B?SzZRN1ZQdm1jZ1J4K2RRK20zd1Y0akNBdEVCVXdWSzNKN2xZaEE5NjlpYTdq?=
 =?utf-8?B?SnBXM0Rsa2JMcTdMUHVTL09OZlVIbERqUlJ5UjR6UEVSZVhQV1F1NGJUMUxj?=
 =?utf-8?B?RmJncmZsUVRNUDYyT0lwRTFZS2JONnpyU3lSdWRHbmdoU0xveDVjbmhlWG5R?=
 =?utf-8?B?Z2NXMFNyUi9OMVBFL1dQMGh5WUkzUXRxWEJ0Vmp6MUNsMlRQQTA0Z2cxRzg2?=
 =?utf-8?B?TnFIajJXZXcrMjJCVVRkMjZUZG01cVRMTVJqZjY5T2VSVFUyVDVHVUlwWlVY?=
 =?utf-8?B?YkNoaWw1K1ZNRUxGRFhtNzE1MUtpY3g5MTZqOVFvTlR1YzZZRGhHOGg4MSt3?=
 =?utf-8?B?Z2ozbi9peUh4ZEYzV0w1L1hwS2VES0QzaTljUkZ6ZE5TRm9rL3M0amVVRnZv?=
 =?utf-8?B?WlBMWXdZSWErT09XNGgxMWFkdWVaQ1ZSSEQvckppMlFSRzZpSnA4czJMSlFB?=
 =?utf-8?B?bUFGT0cyUUJRUnpSZDRSU2JTakkvdHd5Z29OZzJMYy85cDFISFNwY1hHczlm?=
 =?utf-8?B?RkswVXF3SENLYVExNHdIVnBvSm1pR3cwV0V0NVRORWRvLzlYV1ZHRmxObDBH?=
 =?utf-8?B?KzVTb3h2a3E4eG15K2hsTEJSN0dReHQwSFVTVURoWW1nQjNHMlo3aUM5MFd3?=
 =?utf-8?B?UmdiaVNIeStGNTlqT0dQTGFGVmUyYlFkMnIxcW1jd1hCVVhHRDhwWDY1cWZ1?=
 =?utf-8?B?MkZ2VEQ0OUdrRXVKak5kODIvTjhyaWd0bFZ4aFp4RUtBeCtJL1Rxc04xN1gw?=
 =?utf-8?B?QjYwbVkySVo2NldyNUEyYksyeTAwRkJvTU4yajA4dWRrcFlpalFzbWFsS0dL?=
 =?utf-8?B?S0w3U2cydjk0SUpPa05Kc21nTVpWYUFUcHZJMUhOWVl0aDNGRlZLRHpUU0gw?=
 =?utf-8?B?RGxUaHJjY1BvV2FmQXp4eDA2bG4rMGRucXV2L0kwT29qQjZQRlNpZUI4QXFI?=
 =?utf-8?B?dDZXM3VBU1RvY3k0dk5GM2dhNFJkbnIwYXRXUm9KdW9nRGVoUWVHOWtZSU5o?=
 =?utf-8?B?NEhRT2U5aHZlYkhZcGg5RVFYWm5RaXVFRXY4M0RRNldiRXBOK2JvcE5qeWtn?=
 =?utf-8?B?T0w0bFQrdTIyVzFUMElnNWVXMTBLUHV0YWlnOUZLREdEVzVscmFPYndaVjlG?=
 =?utf-8?Q?yMot6Oc2kASUmneBDHOgXE2NV06TFw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:19:54.7160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2512b1-c1af-403d-8abd-08dd4a7d3f34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7014

Add new field 'capability_mask' to structs 'mlxreg_core_data' and
'mlxreg_core_item'.

The ‘capabilty_mask’ is associated with the relevant capability
registers, indicating which attributes should be handled and which
ignored. Register contains bitmask of attributes or number of
attributtes, which should be handled. While 'capability mask' is
superset.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v5->v6
Revised after comments pointed out by Ilpo:
- Drop 'capability_bit' from structure 'mlxreg_core_data', since it is
  not used.
---
 include/linux/platform_data/mlxreg.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 0b9f81a6f753..b2a3377a28e5 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -118,6 +118,7 @@ struct mlxreg_hotplug_device {
  * @mask: attribute access mask;
  * @bit: attribute effective bit;
  * @capability: attribute capability register;
+ * @capability_mask: superset mask for capability register;
  * @reg_prsnt: attribute presence register;
  * @reg_sync: attribute synch register;
  * @reg_pwr: attribute power register;
@@ -138,6 +139,7 @@ struct mlxreg_core_data {
 	u32 mask;
 	u32 bit;
 	u32 capability;
+	u32 capability_mask;
 	u32 reg_prsnt;
 	u32 reg_sync;
 	u32 reg_pwr;
@@ -162,6 +164,7 @@ struct mlxreg_core_data {
  * @reg: group interrupt status register;
  * @mask: group interrupt mask;
  * @capability: group capability register;
+ * @capability_mask: superset mask for capability register;
  * @cache: last status value for elements fro the same group;
  * @count: number of available elements in the group;
  * @ind: element's index inside the group;
@@ -175,6 +178,7 @@ struct mlxreg_core_item {
 	u32 reg;
 	u32 mask;
 	u32 capability;
+	u32 capability_mask;
 	u32 cache;
 	u8 count;
 	u8 ind;
-- 
2.44.0

