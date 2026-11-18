Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012364;
	b=TNzX63bHbisz0wMdQUbR4zwrwQ+WWpR4Pgv9cW4285w0BWVTkMXTwGtcpzx1oXjw/1Sy
	 8GPgH3JnGM9wab5K+JgSnu/kQGHM3lllEfG4BGwxVpYdXYh2A5npe9KSfptFQ0tpbC/UW
	 ENSriJDLoP4J7wj1tljfyeHmG/CgcK2+4f6wLTKCmPWFSG00KZ0qH8S+7dGRO1hXyvAdE
	 89YvXoM5Ajwj6mBW98oby2JNyo4KvxsA0fSLeioDDhTaoNLXv1aKzrLJcd5edLL9fagOu
	 ZkwByyUbeT82wu3iqkZHnvqnI5aQeBMamjeOVaIVva6IUohQf8bhm9AKjl0L4L9ERtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012364;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lnTJ58Lmue0jDgrn0Ia87SSjHX/1td9a5nL+4Bss+xY=;
	b=gLrYiHTRbPAL3jWKfySylPeILYZPZFEk1ms27ZQCGMWlv22lBzB9fBf5aASDMuDs3lBp
	 HaZ72JotUDPMuicfzUa92sITzVbLJ6sHPfF7gi//+UNsXA97OicQBsM8bE16qPg83Zbam
	 vxAvNatihmmBNCVC6pMjZW58jH4M6cTZUwaB6B1f0U/jF6C7BHWM+DFG7puRc+V60RfJx
	 hUpmEGpRWJoCc71Ft4i2iVXEC7hoDJq49/bUk5LKuWv+Q1462cJy8xerc2Skp0wuD9iHE
	 nubSftGeVWk/uXCW72N6FWQCFehR8hLNLTI1Ecya7IomBNw/v4oqVqWTK5FVgcfSkiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wkUCmGAe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.29
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED24606A32A
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED24606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wkUCmGAe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+Wq9bQ5b2l22DKO417Sbe4LaxSnCUMC1QmIDqA+DopaW2/G7cgkDH0Gnd9/wK2lhLZea08vxVesTzDPQxZuuIhcr3OkaLiUsmV68NPgoGRramhVVriBuoGaIZuQatGfK7crul3mr5tHIDjDfTUE3urn5dC7QVU4jgLAVOUNUZogbAsfWXgFF/gc/6Avk9FOCSegJzSFROeSRayJABhy4u0CWLfIwYjt7xraPqZ/wgPBhMyfwo9PFcQ2cCVxhnQZSy/t9+IziNBkj3bF/koWLSrvWlqFcUNLVnAtk6TQrikQkjjeCt8uCLJ0DaZKPXSDJR17+bdUe/g4GPhhUINNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnTJ58Lmue0jDgrn0Ia87SSjHX/1td9a5nL+4Bss+xY=;
 b=Doinbeh+MiTKZ6tkCXTNNtNpGqAX4yfhZrlp24H+NSjF6zukmZlbNi6TtpZ7jjsrR24dzxG6j7vRRiL4k5x7iydLiO21pQW3XahjLz48YXNhekBa2XLQQhYLDtoEOOOL6SJ7xSQvNL58hNGhwBqLK2QOCEwrg0esZ2l0M+qY0VHVj/fFyAGivRZmlY+kgHUVP1Qfij5BwM+j1/tEuxgEoQUT9arDm4RVWuQLHug+0xsuQdlxQTnLgThJjx45/wOEhu0/XeYzxaZxGUZF11sDWOoHoe0unQFh4Fi/ubl/mAEsMbbtgHH6g1VHtCRKc4r3aYogAfkVtpejJdxW0GAaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnTJ58Lmue0jDgrn0Ia87SSjHX/1td9a5nL+4Bss+xY=;
 b=wkUCmGAehD4IFGt/1kGHUOk4GFBSQU2Egzu5CxYbATKxnKQzRGMgVYy5k0c4eyLJpYvuk669jIrm6lkDynkZpRfgHVMV2mYQFMye0QTSbMJEGUMOE2JBQQEE2mP09Aszq0LbdTV3mVdD9V5cqCeR9XTMce3Pttdn7yGvHtvUZl0=
Received: from PH8P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::29)
 by SA1PR12MB7318.namprd12.prod.outlook.com (2603:10b6:806:2b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:32:39 +0000
Received: from PH3PEPF00059617.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::83) by PH8P222CA0007.outlook.office365.com
 (2603:10b6:510:2d7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:32:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059617.mail.protection.outlook.com (10.167.243.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:32:38 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:32:36 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 05/10] platform/x86/amd/pmf: Use enum system_state for the TA system state action
Date: Wed, 18 Nov 2026 20:00:29 +0530
Message-ID: <20261118143034.3566684-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
References: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059617:EE_|SA1PR12MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7939f3-e505-4aee-6823-08df4580cc00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OJnbWKw+1ojZxxbfppD/Y5F5hB1u0LNYjlaAEfdmF852cWKKag8mV+zx5wCyAksweKCwgYDmnDKJUEmfoQZP8ID2E48tpiNMYr1hoZ2zXRJaVdKzEZtLg2EjW04KpWLVTH/biLhwQ5sqGhRsSJ0QOqGt5vG+3YmhJy0K67HBjuSqhudLcfgBZx5228eXONAusC/jK6B2zYbf3xj6G8IGE09t4d929L6MueP3BH6xlSEGrg56ZLoJSED2RyXKaUGVSPzM1cN7lNb8uaorCrTIqXsEnMyZ9BXWBndxZ/2sP5ROJRRbQMy3aWh1Fr82459NQ9GIz5iVMgj+1Lb7oPm1qNqkDbitBwWOr0vjHjrRH1UFJ+U7lZ+JXS8dvqolXlad2SUb0TmnKUPy/h1BQzUXfrdiCtooIyr+JneLuD/edD/OzIiNCWznpdns/RNKPJRTB1iUF0gwvGOu+Edvmm/l5fk80bkDW3RHBW8aOZdloruowDeBKwc5j9ca0E9XFVnBey7D16Yp07T9garzVLTUcp1l1MUBe6Bph1e2pONX/yEZu0NIIBEM1f/odzIiL218xLZzWpUg8YYrI7YU6/5rqZj6Ly+hmekHm4qSDwvgzWlq8dQ8ctIHv199poOWjohWfqhvO7NqW21q6D5NP+k+VcCsKKXl9cfsywaJaNZMpYvok3eIDsHFd1ZKe1bcCiO7W8MtM1WxX6153LO0O8uuOQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0DUE5okW8QySCqliE0DBvdeq8pLLP8wMEIXV5X/oHGnxIu047SBQD4uvYZgrpCLMgUKwVLxY589qHJAehPD0hBMO1xU9XBkT/LTtAZQlaf2z9uguQF0zEWUatP26cHvDzPVc9G+NZLokIisawUenBaBwLYWMMqGmIEYCA9RIUN1mGpHlmj+MQTNEDqsp6vVWuDcdpjHDAxtbRScjzgCluZhv+VHSYHPUhC5VbL6dF0+rSYayfxxLM8koaNA2er8OdNFw7C4Y5o3AZ3a/XEoNxNmfZytOEWR+jUd6aySNA+4+YQxM3IQhG6a0DZKjudDRp+/0V4fAR/5ePMhf9SXKjTRjXiedPRJjMuMHT4Pp4w2oUFlJ7RaVA7Ew5MIdULUTM1d1p5juYOZVuhi6J57016CToxRdRo1VGTC8Vt1cjvHdKEZf3B8OqqWh5zgZMRo7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:32:38.9798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7939f3-e505-4aee-6823-08df4580cc00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF00059617.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7318

The TA reports the requested system state as 0, 1 or 2, which are the
values of enum system_state. Use the enum names instead of the literals
when handling PMF_POLICY_SYSTEM_STATE.

No functional changes.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 3c26296a5815..c0ecfefe0f1d 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -209,13 +209,13 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_SYSTEM_STATE:
 			switch (val) {
-			case 0:
+			case SYSTEM_STATE_S0i3:
 				amd_pmf_update_uevents(dev, KEY_SLEEP);
 				break;
-			case 1:
+			case SYSTEM_STATE_S4:
 				amd_pmf_update_uevents(dev, KEY_SUSPEND);
 				break;
-			case 2:
+			case SYSTEM_STATE_SCREEN_LOCK:
 				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
 				break;
 			default:
-- 
2.34.1

