Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E852E1CCEEC
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 17:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739651; cv=fail; b=bRIn69I/dP20w2z1CweNynjhu6IXWbj3Y+ByC7n0rPoFdJKUWvhwgrh+5kupoL8JuXlidJI/WqzlxYNmUoxz0wEF3jid7xNmab+AkISEzig/KRpTL0ndWhcRSXdBhVrijSxRq6unaW8XVh7HgOWg4ukeLm4pMDV4KTD1G05EPSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739651; c=relaxed/simple;
	bh=67Kzs4hbM6GH/F1cHitOcDbje/kTVRrKd1hP6rgPzBE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DmD9tnbkADUspSy1cOUJNEs1QLOwAHNq8yZLSosOzE4Ju2IXAZ7VHwSbe8OJiBcqs0B2OI14uvRtuvofa3W/HOPk5ONOQLcI2QW487fPANvu3yVCz+jpeAI7U05pkqgLhvOekp4eTR4W+vTlqIdKNlyJoOe4Ox8qqJzJMxU6yKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a6Vq2ykw; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a6Vq2ykw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJK5mb51dsotqnNE43B5O0jmHB4AyhSUjPs7Vih388WKCuAxTEz7JKlcCyr3zXfbibwhfmc/7QMkMuCWAlw4NeBmvWGs9CXYEcag+/pprCpFvRn9zGhdc5UiFNrOpZu+kCMTgAqMjD/m4y8fhd5Kx0yi4TPQ/ZmbqudpXq2/xO2in48EM3s1xE5WQnIii6ASl68Ry0KuDgz3OF2rmJt/9QOskVXKhQQv79U7nSDq1KogQO6U1Rpj/pcoCgZwsBJLexYTrYvDIhpn5ebRbqVPUh0ZLpiWwD06yIuM//w2sRfcd0GMiPG0JwKJ3cht4vN+p6O506KAPZ3wmeYjBZzG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3s/5943YPllt4mq0NYheL/grPLWxI1/6HbAyx1QBFI=;
 b=Ti+QOKOp8WYCB/ARNzfVfDxbDFzub1n1BWHbu+YezUpuZtJufZXokia9+yFFrqfYxsU/TztEeFd0E8DUbhge8BdcAlug9q45BEDknLceqejazYcD8F9bNSGhe+9n0ktccsOCfL7CXlfylrmXS2FRYGQulnMkyrDsjRVnW5xk0ladUaT4xWBGMCCBvJv7syEy+xnqyDJfi80dIP3I4Tw7kSoKbWl90GNfjeR2PSHUaPwAJQhB5hzof8yuA37VgwAKKDYYg5Ack0OW55R7iwqSE7v+Eea3y+YT630g/XLg3DN9Jbaf4+ggrwtfYmVwo/+MkzjHv2xbJW0ZglzVon05dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3s/5943YPllt4mq0NYheL/grPLWxI1/6HbAyx1QBFI=;
 b=a6Vq2ykwTLTWpcMeWnjZDP7OC4ZH1X1SLmOrOhRZHH23pRhDu2DEJabv2UmPK7brZw4gjmZ4uvSOJ4EJt8kPTyLUyZocDnUITVEXh84zjMU3NYBL02ha6bJRN7wDsyHskmz367jYRyjfWznT+eku1UG68i+jD/9kteFyKstdfmFgUo7H4qhPdfbvzPPOdAwdd5CNaREnts5tvwLwWc7moEIlBZNfnoQQHmXZMQw1tESoexynExvBFGIxNiyNpyx0DBOYk6syovZtDWKGisK+CHyKRRNDuZxykELo+2vERDRIB0kXO3ZxND7eM6u/4iysqmDHDyILNw2EpJhtxlZDmw==
Received: from MW4PR03CA0216.namprd03.prod.outlook.com (2603:10b6:303:b9::11)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 17:27:23 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::c7) by MW4PR03CA0216.outlook.office365.com
 (2603:10b6:303:b9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Fri,
 24 Jan 2025 17:27:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 17:27:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 09:27:10 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 24 Jan 2025 09:27:07 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v5 04/12] platform_data/mlxreg: Add capability bit and mask fields
Date: Fri, 24 Jan 2025 19:26:22 +0200
Message-ID: <20250124172632.22437-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250124172632.22437-1-vadimp@nvidia.com>
References: <20250124172632.22437-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 63aba637-639c-4d0b-0824-08dd3c9c5d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ViWvsqsGNsGxP2N5XGk+Sb0TXjpOqNKbRK2TVC5d8XHzIN6WVFFSES78cWMl?=
 =?us-ascii?Q?5mvQljRoCtGTAJtwSxFmU4WY4Mqn+Bw/KmFB92StmqVThBacMA3orcGpeCdu?=
 =?us-ascii?Q?fRLBqOYJwoHV/w5TCEHl3CpG8lzwNVLin4uG/rb65KWtWsw6NfoSD/P6+3s2?=
 =?us-ascii?Q?can6li5ZNv8jsLp1MwWesB9l7CpbXg/bWaRohVDxYqCLImpJpxTmV/9jsGCS?=
 =?us-ascii?Q?MBd+tB2G3xpbAGoD8Ac6uyzemXKvcC/d13FjPmjriRnHR54mPefLm8yMhqTQ?=
 =?us-ascii?Q?ZYwIpnxfEO5MhqIqP61K5qTUozNYrm3c45LhFlHk6OdXMuABToCpsCVL/Y26?=
 =?us-ascii?Q?uRBrTkmgb4q+56MuSDT3ZD4P3yoMOld0/yhXXD7iRA3qUURpgWffrTzbshW1?=
 =?us-ascii?Q?nq5z9b1NmqPRlgHY34Jss2sN1/WigSc2KXIG/rMi71PqCRZfSOpDyhYAYLI1?=
 =?us-ascii?Q?+8hcXkAQoX6vhokzpNSiqU3/MqqIgQvUlk+f1ZSpDzIfaAeJqgxKDd0eoxhy?=
 =?us-ascii?Q?hLtCMmpSx8m89DlYiLRP/XP8Lg4cRl8eONvfewQZJjcXK+lllK5KDi9kGzL7?=
 =?us-ascii?Q?B3HYoN/9rXHkM1B6ZsLRiPtdqXIotFjqnsoXZA6PY4+KWmlkjsfAijjCwtvw?=
 =?us-ascii?Q?GRxMvG4QYuz5btblAs00FrGjZ9z8kO+JhjpSur9xFqsPiZG+HuJ+4UQs15DK?=
 =?us-ascii?Q?GZpbMG9ex/RIqEnKi9pNzIwVhJ01BddA3kFX/rJDgwwMABfwG7/Ug/L1cgrK?=
 =?us-ascii?Q?Us4B5mPdKeCy08mMdb961FZVL9b+kgkNYw529HQ1Q7y2j7smapjXAwI4KAPc?=
 =?us-ascii?Q?WJVEr76o7IQzBF3SwOtf8hrJ/tSjoxupPhxvXarZMmef0IXTGGKHmoCdSkpy?=
 =?us-ascii?Q?Zh0Z9XEcHu7++ITnienFMD6BH37EuEhjKmZ8aklcx6DkJsmtbAHZ0HZbyUmL?=
 =?us-ascii?Q?FvCSmNbqtk+SXeKHehB5wMEtjVhw5HD6LYObxaqszqMXXv2Rj0h3s3gtdSCX?=
 =?us-ascii?Q?gUu6hDd0nIGaVHbacEV5AoNI+H+6Eo8ijIvfmAZhv6mNqiPxq5Ory4sKbv60?=
 =?us-ascii?Q?ArTNBqHncixLatqu0P+2s4CIEwTZ6Ji+3Kh/uOaKmY8wYx0YhEbTt/N92iY0?=
 =?us-ascii?Q?qcx1pDBhnivRfTDsGMky6iJc8pE401J9DUq49JCkp/8QxdOSShdNQDphyUfm?=
 =?us-ascii?Q?m1Fd1N+VKP7P6rMlJpW2PCYqJPQ6eqCeQCd7PGbNNXaTiIwUQFZ64bmSHOMo?=
 =?us-ascii?Q?pSgGyM8uytMC8uoVFdnuPAtQCN7SVq5NRy8fA2RIowZ4I6n6F10QjkyOUw2R?=
 =?us-ascii?Q?4HRTy0chqXvz1T+cmnEH1BRWux3BDtZv4l7uctPSBao3J2/PjkusgivTYSue?=
 =?us-ascii?Q?9pCOmfFPFLLBlLpwJTr73rt2LZ/gqEKBMUYQnK8VebqwjkieQgK+SP0ds3R4?=
 =?us-ascii?Q?WErm1G9yUrqQkuh+nmrW9MWwRXFs2fm29tU+GFUCOE5apHWQmFb4989LOHbX?=
 =?us-ascii?Q?6w36YHOlMGU/LQY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:27:23.1806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63aba637-639c-4d0b-0824-08dd3c9c5d2d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420

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

