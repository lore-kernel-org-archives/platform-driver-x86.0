Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3BDDDDC
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 06:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724049271; cv=fail; b=TxE9JW6gle8A63kPctwx0fkRMFLM9K4NtJEsBHKBpd1exklsvaEehh2OzWUATSPDHT7yelKAZ8lpKKiwBJIYdwq+3hAT4R0wGuCLNFZyDxZqYEd6cA8SgwiLC5yGKqu1jju9XOED5f+gqZN4vobq0pKWWKFn+q2mFG+cnkC0Zjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724049271; c=relaxed/simple;
	bh=1lDJ28Rc7fnKnOsL4YnTp6tgcHpnzKufNu4uEC+NYp0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JsU9BOVwaHlCRBcfloFRrldSVOSCJUHspUtA2IT+limDECcJoaSFbp0dY/9Vj5Hqt2B+DxTsL9A/D4A80NT5XiojDf9ZJc8+dJme4/f3G5FaWav+OBbfeEOs0nsDiiQv2ms6T9fAjnUqJZgJS14np1P7ej6nljLQuP/zukRq5jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Pcm7hE28; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Pcm7hE28"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXfkwGZPEV1f3Pl54NilfpvaNRSplSAADc8nZdj6gM1bjUNJ7Fot49G1GKz3N0tzfaHAG0RUqJdJmjrpanOq0L4QpwSJe1Aa15jzoSu1jmpHUZYlW4W2FVKVugQ2AtJRgwlGJyP73CUmA+zShqebxynDBLGJiJwojmcPhV1/0SXnxW+tB52tUl0UU1fM7FSdyTSMS0vk7ifG07TiJP5BE0bR+/E9kewX9/cOBDD6n6EE+p1rZIyFYVY71ZlSJvnTnt72H2fsBFqJrEXg+tmQVS7xYH1RXXoOstGT/asYLs/XU5EGN5/uS241Q6y25u7EtJC4sQLIY9ugB9WudjEkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJ+yOeqJ5qgyqteBa94qdwC97/V11I6/1QtSSpJGQvk=;
 b=k3lG5Ci5tSZkncXbg4uFo9WqzMgm/HDiardf+ATesf/XEx/VoEtYBEOhvFQiCY/0U2b2Be9Rf9M6jPZMxQgg5HZolyHwAqHU12F8xxgFDyyx0EfXePPrSyVGS1VmykcKl42BNjS3aQpKbD4+LfRePY51a48Oru6smTtreZjx8dNfQpaKHVlHUWDAXUPtFW94+1q9NXq8gw/2oHIu4Rk5qOi/TWTbnSq9EJLU+sUg36OdsN6GJPrscC2+I5Mg738FlU7gQRgU3khtawKQTCQOM0U82GSEnb1Pa2npCG+tvegf9InEuiFXXQ+cqawlJB9h6AGcL1xflK12Og1kANsvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJ+yOeqJ5qgyqteBa94qdwC97/V11I6/1QtSSpJGQvk=;
 b=Pcm7hE28NL6XIJW0hWf0Hj4AMjIBn0Jy9lEwg3F2RhwVBnaAS3VchXN+pauud9VGGMUUo3rzwguEkmKc6zW6k5vgh9phyKbAXo8FLIJCimj0gbakl0mxXilVmXxYtvApqUJs1pIvOu4IYiASW3s1kb5cqavirLGHo2xSdwumbb0=
Received: from CH2PR20CA0003.namprd20.prod.outlook.com (2603:10b6:610:58::13)
 by CY8PR12MB7434.namprd12.prod.outlook.com (2603:10b6:930:52::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 06:34:26 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::4c) by CH2PR20CA0003.outlook.office365.com
 (2603:10b6:610:58::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 06:34:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 06:34:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 01:34:23 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 1/2] platform/x86/amd/pmf: Relocate CPU ID macros to the PMF header
Date: Mon, 19 Aug 2024 12:04:03 +0530
Message-ID: <20240819063404.378061-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CY8PR12MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a47ba2-e920-4480-bdd3-08dcc018f85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T29lNUNvZlQ5bUFUWUlZMHRscUppTDZ0TE1Gdnl4VTA2QlMxYkwxL25pV0J0?=
 =?utf-8?B?TXJWUHVjajJPZ3BNbWk3MUVjeUhITzBQeE0xMnlSUTVhUHc2TXMxRXUrUmZH?=
 =?utf-8?B?R0NKRHdXeWw2UDFpcDdwWHZnUkZsS1NvQ1pTb0J0SngrcnJZZ3prUmUrWGE3?=
 =?utf-8?B?bWcwVGdlRmdWVUpRdXljU0w5Z0pLOEFKSUIvUVdsMFQ4UTJqampGZDhDZ0ZJ?=
 =?utf-8?B?N0NRRlY2NWRxK2drK2xyZCtHSWRPR05QczJZVUh1K2w1M0ZkZ2lYS1pIQytY?=
 =?utf-8?B?VFFZcHR1RFNFd2pLd3NmdTU0S3k3VnpXSS8xV0VQT2swQ3gwb2RtejgxUHlP?=
 =?utf-8?B?S3pjbDQyaFc0K1FISjNCVW9NTVJnR2VOenJBQWRBSWV0aGx6eDN4VW9WMlJB?=
 =?utf-8?B?SDZUcFRlV2dPaFhMbFVsdTBxM3llc21PRHZVUnRVMFIydjlERWFBK1N1b2E2?=
 =?utf-8?B?MUR5cFlwVUthTURHa2ZjZVZJdWlTVDkrM1pmL1dQcjN4b0VRU2o5YzNINXJ4?=
 =?utf-8?B?VUZzaWo0THdYSzNQZWhrZXBSM3NQcEhTRmxPQk9jc3pMSlh1Y1R5Yk5KcW1q?=
 =?utf-8?B?czBsZ0ZZN3dvekQ2dDV2SExNRm5kZHNYTW94N2FkdzBmUEdFUFpyNG9CV2pn?=
 =?utf-8?B?bnpVOThXSmZXWWZCTElMZC9iSE04UkJ1WkwwL3hIcVRnTDhpTmRnVFVMMDRF?=
 =?utf-8?B?bFpVWitFVzViUHZ1MzZiMXRzb2I5dTJ3cnE1Wnp6Nm5ldzBscS94T1dlMEZR?=
 =?utf-8?B?Z01WS0t0T2p1eGp0NFJYS3NnQURjV0pGMWlmQkpjQU53enhOdDhOT1VpRm5J?=
 =?utf-8?B?OHlIV0o1ZDFWaXhGNW1WdkZQZm1VRFNjc2FYMGdMaVRDSlNIclBBbEdaYkxH?=
 =?utf-8?B?SllkM0ZDMks2TkRyWnJSa3RjYVd2SnhrMGdqQUhLaDJTeGV0Z3FLRDF5bEc1?=
 =?utf-8?B?clAxQTRmQ21xVy9zMHJPeUJOVWxlM3lMVEhuMFM3VnZzK0g2NXhuQ3BVc01O?=
 =?utf-8?B?blRoeS9LaFVCWTRZeFhHZDgrdDZiajhmWDdDNE9XNE9CbGs5akxLRmNWREdE?=
 =?utf-8?B?ZnRYTzV2T0NaNmdmMlVsK0dCbEZSdE5qYXBsNUpZNG9DSUM1OVpMSGlZc0t0?=
 =?utf-8?B?Z0dRM1E5WjlrZ2cvaEY4TXJidHYvUUxTSnNIWnRxUDZTcWd3Mi90SGZLMDNX?=
 =?utf-8?B?S2l0M045dnpvelpBZ0dzT1hQNkpBTUJnT2lVRllLK0dYUGZzRGpYOHRocTlw?=
 =?utf-8?B?MStzM3VRYzNwOVdETXl2aHVCaDhmSzZjb3Iwdisra0VJY1BnNzFkbU5kSThJ?=
 =?utf-8?B?bnNlMm5UYzJuTjg3ZkJFNDBBa25zSUdBckN4ZEZtL2lVczM0amJDV2h2eVhY?=
 =?utf-8?B?bTJOVDhUWFpDVUZkSDFLdGJ3QlFiSHBBM1ZoUm9XZnBLZy9FYUMzdTUyd29N?=
 =?utf-8?B?REpLMjlpQXZUY2FoWWRsdnRnbVFQb25yaUZBa1FmU3FEU1JjTW9kdnhJSTRW?=
 =?utf-8?B?UzBmdnQ1Vm0rS1ZEaG5VVkRHdWxQd2VCbXp5NmdpSHBRNXgweGpJK1VSTkw5?=
 =?utf-8?B?V1ZIdE1Hd2ZqK3dsK0pUYko1eG5qSTJyOTQ2SXdxLzZPNHA2RzlTRDg0NC8x?=
 =?utf-8?B?MTEwOUpnL1BJb0ZPYVJHb0Z2elMyL0NTalBib1JLTEZDMVExWktJbDdrc3lK?=
 =?utf-8?B?ZjFyanoyYlhHOVgvSG5EVzJlZkV0by8wKzIvajgxVkl2cW1Icy9yNDhSTzBV?=
 =?utf-8?B?bnFJS3Qyb2xsUExqdmlDRU9BSloxS3RVRVpGS3hFcWZsZFoyejRJbU5mTDZK?=
 =?utf-8?B?Q0xlcnloQmRYdFVBVFVmc3FrUkJEWlhyVk5iZjhzci9UOUdwQTJRNUtGNGtO?=
 =?utf-8?B?K0R0T1dtQTZ0OU9ubnBuTXg0WUh4V3VGYjlqbnZaWnBtY3d0WVlvbkM2QnpW?=
 =?utf-8?Q?pjJ94F2BMLAyf2D4sya20QlyaMqADg+K?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 06:34:25.7289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a47ba2-e920-4480-bdd3-08dcc018f85f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7434

The CPU ID macros are needed by the Smart PC builder. Therefore, transfer
the CPU ID macros from core.c to the common PMF header file.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v4:
 - Add Reviewed-by Tag

V3:
 - No change

V2:
 - No change

 drivers/platform/x86/amd/pmf/core.c | 6 ------
 drivers/platform/x86/amd/pmf/pmf.h  | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 8f1f719befa3..88314b0277a3 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -37,12 +37,6 @@
 #define AMD_PMF_RESULT_CMD_UNKNOWN           0xFE
 #define AMD_PMF_RESULT_FAILED                0xFF
 
-/* List of supported CPU ids */
-#define AMD_CPU_ID_RMB			0x14b5
-#define AMD_CPU_ID_PS			0x14e8
-#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT	0x1507
-#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT	0x1122
-
 #define PMF_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9bf4326d06c3..9fc26f672f12 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -19,6 +19,12 @@
 #define POLICY_SIGN_COOKIE		0x31535024
 #define POLICY_COOKIE_OFFSET		0x10
 
+/* List of supported CPU ids */
+#define AMD_CPU_ID_RMB                  0x14b5
+#define AMD_CPU_ID_PS                   0x14e8
+#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
+#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
+
 struct cookie_header {
 	u32 sign;
 	u32 length;
-- 
2.25.1

