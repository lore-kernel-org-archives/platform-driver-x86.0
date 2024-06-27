Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9C71C2AD
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 05:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466824; cv=fail; b=HDjIkEMfkpZf8DTziTY6ATiONJIlKggaKEARgq8cKwSq25NqyhRmS+tetONMcD/ZGQu33Fj5qWSbbKPW20EB8dmNxD097wDqa42mVWVMJ+0Rd5gi5bUNcu2adypWFWpni9KSPMCn6Jna4FiBcLG2+t7iw8iAsIlD+QX2jZXaTlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466824; c=relaxed/simple;
	bh=o6dLqVuG3/cquyqeBYmjB1/P/Ew6aEqD/OIb3fKWzA0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I+4M3O7nfSbrKcD2QP4bPxO9Iq1vQq+GBSl0NTtnIo/NqgLepwEc46F/7PpVcW0MheTgY1mV2r4g6o0AjrLfVePvtbwh+fT8Ead1DiZZ6w+YLt31uKNkQ5k/oHqQqTDcVBZqhEg9WN/LCuQRnNDoZvnrQ+5V/fyxXDiM9ikQFBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W2xnQzUy; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W2xnQzUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zx67eE8+ZsO9knVC3lteS9vt9Rr41P5ZgesFJD8tG33b+SV7W+PFU6yZkkhYqyFv72M+Ay/jhnJSCNqaKJ8Nf9454TXXc3ZyoSc8vHRjo/h49KBVdQJQ6kR37FXevO7adwuZxMQ4hRDlyx4WfuUucUzq1tm381WSqtIR1nD5ZSCSQkFc8DJ+OPi+QMcoKpqBwkMqnoimZlQqbPvW2bEx9IVtlua5tlFYH3nyUtePFqONWpDiNzIqu7HWgMhOEMGzjrRxAcT1jCZ8b+0TQIQXATpb6DMga36eTtnx4aQI49tdqi6qto8H6v3ouyd0K1TwvLz0BUj47GQFGqSjOE5KrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGAxJKCRmlBcQhw86hOakoOKKnHIfuYTSeUBM6/F0wE=;
 b=WPju8BE3TgaUZWRWB9EATmlQgc6cQo+HXdOnzLo8OJ8Ux3uGarzLZiOacG9rXxJZx/i1H1CL6zSyZu4iKpHFK91kHSfW2hv7RrbfiRaZp6h65DryEo8K0NdvMpc9tCX0XxP67mz0dkl+HzjeuRxNezgYVe5tMUE1gKJcWl5kEJjp284nz6IoBnLRakvqawrfK13w4H4sfdclHeMm44q7jV9dIuRESJkFYSKu0hU9iutax6AgkrgvCFRZuKgvuVj2P7QdAhFNMSKAI+RNWE6qb5Tec+/uqhrIUm69cwxo+jQ8Rfx2HhZeoWAZ8iEkTWnUeGfcAF7U2QeaKb5a8z+U5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGAxJKCRmlBcQhw86hOakoOKKnHIfuYTSeUBM6/F0wE=;
 b=W2xnQzUyPkgVPrHmSli6PtCBcg0xSyYwP9THMQdECOznW7tJgdWZTwdurTTe6v7YxDwMOCXOTraHxYKt6wNFhg+5tqQngGyasYqb8JGbcB3KGLSsDuK6gYKS/PFGI2XuiskE0ecaBmw0kM1OCxabmTmh7o7ZaeNSLRIF+TLqR0o=
Received: from SA1PR02CA0015.namprd02.prod.outlook.com (2603:10b6:806:2cf::19)
 by DS7PR12MB8204.namprd12.prod.outlook.com (2603:10b6:8:e1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Thu, 27 Jun 2024 05:40:19 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::e6) by SA1PR02CA0015.outlook.office365.com
 (2603:10b6:806:2cf::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.23 via Frontend
 Transport; Thu, 27 Jun 2024 05:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 05:40:19 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 00:40:17 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH 00/10] platform/x86/amd/hsmp: Split ACPI and plat device driver
Date: Thu, 27 Jun 2024 05:39:48 +0000
Message-ID: <20240627053958.2533860-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|DS7PR12MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c4e815-9b2b-4463-2b4c-08dc966ba1ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ntSFRSMdh8z7DxI/Fa9uInpgmTdPFF9BStrA3nfJYNfijzqg2ZAcYfb2opf1?=
 =?us-ascii?Q?uf+J+4vFIQq888L41lQ52DwX2RSx6ZijfN0iuc2WQeyzukhzAaMepWRmSD9V?=
 =?us-ascii?Q?NjNEWGeeyEKLOLXxJ8TFBBDVdJAgxTWyheHfWTrtQ/9I5/nppbg6LsyAeoOu?=
 =?us-ascii?Q?cUhKe723mqoSToaAG5nZgHom1FR8GHaKSnSNht38tYS1KpkGqHNqLskcGSGm?=
 =?us-ascii?Q?qg0iVAVrsnFZAwwUrwUMaxqbiP9CVcPxACtxWRYVWczXh9Zr1FxDpr+xTeA2?=
 =?us-ascii?Q?k9vt22Q8DelNX+IY4pl1Kvfe0RnFpo1q/SmR1Gmfh3kYh+DlDkgtjIf5x5Oj?=
 =?us-ascii?Q?y70c3HV7mBd6EbkYgSwzLgyhevExGON0LZl+uEhQpMauAS0we8Dmx2t2EZT1?=
 =?us-ascii?Q?XzSO6CjxUvL8UmtSZS0Gcv/aQ/4g79C43GNysHXbcR4h8g8ZsKaTc2MMH7z3?=
 =?us-ascii?Q?q7mCK+FcJeN5WmMLya5qojvnHQ7/mYJ9BXFRJykcHHwOJaa3vzmSWhoinz97?=
 =?us-ascii?Q?LKhNn7XkmN0aUwMjCWJe9mzgVIPZqdsBIj7mNas3pdgYBh+e6AL2yhYoojD5?=
 =?us-ascii?Q?ZiyTYpF8st5ymYExuTpAnEIMmd8IvpYsV6rUw59vUOIkXwTU9viWT4wcdGiX?=
 =?us-ascii?Q?1L32HhaVoMvJeGwvHVApmenFFW3pyyOltQxl8F3YbWdB3Gbmr8V3ac1pfqqR?=
 =?us-ascii?Q?yO7AkXMXfCCXSYzBvZ426jffsUz9fTo8v16uwr/PcxFFHA2CjTdGjLBFAjwE?=
 =?us-ascii?Q?X3dC+UBIAcPkPvh1tnTxv0cBXl9QCfgyuNryG+dmTNO5wHdR9lPvGr+/foqG?=
 =?us-ascii?Q?yTtrXgBEJcTmPkWe7uDgUPrgiV4BJVG2UdW6OqIz4Fe6D8tO8x0X39v2S4tj?=
 =?us-ascii?Q?WMZFPash01a5SPlzdVUHkMc6xY9ZL8wPYN8rnGORgGRq7eG4447g7xZQNrHT?=
 =?us-ascii?Q?LNoy6JHJm9KY5xqYZoAHE+1fbM8xmIGRguv8vrEkGI8m37mYF5AKLtIlgxsv?=
 =?us-ascii?Q?uPO7TRlzwzXOtrq/Sm6oQ8Qmq6pKFmmCsnWc+M8i0tS6+cEoi8AnOEYj0fdt?=
 =?us-ascii?Q?RUblv1XYXVDxdq8S64w8pI0BYlkUm+hYnN9xrErALJImsGosHltpwERxHdjn?=
 =?us-ascii?Q?EEHVvyltYDzkYrABOnfCcHEAfv1hHhOZUafaCViwkPc4qWVAdUl9TILXol59?=
 =?us-ascii?Q?wMvb1CJ0UDRyLOPgljNVpSDGa3atAkK8elwsfh5ifsjTwmgF/wY2RyeoqEUS?=
 =?us-ascii?Q?ewbsTmND0OtmufgMFoSrUsVghw80AOUNXsXAbwrJKfJSfWfVL0+D3Bu5XNGU?=
 =?us-ascii?Q?NQRwuYEgDNd7mong/tcGZW3j9IXGTd1qvoFsCrypUHq7xCG830RaV7YTkqrC?=
 =?us-ascii?Q?2ixQlZA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:40:19.6730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c4e815-9b2b-4463-2b4c-08dc966ba1ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8204

This patch series splits the ACPI and platform device probing
in hsmp driver based on suggestion by Ilpo Jarvinen
https://lore.kernel.org/platform-driver-x86/20240607133405.1211929-1-suma.hegde@amd.com/T/#t

This change will help: 
 - Keep the probes clean of the if else ladder
 - use dev_groups in platform driver structure, instead of using
   devm_device_add_group()
 - use is_visible() to enable only the necessary sysfs entries.

Patch1-5 : Add smaller functions in preparation for the split
	   no logical change, code is re-structured to ease the
	   driver split.
Patch6   : Split ACPI and platform device based drivers as 2
           mutually exclusive drivers, only one of them can be enabled.
           Make Kconfig and Makefile changes to support this.
Patch7   : Add namespace to exported symbol hsmp_send_messag()
Patch8-9 : Remove dynamic creation and use dev_groups instead.
Patch 10 : Fix smatch error

Suma Hegde (10):
  platform/x86/amd/hsmp: Create hsmp/ directory
  platform/x86/amd/hsmp: Create wrapper function init_acpi()
  platform/x86/amd/hsmp: Move strcuture and macros to header file
  platform/x86/amd/hsmp: Move platform device specific code to plat.c
  platform/x86/amd/hsmp: Move ACPI code to acpi.c
  platform/x86/amd/hsmp: Create mutually exclusive ACPI and plat drivers
  platform/x86/amd/hsmp: Use name space while exporting module symbols
  platform/x86/amd/hsmp: Move read and is_visible to respective files
  platform/x86/amd/hsmp: Use dev_groups in the driver structure
  platform/x86/amd/hsmp: Fix potential spectre issue

 MAINTAINERS                            |   2 +-
 arch/x86/include/asm/amd_hsmp.h        |   2 +-
 drivers/platform/x86/amd/Kconfig       |  14 +-
 drivers/platform/x86/amd/Makefile      |   3 +-
 drivers/platform/x86/amd/hsmp.c        | 988 -------------------------
 drivers/platform/x86/amd/hsmp/Kconfig  |  40 +
 drivers/platform/x86/amd/hsmp/Makefile |  14 +
 drivers/platform/x86/amd/hsmp/acpi.c   | 410 ++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c   | 323 ++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h   |  61 ++
 drivers/platform/x86/amd/hsmp/plat.c   | 368 +++++++++
 11 files changed, 1220 insertions(+), 1005 deletions(-)
 delete mode 100644 drivers/platform/x86/amd/hsmp.c
 create mode 100644 drivers/platform/x86/amd/hsmp/Kconfig
 create mode 100644 drivers/platform/x86/amd/hsmp/Makefile
 create mode 100644 drivers/platform/x86/amd/hsmp/acpi.c
 create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.c
 create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h
 create mode 100644 drivers/platform/x86/amd/hsmp/plat.c

-- 
2.25.1

