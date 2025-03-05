Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620651C7012
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 05:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741150805; cv=fail; b=cf+kuUyAyTQQ/A+1CBlVH1oKOgzpMCAWItQMlmsVxDl0PHfNzan7RK1vOveetXgqINjCzyjAdVVm3vWMtUuCMsYN6e9b14CCkvouHCymM2Cr+EjZwd8sSoHX2lohIXtRGqRJlLa5DbYlWvfjjieXYZ7UDVYd2vR3W1Fz6asmRpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741150805; c=relaxed/simple;
	bh=7+ZQwDHpGlbu2KH2QiFR04F0zXL1RiOA3/NyHDwLIfo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VDhNu5lQKcSvdtFJSBmqn5B8XcpIdt28Jpt7vULZoGOObE0lElIRI0rhLT2lp6QvuiKhfouuaX+sR0NSBvYRCRcFv95LuVg1/Ip7aCO/4ge2ZJKZmaMjoJAH38+p7qxsDqhsQPdYJpYDyDi2P0uh+wbza7xk10YrQr4ERIinJH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ECy89ivI; arc=fail smtp.client-ip=40.107.100.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ECy89ivI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWbT+F9oYenVHdFbyNKH5xCbUC9aLnFEwEtBpyZCtV5CVoKN8jotRh/9TlKZ4cI7Br0Hz9q1JL9f4cCdxnyS/rS1ffEp0G7WB/69asOzDNRW1D3bQQcJbojPwUrKfUU9ZvIGkc9yAggF+BZREz6MR8cCg5rEmxpuncI9PnGlNcZDKdYWWOX4B2CsRx90V7Fh+hiJSJ1MfLnl5kSViP1pX2DEV54Nxb42OMgRQrgyIxV5lMYqoUCIdoogNqXmYM1gK/6bfEOhvAdFLzykSCLtVzySVbNmKJZ3vsJsAqK7fQr8aOIa9fHEeZCLtT2MaHcifvmRx1T472p7d0Zrgzal2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZRw/hzhkxgyTIhb1lO5HhwGDyGIHdcw4sEkl42bDIg=;
 b=J63ViLmVfSc8ziAqdvX074NGg11iesrSdGuFZLd7QeTIpPbFLwB+IzMvMeKxer6l7FJOMbdJShXgsCHq1kucMMZcpPeFjMZRIwUjNKUwW98Zre0eser9HGv+N5my0oYTFV75vsyVVcTD3Eubd6rH8dDHSJH9BKBhrle4GeixU21D6hXrmBbjeNjBGkjkCvit/whw/MGqog58m/ZGxh9GWSxMS+XO40jc81T5GYmaA5e5wRMVyLVu6CNqKkOPeJHJ/nwO2eBbK+M4ejd3sNgPhBLUhjdkYj7Lfv5+B65yNxNwGtJGKoywOhR26455Gvbn7D256mrfFznbTh5zfy3+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZRw/hzhkxgyTIhb1lO5HhwGDyGIHdcw4sEkl42bDIg=;
 b=ECy89ivIbSaI6ZFparyGQ61jhzRthK2OGe5CCrMEOWUJTpOLhEAjTh8tAHO+xyOOYvDu5+0/5y6tNNUvQu0kjf94xbUz8eRBfXY5q/UVrf9tR+jaeReiqeKMoEioCUr5Z0LrMprNAqnbnVlP0u4IG6tVvy2R0rZdmTnoFzEtEDs=
Received: from BN0PR10CA0005.namprd10.prod.outlook.com (2603:10b6:408:143::19)
 by MW3PR12MB4473.namprd12.prod.outlook.com (2603:10b6:303:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 04:59:59 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::79) by BN0PR10CA0005.outlook.office365.com
 (2603:10b6:408:143::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 04:59:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 04:59:58 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 22:59:56 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/2] platform/x86/amd/pmf: Propagate PMF-TA return codes
Date: Wed, 5 Mar 2025 10:28:41 +0530
Message-ID: <20250305045842.4117767-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|MW3PR12MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: 22fc68fb-9769-4245-e807-08dd5ba2946d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZHoRBlOMqx7Qn/hrU+/Q/I4jAU65ny0W6kiM8+ha/yYIUtzVx7GoJPkBN2YJ?=
 =?us-ascii?Q?birpEshZWtHLP8W5Mz9SzRyNToZQnQoP6vRf+dEglwOzbmKd3a9/GBXLGm2Q?=
 =?us-ascii?Q?rTqZ1y9+b1CzTID6HLXhpvYoPqRVDrEjAFyIlBoNthKsf9ORybCi/4LOAjRt?=
 =?us-ascii?Q?uAQ+/OPlTpjtUUbAPtfR1qkbNws/OMRXuoF3J45MKFwcgxC6rU75IrkJMKZD?=
 =?us-ascii?Q?yvNbU65jP/V2kmaVpEBAV/zcBt2/WqX5gkFMhNa3743PD9bHBEJ6TroUifEZ?=
 =?us-ascii?Q?Y8DSiaafwhVDhWHrhWUxcCy5B2FEPDntbSVFXSh8B4lL42ZcIQ9na9p23gqM?=
 =?us-ascii?Q?8HBjS70xEfPt5VHja2S4p1LI4VghO6lg4+EDWyoU4p0QD+qvJ7VAXQuBj9F4?=
 =?us-ascii?Q?LSP8h5skz/i1xixMbaBxN7FDQKgRyJ09N1lLJSMoPM28G4dpLLFfhyUqPyg7?=
 =?us-ascii?Q?RR5qvgD35KvAFlKrVv88olIAtsj1RLZi/HlgCo5DR0HeX4062u0mNoCeZ+/C?=
 =?us-ascii?Q?3aANq+T4V5ETcp8a0iBBuNtkFIMU3oHyTCuG/bbvcCAZLT283pEt6xqjXhoi?=
 =?us-ascii?Q?+DDQCd39TVz8UodtDlYJM6c5O3kkUAlBPdGrpAJ2U+AppeNCxNCWxQMDDNcH?=
 =?us-ascii?Q?GOJxQvem4V2vwkXPe87hkWqVqQC66svBPw36Z/cTfIsufjHoHjtEWu+pDGuH?=
 =?us-ascii?Q?zZTTZEKK4Gq1TPDZsUN5LO+nyx4efRXwk6RUqqb8cuVuawoN+S4lcP4sS9mj?=
 =?us-ascii?Q?FmpXTPgl5AuBCECbfhtkrLgk59/wD+I38D9JXi3HXtSNlz81BhbePaSt8nOg?=
 =?us-ascii?Q?6eyZ0G4u+d2zFLjdIawaFX16Bj7k8wmTklr4MeaOC/ON6bp2R+PGuQQnhjJe?=
 =?us-ascii?Q?HJhCz7hv15GMuw3STm7wAq2K/3RwB1MVeWvSURcctVvpr9fwsZSqEhqRy10J?=
 =?us-ascii?Q?fTrBBE2O2e9ROP26zF0jwJTsJCiRwJy3Km7KFyIkQhtUIMwVAfaLO2bkYduN?=
 =?us-ascii?Q?BZnKb7Qt64Y8MBZl0eTKnVRGWrWrbRAwmQwGCZWpWZw8SJaKdaDQS4ZswmR9?=
 =?us-ascii?Q?Sd7U90YbzQ2amDsqjJJCEAL03H2fX8R5myC+8nHGE9C/vo8V7bOQCnAovlbV?=
 =?us-ascii?Q?Z1S0zB93T6ZUHpjv+F2n9cJBPOLB7g6B5zF0Mj8MGgeNqbrqCW5pdtD3Sonn?=
 =?us-ascii?Q?5U6/YMtRGsGZQM9D3nXBZL396OOo0Y3C0uoWJcJHvoxXjISadV7N5o+NWL6I?=
 =?us-ascii?Q?eIlhQPxMRtd6fLXox7FPBIf64svPloJeozqFTQqn9ZlZCHXY1CGZ0uc4ADgQ?=
 =?us-ascii?Q?ISLgLtIczqoMSwv1+m0aYQNMRrGZrc6F+QwHJL9ZOwFJE/CaKdY0TTVyq6LB?=
 =?us-ascii?Q?yN++s0uMQkdW5Ywru0UGDfAcXUS0+AI57pxcO4Nm0AUTLU5d0f9uGylIC2MJ?=
 =?us-ascii?Q?sE+2NyuXfWbrfgyYIYos+obc4bDIFhBryQceWGO+dSfUtuqwRBZqV6uBk3fn?=
 =?us-ascii?Q?vf/ccLpyHwaxVUE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 04:59:58.9070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fc68fb-9769-4245-e807-08dd5ba2946d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473

In the amd_pmf_invoke_cmd_init() function within the PMF driver ensure
that the actual result from the PMF-TA is returned rather than a generic
EIO. This change allows for proper handling of errors originating from the
PMF-TA.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
based on mainline with tip commit 48a5eed9ad58

v3:
 - No change


 drivers/platform/x86/amd/pmf/tee-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 8c88769ea1d8..b404764550c4 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -323,7 +323,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 	} else {
 		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
 		dev->smart_pc_enabled = false;
-		return -EIO;
+		return res;
 	}
 
 	return 0;
-- 
2.34.1

