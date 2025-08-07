Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E85D223DF9
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Aug 2025 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754561220; cv=fail; b=DxFKWvn3daIfMjsUV5VxNqRPskbGX0/MMx9xcQB2eVnsbtd4ZmjzbyRcmNnsyHAT0qGS5VE2jOi6EobzXs8FcNLFY4VZe7sd3Cb9ZV3q9rWODS2KFNXrcgic9gx/bEHlEcEEaHp4Tmou5SOcLXaWgCeOoA8DTUz5Xsrk/4gwu9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754561220; c=relaxed/simple;
	bh=8daKKIOEo9go4kgbw7RS6f8eWf+AMbvKCVpacoTwfxs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AFKTzKcV5G7u2n+Vyu9roQe1JdKmIRSk/fY9cfFsIFLr0Bh32kSyyZPW1k613du/VxazgqrV9+luoidTWyOzcxHvScVH802lurqBYN4S718op0Im3sOtGiD47mturLmWQjzZzkdGurMmlKjjV5fuyGzHO5r3HFto3zfPMclMuxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EM0+YYn7; arc=fail smtp.client-ip=40.107.243.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EM0+YYn7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/GAQPOn54LHuNKrjPk+05rA4DvDVf0FEFHTnfwiLP/qGSESPOngfQkGwOhhxMgfI1B3cg+5BqhrKTCWrFKgVgIzJE4m1X58zTfWRvx4EjxzRiEOxIwQLhAeRHcJytO9MWn4N6W7djZNdH/eD+FlnTNwSC8kJ7l+NSFVyTD8Gbr3SISkn4RhkWRz4kDKBaedP5dRY4HzT71u2lXkIzuJN1cZj9GsHwy7u9IR/xQudUejsKh2PwwwjTdOM4KG251oFX2PLQAwTDPTCLuGoHB6+/sZePOcFnl3Eg7QMGIVow0qsAO9YDz91uNItwNJbF1fUF9GtXcuFXC90/NvqPQDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1E2+DfZe7T6q97eLYA6LYBUCfSQsi/mJL/wBFM6nu8=;
 b=oZy9qXXhgvFf6tbm6NdUwxIsY9T4Ga+vFd9J+rVxfn9GXW/Wy/MdxVj6zdX+/rQc99XtLIfUUyk8JTu0ggcDWasjyexEQiDqkHhzoWnahJsBjMHMwIE3HxoVg5jLZ3Ge4cJcZl0uqzOXufrWcZZfCBllldP6+6dJyNHMdm1ysUUPs0MB5xI3D/kdkgGXPdF4gmxOhseGfLpHQiHbOR7o03yrEf7c1RU+cWjvFaE7KpVFTmv37S/9HuzDP4ScenmtsgLlhcxpCql8jc99dyp10SLXBQPlPnzauDDJ23wcGrItMOPSif+M3XI0MhinOcxR4vutwxYj8UB5jDDyAVB+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1E2+DfZe7T6q97eLYA6LYBUCfSQsi/mJL/wBFM6nu8=;
 b=EM0+YYn7FkF+ucuiC3ThvC+hXXB4teq9wxT+LQkmz2LOPNLT1lG1B5TekNidN2J0L9z/APJsfTrA1XJQqi3CoAr5sDMhdZu666rN9rg2oxOQihc1KLQzziMvFzNgUoSpOLzGQTQFHiHB/o5zh3EK38xMz5dOnkEVxdz0ICvrv8o=
Received: from BN9P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::6)
 by BL4PR12MB9477.namprd12.prod.outlook.com (2603:10b6:208:58d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 10:06:56 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:10b:cafe::89) by BN9P223CA0001.outlook.office365.com
 (2603:10b6:408:10b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.15 via Frontend Transport; Thu,
 7 Aug 2025 10:06:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 10:06:55 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 05:06:54 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH v2] platform/x86/amd/hsmp: Ensure sock->metric_tbl_addr is non-NULL
Date: Thu, 7 Aug 2025 10:06:37 +0000
Message-ID: <20250807100637.952729-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|BL4PR12MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 99cdeae6-461e-44d2-9e92-08ddd59a23bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1bQo5BoB3stM8khfy8SYwerUWmBP0gyqHvvluu2u5GnoxxXFqOzX91pDKfWD?=
 =?us-ascii?Q?p3+03xmaoW2n36iDmi/b++s65FHQ7xfIQDHVdT+uwnn7Y0sljauJq1D/E2pF?=
 =?us-ascii?Q?Ql9jeiGUhb7hWpPgULCUNobNVtxjDT7EoRPQq+wZQZ4NcupluHLAbhDb8m8i?=
 =?us-ascii?Q?3eWCTmo3ZseA/17UqbEZwfw3+uS1kHWKOFPOIL3Zv89C9/7GaXworvz9j2XQ?=
 =?us-ascii?Q?iO/3c3tiIDQLdrD1y3o2VpEnyJgHosCZ7WjRzLPuP0GusAmkQGQt1EgZcRN1?=
 =?us-ascii?Q?6vZ+dn1AdqwXtLF48y3BoYxVXElJPyis57lZKJrAAZ3ekNLvq/1GCA58qRGb?=
 =?us-ascii?Q?sJVnjIQ0qrriiLUiBUhECyXkqshjnrrSakHs0D6S9qUSWibSDE6n4NHdhcz6?=
 =?us-ascii?Q?a2+TKrlxSXRsFvjVVkGVhNZi5J+2cC+P5CSp9sVJiB9cIYDkopAMGYErgVRD?=
 =?us-ascii?Q?WGnDfJbNBcZh2OdzYxwjgjt6YpjpgR9n02v0FwYf8VHllgQIT1WKO5PecXhv?=
 =?us-ascii?Q?oF5sPTtPgeAbijLj2ZFWzZM8BGQHI1p3CohO2zDQToDGaTe2WOp58hoivvfR?=
 =?us-ascii?Q?cItp4PHSeED9giPLK+4r2fZr8S7cysyNsxW6EljgiUELwRqqCsgTqZuj5LMH?=
 =?us-ascii?Q?RUEowKRrGqoCL2rIhKOhU9UiCy0TV5WOx9CVg+PdHHxXhA6jF2EagLwvO6ze?=
 =?us-ascii?Q?VGKu5I7G3cmvsMoHQNnZwipRN45u/0+tttdBt2Upx8khZU3tKbEITNsBPDZo?=
 =?us-ascii?Q?mpHToAb/KyFMcTuJgicQM+tTgOYuwooV8+/+eBWQMABb8JRPrKJd0Z2QMjVh?=
 =?us-ascii?Q?B5AisfXKgERyUquZk9SRTp0WGU8KQyl9E9ieCgJxiNNoVnS6UF0CzVhdkilz?=
 =?us-ascii?Q?/zqRzUyXgMDwgTT4l7QE7LrNM3LnApDNWoqwjoR4aqQn8UBHdRVX2VYDCEDl?=
 =?us-ascii?Q?RjDkLpB10bFtY0w1/taENTE8s8Tgxw/TuXdi32dOhKEnJdJ8ocJFmuTB32TH?=
 =?us-ascii?Q?8l9MOGQkVSWqyDx0OsBgE9f1XvPoLH7RdpFtIl4iWVNKcp3W1VuofnLAaifP?=
 =?us-ascii?Q?YQH4WKIhg+6467NsjeZg88WyoXWqGNIup9sK8LzpIDS4PnMPApjqLf4UYJQw?=
 =?us-ascii?Q?Rje7KnYc4XS8+/9Hlr23UqChTnu2ekC5KWIyptsuy6qUucTmbypC5hk5FREY?=
 =?us-ascii?Q?hEV0QWUs7+o1acmT/P85k4Yzp/EW87+JRgSk+6y5eevgB1olElhFpla3EkbI?=
 =?us-ascii?Q?PlhA2Z6UVIyF47FfD7RjramyyAjV8R8iCUhcFn2WnS0w3iWWqjBnt0prMBTT?=
 =?us-ascii?Q?RH/+gRU5T1iWu2Gkb/0dDBKDNmaGV+8rXQSDDegpmceLTYei9PaUoPqxxvZr?=
 =?us-ascii?Q?Uc1fHmAflRnfQO/cki8G0yuCfqt8sIYfyRPC5veIxr5jaTCE89FZcw1t6/g2?=
 =?us-ascii?Q?P8SLT/Zz5V2cUltYv6sbAGLZkvdsNU2E9HWC5mdT2wqSQzRMIHBUJLc3H1PS?=
 =?us-ascii?Q?YADoaqH7a37AuLe5aq1EIN2pFpinfNptcBtD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 10:06:55.7366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cdeae6-461e-44d2-9e92-08ddd59a23bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9477

If metric table address is not allocated, accessing metrics_bin will
result in a NULL pointer dereference, so add a check.

Fixes: 5150542b8ec5 ("platform/x86/amd/hsmp: add support for metrics tbl")
Signed-off-by: Suma Hegde <suma.hegde@amd.com>
---
Changes since v1:
1. Replace null with NULL in commit description
2. Add Fixes tag in the commit description

 drivers/platform/x86/amd/hsmp/hsmp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 885e2f8136fd..19f82c1d3090 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -356,6 +356,11 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 	if (!sock || !buf)
 		return -EINVAL;
 
+	if (!sock->metric_tbl_addr) {
+		dev_err(sock->dev, "Metrics table address not available\n");
+		return -ENOMEM;
+	}
+
 	/* Do not support lseek(), also don't allow more than the size of metric table */
 	if (size != sizeof(struct hsmp_metric_table)) {
 		dev_err(sock->dev, "Wrong buffer size\n");
-- 
2.25.1

