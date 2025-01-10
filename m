Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E72063C9
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516771; cv=fail; b=EKtj0VfT0B6Wr4wqlDwFSl8pskzAckp2APMmtgRi5mO6GiPBM2qiR7OMgE5C18SW9ws+s//1FYwvEnfOpdMN7s66hBwpw0DKJQcTSTgH75IUxjRcTYSY8tgGaxcoUOayipAZAlqNXlBmtMhmuwrdyv3mSZ7mBmPxil2XNuFHYdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516771; c=relaxed/simple;
	bh=DWdDEVPrrZrnn9AFLG+WJej/VdneWItIEzL/2fGk5UE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZlShknrlxh/33HAnBPAIA1mvgSxAdo4wQME5anrMpK0DInpznc+snRuSrcmP3DPyuEgUUmvgK3Zo04xgmeUfInhpnn7XpmgmNLMgbRezH8xdZsOnnrgR1JAs15M9CcmfB3dPzewERR+RXIGuFIY8QJ5Toq6U7I+dggcg3XTfbyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ha+w7b+P; arc=fail smtp.client-ip=40.107.92.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ha+w7b+P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nc1tgJSrX/oN4hTsiGgYcc15C/P0JigEolsdtZdnr09D23KXMocceN1c/LKrI329/JWFIvgo1+/wWtcGNhwUEGrfTG5g37diOyapa6PS78hLcOJ5smQ7yrQbcbvxD8UTwPLzuyHrgFt1x5++vNt9q71YNTjgWMX+ggFVzsxXIGLrhIab1qhc/LZNIMd/xxvSFbRC41dVeryOLWBBDsox7mdNjntkIFiviMEQfuWI93yPeALemSl5KmNk1SDJHDbuhAgsAEKWdJ4nwfGgsnBVW0P7M8WASz9jhvxBDGTsOEBmy6J2I+v93EkLTDHsn0MjuhB9VHnlLIlpFhgETN9GuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovq7BtzWkFhol3D7EjgRQqj6lhf18gjeGnoeem0v2pI=;
 b=RerPxF/9qOcBmKMK9tuSpLGSwdpkribzPPpPzYY/L78+sGvvuHM99Pz/WkL8e0mGjh7A/0wb47QXReCS5gXnGf2s8bbL5APsPjdrTqgW9A6MQjT+K9aAzAfUq/nguQVtgA+jvrHkjBtP0qC+/bP0It0YqS6sGt9POQflB9n7P+BhaPpGo3fgY1d1hsb9NE9ADPKaS1refabayHZm/KNhfk61SXkueHRlzuslU4K751MfsHRy6h9eFFnoFntcWJbrLGSt6zGD6CgvQLe9wPrXX95K7I1xvTzlIIJhC/I/HsW1abQJ9Ok2riZxX/sYNT9KxPqvO+n1L6N5FJXY85VDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovq7BtzWkFhol3D7EjgRQqj6lhf18gjeGnoeem0v2pI=;
 b=Ha+w7b+PJbtgiy2hhCoMGmvZ8dwwA61CbpJndkyafDRCqWMmsj/l7fSRGxx+oz4nWTekRxKJSgiqWT732WTYdC+2hn3CM0zeh73O0oQHfH4iUaOGBLXJ1Hikb28HSo8/jwsPu8DFUTm03khtx+WV0KF7wtCz5eRo1ltyHfS13uR87C1MQ55qeQXKVqqDtcEpIez/8OPqegdnJq1juz/kO8DeeSzkLXMT1orfbqo+ctnRHxzNfI2B2nCcQYXFJQu61cSINSgYCjsaja+XtEEZvbeZpF3EymvRCeQgMpB24AekihVQmzRViJUH44660WF10U3qY/j1zVSYAUz8mUdozg==
Received: from MW3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:303:2b::10)
 by MW6PR12MB8759.namprd12.prod.outlook.com (2603:10b6:303:243::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 13:46:02 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::a6) by MW3PR05CA0005.outlook.office365.com
 (2603:10b6:303:2b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.6 via Frontend Transport; Fri,
 10 Jan 2025 13:46:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 13:46:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 05:45:52 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 05:45:50 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 04/11] platform_data/mlxreg: Add capability bit and mask fields
Date: Fri, 10 Jan 2025 15:45:02 +0200
Message-ID: <20250110134515.8164-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250110134515.8164-1-vadimp@nvidia.com>
References: <20250110134515.8164-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|MW6PR12MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: ee911f97-e421-4521-8457-08dd317d1f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g+PbzZPzqD2QXua7lwOTkI/BVwezjLukQ2WNemn8QYtzyvzX5ZzwS8eKAH7I?=
 =?us-ascii?Q?qOT86wxSSX+NneCkFaqRwNPSF1DToZ4tXco0cX6O9igO5s0HhOO3MQRaA4LA?=
 =?us-ascii?Q?TGJmjv0ok7JgaahtAYDNLapt7yxbkMIYLbbYX0D0STGnxCCFTEqyp1mC7Adz?=
 =?us-ascii?Q?rstxv3g5hYcv2WBg4PDQx3cAA+XIhWldcTeG52VVB3BpIysVM+eUG6FvvIGV?=
 =?us-ascii?Q?xCHJyjwwjq1Zaw8jBg/ryRuRbTcWl/gcY/Ks/VkGX6/EtPZUHdo1ElsuQryu?=
 =?us-ascii?Q?OFDh8z9i4qgBud+Ee/O6ZuuuGF1qSzzqiURwHsesFV6YMhqDGWnw0M6hV09m?=
 =?us-ascii?Q?A0sBnrruP/2xA26kjPXV3fVk6q+HdYN5HMZsCy9gGAq3C0KnJhKEPBrwvLmv?=
 =?us-ascii?Q?eEeMJ02vVkMJ7GvMgmITGncvVMSe/hWWVYEVlH2xI7OODFz0vj9cLyOLWjYw?=
 =?us-ascii?Q?QVf2s5TKz8Z5eRdBGO/IqZBDWygwKqGQHIwEMk7jDT2iE7kxRLXcMNp/J+Tj?=
 =?us-ascii?Q?KRYjN/Jy+JrAM457dWPEgZX9iBi6VVxqLsjcg6Zciu5e7beYaBO4O9g3W+vr?=
 =?us-ascii?Q?I1NXvx4QshGL5HOh0amxafaOfWuhiENef0/zLdSFU/A/uUJY3614IC60qb/v?=
 =?us-ascii?Q?uzmyNaBZR5sXsF0P7J41AWmrn93bys1n7NA9HpSNIR/XBegHxJL++we4NaZr?=
 =?us-ascii?Q?uARZge+adHgGatuo5zLeGa6EaIPsHZAUQtjPq+RRBhhTAKewS14H3UeYrIan?=
 =?us-ascii?Q?aECcGg/tHyfasWMneK3f0d8/S41xnHZbqXCvfu40ZxW1ZF6SySeL+JGO9p1Z?=
 =?us-ascii?Q?yMZAFVOAY1fT14/JeGva5TtX2eN0KJZe8xu/ysTdkNp+HQpOlh+dhxscF3u6?=
 =?us-ascii?Q?rkWhO6pGmmLlWhEbjk5oP8UrahjNNN0vCPa/Gx5icgOk0kvkZf+BYyVsCceZ?=
 =?us-ascii?Q?+ybDrnjO0tVNkWKbY2UU3d5Y4KGh4O0LbPsqxeeYZ/065CjHM6wgZnUIYdC+?=
 =?us-ascii?Q?rZtphrdceM6U5htrzTj0OID8wKLFafZIPzKcWkT9QQwg0nOLJbjtgf1Tguw0?=
 =?us-ascii?Q?wYawp/Ooz3lqpUk6krYW8SFb2LJ0EIFQxMaLXilx5XRXWQ9ahVDcnIE0KGht?=
 =?us-ascii?Q?MTNcq+dTWAJRrD3f8CWmGkdu0p+xn7xNJBd7j9kzOwMs3FZD9AomtGZYWOx6?=
 =?us-ascii?Q?tgzERhqYhm20EP0I8VLddzO4Ly3rfOv7RDyKqsBnkqh6nG6znoE3NP+z28gr?=
 =?us-ascii?Q?8f3xUqAPYKS/8FHPbzqlVgrYFZf/akaCX5QcSlCM6thwhdfort5BVH2FMZUr?=
 =?us-ascii?Q?80rUniYvBrwqWCET7U1WkWHmx6fAdb7Rnpo/DdOheuA2CxA/7L+kvP8mUsBj?=
 =?us-ascii?Q?NqzBDnHJQRbD3tw2WQkrXCBbjajITYMEiE6+yGjkQTIi5LbEOPgHlv8wPwpB?=
 =?us-ascii?Q?GSwvoJj0Anr+2sTZh2uGKTI5DeZi6St9SV8+qiXzC9X/YPffqsqNiNBIzRGL?=
 =?us-ascii?Q?NmbrE9roDTguyAc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 13:46:02.3541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee911f97-e421-4521-8457-08dd317d1f75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8759

Some 'capability' registers can be shared between different resources.
Add new fields 'capability_bit' and 'capability_mask' to structs
'mlxreg_core_data' and 'mlxreg_core_item' for getting only relevant
capability bits.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Felix Radensky <fradensky@nvidia.com>
---
 include/linux/platform_data/mlxreg.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 0b9f81a6f753..d9f679752226 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -118,6 +118,8 @@ struct mlxreg_hotplug_device {
  * @mask: attribute access mask;
  * @bit: attribute effective bit;
  * @capability: attribute capability register;
+ * @capability_bit: started bit in attribute capability register;
+ * @capability_mask: mask in attribute capability register;
  * @reg_prsnt: attribute presence register;
  * @reg_sync: attribute synch register;
  * @reg_pwr: attribute power register;
@@ -138,6 +140,8 @@ struct mlxreg_core_data {
 	u32 mask;
 	u32 bit;
 	u32 capability;
+	u32 capability_bit;
+	u32 capability_mask;
 	u32 reg_prsnt;
 	u32 reg_sync;
 	u32 reg_pwr;
@@ -162,6 +166,8 @@ struct mlxreg_core_data {
  * @reg: group interrupt status register;
  * @mask: group interrupt mask;
  * @capability: group capability register;
+ * @capability_bit: started bit in attribute capability register;
+ * @capability_mask: mask in attribute capability register;
  * @cache: last status value for elements fro the same group;
  * @count: number of available elements in the group;
  * @ind: element's index inside the group;
@@ -175,6 +181,8 @@ struct mlxreg_core_item {
 	u32 reg;
 	u32 mask;
 	u32 capability;
+	u32 capability_bit;
+	u32 capability_mask;
 	u32 cache;
 	u8 count;
 	u8 ind;
-- 
2.44.0

