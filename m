Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013019.outbound.protection.outlook.com [40.93.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C54A2A72;
	Thu, 24 Sep 2026 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265021; cv=fail; b=oYmgDhMpDjMz/2MRPmn7kt91InhWIRyQ6t3KVMpQdZVKfm+ymiRiAtbMS5sc91SVp2I0k8CbYZp4ej+BLsd/e6ELzGGeWCxbUhq6GM0PFn5YdjL1I5piUPt2oeSzb6z01VG29nKDT5+r7W9YUYBa4HG2HlmLie4rvcHlrpKXUbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265021; c=relaxed/simple;
	bh=R3rrHLSlINcHT7V0j7ho9/YgaufSnxnsnJHFpPZlL0A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b7oReunAIYBEU2dT05YDQQR6QbONhoUpp5VOcUkK1fv+uj9Wc5p7Mej7ZiphVXMMB9nG74wDJKOWC3b9jg8LtJJRmiMjI9gkZWhpofMO5lWhWLYtaOblTbXhWY75F+IXFCkYUCPnZb4h/kvEPtDGCsemEozEffshK7m5bWOmQz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yMzmd25l; arc=fail smtp.client-ip=40.93.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yMzmd25l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTQGa4LeBitqNNmX3+Hrw1cl8Yy1elMWQG58Y0RrvH69lSlFBbQf2Rm3F0knH0nfsi+X6e6BsMAibsb5DwComg9BK7TbbcOR689r62oS/zKfIIqTd/ZVELamr32UzivvuVjxfMjMfigMEaAp0WW5ktBx6hGPYWz0+Y88okJhXdxt2mGd32x64VWW75Yosh8k9xcf8hSljm3rtACQ4F/yQt693a2ybVuAK8DwmFQkpZWf20cmTNR54XpKeJh25dmgay8WxxLyPuoTPTMcobfiNfibND2ZBAEKOO+YgquRHaePkjn1G60JmqQEO+YSB+wiSnpct1kUjV4E97MYyZBl+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyp2MFQVPg2I5iJmn1vDb6lVpZB2l6tgeoMLEsmdchU=;
 b=LWTR/KXDTrInIxzJuP89byF+jtf87lDA2/BLwzNTWFvsDXVM1JaXtTox4FWCjnuuZoRL7utw1rt0CgBIpZAhjdxMEyCTtEteqaUpE4X10ZtaNG5VjoX5Ss14Eg6ztOohdWiilGR+Y4oCaSZveU9JQlo7Yw0uz8s/9lHgifEF0fuLU7m1OWPbwgXkkGCRNIEhV+rIsZ87o3j2GymfZs4XPSoEcjHpsiCcb7ffTkVnIYwDI0uW2fdS/VorALKTsYqKDZSQVC3PgwZx3fWb6ClAcTleggbN9zzpOLNuasCapZzGPurzEptR5yTHV8Ds2Z4BiDbriMxROTReyKd1UpyRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyp2MFQVPg2I5iJmn1vDb6lVpZB2l6tgeoMLEsmdchU=;
 b=yMzmd25lLy8zYpxWAP8cxPmUSV8aBUaVai1g3LehU0UIciJvYhBzux+aUADBoqqN539QuQgTLO/2Iiy0r8tQ+OqBmhBY4ipmGb/oNBvu4oeu7o2gwmQvnwZEzO59l5BbZnFfolXpDtgi6m4sDT6es9mCGza0eRKiw/BQvz/LUkY=
Received: from BY3PR05CA0060.namprd05.prod.outlook.com (2603:10b6:a03:39b::35)
 by SJ1PR12MB6025.namprd12.prod.outlook.com (2603:10b6:a03:48c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:50:12 +0000
Received: from SJ1PEPF000037A3.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::17) by BY3PR05CA0060.outlook.office365.com
 (2603:10b6:a03:39b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Thu,
 24 Sep 2026 15:50:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A3.mail.protection.outlook.com (10.167.244.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 15:50:12 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 10:50:05 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v7 2/4] platform/x86/amd/hsmp: Route metric table through the client messages
Date: Thu, 24 Sep 2026 21:19:45 +0530
Message-ID: <20260924154947.1706669-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924154947.1706669-1-muralidhara.mk@amd.com>
References: <20260924154947.1706669-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A3:EE_|SJ1PR12MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 5066aeb4-c8e3-442a-eaeb-08df1a538528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NqVEGDohUMXmKCd8boW7dvxfIWdR/5DvstWOv5YhTRLEVlJZ/bodq0joxzEvgbjfflunmKeyYrOIUzjRhNQd8rpFY4pxdm9s3NrjJmMElIcOLH4+z+sgQdnjoxU7c9bHlm6vMw1qgj/VnO7+LkKztzLRQTO5b4glo7CtJEFt+GVRx+rxsFYvsL3PNYtLUa0lUG93ExxSmcVc6WS4S2AMlPv//+jP4CvAaQu+FYvgzSJDHGscxqoS6PJPq3mHFHqOH831O5MAE3rhwQSIOGIzaLzPbOEWr7nf3BfMKi4qmFHFVv5hDjXMMQPUauwIbixZqKAm1vqnPyZft67Mw0hUEcNFdrd4Ww5la+LIU8KFRfE7+PIgmzYWzco3xMLH9l7RyVw9ISJljVvvVIF7Ju+0nqJ3sqKJ5ICjpUZkZABiQt8w69xpQM0iGXB7ONHfoUyi5gf5xFqv6ZiLVluE8OE6lqCjuLAaSq7J8vzzKGu3xFcPWPo4BWe7CEzZnkMSp1J/N+e7OOMJnT0rIkdUSkxs2gKPS7vW6HcHlE4YetvG/7XxYWmdNlQBkgNyVYECvQiFPe+O40Di6M3676Bo3ZJkojWC+QtE50m+sNfcjsF6UDPtLgpyTJ7RO6qgZiLJ2iHkSIfVIx7cF8/CooGVjsalgVvkFGlhI5qVN84fK6z6FeMXTxouTNmEJYkgaTBc6hkBNTFQvPTnzBNlxm3hbakKDQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o5R0mYuy9yO/6T0au18Y2LzOArPAJZX7VxYicQJsBAle2JY1WKbLRzh8dIQjXsggYr3dqizjKBPZuHOqKwodfwmv4f4iiXYMHI6ixPTQPSmNHLkmXw1yeKLM/iMzbrlLqBFams32Su/2tUz6m+N/stN92jD3M9fW8eCVYZx9lkA9/V8a05BnWZqwOEo8T8mt6kmnzq7TUUfVHFD7Elw1I7GD4H9narXCDyIoo2U3DoPRaVAJGrgFQ/toIRDcWxAK0saF40kX/l6LAKCgCgzZ0894ZNN3pfML1xAQi823j2JN05X6bM9lmKxqa4yBKiONPSmiLbb9iW4YKoGerCPISVxfhqKcpeW7BEY3PbHgYtOCfVdPAJENJU09xBMdrmWEDQuoJHS6DtVZ5hOLb3HrwDk3H8szub9gh1aC8H7pTPyVl59ItSfy7bqSD3hcqCm0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:50:12.7869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5066aeb4-c8e3-442a-eaeb-08df1a538528
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6025

Wire the client metric table and metric table DRAM address messages
into the metric table read path for the Family 1Ah client platforms,
and fetch the DRAM base for them during ACPI probe.

Add metric_tbl_msg and metric_dram_msg to struct hsmp_plat_desc, and
have hsmp_metric_tbl_read_locked() and hsmp_get_tbl_dram_base() take
the message ID from there instead of a shared constant, since the
client set numbers these messages differently from the server set
(05h/06h vs 24h/25h). Have hsmp_get_tbl_dram_base() take response_sz
from hsmp_msg_response_sz() too, since the client set has no
descriptor table to take it from directly.

Add enum ryzen_master_proto_versions, and split the single unconditional
proto_ver check gating the hsmp_get_tbl_dram_base() call in init_acpi()
into a RYZEN_MASTER_PROTO_VER1 clause for client platforms and a
HSMP_PROTO_VER6 clause for server. proto_ver holds the Ryzen Master
interface version on client platforms, a separate numbering space from
enum hsmp_proto_versions; the single check happened to skip client
today only because RYZEN_MASTER_PROTO_VER1 is numerically below
HSMP_PROTO_VER6, and would misread a higher future client interface
version as HSMP_PROTO_VER6 without the explicit split.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 arch/x86/include/uapi/asm/amd_hsmp.h |  9 +++++++++
 drivers/platform/x86/amd/hsmp/acpi.c |  3 ++-
 drivers/platform/x86/amd/hsmp/hsmp.c | 14 ++++++++++----
 3 files changed, 21 insertions(+), 5 deletions(-)

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
index 8257cd1da48e..8b4bf57c3485 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -557,7 +557,8 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
+	if ((is_client_platform() && hsmp_pdev->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
+	    (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index cf33c874096b..ecfd2f92a531 100644
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
@@ -681,11 +687,11 @@ static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
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
@@ -751,8 +757,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
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

