Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011000.outbound.protection.outlook.com [52.101.57.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73802771B;
	Mon, 29 Jun 2026 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748620; cv=fail; b=aiDiwjQ/RqZZKnMviPHzM+XyXTaD9TP34BPPH7p0UBwLEP+oBiIoASc7uz8zHJAZqMgcNXnnB+bkg+6U5Jc3ZmnvTCX7klw9Aau326/SysDRYvO7Gdc5e1vgBHIlw3hIjlv5yFQk6CT0FFA22X48n4BXJKZXLRftet78y+YDnsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748620; c=relaxed/simple;
	bh=EuJ9JDAgPZZ96JWb41Ogl1bMutK3xLRZOAwOYOrrKcg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ajMS5e6qH8egJOFHaWexCiEK+odqo4aGPTjuQKdWqxjZSq4z022OZ10BMhnKp31iasrZEzhpJCah1ch+nHF6pgH1pVlk+QaKjjpg0jeHzVlIAitDn9bu5lXydvOfUUVW4grg+hffZw+QON6LzvZi2mNmqDvHRTEJccuOSw39hgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Qzwawr29; arc=fail smtp.client-ip=52.101.57.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Qzwawr29"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFu26lh35m6D0Xzj0brO8ppjtgn1g7xMgzxAtECRiK6XMk1DeaqrmA8azam/KV/HjcuoDyVwCwc3gkDR3M/YTQC2nBOUAZao4EONmGolFPuuvoHOfk179Fzg4AqKi5lYy14QnunwLbQHYibt+ljkzzKyT4AO2TyPSv5wvoy6U5QimarifVgqNBBULSBp920aV1KqDu33FU/mge8hGiY3PaczNIwuXFhhCu1StlDuv1pSu6uYjKhWQh8XEtnWoXKYSqCQX28nGv+rgqKbFbJr6FqnyKgHm8buBzGXQ9KGaoRwXl6kmbjdNFyN56GwTjwsoxfPheSPcNMyFYCCRnn2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ou0vZXzKzIIY8xseqkZSt7dfnkPAnFhvkZfgxU3SiCw=;
 b=jg3MMlpsUXKKzUCE+5O671mzVtZKIwA0lauuwo5jJwzZ0aJp682WoS/qN1D3QKKrsMWv/4wX3mhZJLbF2Hdm1/NNa+Tomlrha11BrVXopEYKS/NdlrV+47yjDLDneFn51xfv+ZBrdejOsDtkYqOjdmzEwhM+cn9FiqimDs6DRIO7IsoYnPN0noJTY5JV+ykrJmmgZPo7EFEEOpoBhJMvX3EWVNaFY3Ji7Ky9C9DnnIiIbfwKdoG4dfEk4TN9PBxCI067lFPGTUnCtJcwIDGDQfskMD61Ry6ILHgDdK/aUdqD1wuJO6lTlCn7vOYNRcTJw6fRhvUmnStM03qvg/5xyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ou0vZXzKzIIY8xseqkZSt7dfnkPAnFhvkZfgxU3SiCw=;
 b=Qzwawr296Kmu23j1a7aD9bS/oS3fmAbmmMyuXcFH6ojN7mZ+qmW4RDUpGyV2xlRtD6NO+kTMgozChI1uA4NFEg+TmK8VXQKoQfyddzF1cL6JX85+iafccKqcDDVp1iUR7T+ca3oIkGP20tc8JsWlv2N5/04qEX4ADmty98zqqF8=
Received: from BN0PR04CA0051.namprd04.prod.outlook.com (2603:10b6:408:e8::26)
 by CY8PR12MB7314.namprd12.prod.outlook.com (2603:10b6:930:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:56:53 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::2c) by BN0PR04CA0051.outlook.office365.com
 (2603:10b6:408:e8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Mon, 29 Jun 2026 15:56:52 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 10:56:50 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 0/4] platform/x86/amd/hsmp: ACPI input hardening and data-plane readiness gating
Date: Mon, 29 Jun 2026 21:26:30 +0530
Message-ID: <20260629155634.1807598-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|CY8PR12MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aefa1fd-dda0-4617-8727-08ded5f70950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	pF8Ml3Q8g/e+GdlfOFMHJDymAtqDVYweYkxFC+oNDNa7Rl/DAIKk2oNbHS6zgmAGWsbwD2ryYPmk6vIJ7FCg9O6BMCcIvrXbbOwyIVZbSbAHeEwXrewRLy48WIjbpHY5CXunicSsVFSDNDfddC7gJ5RmHm9ysqxLqYJE4KT6usyr8Y2leTpd0R3RA37b5V3ALuonjoYTEJrGl0YF0cJPi3MTHnNG0FwIRyXrlZAtTZMwvp+RatOLQPSRLiLm8ItogWYXnwdGWffAJyV1Vo0KwQ/Yqpd5PuxSEcYZOQ++qZna5bYYwMpiBdsGWqzRIZLT+Z+Ah4sXbvvGZUpJd380I9nLy1tq4z+Xtddgyn61BM6OmoIyN4czLCTTdnxzOFuRHsFDFXhg0156Wf8jQVaz6N/Yoom9YvfmH1Pp8ooQNIFteygfsCUB87ghtYqGrcnSl1lgH4VPkt8RGQpsDAvbWSpx+ZKcOvvDA4d8iBMmM6lbiab/zV0ctSWLbhT2LgaK2eRw8CbNKe2Z/99BcvQ+mjsHh9oIpSIPBezxGen6XC42PKyaLg0wlF0R7JyjGaB7KRgxP28aNSa9e/QSILnEXtbKYTaJhkGOof7GxmePVCMRLJWFG17oqiN8yi22qn5bAlWpNFYEkPuVwaYvOEXQRRofIb+88588nzCmPbVrKTj50s4vTNVSvnWYdCjd0tTXc6dK+evshui3pAsT1qGnEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JNfIzOkvJKdj2ZVrTJczco3AGsk0uDZadEtyVlFsMSD0JuxCpT7WOf4Oyc54IcecxEnWOcC3oOn1Z39kWP0R9hYy94cIlBIybZObqgoXUkvtj0OgTPbnIhhJNjgaQwwfOnxfQNe9mh8i454xXoT00Ka+Ba3Bl8JGpp+WnVeRvTd11Dj+nKF/8Vc04rxLQ8rDPXultxKjGmDYrA0hqqmvOsRlJImBqe9gGUR0xv2pkAJv5sDBR7fuGx9ltFd4kj6kgcdm9Lj2jHwo3BbNUIiT4a6bG7nswFHS/U75Dcb3XwJjyTXbLZNZM3dZWz3+qA2xv9Ynl6QmyETgNYv1OwVYJjiPuc0sCJaV7kbKoz7+6GeFmsmKSugrFbOqxBXfV0zsrk6WprAfBgBh50dWq20GJ7y6mukBqu5z8oCyhABs0ac4Il3pzP8h6EVZMOT8kmtY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:56:52.2663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aefa1fd-dda0-4617-8727-08ded5f70950
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7314

This series hardens the AMD HSMP ACPI driver against malformed firmware
and fixes a data-plane readiness race on multi-socket systems.  It is
split out and reworked from the larger HSMP concurrency series.

Patches 1-2 validate ACPI input before it is used:

  - hsmp_get_uid() passed the device UID straight to kstrtou16(uid + 2)
    without checking it; a NULL or too-short UID could dereference NULL
    or read past the end of the string.

  - hsmp_read_acpi_dsd() dereferenced elements[0] and elements[1] of each
    mailbox sub-package before confirming the package held two elements,
    allowing an out-of-bounds read on a malformed _DSD.

These two are based on the review discussion at [1].

Patches 3-4 close a startup race on the lock-free data plane.  On a
multi-socket system socket 0 exposes /dev/hsmp before later sockets
finish probing, so a message aimed at a socket still in bring-up could
pass the sock->dev readiness gate and dereference a NULL virt_base_addr:

  - Patch 3 is a pure refactor that threads struct device explicitly
    through the ACPI mailbox parsers so they no longer depend on sock->dev
    being set early.

  - Patch 4 publishes sock->dev last with smp_store_release() once the
    mailbox and semaphore are initialized, and consumes it with
    smp_load_acquire() in hsmp_send_message().

These two are based on the earlier submission at [2].

Each patch was built individually with W=1 (no new warnings) and passes
checkpatch.pl --strict and codespell.

Changes in v2:
  - Split the ACPI validation into two focused patches (UID and _DSD).
  - Split the readiness gating into a pure refactor (struct device
    threading) followed by the smp_store_release()/smp_load_acquire()
    gate.
  - Order the parser arguments as (dev, sock): dev is fully formed while
    sock is still being filled in.

Muralidhara M K (4):
  platform/x86/amd/hsmp: Validate ACPI UID before parsing socket index
  platform/x86/amd/hsmp: Validate _DSD mailbox sub-package element count
  platform/x86/amd/hsmp: Pass struct device explicitly to ACPI mailbox
    parsers
  platform/x86/amd/hsmp: Gate the data plane on a fully initialized
    socket

 drivers/platform/x86/amd/hsmp/acpi.c | 53 ++++++++++++++++++++--------
 drivers/platform/x86/amd/hsmp/hsmp.c | 13 +++++++
 2 files changed, 51 insertions(+), 15 deletions(-)

-- 
2.43.0

