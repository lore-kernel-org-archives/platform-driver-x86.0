Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB91C1D0E0A
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049756; cv=fail; b=n4btItWPVyMVqz3pvvGhRy5yqPumQ2o1sHQ0WCkUGi4dLvWyyVtDRZvVl66xIOrglmCPG5LZPvt7SL1K/KURPI7MaloOa5wSePKMx6qZxZqUvWBSua3fhl1p1xzlJadbQIjmbptKXkxfb91wF0DcN08dfXRUWsmyJ8//1ftImQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049756; c=relaxed/simple;
	bh=1zmU4MJWpnOYnmkqelgb3NHmz1WY0wIpMGM1j5vTX0g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aStzn4YRJRGoA7hYvaEc7YCPRwMWp80KbFHP7BHUGOdviRAaLIgTDrZ3knga5J3mjjkRsEPI9IIo68+LtoxJ2NbbRl3C4QEkArE8TypW1ulZInGJf0hzpLiW/tARG1i/3gN2Z9hXbbIlhTvIrKqLIhD3zUxeVQAMOkmCEkzqwz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=48HVoFtc; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="48HVoFtc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9qb1OAXgwjWlAFfgYsulKny3w7FCuQtMr7t1wJDfJqkbf4ugx6yDFVD+ubwFIK6ibtVNRmLQWzHRNriQpd9KOFBNIgH2af3wqdgKPzJxSfltHTA9mPLwLjm9oAhUXgVKzA9yuzUbuffwIGKijdzHXnCn2aEDFpJwlVkVfBoIa2guS7ABvaQxGDGdV/vyYcirw9tpGW7V7UCo7gOoE29SWVO70BuQgVIYG3OCGREY/7v4h63N3PlPDi/zTBlwnjyad0OOxzzu1lELX0BIwQX6lXoH0kzy5ym9CLpPVCEu/w/oMa/I5UjKx0EKzQD8n4XLItjOo238i16IKq7F6Rafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1UrzplS2dSMPpffaIwHHPGrVpHf6BiGofPRAaB8DCs=;
 b=wJByHw8cxHfnyCxLLXH7yCI/1Qb5dwVIikoHFp3kuf3L3XTepAariofbDBIyhe+g+po1fBnDPvnOpzzqjCDXiOAEDfkOwvxAXY1Iuht+oNu2fKchwB0BsG+X/lK5Ch6+HL7qVDMuv8jSpQc+6osWkLGATn59/8zy0lWMZNnXguuHXR6zSmmllZBmdPE5xvY80jv9OOOUjmjSo1+tUIvyGm50cD4Jq4JUVqDE+O3aMCHiO07pUpIGXOxiyBAqPwyQVEkzKtQORFntakh52OIBRUv49UpMhon13pxE1BEVHVya0rSjh9HDSHiSwYmdXra8RFszX9qSEjqyL04oW3fJNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1UrzplS2dSMPpffaIwHHPGrVpHf6BiGofPRAaB8DCs=;
 b=48HVoFtctLAr3OI5nFleXP5Oi38PX2U8OpcyKzzpQuBF5uUX/FtN2fYtxVVkDT/RtJj2VWBoUPkkERlSXa9ybqcvmiaEzb0byfOEfPdZevtMKR2RF3VHc2hOUkyIhUEl1JarZCPIc53e1Q9V23bVDLTA6rgB310cJpiRVflsq/U=
Received: from CH5PR05CA0005.namprd05.prod.outlook.com (2603:10b6:610:1f0::6)
 by DM6PR12MB4187.namprd12.prod.outlook.com (2603:10b6:5:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 07:09:11 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::92) by CH5PR05CA0005.outlook.office365.com
 (2603:10b6:610:1f0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.10 via Frontend
 Transport; Fri, 8 Nov 2024 07:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 07:09:11 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:09:08 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v5 10/10] MAINTAINERS: Change AMD PMC driver status to "Supported"
Date: Fri, 8 Nov 2024 12:38:22 +0530
Message-ID: <20241108070822.3912689-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
References: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|DM6PR12MB4187:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f808b8-aa0f-46dd-4693-08dcffc43ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0sSawPnpV4y0LhEEI078qbdxCFcyeTmsrnKf+GT+QfjGVVvbLIAtEwH0Vauc?=
 =?us-ascii?Q?PFEOw4WQj7A1MR/8gzCbOQJNWHyp12FtigVLQpohktVYPXuPuPxjLdwaq9Gb?=
 =?us-ascii?Q?O5bCBh9f/bd0MRuGnZCBnIJaK0or8M0uT1SEBN7sUQWV58IkJM7T03KCd8vx?=
 =?us-ascii?Q?xLlG03Jkl+Do+CiUfWaaAudjP7tnvC9ygG6g2kUKtJNCY+Mt19uZxsm4Yhoy?=
 =?us-ascii?Q?Qx5Lht65pexSYmJwo8qTsPae/1Hev+JLfisCJeQ/tykvgrqIupx3ptRqWiQB?=
 =?us-ascii?Q?j6pJjBw+1sr5f8vWWnlhQmvD4+d7mfcbPV6OUbheitdIL8xVEX0wIC2srsiy?=
 =?us-ascii?Q?8x/EohelqZDlmx8Zaog9dJqjmcZffnTN/4FHzizmqZWfWdA0hLCWCdpxItL5?=
 =?us-ascii?Q?skJXN9lHaC+G0j3aY2J2Eu2k+b2VDImW4wResWtDCwxIcPwaZ9QliYOFJsWw?=
 =?us-ascii?Q?7dx9OJ0NVQk7dyclRLygj4dW02FmkUPJOTrJEFXURqNJITFdepAl4aMujrwN?=
 =?us-ascii?Q?l3d1QAkVa1ayJf50nU2Raia4keAlWeKHwm1+mlcUTKde5zXVIvmBHQZ3GZcW?=
 =?us-ascii?Q?A2piUNKvXpQk8OLblvfHe5fpCxYEcI6cgciVCYMlMwQKGgc/FOGR7UgjH2qR?=
 =?us-ascii?Q?GK42zpWSpe+WKJf4o8ZTeDm6La1H8M+4ZwXdAP3l6MimY9BDo8pJO3Qoavvv?=
 =?us-ascii?Q?5Bi7jT2sr7ou+SzKL0mvVsRnA/xnpd0jO+ZnHRrIa60zEPr26Eb7QeTuJl1O?=
 =?us-ascii?Q?6MsT4Vyu/oAgRaOMxQ8Ju2FT4th4/EE6tJjkqowZxSPHsTAmizWy7BJ8kqDg?=
 =?us-ascii?Q?cCqtzYJe3/T+l7AWaqHEAGqTrSOj9zzQGp4uiW1zgYfneQSKNu8/oy1qzNov?=
 =?us-ascii?Q?h1JQimvbirzGomh4jH/jXbARHoJdXabQ3U9n54Avooex2YB/9HaoVVUn3JVe?=
 =?us-ascii?Q?LFKP8f0ryLblCl4deSMwTbCn2c0f7464d+5r9Ate5+NJbNij/bCkD45pS07+?=
 =?us-ascii?Q?Mq0Bj8dd6g/tKz35P1/63EW2bCbbZiVb62POi6iVe/VKWkCLFraSUGeNlfq+?=
 =?us-ascii?Q?YYp95U+hc6aBT6/Hj35P4HhN2d1L+hB2MXbV13MIw2MCaASO7x4dRXQODxMb?=
 =?us-ascii?Q?OUk/j3qYvc/eisG8FtbM7cg2MxqbGl850/1qKIzCX2hNnRhz3OuJ6rtfBpQt?=
 =?us-ascii?Q?UqVS3B4u8ZEPhl9qg1W5IKrfVmU4id541qGlqRRcz/xzQcmoC0/v/YySSrHg?=
 =?us-ascii?Q?3N5i5bHCW2InTaF4M94wrE9XhXozOMHr/mY4EyQOtm1ntOsmwdScudI1pe0l?=
 =?us-ascii?Q?tNroxG8o4F5PZ8ch3F1OF5ZXmLhtUPDD0pSCHSHTA9EbqS0IBrTHxJJfRida?=
 =?us-ascii?Q?wNRYF0Va9IcN2kP9zAEyKCVNvnHv7fjVpQnQca4G5f8ouluYwA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:09:11.1340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f808b8-aa0f-46dd-4693-08dcffc43ed0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4187

The AMD PMC driver is actively being developed, so the MAINTAINERS record
should reflect "Supported" instead of "Maintained." Update the MAINTAINERS
database to reflect this change.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 273a84483b74..bd13bea1845b 100644
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

