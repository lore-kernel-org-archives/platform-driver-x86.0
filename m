Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABCC36607B;
	Thu,  5 Mar 2026 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707880; cv=fail; b=u66LzghzJ5zDQoEZd0p4bWknRJfOQ1cMCBAf8V+g1/kcUQs0+pbnIl7DANhC1LjdXvtIqyiiNv2A326sYWO526YbW81q6MPWYcZrqIXXIRfOfxAFq1Mphz5A07ClQqC29t0Hg1axbsfrvoDT9GC1jSDMD/gjGqG6vFbiQq7TI8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707880; c=relaxed/simple;
	bh=u+Q8rAWI9P6LZiVHZYp0PoJ/eat4FrJDo1B7qQJBKzc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SR5RuHyuOXsoWG5PvlhzYa6GpsGUA1Nj/HPaoeDXljBaIvVsjNhKR0TIgXNZRX5reLT+hm8IcgE8Z8nELYr3L8nSyypZM44Yjac58IW+DRAjpN4KzaElKZo6err/Xa72OB286PSW3NRyFmJdsB3jlnm4X7/5p3ZU7IseuJLHJJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I7Xp69ZL; arc=fail smtp.client-ip=52.101.48.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I7Xp69ZL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yb2cRFkoMVE69X2ATQycx37kNl0ltQm42Ips7u/8HSn5o8dauCMcyNF1lZkwmM/V113mWtBePDZ/rRc3fj0pW8Q9wyNjUXukV6dRaSWrrr8FQuKg0TlxwJjo+4kSCc7zY6HLefAM95UOC2PvvS0HqlBL9G41y7TbPFH2ymmz3dfxYs9xGOv4EtQNIYRkD4Rncq4zj4p23awSq2xqJhkwKn+i69bWNHoDr2by/G0Wp+ibBTnoe0zb70hPNuwWDYeMTMQdfcumKsI5QJUWTUYoOsDwTgucs/eRIRSuteIyfAUmmSakF65LFGt7NBp77RBGNnvw262sFvkzjg4nfgLhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oW7ic1H9Oe5ezoUmbQ7/2C5IjstwaLY/BtJaW5jwMCg=;
 b=LS8FonlqET8v7H1YGSMuPjUzriJTh7ZHPnpI5nWoSGx5bhvBgGeuVgx6dXr1XbVJQiKOwEBPqvd7c3ZE+bYHRSnGGFsDW1d4GkErwt9llkfqFIVEbSrsrtK+45pI//EO3tnDWl23eQhb9xiSp7ABlcRMshhxcQJujDyN5uzpFzkbl5MyXW9WFpJVEUh4nF1qTmXdYzpc8ovoQOSS5w8+tjDJ2WLRfTqN/qYfX0aac6CDLOCZRd6k5ehpvB7SIids4KaESoDuHFqrZvxtt6+QroqoFtgbbxbWPy9CUPbKuU7PfyDy0qhiLfrsqy7jIjYZfDFayrCpXAijz2smq+XllQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oW7ic1H9Oe5ezoUmbQ7/2C5IjstwaLY/BtJaW5jwMCg=;
 b=I7Xp69ZLphQrBG34rDiyxv0E5uctVrHfkI93tsSemkGRgUaynZVY6tDSVqz/CHOQ0b4Eyo7THUW3lMRi3gSiosa2WyVhuoNVxseuXCP19jY9XjQVq4Rtjfo8JxhlxiDmXjdhlnb4DHjeydh/Vq/QhbhC3hFa/1VpuQ24IH5JPeI=
Received: from SJ0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:a03:33a::30)
 by DM4PR12MB6087.namprd12.prod.outlook.com (2603:10b6:8:b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:51:12 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::14) by SJ0PR03CA0025.outlook.office365.com
 (2603:10b6:a03:33a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 10:50:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 10:51:10 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 04:51:08 -0600
From: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hansg@kernel.org>,
	<platform-driver-x86@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH 0/2] platform/x86/amd/hsmp: Add Family 1Ah Model 50h-5Fh support
Date: Thu, 5 Mar 2026 16:20:48 +0530
Message-ID: <20260305105050.2940904-1-muthusamy.ramalingam@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|DM4PR12MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: c43a29d9-74a9-4d61-42da-08de7aa51d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	Oqc6bZVifnUzGBIDXPFijmstf5DUCGcYKHm8HeT3cLLvW1x1FSFMXymhQusfvQaH6Ad+Cqq6dvUcw/Jd803cwnNinWX3dW8s0mJdYyY0NjWBDs39y2dEml2+7DVyAEQzeav2yxClz/WrAeqS0hD3N0lXr37s8o/VjYmjS0AavCkttpxoyTWntYh8PuXpZR8SHmgF2HQS/j7SAO5gtb8Lq0wC3gTvELOIGZuf+r7IXtRRp06b3FFY2YXtIf68GxLkak3xaRe4WeUC8SySyacd+U+/CGxh8ci6A9IcJoL1+yNzmZIHE572pmdcUfqdDr/7GMRA0t2JQRsCvUJmcoxkLpilbW2QFnN+Z5G1lmDWv+8sISvEiss/KUUpyXByqsytvsr6Hv9AH4JM5KOWvOZWzX37pO6OtxlecFpkLTE1Al9m2iWg0v8ut+VlpV0zHBwP1wLQFEdsgh9Pubky9L58akJCoq1MhHE9XyCx4cBQ0rZCNZwWZTLZgRFvxoKtIsNUbZnThf7Ok0vTy6BbuicBfwgZMiA6J9UKRtZBugifBjz5V7Tp/q1TGFuwygkUgXrc9bjpNTFI13rlyI4ZGDmzrc7tDnTjaCK9JlSjLsrorIaGgs26GiXZ0encvE90K8AxYZ4LTVCM4M/wnWMOHpherzczigx2KDEZ8/UxcM3detTEYcfgrjN3aE2VkvtrP0hQ/P7ZDPlQtyV1PJ2/ZQ7Q99yvJ3nXf3WeaRmJH+5QydCA9MQeL65Kuw3tz/ysdjUBRVStMvf1PwlWhmJtvTOSoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3Ww6rR5M4yJceU3JOiaQbg4m341B9JMbiPlcZJdmDoxQVIto2GeQl7gxfnF//0tz5ShhbnY5bBNQDBQqOU9OLHMLKxWTkHZmHNeI2P8NWPegpOWHHlSQ+BZiDr557hZ9cQPUWWUklOi4o+LNqvDChB9L6MJeofxvGIa4xN7y91rFlj2salxcbxmHyBO9hMqePSCNdXiSEezgZ3Ot3uXziZAfxfqNNhZJA6FhsYr+4ZAzKiNc/Nbqytq8YdV2oasE9k31w007Osmm9cl8r4Rhh3BLh8QoYxA27nIMvCLjAHLAelcClpwPDPLTKIKMobQxcG/XM57fM2T4p8fLtwHuvvITAH8C1bVF88QPsFDX/n23qPD9ycwTD4ZVTALEkxU8SoxL5I2lLyu6X5dz1Phkl1/+tEE9H9T5qqHP48OaPjil/bdGELsn72t/mS8JY+rI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:51:10.9809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c43a29d9-74a9-4d61-42da-08de7aa51d31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6087

This patch series extends the AMD HSMP driver to support new AMD Family
1Ah Model 50h-5Fh processors with HSMP protocol version 7.

The series introduces new HSMP messages for enhanced system management and
implements variable-sized metrics table support.
 
Patch 1 adds New HSMP message definitions for Family 1Ah Model 50h-5Fh
processors, extending the HSMP interface capabilities.
The driver version is bumped to 2.6 to reflect these additions.
 
Patch 2 implements support for variable-sized metrics tables introduced in
these new processors. Enhance hsmp_metric_tbl_read() with offset support.
 
The series maintains backward compatibility with existing HSMP
implementations while enabling new functionality for the latest AMD
processors.

Muthusamy Ramalingam (1):
  platform/x86/amd/hsmp: Add support for variable-sized metrics tables

Suma Hegde (1):
  platform/x86/amd/hsmp: Add new HSMP messages for Family 1Ah, Model
    50h-5Fh

 arch/x86/include/uapi/asm/amd_hsmp.h | 228 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/acpi.c |   9 +-
 drivers/platform/x86/amd/hsmp/hsmp.c |  83 ++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |   5 +-
 drivers/platform/x86/amd/hsmp/plat.c |   3 +-
 5 files changed, 290 insertions(+), 38 deletions(-)

-- 
2.34.1

