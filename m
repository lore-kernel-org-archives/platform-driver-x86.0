Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67F5187554
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757872; cv=fail; b=QHgzcJFUy1KZl86VxqQC2W1jsDmlRkyNnQOMwweL3Fz1GMmrgoczdSFq8JxFNnEX//B7heIEa7Bd03YZ3nNoCf/rNS1/Hoe32BtrRBJe1gcCCeeOYbkkZ1FGlJc+KJvGyWGrJ6uaUbOlCclgZrXSTRjBGdiXOoxd7D3ftP0M4K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757872; c=relaxed/simple;
	bh=67Kzs4hbM6GH/F1cHitOcDbje/kTVRrKd1hP6rgPzBE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+RW+uzrWA/HsczjkhyBn8+Ptfag2cjgBNfZMwqwl9CLDegdZ86dy5ExVg7kaO7wrSyDLn00IEzK/bnLaiOXJeq3Ronqqwqo7SehVnVPcuRTJjJs5E+Nl+ji6w7JoCEfgXrML8WqvIW60slMwGoxjmcnrnIL2YiHt+v+2kNW9aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HksleZho; arc=fail smtp.client-ip=40.107.94.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HksleZho"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgKk/livEJhNzaxr1lrjslHPtc5Dp+VRjz9A6dJwajjBZ6O2IsmlBfl2dpqP0wExrfb+PKk1o1hiX0ELBMlDYzDLKTML1epqiELDVyxRxzC897X0Y3PvjY7T7e8+ATAcW780yAXTeIVLTglO//ntce/H3XWHbrNDDzUCfflvAWUqysE4ij9HC9UvqReIisweqtsRjLv87EDrnIr8+r+C4RU1jzwHn+SVnfRrWKQAeiYWveALSLTx4SHkKiO27+J/bBC3Gt7REdNfla5fLLv0YoMzUYUO8NPl8RLj/7jiwpWaMmWmOIHghcVznvsKVBRjrSk6vdlCzw4Fj14yHhpWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3s/5943YPllt4mq0NYheL/grPLWxI1/6HbAyx1QBFI=;
 b=hF1/EJEMcaiipPue/KN3q0bmR3V8LA0nOzPec5E7n7IloTstmAUOfzQN5qDl8JYrkpxWp5kjhsW39EmZmCB7JzkpHfroXrOsP6N6QYEFfrn5XNqF5ri8kUJKBxGqFytIiI5nhqi1tS8JHt8D1YIlPEd92b8Z8miAKIPHZOcGkK2uw1JeP6aF49r2NGaEkhstA00NM182AOfjL8LSL6TNVqkypbpN5vph3kPyaNWvRSM1VdE2pA0kQZtPrQHx1GEUBNNSA0anyRHZJYWThi5OsN8W5lia5VHJUo2VNm2rEVH5cR2GeDeCAfjJMLXIpM/34UExgT/WwJer61ItXiQ3ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3s/5943YPllt4mq0NYheL/grPLWxI1/6HbAyx1QBFI=;
 b=HksleZhoRELAFWnzy6zg2xZhjOd9WWazdzyIpn5hFNuAhek8mwOZ/gACbTxxg8f+WRcyeSfpwOelpjhNYwlKDeWNnNIsRQsK+TJ6v5+akVQnVs/WMqokYTnysvE4/tcmOsp9gVGTGGkoLvDDM+DW8itbYGFAQpdejIRjU+up9Fjma6juT75VjJxZabQRNIPbU4WbvgxjLq8IgXGtxX7S7Zj8IJcSNz/D6IUH/ickVNO3h8eKLXOR4boXNH5hJa8maIb/CU2qvbqmY5X8Rfh90xowfzABhKPMWuHrPQEnuTnm66YwlHAnH8ZpjV8QvrhA9UAQn0hE62s72cCYqH6Cpw==
Received: from CH2PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:59::33)
 by SN7PR12MB7449.namprd12.prod.outlook.com (2603:10b6:806:299::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 08:44:27 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::5c) by CH2PR03CA0023.outlook.office365.com
 (2603:10b6:610:59::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 08:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:44:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:44:13 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:44:11 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 04/10] platform_data/mlxreg: Add capability bit and mask fields
Date: Mon, 13 Jan 2025 10:43:26 +0200
Message-ID: <20250113084337.24763-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250113084337.24763-1-vadimp@nvidia.com>
References: <20250113084337.24763-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|SN7PR12MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: f591bd69-c1c8-4fd6-29fd-08dd33ae7d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?czInE3zgP6JBDSDyKWpYPRRcLKS5nwRkGLKR+CwFbV6RrTkVUg2Nc9t6w38R?=
 =?us-ascii?Q?kBvFBEjVyUxeCYfv7fqTO+lBceybZDLyBh2kXtcOcZxzLZuMDIPW/DIz7Rxs?=
 =?us-ascii?Q?6oQOioFbMdf8G0Q7D8cq/wRqsljm/Ic7z3pJCPUmPhGTovY24ttpiHQjTZsL?=
 =?us-ascii?Q?duTTqbjHBFTOQC/IUlI5PzFk9GsKBLGQs/2/o7JUaL34aPj+/T/NmRZdUVuC?=
 =?us-ascii?Q?0S3/Le/EUY7opWZfDnp/LmX7YeXaJ+92YBfz5XOZSpyEsNqz14VYXjiJeDhw?=
 =?us-ascii?Q?koIYLKicrPiU80vF1w98s2Z6TLt8wBub5Nez9at8tp5FFMYFr72xvORrm4rL?=
 =?us-ascii?Q?QZSnAxSbHF/Fwg4Y0b8iGeb7t+ybdP17VpkTJ1LvoAk5TkTDoKpNYlvUqPSq?=
 =?us-ascii?Q?PeClUPqnZUmyoVOTAE6A6j3I+0H7bNh70NDacwvWiprURH8RTEbLJeYiMSDJ?=
 =?us-ascii?Q?fOUx926Ix9WUqplCR6dBfZA4s7I67Htqi9KB7WpgtOMWptm05m0XtBbrKe1/?=
 =?us-ascii?Q?zyPlFWiz2+uCnJGe0CQaqBxdUOsfHPGUI6mitFREn/dyvd2iD8mI78dRY05k?=
 =?us-ascii?Q?bQTKGzhfK5NnA6ncyK/BjANowvqjvYG4TCwHHrQFMQ+xqF4QgSxr5s0Eni+I?=
 =?us-ascii?Q?/cn+wP+TTEJtVXS88nDeurxNIoK0s5mLByHHQAbSUQ9cHyW5T71XwYTkZGD2?=
 =?us-ascii?Q?mTefNE4uffB1zMRAlhp00U7Dyl29ylzH7SisRxS75yvt+QARRKubTtfT5U44?=
 =?us-ascii?Q?D3bftrrUF277s9zToXwaV/I3IbvPL2JcKxHpdASLj6wGAawgQNrdiD94idQ3?=
 =?us-ascii?Q?NhtzAABMrjbMQKG/NpQ0kcZoy40jGYQwBLMzHbpRAp0AHUDcpU/rW42AZIK6?=
 =?us-ascii?Q?rhpXCKmJTUs7zTc6uVfXWs5lZKB+L6SsGFV4F9Ee9z3zpGhUeJTH1tHt05AZ?=
 =?us-ascii?Q?IXc+DjoW86IinJN5Ft2ZDOaWwis9xRaTVtybk28zoGfaIIAUsp4NqLja8NQD?=
 =?us-ascii?Q?bG3A24SvjBlozdSQcGw5vtt6PAfW0vcoyEKbHmpvTVJbRL8iyD/jdRKXeXxi?=
 =?us-ascii?Q?pfr8j50QcO6t7+rLolNKV/ztbZcAoMXyK9uAGTJ/IIc+vFnuLPda9cxQBQsA?=
 =?us-ascii?Q?IRm1TeA+YcWWttSazOUGwoYnnoTNflLgFo5IHGde4FheyvQtKfrwCdtgnXFQ?=
 =?us-ascii?Q?uNvgc7ZpHW4cnDobVuVlbznK5tmnr52I58XokKEWodh6Sve5TM77EUMGkp/G?=
 =?us-ascii?Q?mvL85/8ANSNSGCLFf1MaDmpbDGmpoVoXjb16aXCPIt6ftZsTkLtf8DVM1zWz?=
 =?us-ascii?Q?KYY2Uwhb0iTowZc72f0zF+2zdBLA2VQ4UQjlY0C15gAKjFPQ3vxwKEHmL7Ia?=
 =?us-ascii?Q?gZN98znbFjACFXp2N4LoasHT3Yo5VpLCwlMLSASrtEPhdy9BQk35wT6tS/jC?=
 =?us-ascii?Q?JhUYwp8FbrlNI4o/Laqa6Bra/TgmDWkwRN1QWb5rKxG8ebcul5wiwJoIb1Gz?=
 =?us-ascii?Q?6pE2scbKU7Gba0k=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:44:27.4345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f591bd69-c1c8-4fd6-29fd-08dd33ae7d49
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7449

Some 'capability' registers can be shared between different resources.
Add new fields 'capability_bit' and 'capability_mask' to structs
'mlxreg_core_data' and 'mlxreg_core_item' for getting only relevant
capability bits.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
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

