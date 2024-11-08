Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903761D1744
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049746; cv=fail; b=jW1CfVob5fxJM9PyjDd7ZERA43YC+fvp0Sr252vU5mKTHgcXInUHPq9IZGHHoD8x2W+oKdR0tp9ttIg88ykaQEgOH2lQ3SjQ5/xKwf3L18JP4UO2nNIKN+gNVokXh+HouuMmqtVdPWDmqOk6oMh50p1lIpS2isc+APS10TVed5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049746; c=relaxed/simple;
	bh=A+sVbaLdkbKgSyTFjlDE5pv6QdHrp/5A8mXZG3KY9WA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LYtm0nV1obT9USdiTvNjgqqSsQqqhOb5F7uYqKHCyu0hfOjKQUusEYF1vt0aTJdjheEMvtzddJ0QdOh7N+YDMxiC6NpqlF1Zi+RqjkXXL9hSO1hTf8pW3z1fF79M+xecQxyMg6oT0FiTT6ywDjoBUxbiJcCNoCnUNotW0ckxyxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z3wV5Tkx; arc=fail smtp.client-ip=40.107.93.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z3wV5Tkx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAwb6a9bqUrhKoaQngt+4VEvQ4GorIuV1TtzEeuLSUgbicpQETBx9qhS26JhuxGzsD7Y6dGQoB9IEzC9UralQw7IGp2BThnjAyW7KnctCpQbZ/KQSjLgP7j9kqg6vCGLlHdMzUVBe56gHbHxnbllqdYlDTvkUwRJyfMaQX08twvoRPd9zUOtvUXh480N7DKW3QSzV/HSoj8RadN/GMRqi5+rqMc+StVjTwdqMcJgSixAlJyW2hbQNU76w8omBYt91HfYt91GzuYoLCJzKbv+J9VJRa4hGxuB5TmCv0evUZgQMFIHjhPrEgoFCjfqPcgLGjQdNbvsSRiwDGFiDAlcBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjQEfoN+n0gwESmWKCbFbHNWeNVdCn/dnJn043S7zTM=;
 b=c9oP31Px1oyXR04QlB3bGEipyF8EIqKQS3n1MTnW9YcFgrXDhM0UMl1r9fbX8H3PLR7DjdilMNb5iTK74L3dnu9LH+uZeOK4ZZrmlYqVEoHg3CTWCqgT4BHReEj4ai4JgjFQdNnkfeykH/nPGAb4w5VK3UXD8xt15tJwdT6Bvr6vLUDjcCA1omhGWhbR1e3MGW6J4N1pYjh86UyJsEAbPMMn8FqpibQtsJrVDWvJC3Zr9mfPIgNH6mz7nKR52/Tb3H7/CuktKRPFvwuIHDsle3VKjWm/yRpXqjbyIxAlfeBd47X3X9T6/w9IVdlAeKhDj+CXJ91p9AdUWVKzRPCRxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjQEfoN+n0gwESmWKCbFbHNWeNVdCn/dnJn043S7zTM=;
 b=Z3wV5TkxBjVr44y0iAU5koBZACpJ0LMO88SZS4ni6qogbp+lrN6boef9wJcb+e5QaBV4gojlmCnDQgXKlyq3LFpDJYPEJ1Qs2l68Sx6JgstGxV8GUcwTiXpU0X0B9UywjfKIgyyS9YtaRWmEPFokelHrM+QNcfQWzfUIK3mS3SI=
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 07:09:02 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::de) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 07:09:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 07:09:01 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:08:59 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v5 06/10] platform/x86/amd/pmc: Use ARRAY_SIZE() to fill num_ips information
Date: Fri, 8 Nov 2024 12:38:18 +0530
Message-ID: <20241108070822.3912689-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
References: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|PH7PR12MB6588:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a7fa6e-c16c-4856-3521-08dcffc4393d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IW27PWn2UJs+5vyRZV15xFZX5woPDjf/gqafUenTEeMqs5GISqevS6uNLUjX?=
 =?us-ascii?Q?AWmRZh8usZgaDi9vDKwuGae0Tx760rGXdMAeWiuZ14WSxSQPyAxG5jKtWZ24?=
 =?us-ascii?Q?zqMuHqijuve/QLF+cHBMwyOh8kzI7x66rfJ1CG0PgssOlzNYYqjMr8MR47CU?=
 =?us-ascii?Q?cCGeub1Elvfe4JYbjyPny6Xc/Z0p1a/hkUHoUeEW82WVl1MVRFzUobBYHGfm?=
 =?us-ascii?Q?EOkoi2+JyyVIPSrtyZC89KtfagFQYMphf9sj3EzqLrQiRIFpX2gWwj4OcJbE?=
 =?us-ascii?Q?zuDt8KTzM3/vnDWBr6i3ej2rG78tuiwOrhdYjhSVKFXLWxNoY+etWLEYbXaz?=
 =?us-ascii?Q?GhkxKdy/maB5tBunHzwgp1cs/9mvHJ6kKzNj01OUVGS+T+4GVCJtPL5TJLbG?=
 =?us-ascii?Q?x+amLwuuyHntTG9nPM5a9LZ6GCtj3/EFO0eGqicDHg5lwImRlVArIk/vQ0qu?=
 =?us-ascii?Q?K5sWFg46XUglFFKV42GbquO5tnBmfN4lY7djZG/QbWN/Wr6NQ/paqWvkvBu+?=
 =?us-ascii?Q?XmXSyUpWYU2uzEithN9aFXlnkIm6jZzrXN1+usPMFsTuMH6cE1f7rPi7L0/z?=
 =?us-ascii?Q?tyM2k7XW5UOLx9VBqLLJKdro+84LDnf5ppnT7+5X0LXUjH0OVAFdWjVhKXRM?=
 =?us-ascii?Q?V9CWEkR3FUkN+su8lZ+UrTbab9NSzrb5CVIlxLmpIGcyqNgwgZPKCJMKq0rX?=
 =?us-ascii?Q?1AHgHRm0lJNpmEYSNcJQUe2Oq02PMPQepInm6far+fLF5iUZXzaYFmC74Cgf?=
 =?us-ascii?Q?8SX1DU+/gfW9UiCvNgI0ZpIbi5oxVC6cUXiBR5b30VFwUKPPImTcs5V7gB/G?=
 =?us-ascii?Q?yt1ZyZgBAw1psDwkPAf3sl7ZcOSsZN96hsrYFdYdGJQdnLlpbMschqAN6FjI?=
 =?us-ascii?Q?0e5xU8FqKwW8TD27uzVZqoB+SXU6eeLQC/Yn/5NzmXwp/6OB5O844hxkq37v?=
 =?us-ascii?Q?60Z0TfsgB0pTYhw5Y0qZn0I01Th9YnoQeuQw9VXdUYW3GmpAIJE9KtUGsM/d?=
 =?us-ascii?Q?mFsfhk3rZyz1vxjjVKmQYgXfW5jiMzhVqx/qc5u14XEBoghSJLDCsGrF5veA?=
 =?us-ascii?Q?2mfXqyh7JdCRZp5nIUzAWMr65ha/xGl5cK5y/4jBsnL6c166TUdyHEv63s3l?=
 =?us-ascii?Q?64shZ7mbfSH5tgmsd9L9iczigp1voYk7P7KUdsQcu6jUU7KhBUQ7+CMWFskG?=
 =?us-ascii?Q?YAW2Q+GnyM6mj0cJ5sMnSCclZi0DU+HgQQl8SQlrScnfjHVhHPYj6RB5xYhm?=
 =?us-ascii?Q?u0niL7MFdXWTQ2gG41pnO30NEt+CwVS+jShR3vhGnw0ASA2V+vfGlFgosmla?=
 =?us-ascii?Q?SIpRON1Flv1A+9RnSHQhREEeJ/Gx+hTisBNNucjUoUsIj8N8+nVLbgHYpKeG?=
 =?us-ascii?Q?O2wAQS1aOD3YwFFX9r6iXkusl9BG6dPVsrSZv1/LareY5uKPNA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:09:01.7815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a7fa6e-c16c-4856-3521-08dcffc4393d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6588

Instead of manually specifying num_ips, use ARRAY_SIZE() to set this value
based on the actual number of elements in the array.

Reviewed-by: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 841145008285..3a30809f187e 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -12,6 +12,7 @@
 
 #include <asm/amd_nb.h>
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/debugfs.h>
@@ -117,7 +118,6 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"IPU",		BIT(19)},
 	{"UMSCH",	BIT(20)},
 	{"VPE",		BIT(21)},
-	{}
 };
 
 static bool disable_workarounds;
@@ -169,7 +169,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->num_ips = 22;
+		dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
 		dev->smu_msg = 0x938;
 		break;
 	}
-- 
2.34.1

