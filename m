Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789DD46DFFA;
	Mon, 12 Oct 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795277; cv=fail; b=tZ5rWPcqK1XQGU9YMNQK24yCx6yUxMyb7M6altt/qIaksUN+/Uu0BdDWRgJfRswSm6yctFDA6NuIRAzizCGJp2KGi4Bxe9o89Jey9o277+gWKI/wdMXVuEEmopqZVecoBLp/04ege+7eOR7Vh6zGt4rudYjOaE4/iXwdAa5QCsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795277; c=relaxed/simple;
	bh=RXZ8HuZE27OFhzubgJc3mJ9YU72TerFqbffgoXcyvRg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r7stOUY6Myon8ttosJCrFyhQ6b337imsHL0nuoE7BpSw9P33H2uJ3EpXSbtL832ZQV5qH4ECMhL9AtBxNfo2OrHEwwzXqVWqYCU0SHArQn6CzdPdl27O7vCzWtPXLLK0iIzQZsVXzLQj7ttjvfuT1q0krpJ3mucEXNMS8n/LCYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mkyQXG7c; arc=fail smtp.client-ip=40.107.208.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mkyQXG7c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ellDW5/vod2VMaKg1djXGza9RQRtk0svpu7FRUfMT99oI2rhckdxj1X8A/lwz3RhnA1wn1WnQbVGzvzK0qn/4eJk8hcPhOrOPrX/Jz9smkazr45HfpUiTxagT9hmISSsbKfMC1bB6/RZplLrDD7pSrzkvnAcpq2RWm9vZLNtQhbL+jrmGbHvKbi8kOnZ8skEdI1JYVP9on+AyaVitUWpXApjOhka5iz0egoHg231ZhKdSYSrTOKCQAsYPL2DK9oPwFCQFd+G2CyWQUqLOHgi1mSNcgXBTlW9tWybBItW5zfCNp2cPiDOg7PY5pSt1vEL5sjLMV3HcnU+d+TALfR9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRIrew14baHDNl8d6zIJP5U1OfY/qc+u3Q70uplMMV4=;
 b=I9cMWokrz3qopcHb2nRTCba6zD17G0qs9aZ899ImsYSbw2o5B++Bde0snhqHl5honUAXdFpr4mgwS9+rHu69DqABzsmRdD3mkEh7z5HcN5cwsIQt+yUowZyNGM0ygBoFTj2GEnqMRk+JPUQKNHO3nqyr5Ns8530oEs4Y4y4Tj8Oar2kfYoXkhK2EHW6+eadsalqnRISA0s4ez3f1xzuvfcm5bLrj1JqW81F+mpQBzRC+lZpAK0cEqkT/Ij4VMGtCrClOjoLKlv/G2X4wULrMV3YlLHFomfBebrh3PULr9gUyGyIrx2nGJS/nk4EJTO8RccP8oAirF2wEHQR5B1+esg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRIrew14baHDNl8d6zIJP5U1OfY/qc+u3Q70uplMMV4=;
 b=mkyQXG7c6RnPD3riLcQLVYCSGXwJ/mYjmpMZdSI91yGq1KM+XF4zBo8NwlHq4z3SuajyOcRyFdeDzT02GBdGct8SW23zAqq58f4NMTexUCmwZWUVsONANCVoRynijk2zsIatL3AbbbFapqvm/hyuk7vvk8rCSyreyu6iGmUiirI=
Received: from SJ0PR05CA0112.namprd05.prod.outlook.com (2603:10b6:a03:334::27)
 by PH7PR12MB9201.namprd12.prod.outlook.com (2603:10b6:510:2e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:54:31 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::5d) by SJ0PR05CA0112.outlook.office365.com
 (2603:10b6:a03:334::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Mon, 12
 Oct 2026 08:54:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:54:31 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 03:54:22 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v9 3/4] platform/x86/amd/hsmp: Route metric table through the client messages
Date: Mon, 12 Oct 2026 14:24:06 +0530
Message-ID: <20261012085407.1202295-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012085407.1202295-1-muralidhara.mk@amd.com>
References: <20261012085407.1202295-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|PH7PR12MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: 791bb86e-5e5d-4525-693c-08df283e6e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	E7spO86/l8D9f9yfe+rMp09rfT+h38+5h8gqHvgX7yKeClM4hX1CjuDo42gwJGmCmGzY8IhDav4Bvqlb7oXNBM/I7e+oWZ8VYdw5bAakpoeeh5GCZ0Hx9AbcZkelnynqNq1xKe04GZevoWnoTPFEW98DeBtHpVmYsrWKTToUxClQLgapVkk6qV/1AgDIC4clzcKDg6ubGuzPM5aUQmmjHGB65ODEmUqLZq9PpqbBtWH61UmmgkfBsT8K1uYy8gHSMBB7vsrHpu/WP7sQEbz0+/51jkVtP7YK5mB3Rmqgdt9iVw/LX/bldJzRU+GRDuFShxheygoMbrBGc2OOtg7eZYm/K71pcRO8vjGUa5lf1jq95XhtIG9py4O+habYIVIG54yPzIL7J0wP30Sj906YGVJ4A2l8CCwRDxLb30A/Xk1IXrWFF4h8c54bCaZXFO657vZjbCKWZvaIvLoUmI5JIqrQUYs4YzrDibmbk4gxiCdtZEadA0Rryb+7QRIKWEdBD9cYbiM94jwJRNef4ZsDsGOwm2UsdOHJSjW+hDs3ZcMl9/cSXvDXl0vBfHO1ajHqAQ+uCfY23GxgVRRg506JzaKNMSrU60hDu3f1XZ3sB7xd3wZNtQhJqpnli98mTq9NNa2NbN1eHe/iACi2srg1KM3+4G4Z+bLGiCYCx96oup/dq2VPAZKyJHQ4XP2+oWR6W9h1AriBYLQgdIZj3UgE2g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CjzRklnKOBjAho5lHP36iyYHszQMUtuFAZlAR6NFijnC5qEwXvPsZ4R0jBGu/V5T8donRyY8ViVaYpHYydHDl2CW+sZhaTN03gNeoZtoH7gCrwrV9a70NQeaec1iQGsEdkeSRCA3W89f6fMC/swpVxNZlCjSl79oeSS5T10cKCWx97KVnhsfJYewIAPTbXXP975pnBLS3/Lut8NuKmytLo4Dd1+4+iQ+jVR9hJY0g8OZyM+2CXFwpJgEvGkMLsMjWkU3SgROiwgUbdOFMrKizCaw7UaU+t/ExJEo+zo2nu6Mk9jv/cXBuVHEFKjDfNFeV7rrtzHENjdZImAR50elhsf8lPLpoY+XWB1weuKBBY7bXPKkjSdWaQ7xRYh6TjPepihOOwmMWkMalKj7Yu+qSYP+nkjJd9oGhEztKbc+XwPNFS5l1GJ8QRrjbzDH2M7v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:54:31.5020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 791bb86e-5e5d-4525-693c-08df283e6e77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9201

Wire the client metric table and metric table DRAM address messages
into the metric table read path for the Family 1Ah client platforms,
and fetch the DRAM base for them during ACPI probe, lifting the
defensive client exclusion placed on that call several commits ago.

Add metric_tbl_msg and metric_dram_msg to struct hsmp_plat_desc, and
have hsmp_metric_tbl_read_locked() and hsmp_get_tbl_dram_base() take
the message ID from there instead of a shared constant, since the
client set numbers these messages differently from the server set
(05h/06h vs 24h/25h). Have hsmp_get_tbl_dram_base() take response_sz
from hsmp_msg_response_sz() too, since the client set has no
descriptor table to take it from directly.

Add enum ryzen_master_proto_versions, and replace the single
!is_client_platform() exclusion guarding the hsmp_get_tbl_dram_base()
call in init_acpi() with a RYZEN_MASTER_PROTO_VER1 clause for client
platforms alongside the existing HSMP_PROTO_VER6 clause for server.
proto_ver holds the Ryzen Master interface version on client
platforms, a separate numbering space from enum hsmp_proto_versions;
gating the two platforms on their own version enum avoids relying on
numeric coincidence between the two, and lets a client interface
version bump be reasoned about independently of the server protocol
version.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 arch/x86/include/uapi/asm/amd_hsmp.h |  9 +++++++++
 drivers/platform/x86/amd/hsmp/acpi.c | 11 +++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.c | 14 ++++++++++----
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 7274cf040a66..b4f64b2407b6 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -106,6 +106,15 @@ enum hsmp_proto_versions {
 	HSMP_PROTO_VER7
 };
 
+/*
+ * Ryzen Master SMC interface version, reported by
+ * HSMP_CLIENT_GET_INTERFACE_VER. Separate numbering space from enum
+ * hsmp_proto_versions, which applies to the server set only.
+ */
+enum ryzen_master_proto_versions {
+	RYZEN_MASTER_PROTO_VER1 = 1,
+};
+
 struct hsmp_msg_desc {
 	int num_args;
 	int response_sz;
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 1e5028aea54b..167c76c13ad0 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -567,8 +567,15 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	/* Exclude client platforms from the metric table DRAM base lookup */
-	if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
+	/*
+	 * proto_ver holds the Ryzen Master interface version on client
+	 * platforms, a separate numbering space from enum
+	 * hsmp_proto_versions; gate the two platforms on their own
+	 * version enum rather than relying on numeric coincidence
+	 * between the two.
+	 */
+	if ((is_client_platform() && hsmp_pdev->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
+	    (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 08e00a7c329a..45d20beda946 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -57,6 +57,8 @@ struct hsmp_plat_desc {
 	u32				num_msgs;
 	u32				test_msg;
 	u32				proto_ver_msg;
+	u32				metric_tbl_msg;
+	u32				metric_dram_msg;
 };
 
 static const struct hsmp_plat_desc hsmp_desc_server = {
@@ -64,6 +66,8 @@ static const struct hsmp_plat_desc hsmp_desc_server = {
 	.num_msgs		= HSMP_MSG_ID_MAX,
 	.test_msg		= HSMP_TEST,
 	.proto_ver_msg		= HSMP_GET_PROTO_VER,
+	.metric_tbl_msg		= HSMP_GET_METRIC_TABLE,
+	.metric_dram_msg	= HSMP_GET_METRIC_TABLE_DRAM_ADDR,
 };
 
 /*
@@ -77,6 +81,8 @@ static const struct hsmp_plat_desc hsmp_desc_client = {
 	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
 	.test_msg		= HSMP_CLIENT_TEST,
 	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
+	.metric_tbl_msg		= HSMP_CLIENT_GET_METRICS_TABLE,
+	.metric_dram_msg	= HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
 };
 
 static struct hsmp_plat_device hsmp_pdev;
@@ -671,11 +677,11 @@ static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
 		return -EINVAL;
 	}
 
-	msg.msg_id	= HSMP_GET_METRIC_TABLE;
+	msg.msg_id	= hsmp_desc()->metric_tbl_msg;
 	msg.sock_ind	= sock->sock_ind;
 
 	/*
-	 * HSMP_GET_METRIC_TABLE makes firmware refill this socket's shared
+	 * The metric table message makes firmware refill this socket's shared
 	 * metric DRAM region, which is then copied out below.  Hold the
 	 * per-socket lock across the fill-and-copy so concurrent readers of the
 	 * same socket cannot return a torn snapshot.
@@ -741,8 +747,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	int ret;
 
 	msg.sock_ind	= sock_ind;
-	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
-	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
+	msg.msg_id	= hsmp_desc()->metric_dram_msg;
+	msg.response_sz	= hsmp_msg_response_sz(msg.msg_id);
 
 	ret = hsmp_send_message_locked(&msg);
 	if (ret)
-- 
2.34.1

