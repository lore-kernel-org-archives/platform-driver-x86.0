Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2C580BF8
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 May 2024 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715337622; cv=fail; b=Mweu2XIvlcn3IrANv7asWOVwTJUpaPb9ngZn4MNnt8EyBlRzX4tzX/WHfNvzNT8ZxDnYJL2/5wikbTM2nR9mX9tegVPsXbYwmwx5pLUDmHbXEFXNG9YQvYOPB1p/SGitpmDvX5WA4AUIDe+XCkgxC4I4aMKKPabe6G4xuMBjwy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715337622; c=relaxed/simple;
	bh=X46x3IkgW5WVDO1BZkENtp1TdajbGNFZyTQTAsNQ5Bg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FF4K1GIvcQvSRdroZuXCRhCIPVoxx+jrcNmoqVPgVkQPCm4Cz/CllCrh+14eIeHNDabr/8JQZe/rksGx0rJdTfYnpr4Hxx61BbcFx9ZthwKTaJQmJp5cVjVzSo/awjeWWXIGSlmhba58QTipSNfyKjWd7IUjxq9Hj+xtyHL5cyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x/BE04Xl; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x/BE04Xl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gjs0Ule4NR4+8OUcn9zCQ39nofB30ib4sukpn0qinSfbE5N5nrXgEnt3Bn0UQemYdqkCmLE9FPBDgJmFmzuODlVcNJlG+E+5K3Qu988RvRTEK2uH9d7/1SZtlbz0c11D/gGqPeHGnkjTlEOvhNEbe6TilwobSl7od17Z2EMs1OUshsIVfbJgVjOdX6nrLondvfTlUvbCCxbnkSjQgmBf03qbkpu5gfp6COKLGjpN8a8BnLYZ+HPEu8B7x8xHVCzytHwemVCG8h1CHGMiQQApiAf6rv+BPX/HllkRJJg+e3ueAiU1/Q4FVhNZ2qiBPBobdFKO9F1U6rdG5D/99G5GMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NSE96nKg0bfmEi5Fmb/j/7GRidfzUPw3I6eVyvSO2Y=;
 b=GgqsgLJ2JKbST9pgnkayPHpkcl8CMkxm3wAlHX4UvfgGrb5dwb7S7m+Jy3ItyQ6xUIbEjXJG/mYzkN+P4KyfO+zluhj198fTnYnr2Cg2RkHyaxq+xK4qyWYYG93MtmTBkwmkrxXJtkF2hbPfTorlrcWYCy6BFk2sg96ckolj1NWi5x0Zqt48+vr1yCCDokSnmTL220B2ny9xZpdbB+r4YosDKPWhlEdc9lKOMChrbs4IN6/sQ2mM4CNnZcCN8enMahGem9ZET7bMW9wHuf4ThqI1kLLsUJAUzjIQ9fltAXbpeQFI4U+HqRzRBQEliXKD8nLvNovrmh+ZgFvu/hA2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NSE96nKg0bfmEi5Fmb/j/7GRidfzUPw3I6eVyvSO2Y=;
 b=x/BE04Xl9VKEdTq1ElcNwBQYYR0nXuc+74RueoVTJ0WD39wW/hmVyvnun+veKXq6NnV1xAzZ0MjmEqzc1HaKHzBaoSM4z8F27L95iq1+U+BEwNXCfVHXldofqxfpNAKRL2lKw7geiiM5yGid7Hhnj/pt0rw5mgt48JMQkjLCE0Q=
Received: from DS0PR17CA0015.namprd17.prod.outlook.com (2603:10b6:8:191::23)
 by DM6PR12MB4108.namprd12.prod.outlook.com (2603:10b6:5:220::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 10:40:17 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::42) by DS0PR17CA0015.outlook.office365.com
 (2603:10b6:8:191::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49 via Frontend
 Transport; Fri, 10 May 2024 10:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 10 May 2024 10:40:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 05:40:15 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd: pmc: Add new ACPI ID AMDI000B
Date: Fri, 10 May 2024 16:09:46 +0530
Message-ID: <20240510103946.877307-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|DM6PR12MB4108:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f451f8-6f20-412a-e858-08dc70dd955e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jwdp3OUJOlNz+tvEirSrGsJ+l5tOAhRbPWxg4DhrYFaGZrqqWkhO+Dqc8rAX?=
 =?us-ascii?Q?RJHCK8q//CzoKeMuSbgV2026l9Mb1HJdJCm2wfB7QdYqeU7ZIbzkoVUOU1zG?=
 =?us-ascii?Q?APV1B7+ELn6Kpj1B7WB8brk/ybRbr4kv7n0dRtYluUfpqx3E0EQpKHMugRC8?=
 =?us-ascii?Q?flWwL64/lqhsanoQeIP1ZQUiKQZosKDCg1Z6s5A63wcFUCtAtATUDdwbbJd3?=
 =?us-ascii?Q?u52J/JrJnDMAqqjOknSGhbXyVu8LSm7bdFCNMhDBP7f5PHV5E3TkGrckll9e?=
 =?us-ascii?Q?y/JKWnu64TBO0VHZDaAT7QYZTw9H0QhzSaz7YtLb5WYkiT32AQXl0f/FQkOU?=
 =?us-ascii?Q?fCfTRfZDRuPmkAz6rahqiTfmlBerNkemjERequN5WnoGmKBD4yHU+yCPVEKd?=
 =?us-ascii?Q?XvbOQdToGn36kTevokjuW+DWBprpt0trw0sg4q7icdzMQABdJzqXPUZoF3dP?=
 =?us-ascii?Q?ORDekufUH/jKGrtVJkly0URTTxsxIIyyBR1ko6K+jCE4wdRNY9/KWS3JRat6?=
 =?us-ascii?Q?MYw8AuQWb7kT9ECBBT+TX20gO55ZdKVvqw9WFDD3v0aXBy1bPLkQz+tgJtdI?=
 =?us-ascii?Q?y702XNWNSG+orYHaeoocnhEP+i2xEsP1FcDXQbd+k9hjbl+2CemB+OTmt/O5?=
 =?us-ascii?Q?6HUyBgd792e8KBWZ7hekbhHTZmd/o5poq6iEku8hoZdSpdLLbS3da+r9up6k?=
 =?us-ascii?Q?aQkHiOVkQhww4bUCgtQdCXzup850eXgpuqloyzCUbfUR2zwEGL1oXXgwtpSp?=
 =?us-ascii?Q?tQXTs/HOYF1p+/hqyzl3mnQ61c/4KxTpbeQIebRiinNSgBaaDZBdFh+YtbY8?=
 =?us-ascii?Q?oXt1ejFMNYw4t88vKS7hGAijXJiby33SJCBk+iSfGpRKCTH9y9nmWBozrItZ?=
 =?us-ascii?Q?Xmqu6hrJweutyZlge4vy98VGsjlrOEdYVqDeg5a/2RK0It7mWncsO751cG9G?=
 =?us-ascii?Q?g+L+QFhpVCpCU5/vf+wptVzvubf1Nw3k/NEJTyTVbGwrb3KQ789ZZ9AJ/GZj?=
 =?us-ascii?Q?Nj6lNXKH3RjJDTcGhbLAuldjAEpZ0KypCzd9cT7/iqCGIcNba+W5ZmJzhe1y?=
 =?us-ascii?Q?c6H8VK9dPKs1PAAn4TX8X+IZJsiP4u4TuBA0aC09BTkd+etvhWW/u/qTo0+j?=
 =?us-ascii?Q?v+2gw8qJXgVt7tgVdjljyC24wkfvcKlxk3I/l7mXwhm4KfWVvriMWIRqwERR?=
 =?us-ascii?Q?10t2Lx4JvxIs0EWnLndMOQo6KVU81PLf8ts4yfCB4F41ABanpfgY6xyIBbAq?=
 =?us-ascii?Q?DwSPL0jMTplH9xYY/Klg7iHvXOKOuOXQO4UpqrDQzk2TqxY/1EBSX+1dt480?=
 =?us-ascii?Q?r6UAew1PBFzOwEhCWaSJbTLtGe/CyM4OuJhYHnfnpPeYPrvxSZOSIBOnEaAV?=
 =?us-ascii?Q?YgkWBdGGrREv+rynZXiruJ9ky/I+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 10:40:17.4938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f451f8-6f20-412a-e858-08dc70dd955e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4108

Add new ACPI ID AMDI000B used by upcoming AMD platform to the PMC
supported list of devices.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 108e12fd580f..239e073ea663 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -1132,6 +1132,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0008", 0},
 	{"AMDI0009", 0},
 	{"AMDI000A", 0},
+	{"AMDI000B", 0},
 	{"AMD0004", 0},
 	{"AMD0005", 0},
 	{ }
-- 
2.25.1

