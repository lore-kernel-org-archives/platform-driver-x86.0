Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADBB197512
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 15:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217343; cv=fail; b=dImsb2subszKNj3m2PDJj+UlKSUBmuVh8hXTkfB+K0KzylSJpkNbZPg0jJVjjocFCk5SdoL9FjgmDUhNpxK9tHz69YI+q4N5hs4aR1FiOAjaWI7ZtLwEi3sdSrYuen0C1JxGbyEGVF7V/iwX5LMvmquz7Q1ssfmu36SwJNgLMnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217343; c=relaxed/simple;
	bh=7Y2XP+lZCOz7kfCIhmhgw1H7In38gAeWCGbKxMingUA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VKyJ+y7syTD4Grizf0X1mpak4pgs7bh/4IP6aqmiq3eVG5++vDP5h0pjpSEMC+YCQUd7a9A93zOuG62leWYhoFqHyMsyfgQgFtsDR6QMBPzkn+XoLf2DRI880vbCataaGke4wH2cWKoWnq7Hn8BtJmU+meLmTwvDxPMapbQPstU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SOMdiyjz; arc=fail smtp.client-ip=40.107.243.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SOMdiyjz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYWUh9+jS6k2mQRsnVNrUxRYriqCW8GrvdYO4kPQZ6sWZrrD7fcYSdmZ4RZ/dWFCW7JLGRWwpxBIf1u3Y1NQSg7cvxWSVglMzUP0kU84zcBmAN2NJ4u/l+VixQslasdzWYL6AykOK0ThfCis6Q1fExS5i/G2LmBRRUpHOD4X1wmai2zDiPMReucm2E2XdlbBmUgpeUWEz9i8FmQdQrLSSopo8/hql/l6aRMvX8BiVqAawQNZ4wJJrFnm7w2tgMxx9WTBJXu0Vql16zU52hnn3TyEvIMIPo3FmI+bPunWXKEWOVl8Y/O01qHY5AZ8GLsPKPryGlL7IMNslSg5IctZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe78vjteOw1vJpEF7ZH9qRFRL4vhZAfJZ6Zgpgw1uDQ=;
 b=JnEZlpQnJ3aSqaM22eNdbU4xqFvcDAyajXcpezpGXrIgHJtIKdDAca/HHFxBJ9eA6vYYJKatC05/j6anPKB3mUadN2FZXS1o9awzyJfh973iIQAmBXqN2Pe/1kTOO0+AMH49zwT+JS02Epa+s+O7eUJAbayfN6ZMmOnuHjHio3C9XVIhI2qvFAyJvRCHRVFD4M/Uha04SUeZrGANZdF435T0vrLc0er9CdrIh+i7Z2+oQqtFel62/7lG4Mlio9Ep/lnOwrHrLdlj0qSHaGjT8gCIaDBnDC8XwWJm8RD8Mh3FRzhAxr+zmNm3fZCzQaYQQk+OODgDjASNeknQ62T2wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe78vjteOw1vJpEF7ZH9qRFRL4vhZAfJZ6Zgpgw1uDQ=;
 b=SOMdiyjzRI4gHjBwhgAtgy8H5mZX5oWYyxJ9E9rVijhmiIWMQqJcwudimv/5x1fE1I89iTsCSwQkHY+QEnSS8CdavYeNvg4R4xdaY7AOl0kFZMoQw3A2hKTL3QapOXDooj+xTVEv7z9AmHY93Orxced85j/pO6Gru3iS1w4PKZA=
Received: from BYAPR08CA0026.namprd08.prod.outlook.com (2603:10b6:a03:100::39)
 by MW6PR12MB8949.namprd12.prod.outlook.com (2603:10b6:303:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 15:55:24 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::30) by BYAPR08CA0026.outlook.office365.com
 (2603:10b6:a03:100::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Tue, 29 Oct 2024 15:55:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 15:55:23 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:55:21 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v2 8/8] MAINTAINERS: Change AMD PMF driver status to "Supported"
Date: Tue, 29 Oct 2024 21:24:40 +0530
Message-ID: <20241029155440.3499273-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|MW6PR12MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7a6c03-fbf2-4b1a-a839-08dcf832197d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JGC/UsCOZ7qSPJoclAxv3VPjW+XKE4QWpQSBVWQloXrgjLxmyk6ZzRG8rbEW?=
 =?us-ascii?Q?qddwgao43hIk0GNawrrw9Qmw0Y/tEmqTi8D0o3mk16d+ZSVnUg2tNp5zzd0b?=
 =?us-ascii?Q?DwSq/NkSodJGDz1VLi47EsvNHGsy1FXcnctHXjw+8fz/MPYO4m/xMYkKHaT2?=
 =?us-ascii?Q?A0e+oQWlCebUOtXtHT4bnZDVbed9EjXk44sheb/eJ5faxFwzq2Lby74wYUtc?=
 =?us-ascii?Q?Z7QLJs4dkiSwV7Josnd0P+08wHb1pbFYqqOBJU0vwDw+YoPzN+Pi7QMpzjCA?=
 =?us-ascii?Q?nFjEMSVIeBShtHyrpF7VN7DqL8YYLpYYNfzlggciY3KkNwUkFWopu5OYBh23?=
 =?us-ascii?Q?84WA/Q/hXUOYQVyutWdCb33Zoa4UJ8urAgDoQPzDTuovaTElW8NKDWlwIB5L?=
 =?us-ascii?Q?N3Uddma3g9aP9uYKqr/DkuGKSUnuId4euY2VrdQ1URykNjmhZnhxMU8sIqsa?=
 =?us-ascii?Q?LYpesXQvAGycdn7bXu9/4aDYrKC0m6nY+K6sJLC6MVI6IWY6WpZ0oCRjvUEs?=
 =?us-ascii?Q?PXBSmdf42FqL92gqD7x4SCWUpRFsOK72ujuy7owD2AjEwjTuPP5ZpasMROmx?=
 =?us-ascii?Q?vmelDxL+YLhgji3ZxAbWQQea3IR7oxPO7KpAOo9H9+tK/LiHUyHCP7anPMB5?=
 =?us-ascii?Q?vvmzIz/PLMDE1UND654OWdsHo0xErrd+i/81zto4zdjcSySfbtJ/rDUA/EQc?=
 =?us-ascii?Q?wu5khlkVSrRZnJauaFb/HXD++o1mgwZ2fWKYZWvsZd3e/kaJKh4fLSCwzWeH?=
 =?us-ascii?Q?cmoP+X2XYpjysSWM2ioNFAfqCkkHsWVgtG7rnF+9ZqY2lIRaUGyRfTWYuMXe?=
 =?us-ascii?Q?QiUKkhNSzu54FNDrWFwg1/lZhjq25+65oj9eKCP2s4d3e4AguLW9FwvhkWMk?=
 =?us-ascii?Q?485Is6dLD1L70EY5wIrzT2qACgul21sxCmevhOk0jigt8FoPcHN1ahTc465j?=
 =?us-ascii?Q?5ZwMwrSXhHGZmqGYPrn2eM4K0OiN43rDOtPqvYhRGGJM4F/U7bKy8AuqRPmw?=
 =?us-ascii?Q?Ew7xHNQ20b6xwIKy9y950fzJ2FAO2Vo2mmLNY0Tj0iuW/FV37cePuWxIpNpr?=
 =?us-ascii?Q?LsRlwKP5u8dA0vn3ochlheAv5eCg9C9suiMXaRccdVINfOD9/Py3FsDabrGx?=
 =?us-ascii?Q?uT19JxSB5QKuN+3KsZ9kN4Sm3ON2NuombBFujpFz0onTSpbA0jA1LngjDtWN?=
 =?us-ascii?Q?x/C1pTITzQsyw0pyPinNpVxvtHfaSbQ/lfI4z0TZhU4hD96oyxogrRXUfKAB?=
 =?us-ascii?Q?Lqzo8HS2fx7drnrA1nEjfqESXoSAfI2BPmuofR5Fk5hA3JYpm+rxynq0hkut?=
 =?us-ascii?Q?cu84cemonXRolOdE1kchkAb+IAXecPX0n3rt3/zAvFeXdoNNmL0/P7WNb6aK?=
 =?us-ascii?Q?oi3Fo9k1WPAiiekrar2d5bHdEksQPlYLnPRY6eCIZa0E1xGoGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:55:23.7924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7a6c03-fbf2-4b1a-a839-08dcf832197d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8949

The AMD PMC driver is actively being developed, so the MAINTAINERS record
should reflect "Supported" instead of "Maintained." Update the MAINTAINERS
database to reflect this change.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a27407950242..6594a74b3d11 100644
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

