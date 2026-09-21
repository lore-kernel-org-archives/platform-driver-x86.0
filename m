Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012048.outbound.protection.outlook.com [52.101.43.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57512D8382;
	Mon, 21 Sep 2026 17:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010271; cv=fail; b=AxLDwi4w44UUnSC03AM0VSyQaykC6A2QG+iFX7PnyHsHCwm7jM7ux7MNbmdR/HXahEVGprMJDAqD/EwClRycx3LWupe3p3TKawn+ObshtZ+sWGTNQSoYWUO1aZQsd/PFWI5opr6pWUzUPq2WMunjjeIJ3KNUqXRmzdTbiLt+kmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010271; c=relaxed/simple;
	bh=tNgsJwvUEHLqBEHLDLZMRhEAYJg0+P8cgacbiHCK8xI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HzdaEbCwRtBqGB2IpqzlcR7+49lEudt/jjjm5o5NorGT1GCBX/ndSNzZZ3Ma26iv/QUhSz7/gRrvcLa1wD48KT8NcIIO3E8HKcocL2RVr1dAGqWdE21sy/2T7acITKl1XeqW/VvBdJ3fJPIk4zWAUzNdMrJfClzgSTAbvIcbeKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=exgEdFDu; arc=fail smtp.client-ip=52.101.43.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="exgEdFDu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqJ4j+EqS0WMei/EvYZuSdPNiJuBbkqoGcK6EKx61h53A9Qp2TOpEjSop2cw7OVEky4Z6abs3jRdHF62f3psajXRy5olZJzqjzv5H3WSFZCRcWlcSELtZvywhlBESt7UWaKdHUZZBbyAaf6bxyW1tlfV5Bgk8ztr35+15IEMb4QYKyPKI3hM2psyitiLXRHn2r/zKQiwIQcjgJrSzK0rsWCx49e9+6QDUlW2ACjMzrgU/F1bnUIiaRLLl9vViNsHMMCooA58uukYoFRtk4j1dZnS3J0T+nG368fwtMJfbzS2ox1TjgX5CPt7cUxyvtFFgpeGKlzOa9TEyqAceruR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmDMgktlKj0b5MQtop8RSZ81Ibhk+DJSqkI+V3fV1tQ=;
 b=pcG7AYRns3AxcUpZmjHfAxTht8PuI+hNr4lRjm91XY5pZ8iDgtmobQEXorQTxWd7C/XXIwGbU0JoQXJHPgZbhqQs8uJSjJDIT/G/01a4G/Ai39GyzY2rx7J5O5AJho7TNfxb238PMLWf7Pjfz7QFtFRYBtzikcTdB2UuSrNVNzJD8mKjkEh7OQX2jIv++Vrfb9wGJZF2LRICty1yBveOz0gbfnsiW6sXb/GqUOgGGQjT/QhLEc015bbCs+LHxFOOJbiXEICAFZr/r6kE/fzq8H0+orlzJ/4EMlpKiCVI9KSwxW1l7T+jvWjFgfyNdD59b7PZqVbZ3LRputuu27Qwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmDMgktlKj0b5MQtop8RSZ81Ibhk+DJSqkI+V3fV1tQ=;
 b=exgEdFDuQbEd10dRS0oVwkhF119jwvu2anCgb7+tJd85t4jNw2wpucnghIRuGYIcMWLGUKKPIxwwRQxzc/JrCZjTnDZtSUYEGGDbV+TH5M/q2LOnumCAaZA7DTgxoSOAvew1KYfO5sH1i+BJ3JaQLrl4wuj1AtfryEXl5IpqM40=
Received: from PH8P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::19)
 by SA3PR12MB121967.namprd12.prod.outlook.com (2603:10b6:806:58a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 17:04:27 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:510:2d8:cafe::75) by PH8P221CA0018.outlook.office365.com
 (2603:10b6:510:2d8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 17:04:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 17:04:26 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 21 Sep 2026 12:04:25 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
	<platform-driver-x86@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 0/3] Fix a few Sashiko flagged issues on AMD_HFI
Date: Mon, 21 Sep 2026 12:04:08 -0500
Message-ID: <20260921170411.1149960-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.55.0
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|SA3PR12MB121967:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af48a31-8fd2-4304-6bf2-08df18026439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ahk4emg9HQwRPRpjJ4T0w8AU11fSH+BI1efzxROOGWGG6rWBxvxhk/BtSP+4fuLgqla5ZTCfl24x98uGTqY1QeIpuGEXcbKxB4VF63CeuafvK5DumC5+TaG3AITpV+ZCHKwi4WpjUKzikInCC4pUo1ZSaT/9JB96nbEQ2ctdmG5QCjHSssf8OnCM2RkY6E7ejYQGD683Itbn0kwHn5SF0YDop+h8knCHsCgIZWiAkR1BbTKbnoXtcwho982Cmsm+m3RqSTiZiblbvajCA/ry1z4b4+n2yhB5/FiG/O2ejtAzj/J//dI3shcOVB0QklcK49DJSYUwf5Lzoqe1fGVeh98KyYwcelZxb8vdrxr3VXSGy3SRnJ568qpTMV52dEqxQLgKIE4tPCufR83jX2cnH0ZJKeJAVXakpKqiHT8r4yM6D/DKJiayHXtbEFjz9Tqfb7lqG1w5aJJP4y7nMrRHQdQ8c3UAJ01DgyOLu2vnhtD+xGieRCoRt1iU3CPu40EIYS7vkiab/ZVGVr2hPeygm+S6/qureJ9xtkPk6ggdLAYtOzVq6PAc23a2E79dAds3zwuGZLYhbfkE5RxjM8Ks8RqOfRnZ+qgehv5tyV8/48fC00CoS3Sos3ostNqdB84HlUMjBf6eDUZdkAnjapeqKjuSCBtRw4C7gxtxq7h3UDT7R069VwqzUlecdmpIHE5p
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xypJc9P0pvmh+Zhu7D+z3DmeYbo+tlMbHHDBVWxWc/DJlK+Xnd4WZbK+9roVa2kobMhCYsvJ05uiCN0hjWDSJ3uLr/GnW+buBnxSe+GTLpPRoQ8VjreoPZ7JgWgPXd17rVymhKovLTHwXjIyr0w1MwVsrZ2TS27j4qabciLKWCcS5+16mfn9bGQSdKOdjNd8KyE0331DDnS/XisolA0w0DbDyUQOgLhYzcJck2hRh+CT2zgv0H+fF294PQXSxoJxNzFsnz4UY+vm6z4B6KRGeKb+vkqewf07HxClW0/9VsMYmTHouBLlsj1lEN4L+WAovj/bMqaT+ZCn9qGyTgovR/ah6oFLRp/QMssvrsSnEP5aHeAaSw+74N4QbR+Vu7dursEl9sfQM2HG12pnYfZXxquoworhZh/bzxB5TN9W789K4T4d9qljZRGzVCxudxar
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:04:26.0078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af48a31-8fd2-4304-6bf2-08df18026439
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB121967

Sashiko flagged a few instances that could trigger out of bounds or
use-after-free.  This series fixes them.

Mario Limonciello (3):
  platform/x86/amd: hfi: Fix a use-after-free when unloading the driver
  platform/x86/amd: hfi: Fix out-of-bounds reads when parsing ranking
    data
  platform/x86/amd: hfi: Rely on ACPI enumeration instead of a dummy
    device

 drivers/platform/x86/amd/hfi/hfi.c | 34 ++++++++++++++++++------------
 1 file changed, 21 insertions(+), 13 deletions(-)

-- 
2.55.0

