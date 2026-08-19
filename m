Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A774B3DDAEB;
	Wed, 19 Aug 2026 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124744; cv=fail; b=ApkfXi7j+SODdS0l6PHc62FsAZ4mMHoIzet4jx/FE/DBljoaBGkzhLRToAh9+7iHleyQGuFqw3ArXgAQSAuN899j80PLc4V6349XVyrp/PqSA7fWRAlHPOZQ7WpwlC7ht1aphjfy0Xtj2EJ3TDs/BWogzqUw/pbXuUjvwpATEFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124744; c=relaxed/simple;
	bh=CIKG6AcJ+zoyRWcFG+eWX6jUMe2UWfJgPJ1OIGzn+P8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VfNxlrtBYXN5smmwPhJGKojaYfyWjuLw9CADWcT7LR4S+nfIvWd4F+0BWZLSxJ8IVZoPpN/OTFqkllRDCZZFwQD5Kfg0yUcLW6QOAKumCtpTVBI86jy00AFzQedBMFUlKbu9zZ71t0yacYDP+aaXJYAu35APKbM9GfwWUR8fC1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wVLiEL5e; arc=fail smtp.client-ip=52.101.61.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wVLiEL5e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHfxWNeBNOZz8rY86s8KSoqwe8RBw9VOuGSNt5rk0v2QwToN7A6Ay6U2eQWCD3ylvSlISkTltZyzlfIOK24O2tT/tBNUMORykLuLRRFqrd0wN6a1yRBAy1DaGXFxWNZVZnLivVxezvF7/muwS/pqrBhp4BbBGkM61zYXumFn7mXruYlEpe02dOJvpOc3pN9XUUTdifV2VeHHVAjK4IBzv5iLw4Gnt2tYnqyI+CBULlbkLf3s0bFFPiEVe+ijYcdvYNp7sMB2bz9Un+/YJgDpvRQaKx0e5c971idbXGA5J9J55HGcsRmfzC7corJ1EWx+fazGxnFijUr58WDU/dGCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OO/AzwYJMUJMEbqGkbLQbuwE12wn5vNzkZRdWPf3pKI=;
 b=QUXUCMusYHMb0U8oqTWmukUAvnuZSHO7nNOhgTXe20WwHKqKHfXc9vGCgPfIViepMiu/C7G7Bkz3ygPJIpA8tt4BBko4xzSMboMHBRAIBMTvrRzTfimawlY2V6mbEUVHRGe6rG61nEawnjhFKHiFZqekoO00gZKaDTGbR0ZlQbrpOYPBIaFNjnWgm832IJHdFMUh2Znu7l1uRSzGejmKk0MLMuz2O4kfvRPrQjaaLQRqHpQAZceLf7RV1bS+ekRjD4QbWP0t1z+JtEYF/05+gXaodpt+buDeb/yZCaJYetiqqzFgjRx5gE+/rnBRVnQJoONo6LrjcYIlpbDT31kmog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OO/AzwYJMUJMEbqGkbLQbuwE12wn5vNzkZRdWPf3pKI=;
 b=wVLiEL5eWTh9+K2GQXnGRYs20Uo0K2PinOcAjEPXhk6JoF8+8vCRZ+NgvXDL2ePgUZv/72VIUmXWudi+HnYR2jV4nZ7EINJLZBb+XlkVNJWEe+dq1bWf9dJnxHRBfSk2ig6rSNdJm0oYFKz1hV2fQMNRz49qYec1/5W+6CDKg9c=
Received: from CH5P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::10)
 by CH3PR12MB8403.namprd12.prod.outlook.com (2603:10b6:610:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 07:32:17 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::a1) by CH5P223CA0002.outlook.office365.com
 (2603:10b6:610:1f3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 07:32:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 07:32:17 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 02:32:15 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 2/4] platform/x86/amd/hsmp: Route metric table through the client messages
Date: Wed, 19 Aug 2026 13:01:55 +0530
Message-ID: <20260819073157.2426504-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819073157.2426504-1-muralidhara.mk@amd.com>
References: <20260819073157.2426504-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|CH3PR12MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb6dda3-33d5-409b-50ab-08defdc3fef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7ihhsgYNAzyRmwUHnY6lLWHf417cYVsZarSd3NWZZzkuKnMPXCxI3owXqAG6/4KFxZOMuj5ZDH5gLpUVML4KX3aZg7PikpunxjEasX1hL2E1+CTcjeYVbBCSZHodV7OXRIaOk1LtTHmlZy3BvN5bh4FZ/ydukBVK/ixyUMkl4IMEc2VHOHMwzf2AK9BMDK7liqLPf4r6WZwCH3rbGbNfLnV9lfu4wdvYT4WGI6ulwRqtzh7O9Tpb5l4TnDlrk6H+jWFbLPgjw9mDCqygrcfj3wz0vLe1TkqRXlwhCLPb4mnsw02/cwCIvs9A1/TJZM2hOXAku8rCMQGC7sq7djTgOHKH5Nb+7rNFMZLLDvwbAGreKJpa6JlzZ/LI11gZ3NZbN6b9c5YvHh77DxSuWIZl9MMZrYdghZlAiOYkV0gxRf8dLJOHUs5v6zFlQgWlFTK1QjEEsmzyIfkepLgcm90xw35AxM9kDXJsF+85cyYRtN4LW1tgb1Bkdktadyt09cm/m3tlA0Y+QZY3cHl3gCvMoeyqvQKfTiGp14mSm72FhumxYCET4fyeoVx1KIBP4oJ6Kxn+ZuNG9y9zklZPF9njoYkguLTfG3MQTy4LTr3I3qIO+Sd8bucpM1MpiZIkzdr6etu1cfPY/GXdLkEMjijI/+HSJVbC8CHATAwKFocDG0FP3nC7+bxQTXf1wyVL4IeMrwaCU5Sb0YxEcikELiu6Cw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KooF9u7tvaMqo78ZW0jOi+aAH8QhfSobuObZo9WIQSoXvSU39MWEt/ZRT3eCJ4M8BL7UnOOvF4bumB6ZlroCTnyqY7UWJYh4h+j3LwlRs9nVsDTgk/QMwySh1RG6dem9pPURAVHXYpDIX9ViZ3ALmi75WePR1jY2kZSbhmZcdeQk9VDWt+Ht1T0yo2dQDb6ICTN4ShRRWnSV4/7gnjiCjIO+9GMC3FT50EANWuhbqmdfLOrsa7RRaGPREBkoHvBFPhocVr6mB+sdzvXAd4CWm43/9n3Qr4QEJSCvPRqFQK+qpdwHGGtDOgW7/R7owxUFTmPYSgc7iGQFPqpict5SWGgx4BFTz6GrQeQIO19NCGsadWqCFjVCYjX6a1ni5dd8KjRt2b5Fp1GBk6jQ93gmOTS0oWfeQ6CJHsrjlESaSLc1P6WvxYOiICtG6nCosXyO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 07:32:17.0665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb6dda3-33d5-409b-50ab-08defdc3fef3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8403

Wire the client metric table and metrics DRAM address messages into the
metric table read path for the Family 1Ah client platforms.

The client reaches its metric table through the Ryzen Master SMC message
set, so add the two message IDs to struct hsmp_plat_desc and have
hsmp_metric_tbl_read_locked() and hsmp_get_tbl_dram_base() take them from
there. Unlike the test and version queries, these two are numbered
differently in the two sets (24h/25h server vs 05h/06h client), so they
must come from the descriptor rather than a shared constant.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index e8fac2d299f3..60889c1b1099 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -183,6 +183,8 @@ struct hsmp_plat_desc {
 	u32				num_msgs;
 	u32				test_msg;
 	u32				proto_ver_msg;
+	u32				metric_tbl_msg;
+	u32				metric_dram_msg;
 };
 
 static const struct hsmp_plat_desc hsmp_desc_server = {
@@ -190,6 +192,8 @@ static const struct hsmp_plat_desc hsmp_desc_server = {
 	.num_msgs		= HSMP_MSG_ID_MAX,
 	.test_msg		= HSMP_TEST,
 	.proto_ver_msg		= HSMP_GET_PROTO_VER,
+	.metric_tbl_msg		= HSMP_GET_METRIC_TABLE,
+	.metric_dram_msg	= HSMP_GET_METRIC_TABLE_DRAM_ADDR,
 };
 
 /* The client drives a different mailbox with the Ryzen Master SMC message set */
@@ -198,6 +202,8 @@ static const struct hsmp_plat_desc hsmp_desc_client = {
 	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
 	.test_msg		= HSMP_CLIENT_TEST,
 	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
+	.metric_tbl_msg		= HSMP_CLIENT_GET_METRICS_TABLE,
+	.metric_dram_msg	= HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
 };
 
 static struct hsmp_plat_device hsmp_pdev;
@@ -759,11 +765,11 @@ static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
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
@@ -829,8 +835,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	int ret;
 
 	msg.sock_ind	= sock_ind;
-	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
-	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
+	msg.msg_id	= hsmp_desc()->metric_dram_msg;
+	msg.response_sz	= get_msg_desc(msg.msg_id)->response_sz;
 
 	ret = hsmp_send_message_locked(&msg);
 	if (ret)
-- 
2.34.1

