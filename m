Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFB715C144
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828276; cv=fail; b=dabYLwWq0pkb8368u7T+k7e54wpXOwSk5rIzzSrURREdW6+hb4aZ4/IDB5e+BoSkgDYZgR2l8/gSX0FeZ9z28FYgw1Hg+bFqp3JEJT0ROPnAHlM/aOnjEbK94f3O4OhG+vc8ioYYbkF2AvEv1dqzZ3TIkpFMwDw4VAqK/7etcGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828276; c=relaxed/simple;
	bh=mF/UrjtUYfAlNQo4geDB3cgtANUOKP5uY9UI7cTGbuk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d2EsEijqPQvhuxMncIAbczRmkgi/8a9mc1KUMaLZ72pxQWm29N+HaAwlnr1f1ieVY32ouF4B/e/rUHPgtrwlngyGZ/drNdH7iuPt2+7quPShkTUfN46RAx3SF8dBLd35PUoqiZ2RAwGPo9nGYst/pYw1/E4JMr4MURS9ZIFQHNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K8NuhK3S; arc=fail smtp.client-ip=40.107.244.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K8NuhK3S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8SU49JTolCCQk9F9f4CWknwDqbIxkLBbJwXmnbf7cLXQfWvu9BhzlkOVmXvFVQQBxFF5xQVYJcBffg+cpaunrmLayQF/mshrL40BYyWLAiShBeLsG86rbl7sbNdG5T6R6WI48pStDGC6KDLNDyHKK+Ts0/MVvUUSpbJvzYaQPgSG6bfT0s3TKN+J1ZPSCzWCEWyfPtKHzGTUiypibZ0WSaTT/LjgEN3UQk/HPcmO+qAfujVumIpcxW2+8q/xYjW3EdzF2ZkPxIMoHB2ZfAex5XbwIwU/2SOgxTgVS5PNHReQwtza901AhWuhIJnvSgDjhgPe4Vg6grug1j/d5FplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1gyCRQiG/FnvV+ezaPBZCkMnLrPaY75NCM5hWIjxGI=;
 b=Y7ouQX3g/lw//IVDvjpJxlB5rxAim7EInQbeJS48iWJ3F8441xLAtuTjmzgE6dd2+Jt3BM4HXmBdgee+rU/NGn3RejkAQdmjBpy6o2uDkGpHS5yCB1mVSEVXhP1NtXVKFyUaYbyyc6g2me6D+Gw8FhpqvxKEknx2EBDv7t7xGYy8iSU3aKwCSc1Exxfaik6AqycCgu4tiQrpVytnC/Ozs+vlGUDw3Mx1GgCyeb4N+jQw8DTfkeSZMWKMEfeOypsZVlJgu2SYEhuCj/xM2hLRUuXQPrjvlvt5NDSPTJ78szh7l4BFT26LBbgrkU3JeabiNwvRZ/845ZDk9vdvgiEgcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1gyCRQiG/FnvV+ezaPBZCkMnLrPaY75NCM5hWIjxGI=;
 b=K8NuhK3SoVD0vROxKMugZyiyPQTrfDXRz+xyMulYadMHAEkEMAZB3bgzVWKEXi/3J88TtftjsfVbyEbYDUIJmy/PZCpeBEtoqMovvfnQSc+/sgDuMiuSrdOtd/UXEVr8eF8TZZB9uf8Hi5S3PPREV9uHUZEOTMi07phvVOhUN+0=
Received: from BY3PR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:217::13)
 by SA3PR12MB8047.namprd12.prod.outlook.com (2603:10b6:806:31b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 17:37:51 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::f6) by BY3PR04CA0008.outlook.office365.com
 (2603:10b6:a03:217::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Tue, 5 Nov 2024 17:37:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:37:51 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:37:49 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 04/13] platform/x86/amd/pmc: Invoke amd_pmc_s2d_init() Post Debugfs Registration
Date: Tue, 5 Nov 2024 23:06:28 +0530
Message-ID: <20241105173637.733589-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|SA3PR12MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bff37da-2d81-47b7-d33b-08dcfdc092ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FPt3jxczO7hY9HMllBwUK+U2NnxsNGXHowZ/fOsqcqPnKZHynXLEJFXJU4kw?=
 =?us-ascii?Q?Lij3WVmmlWw8MIwpZxmnE4x3ww7zvKbD5JsWZUarIiUPYGnwWqHDBjuLOuJr?=
 =?us-ascii?Q?XwrNM6wAsqYCQ6x9zLeS9Q5NzaobzXTEhAWuM/CaU4JJxcKsJOzddflKV6tj?=
 =?us-ascii?Q?kT0ZFfj0P+XCh0ACR1VEwnuQFjORpt83Sc8j8OYY1KC796TJvPAU8yDKY6Z0?=
 =?us-ascii?Q?kEyPSPiKP3U7LbSxlN/LcPhO0v8PvCEUskDtSKrM622/M3C1SbuRFJh9b4A4?=
 =?us-ascii?Q?qsWQPwR5KU3dLgmdNWzDQlAYnO/641NtxQs0doXKYFP46MvrxVJoqcJsQLh2?=
 =?us-ascii?Q?5QXa4mm+KhAsJrE7wSVZdZPAdJptZqrZdU06BlwWtxqpUcRp+QWoIGuT+wn3?=
 =?us-ascii?Q?pIIRM4vg3V7EpxP7Tzg+reuw5a51AVsZH2s8TSUJGbXh8EIzv6ON5WFRTQlo?=
 =?us-ascii?Q?Wwf+vJZap17DrfQZYb+rJnA2ShkslidkpiSTU0irSxeD+K6gz4PAuL+ElY1F?=
 =?us-ascii?Q?FPlh862S9BXG3ns6X/Rb4ss69lIX5YE1pbuvuudlkM2pmq3eWq2qRY5wekag?=
 =?us-ascii?Q?qv5wiqlVtfEMjngixlmRaW/ZcDjHzqBkpoTFloLwRnvMCnRlfeZJ4i7xUotm?=
 =?us-ascii?Q?0dFmY2bzTu1Ceb4+kjEyiL94Jh0XcawiRxfwrpyzODPme2ZVv8vQr5Ve5Thl?=
 =?us-ascii?Q?CvJaODtdI4tkqQDLSUPK0khs0zDGmIIVoT6FR7kdP2ad86XoslbP5PrfBJqu?=
 =?us-ascii?Q?muZBp2L/HjmWTElDqTq/iDDFZ0yY4ysZimePZ9rmSV4ZEoi5xoqS1HZejYVd?=
 =?us-ascii?Q?UN3HNU1LTv2nW1i0jPTDZjgSUZc5iabVBmMdWSIJ3ZoJKUtniA2Nh9vamAJV?=
 =?us-ascii?Q?yNOhxEuuVpb92vnl4Xj5/smd08Sxz49AmeAUkrgU5LkDi3ajrAfdPm5VZdvY?=
 =?us-ascii?Q?1goRrdBLLr5w877TjAAQrMSuEaDzbF4ctGfmDsGdDb34CC8zXYKp7BKtpsFL?=
 =?us-ascii?Q?px7NpzN7cZ2wbBl57KcG3+P+stNJupYyWQANtJkcd+OHRFSuOZvNPBuzgKWk?=
 =?us-ascii?Q?Ocmn64ZgA5PQaqK9ozLGiBJ3RPOjKvVoHSjcqeFC0Kir1NxI/LGGQZ6KOOdt?=
 =?us-ascii?Q?mMmxT4P8y33kmOylXByPCYvFTVK2GqEZNIqAiEq9sIRj9mRBePDE99b1m9Hu?=
 =?us-ascii?Q?6lJQStU5YqzbZ8U23rTohClDCQRwSHeg9/7TcFQpsNAlmSS8VejUcP3ho1KO?=
 =?us-ascii?Q?zS/P+uEaP/JWSh4/+qUEYQSMNfQxZ72A16Tb8sPQQu69Tn8qF9if9TaFtNqe?=
 =?us-ascii?Q?zh0CRdo6L0yAWHul5Okt8sLAu21sW38gvW1oSYBMHrPN8AbrAgSwGRMV2PwR?=
 =?us-ascii?Q?LNhx3cRylG5KfEZ5Sl1z5jo3NBnNKxlhD4kcR4k1dS7VaMU9WQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:37:51.4553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bff37da-2d81-47b7-d33b-08dcfdc092ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8047

Relocate the call to amd_pmc_s2d_init() to occur after the creation of the
"amd_pmc" debugfs directory. This ensures that the driver's root debugfs
directory is established beforehand.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 58fdf044fd36..6ebb9123ba00 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -822,10 +822,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	/* Get num of IP blocks within the SoC */
 	amd_pmc_get_ip_info(dev);
 
-	err = amd_pmc_s2d_init(dev);
-	if (err)
-		goto err_pci_dev_put;
-
 	platform_set_drvdata(pdev, dev);
 	if (IS_ENABLED(CONFIG_SUSPEND)) {
 		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
@@ -836,6 +832,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
+	err = amd_pmc_s2d_init(dev);
+	if (err)
+		goto err_pci_dev_put;
+
 	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
 		amd_mp2_stb_init(dev);
 	pm_report_max_hw_sleep(U64_MAX);
-- 
2.34.1

