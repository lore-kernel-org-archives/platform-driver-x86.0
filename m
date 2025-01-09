Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44D721C9EF;
	Thu,  9 Jan 2025 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433605; cv=fail; b=RYnZ8YUO5mQ1AW0mcZ36wSh6rfAhmpQNMCQQQNFHuR+98MLs5GHzE0/y+Qp812AYgCZ/1aW7hREBk8cBo8sZyjbMoJTq0+jtz01ggyWWErl7hXWhjaDJ309eebIIWfhchb97JlN5pMcdBMhHotBQSSDG6KxJbm3p6iMiDE2ZGM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433605; c=relaxed/simple;
	bh=3vtny7EBKkFWsyBuTyMGLCXiQLm6zh6cEJQ8KP3qQxg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IHuFRcE32Xk4I9y22lI9s+BakCb6Ku4NH+OtBDP6/4wgteNZaBwftgVh3KVeEgPm3YK0a6k2Vwd6OqXpkBJYHPjG09hG9TiI6tVTHn/dmhShMyng1rjErlQdh0RbWTldBtBUkPpeY/kXGI6tgDRgXjR7LQks3tM3TZZsCoNqCF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SlWCq4rC; arc=fail smtp.client-ip=40.107.220.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SlWCq4rC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAT1RXLjjhA107IjizZJj0l1zZfz+fhZs6LPl+PvymQfV9DJpGVuhkjjymTJWa928Dx31nc9ya9X8aSw3fZfQFLicI2BKOk1+VnE4Q41GEw7Jm0rFIEnEz+GEuok01Bcn1rOh5axkeqC/L/hma0JoxqWM4Hek1qlDMbvbzukROkhaITLTc6A4e80L9Wy2RSsHz2lQ/1REn6h6Kkwi3CCWUiEdPt2tr0RZzgjGCI+Phlxre07QT0blfBA5Dcl6ePzr4cA6Y9WXwXqXQEmAvCBXov2Vra5rv3JxmA4G3/t4jlWH8bp8SCqjgM60qW5HMxea+zYtwIFtkm1yGG6RK1dBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMJ7djACdQ4XET8d1+jRb5gNFl1BpZ1uHwytIB+sI7s=;
 b=PT6P27+VvM93uyIbNrK1gbajVyd/+RjxSGYl0BQ4gsrEUCICRTteg/9Y5o0mJmYJPgatcOs9/XyQtrunvpG4QgLRYk2fPkBT/RTSvLsYB+GnXEZrTIjq998eUxaP9ajCZBtRgYJXwKGzj+OenV93e3lwV4iWzgQWL7PiZlMH/7XbpnGM6Nj95oJ6UVGqzCNGswR0Uaw5rbIeZ78gmx7qFfidVEOP5zHe1XQI72mKr9CaZLNJvd6SFtLHJtymWpH5eS2Xrx88gp1pnEqMlsHIRQURLjH+rqNsQgzPU0WiZHYOUu8CHTAlC+oK4HzigdRoiofYP0oovUYjvyqwRbLK3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMJ7djACdQ4XET8d1+jRb5gNFl1BpZ1uHwytIB+sI7s=;
 b=SlWCq4rCh/OdUfqugqTPcQR7bJwEQ9FQy79h+/RGclGIyACJeNazYyS9gOx65Jg6TmxoIFUJIVAOJoiTeOrwYUd/4H+Awx9KJfo5BegKIbqq7tEiNFUs5xI1TWHbCngvdZ5p3mOtIm35T+Rx0XDca5Jijhc1o37y5w2Hfk1KDh3/c/6LKkP1hvN6CgcHoGMDpfAbLi5PB0Lj+T1nual/fT1c1G0t0RlDighkOfLKr34PG89Y3iFa5j94qhGPw/g9JjbMW1ZxLJjap6Qy2scPqDNYMaaNGft/hn/bQ3zUymDnBUvDnm9XHwMInHGlpITn3cHVnx/5A664QH9RlVj2Ww==
Received: from PH7PR02CA0003.namprd02.prod.outlook.com (2603:10b6:510:33d::31)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 14:39:58 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::e7) by PH7PR02CA0003.outlook.office365.com
 (2603:10b6:510:33d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Thu,
 9 Jan 2025 14:39:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 14:39:58 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 Jan 2025
 06:39:41 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 Jan 2025
 06:39:41 -0800
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Thu, 9 Jan
 2025 06:39:40 -0800
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Hans de Goede <hdegoede@redhat.com>, Ilpo Jarvinen
	<ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, "David
 Thompson" <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 4/4] Documentation/ABI: Add new sysfs field to sysfs-platform-mellanox-pmc
Date: Thu, 9 Jan 2025 09:39:23 -0500
Message-ID: <367301238efff01fc200c67bca461c0424baf95d.1736413033.git.shravankr@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1736413033.git.shravankr@nvidia.com>
References: <cover.1736413033.git.shravankr@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1c17f9-edd1-4aac-3604-08dd30bb7dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J7r3mEbgJVZw9UEWK3UjzMuTAiWQ4q4GR/+f6Ihmbn4SaOdeERh7/wTcIxzK?=
 =?us-ascii?Q?VpbVRNcD3MbJEVQUqjfS3qzm9t11773mbyVmoxYwkh0jef3V8OjqZnD7g+pD?=
 =?us-ascii?Q?iOlMXMzPrqIlTHDd95G4pAGeIOoZ1AdZGck64YqhhxtfK1uAoJQWyCtmsMik?=
 =?us-ascii?Q?pshE/mu3ffU8fR9nVa9xnwmiPoBqXL/Ogb8TLq2dieA8Zinsh0b7awpsRs4Z?=
 =?us-ascii?Q?FfMW3ndLQ8N63TPdVE83CAbvgq2mxKioI2xxFlCTYAfA4VpePxP007JrOwHy?=
 =?us-ascii?Q?WNr+6mlYcMLLxJaE+WEOIxYZGHetTkwUfTlGwCRgMb8L88dx+C9Ac+SSrDso?=
 =?us-ascii?Q?SZNMA1twrfmrCCWyV/8Y3BqCfG6qVp9K+9AyO5bt6lX+9EoS6t0RMtUpAMsn?=
 =?us-ascii?Q?OP6V7pielxopgWUPAtSiTYTx9JnQ3AFyANESW7WZpwYtdEdOQma5lqza4Y4/?=
 =?us-ascii?Q?ViHep6Qv9cGT+1ONkWpiPz1Js+35fgLDd++/sH8cq9SnJ33cA8AuRUGETwoX?=
 =?us-ascii?Q?SKzfJq2/x/J5poY8ba9vLBBDKeDjdvRAzJTy26vkijzE2xNHoBUDhVBVY43i?=
 =?us-ascii?Q?KH7KOzOxDw6lcMwKXmi4maA9058J84kKwDqvuA3JqejJ0kYHg/ImPNOYNcSY?=
 =?us-ascii?Q?LOZPSPAHxLdVIJrETS7OsytK7vB11uYiFoCIv/jZPWVh0FpukA4DdvAxLI0Y?=
 =?us-ascii?Q?MHTveli8FcSJdJJVNJM9H1LA/aXJV4J2N/zQh7QW56gA8U0RPg5+PNleJayI?=
 =?us-ascii?Q?mqvtyZlTfC3DUasv3pXcp6hUO8bjqA7ckKSplTj4FB0UwVJweubWfYKywLiP?=
 =?us-ascii?Q?VXPdVEjS1zQvQEmav4NK1rVoNfZLKqTZ6QGjcslvONWfNIEHrZhbA+8gAOxD?=
 =?us-ascii?Q?QirN55YKC9aLdv5ta4TMMhP1ZC95AAccVbwmZgSasRQ1FInBvBzJQKqHVZ1C?=
 =?us-ascii?Q?EsRfJxkojpg/Ed8IvgAeUsVUXwXrwVKsUKwVJtYrJ0vsExFQaErhC6Q2CK+W?=
 =?us-ascii?Q?R7q9IMeZqdtcp6ks0UtU8x3mXpVscSWaCwD3gF15BsxxCi70IaNodIyiS0lg?=
 =?us-ascii?Q?nC6XYfGV21+M6qnfj5vyW1TptjnxqafG5oij5wGfHz9QBKSlQIFBwGOSu5zk?=
 =?us-ascii?Q?lrvhAkIIeKh6QSwrGuBcL3EtA6NVW5TTOwBviJ5iBtY8XgBC6h8JjITwjbit?=
 =?us-ascii?Q?l6PO9D0NMvEV0M36HF1vPVOuihLTZad8dVFJv7/ArsYaGcxSrNLoyjL4dXtA?=
 =?us-ascii?Q?PmzNYacTxmbE1WbsuJzqc2mPqo1UJcCFosArSSEIQQ6jGhCk7QYNZpiAwH4C?=
 =?us-ascii?Q?oNRxrOcsRkp+ms/Z8veOL0hVVRDA1kOrZyACW9HVjasCBtq6HiBqcw2WlJzW?=
 =?us-ascii?Q?nNZm+2LzVfOEdoaCEWG+NKoGMnQBy+/kcukjaWwnlS9V/sXwRNWqIwfshJkM?=
 =?us-ascii?Q?/bqOUSq5aA1HgcFdvbr8MeU+nfnX0jEQiiL2omxNKfUxCZxnNix68iZ3+RPz?=
 =?us-ascii?Q?8oZXf1sjdJgUvUc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 14:39:58.2559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1c17f9-edd1-4aac-3604-08dd30bb7dcb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240

Document newly added "count_clock" sysfs entry for the Mellanox
BlueField PMC driver.

Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 Documentation/ABI/testing/sysfs-platform-mellanox-pmc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-mellanox-pmc b/Documentation/ABI/testing/sysfs-platform-mellanox-pmc
index 9f987c6410da..a7896ebfdae6 100644
--- a/Documentation/ABI/testing/sysfs-platform-mellanox-pmc
+++ b/Documentation/ABI/testing/sysfs-platform-mellanox-pmc
@@ -52,3 +52,14 @@ Description:
 		Writing 0 to the sysfs will clear the counter, writing any other
 		value is not allowed.
 
+What:		/sys/bus/platform/devices/<HID>/hwmon/hwmonX/<block>/count_clock
+Date:		Jan 2025
+KernelVersion:	6.13
+Contact:	"Shravan Kumar Ramani <shravankr@nvidia.com>"
+Description:
+		Use a counter for counting cycles. This is used to repurpose/dedicate
+		any of the counters in the block to counting cycles. Each counter is
+		represented by a bit (bit 0 for counter0, bit1 for counter1 and so on)
+		and setting the corresponding bit will reserve that specific counter
+		for counting cycles and override the event<N> setting.
+
-- 
2.43.2

