Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEEF34C81D
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 07:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762845033; cv=fail; b=B2aa6Zl7q3uG4iJM7+LWJYSLo4HDNoYL2S4GM7OOtdvjD6Ki8sfqDV7Pnzps6CcmQgG4w/aBZXrH/uPBjhWW+8WyIvst+k4hjLiBSDWOvnQF8eLNnlpk43/x0VISwQo4nDqMCpa+mtw134fNSlTLX8ccxzB5HWtecwR+zVpfr6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762845033; c=relaxed/simple;
	bh=+Yg7ovYQqmLX0cN1tmYmXIjG8RBWnQjw5eoTFRxaYI8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FeArJwElFRlEygV4HLyS8T+dQOlfY/EU4dW9mN0hRIuHOpb71FW8OP3CGtMKSAGnj7ic5q/foCpL5nHKCSsKs2V3WMcdjF/dTUV3d4B267HKtCNYzHH/Nd0wD8zYb3NAyVcQZrBn/Y6aFWXE3B7bL3JuwkZos/OHvOfhHLj/rcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XA4U8TAF; arc=fail smtp.client-ip=40.93.196.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XA4U8TAF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8MsYYZWwEZKzT7SV5XolSonjI7x8+L7ddSLVq1mpHWleFRvHcKx/4iBXSjBNAK4t/boe5XQLVzYLHSy5ijgyFUf5lkJV3TdRsLs7VNVZFAQwuaC3Zz2bk7HK+ovoFhK7VsssYeYE07q2Mb+kdQGdepk8xneID5v5EhSDfV/iA27/N3sx7uELMp/a0iGzL0UDElA1x+rKWNwlo/C7/P8N0m1lrmWc0pqhFynMJHZDRgctSEUtoAWBmGeWzbXCYkx3uGT3S8U5PVZjxHH3EJq1zPoHw65QgM5AN7JzYfSRMLjbeOloNggALWCtXnrMHcFxkRPCxAoCapGOd1fTU3tow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7MWZCnjlnHxm9OTU63ns+ZJA8wJ+JSeVkCIT5ErcPA=;
 b=Fi2ymd8WTym2JKw8UBZdNjIRK8j4o4GTNdJvBbf5AmJPyaO06i2Shrkwt29+FUArHr7+BE2fd/FyYYJ3D5SGmKv4CDWIdLPpvEU8XOj19QWQPcuV6a8SzXO4mXnjfgB+oXIcxSfZFbkDPunv7bnw7R6V4eT2stJj7YV9rrXXipfSZpVMROPP6qplGZWIAb+Cm9CpUjgtxIrl82R5qmm/lKFReqvVDle+XXE/BpKADVwH9Vda+wDKgYsxhpxojfGKTO5++6dlRA4ZgAB3dnHIOmiuRaqECOB4au/CNppG9XDOEAMCLgZBQ95XsKnAHJJ1PtQmYTbFw0engbkBSopatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7MWZCnjlnHxm9OTU63ns+ZJA8wJ+JSeVkCIT5ErcPA=;
 b=XA4U8TAFD13Ibn43+3qEI/c6gNmrHpbgARqM5Df70FdAt4PKroClrXGK3rCUmK4clG7+yxGKeu895eGfAEdNFx2EiKyNp0p2VJ/xEzmAeLve+USnCdYz5xw8LkA59OqhEcKaXxxP9oSxl9U5P6QHg2zj4WVlS5vwusz/o8sn9fY=
Received: from BL0PR02CA0139.namprd02.prod.outlook.com (2603:10b6:208:35::44)
 by SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 07:10:28 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::d3) by BL0PR02CA0139.outlook.office365.com
 (2603:10b6:208:35::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 07:10:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 07:10:27 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 23:10:25 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/5] Introduce AMD PMF util layer and user-space interface for SystemDeck
Date: Tue, 11 Nov 2025 12:40:05 +0530
Message-ID: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|SN7PR12MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec95305-5e0a-4c23-42b9-08de20f1648e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jGigtLAZ2akKOREOreQnnaWbnYp8VTiHa3LtbM3r8+JNFoZ/cBKXGLda25qv?=
 =?us-ascii?Q?aYwdjhMzQZOJKk5eAsojSld0C3H0s7rXJWFuqesJxwoXYti9rRXhI2802Ysn?=
 =?us-ascii?Q?md7xWtajwY31WKVBAzv+S/PtPDmr3xk/6GzlGeXs59HMrsLdqLNldQwDlCcQ?=
 =?us-ascii?Q?SxPokQOMWWBU+omY8hqCs+bJvHYAR5IL+Did+FXGLN9RNHB31gobQV2rTZy/?=
 =?us-ascii?Q?vIUjOR3VHpc15pdwdx/Y86nsdXJPckBDwOCCApVL7c2O3IfhWpKOLadXEDyZ?=
 =?us-ascii?Q?m4+dMU3qhBWJHrqY7Cj4++l0MnJnodNymXdn2gJZWn3qVwu+OdmKVZ6XFwH0?=
 =?us-ascii?Q?FcOlorYaW1I4IXocf3QB0tJYpoTakyjbDI6bCxGxGq7dK+5/ZarGeoNnJd+Q?=
 =?us-ascii?Q?vKhVr+pK9UDngC3gUc4mZmmFB47hpj5BVbKih97gbl5bvGtoqBIFKhwN641S?=
 =?us-ascii?Q?Q18u+TOSwluNP2pZacVBLFG962BOAC5aDljw/eprtH78eOZt0QifJtHp50l1?=
 =?us-ascii?Q?5rW5B3A5BmcJxav5Q2NBeqYCl5iGs2BaQF+NXm5xZRpdWFVIyIzRboQPdVS3?=
 =?us-ascii?Q?ew4WnhQI3uFe7b0MvSOe8qbA06duOjKbD4ENHlwtNiVa2dk/fEGlqrPsc/b1?=
 =?us-ascii?Q?5GSKw0Oxwou2WOdkthEUKNlubconv7MaCfaf95NBjxoLyurecFwy230K4TGl?=
 =?us-ascii?Q?QHMlSQ/5lH3RhmU2oDUWET1AH8w19gzT5JqMOcMFTZSjoDo9kRYBzt4mZe5K?=
 =?us-ascii?Q?K+6LO7OIjyg1v1yORveUOQ7F2UeeJivKEAIQyNS0tIFe8j0x/7Fn2Fxleo4J?=
 =?us-ascii?Q?kejE21WN1VC7Ij4TqMHAD4yy/ACKGBLmKH6xaUU2bsZkA75nm6w9WvtS/3o5?=
 =?us-ascii?Q?RPScM/yoY/tlDTzuLfvlMv2R9IUeGe/SJa3KHtxYaesxgLZ3qo9Zs05gNybe?=
 =?us-ascii?Q?vsZaGj6HtRyBnRwm00TqK3v1Q5o9+oT4b58zeQkKrGr/ohTj0QbCLEvrV0PA?=
 =?us-ascii?Q?Rcud9BCGP3iF7+hYlIBr3JVAfry4VlJGgE6v+T9QmVCHWR5AgUEymDuO67D5?=
 =?us-ascii?Q?ccMgzXjRcXVpa75DWg92+v5RUPq0DGxMI24PHvIf1/3PCZBtvZ+WTeRY86sS?=
 =?us-ascii?Q?QcXDaHsSnBM0PoldNFQ5JdZMufmpbPmK9Ujv+/PplA2TcAWHY/a1tqa7Mdzm?=
 =?us-ascii?Q?mYt9FB9YSP/w/33YP6rqb0vrxFruoZircLKK9XZvYALmkRfh/jzy23Kdn4yi?=
 =?us-ascii?Q?QMzvBag0EWFRSIvnXRD/m9dSvkvBD6Z3jIcF27ywWxKkfYEIPYgqc9rPmDP6?=
 =?us-ascii?Q?rYhZyCktr64zSAP1koFPpNDEcW6P2JsoY198y0Qie2rXpU/Pqmlq2dH5q43K?=
 =?us-ascii?Q?drds4+mcUSDigeKzOPZrwXU19V7duT0es7JknbB2w2maxN0chFJ4HbFBVlYg?=
 =?us-ascii?Q?atAHEjbrseGLP8oZv0vfCoBSvaQ6z1uenkcDhlT4fyCc0BD2yUQoB0DTcUZ1?=
 =?us-ascii?Q?i84fpJFQgr2dqHPeHfh9v6CrF/eDmq8rhJCtko3tgQj2MKE08FJeDmz0fGNv?=
 =?us-ascii?Q?MVdk45xqeUgPB8NilG0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 07:10:27.9010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec95305-5e0a-4c23-42b9-08de20f1648e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7856

This series introduces a util layer to the AMD Platform Management
Framework (PMF) and a minimal user-space interface via a misc character
device, enabling feature discovery and smoother integration with
user-space tools. It also adds caching of BIOS output policy values to
prepare for user-space telemetry reporting via IOCTLs.

The motivation is to provide a stable interface for user-space tools to
discover PMF features and consume selected metrics. Enable smoother
integration with AMD SystemDeck, a widely used tool for monitoring and
controlling power and thermal behavior, helping designers keep components
within thermal limits to ensure proper operation and improve system
stability and reliability.

This series also adds a small, dependable userspace utility that leverages
the new IOCTLs to query live power and thermal telemetry. Exposing this
data in a scriptable interface helps users and tooling make informed,
workload-aware decisions and supports validation and debugging.

v2:
----
 - address remarks from v1
 - add a new tool that exercises the IOCTLs from PMF interface

Shyam Sundar S K (5):
  platform/x86/amd/pmf: add util layer and user-space misc device
    interface
  platform/x86/amd/pmf: cache BIOS output values for user-space
    telemetry via util IOCTL
  Documentation/ABI: add testing entry for AMD PMF misc device interface
  platform/x86/amd/pmf: Store commonly used enums in the header file
  platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
    metrics and features

 .../ABI/testing/misc-amdpmf_interface         |  49 +++
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/amd/pmf/Kconfig          |  10 +
 drivers/platform/x86/amd/pmf/Makefile         |   2 +
 drivers/platform/x86/amd/pmf/core.c           |  19 +
 drivers/platform/x86/amd/pmf/pmf.h            |  33 +-
 drivers/platform/x86/amd/pmf/spc.c            |   1 +
 drivers/platform/x86/amd/pmf/tee-if.c         |  10 +
 drivers/platform/x86/amd/pmf/util.c           | 236 +++++++++++
 include/uapi/linux/amd-pmf.h                  |  96 +++++
 tools/testing/selftests/Makefile              |   1 +
 .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
 .../drivers/platform/x86/amd/pmf/test_pmf.c   | 388 ++++++++++++++++++
 13 files changed, 832 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
 create mode 100644 drivers/platform/x86/amd/pmf/util.c
 create mode 100644 include/uapi/linux/amd-pmf.h
 create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
 create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c

-- 
2.34.1

