Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604032;
	b=Rrl1RYSQxidYCnieeAABk+PLBzXZB7zDusqKUU0fgjNCy9JfJuAYZCBGgVtXRFNw+/6u
	 l8EB3RwNiRFmMaVJYRD6mdr85FTT80QFG0uLadTCpNvv7aPLePwJEUlpyOOIuTYOO+r33
	 wENL7K7N72vKXMq/vuqvLCIFy87qg/qTdNdWswzLdsueyyVNHSuGIFEgdPtLRTM6NYLJ9
	 7/GrDB9Vw7SfnF1N62mXkgW1qAy1+DiFH1/Y5tNN73Z8lBnBjnNuyzm4U7QQJG3cJAtEs
	 EeNrm6kBZ9Zh7egEs2dIMeR/Cw2MunN3a9AeeUcTvgkAW8paQqr4HY47dViZpdTHHJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604032;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=8YyoUuBLR8XZnO1vSPf5PcNN/20IlM7LakM/TFZpfTw=;
	b=vl8fI7QHGYdbMl47qjoQ+b6fVBhh4cWWLCc/eqNkgUNZhE2khsPEI9kT+KR2lKxWbJ9g
	 7ySstY9ejbPaNXzoTDPthKUwZIPRO0EgyVnUZwKFEuFUpRo0n7X+2oG7PERaJtA6kqFXr
	 D7W/7mi5eupcppyRTBZI8cO0mPwOKScrCvfDBubwOu0bOqyyPxrHQd8a91x1NlcE4EC7M
	 1Q8aKnDjf5/iaQXwGK/oMNZaimXhp+tGbgZ14BQjoZt0n2s0aUGpsAlleam4Mfd65t9W3
	 HeAoUr3oMvQVfMCCf7xqD1wmRf9cNQ2gy1fEkEWyxuMRhWQKMq/AMAlOazGxBRUfgAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=svGN09T0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.65
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED060606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED060606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=svGN09T0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhvC9JSBk1YIqJ4txm+POTaEaRI25owJEGguOllzp2nWBHJMn6e+FoMo7y1Bo//8ixC9FzyiGCpBXq70WizsE+QJoyyv59DAclEDLVZLsYJnPKhhM/l/kVgZoxk2vavq9R29+a0+pf1mvpJlu4cp+bgsVj82j8j3zHnMs+ALjE2HdDfzKtx/HP3WVVWAXr3TfWzjnn9F1RkpO4oUWbZaoQ6Y6DqbQtCWXQGYycl8xnvwgTQ6ZCPK5+AoQR2qlj5OSEQxgyJcrmPJ3pBtnP0lSiV3ags/Fb3YXxzL0PCmoKUw037NF+dtNvPqOPVWQoH5wf0gL3GJI3COzqw2NQrBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YyoUuBLR8XZnO1vSPf5PcNN/20IlM7LakM/TFZpfTw=;
 b=WPuOZjR3ar4e5R7O/Czd7lo6INVgUo0lpx8RElGpokVpMMd6mXzQkoXVgUWUgC0aRRebrtJaM77UPkEq5hCDNYhzNULfGQaVHGBVdWrrsOuf/X8oyEfIVqILPiVEoQlvPstLSX/RBgJLOmrjVKYOUN2zaUWDAL72Z8hrnIiagn/mv0EBgAa//YSGFv0+fbQiGZH3El155D4hV2Ka3MaIO7zSA2UZuH8GzN5eTKAO2qlHtXHZ3+tbfs4Yq7hnNQwz5QXTWTj2NyrXBpT20kgtNjvqI6kd09UB7RJJJDnzDuI4r7ET3OJy9AY9qPeOpkIF2RwIu3/IdpoY6z2Psn4EIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YyoUuBLR8XZnO1vSPf5PcNN/20IlM7LakM/TFZpfTw=;
 b=svGN09T0tOa4rak3WKoz+dQKdaGEeskJfXun1SY1dgAuzZ13U42HQfR1JcPbdoQieuW58DPNEKh85j+U+xHRbwMXUwBPZ2El8dJWhCMSFOAe6AhPb0vckn00Ut9JmX/ZvzNZFW48ZFyZf/hPRj2XEVX2BGi/GA6F6Cso9GUSKtA=
Received: from SJ0PR05CA0167.namprd05.prod.outlook.com (2603:10b6:a03:339::22)
 by SJ0PR12MB7005.namprd12.prod.outlook.com (2603:10b6:a03:486::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:27 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::13) by SJ0PR05CA0167.outlook.office365.com
 (2603:10b6:a03:339::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Mon, 2
 Nov 2026 07:20:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:27 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:24 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 07/26] platform/x86/amd/hsmp: Add df_pstate_range sysfs file
Date: Mon, 2 Nov 2026 07:19:05 +0000
Message-ID: <f441bef698cd6cdc7d6ca2067833542ab49a31b1.1793602633.git.Muthusamy.Ramalingam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|SJ0PR12MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0fc162-52c1-427e-ca9a-08df38b1c4ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261021130227099003|261026121527099003|261026140227099003|261022115727099003|261022113327099003|261022105027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	dGW6UZ0vQvtJ5pNPpenjQA3eD1PUuKj/QC9VxZe1NdtcjvqyNeh9Higo6fWU8acmiUfDM9LUTw1ZnIa0C9VQIGJoz0Nh5wbeArx9niBu3f5LLJYR6LZl/kbsfaVot5Z4KiYzZ9JwWzuvWEdXGgrZREBoGGD77iZni60PdjjUxd75herKqE9cTSGennECzS2axjn98ptOxPJLr4pmnEXdd9mcySM579sHiVxgmC7iiWBvk0AHjSbw2h2C/hUkkzrIAHSlxJPNVvsH8TdvUo3jBBFq6RBVR+0M1n1zk56HP/u76pbKaY6vo9rb5+m7D+9GSJpxf/hxyhjCZs5dIlOjLFwwQfB/L29RUJ9ktGPzt7JO1zTZ88SxDrTovW0hqkHIkaJ3S7j6VhPFwCtricNfSykaAY/G+ccJosE2dj1jHcUt6Ue3q+2tliZiI0QWZPfFoX8Qj6+7L6MqBYLdeidNq3wP1HLAvHgj84R2RDlz8MSqMp72S/dokcnpz4cK37Xpjdh8kSLyIxfbAxfukpgc36Zi82hfG7WcrPIXDCt09DGTRj1aXhqh1jAV5ti21TWLFNPUoVTUQdLuCVkvmLVpsq1vRFph4FVHw3rxo0LQM+wufo0t9rMtoiNykX0cIe+jqupxSq/U7j9bg1qeX8D76SJteDQVkokGDvvbwN4Qa0DRG6UKYBu9tJnW9dOEgO84Ah68KWdkDx8kkTOb4184aQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261021130227099003)(261026121527099003)(261026140227099003)(261022115727099003)(261022113327099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VvC0put8Kd8wL7ZLUHUzdbCr0Gq0vl/279O8XdyPy3Dmp3crIXEnwa8Nx29UT7yhD9U8OTXRb7vuMYTpx1GNtAComnL5qL945Q2PLWiWgmLkpP8Od+Fg4Vg+BWGL/HfD1h09HRd3lcNHDf9CeSqtWGl3/N6zTGdDLp1GIVYOAtO2RaaYIbgTCnn4BFNR3VG2jFCAjktQ5Nni12Wp9D7khxUVJB6AQzK9vQX6IgAwTdlImvwORwzOYrJhoeFn3VOHmDUqgWlzYCzCTFoRVEaMBuhgcJSeHuw9aT8w44gMdQIGf30aJ+0MWytItelQQz2jTUu2gpm+GLikoeqU27JvV4Zp19kBKQ62QsGc7qUETDWP1gdNHQpbj9lt8CmYn9Z2wAlMOoij18vp0eoNXnmF6BAhP4Rb6xent8HfsP475kwO12SMJVmb4FV5b3GvsL3N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:27.0862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0fc162-52c1-427e-ca9a-08df38b1c4ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7005

Expose HSMP_SET_PSTATE_MAX_MIN as a read/write socket file on both the
ACPI and platform drivers. Read and write are differentiated by bit 31.
Setting the bit selects a read, and resetting it selects a write. A
read returns the minimum and maximum DF P-states. A write takes
"min max". Each value is an 8-bit field. Extra arguments are rejected.
Firmware rejects unsupported P-states.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |   3 +
 drivers/platform/x86/amd/hsmp/acpi.c  |   3 +
 drivers/platform/x86/amd/hsmp/plat.c  |   5 ++
 drivers/platform/x86/amd/hsmp/sysfs.c | 116 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |   5 ++
 5 files changed, 132 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 1fc4727b48726..694997308ffa9 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -119,6 +119,9 @@ write-only when the platform enables only that direction of the message.
   32-bit value. Firmware clamps it to the platform range.
 * sdps_limit: Read/write SDPS limit in mWatts. A write uses bits [30:0].
   Firmware clamps it to the platform range.
+* df_pstate_range: Read/write DF P-state range as "min max". Each value
+  is an 8-bit field. 0 is the highest performance. Extra arguments are
+  rejected. Firmware rejects unsupported P-states.
 * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
 * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
   is 100-10000 MHz.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 4c9f6c6843304..417fca04a722f 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -539,6 +539,8 @@ HSMP_DEV_ATTR_RW(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
 		 hsmp_socket_power_limit_show, hsmp_socket_power_limit_store, 0644);
 HSMP_DEV_ATTR_RW(sdps_limit, HSMP_SDPS_LIMIT, HSMP_SDPS_LIMIT,
 		 hsmp_sdps_limit_show, hsmp_sdps_limit_store, 0644);
+HSMP_DEV_ATTR_RW(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN, HSMP_SET_PSTATE_MAX_MIN,
+		 hsmp_df_pstate_range_show, hsmp_df_pstate_range_store, 0644);
 HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
 		hsmp_cclk_boost_limit_store, 0200);
 HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
@@ -571,6 +573,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_socket_power_limit_max.dattr.attr,
 	&hattr_socket_power_limit.dattr.attr,
 	&hattr_sdps_limit.dattr.attr,
+	&hattr_df_pstate_range.dattr.attr,
 	&hattr_socket_power.dattr.attr,
 	&hattr_cclk_boost_limit.dattr.attr,
 	&hattr_tdelta.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 6f4250cfc1f4a..3deb5480495dc 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -373,6 +373,10 @@ HSMP_DEV_ATTR_RW_X8(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
 		    hsmp_socket_power_limit_store, 0644);
 HSMP_DEV_ATTR_RW_X8(sdps_limit, HSMP_SDPS_LIMIT, HSMP_SDPS_LIMIT,
 		    hsmp_sdps_limit_show, hsmp_sdps_limit_store, 0644);
+HSMP_DEV_ATTR_RW_X8(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN,
+		    HSMP_SET_PSTATE_MAX_MIN,
+		    hsmp_df_pstate_range_show, hsmp_df_pstate_range_store,
+		    0644);
 HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
 		 0444);
 HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
@@ -410,6 +414,7 @@ static struct attribute _name[] = {					       \
 	&hattr_socket_power_limit_max##_sock_ind.dattr.attr,		       \
 	&hattr_socket_power_limit##_sock_ind.dattr.attr,		       \
 	&hattr_sdps_limit##_sock_ind.dattr.attr,			       \
+	&hattr_df_pstate_range##_sock_ind.dattr.attr,			       \
 	&hattr_socket_power##_sock_ind.dattr.attr,			       \
 	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
 	&hattr_tdelta##_sock_ind.dattr.attr,				       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 01363b0b92fd7..8f10281cb97c1 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -14,6 +14,7 @@
 #include <linux/kstrtox.h>
 #include <linux/limits.h>
 #include <linux/smp.h>
+#include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/topology.h>
 
@@ -696,6 +697,121 @@ ssize_t hsmp_sdps_limit_store(struct device *dev,
 	return count;
 }
 
+/* Multi-field stores copy the write into this buffer before tokenizing. */
+#define HSMP_PARSE_BUFSZ	80
+
+/*
+ * Parse exactly @n whitespace-separated unsigned integers. base 10 accepts
+ * decimal. base 0 also accepts 0x hex and leading-zero octal. Too few
+ * tokens, extra tokens, and a value that does not fit in u32 are rejected.
+ * On failure, *@got is the number of whitespace-separated tokens present.
+ */
+static int hsmp_parse_u32_args(const char *buf, u32 *vals, int n,
+			       unsigned int base, int *got)
+{
+	char tmp[HSMP_PARSE_BUFSZ];
+	char *s, *tok;
+	int i = 0;
+
+	*got = 0;
+	if (strscpy(tmp, buf, sizeof(tmp)) < 0)
+		return -EINVAL;
+
+	s = tmp;
+	while ((tok = strsep(&s, " \t\n")) != NULL) {
+		if (*tok == '\0')
+			continue;
+		(*got)++;
+		if (i < n && !kstrtou32(tok, base, &vals[i]))
+			i++;
+	}
+
+	return (i == n && *got == n) ? 0 : -EINVAL;
+}
+
+/* DF P-state range show function - reads current min and max DF P-states */
+ssize_t hsmp_df_pstate_range_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	u32 min_pstate, max_pstate;
+	int ret;
+
+	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */
+	msg.msg_id = HSMP_SET_PSTATE_MAX_MIN;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = BIT(31);  /* GET operation */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/* Extract min DF P-state[15:8] and max DF P-state[7:0] */
+	min_pstate = (msg.args[0] >> 8) & 0xFF;
+	max_pstate = msg.args[0] & 0xFF;
+
+	return sysfs_emit(buf, "%u %u\n", min_pstate, max_pstate);
+}
+
+/* DF P-state range store function - sets min and max DF P-states */
+ssize_t hsmp_df_pstate_range_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	u32 min_pstate, max_pstate;
+	u32 vals[2];
+	int ret;
+	int got;
+
+	/* Parse input in format: "min_pstate max_pstate" */
+	ret = hsmp_parse_u32_args(buf, vals, 2, 10, &got);
+	if (ret) {
+		hsmp_err(dev, "df_pstate_range", HSMP_ERR_ARGC,
+			 "want=2 got=%d fmt=\"min max\"", got);
+		return -EINVAL;
+	}
+	min_pstate = vals[0];
+	max_pstate = vals[1];
+
+	/* Min and max are 8-bit fields. Firmware rejects unsupported P-states. */
+	if (min_pstate > 0xFF || max_pstate > 0xFF) {
+		hsmp_err(dev, "df_pstate_range", HSMP_ERR_RANGE,
+			 "min=%u max=%u valid=0-255", min_pstate, max_pstate);
+		return -EINVAL;
+	}
+
+	/* Clear bit 31 for SET operation, pack min[15:8] and max[7:0] */
+	msg.msg_id = HSMP_SET_PSTATE_MAX_MIN;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = (min_pstate << 8) | max_pstate;
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		if (max_pstate > min_pstate)
+			hsmp_err(dev, "df_pstate_range", HSMP_ERR_ORDER,
+				 "min=%u max=%u rule=max<=min rc=%d",
+				  min_pstate, max_pstate, ret);
+		else if (min_pstate > 2 || max_pstate > 2)
+			hsmp_err(dev, "df_pstate_range", HSMP_ERR_RANGE,
+				 "min=%u max=%u valid=0-2 rc=%d",
+				  min_pstate, max_pstate, ret);
+		else
+			hsmp_err(dev, "df_pstate_range", HSMP_ERR_HW,
+				 "min=%u max=%u rc=%d", min_pstate, max_pstate, ret);
+		return ret;
+	}
+
+	return count;
+}
+
 static ssize_t boost_limit_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct hsmp_cpu_info *cpu_info = NULL;
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index bf5bac77102d3..9631b9067c142 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -110,6 +110,11 @@ ssize_t hsmp_sdps_limit_show(struct device *dev, struct device_attribute *attr,
 			     char *buf);
 ssize_t hsmp_sdps_limit_store(struct device *dev, struct device_attribute *attr,
 			      const char *buf, size_t count);
+ssize_t hsmp_df_pstate_range_show(struct device *dev,
+				  struct device_attribute *attr, char *buf);
+ssize_t hsmp_df_pstate_range_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count);
 
 void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
 				  struct hsmp_socket *sock);
-- 
2.34.1

