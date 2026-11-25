Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795591532;
	b=Rc0Zt6R4XCUyZOqM06+AxcMhUK+dlhTQ6lylFyg0JhNFnmfE2woS2uQzuxqy4t4sDklh
	 ub6+bSDW61mGxm92atTZD3mFGD5KlVAPr1Peh3HSUSBrwBHb59Y1GxGlb6EiFUiHaCoul
	 X4/35NkzupZbE2hKWzJ+tKnxkeric6ndcu65MYud28RYS1LOFqpNv3W+Uncbm7funb26u
	 GU9LHXDpqH9un8mA9CzsF2TqAiv+TeS1P25+nu7LJj6iIUC47DM0ABmYlfk8jQsnWX2Nk
	 Qw6hH821MjLO8RHQuNKWSUo0y5wNuAw5HGUKcfgaFjQI116VW9dobl10jUKUlAxP5mQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591532;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=CWkMdo9tXelPMiWeSmwJ4SMEg0Ce91WAeBsCcoD18Gw=;
	b=Cgb7X2nDtbQmANREVoHoEMfcNueXkShDYnPPArwlMOcgc+DhUOxtniT07g+/frYcWNaS
	 IxcxwjpDf6DjGcf/9rQeySorvWqud/j5jNlIr0nInj72BdQS+usr0CVesoln1hO4lMdEl
	 +BCUPfRP4S+JrczIlOTW4eTXd0vjLDixBq2OeXi1Q4WXsE3Z6F2WCng3Q9H3MjURoEQjO
	 klsGjwxBZqOP/2dbWmcot68LE4pVGDmu5rm7ZR5EMD1xhuMF6PAMO4hjuElHyfQphT+Y+
	 dNLhdvONZfLsf0S/XhiO+RMqcvVa4P5fmbIEYGuoT6VKLWsKfMfLl7Beueo40eq5eSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4NqB92Tf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.30
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E0E606A32A;
	Wed, 25 Nov 2026 07:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E0E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4NqB92Tf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6OQOMYYGeZQ/IdrE0EO/ewK5aQSrluHnyBDx7RL9tNwohe08s35sbzN/B6tnHyAdXGOWnNKosihHJab7DnmTGl3DEAjyKQ2yoTdJfzV3zdV+k0yy1+dL+DIpl9dPy+ZYPcUBbhyi5yh1ywzfQI2kwCS/RkZ73wSM6Owuaht01lZ60pm+N0zts3hXr/TmqaEBNmGVXCzbRxyXZ6c+hpUopuxUIJhJZYYr/NEp54Q0mv9MRcjnZP82xEvBr9f7WWPSWBxPb7jBKmSp8bFTjXRx91ClZ87myh7RulOqmwURcLL+WLSP62u/gWsOx/PmbyOQf5VEQrDlthenuCkUmMtwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWkMdo9tXelPMiWeSmwJ4SMEg0Ce91WAeBsCcoD18Gw=;
 b=dFVjM2N//sr+CU5Xgz6j94LmRmLuU5LSn8rUWwB6Ll224J3o1cVhM+Cvq5yfrcBAq52W6EdNXYY38UqD6zv1tgqfYcJKVycI4xPe66+U8rDtlfoIP28napDjXUErpsp7SrK2D1qIHauiquNrI45t1kHVCWcWSvFCKoJjJz2zwFi6Z/8s6jZNUYQvvwzNulqqAe5L7EpJKNqo2fluwwW7kuZRvocFJMWIp8WuFdz2WwUdxZgyrRwtT8iDDrQfH7+vRHKJ3uJz7g1Yfzo/eVe3wjSK3k0E3h1qCo7DQscAUoLjWtn3IkoPdnqpd80+g6g3zfsIS7gDi9pdhnuuxRSuew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWkMdo9tXelPMiWeSmwJ4SMEg0Ce91WAeBsCcoD18Gw=;
 b=4NqB92Tfcbhbc0KDHT0orIaDrTKqmFaM3WsyPrMilIFiLSwgR+RDRZrgD+ZhIWD0UNmrM2JzW66tLUawhmlQUUB02FjNdnfSXm5FGMWavfH+9WpkR2UNPO7EqEqRmpy48BfVOvagk1BXFsSOqDvVAZ2e5zXsu5rp2aDdSUAi/T4=
Received: from SJ2P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:5db::13)
 by SJ2PR12MB7867.namprd12.prod.outlook.com (2603:10b6:a03:4cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 07:23:26 +0000
Received: from SJ1PEPF000037BA.namprd05.prod.outlook.com
 (2603:10b6:a03:5db:cafe::8c) by SJ2P221CA0009.outlook.office365.com
 (2603:10b6:a03:5db::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 07:23:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037BA.mail.protection.outlook.com (10.167.244.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 07:23:26 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 01:23:23 -0600
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 0/2] platform/x86/amd/hsmp: Validate num_args and Report raw SMU mailbox status
Date: Wed, 25 Nov 2026 12:53:04 +0530
Message-ID: <20261125072306.3458898-1-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037BA:EE_|SJ2PR12MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: f2926fbc-a0a0-47ad-f48f-08df4ac4ff3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|261009223027099003|11063799006|261021121427099003|56012099006|261026140227099003|261022105027099003|261021123027099003|261022075727099003|261026121527099003|261028144727099003|261102123227099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	E2okVM9MvzshcMIf9CVZI/uQ/8NflqBtP/tmOWIWwNVShEKMHalVFby3FU7stih3+22CqJE1d3mhXgxcZbVOn5hwX+ZcNhHpDAGRftst6cwnrKqQeg2AMqAt2Hz4M5yOSIZy9CkCDEJ2iPrs1R5Z75iWbHvqAvoR58UgPuq1p2JsbdS7uGyd8TjTGw4Q762TZOUx9KehRsxgyFjDKJHik6H8yRYOz6PjgyAaxKFrqtaaxSi8JbqmYYejm+Ix43ZsKzOyO3aXieWJazQKUDszs86Paa70xhWizqAbm8Edy6PVs1zwHztb3IHxXmuHITXnR9nigycpyI9eO1xdwDyJfvzAQsuQgoLWYeZMGMnGSTBnFyFiFfDdK6ATqp9G12DhrI3WoXP/VeKW5d3niAPuKOvRkmfUe7K09vE62yC/W4JHck0Zaig8Sg7enufBDmm2LVmw19lHhhn5YqTlKs7XqgkO+4juXpUUoh1U1Vbtx3itk29AaK72nZSqZKPpJ6JBeZX4szGZvxCQ19f89HwsqHaSbwQUg/RSK+Ok2OrEC0sz79OMrMLvJKWFApeXJi2mID+3QJjqaSJXPN8g1SypJGEjSCB1qx/ickKgUEKIDqQtFrPr2rY1bpFIBmvbp0WbpAJ/iD3z8lYcwgsJbzCdAEN/LhJUQCbSc/vLENqu2dFEHDKPpzcEXd8/8BHaWY0OwW3gqXDpUpK+lBQT7kvZHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(261009223027099003)(11063799006)(261021121427099003)(56012099006)(261026140227099003)(261022105027099003)(261021123027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261102123227099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vaGFYtqAZcX+r7dAKifYifHnktULR3e2Y1wHbMgv7TFNSZxBKOpn/qv6NwNhRXs1SwywW8ylnLJBoLT4vvBmZdoCJmYkNc3O6mShxlVtlvL0tEjM6lnAL4/4Nn49+7V4nUlVgmQ4PoFpjWXXC4cI7BAhP2fBJptcyVnDUnBmKi8LuOhfuPJqnzdDXcgsxO8Xydfr9WsL3FvNv9zkOFrKFryJWBBytv/R0SlkN8PwGicLG1+2lMlEUdWV6OO7DX3zSzvoqg/ypJXqYMY1tq1bq+WQt/fQsDWhD2ZjqzXL8+1HIXIJpVRPTQav5K8pakEp9wmfYCX2SJt/82yK0QhnDpC19jD/CIBy7cLr1SxxO1GP5+l2k14h2E9KxJTmqEQQsYgQQUnPwWm672B0M6ovulrL3Ns2cSxbtEfFEz6i6X72hAysyQUcukVOEn7E+Zub
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 07:23:26.4892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2926fbc-a0a0-47ad-f48f-08df4ac4ff3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037BA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7867

This series adds a __u32 smu_response field to struct hsmp_message and
struct hsmp_telemetry_data, so userspace can inspect the raw SMU
mailbox status instead of only the translated errno.

Patch 1 is a preparatory fix: hsmp_ioctl_msg()'s fd-mode gate calls
is_get_msg(), which reads msg.args[0], before checking that num_args
matches the message descriptor, so a request with no args can still
reach that read. Validate num_args first.

Patch 2 adds smu_response to both structs, set from the polled SMU
mailbox status register, and has hsmp_ioctl_msg() always copy the
message struct back to userspace, even on failure, so smu_response is
visible on every call. It also fixes a related copy_to_user()
error-check bug in hsmp_ioctl_get_telemetry() uncovered along the way.
Both structs grow under #pragma pack(4) (44->48 and 16->20 bytes),
changing the encoded HSMP_IOCTL_CMD and HSMP_IOCTL_GET_TELEMETRY_DATA
command numbers; existing userspace needs to rebuild against the
updated header.

Each patch builds individually and is clean under checkpatch.pl
--strict.

Muralidhara M K (2):
  platform/x86/amd/hsmp: Validate num_args before the fd-mode gate in
    hsmp_ioctl_msg()
  platform/x86/amd/hsmp: Report raw SMU mailbox status via smu_response

 Documentation/arch/x86/amd_hsmp.rst  |  28 +++++--
 arch/x86/include/uapi/asm/amd_hsmp.h |  35 ++++++---
 drivers/platform/x86/amd/hsmp/hsmp.c | 111 +++++++++++++++++++--------
 3 files changed, 123 insertions(+), 51 deletions(-)


base-commit: 03f79b70cfa59c76751bc176e6a85a5a67c91801
-- 
2.34.1

