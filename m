Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E6715C144
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828268; cv=fail; b=CufktBQSETO5cdSRi3A4Sq/9Gyo7+fVC7q3saegq+KXdrKDBXLtW0CPzOzXdvr18N+yEdfOHTwCMsGPbpPVwrOSWkNB4auH3ZqUrpOi51fnwS6t8mRbUZ0sHRlipb4NDjntVCf95f0oD3bEk0aVnP3uUrmxhvV5PdTWCS3FGi6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828268; c=relaxed/simple;
	bh=KaQ1GapiwFU/flv3/LNB35xrwej3eHRzKrs/AIwQF7E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IIzyVLj4XZca8iEccoF/JE0VKBO+aMsdOrogfyXQOpiTdD0cBc2YvyPnfe3PPtjXybF3FkrK+T5H7T5mg65d9n3TGkwrUAwBMTBgZK3c5Viy+yxuqrwXee+m1TRAYGDkPf5OieEppiAMewKPStuyHvoKZKJyXxKdqJbb0gzBNlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ylbXFuz6; arc=fail smtp.client-ip=40.107.94.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ylbXFuz6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SX3sFc+DG90ceROHSqSM/6NI8bhwyrqJWndubGPsDztE9Wtph0Q8H54QL7RxSn/u3MLyzX8DH/EkzEJIU7stTbsEKoTbu5mSDk67ZMTNLDhpujfEcYDOAgAImpGEdMk3NUaAPdPFXKmfXdrDVgzg2hztzPhbY++/ZJtL+62OjQC4+EHexOSxRm+0qcCu+Nu4v+I5sGCVsSa67pFZMrCBlPf8XoCKEwJ8nCdE3ESFxnL01Pydx2fClhRlTy3phiYmjmag+pV5QCA6da9mJr60l3GpLr1LAM4h2xsFPjSs66Ef8flOQxQ+mXcuy/+QXpM/UJ+E/Si3FzpPAynGQtBpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+4a6oOfCD5CD3PxptwdRWPYbvtTx1pmJgQWvWThvPo=;
 b=i7EDOPtgHPFJ/xK4VAAoDv3g8Gckist1lG9PUmV4eK8YYYVAmPS9X1k3BUjltXJgpGG2e1slsruc5XMjZNjiDHGWzPJMiu/IJifrlAIm4CDoYRNK+JqGGje3W9aOFnn/C7TUybWNZMiqAwTZL+Ez/nbT6pRiy95bJlhI/b3MKZhJ68OoLCh0t8I4rF5bUcQDvsgb15lO1n3XhYn8f5CLBUdiBHSzhvxBgcC5OzT49+kiAsvm0/Ju2Q3rp8BDeomN/YFGqvADi/BWJclZbfdTRilT8lBv7Nf348btR+/KBD7I0fiYHaMNInM7ZhAkV/w+HMDUyPKd2MfEscw8ouh65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+4a6oOfCD5CD3PxptwdRWPYbvtTx1pmJgQWvWThvPo=;
 b=ylbXFuz6tWLmuHDQNFr2Ys8KphWyw2wmPgiG0qNNnF8KPklq8m3hiIfjK+c7CKdvEG8pVzQTd5M+baFqYlDGXk7tLM3jT/22+4q26C61uv4vcZTb8u84tFWUsrR8B4tjfP4FU10jpKyHQ2m3puMNyRpEFD/BIQxDRNgKCIm2DJA=
Received: from SJ0PR13CA0170.namprd13.prod.outlook.com (2603:10b6:a03:2c7::25)
 by MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 17:37:43 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::11) by SJ0PR13CA0170.outlook.office365.com
 (2603:10b6:a03:2c7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.17 via Frontend
 Transport; Tue, 5 Nov 2024 17:37:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:37:43 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:37:40 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 00/13] platform/x86/amd/pmc: Updates to AMD PMC driver
Date: Tue, 5 Nov 2024 23:06:24 +0530
Message-ID: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|MN0PR12MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: b22d8d5f-a154-4b64-d570-08dcfdc08dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k6hHe1oGkt+gYa6itJclQ4NilG4XmDiwHWsM+NIiPtOB5kP9jG5vXxsvrniy?=
 =?us-ascii?Q?2GTGZIzNvkexkSftZqU8JKKloV+p85FGPiSn7v80WzWQ9WEWRHTtN4Fv5GJ4?=
 =?us-ascii?Q?TDY4GCzuGwgcEFiLK5sEBHOWfna93ka4bopUq7jmVq5dlX3vnObjO3Czeq14?=
 =?us-ascii?Q?xbpNxoIUs/lpqKQZ8PM5XFjNzen6qZyb00r1y8HIKko8gyUaIzDa7WLa7sdk?=
 =?us-ascii?Q?u33p8jG+xEHoF39qJ0pkNpgBANZjgYEJv/70z6Dg8NrIUmvCSVSe/K06mRsn?=
 =?us-ascii?Q?oTJ5SLay+9knln3/32aLjqRZBKMRVmiOsBa2ZEEfIhjILMD4YY8lOoNzgjCt?=
 =?us-ascii?Q?SxRD7AMilexjSakFPiomKByIRIlK4H6Hohku/w7gAvIlPN8es+T7DpPnzL5i?=
 =?us-ascii?Q?4pXAk2adkUct9LX1g5+E4DWxI1CE85mHWtFrKczUrOShvO9VCTpsOI+ksFsP?=
 =?us-ascii?Q?eBiXDZryq5GQmiF6OhWiOaytrvOV4uDJB4F195t9/ictVe0o/agRTZmgg+vJ?=
 =?us-ascii?Q?faCnmmrNeG00mbGinroPddkXImK71IWMs990PNfz/2vGaLMPZjbVKv4OSuGi?=
 =?us-ascii?Q?ehlVy2hQWOrkMWZvRy2FgdmSuJgyZQCAbPYkY1ifXp/bGdbNk/yZyu9nX8ZC?=
 =?us-ascii?Q?qHCoIDaQeP4j6UcOZ8c0DVvcQDMUDB2hDfi3AK64Ex4/CCm/oxNOUHfRI8Ca?=
 =?us-ascii?Q?a9VWAUFLf0cNQDh4GmElTnEFOUznHooYiNwE/E9juAFwD8Aa9ILAK/TF3u7B?=
 =?us-ascii?Q?eg7S1hFX9Rh4CTc0sdVL/tJIPXmYfHVIRWJeuyHhRYlfpu0nyM07Qv+PRag5?=
 =?us-ascii?Q?kM+CLGpH2SU2ZXD604iq/AEzvfoV4TBgN+prFwEb6x3eM+EjCY1NjRfljbns?=
 =?us-ascii?Q?5bLeUJg8cQUm4vL4e/f0+ZE08e4ZAb6hTC+yiV4Ei5vHpO8xDELk/BsYPl5/?=
 =?us-ascii?Q?G2eCjZ2CjiHwo1vl5FXnHOBxFoKB924fBJ48u9zzDqf26T+ciUXCOkZG0eKl?=
 =?us-ascii?Q?aAY9IrEzP7gLYOilxWTzizhQmJfNjhrmJD/sghwztESbwjN2izN/l6n++LmX?=
 =?us-ascii?Q?DJ1TrydZG015OitA7Iyj2rMHBI+TJtz6I6Kn1zJS+l8BWC+/UCnmNhsBwJxJ?=
 =?us-ascii?Q?f45A4kryOhksmoenUAyZR+jRMf49mdtG3x8uz9rtW4vLQ3QADm79uAVlXzUQ?=
 =?us-ascii?Q?eEe/boOSk8mL+VXw/tjKos0ZHxqzdVPIm7Q4kFn02/MzP+Het2rPUZLFCDib?=
 =?us-ascii?Q?/OTTQhTGxnhQKkNSt5zJyc2qtSKhcK1WBcW6m01KoPKJOCDpKJwyKDOaVNbl?=
 =?us-ascii?Q?Jed5pv/uXnKm91XpAxiFJuFTpHAclUhAPOmrzytwcP/QG8cSwweHkVexylB6?=
 =?us-ascii?Q?5WWHhsrv2+l0+mrQpnBoZR9Y1axC3cBgpuUu/cXdarmkeAm+Ug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:37:43.2699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b22d8d5f-a154-4b64-d570-08dcfdc08dcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787

Updates include:
- Rework STB code and move into a separate file
- Update the code with new IP block information for newer SoCs
- Add STB support for new generation
- Add STB support for Ryzen desktop variants
- Updates to MAINTAINERS record.

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


Shyam Sundar S K (13):
  platform/x86/amd/pmc: Move STB functionality to a new file for better
    code organization
  platform/x86/amd/pmc: Relocate STB Debugfs to a New File
  platform/x86/amd/pmc: Skip Completing amd_pmc_s2d_init() on Older
    Platforms
  platform/x86/amd/pmc: Invoke amd_pmc_s2d_init() Post Debugfs
    Registration
  platform/x86/amd/pmc: Update function names to align with new STB file
  platform/x86/amd/pmc: Define enum for S2D/PMC msg_port
  platform/x86/amd/pmc: Isolate STB code changes to a new file
  platform/x86/amd/pmc: Introduce helper function to set proper string
  platform/x86/amd/pmc: Update IP information structure for newer SoCs
  platform/x86/amd/pmc: Use ARRAY_SIZE() to fill num_ips information
  platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
  platform/x86/amd/pmc: Add STB support for AMD Desktop variants
  MAINTAINERS: Change AMD PMC driver status to "Supported"

 MAINTAINERS                            |   2 +-
 drivers/platform/x86/amd/pmc/Makefile  |   2 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c | 337 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     | 363 +++++--------------------
 drivers/platform/x86/amd/pmc/pmc.h     |  15 +-
 5 files changed, 415 insertions(+), 304 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c

-- 
2.34.1

