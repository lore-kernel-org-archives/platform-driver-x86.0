Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B9F1487F4
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 06:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665200; cv=fail; b=liZQ+Mu5fFrlA7lGwB2cAeQfjE36DHIobhSqPkG+HbAdgaftjkGQlw8eMKXG5FH91MViFVtjYBUYjwzsjFh7pXEe2jigmngDvjiNMjxGHYsDxyfpuzeIS/0WyTj/eE4+QL4EYwR4Ji/jTijO21oSuGLnE8qOzKypD8xFrfMcvso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665200; c=relaxed/simple;
	bh=rYUcaCgANwJWHnW3jYeV6NqBebfetBoRSEcuw08Bmj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cMiFMNNT7OsjgEfDiNxwvoW34L3fV5M0+TQ4elhYChjq8PJqvlmCgVtO2aEszZ1K9xVD8Tdr0I+f3mhdjETbROTG5wQTHph4UUjC0Sb7vNb/EiVcwfAGpUqArsVjlWT8xJe8gHJQHzKI/h5LcEvX4HWQ9Wd+lDfXnETDrnkVxmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hYyjWByu; arc=fail smtp.client-ip=40.107.220.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hYyjWByu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0JMWsGre5aM6+klgZc7w0fxhdSO97Veb51GDzo2GCYVnnC58FvV3aNzrMl0ULJaT3I/SzsFqafI+XhtjXi2ByFVlHf0BEBrgGpwx9NJx2XjnzYNQ6o4qE4GGioyc17SIQpKTeTYP0oAfcVY+DN81vXNfijeA0eBPjuh7DzcMf9ROyAiN0Mu3LEnF9NiNd5UZFC8fRnEfT4AdSAw/3dMUetuc6oWmbWiH3Gk9I3n1lva9D5JPzNmmcgAhQ5OzWer4cTylz3AbE7W7tGAsA4kHWt81QVaN5mqHOgalvDCb4Jq2iCNi1PaPdTro1tRrKYkdwbJj/mo89Hlo15uK5OlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfNETLyg3vDTmw6ymWDYiaM0Ks7KgEbje3Zbe5NBQoU=;
 b=EaINrAuNbtyj09NwyXgSxZr3nxtW6f8M5TXAQfaYq4QxwnwpJcBaW4J/XJajqli/QJ6lAaUi+/7wAM0xTRNiptx1rFCekCyKoj59pZH7oOLl5WGlBDA2hudg47Fwb8HQMcKQF98OtZMZcZUT5rNUyoOOgXYEZotBTqjXvLRt3VQ1MEUpOLYGVw5YT9yhV0/rP/p9+GkuCT2yJKLR/dZv+EaxjXhshgLFqp7l3l8aw1G/q429itv1c/WmjuTSCTS9bCnMcw68edyfEvlaPA0lpwYWdthvY7RkD8700oq4dS42RRkxHXchmrxYOnhxZmHvJUx9FMQUNQx8eEXgsn0auA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfNETLyg3vDTmw6ymWDYiaM0Ks7KgEbje3Zbe5NBQoU=;
 b=hYyjWByuYrN8qHmgX4D5s+yGmUAMXyNHlXaJk07dkMhSmqUpHgx7qNHTN+JW3V0T8LYbaA7D0xm0rFaGvcGMt5c6d2y7C3igdx6Z4BKn2hsyRjZrsoj3D/vRdMizSNWTa+SvTKLotBaNwJkISMYFZ34Qyxr61EajlDFJz5ZVsGY=
Received: from PH7P220CA0122.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::28)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Wed, 23 Oct
 2024 06:33:15 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::bc) by PH7P220CA0122.outlook.office365.com
 (2603:10b6:510:327::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Wed, 23 Oct 2024 06:33:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 06:33:15 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 01:33:13 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 3/5] MAINTAINERS: Change AMD PMF driver status to "Supported"
Date: Wed, 23 Oct 2024 12:02:43 +0530
Message-ID: <20241023063245.1404420-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|DM6PR12MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d23819-f6ac-4756-6af9-08dcf32c9347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g09oTyRUufdbZJVra0dIxeShP+QRMSu8l6THJ/Qsa/yCYTP6C1B5d1VdszvD?=
 =?us-ascii?Q?DS+uB5CXwV09mlCQs9e9Vs92xNhC8jw0vzEXMPew3f/gT0XTZUYafLDr26FY?=
 =?us-ascii?Q?F7TPVZD75LsOw54PZn859SRLhTFNeGE/h156Yzvuf26zAM1MQJYXrKqP8UxR?=
 =?us-ascii?Q?OtimioeRDzzP83RtVeFIBwMpALFqG4qYDtlJbGiusvnb1GZWXONaE3S2oMYw?=
 =?us-ascii?Q?DAzx2mcDpSscEbDbKex6JWdjdt27bVIVc1SjPV3k7cjwb3m0m9h9yUAaXRyU?=
 =?us-ascii?Q?O6tm1kU57JZ3wAjUnAP9xM0Cyhy+v4jLw1xioyrrqhCS8jEL5IUZdDZmRvO7?=
 =?us-ascii?Q?j1jJW/4AxJ7CgJZtG9coZo5Ds/sucRkA6S7DYV3v+vwgqW/uc6grQTTVMC/B?=
 =?us-ascii?Q?f0wX0D5XH/OGz0LpegIh/+sVi0f7Y6x9vvc2OCVrVPp+a93urAwL5p8cnuKf?=
 =?us-ascii?Q?1m9CsChD/oHtdyGzNoJ7Y6t8jFHn022ZZvYHcvZTEKwvMd6C77DEsdfTMZFK?=
 =?us-ascii?Q?V532s7JxF6yHUizqupOJuVz1pko3cjHY1RktXR8RlDIah2TtwKZ4FF0dZBfI?=
 =?us-ascii?Q?XvabbIYMxnfFWXhNdOUY5V1E+sFFnNRvccYAwu0m7zAGvi4PXvS3Dg46fVyZ?=
 =?us-ascii?Q?UrBBsoOk59R33EtRkkq7DDnsnlqenIwTJ32fAxqirrhVYfJkUnDgOca9Hx/3?=
 =?us-ascii?Q?MjU3jcVTRYO0uBtGFsF050L2t1Vs1b9SHxRsKXekOBJAGivshDxhy3/7UF2U?=
 =?us-ascii?Q?tf6koGXQKgYod75X9Mi/pcNbNAbjPxYBvi0HwkRhNUBHktktHfqfAQonY89W?=
 =?us-ascii?Q?1nlRsC0cBI2b+I5MZDn0lhZCe1ENkyJwy1Y5SsJEHmnxFMDPhFs1wI2FOWQz?=
 =?us-ascii?Q?CDiH7R9xQJLekZxe39ZBepjSz9PPkfMF2LrQgwuA28Zy3J59joingwNEPqz+?=
 =?us-ascii?Q?hGS+IQMgn9iQTNFQAJUdU4YecCIO8T6ST2j/W5yXhrr4j5qvmKI+INit3Fy2?=
 =?us-ascii?Q?1V+PkI/EJ7/qEfNPt7cEXRCJzlTGqXgmG4dDEwlCUa1oB/3rngi1ly+cJvpt?=
 =?us-ascii?Q?G2FqoqlGQlDTzeRjp+yUYXSJjNRo6IdHwNdptcYwsvueUyU/QXlRIXhhoxv/?=
 =?us-ascii?Q?+K7JhxVWdHlP3fLjRrkUn/lXpN78e5mQ0PfqIZOcK73EW5KEItKjd2pH+E+P?=
 =?us-ascii?Q?VaWJ4aV+9Ns18qz634KJpn4DYvyN9gHuljclzn/Mt5iJ84RGgl2UjZ8oO6ge?=
 =?us-ascii?Q?MLhx5nX462ricDEi3d5xhaTmLwG06+A5aYMt/ui/B/tBiWcSOT/D0L2sBdeO?=
 =?us-ascii?Q?UDL4qKuKwNbDZLB/SBZI4Sm0HR3O+3MtHa8e+7Yjyuf12e8Dc4WbhEb+OWS4?=
 =?us-ascii?Q?TzppZahPZ7yEj5v5YJzxG37hvwSXs/ymUucTZ1/8oZX3ZaPi+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 06:33:15.2778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d23819-f6ac-4756-6af9-08dcf32c9347
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139

The AMD PMF driver is actively being developed, so the MAINTAINERS record
should reflect "Supported" instead of "Maintained." Update the MAINTAINERS
database to reflect this change.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9659a5a7fb3..5748b251daac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1124,7 +1124,7 @@ F:	drivers/platform/x86/amd/pmc/
 AMD PMF DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	Documentation/ABI/testing/sysfs-amd-pmf
 F:	drivers/platform/x86/amd/pmf/
 
-- 
2.34.1

