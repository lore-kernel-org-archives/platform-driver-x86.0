Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64662C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 15:23:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239599AbiD0P0V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 11:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239976AbiD0P0T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 11:26:19 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437582EE3F4
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 08:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mw/rfaZnCutLuPgURh3bfK64XqknXraKZWXI4IZYGgcl5W+zWicGRXWzvHWBluTUW2KuapeZSmJ0C1m0sya+ubm6tFUS1GgJUp94oAUr+ye+SGjGBE6yIjHcxv6ieyQDx8aejbEIshxP7d5oA1BgDoLA5UZOOEfS2KxeCOyzZC7sWM5I8WYUJ1XrIFPngDBe9WYVfkjJM8pqs0LGEsZU4XP5FQhugXWs/XNptPjrHEA2TvMbQ68unix6N0gqgtk3++6ouVWbRDfkufhZnBM6UzZh7ysvZe3EewXvpmdoD69/Umr+YoWs8hTZvNX6a2WTGXRS5XLuFr7Zbt3u38L9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jEAz2xa+qj2luSlVonx6m1wfSIfU52H3bVL/E24REI=;
 b=kCVy4EfNlaI2B7/BZ4gP5IGfW8lf8ZrCPvMLY7CxEEejKA2perhoIVtecGydzDWeJgd0G/neK96Hc6fygf3Nnpz3wbL/cgKl/sBQ61ooa3N0PVTEn2mwo+YfPOup/k3GIL6M2dLytHgJaCnccZo0DCVEPmI0rNJw3hGTpPehRiQeo6E7gMeqYb2/hykgGzKsY9HRtl0RvxFmXDd0+YL3SyIesv3tToJI5ELOCFtd1MiJTIJguos7LKPYxf5cK3aiQpOXKwRLDbCkPND7Bocue4QMEUC24tW0D6BUMP1CUCPFjk9y+Wzvgtgw7n+DsegSEgDsWjs0J/S1hQys7UVwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jEAz2xa+qj2luSlVonx6m1wfSIfU52H3bVL/E24REI=;
 b=r33KOCbL9keF0V9o1H9pqtht/DCYhRDgMyzsk2B/cqJHEVI5XlVVbnx5dQa4Mr1GZKVriYneNX7FCD39UQeXVv1aEpZPmjbDwsFMqfrjA09ZyIi05Ec9XS5rAelDqWo2EvSTxveqM/WGyMt2ne5qW5XJXksiUVngxCqsCXoAV0U=
Received: from BN6PR17CA0055.namprd17.prod.outlook.com (2603:10b6:405:75::44)
 by BN8PR12MB3218.namprd12.prod.outlook.com (2603:10b6:408:6b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 15:23:06 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::59) by BN6PR17CA0055.outlook.office365.com
 (2603:10b6:405:75::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Wed, 27 Apr 2022 15:23:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 15:23:06 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 10:23:02 -0500
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>, <hdegoede@redhat.com>
CC:     <carlos.bilbao@amd.com>, <siva.sathappan@amd.com>,
        <song@kernel.org>, "Suma Hegde" <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3] amd_hsmp: Add HSMP protocol version 5 messages
Date:   Wed, 27 Apr 2022 20:52:48 +0530
Message-ID: <20220427152248.25643-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cc3240c-4384-474a-6f41-08da2861d454
X-MS-TrafficTypeDiagnostic: BN8PR12MB3218:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB321875931BECEF3529609686E8FA9@BN8PR12MB3218.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96SCYU2NoE869F3wV+DPiMOPBnifahAdaA/lbarqKY55LndMOYViIRF855UUmKx8RuuzDdlOaxhGZj5nLSUitIwQAR93bxOdhrHSOtx8I2p+UZla4MB8ufXSHU4jdK4ZbF0SiN8CnWyd4EPJSkXVIxJ7QpLWx1MjnspB139NiAdkTurudb8zu5UxX8K+B15TUv8J+tqEc7i0Z75Bu1segjCBBd3VSRFPh6hgmfaKlGXVPDpwYh0aZNAAKufsRGv71d06p4d+dMrWCWwaVJda14AodKRrbeHLAxge4ul3tamehk7RaScMThzPw4eraqUHP1N8XQxqmsLzUImYDQtH+qt/hW8f1QhXVNQdyNa+h7tShnE6ek1n3bD8afbv+77niciIc6l9UR6FFeNkim5+fW6hk6eXS15AK03FSLwe4bzAtXCFiYphnNbXXm7Z0Yp3U/sH4pHor6naR/8jeTv1jPlEVmCbiwd4zxsqS5IDE36AM9sJehW1aJkxK3SK1GwyJUrbl/MzZnhkW2Cd0E0DwhPWl+wvd929kfiYrBp6qv0s4AjmEC35VEAitRba+qVZD6TkWJ94YqsTV0yqE19ioMcPfJHon/ULLbsmUpxPIA1WknC6m0YIkr2BbZgt7My4bvd5tLY09GzxuLZS2IiYM7z8nDcWSIWFCG5Gmn3tTXPDkbnsgG+HnDRECYehAnxWxVfL2U+fTkjez+nID+h8lA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(7696005)(2906002)(5660300002)(6666004)(54906003)(26005)(8936002)(36756003)(2616005)(1076003)(336012)(426003)(15650500001)(47076005)(83380400001)(16526019)(82310400005)(186003)(508600001)(36860700001)(70206006)(70586007)(81166007)(316002)(40460700003)(8676002)(110136005)(4326008)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 15:23:06.4963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc3240c-4384-474a-6f41-08da2861d454
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3218
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Suma Hegde <suma.hegde@amd.com>

HSMP protocol version 5 is supported on AMD family 19h model 10h
EPYC processors. This version brings new features such as
-- DIMM statistics
-- Bandwidth for IO and xGMI links
-- Monitor socket and core frequency limits
-- Configure power efficiency modes, DF pstate range etc

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
changes since v2:
None, could not find the previous emails in the archives.
Submitting again.

changes since v1:
spell correction in commit message

 arch/x86/include/uapi/asm/amd_hsmp.h | 114 +++++++++++++++++++++++++--
 1 file changed, 109 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 7ee7ba0d63a3..769b939444ae 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -31,9 +31,22 @@ enum hsmp_message_ids {
 	HSMP_GET_CCLK_THROTTLE_LIMIT,	/* 10h Get CCLK frequency limit in socket */
 	HSMP_GET_C0_PERCENT,		/* 11h Get average C0 residency in socket */
 	HSMP_SET_NBIO_DPM_LEVEL,	/* 12h Set max/min LCLK DPM Level for a given NBIO */
-					/* 13h Reserved */
-	HSMP_GET_DDR_BANDWIDTH = 0x14,	/* 14h Get theoretical maximum and current DDR Bandwidth */
-	HSMP_GET_TEMP_MONITOR,		/* 15h Get per-DIMM temperature and refresh rates */
+	HSMP_GET_NBIO_DPM_LEVEL,	/* 13h Get LCLK DPM level min and max for a given NBIO */
+	HSMP_GET_DDR_BANDWIDTH,		/* 14h Get theoretical maximum and current DDR Bandwidth */
+	HSMP_GET_TEMP_MONITOR,		/* 15h Get socket temperature */
+	HSMP_GET_DIMM_TEMP_RANGE,	/* 16h Get per-DIMM temperature range and refresh rate */
+	HSMP_GET_DIMM_POWER,		/* 17h Get per-DIMM power consumption */
+	HSMP_GET_DIMM_THERMAL,		/* 18h Get per-DIMM thermal sensors */
+	HSMP_GET_SOCKET_FREQ_LIMIT,	/* 19h Get current active frequency per socket */
+	HSMP_GET_CCLK_CORE_LIMIT,	/* 1Ah Get CCLK frequency limit per core */
+	HSMP_GET_RAILS_SVI,		/* 1Bh Get SVI-based Telemetry for all rails */
+	HSMP_GET_SOCKET_FMAX_FMIN,	/* 1Ch Get Fmax and Fmin per socket */
+	HSMP_GET_IOLINK_BANDWITH,	/* 1Dh Get current bandwidth on IO Link */
+	HSMP_GET_XGMI_BANDWITH,		/* 1Eh Get current bandwidth on xGMI Link */
+	HSMP_SET_GMI3_WIDTH,		/* 1Fh Set max and min GMI3 Link width */
+	HSMP_SET_PCI_RATE,		/* 20h Control link rate on PCIe devices */
+	HSMP_SET_POWER_MODE,		/* 21h Select power efficiency profile policy */
+	HSMP_SET_PSTATE_MAX_MIN,	/* 22h Set the max and min DF P-State  */
 	HSMP_MSG_ID_MAX,
 };
 
@@ -175,8 +188,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
 	 */
 	{1, 0, HSMP_SET},
 
-	/* RESERVED message */
-	{0, 0, HSMP_RSVD},
+	/*
+	 * HSMP_GET_NBIO_DPM_LEVEL, num_args = 1, response_sz = 1
+	 * input: args[0] = nbioid[23:16]
+	 * output: args[0] = max dpm level[15:8] + min dpm level[7:0]
+	 */
+	{1, 1, HSMP_GET},
 
 	/*
 	 * HSMP_GET_DDR_BANDWIDTH, num_args = 0, response_sz = 1
@@ -191,6 +208,93 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
 	 * [7:5] fractional part
 	 */
 	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_DIMM_TEMP_RANGE, num_args = 1, response_sz = 1
+	 * input: args[0] = DIMM address[7:0]
+	 * output: args[0] = refresh rate[3] + temperature range[2:0]
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_DIMM_POWER, num_args = 1, response_sz = 1
+	 * input: args[0] = DIMM address[7:0]
+	 * output: args[0] = DIMM power in mW[31:17] + update rate in ms[16:8] +
+	 * DIMM address[7:0]
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_DIMM_THERMAL, num_args = 1, response_sz = 1
+	 * input: args[0] = DIMM address[7:0]
+	 * output: args[0] = temperature in degree celcius[31:21] + update rate in ms[16:8] +
+	 * DIMM address[7:0]
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_SOCKET_FREQ_LIMIT, num_args = 0, response_sz = 1
+	 * output: args[0] = frequency in MHz[31:16] + frequency source[15:0]
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_CCLK_CORE_LIMIT, num_args = 1, response_sz = 1
+	 * input: args[0] = apic id [31:0]
+	 * output: args[0] = frequency in MHz[31:0]
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_RAILS_SVI, num_args = 0, response_sz = 1
+	 * output: args[0] = power in mW[31:0]
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_SOCKET_FMAX_FMIN, num_args = 0, response_sz = 1
+	 * output: args[0] = fmax in MHz[31:16] + fmin in MHz[15:0]
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_IOLINK_BANDWITH, num_args = 1, response_sz = 1
+	 * input: args[0] = link id[15:8] + bw type[2:0]
+	 * output: args[0] = io bandwidth in Mbps[31:0]
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_XGMI_BANDWITH, num_args = 1, response_sz = 1
+	 * input: args[0] = link id[15:8] + bw type[2:0]
+	 * output: args[0] = xgmi bandwidth in Mbps[31:0]
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_SET_GMI3_WIDTH, num_args = 1, response_sz = 0
+	 * input: args[0] = min link width[15:8] + max link width[7:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_SET_PCI_RATE, num_args = 1, response_sz = 1
+	 * input: args[0] = link rate control value
+	 * output: args[0] = previous link rate control value
+	 */
+	{1, 1, HSMP_SET},
+
+	/*
+	 * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0
+	 * input: args[0] = power efficiency mode[2:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0
+	 * input: args[0] = min df pstate[15:8] + max df pstate[7:0]
+	 */
+	{1, 0, HSMP_SET},
 };
 
 /* Reset to default packing */
-- 
2.27.0

