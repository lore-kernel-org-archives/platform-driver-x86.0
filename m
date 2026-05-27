Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012058.outbound.protection.outlook.com [40.107.209.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7412E764D
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890556; cv=fail; b=dzEBcz1OD/ITBgRPEpoFtlJmBmnSJg6myXPitkAtacdn0THE8jVHgABbsbdSUXpRY7c6uP26RN9jURInzvEgc0IKTbDWBsaPvPCiNK7Y6rOupID2qSzlXaZMo0mv7m0qQYeM+USfgZoh8FU7t30qD9EOHIbsL7kngiyFozLfW84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890556; c=relaxed/simple;
	bh=EEJyVFDxm5Zs8GHwgOPNDElxZnuop9NLPVgojfxIPcY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c4WEd8h5DOjHQE75YPHeYjegfiw0FKH7vWxmGrSnU5XiBKaQcQs3WMoxmTaQpF49Zw2v78NdrJzvHTDMZix3TNFiqpuBDVUgf/8DN8upY+S7V2Mvlkxi0lGAC+wp6VO/VwU5t+6nn2igiVT5MGHEuluGW9ApLik5OGCFsMZ5UkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oumn9CER; arc=fail smtp.client-ip=40.107.209.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oumn9CER"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEOGvUV1l+/X4AFejMT6KnH7eVbUCnQc2PNop1fruY0UEpLzAZoGbpQ1kePyMZupPJLUaqlseM7R9y/Vh2WoDoRMtkxYMQNDG1jsuLKVZp4PeMCOp/oB1Lhj3M1buPxahH6nAdS0PYb8iId5XdCZIHJrPbEsODUtmJelEz5o2wBgrVUuNe/1BSoWWWSzR9kRcEwBs/7jw36/TUp9f2gPWtbAcDis2MZH7j5AS78zwFL6CNThseGBfN/M9IKUtikEPvDtTJNdHuxoQor473oxOqb2l80wlUb0TKibo7NX80amBzVTBQ+b3Z7PX6lwFRDISAw2pI28Gq44tpFDsrFcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6phXUipCBKYg63Xvj36tUA6CeepNJBmCaqlX4qB8NM=;
 b=dBwyHd202MIFqISJrmb12cHE+b46I3q57LcuMfAUD2hyUUw0qkbV4AZujHh2iWsv1h82yuBY9pfFaDXkdZEUMUTslc3c8dB9WvjxqvgxFLtN5UDNnod3UtX/9WJb33f7xfkeudoCoNYqkI1V2cHVB7VeKxyfSnbNgwSVVbfnfhOFyT8Upx5Jrd71ZVFdPpNN/LxPWc0r2J87MaOo28Z3BJfWz4VLZ7AJ271dEQBkJho8PXRV2+GbhYcwzgLBWLoalVQmqWsb+vTC7MrAIuho7KOUCRZpGItiZjCTmsCZp78mBieZ51x9REGsEqMjnDnzV9UXt4kyp0kluZ+wn1AQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6phXUipCBKYg63Xvj36tUA6CeepNJBmCaqlX4qB8NM=;
 b=oumn9CERJq+/fm3bd1vVaE0bSGCMUt19QlsZaEoTDfKHTQ5q7be9IEf1+BkXcfo4hWrSApS9XT+NuBuc+ayZI7HiDPua/2XMqyBt4mIVVYOmvYbXfwco4s+6RvVHtvsNNn4ZzPGee/Jr8kesZSfV8rjcH/fEScMnOKbilKjcop0=
Received: from DS7P220CA0078.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::12) by
 DS7PR12MB8083.namprd12.prod.outlook.com (2603:10b6:8:e4::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.13; Wed, 27 May 2026 14:02:31 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:8:259:cafe::aa) by DS7P220CA0078.outlook.office365.com
 (2603:10b6:8:259::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.21 via Frontend Transport; Wed, 27
 May 2026 14:02:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:02:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 09:02:31 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 07:02:29 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 3/8] platform/x86/amd/pmf: Add feature discovery support to util interface
Date: Wed, 27 May 2026 19:32:00 +0530
Message-ID: <20260527140205.4073335-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|DS7PR12MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b01e73-619d-4e75-ecf0-08debbf89870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	TDHvQf/akO524+oXwX1KJ5ws7ywrR0Btk/BObQW0xkgNJuMSK6PO14TdY/Wxh9059FHtgIkHnRUgcicW1hNkzQSvANC3y7nzicOxdaEh1s5qdpBPShtmoGfAVO3N8NuYoBFJK2k0Q4/eVWijy77w8A6zE/7VAo4imv/sHxfayP945deg4WbfZ+FXTOH6uqMQ+cTggUvUhDnfQfA2a5c9Z9BjHucxcNmp9z86JMNCvE7LHSBm6oMtS8S5rmlNBep1bEpyBeP+4dT6uRxWFG3mlamB5eG8MOaiESSbD9zy4tQBuYySsl4EXLjS45h5N0yvVi4TXVGYLv69XE2P5UpAIwwg6l3q/WuTdSu/BNQPrcvVGR4V+ETei9q8roiK3LQXzeYi7/sokYLIzHmwPP7l5LLO0M9eD4eTmd8xLV6vRi8bVqB2OhxNa8i5up609RBs7ZH4lLcsNBgKVlIglctc7V6G6uarXrBI8jDshFJlWUo79apQ2Wf4RZqcJrI+imytRb1yH5enz1/nZ4ZwS4+g+XiFd8Aha/Q0fNmtB8WyPfEO1NfDhDqMi7whxpyy4z+V5hb2qdmwBq4J7Qg9FLD+8wiI1tMt6Z+0rBY3aQ8HiZHiHnlAmn7h4JK0B10KlyYcK4pJrYmEKtbNGXGYPoP6iMrVEhp3nOB6UFwT2HirkDFYaGKyX2TLkvsSFv6sBcc8suUBYHcWyjBK0Dv+g/RTB1jIrrVeGh1RCgze1+3nwfs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qAO3Oo3jWx6VjkIYqsx/6Sm7jxYtvmbCjZYtVaRvJ/AHox/uvrAkwsVCC0Cqieuijb2fjOQRGhyCLUNc8HdxLHSIk+vUO/UU9hpdzu/kbVHFN1DPc1KvPKZXrURNQ5JjG0FPO7WXfV9iKgR0ml+3uEHLVkrFpac9U9ufR4+w7LN8h5HmxsasAVrOtJwHKvxJhWO0HrnYwpW8+P7RRuPOref0Muvel2fvoK/r5vGO1TT6JNnnTG7NFAzEzfunQn9TCcmTf4+zi4/IvZTn2KB6wuicNz7aP2fvs+8EllKBAqy3Z5YoT8l0OfBnHXEWFWQPAZdkQU05MiwpXG0AqqmjZRYphHDSWxWWFJyCMFSOuMUNmIde13m5jD+VjbSFTadlsBW7JZETeKi1l+f2kkmtBwFdF39cwm/Eg6DL/JVU6r5Ya11hGl2Sr3fKQa/psNJk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:02:31.6190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b01e73-619d-4e75-ecf0-08debbf89870
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8083

Add feature discovery capability to the util layer interface, allowing
userspace tools to query which PMF features are supported and enabled
on the current platform.

The following features can now be queried through the
/dev/amdpmf_interface ioctl:
*  Auto Mode: Automatic power profile switching based on system activity
*  Static Power Slider: User-selectable power profiles
*  Policy Builder (Smart PC): Action based policy management
*  Dynamic Power Slider AC: Adaptive power profiles when on AC power
*  Dynamic Power Slider DC: Adaptive power profiles when on battery

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 include/uapi/linux/amd-pmf.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index d29a4abe1145..9de054cfeee7 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -14,6 +14,7 @@
 #ifndef _UAPI_LINUX_AMD_PMF_H
 #define _UAPI_LINUX_AMD_PMF_H
 
+#include <linux/bits.h>
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
@@ -34,9 +35,19 @@
 
 #define AMD_PMF_BIOS_PARAMS_MAX		10
 
+/* AMD PMF feature flags - bitmask indicating supported features */
+#define AMD_PMF_FEAT_AUTO_MODE			BIT(0)
+#define AMD_PMF_FEAT_STATIC_POWER_SLIDER	BIT(1)
+#define AMD_PMF_FEAT_POLICY_BUILDER		BIT(2)
+#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
+#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
+
 struct amd_pmf_info {
 	__u64 size;
 
+	/* Feature info */
+	__u32 features_supported;
+
 	/* Power and state info */
 	__u32 platform_type;
 	__u32 power_source;
-- 
2.34.1

