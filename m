Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010060.outbound.protection.outlook.com [40.93.198.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6041FBEA6;
	Sat, 13 Jun 2026 19:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781378310; cv=fail; b=sHOkf52ZK1R/n3n7CuLf/ZdFcu2C6u5bGvmMn451a7lzJEbjtQwt5C7H/WmkhQkkIsruQ2O1GF1KS+nGZP1qGReaXv0sdTMDc+LwW82CWqb4e+mBTngUEFfw/m9VHeXr8bFhr+Pnm1SKvfuQQdS3Cp0CL4HvVgoPYltikeSnUCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781378310; c=relaxed/simple;
	bh=9i+j43SWEMoLtOzPBGjcJ3IGAty1zX0N34ZZ5YdH0zE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mmAqqVIabWaGjWLMi/JkV0Fbz3W6/coBNIej2vJhQQqO6/wZ8UIJEmnwnmVqQNN7LpPX446pyXDO12OJTK8HjNJ3jpywglry40aGmeqp/VzpyVglWtb2xU5eFhSwjADOeTqpjTXc3dLrj0v5MZ3K8fr2uap0qsCFaHRcMp8320o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zInTCktQ; arc=fail smtp.client-ip=40.93.198.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zInTCktQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRFJvM0ZLN4i16nfFZyAQ+bihit2S/MZ1iEuVeVMuWSLrTPihv5eyC0EelgGIy/T0ZgYY4bgKIBEFGYDGnotOlxOUXWhzICOwMTk4XWRaGlYxIQNHtaZG6hmYlKIa7qdQuMKZm9bQFVQ/zMNBQt869lyQAKQOJDGSjbvbyI1yXYeXXZ80pmKqbN63OnuK1XHTL78F9Alwn+w1khITuHbGKqbP0ZaQ/3ErgjekfxqnlvFXmYXvchasTLLOQlEszN139iXMadTA4dJ7eVPYogHDjeuox8kyRkQsrGU9rxuOZ9J2MSsZgVzPiZX/5vlBTHMMvw9dVxwVHCf++FZzLADKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9br/aLQqK6n66Tq1pW4ThpL8hEkLt+4yo+SxQA0wai0=;
 b=sXi1F7cjlqP6W3+qQwx/XU2J3BxLynM1pKifopvcrhuY+3n4SpehDDiJYSTxXtPuqFq5MPHoBPyY3Y9+0rpOvqDVGgsOEpJg+7SggotqsmOarDGVBCkcGy0dhVgbxAvG9NAmxWGu+R+eNWzLQgdggT+a6t20UPX0AbhnnsGHxJbUUxFW/27TQlcyTEKRXJX+TKGs2ZLOCPxU6miOJgRSFsuapXrPDgtnIZq/H2aDmjmgSj7KAVJNB8MbxIAequKrQy4T/vV0FTdFn4QFc2UYNvppFNQyEFrazSaWLn/loXLsII4q5WYqrL3AlMsJj/Wyyc/RELl4vAYnP8sqFomn1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9br/aLQqK6n66Tq1pW4ThpL8hEkLt+4yo+SxQA0wai0=;
 b=zInTCktQHFdZfB56libzVNR/F4ZLa9txHIynESP/KqKL+kWd4STsb9kg5Gupgjg1T4goGnSzU11SEpCwqbyyRiYDu2XkAZrk5GoHaf160h5MoQNHG0xORbZ4XmMNqOdRPjSNb4wSN6PchNfnn9NVpQiYe7lQIiLVlGUOnUyfK8E=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Sat, 13 Jun
 2026 19:18:22 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::46) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.16 via Frontend Transport; Sat,
 13 Jun 2026 19:18:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Sat, 13 Jun 2026 19:18:21 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 13 Jun
 2026 14:18:11 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 0/3] platform/x86/amd/hsmp: Harden ACPI probe, metric DRAM, and socket teardown
Date: Sun, 14 Jun 2026 00:47:52 +0530
Message-ID: <20260613191755.2358969-1-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: cb01455c-641f-4f65-da48-08dec9808858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	BxlirCV+8tkAj0jUYneCdfMM2XP0yOd/eLgB1/1/fCv+J3FwDwAjE0ogYudjlOcctTGgkOCUjJ448xpt7aulvdWBRxjHM2bhxY539/4mg5RHuQAK9vnT194PsrUzUznUG7DQN4qZGEZgWt6IGxkeij9f7pCiEGckr58GIINtwYpDp5Lxihj7+0zHz025PNwbOah/kCoA2chvPNZz7w7DRA6xGQusFuZBgDTpkJXvjtSGWEMvtrPN0otsVBEVIcL1T4/POgr5kj5lZJmw2TXfiKgTaDxkgQxtxhg/ZUWSauLN4pHxWxlMcvCi3fL60TanE18KRFxtrdqcJZmlezGX/mAWwrCex5b0vUoGE4qzdRmlAU5tSu1SVg0GywMoMaudSkUhIL9Z327OhV6/Dirco30pagDP5GjTafJamk/vrAk/80jBX9tOND6K8vYgWFuIUtErYTgkUiVE3jbCiD2W4RHr3U+g1wUicK5S/Khl6n+xY4431r7EgC2YJWTnzM0EQgDmuQyatUJdr84rl9CIxdHBAAEQXgra5WTlg8AZ7JgA1OG6tD5AKHbhEqYpiXTlRzULxfNm5zOn5b/LfWlxjtOaCtj/I+bWU6njJkE9B0DF7tmRm14ls1wjkRp/IWEUJcpV6aFOU3dD7t9Cjp4hwoXOeg3OMdDlQDTBavheq/Z4ZAuqiOPgGKbQcf3fApMqKjdbnnT/K/sFzrQP4Rvgwc7iCtBwndqzEdOkz0odsYs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xiM5WCizNZcnd4PjHEgHHL/6n8NHPFhBQdrfaf6FooJWp2nrdySMGfhJA9L715TcWLl2C11WHhuV3UjG9OqNozsloGyi+6GtKIPPpqaEFLpbvz+MpqRJF82KtopRmdg8SqEYOmTx/7qu5gm+4OCSiLJG0sWrh15G48lXVkhYpUwh9BkcSH3+GrrulCKpoHw4OuycqY2ifDsWVGHvYZ+mRmt4/KnXDEbpHENNoI9IyFjQkCD0G1aQIqSOtilYUtFTC4u/PrTTkop/Dk+MWfjbOnSs2bxLMrkBfSh9noIKzotSNUQbKArJCPKCTBSzSvrS2MCYVpXfxhc3auRfIviA3jP3zkTu18EPimwnW4oWwrHhni/VVczCJd94DDb3ccPu/KFKdYnIs0AEZ8q3aNmAqzKBYhhHpNPUs9kzWru6G45wHa7OWDpI9OWg6W2s16Z6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 19:18:21.2930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb01455c-641f-4f65-da48-08dec9808858
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912

This series tightens concurrency and lifetime management in the ACPI-backed
AMD HSMP platform path so probe/remove races cannot corrupt global probe state,
leak metric-table DRAM mappings, or tear down shared resources while readers
might still be active.

Patch 1 introduces a dedicated probe mutex around ACPI probe, remove, and
init_acpi(), replacing ad-hoc synchronization on the global is_probed handshake.
lockdep_assert_held() documents the locking contract for init_acpi().

Patch 2 switches metric table DRAM from devm_ioremap() to ioremap() with
explicit init/teardown helpers, and embeds a per-socket mutex for metric reads.
The legacy platform driver wires the same helpers so non-ACPI builds stay
consistent.

Patch 3 replaces the global is_probed flag with miscdevice registration state,
refcounts ACPI socket platform devices with kref, and runs coordinated release
on the final put: misc deregistration when appropriate, metric unmap, and socket
array free. Socket storage uses kcalloc() with careful failure cleanup before
any kref is published.

Muralidhara M K (3):
  platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe
    mutex
  platform/x86/amd/hsmp: Add explicit metric DRAM mapping and per-socket
    mutexes
  platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
    release

 drivers/platform/x86/amd/hsmp/acpi.c | 87 +++++++++++++++++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.c | 38 +++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.h |  9 ++-
 drivers/platform/x86/amd/hsmp/plat.c |  3 +
 4 files changed, 119 insertions(+), 18 deletions(-)

-- 
2.34.1
