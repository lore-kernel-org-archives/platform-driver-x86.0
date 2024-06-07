Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88B1940B9
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Jun 2024 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767273; cv=fail; b=Yjvh+D2+CSqOAkg7Bda8F67OwOsQ/XGledT5OPMtD4n/A9XD8LcjYScacAsIqKQYZWn9rNJ1tUuFRxFqmtJ+n6ObY8x7ICji/APusTov+55FxTVanq0d9sjQn9tI9wm/HdWUpSR0wBrh6PcNsSRc3FifHUcDyJ0Roke8Et5kMVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767273; c=relaxed/simple;
	bh=KCIemOJBmy2xKBGx51kqE3BjRCiqoVXFh4QsXOk+yN8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E2oxlRA6RP8gGIYUk5OT8zkaykze3lqdOz01Ca0DTru0+RTJkr1/2np9flHJvanpF4nlLZ9Ifqa1oPEV+VCBpfXU6ye4fgOeGlo8/vuKX02r+eVO/bKnhwwRGaOmszB2VGgOjNcSiDJIugYYrfyVBujKrs5T9rR9aaoTTYCQ8Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UKqxCE4y; arc=fail smtp.client-ip=40.107.223.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UKqxCE4y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEITSNl4qfMqTwrHyjX2MdJNQluWtyWsYG+SbUQeBv8pCcXLoma7QvWCNGr63hK8BjrpAITNo8MiweHh+wMJ2LwU5KitJWc0anDzt8akRABP5OL+v1HpQ0FrXv97C0vb8VOsGF/ABpgWy+yf8EwsCohO1dunEbJ0je+boy7T817PLRv5mJ1Wd5xermRuQWvYCePqiskD4VpmtOVW4+6pzMGKz0B1fD1tlw0hvEH0583t5hgr5K6IvzTcS/62+YGlJXQl6PIU4nOQl1BO/wej1vr4hOri+mDX55gGDSZsGSe2R9XUSNM2iCPF7h70BxeNsH2FLv+5AwWy+pSybIuQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZe2PMlmmj7RxPfFoiz/bAhi2GutnXP6xEMRKVlm268=;
 b=JWyg1vDoopK/tm52xIzNnl4Rd16VJzAE+Jn+QplVM0bpYvAfzg5X32dHQdDPfp97bIs6Vq3QfD5QiPxNxqSAxGN3PjU3FraBXmZYh2LaMGmLIHl+m1rAbor79ih2MrO1mQXNN9u2YSyQ2zlVMooKeDQhljofIL5UuuZ9PCWDUAjWTLLljMjep0RjkzC2TirtmKU+6yn33p2ibH8sNoOXklfVH9yP24J7DqmXDrYRsSkBMSxXiXf6y5ayk+dwjZGpoplVd4BhCSGRL1OUxLW+O1uJHYOpKWcLOLorh9lNGK8Scdl7W/PdXKc6CLlwqJKA95g16/Y155XMeIb81U3dbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZe2PMlmmj7RxPfFoiz/bAhi2GutnXP6xEMRKVlm268=;
 b=UKqxCE4yg5od6TiGKhqyQ9hDUMnt1rgRJn7C3SRhD0OE4FVym4ECWckCGg7hb+Vpv9r2hgJHagEOBUjStLRFfp6iJhWg1KdOGghXwlqkoH0ZqJElVPTf0hEWxf0J7oMx06k5Va89CvnxnnUqZieZYkxv29lVuDRTQzqBMdmgasc=
Received: from DS7PR03CA0138.namprd03.prod.outlook.com (2603:10b6:5:3b4::23)
 by LV8PR12MB9264.namprd12.prod.outlook.com (2603:10b6:408:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 13:34:26 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:3b4:cafe::9) by DS7PR03CA0138.outlook.office365.com
 (2603:10b6:5:3b4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.22 via Frontend
 Transport; Fri, 7 Jun 2024 13:34:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 13:34:26 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 08:34:24 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH 0/2] platform/x86/amd/hsmp: split ACPI, Non-ACPI code
Date: Fri, 7 Jun 2024 13:34:03 +0000
Message-ID: <20240607133405.1211929-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|LV8PR12MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 639a88c1-d533-42fb-2f01-08dc86f68cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K4XlVdId7MlWrbuoy11Zu1JhhjEjn3RmJ8vJYQuj/C4DoWyDQtdCUNdnFoo7?=
 =?us-ascii?Q?m711dFvrGYfQ22MRLhObCAiwja/rG9az051PJDp7KGPRUi3Nobh1+oxVY3Ao?=
 =?us-ascii?Q?6mKjn5mK7QHUg/wmh52UsTyMozC967IngOgdibqytVAAX7Mb4hMhoJWVjMcN?=
 =?us-ascii?Q?+Tgym2MDdp5u8addmC+Ax9Z7QYrlu5hacqGzaGUuWdaNg3QXRKsuKjoqmHUv?=
 =?us-ascii?Q?Z0U5Wp0rEZ3EWi/kAKajgxF9Tihnl2/Y+DGaGa6z/BovlqL5n/aPR3u3pgn0?=
 =?us-ascii?Q?E8PBSnunqA1E3ofOGZ7dE3GqxxJ6D/jeDL94FfYmmFAgxzjC8H5sjlVappuJ?=
 =?us-ascii?Q?U+gp5gwH0zJNYFPc+qJWd1jVgN/YTup5L+GCsf/nqMDp0gddRylljhiE7zRP?=
 =?us-ascii?Q?3U1UTcSykMbMkixgS1JmkgVqedRbx1EuwJ7rScuVAA1ft4dogDxptah8A25m?=
 =?us-ascii?Q?eOtBJ4EDQm5hodCWuFAe02gzwd7N3dQ0qsIhM+Uxsz2vYGxERwB0fdo/4VvU?=
 =?us-ascii?Q?EZB/X60W74uZslfuZu3yZBz/p/EpOyipxId2Txzig23X4GPZReqTWzMoVmyL?=
 =?us-ascii?Q?IAPyFLY01f3ih5Kf336Ib/9MmGREDuWE5qZ3ULdVWqZRX+qkO1E+m/pI8/nN?=
 =?us-ascii?Q?BAeXYP9aosVLNEPhgXkr6ZvVBKfbP+lJmg76Sjl5Ueerr9IoBrNkZS244UKT?=
 =?us-ascii?Q?Fs1iokJWHTe0qYgNXhkrtlsGQWsZCqGJfsDkaAW4Udf+/XaNyiDzEm9Fnux/?=
 =?us-ascii?Q?ylDSLpSAEJyh6ADE50GHjkuztQDWzbI29aP4GGC+6j3V3ZTlOR/eU7WLynhr?=
 =?us-ascii?Q?zBknLziq2zjs5u2DRMxqyARn6/AWH9KZjWbFDyOsLK5OAVD8u2OM5NEY61X3?=
 =?us-ascii?Q?Ksm3zBMymsf9eMQcvDPZ2JIV8cvgsP0pTZbpwlUAG6kW2V6e3L4pW1KCzbf2?=
 =?us-ascii?Q?a6l2ycHEtMMWU3LFxvdoDIJtC1JpTFoOonrw1FjwiklDjYSjZN0kAUitQz1a?=
 =?us-ascii?Q?EjVY7gVJj+uxrkZxvluQD//WUOqAgDldjs4d3zMqNKVQ5zJXqGgO8meZh/ir?=
 =?us-ascii?Q?c5nslMHjxwc/9mb9ObMOjbdiGH/RIihouBFQTXVa2IUHCBEhVVJDyGYvbE02?=
 =?us-ascii?Q?Kg64w1IJyvPuj9m3MJEOg86PS3H78T4teDlGeIxlTJcoSBkAF8BT+tul3xsO?=
 =?us-ascii?Q?L52Ul4E9XuI0MzhPry/TXW94CkVLzWT01kcseuCCAuLNdEFRu0xwm2aPVtsV?=
 =?us-ascii?Q?KIkxGGvWquVG/B8+WJ1ur3BfOQ4ouzAZgedmjLE+SOSphFPReqmRYH8s5Q05?=
 =?us-ascii?Q?cQGbnujwTQrS0kvGDn/sSp4b4n0/w7nykKWITE8X04TPd8X0VetqUMUZJjGa?=
 =?us-ascii?Q?yRMR+EM/6l7fafsSU7e61abxObkTiel4U99lTL1tA0poaRWKig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 13:34:26.3629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 639a88c1-d533-42fb-2f01-08dc86f68cf5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9264

Split hsmp.c into 2 exclusive driver one for ACPI object based probing and
one probed as a platform device, provide Kconfig options to select one of
them.

Patch1: In preparation for the split. Create hsmp directory and necessary
Kconfig and Makefile and move hsmp.c file to hsmp/ directory.
There are no logical changes in this patch.

Patch2: Split hsmp.c code into acpi.c, core.c and plat.c files
acpi.c + core.c -> compile into ACPI based driver.
plat.c + core.c -> compile into plat device based driver.

Also, remove devm_* sysfs calls and uses dev_groups pointer
in platform_driver structure.

Suma Hegde (2):
  platform/x86/amd/hsmp: Create hsmp/ directory
  platform/x86/amd/hsmp: Split ACPI and non-ACPI code

 Documentation/arch/x86/amd_hsmp.rst    |  60 +-
 MAINTAINERS                            |   2 +-
 arch/x86/include/asm/amd_hsmp.h        |   2 +-
 drivers/platform/x86/amd/Kconfig       |  14 +-
 drivers/platform/x86/amd/Makefile      |   3 +-
 drivers/platform/x86/amd/hsmp.c        | 988 -------------------------
 drivers/platform/x86/amd/hsmp/Kconfig  |  37 +
 drivers/platform/x86/amd/hsmp/Makefile |  13 +
 drivers/platform/x86/amd/hsmp/acpi.c   | 301 ++++++++
 drivers/platform/x86/amd/hsmp/core.c   | 284 +++++++
 drivers/platform/x86/amd/hsmp/hsmp.h   |  66 ++
 drivers/platform/x86/amd/hsmp/plat.c   | 392 ++++++++++
 12 files changed, 1152 insertions(+), 1010 deletions(-)
 delete mode 100644 drivers/platform/x86/amd/hsmp.c
 create mode 100644 drivers/platform/x86/amd/hsmp/Kconfig
 create mode 100644 drivers/platform/x86/amd/hsmp/Makefile
 create mode 100644 drivers/platform/x86/amd/hsmp/acpi.c
 create mode 100644 drivers/platform/x86/amd/hsmp/core.c
 create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h
 create mode 100644 drivers/platform/x86/amd/hsmp/plat.c

-- 
2.25.1

