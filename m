Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013004.outbound.protection.outlook.com [40.107.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B961FF1C7
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976500; cv=fail; b=bgk1Lmgf8f2sZKAclViczSDT4DvSW2ovna8XqHHILdDAhLx2O45tKSBgMqeP3bu46z8KbqhYDsAwjMtGuhDoXPfyp7/9P6WS3BKXETTvoiEJdJ+IJ+qYWiAqCr9W7m98tI6a6Rm4oDRj4CXunN4y3fww4frVH7+BIEg9GBXAwQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976500; c=relaxed/simple;
	bh=yvbmPnNXMrpbY2gRZDpcrnWnbqeLpcMAHkt2jZVhANo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GDfsvSUIV5g+/hwS6Ikj+dJGZCkewSQBMc8EbgpiD9+UXPoTn10ku4F87JR3x8hQIvrrkLY3KoEzDBO/28+dNk3PIssQKQ5YC1kjPg+ZYsOaeJdAYVcLFSeuKZWaIR2rCow4j0kEJjn3DrXc2Y1vsy7UfpwgK5R4UQ2UO7OQ1aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QOIRUBql; arc=fail smtp.client-ip=40.107.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QOIRUBql"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ix8z3Oi+K9HNBYQosZB9o+c3mnwC6CwNQI5FD9o1Q4GUwliuGZwFromgnt8t27Bgon3RPiBU4aKow4czEg0fUl9KuPE3LgnP0qtEDMd5QQ9KV4/y17AwFCDan3TxOpCs0kBNr3gvaCg1mn+OyZ0vEzsZC91DjP3EgFTauuTmsPrwfBQR0sQw8z7lzjDlOUCChA3paUHtldmbMdwASZXmzZ8TZQbb56lYMLTmYCm4BrUESnjLIz/ReUzKEuEWYNAhppFTpT12Ye2Ok/0RwspNNjD8JCyYfRGwga/On9/5DWHSs0N5q//JfBTYktWoGSfOZkEIgOzOH+/N4+L8vhSOzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHSooRu/5RrUDTKvGeLfmGOL4EfJXe2kNABAo5LYp4E=;
 b=lJLsoSFfI4KTzJm8KO8I61wu9xBKJnckF1IGpUmthjZBcd7VntKzxXZWVskWiNC7cE0+YgjUjeHWsYssibJIVipViHps0YhcbMAGLu8lyiiuPmR4l4ZCoxnXiYSAsBecKI4VhIAHAtE8Xs0z3ZvVQJGNLdCYP2V9QW95VplqzPx+zOWkcxHT/kJ3jPLkF2xtDkHm8Y3uErfgnwM2zIJzVqlQz4A9Pn3FCcD1Q7lpVSm66K/Pg5wJkViOhzIFozKgzaoMzyt8WP8dhTH2+1GjJ9VlE8B1LCv/VcCd1t+munk6f/mdZfw2GdyGW7eWrgvGNhy7B5UPafU06p9Vlucnrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHSooRu/5RrUDTKvGeLfmGOL4EfJXe2kNABAo5LYp4E=;
 b=QOIRUBqlEeMh8nuZvpCVMkxFG9NeYYtih9tFh43WNIX1g3T1sn7vOk+KkLIsKmNBw9i+AN53v+BGxG2bhkohJjnSYJxMYPl3pQDK4ip+Mm9YyA7FjPZkGeKtNmynAsXJkimnk+AiZvXChQbie7LfBaJdwC5Jb64h5dELgJGc1lI=
Received: from CY5PR18CA0053.namprd18.prod.outlook.com (2603:10b6:930:13::29)
 by FT1PR12MB677107.namprd12.prod.outlook.com (2603:10b6:170:37::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 11:14:56 +0000
Received: from CY7PEPF000000F3.namprd05.prod.outlook.com
 (2603:10b6:930:13:cafe::26) by CY5PR18CA0053.outlook.office365.com
 (2603:10b6:930:13::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 11:14:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F3.mail.protection.outlook.com (10.167.247.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 11:14:56 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:14:48 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <muthusamy.ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Suma Hegde <Suma.Hegde@amd.com>,
	"Muthusamy Ramalingam" <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 0/8] platform/x86/amd/hsmp: Unify socket/cpu sysfs
Date: Wed, 14 Oct 2026 11:14:22 +0000
Message-ID: <20261014111430.23156-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F3:EE_|FT1PR12MB677107:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a0509b-8eaa-4a4f-45fa-08df29e460e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|10067099003|261009223027099003|11063799006|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ur+oYmd7h9S8SN02FGcRBW/6wUIFiIb+nduLJOO1iw/0LBHoLGVg6HZnZzW45LANGrb2J0I9Dk2AuWfLR8HNsPfMk8fOwnugsuzvmcdvjHWBwQ9yZ33QrRIoUD4kQ0i9/QPhr8OeOhsjJsEq0/ebrTQdYvQfw1CPTyF73TmxQ1+8PuhVozg4FElLzjSjnFnCsKuah+IJGnkrzwIFqdfqEgmdX5q+7DenAhZ2R80Wjy3m36FqzHIaTXU2j2Fiu7fDQiipQJ8dbo43HLP1xTUiYkFcgiCqPq6fqSEk3SidlYZPLi5aKZw2cP7K8RaB92/l9Ta1l0AZWZq+lPea5XVqRvRjTthdX+X8t3htlqCaIKEIMmmyAv1EC632D3/dwtZqv9ltRhn6GVPLJnXwU2BbcaMU0x4vHAnNywDAOf94p9ci3cavIqHBAAmh+nS/eRybABVtagA0pRGvdvOiX6K01oOQVd3VGyDFZsiNPeP8deDp+p5Uty0EE4pP2YYdGwAnlAz21yeRdAWKXV1GFs4iB2N/djDUFRDGLmiBKQevD2bLT0r+AhBJMOF1coc//92cm+IjWbgpGuaj0txjbDTL1bbl53Upku1I3J3Jc+DZzI2iP5BfktRHtxnUVy+aqaysL2W2eoZ0tG3aZmFSchQIew7y6I4bH1I+h8HYCEaGKSv/iGF7dcq9UPc6P/aTcIfLg6cGzUH+zRe+tWpgty66gQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(261009223027099003)(11063799006)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JOtp4AyZ1o0M7+s78FBGUkcci3VIkpHQbP3Q2/vX0BD3rtha+dGzJIbDWjLEvUwXdP2WWqEZaDs2U754GGFoGEO+ZfkIY+tEY+NVWLVUjruSQvdCwBj8EfNA2wytIUbX3xsV34lQK1iYTuFzAiRhfMyWbLuTMyRPKkG4u4e0CIfADEdpMdVQw6vbT0wHcIPX5uElw2C24YiikEe3p0lLUQerAzKrDko62TDYVr9ULRv6sEr6WjqOiBP8gFSLr7D/G7Wmuf+nWKzbvi1UfwUG4eIeav0hPuWko+dBK7A8EXaUr25ZG/4F3nC5U4TncoCGj90eQ/W4M3WPqjSqUmz3BNcTZadeULXb+EafORwiPXwDAz68DxSHo/y0EOBhDtfGvweXCJEeuwpbV82AufkzSKcc6hPFxzXW45/1QflyzZ2BiIeegz5dZPIxGGwGgRKC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:14:56.3650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a0509b-8eaa-4a4f-45fa-08df29e460e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB677107

From: Suma Hegde <Suma.Hegde@amd.com>

This series aligns the ACPI and platform HSMP drivers on a common
sysfs layout and reduces duplication.

  - Create /sys/devices/platform/amd_hsmp/socket/socketN/ for the
    platform driver, and matching socketN links from the ACPI path
  - Add platform telemetry sysfs, then move shared show handlers into
    a new sysfs.c used by both drivers
  - Expose per-CPU boost_limit under amd_hsmp/cpu/cpuX/
  - Gate read and write visibility on separate message IDs
  - Add sysfs for additional HSMP control and telemetry messages, and
    document the shared socket path and the new files

This series applies on top of HSMP client series v8 and a rebase of the HSMP
dynamic bitmap series onto client v8. The rebased patch set for dynamic
bitmap series has not been posted. Based on the changes in client series,
dynamic bitmap series and this series(unify sysfs) will be rebased again and
sent.

Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>

Suma Hegde (8):
  platform/x86/amd/hsmp: Create socket sysfs directory in platform
    driver
  platform/x86/amd/hsmp: Add amd_hsmp/socket sysfs links for ACPI
    devices
  platform/x86/amd/hsmp: Rename the HSMP_BIN_ATTR_GRP macro
  platform/x86/amd/hsmp: plat: Add sysfs files to display HSMP telemetry
  platform/x86/amd/hsmp: Move common sysfs show handlers to sysfs.c
  platform/x86/amd/hsmp: Add per-CPU sysfs attributes for ACPI and
    platform
  platform/x86/amd/hsmp: Add wr_msg_id for sysfs attribute visibility
  platform/x86/amd/hsmp: Add sysfs support for new HSMP messages

 Documentation/arch/x86/amd_hsmp.rst    |  33 +-
 drivers/platform/x86/amd/hsmp/Makefile |   4 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 331 ++++-------
 drivers/platform/x86/amd/hsmp/plat.c   | 412 ++++++++++++-
 drivers/platform/x86/amd/hsmp/sysfs.c  | 762 +++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h  | 112 ++++
 6 files changed, 1420 insertions(+), 234 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.c
 create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.h

-- 
2.34.1

