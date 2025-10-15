Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013013.outbound.protection.outlook.com [40.93.196.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222C62D3ECA
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 14:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540128; cv=fail; b=NzWhBl9VJj5++mk8aBSb0/0O/8ihveGKFc3ERnXLNeUU0upkP9/20bnWau4A7Lgrm40PN8Zi8W7ukcyQWbwaNtfgutdeo2iDQF0NWc8pwxusoasej2Gg/eih/SWu5o2mC3b9Yl2A0MGpSkrJQY9m2DFVCcmoB7m1e7o9OMS0V9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540128; c=relaxed/simple;
	bh=sbF0toWR/QvgKdqIXSymf42pXy2P2V9z/qIgEVxqNng=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gvYmlOSeF1H6L4fRVHzM8BYzckxRVkhHon2JJBg3VZ5Q9ADBKc+mrg/BYZ/7Z5tnxUD+wCg6NJJDcomDLoaD8pWg9/OED/H9DiVfj8+pNjo6VRxib7U8Lf2s4yvFNh+3HHrY9wYCTTUfBpTQIY67fHfjPYucZZk0wtDxdSroXp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zbeNgyZE; arc=fail smtp.client-ip=40.93.196.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zbeNgyZE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPNr92iK3TG6XqYk7KNH43GNuEYmm2Dzip5fDBwfjERs7ISst82IxYkRiaG6WsXvXK6vZS2gTWkOufwr7h+MhwGaJnjEZFx4maqNDbyEGjZIKbIgQR5g0iMkOhJP1zNsSdxvbu1cxXB3EgcBRnEscICs78AhANlro4wvHh1eG5cIKR+HU/+fj7Tt2tuLkHIMZeoK2zJJR1JyVHoOroVLQBB5MBbmPm9Pl5t8376ORCUGpBCyVFZtGsAWh+Lp6AgfuITPUQgDXA95DmGx+vgFKz46r1QgnesBlB5FE3AvxbSyn+dBTSdEgHutJRNpphStlj+PrSoo+lmguDSAWm1NFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMuofGRYiBgzsQLApyN85oGGN1QvWKbuw3YWYGrh0n0=;
 b=xE3Ya2wbbSXRw6/BdviyXFogQFiw6fguAI8v0oedbl9EXgypfqmYdbW90BW2+cTFxPV7anxhJjgdZQKkg21q/frCrOwpTMtzMXbQ3hDmK6g/0DkFXFB4tAy3erUtvp/F+hDJSMmL8CkbTNMZ4k/uKCwXjW/xTAan9i4+ai52bR4HTi2GQzrokcIu/D2yimUxQuq4Y6WLCOH5O7l8g8Ehuxu2W8IC4W4HqjE0kpnAvePhPj9YE3xRVSIb0suJ1f2rworIcevh2PTeY6Dn+mmTnnTQ2MgXRup8ndrfKO5A4ElGJn8VmWX9p/mc8Z++KtnXsTcDIc7n6TJz1ifsjpmtEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMuofGRYiBgzsQLApyN85oGGN1QvWKbuw3YWYGrh0n0=;
 b=zbeNgyZEt1Ks/1t11C6uaMZ/yDMlducJM7X4Zj3E3AxpOTY9+3JEnbrhk+/DtPIuKzDasAIjXQA8u7j4PZPzDpJAup5IusHm2F4VxRiVpSxt1xJn9YyvKDE0+Wo4XqMJL4O2I67SpJ5DRQhbrdVSYxJNc43pZRsylYPUNVYF94k=
Received: from PH7P221CA0054.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::34)
 by DM4PR12MB8499.namprd12.prod.outlook.com (2603:10b6:8:181::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 14:55:24 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:510:33c:cafe::f) by PH7P221CA0054.outlook.office365.com
 (2603:10b6:510:33c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Wed,
 15 Oct 2025 14:55:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Wed, 15 Oct 2025 14:55:23 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Oct
 2025 07:55:21 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@Dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd/pmf: Add BIOS_INPUTS_MAX macro to replace hardcoded array size
Date: Wed, 15 Oct 2025 20:24:56 +0530
Message-ID: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|DM4PR12MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: faad45c4-bc5e-41f5-f256-08de0bfadeb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IH5vtqNtoXwTTqejhBYxGLwC6e/SuxkkZbpqt9hOgiyglX4xx6ThheSzSbRh?=
 =?us-ascii?Q?pFwf8X9jk+BbUKGl+2BM+eRKvbcj1bUCiR5BAgeIJOVX3OVnaAIt2E9XzMGw?=
 =?us-ascii?Q?sdOvhd7SnB2VkvZGj2vPdAnVH7WZXPTqNUYXQKvZNOrBBaxVQskQInT2RDLo?=
 =?us-ascii?Q?KT9wxPnOfAJbL9g/0RJAGunfC9AcveMIhILXzsjgOXihCdVtT0CqdS0itxaB?=
 =?us-ascii?Q?vuNkdq38dlA8tx/PuO3UxO0+86H2iz1hpHsdi+r04vE9CYfX1CgY9QpHhc7T?=
 =?us-ascii?Q?2NvzH+I+prN5IPPyEgR5WURjlKFW3TUW09chbO6WCnPlWrPAurXPw6KUozVu?=
 =?us-ascii?Q?5o1fCM+rIt1tEi/SsyZbYb3k+LEnhffjrlHmuJ1vGOpAjjAOjkMNwDhJwBv6?=
 =?us-ascii?Q?RRWqn5yExFuEGrs46DmD+FRW5A8dNvH+aoqcvs/X3+XePCMxkBouKqzNKIMO?=
 =?us-ascii?Q?xmOsZdcuApryeVuDBaQnsEmIqrYCod/Io2B674y73s3QsgTWWE/RLiRzVPO3?=
 =?us-ascii?Q?ciEsepYe3XdkZOHXueG1OgwrPuqo1AlvqBVIIbH87YE7RlYdsAhI2s6vnXns?=
 =?us-ascii?Q?7mlPYXIOCodx8aj0Yg9RODwlfBnSiuoqK0DVhsJ8OJuB+JypjQHZnHUppLw8?=
 =?us-ascii?Q?OFrjQ8qTsE45OrMyXV2+qnXOkqNsfhr9HHypyh5zW7i1JJVRRkEM3Rm58jxn?=
 =?us-ascii?Q?2j2ZnaMGQUf3y6FcaPvF5SmEYxFPxHLtX8XdSQvXjp54Yf7XjSrBfEm0pM8L?=
 =?us-ascii?Q?1MAiMn+ylkgTNAPy+n+igMhy0amluPn8yqAxLb4r53JI2wg8juCYFlEKFyhs?=
 =?us-ascii?Q?XFr9iJAGPfKxanVdhNl7mQpAr6TzjLKOnerfjMR22M1AWNqdtCrpWMYimCPo?=
 =?us-ascii?Q?kEPdVBgThwNcsUJLeoF3xogQ/4xRC8s9xQ3fGvMzjIRvNJp7JtqtGI52IpWK?=
 =?us-ascii?Q?xWzIxznlGEDId0YLIlrJgC9/QEzwtdMagd1baxMnVdEfaJgc8eo1ohkZSE6F?=
 =?us-ascii?Q?cHuDzC2heMV79vRXBHPvySF6IN12eU2+nwFaM/9ay7LWxhZWQT9Xi/O29ur/?=
 =?us-ascii?Q?3qSUYS2fVcvLbhghOz9jly+KV5vohddbIU/iA5E7Eyeh3BIgkeJ8u49qJcaO?=
 =?us-ascii?Q?m/XaILkel7fWgkeEf9FwpQcpHccDV1VuwGWpIKn53BQ4H9l2avGpWBm+wXRE?=
 =?us-ascii?Q?EH5dKb6LZNYNQ2wJ3FLbXi9NwZpejxKnY7lngj11K3f6zKWYe8MKewAb6z0H?=
 =?us-ascii?Q?JM9vvnIN0TdJPn7ZSh/ccbUrcYi5cQggN8hsb4GHeusJnMFPDhP2XUaxBKbz?=
 =?us-ascii?Q?gi6cQszxpe8eeoSfwtHvr5MUsblczfJGgVPEyp5tqJArDmyYSef7CZghNUd+?=
 =?us-ascii?Q?0QupipPfoL3WySRAjw8ikJU3Ff1PDFlE1LjlU62j0cZlC5AsispWJKFKuoYl?=
 =?us-ascii?Q?s/6sBPMipZ07ppHIA4VlD6iQddkeaDo8grD95pfXGAlY2P3wT4JDg72zsJfN?=
 =?us-ascii?Q?fQzsi+Ydf703Ii7C8tnIGUa8KrTkP/rt6ZFPpbhHSaNnjAd8bW41Nkp8A5bl?=
 =?us-ascii?Q?lkWzCI7o2IYOSsuZLvI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 14:55:23.7783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faad45c4-bc5e-41f5-f256-08de0bfadeb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8499

Define a new macro BIOS_INPUTS_MAX, to represent the maximum number of
BIOS input values. Replace hardcoded array sizes in relevant structures
with this macro to improve readability and maintainability.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - New patch spinned from v1
 - Add new BIOS_INPUTS_MAX macro and replace hardcoded values

 drivers/platform/x86/amd/pmf/pmf.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index bd19f2a6bc78..2145df4128cd 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -119,6 +119,7 @@ struct cookie_header {
 
 #define APTS_MAX_STATES		16
 #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
+#define BIOS_INPUTS_MAX		10
 
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
@@ -204,7 +205,7 @@ struct apmf_sbios_req_v1 {
 	u8 skin_temp_apu;
 	u8 skin_temp_hs2;
 	u8 enable_cnqf;
-	u32 custom_policy[10];
+	u32 custom_policy[BIOS_INPUTS_MAX];
 } __packed;
 
 struct apmf_sbios_req_v2 {
@@ -216,7 +217,7 @@ struct apmf_sbios_req_v2 {
 	u32 stt_min_limit;
 	u8 skin_temp_apu;
 	u8 skin_temp_hs2;
-	u32 custom_policy[10];
+	u32 custom_policy[BIOS_INPUTS_MAX];
 } __packed;
 
 struct apmf_fan_idx {
@@ -355,7 +356,7 @@ enum power_modes_v2 {
 };
 
 struct pmf_bios_inputs_prev {
-	u32 custom_bios_inputs[10];
+	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
 };
 
 struct amd_pmf_dev {
@@ -451,7 +452,7 @@ struct os_power_slider {
 struct amd_pmf_notify_smart_pc_update {
 	u16 size;
 	u32 pending_req;
-	u32 custom_bios[10];
+	u32 custom_bios[BIOS_INPUTS_MAX];
 } __packed;
 
 struct fan_table_control {
-- 
2.34.1

