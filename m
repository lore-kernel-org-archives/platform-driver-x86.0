Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1984931B833
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 19:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304351; cv=fail; b=o/JbrlcgZP2LSQPgxE/GXZn8Mi8vmgHXSNl/drAE029vMA98mqkhWpt0p7HlxtavHoXzU1buYs8KqRXYoo6+ReEzBzWz5jFXyG+XzALZNFo6P9Jd9oyDfWEpska2Kw6YBrtGVbgVNk/DEWp3f9vwUYeC7ddtvWsHQHElcLU8YvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304351; c=relaxed/simple;
	bh=u8h45+xRJl5mOufuqbSgk1VEasWVytMwEuFmr8ifIv0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GanzGIf665SK3p4aX0AhIzEc6e0gzbCtpKNAcAiGL27BGlD4T0o5Es+/55Lso+L+nSgQSD6OgJLZS2kEnC5TYVhh5bOjjSxdGiB9aYzk3myoCrijkQg4VT4CKjbiNhuYlwk/ZsrlONhbKHC6YEQptaC38z/UIwqwWmC+kjSxu1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hU8GmqnL; arc=fail smtp.client-ip=52.101.43.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hU8GmqnL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdwKoGL4RP1V9yxDRBCR5/ocz4j9gvosYJYfdeDU+EloBqZHc42bDDxuzjGXu1co0Brl9ptK0GOIf3AZq9QjRzXxsTLAgRoMSnEeGc+299Ly7009YdI0DJqxmnGOx+GI+cRqYBk6ceBc301zuD7xsQCDsJHVlDoklJhFdYDxocbdF0OYAJpztdVkcKL57Fb4vy/JNy2PPzHmmgik2DJxFI4mpTO4SLCACD1ULQCz8H7+3Ox8aTwt10tbiK53wEDDW40cvju86/UNgxGJZbdgWZyF//MrNxl8zKqX1OjGxoCKB3186z0dwr9RCavoTyusV4P8QHHTvRnP6gcyrWfinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flQIV0JgCGdRZq9wdPzsnW9L1s3EmrIEpodOgrLgMOg=;
 b=M4NokJ71qnEFwwKqvtS0o8JVj6wdxxKJ9/KO9158zQ6chBrez/4paR0BLGAiU+ScV0ZuQ5MOPaHNtOlcimLrnUA2IHepzC5tGiTaWyJtccUvZ0ESIOHJYuTYwei78KovwcBvhb6fRa/jzAvdJE41La0ZOXqKpbc7bjLt2ATIjkb3r4sN65+l2n2t5FR+QtsFhWigexSry3AxMqo1lLgMofbslsgLLujhR3nAWMVWtncp2OLJ3G3aw7HYCx9LXREwJL0X8YVZj2Ial5o4LAiTTSczYkOYolhd4VIhq9bcf9MAiTnWOptmz6e2Vdm7oU9aTIsWs2PSg+c1Ms06X68d8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flQIV0JgCGdRZq9wdPzsnW9L1s3EmrIEpodOgrLgMOg=;
 b=hU8GmqnLtCO2zP6x9fpyi0QQ8yISDfHkhBMPVXbeIOe01u0w56OCLDcaLSjjTQnujRI2ZhPm9jPWNl/a0juwBv90luQqpm35G+CUs2jP2s5tG9sZj8S9gxd9KnrLCus1xYMQdyKdadLtCTqyrjMPuGUOYQ1tywMBTTpZB49Dla4=
Received: from CH5PR03CA0006.namprd03.prod.outlook.com (2603:10b6:610:1f1::7)
 by BN7PPF521FFE181.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Wed, 20 May
 2026 19:12:23 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::f3) by CH5PR03CA0006.outlook.office365.com
 (2603:10b6:610:1f1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 19:12:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 19:12:23 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 14:12:21 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/5] platform/x86/amd/pmc: Add OS_HINT command for AMD Family 1Ah Model 80h
Date: Thu, 21 May 2026 00:41:49 +0530
Message-ID: <20260520191149.773196-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com>
References: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|BN7PPF521FFE181:EE_
X-MS-Office365-Filtering-Correlation-Id: 6870356a-5cb7-4b14-4e16-08deb6a3b92d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	f/HBlUp4fjQjj8SEentg5vuFo2+71q0zMD9tQw9JW0YQy4RUPb077uDKG8GvBoNVvWg4x29hLOndUzGtU2gQbCgAgHKzYWeRqNRaHij/1v1tsGBO/uoALA3F/K4daR+0FjNRc2BzrSsD9AaFnMso8gqznEJZbqfKKqd+3BZCTB+n3vBj0yrS7iwgbbgLxC9mJQLYyrxe/D705pBYeyQQ1l5dhp7q9lQSWoV6nAIYrWP7Cq/cQKVguCnQiPUog9q6OzMm2DajC7Snvu+KtIsGCoIXc8we68BOyTMy++A2kyDNO5mH45TE7Lo2SBZIrZv3Ed+Mb7rsXJfpoDzxfQEgnf8pQvCjwrN79xOwB22tBj9m8Z/iZKDA63bcC/pHIhN/jlPFBch+PR+ZMYbqkSNEUMDuILeEfMgfhT5OlrQxESIcVy1cUq4sZiFPLGilyrFE566fF7fQT8uYfmGM0CJZgQlzFDIOyU1tuv6a8pzSWMOBXlKlpSAAGg1ZnxTlPebHGVBN4lnLQFZq7laiNp5rmGuOMvpYc+PMtrdKVy5qxLCzw8dCESG7NNf7gmJGsxHFb70TSloe7NKcF8L3stGaUFB2s+hfkn05UjmA0z8SGUd3aAHiMtF+UPg6sDoLzKn6Ti7M9AqexMDgU7yTfd6cDV7FjYbz4SIR3Un31RWo6wGjyaCtmmh1jFAta1SjMlmAPIWaCF/jo1/NMvPfpG6bCKygP53cSGowsDwYzYtxT7M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k031G7EGejOAvv9uh/CnXZf4jA4MFdm1AQ10e9xXArhQIAk0A1hoaq18qF7ST0BxozSdyzidoAB7Dxym6DVXswWQShqWByTaEv9NxOfKK2Ir60MRbz5oO9gc6yONVjIoc23tywNXtw89CQL03nQ+E481d/QgAA62FN6hYgtTN7Nyca3Hu9kknzu/HzgCQBuf5DmV401Jhs//CBppEAiNdtJOheK4HTXDxWq+0A1bHZg71E8MuduKLTNbVqsXwcIRZ6b8abpiiofDlNue9a5JQYlOC+7xekg0mkN21xMNDOPrsJkMWjiUTfmh664+wKPDMRtuOfC0GHAAhhfKDW613MjsWPlMMJgG58dVUcGz67KeRc/gXuaiBY1Shxgr40J2LW3Dx9Fv74dcGbZbmwzgtYUXaz8n2YYTfGaOX3qY5K0EzSHaQt21CMVz5FQsxw/N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 19:12:23.5600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6870356a-5cb7-4b14-4e16-08deb6a3b92d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF521FFE181

Add PCI_DEVICE_ID_AMD_1AH_M80H_ROOT to the AMD PMC driver to enable
s0i3 support for AMD Family 1Ah Model 80h SoC.

This includes:
  - Adding the device ID to amd_pmc_idlemask_read() for reading the
    idle mask from the appropriate scratch register.
  - Adding the device ID to amd_pmc_get_os_hint() to get the
    correct OS hint message.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 9620b7cbd371..eff1afbee223 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -391,6 +391,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
 		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
 		break;
 	default:
@@ -548,6 +549,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_PS:
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
 		return MSG_OS_HINT_RN;
 	}
 	return -EINVAL;
-- 
2.34.1

