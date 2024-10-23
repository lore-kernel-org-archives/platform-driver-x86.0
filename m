Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B68149011
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 06:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665200; cv=fail; b=EaihxcpDyhMXnqPc6sY3dKyLmN5u5iTQQ2VEmvcydy2+47Y8NGaFV6vnUzmA3FEajnptn8uLPFqxSCezySUdR+1VVxGuAI95k0rgVpELZ/EilHG5AlsATis8VNwDR4Y8lsaPCY2b/tMa4/lA1aeIRxKonpPgkpJ3xhU+CX+MVtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665200; c=relaxed/simple;
	bh=HhYZm+iPGKuDtvi46VjRU3YfuuKhXqJjyF5POXDKKFc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IrxaPNIts5Nfdyo7Ptbgzrh5u93JAdKdF/6VzsCOOvjIDJ8/zsbXrtppasOg7zcvNAX5YYK43t6I8Z+RS7dQuQKX6P4VWPs+zjIXtpHxjTF5SYWEFjeArD6nj3vY6ipl+/6/VrZJ3T24ivIIRYIaB1ePSdEKGwsZyUv17bYum5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aNwDqxzo; arc=fail smtp.client-ip=40.107.92.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aNwDqxzo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhsQHDHLeAhlxZrEweieCSgl0/hyWPs24vOXoiKxUJEmFF94tZXhyU8EFb48h0gVwexovABWd8Eo2WKm+hJL04Vu7b0GpdwK/6Ey8XuIR0iu5ZOUHoZmgWi9Nxl0OdteJ40WKQ8F9QzKefi1zwgTU5DgBzDJXiKe00wpfZdvjWcURzLJrRkmya3sxmDdBs9WZcbi3JfX8oes04klC1imGVmeZ5GKpxowNA+/oFmFdkbousmc5enPC++/DCAvIh262A26Fc2pqfZ2hw3pNClglDIQoOBY72NNgMt5Adk7kBqt8o1592+TlfOA4q96vJqdyiU3/e55zv3SWEhWI7R2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+XXZVDMc8PhO7hjdmO/cVY4l+dnrrE3jHqF8I8xcCc=;
 b=qJmvfvcT4RXM+TnmDJAzj48ySnqzxyPAv92BbDDBfNB0+en3E6SKrQGhMaQsAa7S3pegcurpWQdnbumtst+yz9I20tLK35JKjEQhUB3D+vy0Haq0gpZ4nUorOaxLZHlCgRdgmHbclToAfEVfYxNtpbHcMv9h/3ox9/OMz2mEEi6gq5x4p5lVtxFlCm3xnseYrhyJXBvjdrhitObn48SzGrr/Me0Os6xJUGeSjmnJw1hjbbv6VRwab1ckcYC8fby8N1QtQtrKY3lQ8p+2y2eH+Na7k2SiY9n2EAQ4YDeXXaosx+YicJWCUgcQnMpXcp9WvfUhpl3j8MsxejO9l2Ss4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+XXZVDMc8PhO7hjdmO/cVY4l+dnrrE3jHqF8I8xcCc=;
 b=aNwDqxzobj+W/zckOxYVX5QgPv6P+wdOjca0z5DgWahQdNjtX1fKnqZy6YU6jt6v+wjJ/Pe2OugcErt2OXWAf1CY8LBrxHL/be47h0lFtEHeFH37Xed9TgIsCpq28ZBibhdpc52o+hSZAqd66NT0blQGPEsrJ3yjohK01Koui5Q=
Received: from PH7P220CA0145.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::9)
 by IA1PR12MB6628.namprd12.prod.outlook.com (2603:10b6:208:3a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 06:33:14 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::b7) by PH7P220CA0145.outlook.office365.com
 (2603:10b6:510:327::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Wed, 23 Oct 2024 06:33:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 06:33:13 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 01:33:11 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/5] platform/x86/amd/pmf: Use dev_err_probe() to simplify error handling
Date: Wed, 23 Oct 2024 12:02:42 +0530
Message-ID: <20241023063245.1404420-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|IA1PR12MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: 541f1d07-9c76-4f10-12f3-08dcf32c926c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XHHQVfMVed1c/7RHYprVfa5E/Su5eXs9ns+DZ8mRJB3no5EcFivKCavwFxLO?=
 =?us-ascii?Q?2LUyKOhZe4IRjtuA77DjcGl1H480gr07DIWNQ+zQ/9E4lkaaLPyiSbZpyYom?=
 =?us-ascii?Q?6/Ct5KoX8QxfpWjVCpEiJUTRFolL8GQTyqM+2W+SvV5wIoe9BkD94DbQ4Jld?=
 =?us-ascii?Q?CehIu5FNz8Kau/q9gC5sBWZ9MgA7dsmlIFNMo8P9heoY/RnKDaPdVMA6dIWA?=
 =?us-ascii?Q?layZFi6VbKvuzaIVpZZmmy+P0Df9Kg5It8xHxORmlh4NBkkMkAC9W6USIzzH?=
 =?us-ascii?Q?eGohPEVuuq8j93sRrfl5yaI5yLNabLxJyY5M/Id+JKBsJVxPQYtfvszDeYc1?=
 =?us-ascii?Q?tMgBg90mZkz8v/bpYhxkRaOhifHPRRtSCnNel/SCZkSw8LP/DrnSgbNqq//Y?=
 =?us-ascii?Q?EHzUdPwlHlPNDN2mVglEEZJ2MCrMxEdXhFJDU8typx3hLmiQVC+++UddsruQ?=
 =?us-ascii?Q?GkErJWPdbNVoROuk4mQmV87XWPvQD7AbErj0UbR4DsdqMpUx3vn/LAtzjNBH?=
 =?us-ascii?Q?gxl2CALZGxPLeS7E6W9YuiDCuE4tLfEAt0u/WN7H7W7G/E4ybysBcPtHMhdP?=
 =?us-ascii?Q?EWLF2sep42gmvCN78sjYYPlWejg1Ka3KYizy5jOG0hUfssqDf7YOGqDV1iUO?=
 =?us-ascii?Q?riMAFNtKRYj6o73MqIwhXJOunkzVrgm2AKNNx7Xk6VJo5AtUjF9IO8uHvQAS?=
 =?us-ascii?Q?MN8uG9lur6EyAEommnBT9dQDWrwcvLihiuhoEif1rwaYvBmpvrqKLFlnLwvs?=
 =?us-ascii?Q?aGprmRQ1hy3SjCm/L6yoCfD3sPgS8jYlcZ0Ho47N5ZEsTVMYK+hIoIZ6BOrO?=
 =?us-ascii?Q?gkan5wmAGKBQunVwwjsjB4T/QbZGGPHV5RtlEXniRvkUsf5Zu8Z+EPElw4fy?=
 =?us-ascii?Q?4MdqgukGm9TBC5AWwQRZYE4GA+Zw5rEU0PeaGl0b7bsAoBdLSvwvMO653/iB?=
 =?us-ascii?Q?TS0gs938trrr9IP1e5I8TZZS5UdYtM4YpMoaLE1AYybbssuBmfjw/d+0Y8v4?=
 =?us-ascii?Q?Xy78CxsRLPOphL7wA1AUxb9yEJomwcMqkW+0x6Sc3geAfPHJUb04sfWbyPDS?=
 =?us-ascii?Q?ZLXUgEBS7OYcE/W4cMxXHhuZ8V6AKdZ9DGjmJ3VvQy6zUsGzn9gavgsmiLga?=
 =?us-ascii?Q?Dnz8WTJEhEuZJN3A64tLAIqfQ6/R4yGmML4hgsqC+7F+Xck5eJUlJ14PtuHB?=
 =?us-ascii?Q?9jKZnmHkai2p99nVCsq6K9zqe0sc0PEbGzfugchlWh35DJt/XIdBO6GvJFBk?=
 =?us-ascii?Q?AcEnxchtyMAn7WZWteyo04pGS+uQ5mpESCQ6D2VLgiKbM7D/3LieO2MrY5pK?=
 =?us-ascii?Q?g+kayT/J7Q1xrbsm/m/hQsUeUU7uXciH0PpqACavBvqp4gHRcSFoF5NQMivw?=
 =?us-ascii?Q?NXLfQcpFCKHV7zoSDQVDKQDPOJtEzoAJDj8cP8+4L4oRZgggtQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 06:33:13.8559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 541f1d07-9c76-4f10-12f3-08dcf32c926c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6628

To simplify error handling in the amd_pmf probe function and reduce code
size, dev_err() is replaced with dev_err_probe().

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 347bb43a5f2b..12c3e929fdd1 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -430,18 +430,18 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
 	if (err) {
-		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_LO);
 		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
+		return dev_err_probe(dev->dev, pcibios_err_to_errno(err),
+				     "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_LO);
 	}
 
 	base_addr_lo = val & AMD_PMF_BASE_ADDR_HI_MASK;
 
 	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_HI, &val);
 	if (err) {
-		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_HI);
 		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
+		return dev_err_probe(dev->dev, pcibios_err_to_errno(err),
+				     "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_HI);
 	}
 
 	base_addr_hi = val & AMD_PMF_BASE_ADDR_LO_MASK;
-- 
2.34.1

