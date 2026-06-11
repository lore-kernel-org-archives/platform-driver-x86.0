Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DB2358360;
	Thu, 11 Jun 2026 05:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155798; cv=fail; b=tHWBqYK/5yrGZ0wTTDVQe/WZAS5P612D+GpxHhAbumWa0MCIzit4CX2mljxT/NdA77dTy1tMp5cLKGlpM15DjcMD6mUdlJrEug0yCUmVFgR7iCaXGk/KaVcpScGdk5/V0wGZaIic7Pgvmem+/2Ao5hb+tr8H1Q15CQSlUVWZvN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155798; c=relaxed/simple;
	bh=5o2XC91ML7W5XVgRswJKXwTcyanYwJpeakfUsfBKC3Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btXH2Zx7n9dNfGoX2nw+D23eEBWH8R6QNoCqErfaSs1OhDMdTq3BCLY3uNijxp+EuT0AGntTnb05g955B0pFX7yoBRroRN6/hZT1eSelmUAQQIObSfsFaNcDSUcbbbJh1xqlNZTN+5QoECelMHfspE1waiV3i8wwR+wBMyIYvOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bWmZesYz; arc=fail smtp.client-ip=40.107.209.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bWmZesYz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkOV2iGwWtvnp+dHByscND45Qodrx5Cw1krUJK7rxSkHpC61qCnUHRHwVbTaWmKBiRXqgplT8nN/vMQWPRg5tKsQ/JT4prp6PjkjuE2UER6PcgvoMDru/gw6CKl9Yp65aBBG+fFg4NFhmTt+SKoNQeNhNEi0fXUVMQ5fED9fqE8J5LTpf7wSzbZrYlSUAfnvnPV+Iv6z5zo92IjOp6GWBPDND/fPAY3AHrqBYWxlJkCRDArdK+AnMBsa+HoE4q/gG0c4PL/3ZjtdYuy/C3gJvVdxxNwxGjm9ItMApVeACiAmywT662UPBCjoI2JnDP6hhQO/pE/upbozwnrM/QM++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdGY+CMAHTFyPWLhOZzJXZFPtV89jUg2aX+bSgUthBo=;
 b=PRTXswljXq2SvIy/Pt9Ld7oo8fSsyKSHgNJv+h/SxaAw/HbL3AdvZTufiscRnVEMpHGaESLg88IBQYIO7IGFPC5vXoVP4clN3F6haeZT1b2APiL6zqrHuxx1iTInaTfEeBWO95ADAxtNzei4xiNpsY51HNiul0CEso2Stt0LBCEVHUGsbYfx4aQMt4cglVjhozcbhioGYfUUIk2f6KwdDsfqO1HaIKVHiPPi9fKF4ck+nmHB+1E7pjtRNMgEKbZyk2jy92otq8wYwM0d9JNdMcPx/PZdHE9KMcH/MtWEe3pns7wXE7GJ0dEfkSr3ahnD4pUiHfd3CqDz0TTSsZLBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdGY+CMAHTFyPWLhOZzJXZFPtV89jUg2aX+bSgUthBo=;
 b=bWmZesYzD6+solSxtHzc9q6/K2NPcsosY1D9E29wuYxc+0JG2vMF4C3J2AzpQfCdqlpC+K0MFch6dBm2M05DWSj/PLBoUi0UtJhqzWVdnbY3OdLmZBM00Mb81v/VLWyt4Ftca3uuJ1FfZwbz+829uB6c9HhTSUx28ao+PCgduIU=
Received: from CH0PR03CA0322.namprd03.prod.outlook.com (2603:10b6:610:118::27)
 by DM4PR12MB6111.namprd12.prod.outlook.com (2603:10b6:8:ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 05:29:51 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::a9) by CH0PR03CA0322.outlook.office365.com
 (2603:10b6:610:118::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Thu,
 11 Jun 2026 05:29:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 05:29:50 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 00:29:48 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v5 6/8] platform/x86/amd/hsmp: Sanitize hsmp_ioctl_msg() msg_id for Spectre v1
Date: Thu, 11 Jun 2026 10:59:17 +0530
Message-ID: <20260611052919.1095549-7-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611052919.1095549-1-muralidhara.mk@amd.com>
References: <20260611052919.1095549-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|DM4PR12MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 51805509-0656-4b9b-f1a9-08dec77a75bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Kw8iGUPAjILjwFrjY2/Ni/7PrwUo5RArQ+td26kf6bLVHR5JiAjTjZs9F6rU7N6etYQ1yvY3H9qSknmJU1N3Q530u8OiCfdN9ByraMzmMkDH+nX7rgdc4z2+/Yfl5ov0lKNQPDZGQ7133CENAez7+Aa6kMJSPM6DPziLaXfvoYyCypMFXvj70jH7AJpqPQBWJUI4VzBWh8+7RcHSBdpOGM6sjxOSCbhfMc5qVNESs6SBQ0nG8Ftwxf0m73NutW9pASH+lJ6iv6WWhzeuNKy45XmOmI/JpccUn6tc2mipeUbNCFB230mYNdrv9sQhNEpuETTaWsn+OKTIZdTSESGy31Uc2O8luUjntE+OI8wgVUX7R5M7zJ8LZe1BYaNJL3IbVE2cGO6oTtSgEH5JJrXAwc7II2XOgLSx4MD4x5gM7tyEI5FcxoiBk2sgcjUUeQ0jSmG5CBxcsXQxqUUomTtzpFqS4eLXh9Skia97cV+0ZXGAYBNKMriIAvjhBYKZDFGsV7f48NxoHJMdUC+gULoTtcz3dxAi9JxY4UYXQs25iM4YO8GLgY/02aQW1KZYgCjayDRrv65fCUIHhs01nwqZ7cBvXQfZ/Z7PvG9NIiqDT+vLKNCZhTVUYxcRqBZXyVERBxE6Jij+N6MCY04JOXa/JQydPIHZ++sXMSN5POvXx7IuqPZH5LgDjti8de856aUj1QCWjFIxUGVDCdo47p3IE0ukW59mm1KLRK9N7N/K37g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VryZTVi9uegtY/x9OsEGDDaRA0arLMFWmel5znfQJytJKdFnZGmYOiDYCunuLPVzZFiqsA05qDpkARHZdcVEJduEQTDo1Wx9tazOKuVZVLShwo3YjzrcpxZ3B+4v4P8FeIi7deiBwbY1mLG2QncX0vitbO13Ma6dAbpTWLuq6RMfuOYbMd4NE+ISmrUY97OD49BqAyNztk+pjvOXV3cFXpxgrQff9w4UzWtGPP8CspIrKpq0rMEzcwdrAJvQ5Om/HA4N36ijY8djtlj4OUZOqhoOECyCKI7oU5TsOMLP3Dybvbacd54ivRcqJEbZoFB/3qGPvEdfR5GlR/DQ+PpTKcz1AyPASq2S5XUe+R32Dblu7MjTNrrmIM7J69CAP5/xhdnw3hxkKs39WIezJ6LtAuAo8jDCSIy7QcFCLXZRQAvkFet697fa73ftM2OZBiRa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 05:29:50.8057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51805509-0656-4b9b-f1a9-08dec77a75bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6111

Although validate_message() checks msg_id, a mispredicted branch can
still allow speculative indexing into hsmp_msg_desc_table[].  Clamp
msg.msg_id with array_index_nospec() at entry to hsmp_ioctl_msg() so
downstream dereferences (including via is_get_msg() and
hsmp_send_message()) see a bounded index.

Reviewed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 36ff83744684..a9dca97568b8 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -306,6 +306,19 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 	if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
 		return -ENOMSG;
 
+	/*
+	 * Sanitize the user-controlled msg_id against speculative
+	 * execution.  The bounds check above retires the out-of-range
+	 * case with -ENOMSG, but a mispredicted branch can still let the
+	 * CPU speculatively use msg_id as an index into
+	 * hsmp_msg_desc_table[] (here and in validate_message() /
+	 * is_get_msg() called downstream via hsmp_send_message()), and
+	 * pull arbitrary kernel memory into the cache (Spectre v1,
+	 * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
+	 * dereference sees the sanitized value.
+	 */
+	msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
+
 	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
 	case FMODE_WRITE:
 		/*
-- 
2.34.1

