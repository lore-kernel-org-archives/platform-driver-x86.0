Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012004.outbound.protection.outlook.com [52.101.43.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4239933BBC5
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304338; cv=fail; b=UmFiD61aL9Hx/0ibdEOm3yfKuX1z0hEtdJZsgUiAYVIZab92qc+Wf9p6hrvr3bBQFynqf8Q7xaZugE6CU7QMOCE65+nsfKy/BwO1K294ggU1RK+HiEoLSkvdFbiyGEuq8kZSBthN4+Iefeo5XCd3k3H6/U/FjlFpTGjLkzkRYMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304338; c=relaxed/simple;
	bh=5oAiH3Fb7tVNZ8a1gAfH5razIpQjjBgKMjl2XHmaZ+M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A9IPblVxoCFIo7XpdWRT0QOOzOb4bflB6DBJBNMTkXgcGF/i77NTsP+QBiMItstj8TQCjaUVxufrTVqHj9Ru8qNidVASNoxy7ZGcp1vBfKB6YngLwdz66J4EQ+flkDTVj2PepcbJc40RVQDReKIvvMkIDgc32ODODjXShbAVTtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F08B2/6N; arc=fail smtp.client-ip=52.101.43.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F08B2/6N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9uV/4ShajCTjGwSiipnu/84aqudaQEyEupEFswtwOD1pek/VDmMu54jzl3AL8PhFSOx3P+LEO7NHbE5JsdqSPG2MpkCaCX9v6ILT8nUAgkwUyN2SbHmouYQV7HbAxrYlhodVkiaGgyYZ7jJv9sxKOUlFsXNyzynl6Z529kkD8BDWvE5pWgbvs4W3bAGXYnBCjdPjRK1RHCCMrz8WtC/HV3ieNrhRw0hNa5tiadWaa2MSAAt2nryewL2m284Ki3od/9K5Cj9g5GazmrZiveGB0QNRMAWqjQuWGtSWEh0lvEv2ZGdHYZbA4iKagTZEHW9xpKi6b91mw/YflVp5AEMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLNMy1FUq+vISQioy9Uw8I1r4kR1GcxUXUJDxF7RtNs=;
 b=PB3ZF0PpRHtBMwR+uWshr3ICc8TNkJHUfnG96Tqi+zseFYUT+rjpqSW9cY3R8Zm9saRP10ynomrbwlMhN+itMsMdfHgdwgwaaENziv1HwAG/w+SPMU4Jktt9MAazL+bi+vwMmIMSpK+3xGhuOxUmeg6SahowT/I4rBIWeMBjygX7POdPghH4PP1psQLU7L2W+z3srdor1MGcebnXAuTvAlZYdvMPWFuQ/thRtYw5p6xEsovoKakstMIgNgHkENi+93zn84EeV/k4ieOFU+qNzOl9CUZ7RcbUGsQSfU5F96INTKstRQygnV8vVnbzXXSa+CFjm0B8JPvX6sM0w/JMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLNMy1FUq+vISQioy9Uw8I1r4kR1GcxUXUJDxF7RtNs=;
 b=F08B2/6N+tVcvjPjOeYg8neDp6S9W9dfeHcOEHTLMrcpIqz2hvT+sYi0+CMuFM7ysPmGL51d9WDicUVNmjIpM01gA20t+oWWczHqkb1GIu4fXKJUIyHH9FsVCf3v8QSb8xzRAnlnYbfcsHh+e91xbV4bViV5cvzX9Riu/w/GxDQ=
Received: from CH2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:610:50::38)
 by SA0PR12MB7463.namprd12.prod.outlook.com (2603:10b6:806:24b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 19:12:12 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::ae) by CH2PR16CA0028.outlook.office365.com
 (2603:10b6:610:50::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 19:12:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 19:12:12 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 14:12:10 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/5] platform/x86/amd/pmc: Add support for AMD 1Ah Family 80h SoC
Date: Thu, 21 May 2026 00:41:44 +0530
Message-ID: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|SA0PR12MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e039b24-84dd-4151-21c2-08deb6a3b293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	0bSoKG5LehxJIXDIntBsfPc/maYJiN3mZlzC+dx+SlvmoFcPkXPDgqPOj/kvKj0lhIghHHZYfzv/w71NfMjEKZYHJGlNkTKXJV6gsbF1QA1f7AL/Krqh2ucbwylYTneGEix5IGfXrRbAhGwn/Z33iEbLBWL7VolsdomGMvDi9hq+AgCYjELzAe8GH6aXiwk08bgtZjxxacXGX3hboGRio0/ISm1Uj9/WXQ+TniNenN7j1UFyjmEo1sGFz1Fam+dY3BqGvY23rsET2S1kYoM9DdOgFwZ1lb99vB+RRit5uLMQJ+nnV2eiz60QB+yMUMoSsRD5OgOGYc9cdZKpuNYArES4qd7jQTIUEWqlhOQukECv9pCLbVz+OkGpHGjl+1NF4QDiBoK+n81PwwWePgEhZXKfeUXZv8BhKKm/mlWkPWN6OzzweKfvJJ61gOUd88bS43ERvxwQzUYecxzBySqkrnYD3OXW0VDtJrXZzL+bxVIvra2PIxjyHkBY1G4Avt8KopXjegTojPv7iuTM1PCfhqT/iDBlnubmKo7M3yVk7IrX79uhx7OxXafH4VF3CPMn748q87aW5iRo/bDaxM2nZF037yesEyJUY+dbm/ER74x0/nBMgJG6c7BKwfOOmqxERly+Pm8gOMggTrZZ4fKznyPgmCRQ2uP6FPCoK/x0rfJV0sS9xMDuRGGYBCbHzZzStkqeH2H3zbOR6PSEAQk8iv9nNuff7pcg4aEFQV3NJ30=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/wB5/aFbRy98GjwuvmZB8/Ds8WPVsKTY1TQMJvUd8NxcmENKtFG4HyG/+5SQAocItlFLE3F68un+JJOndmnntdFVHFO7b+wENG7fct9oAanFnkBzraWYl3twUmabWwaFU9gTx99knAdpbHvePN5bKAvJsHqx9gI3nOk8jpSsNY3GIcucZa4qo8iEcImED/HThKk++LcQfWDgbmqqshKKCTH9cBXjwJGqUgYqcjUWak3P0mwhPcRMYQFncpGnwNTCRoeJIF4xVz88M56LrTRnpxMleWV/Bh8n706ffrB2YQwJ576w8H9zKAyb1Gl6bu5P7j0GLyz6xxUJ1RBYqzuJY5s3+B8LNTnqkW7KuY/TnYtLzyU+PJN6OdTCqeKBX48KL1IKf7EjxJ6NALuLcmk/zV7gtvwVNM+nKkfJUIG8+NlYyTmeTb/XDlTYNdHdSsEw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 19:12:12.4556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e039b24-84dd-4151-21c2-08deb6a3b293
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7463

The series introduces the necessary device identification, refactors SMU
mailbox register handling for better maintainability, and configures the
SoC-specific register offsets required for SMU communication.

Patch 1 adds the ACPI and PCI device IDs for the new SoC variant.

Patch 2 refactors SMU mailbox offset initialization into a dedicated helper
function to improve code organization as the number of supported SoCs grows.

Patch 3 extends the SMU register refactoring to store all three SMU registers
(message, argument, response) in the device structure, replacing hardcoded
register addresses.

Patch 4 adds the SoC-specific SMU register addresses for the 1Ah Family 80h,
completing the register configuration needed for SMU communication.

Patch 5 enables s0i3 support for the new SoC by adding it to the OS_HINT
and idle mask handling code paths.

This series has been tested on AMD 1Ah Family 80h hardware to verify proper
driver binding, SMU communication, and s2idle functionality.

Shyam Sundar S K (5):
  platform/x86/amd/pmc: Add ACPI ID AMDI000C for AMD 1Ah Family SoC
  platform/x86/amd/pmc: Add SMU mailbox offset retrieval for different
    CPU families
  platform/x86/amd/pmc: Refactor SMU register handling to be
    device-specific
  platform/x86/amd/pmc: Add SMU register support for 1Ah 80h SoC
  platform/x86/amd/pmc: Add OS_HINT command for AMD Family 1Ah Model 80h

 drivers/platform/x86/amd/pmc/pmc.c | 45 +++++++++++++++++++++++++-----
 drivers/platform/x86/amd/pmc/pmc.h | 12 ++++++++
 2 files changed, 50 insertions(+), 7 deletions(-)

-- 
2.34.1

