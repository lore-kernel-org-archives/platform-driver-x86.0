Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013033.outbound.protection.outlook.com [40.107.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF642F8EB5;
	Thu, 11 Jun 2026 05:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155784; cv=fail; b=QCcVMUZvaZyk0o8M0FC+yaLnHRNJ9yfvP2kxUq7lxBBSnk/pMCK62TiHHDr0pYcPhOuuCRlzbZY6Krkc0cq4mDxfMAzOl4S49LU0t1C9dtMqsaX1gKQFVORlnGBRxqc8W/nR/Kx04e9Rm+IhhEWuR1DhckJoiurz/t/yeBwaTuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155784; c=relaxed/simple;
	bh=La6dkwCYMdBZULP4VXxNUUgoA8p2urCf7+YqwAfLa9U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BoeNo+QbuzXfH/kD0iPshedF4a2Xr/hGNJ0LlDGs4+mWGAKd3TFIVdlOD009+L2FMAFgzN1YitNG5WPLGIzulwsRfGSpZcsIiEkm6bVO1dsz2lBrz5pM6svcBqVYngKQediZnNrznDZ/2lao1gIcm/qVqQkP6CyW82gaFO9HC4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aPd19/Ac; arc=fail smtp.client-ip=40.107.201.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aPd19/Ac"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqdM3zLwYozH/S9h68NUi+wVPMV2rpNZx6I9v0WkDBxa9Wp79GL1IcanD01iXmfYqlRHugVXKv4F8blpFqqU6DO17jQr0nS2i0uvT+f9vto3rZ16HgGndhO68dwhHGN9LMKy8eT7hf9poXtMnGsWi/sLj287IZZ2vO2Sy35FvDZ6S+7hbGVBDgT42tLTQm2WSy3xZSyB/9VmNCtDEdrfzHErUBkK5Xj7exIsyvmRj35fNjVo2pG9ljtB3HByrUVoTy3K8TS2dIlUYywYcZPs3Ep0k9bFpZnCIm1lGQp7I3mFIKxEKNGWpeDuekWAyFE0zKAIBBXNa+H40j0hFx5+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtbIxz2elLh7HPUn+5V/YVXYM99RrKffN8m6YllkZWA=;
 b=SlniqI1/gy+y8TaDYzT+ngV75SVggfAI6CMKw3Ek/lnNXLABH6wRJavotc3tMwIXqlOUijgUwD6/I1OKBmoYTz83g5I0VdPaCNaMDzm8Y621z279WYsy4mHf4JrdcReAsgTtHzw/MbkqyI2kua4Ak/6moMnw6oI6J4MIWMlFu+SSL0ym24vCLXlTD96yOAGCchIvzkb/oKvMuwwFvVMtrTj2gD5UQzPqI5PUFytV3R9fe4RvukEXv2tmwyGcKvZuPrxaVU33YpH7dP5zNmOtLqrUxVTT0oDFYGTlOa/BWtgw3zaR3J9372BKe0NGVzx9AjSj8WsXuCkEKw75lYVpoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtbIxz2elLh7HPUn+5V/YVXYM99RrKffN8m6YllkZWA=;
 b=aPd19/AcseVsvR8BQdqwE5jTpad3xBMJAcx51TJabQeFlHAA67BGSml953aYrGQsSuXeHHJ/rutdH9n7H/prHwEc2Rq3Dn7iu6ntq6Rrcr6dP984B7HIuJLhnJDJTUxHxqwDSAXKoIorcHrk2YXHBvq9IbVg7JuR1vfX0PhkPRs=
Received: from CH2PR02CA0016.namprd02.prod.outlook.com (2603:10b6:610:4e::26)
 by DSSPR12MB999238.namprd12.prod.outlook.com (2603:10b6:8:374::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 11 Jun 2026
 05:29:38 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::92) by CH2PR02CA0016.outlook.office365.com
 (2603:10b6:610:4e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 05:29:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 05:29:38 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 00:29:36 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v5 0/8] platform/x86/amd/hsmp: Family 1Ah Model 50h-5Fh HSMP and metrics
Date: Thu, 11 Jun 2026 10:59:11 +0530
Message-ID: <20260611052919.1095549-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|DSSPR12MB999238:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c37b5b2-43f3-4a01-63c4-08dec77a6e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|13003099007|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	T6ezkoGb2OjnxZqvkHoXU4MBBXVYhOMje9JpYiywpRChluqetaKJ13btdajuKE1gGKzWzvdJ3vr9Xmv5RQdM1R9cdWY4Ww/WKYJUNYroPzSQ5QYrG+c7rbF6vDvC6M1Egy61ngpGL4RcSFVjaq81imUxlJzEghyGUSpDbPQEmHw9TsWkm0D3IM7FTBcTkYiJCrFzvp0Nj4vVUwZePU4E3BUl15xNvaxfZ+36lvdc62t0MugUcTdJceGyufUVufz7YakNRK7EGv1PkGZ4L8Gx7QUNn2X97M3su8xL7tN16gPr/XJj9KgJ9toe/U4UGj7kNYZDucG7APiJlKkkPqk7uBwYKAJRifnqqe1DIt+OY4lUZyidBQ3LKMHKRp4Xw6Med+EpEOeqzPFQOY8n3ZkqI1IEkN6l0I62XrLC0+7H2J/1YLrjnEp1RGiWV4kXRUZoXjF/Zu74/FfU5ITS/enKgktAwhlvXdE1UW+3+71Bwkh+wgMw6K00NWr5FH1A86rCegEUPUNZoMC4nTS+mUg6KcC9yxwzScwNUmsFPzjBAofUjR2Aa0sq8y+xjRR2i1yno5tDbKM9oXWBZKCsmDVn3z5IDcQpToiVMqsYMwl7Mt26mD3gFX9DMmQrnT7qRLY/rNBOKiVDBplqoDcmCiZuL08olNQc5WghGhI/BRXZNpaE/hi5z/STa/H4zM48rOSbhWjS2NfgflG7CFtwrNiXRVdm3OP++5zRwrbvrYP357g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(13003099007)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R81Icmrp4G9WSYwWfNFPoMt94XwHWXtn/oyPCbEK3RjTdlr4ozm51e1F42uDMHx0TwGzqGg1UmMf2+F2tKW8lc3sSIp80WewoMeF/rTQAduo/xPDfH+jKnX8HHumnETYktxMx2x2bUmko3pJTw3WFO2O//CLdjcT0FF4JPkCVo9kR1GRHwSTNsKC0Fpt1VcfWUeZidwR8x78/hbY3uhEeUivObfNEKSYRda7tEuJbu19FD3ZcRMrOCea6F7pyHZ9hNQ7iLkLla1e4S10wq+sKapQY8AxUNjKGnzF1jJ7gb7DRBSSVJd9xjanNApoWeNHwXS40hByXWilDcDxRcRil1S0GOY2Qw4r4MI4x5m4wHoAzV6MG8I8LohOSXrDx+7qunPIMUbF1/RuPfBmx6tSfUZi1yLsLtZpEZL7ZwyeC8uhMyDZk+0wxtu5txfHLVec
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 05:29:38.3284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c37b5b2-43f3-4a01-63c4-08dec77a6e4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR12MB999238

Hi,

This series extends the AMD HSMP platform driver and UAPI for Family 1Ah,
Model 50h-5Fh: new HSMP message IDs (including PQoS-related IDs in the
first patch), Zen 6 metric table layout in UAPI, relaxed response_sz
handling against the descriptor table, firmware-reported metric table
sizing for ioremap and reads, HSMP_IOCTL_GET_TELEMETRY_DATA on the
existing character device for a single-shot full-table copy (avoiding
sysfs PAGE_SIZE limits and torn reads), ACPI enablement for protocol
version 7 tables, Spectre-v1 hardening on user-controlled indices, and
per-socket guard(mutex) around metric table refresh and copy.
Documentation is updated in Documentation/arch/x86/amd_hsmp.rst.

The series is bisect-safe: each commit was built with
  make W=1 M=drivers/platform/x86/amd/hsmp
after the previous commits, and scripts/checkpatch.pl --strict -g <rev>
was run on each change.

v4 submission (lore.kernel.org)
---------------------------------
https://lore.kernel.org/platform-driver-x86/PH8PR12MB7325382A1DDC4A886C25F0D7851C2@PH8PR12MB7325.namprd12.prod.outlook.com/T/#t

Changes since v4
----------------
* The HSMP_IOCTL_GET_TELEMETRY_DATA
  commit (5/8) keeps Spectre-v1 mitigation for the telemetry ioctl path
  limited to clamping req.sock_ind before indexing hsmp_pdev.sock[].
  The array_index_nospec() on msg.msg_id at the entry to
  hsmp_ioctl_msg() is moved into a dedicated follow-up patch (6/8) with
  its own changelog, so review of the ioctl/UAPI patch and the generic
  ioctl message path are separated.

* Patch 1/8 documents the additional PQoS-related HSMP message IDs
  (0x3B / 0x3C) alongside the Family 1Ah Model 50h-5Fh message work; the
  subject line is shortened to "Add HSMP messages ..." (drop "new") for
  consistency with the expanded scope of that commit.

Thanks,
Muralidhara M K

Muralidhara M K (8):
  platform/x86/amd/hsmp: Add HSMP messages for Family 1Ah, Model 50h-5Fh
  platform/x86/amd/hsmp: Add UAPI structures for Family 1Ah Model
    50h-5Fh metrics table
  platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound
    check
  platform/x86/amd/hsmp: Source metric-table size from firmware
  platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table
    reads
  platform/x86/amd/hsmp: Sanitize hsmp_ioctl_msg() msg_id for Spectre v1
  platform/x86/amd/hsmp: Enable HSMP_PROTO_VER7 metric tables on the
    ACPI driver via the IOCTL
  platform/x86/amd/hsmp: Make metric table read locking use guard(mutex)

 Documentation/arch/x86/amd_hsmp.rst  |  30 ++-
 arch/x86/include/uapi/asm/amd_hsmp.h | 310 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/acpi.c |  23 +-
 drivers/platform/x86/amd/hsmp/hsmp.c | 168 +++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |   6 +-
 5 files changed, 500 insertions(+), 37 deletions(-)

-- 
2.34.1
