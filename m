Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2071.outbound.protection.outlook.com [40.107.95.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876319539F
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964456; cv=fail; b=LJjTgtwJi+l9ul3sS1QVHUD4tGC8z0JjrC1F0lMn7Gg3zbG3fqYXck9zGG+DESAxpCZOUMlcxLTxm/WkFRYhWehT4Y/gQxx7slG4oKgfmqeowgc91rtXrs2xxxdmXoUgMoUIYs31fa2IK9RRhjDhIFj6xVbOUffya7QTa6FaKbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964456; c=relaxed/simple;
	bh=7KnpeGKo06xVSUmNWwQ8jYiAFUdzpJ95fAL5ZrZ5cZ0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C9x4D5ar2xqJWHNzR+vA4N6AbZYBo5CZ95G5FQcLqWB3BoD9aMXcLsSItPFPwB7Tt3YY4VZX/ldowZa1FPwDd+QXeE2sVnaBtUBLy0AKpO7v0QUFRA1oCCDWEORlQVFMU271iUHS22SDNWGuME2SajsFqo+TKuUssycMAS6UDuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cLp1zLSS; arc=fail smtp.client-ip=40.107.95.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cLp1zLSS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWm7rTO7Wwy6ebpbI/m6hk8wog9PeD3TZvkYZcfwJIzV7xVxNn9r9ZrMqtcWWj5O/4bX30HRRAEehgpSzZRlmsmpo9FGe7XVLVMgQrcGLva9FiZJSP3A6YaBc+eNyPBT4gi40ky6iI00S7BIZI1st6frKT3dpCLf5dXTcXEfCi/Sakf7mUPxfkPdPCLy2u4a/w7ukJ+SB6+t/HkDLdXcIX/Ts3AuryBeOXeDpIKuobp+WUiZY+0NZEOxEYfbOy8nizU0U4oCawzLeaUscuCiJfFg42yMKYkd8/u5Dre4in/hI5kZVpndXZ6g4OXa/NcfzXhoHFqqwCuSTMH6DXd6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCfA78JIONrxTXWv0st9keoZhN7EHbL2I9q5A11R+3g=;
 b=h3Q0KS6oHMZnfmgP+5AVs3E5XRxx+0OKZ7bl5d60unPOXqWORwpPPxO1I7ixrAId+Rqgi+LhpDucO4dfzYMKBcWLys1Z06uxha9/kHJpQtkQo5nVAblJbCRZRkvkZwK+CicyOJ4FbgdO1xemeMYJp2VfQHdndQwZUXruNNIdwemETo8HZm1tM0Vx6HTjBeed5lFRNlPP2NXMyHaQF+fvQ/wRIrsQI+nszvpuMa9KkRl4/1iUsxGAi/mLwNCUPjrfyJ1Ujz65PMnRE1ySJgMR3+DbWMIOloh3X8uz67gRa5qPP9hQPsB/PPl3s7UHCK7ouZqaEg1Mtt0hhn1HOGRr8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCfA78JIONrxTXWv0st9keoZhN7EHbL2I9q5A11R+3g=;
 b=cLp1zLSSXaHWKwmBrHjRiwOJ4cTVKDI8fsEfxc70bC/FycpCsQY5B3CmH13JyqpL+JPs3vupDyJ3vkvGKtZI5d5YOv2wNyj0htZAIqk5e2ZHfJKG7bOX/5URc8nGbAyOvzAOt4rDP2fZiUMd6s0vOiGYj+B/uFMRJgR9FpkcLnU=
Received: from PH0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:510:5::10)
 by IA1PR12MB7664.namprd12.prod.outlook.com (2603:10b6:208:423::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 07:27:31 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::c4) by PH0PR07CA0005.outlook.office365.com
 (2603:10b6:510:5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:30 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:28 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 00/11] platform/x86/amd/pmc: Updates to AMD PMC driver
Date: Thu, 7 Nov 2024 12:57:03 +0530
Message-ID: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|IA1PR12MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e59b57-8bf3-4b2e-b87e-08dcfefda3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0F8KBesYco3yN21dXpZlmiC8hcwBE2vleuoXZjFMV2KZxe7NCZ73JQU/HnkF?=
 =?us-ascii?Q?4pY2gm8SMIMwY0dyb2GGihrLwmDDbSBj1/yiG0Y9+yhndM5n+xH43ZXHl2aG?=
 =?us-ascii?Q?66QpyO7U0Lnp+N7ghVw8zM7FfhpiX/5yemsyJovGr9+FbJtes3zOwRA8fZ4B?=
 =?us-ascii?Q?pJ8793dMVOJHm7ipBML7DyMtYQv9vdokb+C0MGaztuHP1MWlFP8FnVCYW8a4?=
 =?us-ascii?Q?Yy1ik6cgHSKMiPTo5OmN56hj0Ho0iuJTBv0viRpd6Go5OOQ6SULqpLtSPM92?=
 =?us-ascii?Q?f7ckNeFcyPd8D2AgTNGhsu29aIMe2hZrvC9iXNJAoAYHIimk8DWqay0i49s/?=
 =?us-ascii?Q?F0gpTTCAe1IjGFlY1I44UAlGybg9puLvYaOvuoGvJHBqP2NUVYWaMk22Sk8X?=
 =?us-ascii?Q?sq6YpeOOMqxom6v/rM2O+QFYmYAyUIntrZ/+xYeVDlckNKtz+YoPW09TBqJM?=
 =?us-ascii?Q?CgGje+vvCYhMjlHvXl+oOkR/TNnJDGN5ujl9I90m1/Y0gZPWpYEn07MjzAeA?=
 =?us-ascii?Q?8IRQflGxv460z4RtqvjzLp7kKp1kmfS7YAW0l5c1/mgMdNtvMYhDjof6jrTE?=
 =?us-ascii?Q?AakVNW8kbbh8/s1uR++5G758gI3umMeqz0jMiuex30Fft/oYO0py1f4P/jJ5?=
 =?us-ascii?Q?o9TLcbhR/kIJ/uh7HaBFcbPI8RYDNGbOw1XdQ4pyzYnyGK6DOYZdZe4ES5nW?=
 =?us-ascii?Q?0MmS3ZiTCx3N330ppn1HPx0j6ol0sQQA5XK1zpbTi+KAhOKpLImrwy1n0Gpj?=
 =?us-ascii?Q?C6jkcDVPaTtTx5ZuiBOXZgjMzKR4STjWAXE1VFLo3OEJgSdA1LOcVZmrZ0UU?=
 =?us-ascii?Q?mLuk13rJLC3HOeP9VtxJ47OzJG694UMVNUmxuCz3sNW5ZIkZEYDelTXSN5sL?=
 =?us-ascii?Q?4+y3XLYM8FTtD5wAp6eNgoeVWR7sYIekpDEzHEJ+4hMJdokXfpYmbaN52+XY?=
 =?us-ascii?Q?ppzoK1ixSRUHY99o0xIyigKx64PHQTXXTggVbbpeh+j3Ni+QSDhgMsTSrIaP?=
 =?us-ascii?Q?p7E9mHbvxqq33C5anvYFQga5ulLOMX9X/hi4iWZzgwtYFKDBB8xPXYkrrZEI?=
 =?us-ascii?Q?CX+i+F3Z2LCHgrPemuNaTisgG2z/UNGyVRZzl/wcd8xgI2h1PUj3q/Yheaj8?=
 =?us-ascii?Q?Q+TaW/HFC0DU3kyEmHUfEqjex6gDbpqpttXLGRB3LkYTCDWsewMpsKdJ7M+7?=
 =?us-ascii?Q?LadY98KJ5qPI2EJAJbdoB9YL5HpdnJNFYqTxQnoPhOvD5cSI12FXq3Lmjcsi?=
 =?us-ascii?Q?RMrbs1Trx6h4DYfy0caXQemqyFaqZ6xuuD5Qr8COnb9izWl+qVuOVyk9DbH4?=
 =?us-ascii?Q?cDrrRNFy7iyEADIptKBnrGUdVmOJuZv0KyV1JyxuhpsjN4KuQxK7BOHdvh71?=
 =?us-ascii?Q?LOqm0W8FMlf2q5ZzvQXxoxxYi9zV/MgAvhZKyATJHHuWEP6isA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:30.6156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e59b57-8bf3-4b2e-b87e-08dcfefda3bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7664

Updates include:
- Rework STB code and move into a separate file
- Update the code with new IP block information for newer SoCs
- Add STB support for new generation
- Add STB support for Ryzen desktop variants
- Updates to MAINTAINERS record.

v4:
----
  - Reorder patches as suggested by Mario and Ilpo
  - Squash patches
  - Update tags

v3:
----
 - Split patch 1/8 of v2 into two more patches
 - Add helper for printing S2D/PMC ports
 - Use ARRAY_SIZE() for getting the number of IPs
 - Address other remarks from Ilpo.

v2:
----
 - Add Mario's Reviewed-by tags
 - Add amd_stb_update_args() to simplify code handling
 - use cpu_feature_enabled() instead of root port's cpu_id information.

Shyam Sundar S K (11):
  platform/x86/amd/pmc: Move STB block into amd_pmc_s2d_init()
  platform/x86/amd/pmc: Invoke amd_pmc_s2d_init() Post Debugfs
    Registration
  platform/x86/amd/pmc: Move STB functionality to a new file for better
    code organization
  platform/x86/amd/pmc: Update function names to align with new STB file
  platform/x86/amd/pmc: Define enum for S2D/PMC msg_port and add helper
    function
  platform/x86/amd/pmc: Isolate STB code changes to a new file
  platform/x86/amd/pmc: Use ARRAY_SIZE() to fill num_ips information
  platform/x86/amd/pmc: Update IP information structure for newer SoCs
  platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
  platform/x86/amd/pmc: Add STB support for AMD Desktop variants
  MAINTAINERS: Change AMD PMC driver status to "Supported"

 MAINTAINERS                            |   2 +-
 drivers/platform/x86/amd/pmc/Makefile  |   2 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c | 332 ++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     | 367 +++++--------------------
 drivers/platform/x86/amd/pmc/pmc.h     |  20 +-
 5 files changed, 417 insertions(+), 306 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c

-- 
2.34.1

