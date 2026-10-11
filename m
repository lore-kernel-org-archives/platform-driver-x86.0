Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010016.outbound.protection.outlook.com [52.101.193.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8200B364059
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791713231; cv=fail; b=DqXiYCYwxTj7uLf/4cYrU4kETdNJ7yLNhib1/N16K8iraBcq+iLMyqA9sqoW2ObACPMIYUj/VSwdanyTcKxuXEy2sDwCPc8ySsz9Azlijs8ynYfrj9djtZKPGN4VDOyHveG0UR3Oa79bEQL2GILpRQxul7RZSN8YcEoPdCPf7QU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791713231; c=relaxed/simple;
	bh=M6KvLcHTgxcx4AnWXzc1Qk2vCk7RftK0vPhictPPSLk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tQKNI/GTHovUPrilwl7F4pGM+9Z3/4G9eIwaC09Kq5PDT1KkZsB3eE0lfOn5OZEf0ikwrviXm1FP9VubDffSKaaiORkPmMnlAFw0ZmN585p3krC8usW5rtDg1AvoEzz7BxR/aF5smTJ1a33TfFGeKXnndLf4SVkQG22JaHKxi8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0F8vEGcp; arc=fail smtp.client-ip=52.101.193.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0F8vEGcp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Szn1GZk89PQlMf5j0swpUXWmu9Alrwvv6m88BsI0qg1Nej+vsOltqRuY97aJ/HWgUrvzLwSUX06/Q5+j5ZHP8s8PfWhp/dXcpCG6yghJqlnh5xmL1P4kYq3XaQas5rs6PsAar+6bVqqAqy51kx7ufF+fIrLDtlsG95vcmrUVvLGNQNoAwhhJPTZsZiZH3Hak8RHuGe5ByCv4nwA3naXymXacz/sd4gGTyHR+hS6+y/QpN5xoRk6167kHkeV+pgkKVYQ8BR6VoRjkIMCsJDF2fDMOWifMWt/ufH2YbG8J2MgEB+mLf4MjLEAo58NQZjEYLt8X2i/ctXOFEy5/n2Uopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M23Hy7htuXwA2h5lzBtTo5w2EKAhgvj15R+T9133s+U=;
 b=GA5bB33NPyiI628JXaNix3kRlb2W8zojMpf37v0D16Qs0K8Uw2zgcXG60VRkC2xvUo33oVW0FgqBOM3vI/tHd0o8QRoyqGSx8g6VyXAywUWi4WBBxL5Gc6XuNC3Fi6MLd5CjeUkO6XdOFrnI98xh+mc360z36pkAUe/ewcTuTbl7rgDw1uGpzUzBfS7VYr++fDRpZfukOalLf4hz4v/Qhb8aPHzAZ0b4nCbGJD3By/3hkwIoXvN9S72KKVEM5a0f/X7O7WSexa+gTotzXTGdtggmEey2+3uii6a1P3MUA5NJhOSz/w0mk4Ob9ptQIn0GfCGiH0vpXF/71jOXf6rPRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M23Hy7htuXwA2h5lzBtTo5w2EKAhgvj15R+T9133s+U=;
 b=0F8vEGcpKdn/uwwjgK0dAmZw5+asz38K+9AYMafoeWngAETotQgJU6owfbNPpWAn2Dqr+MiErqNcU2Zy+nKFJA3FyZk9urgS/cxeVGJfTLfFzHeznrAPlwhKRwJxh0rzcjb9sA9vnRVDYcO04pjYhHiatz+zWrnAmwiVZ5VA7DY=
Received: from BN0PR10CA0027.namprd10.prod.outlook.com (2603:10b6:408:143::28)
 by IA0PR12MB8907.namprd12.prod.outlook.com (2603:10b6:208:492::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Sun, 11 Oct
 2026 10:07:04 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:143:cafe::53) by BN0PR10CA0027.outlook.office365.com
 (2603:10b6:408:143::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sun, 11
 Oct 2026 10:07:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 11 Oct 2026 10:07:03 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 05:06:56 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/8] platform/x86/amd/pmf: Add 1AH_M80H support
Date: Sun, 11 Oct 2026 15:35:46 +0530
Message-ID: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|IA0PR12MB8907:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0c3748-16bb-4257-8673-08df277f6643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|18002099003|10067099003|3023799007|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	MsrobtGNC8/zgK73ZSi7sUKwyVRdzhtyoA0C54rMcuu+3vw38ZLONgbhKMG3RsNzF0g25CzlQzunEV2RBRLlJQV2GX/60zqeLVkJ8apWPj2sJ6+wC8MYGitMX36hgJez7VU3Jor6KK7WTL+ekhXc1iMtNiA7V7WhrmbQuPIk86AWJC8fBFGGRc5SKIAsEe07HXeQw/vcMec/4hSaPo53joLlOFNOpaq2BHd/oq92BfNBx7qYcEZXvks9a+2OKzDVsf/kIIGH3DYAR25StbzYlDaVQ+NkHz6yP9i8p6rve9atF5RBeEgxlytA5fHttVO2m0RSXYgF18u2yIgC9f9hWavBRRA8zueKy6UDyCgPfVeafFIzAAofP9pj2+z9MnUrbpmzDQXfsD0oHqxgkb6RtoWyimXxybxufMd1T7tLoPomhtzKAZ99hY9CDDsEiBAHaUDMPhwadg3NQvTOKNoz+XpP5+jKy7Uy+2QrCPswV7XP+pT2FuNfRloaY2VWdYeubU7uzB/IbPj6zq4bFizivTgC9ELNCbISzJPrYw8EmxRxwIh12lI3qUqnXV7xlIQZ+z8V7UNRAEOjo4tmpHgLYot5b+/pT+q66JF05oCXwXFJcCDAzYcdx1PqhoRd3HrDDNp0r5yejFT1BhSsiywSMJoRxwdH5xsv9w4nbMy0gWYv0Lbpa/80MRm6kuSJ9hoZfIGngQzRlLtAl9jRaBQJVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(18002099003)(10067099003)(3023799007)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0cXVZaTNJTSb3VivcZv8go7YOA44shdOL0cpg7sZLtxhp4SUY3K27FdBx4CEtLc0jXz2Ul9WBWLnUePDA2cOPezNQwIlkNDDeDWs7PmTnQzys0oKAPUSRjtTuZgg6OLsSggOfrmaEiSH5B7hweH3MIuV5jc+j/A5BBf5KBpBcAilj+s5JQw4M2vb381satN+90oLbqrE9GUaXwGm9p0jo4jc+SA2cfXi357HNXxPmfYe1XeNOdpPYzji7pzQ1ritjBFJhbQi6xLjnB5IkTN9PuobWEMQNKtDH5BB4X8hvZ+PB+hjaG8FIhHvU8UUSE7+y1oMrT+APxLIAxBbooPpI5ZMvcoTG9RyJ8a3uHTFUB9gzCkMuigoH4UxSmBMxWekmG7+Rrt0w1jVYNAxlUDglKqHN5bB9tzKrmHSxP2y8P9JZ0rvKSekVrfMTw80qNPI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 10:07:03.9542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0c3748-16bb-4257-8673-08df277f6643
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8907

This series enables the PMF driver features on the 1AH_M80H platform.

Patch 1 stops sending the legacy DRAM address commands on 1AH_M80H.
Patch 2 adds the static slider support as per APMF 2.03.
Patches 3-5 add per-platform TA ops, the signature size handling for
RSA4K signed policy binaries and the Smart PC builder support for the
new TA.
Patch 6 remaps the metrics table on resume.
Patch 7 passes the custom BIOS inputs to the TA on 1AH_M80H.
Patch 8 shares the TA policy apply code between the TA versions.

Shyam Sundar S K (8):
  platform/x86/amd/pmf: Skip legacy DRAM address commands on 1AH_M80H
  platform/x86/amd/pmf: Add 1AH_M80H static slider support
  platform/x86/amd/pmf: Abstract TA dispatch through ta_ops table
  platform/x86/amd/pmf: Get policy binary signature size from PSP header
  platform/x86/amd/pmf: Add Smart PC builder support for 1AH_M80H
  platform/x86/amd/pmf: Remap metrics table on resume for 1AH_M80H
  platform/x86/amd/pmf: Add custom BIOS input support for 1AH_M80H
  platform/x86/amd/pmf: Share TA policy apply code between TA versions

 drivers/platform/x86/amd/pmf/acpi.c    |   3 +-
 drivers/platform/x86/amd/pmf/core.c    |  50 +++--
 drivers/platform/x86/amd/pmf/metrics.c |  13 +-
 drivers/platform/x86/amd/pmf/pmf.h     | 246 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c     | 206 ++++++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c     |  88 ++++++++-
 drivers/platform/x86/amd/pmf/tee-if.c  | 252 +++++++++++++++++++++----
 7 files changed, 801 insertions(+), 57 deletions(-)


base-commit: 9cdc0dcc1e3677fca59bb314f2ec9e33383136d9
-- 
2.34.1

