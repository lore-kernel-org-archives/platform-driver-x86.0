Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078300;
	b=YS30p/wrF7rqva0inoxXYHGbLXc+ESTdpC5X7llIWIbccsBdojWCZl9pmGf6D4k65qEq
	 v4ddnL+Rq39KOkyfge5Keb2MHLqjZXNGAtt/SJOOSd1VGYEupiRK8l/FToJBsl2UGLc3T
	 ULDLJd1t8TQsQOLkMAgZ79NHK3ui5C5gn8am1sdm7ZNiOEPKrtlp9Rs8MvYwI8ZaqqZYj
	 1J1+nN0YNwy8lC0bRbl1WNI9k0Ki41QAnUQxp9YQvSHgQW9R2Ej48SBB1FqnJRjcBQac7
	 LYE5SouoCMnCRzLrKl2yagU/Ptu082734qa61pOYzwz4vDeA3tMZPwG94XE3jwD6eqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078300;
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
	bh=V4WDlPeUFGVj0O1bIppVQKGv1MX03giQCvjrmqmRgnw=;
	b=ngb85lYdiX1HFX66q6HTwpm789XFsVgEuJqaVbsZrXaXrU631pYZznLZB52vfbwBPUu+
	 STlJvnIga+eJLpnNWrTzsEezhuN4BPkP1w4Oodqp9V5onn1UXKktxaGb4O9fRSKCbyUoV
	 Pw561eIBY7kUbEARf9M8vufNGjLZ7+tdMPlymOVDbPazQL7+SKG1i03OUFshXAVFCmN6k
	 5OPdh1nN4aVvksSgTd/+BZj5xnkSCE6LGsa7ZBNlgvMXiunNautGwPNnj3j8TA4NsbULe
	 SDRAoalktkS4/iC4a6ECqc1pL6R06zCiBtjHXnIpwwM/okjDstUxEzxHNE0VA9cC6NQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qcRgweRH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.51
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012051.outbound.protection.outlook.com [40.107.200.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B70606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B70606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qcRgweRH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIU4hymKT9tt1BWIY4tONGGgmSQ/QXO6i651LOcXTHGMTwa4TFXxBp4Oxa2WCH/+OxUZFEjj12kDwN6VnjLzrz1uSBAL86Wyz/AcPXFb0hwhzmvaw/e0d/Ht9wqy+H7WUdLnjWdUWQ1B1bGVUqIHaO1YgCYyJUfgxBknr7+XGNQRTMdn7P5edIaPbbRHkZoKMY5wo/2MEZtcSzsw7IM/0cr2oB96loFaXJF20RFIT8vG1YXpXAWfJ0UhlbY+8KLr/xtEr7KkdwjLsmMCR7+LbM8MuR7G46AKvzVN7AsQ7wl107kPW1Cv/ddBuAxx+8SscDFDShHOzYqec+9PVOG1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4WDlPeUFGVj0O1bIppVQKGv1MX03giQCvjrmqmRgnw=;
 b=VfZxbOZXERF4FJQjOmIaT1flKbYrcOZRbfHYXs+7iPVxqPxzdl1VoOXxzChgVT8A5q/VN6DomwLhxDyBZXKuKnUE0V1BEzswr1aXTHuyT9XlagsOmmabYJLp4C1rIkCp4y4XyFYXMc8OlSZgN6dkYmnl7vSENJMUt3ONYYl8G/5PYswLlVdwK3tgzg59SlIOwOOA9xW6iZcxkgbylvsXNNoZDPV/uzEV/9hh68sCAH/iWDfUFgSWq0tv8quJMR/ofbuZTNmKODN53WFen6peEoOjLI0J6/z/V0hHpAwlbqvOA+bwC3oJbHK4h9BONCIZqnxtADNu2LJAKNo9f9WpVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4WDlPeUFGVj0O1bIppVQKGv1MX03giQCvjrmqmRgnw=;
 b=qcRgweRHfn4Tfc2OU4zHzutjy5+cBfrT3Rt1wuS14e5lvuSEQJ6AHbpINCLsE+fxQ9Jeu3JMWZWPUybXTWN3VoVItm4UhxVXkTGHtu0KD8/Xw5oc9N42BQBwB1rFfRxbs3Akut/7uLFMk1Z5hXPZpjadxi6L8dDhubtLTC6tlMM=
Received: from BN9P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::24)
 by PH7PR12MB5784.namprd12.prod.outlook.com (2603:10b6:510:1d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 08:51:34 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::84) by BN9P223CA0019.outlook.office365.com
 (2603:10b6:408:10b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 19
 Nov 2026 08:51:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:33 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:29 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>
Subject: [PATCH v2 05/11] platform/x86/amd/hsmp: Use local sock pointer in init_acpi()
Date: Thu, 19 Nov 2026 08:50:39 +0000
Message-ID: <b687097a27ba99121ab05c309b0012b5ddc16272.1795061419.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1795061419.git.Suma.Hegde@amd.com>
References: <cover.1795061419.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|PH7PR12MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 545b8e79-5224-455e-eec4-08df461a503d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|22082099003|18002099003|261009223027099003|261021123027099003|261021121427099003|56012099006|11063799006|261028144727099003|261102123227099003|261022075727099003|261026140227099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	rq4SJsDozpu4BtO/ZjAzfUHIQ51LMjT/uFsmEBu8SgFesQazvan05rvF60GelSh7YgRCIxcya+0u720p8TeAgRLK8UEOybU3MueV71DUFN1XcZTpNeBHQRUCPvGsN00AdHSWEnAcPLnBvTdo6IcEQJGl8/fcypFh4CP1PPF5uchtremLas4bKxnPQX0U728DkHvC1r89HokZ0cAsRQu0Livw3q31wLv+XhTFt5xzDEGxs1iqkF9K74qL6lmX5+iuG3JH4kYeG97yY9vdD8+zEvE+Twlf61Hsb9s0OSBPVmWg5K3FA2cJzoCQFP9zEArUtWaO9EJzgFzk+rYpZAqg87G1M29GPxnUmTjD5gE9exTDYm07jarVKvmKfWwUDo0erExqZKYs3lGk4SKgztR3cZAB1e5klR0PHKPf61HFKQLATyn9mYs5zFDSY5j+/VxE+rLE2VYjKWX3c2Zj4Hgr4TDwaEJSN3nGaoOtrRlc2nUTndFeESCiB4bKEdWQysJfunK5vH7tIckWx4BvvUiiFIprGeO0ohQbdmmItR5afye426DBH2I1i1PJwH7d9INW7bqUPlrpZG4vxdRmEIyrd9g2MWzZYWlXJr6XCRtRptDtSQxKLxa77JJktevHvkvnUsy5Zd95xaHr2ptXbP6tegIqCa4KUlpqjvqHgpCFg1Y+giYtgtLuXAmMKKB/EZ28p/nzsVFyJeX2Kg7GIQDpng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(261009223027099003)(261021123027099003)(261021121427099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261022075727099003)(261026140227099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+Y0da9HDeylWHJLGzBa/FbZj5+2CbVaMXFZHacTke5jMH7OJrd8zPdtZMLGcW55G61dMFOOTD/1DTN3mbPeZSBcT24NFKtmKjzi5TqxDWm7QY+ynNRH44hFDU1MKt1eTzFezdl6lQ9Zh/v0g+iIowOLzqW03+2WJJN1aGF5eZaM40mbrBqnPvvij2V99ZeSMNrXgBoUeJ1jlKerAzjDABYWedPPQD3gZ3BIeQh+uvNxz1MRq7DBYssSgLD8k2llfd/rFX6V3ZT67OfNWW86Uwe3KYWo+J8bT3MKGi1AjhIjIoz81oUlCpgjMPKrdXR7b5Pvi2Oo+uE+acCL46loivkA+jLNazURpbW1HIlOcAFOA7LSH7nYIBCAKDgYauixDUzSJQpTIzkHb1V6JYw36/jJI3FjmAEnZcyWEXXelumObJbbucSEHqXFyXxwPldTW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:33.8729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 545b8e79-5224-455e-eec4-08df461a503d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5784

From: Suma Hegde <Suma.Hegde@amd.com>

Introduce a local struct hsmp_socket *sock pointer in init_acpi() to avoid
repeated use of &hsmp_pdev->sock[sock_ind]. The subsequent patch adds more
users of this pointer beyond dev_set_drvdata().

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---

Changes since v1:
- None.

 drivers/platform/x86/amd/hsmp/acpi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 223dece3b91e0..eee66825eb904 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -547,6 +547,7 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
  */
 static int init_acpi(struct device *dev)
 {
+	struct hsmp_socket *sock;
 	u16 sock_ind;
 	int ret;
 
@@ -564,6 +565,8 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
+	sock = &hsmp_pdev->sock[sock_ind];
+
 	/* Test the hsmp interface */
 	ret = hsmp_test(sock_ind, 0xDEADBEEF);
 	if (ret) {
@@ -587,9 +590,9 @@ static int init_acpi(struct device *dev)
 	 * between the two.
 	 */
 	if ((is_client_platform() &&
-	     hsmp_pdev->sock[sock_ind].proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
+	     sock->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
 	    (!is_client_platform() &&
-	     hsmp_pdev->sock[sock_ind].proto_ver >= HSMP_PROTO_VER6)) {
+	     sock->proto_ver >= HSMP_PROTO_VER6)) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
@@ -602,7 +605,7 @@ static int init_acpi(struct device *dev)
 			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
 	}
 
-	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
+	dev_set_drvdata(dev, sock);
 
 	return 0;
 }
-- 
2.34.1

