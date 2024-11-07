Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8109198841
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964479; cv=fail; b=XOaGZAcmynqmpdBBKXzhiHLxhBLPyJU9vwDSjxP2gl3WLA4XVdt5O6jpLNfEJSHNkihtXDjzRcFPPaAkU6p6YqU5Kt57SmPzktsfSG3K2AsUp4eA+j4ueLRHUmWkh0g1AeCMrj7KsdoJAvsM88dEKxZghLNqxGCdx86KaZbBvo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964479; c=relaxed/simple;
	bh=6nB8OpxtwswmgeLJr8x7V25awST8sgsYZzJwhXLJDNk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b1xCfINI+5FGXZvdo1h0BCRAdv6vsAWMGfwEUx1pGV5eeQOG3Rv4Uk5WGUmNRuTNPvVBZ5ou7zHANbjI2LVLA07IZDmwFJQidlo28JUQRdvdjx6hG6Padx7Uu/lA7qIUwqus1VtAR5p1CH5MZ0AAQLnVLOsQrCT5KWqZ/jXE1dU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mAUsuSZf; arc=fail smtp.client-ip=40.107.236.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mAUsuSZf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7D9O3e51FJ/Vgl+ZhMeBJyL+SRJIFrBObVWKLi9fw6ymjpZRcUhinP9UNrLGec0e5xhJVl6qsMc7Na9zv1GP8ScMCoB5jOLedp5+ZbWRnUedMmdmvVcZ4y2YtAv/SFW5OovNw+WIzNXWGibrd+xZMYAvnGPjBvre8XBWCdvG0oW6K9MOFao2sDun9n9N0EFNyOXc8EozmmtLZskJ0OAkqgAVbUws+xUjFMDe0HIpaHlQ4IDbI6h3Hob5llM+shjzM61hRkOCkHLWchyRWAsibBRxazUxgRlYrT+XTNDOdo/kZEPszuh/xP7l4OWo9xXXWwmOTXQSVVOFTMwkAwCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkk70Q1IQNV74wQTovoCrz8FQm7x+g/AhC4HOP2Vmlg=;
 b=xy3fVVsJ47wUkIXGNPIVxQHCr7D2KfNugDb7yjFMgylnmzjt7EK6DwZ0I8B9jYNb4ScUkluq+htvxsEnK4PWrv/1woolexLS+kZ8zCMKWo3+nL50ZTQ3QXDcOlvNN5EbRVgrEJR755uplgE3ss2CNoPBfRv862SBDcjV5xCs45QllSocxZMZjjNF4uzETCv8wMKRs+0uKnXzI/GGlEneNwpULoySfANEzWJYw5k/PjmFvNp3JQKuksJL+C2AvYSm1p9QpqFS9iNpdjYFpwWi7k5PIJjFClkqkuik0qbiu6oLYvbYyYHtQPt+R+7IbVCveMeTgBUDBJXVL35Y2doRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkk70Q1IQNV74wQTovoCrz8FQm7x+g/AhC4HOP2Vmlg=;
 b=mAUsuSZftGOveQ7+lQLAXFQzs1+6meUevQ5mqiXVt7Sv2TDQiqqp+mrkCKtuk6SQ11FP4RGv4FpwJFVlfsLFHFj50XVFHpUCnQRybRlMS6EZCEanmzV9dfxx9P9bib6pl6WPN38G40xsy0nyFmUB0mbtqTGneood/bPBnwB58yI=
Received: from PH0PR07CA0015.namprd07.prod.outlook.com (2603:10b6:510:5::20)
 by PH0PR12MB8099.namprd12.prod.outlook.com (2603:10b6:510:29d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Thu, 7 Nov
 2024 07:27:55 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::87) by PH0PR07CA0015.outlook.office365.com
 (2603:10b6:510:5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:55 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:52 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v4 11/11] MAINTAINERS: Change AMD PMC driver status to "Supported"
Date: Thu, 7 Nov 2024 12:57:14 +0530
Message-ID: <20241107072714.943423-12-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH0PR12MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b46df27-86e1-4529-df4a-08dcfefdb247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7L/F40CTJC8p3PisOVFuwyTQ2IYCvNkswB2rmcV0IqVWcHwHXDZts5iJG4GM?=
 =?us-ascii?Q?6KmilLVe53Q5U5xu2gr0j/yMp2syEx8ewd70vU6PlFT7A6O/6V0kRbLsYqpD?=
 =?us-ascii?Q?aJWS7FU/sUn6ONmXDo4MQ9Oe7Ku7iDreaoRS5W8cegY6aJsaUFU7ff1lxRUL?=
 =?us-ascii?Q?BrpFhWQY6ZDRjjKZMcj3xjTM4o21s/odNEhTQYf3GYQkzex1Lu3eMo2LYUus?=
 =?us-ascii?Q?Nt5PARzFEohimTifxjg5BXTLBmirFGuLjkAIHD+QgV4ARYkeOm9cTCfvfx6A?=
 =?us-ascii?Q?FmbWLA7tTOlO0Zg4KQGxFDSNl47CD8+gALGTOGhhJFToupDh8vkYaBG06/IN?=
 =?us-ascii?Q?tzunKjKeLzos0pMgRQwhzYcLYi8dHUoAHvOBsYRLM7Nb46P45C+LBKL9cLuH?=
 =?us-ascii?Q?ppFO3jGwNVaD1wbHGuJz37glcEwU+1WiFpibELsNywx9vvQc62zOX14FnWh5?=
 =?us-ascii?Q?HLQu3ORYdF2kw5jAfOSJt1K/9ylyRureBkc+xqbmpNdn1/upLFdWztV0TTpl?=
 =?us-ascii?Q?zag8agJAvC5yMHJLjicMRxWFT8FeCdIriwyfi5tjk7DEChP8a65XJ/DbEFDV?=
 =?us-ascii?Q?UXz4DjUxVySnwvFJL/XlzaIeHfiQ/rwalRus5lpwUMhGKyaR6C7aT87d5F+u?=
 =?us-ascii?Q?d75x0JIeUnQ/AlI9cerdPdnztrZwdoPsxg+DqGF529pPfXuF+hwnZ82HBCgo?=
 =?us-ascii?Q?DxbCHvqL5LNzaB+GzGVWGn4Bn3uanwwdUA1uGTXLtFinR1b+VRyzcsc7Mbi7?=
 =?us-ascii?Q?ppTQFuGw5Tl4ugK5RQrfgyKzVoXfCvDIF5ERvlcZqIMyJeTaIP3ockOz1Ken?=
 =?us-ascii?Q?nJHsGgfmm+F/VKhFlrh4rvp4Awc1ju4HxjUYeaVzJaxn1+q/Lc92k8UDcj6y?=
 =?us-ascii?Q?IebdXj9+2a43qcRwTGjsuKynI4lyK5u0cUV+maLjUaY9bDuYG9nl68gNMlDG?=
 =?us-ascii?Q?FB8foGjDo5R377Xu4tjuW9fMow8KwSWru9mroMTGg7u/4MzZEgmymDdSu4K2?=
 =?us-ascii?Q?Wi0afL9K2702FqzGVUkMZlq4e5hSDdRAPc6cVPNpBSs36q7tSfc65/fV9mBq?=
 =?us-ascii?Q?K03cE2wbkrh5x4g+40ZTEFTizVvRqkFRoynj4yv53+xBAmvybf0S0BvoBsoy?=
 =?us-ascii?Q?Bm+k8RdMw4I8GMVYu59XzrZ+x7W3gCtTbyes0+O5Qjg4FJhUyhQTJ8zs/t8e?=
 =?us-ascii?Q?+cFK/WqviMQ1NGjJQ7jFQBnNhlLa4oJ9eQ0C5aB5yaRK22D4Y2+Q5chSlyIy?=
 =?us-ascii?Q?ncVVK5d5d8ZrCIODmJ3AMEg8ukHo+xBvYSvHGoSW/cSXSOnBii3WOqkaPT5D?=
 =?us-ascii?Q?YTUl4WgkgIpRew9gQcnKvipZKlD0sthYFlj1nT/4ganhv6V0DRzYUeLsGHKy?=
 =?us-ascii?Q?Juhp8TirxV7LZt7SHwJeMr8wGBcdX+6lziTb++KiezPX7V5o9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:55.0065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b46df27-86e1-4529-df4a-08dcfefdb247
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8099

The AMD PMC driver is actively being developed, so the MAINTAINERS record
should reflect "Supported" instead of "Maintained." Update the MAINTAINERS
database to reflect this change.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 91d0609db61b..a92fa062ce5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1118,7 +1118,7 @@ F:	include/linux/pds/
 AMD PMC DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	drivers/platform/x86/amd/pmc/
 
 AMD PMF DRIVER
-- 
2.34.1

