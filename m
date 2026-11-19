Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078305;
	b=xa1m67E2A2l+QtrDXri5JDWMdGYIeOFVmbG/cOF7+Orui/dZc4A9Wusg/gQU5VeXywxV
	 igfthnFmyzcgIx1e4aKBihb9nAzcVtOM0LMvIBjt63DRL3De4GSbsmDzmSY35JlZObOl3
	 /HkpEN+vjYqRvuRAU8j8Q4c9FzqxoNQFjfZ7ZMXXesMvdr24CCfwy41TK95+g2MPuoJwM
	 HL7DLr0euKBbDJA4lNLvkdTdsu3s9YSaG9Z7jy06csYWG0ph6VjO0P2/667eMlSbNHtbJ
	 P17bMqSi38aBllrCBFT8A/g2/ibOLgY/GDuNNGj6Fx6U+B3dGybwauFrXFhO0DkL3zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078305;
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
	bh=ofDlBrgqYgfvPBCHGmUVY2BeUIU2nU7nyamQoXRVABg=;
	b=MVyXCauV8eUEGToKxNeHdpL98Vax+fMwa3jWs+zAnF7hXfJ0fm+DjF/ifr0E8F0erA1f
	 x+mZ0jIN+QRRWdrcKWRxIIq2hhJ9phjVGpJzUwdSryH8IXikGTe345RwryiDNmjLgDuO1
	 r8d84IV3AFp3f/G7H/HaYZ49wqgFPH8mGnpKVZZyvfS4VNsVRQf0qB+p1FUOpOHN60gSd
	 V0F+aqkcGwxcp/adE61T8B/OTclHMCnngrqqQz4Lp219EknCqTR2UeLGM3WAs6TPqE5LT
	 +LsttDw3EDZzOfR5EHLj9xbWhhAQBHWNb/cXaSsZmprq4utNcLvwr+2PFsd8ctXTMBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=k0NFJPOk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.55
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9169606A32C
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9169606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=k0NFJPOk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=en8UupAH+1MvGsAEJZf+mrBQHkf3j+LfW+GsOG/2tmZzqRdnxpza7qcXan0umvf+4TK6xFkKohXAFgchhYmv69jKjRJtcDIkr7sjXc1/aEQn+556tMQY7kyx8t/wPdTzKEWmPjxdBDhNy357AM8kmos84sWl8+w818SCykou/ykiIvo2NSlQzLmtYQHYNsmfZBx98c0cTG0e5rd8VKohwUDSuspIf0RCPZ3HFh8gp0D7vwBJjGY0vrS4toAEQvxolCcbHrUvDBPByPAI2T1a9bsWl5W1yayXwzT8vYa19U5k12r4CcWN25DsPUmTWtKMB8k+MFxs4+sWmcT7sNjp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofDlBrgqYgfvPBCHGmUVY2BeUIU2nU7nyamQoXRVABg=;
 b=Sn3kkfv6ZfV5R8Gpww3g2QPKMsSTigklu7iBYCOZiOFSYrCuOUc1lYJroUlnqk0jaFDlxAMmigwCS0RXERFoNsu6sI0St/hXM+luPQSoqtE8IbuF1xJ56EDYVeDgC3+R6JbB0QQx0U0VdAnq7aGetSxPzq+u2yF9LQfypWGlwMRkrjZjJkU/EPkmqeopOTMr6q4wMcLW8vl3vVyqhdQuEH1cffKW1hIh8kQYlR60RVKmR6DvsOQ6Q7P5ljTq5Wyq3wgkxWhKLkUrHFxjvBbmUyyfMt/Q18BTFkBIjMnwRKA+1+rb9xucf0bgIusf3Sl1i58UdPipsy6qpOJL2uPxKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofDlBrgqYgfvPBCHGmUVY2BeUIU2nU7nyamQoXRVABg=;
 b=k0NFJPOk2WSEIe2Wf5nNylHzZVWFpzKzjuQLJgjbRx7rSN6NNrfnD4dj/ObpINKHqcUIiM6QEL/8s5FQZpF9pMbZC4CYh2Rcvomnsy1Tm/t2FHxhXtmcaZLF/Btq488kf15DPCcEZwa8UyOeRfI+x1d3eoiIkUylH6yitrR4vNw=
Received: from BN9P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::29)
 by DS0PR12MB6558.namprd12.prod.outlook.com (2603:10b6:8:d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 08:51:37 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::22) by BN9P223CA0024.outlook.office365.com
 (2603:10b6:408:10b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 19
 Nov 2026 08:51:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:37 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:33 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Dhruv Gupta <dhruv.gupta@amd.com>
Subject: [PATCH v2 07/11] platform/x86/amd/hsmp: Add per-platform bitmap to validate HSMP messages
Date: Thu, 19 Nov 2026 08:50:41 +0000
Message-ID: <e21f764082c1552a1e6756691c37e4c1e7cc4469.1795061419.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|DS0PR12MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: f9eed4b7-9310-44bd-f27a-08df461a5281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|6133799003|18002099003|22082099003|3023799007|11063799006|10067099003|56012099006|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102130727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	g9JV4aoFx9s5nRaGG/VGW8vpXNM72Rgi8hkYqEPExyo60gEcNRdCumztaRAuJ1PXXQSNV/m44+6WMWpaWDiL+Ygzi3jC5vw4k+kETs2JYp6TYsqGuKvRNwfb0IzUzfwqO3x5u+aD5KATzWB9qsKkh891PqP7z9RRldd6odafJXl/+5dHBuSSAZwZKlIV+cqB0Dj8RjJsDJe7bqaZCGS0zFsMdS3mo80WvBbWjElykmYk3BJrGxDgmVW1Rx5RnRZZJLNvwGNzGkBRyBwUzfJXtIv6hdlXVRY8hAPINVTjb154/k0kXRCAo0LclnA+bYn+G2qJWAmXIxEn7USh8T/L9P0fu9CBVTvxhHTfoxwLAkL7Vmia5Q7Ioxt4xak9RraR9SzcyYM0wufG8/+IF5yKKxMMC+GcCdvUzfU6F9rVv9HV6TMHkBqgjQbqgv1NmnFW0TmrjrI7N0mhxyhHc5bVSsTKnmomIBiaEdJRIIEPenn8PZlE3A1BIGQgtUMTLtsVe7zTlKbQKdCiWmsj21jUEvvSP41uVLVCRGVcq0WB4jcKqsDewWr0D7Lihi8N4V4ZbXB4Pel0AeZybGusAH61dUYF8APH957Js3LY/K8zM9QIPZ+A+Lxx0466Yp7MXtLTbSrnBrwkRu/LD2d9ATEztu66wfOmI08H9GJTcbNGe0hxyCcTBWUWuzsE3rBSk82qjpmHnDPYw9ZnQFmoDszg5w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(56012099006)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102130727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MAoTHlqt6rgUtF2MNu2fKheTUW80CBybIsiibX9lnL6HVnFJlxoZHjkGtV1TBgevub++m2udLgRRTxpjBwBFhbjRsh3ycIOyceahV8tRmyKKqCTjCEFcB0ZvCLJnGa5Ov7gwxcBgrI45VJchSB2n/jj2kwYJS8uGodudEuGGbebQZqgRrSElRpwSzPiy1rGHWLo7n+TpJfiW5zGdZ9sET8xVsEgCiaE+5L4NUAYYKUPVtejNpndnwQBZdySTfFIMzcJ0AzgybWwK2dKKEG3M0i9wYay8z9vkEgJZBKab5EFdMvdKGwh3dGTJvEpwS8f/EPAu4BBtTh8/Bgu2xFRhPmyUBxdh6o74X0NMDcUBywvb3Hqc8xUx44R2KhFl2EYRaH41Brkp5tNy3xWlbekSEaKs9lFmySBvIPs9ApJ6IAM2opOlPxjJrZWVwPyC30Pp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:37.6745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9eed4b7-9310-44bd-f27a-08df461a5281
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6558

From: Suma Hegde <Suma.Hegde@amd.com>

The HSMP driver previously allowed sending any message defined in
amd_hsmp.h, including ones not supported on the running platform.

Add read and write bitmaps per socket to store which HSMP messages
are enabled on the platform. Add validation in validate_message()
to reject unsupported messages before they reach the SMU.

Key changes:
- Introduce enabled_read_msg_ids and enabled_write_msg_ids bitmaps in
  struct hsmp_socket.
- Add is_read_msg_enabled() and is_write_msg_enabled() helpers in
  hsmp.h.
- Use is_get_msg() to distinguish read and write HSMP messages.
- Mark HSMP_TEST, HSMP_GET_PROTO_VER, and HSMP_GET_SMU_VER as always
  enabled during bitmap initialization, as these cannot be masked by
  BIOS.
- Skip bitmap init, populate, and validation on client platforms; the
  client message set has no per-platform bitmaps yet.
- Skip hwmon registration on client platforms in the plat probe path.

Co-developed-by: Dhruv Gupta <dhruv.gupta@amd.com>
Signed-off-by: Dhruv Gupta <dhruv.gupta@amd.com>
Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---

Changes since v1:
- Express static bitmaps with named HSMP_MSG_BIT()/BIT() entries
  instead of opaque hex constants, and add blank lines after the
  array initializers.
- Update the 6th Gen AMD EPYC Server bitmaps: add
  HSMP_PQOS_TRAFFIC_PRIORITY and HSMP_PQOS_FLOATING_BW; drop
  HSMP_SET_XGMI_PSTATE_RANGE from the write bitmap.
- Soften the static-table comment so it does not forward-reference
  hsmp_set_default_msg_bitmap() before that helper exists.
- Skip hwmon registration on client platforms in the plat probe path.

 drivers/platform/x86/amd/hsmp/acpi.c |  13 ++
 drivers/platform/x86/amd/hsmp/hsmp.c | 312 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h |  27 +++
 drivers/platform/x86/amd/hsmp/plat.c |  23 +-
 4 files changed, 371 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index eee66825eb904..893ae7be05b4b 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -567,6 +567,11 @@ static int init_acpi(struct device *dev)
 
 	sock = &hsmp_pdev->sock[sock_ind];
 
+	if (!is_client_platform()) {
+		init_read_enabled_msg_bitmap(sock);
+		init_write_enabled_msg_bitmap(sock);
+	}
+
 	/* Test the hsmp interface */
 	ret = hsmp_test(sock_ind, 0xDEADBEEF);
 	if (ret) {
@@ -582,6 +587,14 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
+	if (!is_client_platform()) {
+		ret = hsmp_populate_msg_bitmaps(sock_ind);
+		if (ret) {
+			dev_err(dev, "Failed to get enabled HSMP messages on this platform\n");
+			return ret;
+		}
+	}
+
 	/*
 	 * proto_ver holds the Ryzen Master interface version on client
 	 * platforms, a separate numbering space from enum
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 9516cf182917b..085edd2ed3d6f 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -11,6 +11,8 @@
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
+#include <linux/bitmap.h>
+#include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <linux/cleanup.h>
 #include <linux/compiler.h>
@@ -292,6 +294,8 @@ static int validate_message(struct hsmp_message *msg)
 {
 	const struct hsmp_plat_desc *plat_desc = hsmp_desc();
 	const struct hsmp_msg_desc *desc;
+	struct hsmp_socket *sock;
+	unsigned int sock_ind;
 
 	if (!plat_desc->msg_desc) {
 		/*
@@ -314,6 +318,17 @@ static int validate_message(struct hsmp_message *msg)
 	if (!desc)
 		return -ENOMSG;
 
+	sock_ind = array_index_nospec(msg->sock_ind, hsmp_pdev.num_sockets);
+	sock = &hsmp_pdev.sock[sock_ind];
+
+	if (is_get_msg(desc, msg)) {
+		if (!is_read_msg_enabled(sock, msg->msg_id))
+			return -ENOMSG;
+	} else {
+		if (!is_write_msg_enabled(sock, msg->msg_id))
+			return -ENOMSG;
+	}
+
 	/*
 	 * num_args passed by user should match the num_args specified in
 	 * message description table.
@@ -812,6 +827,303 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_cache_proto_ver, "AMD_HSMP");
 
+/*
+ * Predefined read and write enabled-message bitmaps for platforms where
+ * HSMP_GET_ENABLED_HSMP_CMDS (37h) is not available. Each bit is the named
+ * HSMP_MSG_BIT(msg_id) for a supported message in that direction.
+ *
+ * Newer and future platforms that implement 37h do not need new entries
+ * here. Unknown family/model currently returns -ENODEV from
+ * hsmp_populate_msg_bitmaps(); a later patch adds a firmware query
+ * fallback for those platforms.
+ */
+#define HSMP_MSG_BIT(id)	BIT((unsigned int)(id) % 32)
+
+static const u32 read_bitmap_f19h_m00h_0fh[] = {
+	HSMP_MSG_BIT(HSMP_TEST) |
+	HSMP_MSG_BIT(HSMP_GET_SMU_VER) |
+	HSMP_MSG_BIT(HSMP_GET_PROTO_VER) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER_LIMIT_MAX) |
+	HSMP_MSG_BIT(HSMP_GET_BOOST_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_PROC_HOT) |
+	HSMP_MSG_BIT(HSMP_GET_FCLK_MCLK) |
+	HSMP_MSG_BIT(HSMP_GET_CCLK_THROTTLE_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_C0_PERCENT) |
+	HSMP_MSG_BIT(HSMP_GET_NBIO_DPM_LEVEL) |
+	HSMP_MSG_BIT(HSMP_GET_DDR_BANDWIDTH),
+	0,
+	0,
+};
+
+static const u32 write_bitmap_f19h_m00h_0fh[] = {
+	HSMP_MSG_BIT(HSMP_SET_SOCKET_POWER_LIMIT) |
+	HSMP_MSG_BIT(HSMP_SET_BOOST_LIMIT) |
+	HSMP_MSG_BIT(HSMP_SET_BOOST_LIMIT_SOCKET) |
+	HSMP_MSG_BIT(HSMP_SET_XGMI_LINK_WIDTH) |
+	HSMP_MSG_BIT(HSMP_SET_DF_PSTATE) |
+	HSMP_MSG_BIT(HSMP_SET_AUTO_DF_PSTATE) |
+	HSMP_MSG_BIT(HSMP_SET_NBIO_DPM_LEVEL),
+	0,
+	0,
+};
+
+static const u32 read_bitmap_zen4_variants[] = {
+	HSMP_MSG_BIT(HSMP_TEST) |
+	HSMP_MSG_BIT(HSMP_GET_SMU_VER) |
+	HSMP_MSG_BIT(HSMP_GET_PROTO_VER) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER_LIMIT_MAX) |
+	HSMP_MSG_BIT(HSMP_GET_BOOST_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_PROC_HOT) |
+	HSMP_MSG_BIT(HSMP_GET_FCLK_MCLK) |
+	HSMP_MSG_BIT(HSMP_GET_CCLK_THROTTLE_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_C0_PERCENT) |
+	HSMP_MSG_BIT(HSMP_GET_NBIO_DPM_LEVEL) |
+	HSMP_MSG_BIT(HSMP_GET_DDR_BANDWIDTH) |
+	HSMP_MSG_BIT(HSMP_GET_DIMM_TEMP_RANGE) |
+	HSMP_MSG_BIT(HSMP_GET_DIMM_POWER) |
+	HSMP_MSG_BIT(HSMP_GET_DIMM_THERMAL) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_FREQ_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_CCLK_CORE_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_RAILS_SVI) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_FMAX_FMIN) |
+	HSMP_MSG_BIT(HSMP_GET_IOLINK_BANDWITH) |
+	HSMP_MSG_BIT(HSMP_GET_XGMI_BANDWITH),
+	0,
+	0,
+};
+
+static const u32 write_bitmap_zen4_variants[] = {
+	HSMP_MSG_BIT(HSMP_SET_SOCKET_POWER_LIMIT) |
+	HSMP_MSG_BIT(HSMP_SET_BOOST_LIMIT) |
+	HSMP_MSG_BIT(HSMP_SET_BOOST_LIMIT_SOCKET) |
+	HSMP_MSG_BIT(HSMP_SET_XGMI_LINK_WIDTH) |
+	HSMP_MSG_BIT(HSMP_SET_DF_PSTATE) |
+	HSMP_MSG_BIT(HSMP_SET_AUTO_DF_PSTATE) |
+	HSMP_MSG_BIT(HSMP_SET_NBIO_DPM_LEVEL) |
+	HSMP_MSG_BIT(HSMP_SET_GMI3_WIDTH),
+	HSMP_MSG_BIT(HSMP_SET_PCI_RATE) |
+	HSMP_MSG_BIT(HSMP_SET_POWER_MODE) |
+	HSMP_MSG_BIT(HSMP_SET_PSTATE_MAX_MIN),
+	0,
+};
+
+static const u32 read_bitmap_f19h_m80h_9fh[] = {
+	HSMP_MSG_BIT(HSMP_TEST) |
+	HSMP_MSG_BIT(HSMP_GET_SMU_VER) |
+	HSMP_MSG_BIT(HSMP_GET_PROTO_VER) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER_LIMIT_MAX) |
+	HSMP_MSG_BIT(HSMP_GET_BOOST_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_PROC_HOT) |
+	HSMP_MSG_BIT(HSMP_GET_FCLK_MCLK) |
+	HSMP_MSG_BIT(HSMP_GET_CCLK_THROTTLE_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_C0_PERCENT) |
+	HSMP_MSG_BIT(HSMP_GET_NBIO_DPM_LEVEL) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_FREQ_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_CCLK_CORE_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_RAILS_SVI) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_FMAX_FMIN) |
+	HSMP_MSG_BIT(HSMP_GET_IOLINK_BANDWITH) |
+	HSMP_MSG_BIT(HSMP_GET_XGMI_BANDWITH),
+	HSMP_MSG_BIT(HSMP_GET_METRIC_TABLE_VER) |
+	HSMP_MSG_BIT(HSMP_GET_METRIC_TABLE) |
+	HSMP_MSG_BIT(HSMP_GET_METRIC_TABLE_DRAM_ADDR),
+	0,
+};
+
+static const u32 write_bitmap_f19h_m80h_9fh[] = {
+	HSMP_MSG_BIT(HSMP_SET_SOCKET_POWER_LIMIT) |
+	HSMP_MSG_BIT(HSMP_SET_BOOST_LIMIT) |
+	HSMP_MSG_BIT(HSMP_SET_BOOST_LIMIT_SOCKET) |
+	HSMP_MSG_BIT(HSMP_SET_NBIO_DPM_LEVEL),
+	0,
+	0,
+};
+
+static const u32 read_bitmap_f1ah_m00h_1fh[] = {
+	HSMP_MSG_BIT(HSMP_TEST) |
+	HSMP_MSG_BIT(HSMP_GET_SMU_VER) |
+	HSMP_MSG_BIT(HSMP_GET_PROTO_VER) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER_LIMIT_MAX) |
+	HSMP_MSG_BIT(HSMP_GET_BOOST_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_PROC_HOT) |
+	HSMP_MSG_BIT(HSMP_GET_FCLK_MCLK) |
+	HSMP_MSG_BIT(HSMP_GET_CCLK_THROTTLE_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_C0_PERCENT) |
+	HSMP_MSG_BIT(HSMP_GET_NBIO_DPM_LEVEL) |
+	HSMP_MSG_BIT(HSMP_GET_DDR_BANDWIDTH) |
+	HSMP_MSG_BIT(HSMP_GET_DIMM_TEMP_RANGE) |
+	HSMP_MSG_BIT(HSMP_GET_DIMM_POWER) |
+	HSMP_MSG_BIT(HSMP_GET_DIMM_THERMAL) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_FREQ_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_CCLK_CORE_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_RAILS_SVI) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_FMAX_FMIN) |
+	HSMP_MSG_BIT(HSMP_GET_IOLINK_BANDWITH) |
+	HSMP_MSG_BIT(HSMP_GET_XGMI_BANDWITH),
+	HSMP_MSG_BIT(HSMP_SET_POWER_MODE) |
+	HSMP_MSG_BIT(HSMP_CPU_RAIL_ISO_FREQ_POLICY) |
+	HSMP_MSG_BIT(HSMP_DFC_ENABLE_CTRL) |
+	HSMP_MSG_BIT(HSMP_GET_RAPL_UNITS) |
+	HSMP_MSG_BIT(HSMP_GET_RAPL_CORE_COUNTER) |
+	HSMP_MSG_BIT(HSMP_GET_RAPL_PACKAGE_COUNTER),
+	0,
+};
+
+static const u32 write_bitmap_f1ah_m00h_1fh[] = {
+	HSMP_MSG_BIT(HSMP_SET_SOCKET_POWER_LIMIT) |
+	HSMP_MSG_BIT(HSMP_SET_BOOST_LIMIT) |
+	HSMP_MSG_BIT(HSMP_SET_BOOST_LIMIT_SOCKET) |
+	HSMP_MSG_BIT(HSMP_SET_XGMI_LINK_WIDTH) |
+	HSMP_MSG_BIT(HSMP_SET_DF_PSTATE) |
+	HSMP_MSG_BIT(HSMP_SET_AUTO_DF_PSTATE) |
+	HSMP_MSG_BIT(HSMP_SET_NBIO_DPM_LEVEL) |
+	HSMP_MSG_BIT(HSMP_SET_GMI3_WIDTH),
+	HSMP_MSG_BIT(HSMP_SET_POWER_MODE) |
+	HSMP_MSG_BIT(HSMP_SET_PSTATE_MAX_MIN) |
+	HSMP_MSG_BIT(HSMP_SET_XGMI_PSTATE_RANGE) |
+	HSMP_MSG_BIT(HSMP_CPU_RAIL_ISO_FREQ_POLICY) |
+	HSMP_MSG_BIT(HSMP_DFC_ENABLE_CTRL),
+	0,
+};
+
+/*
+ * Family 0x1A model 0x50-0x5f, family 0x1A model 0xC0-0xCF,
+ * family 0x1A model 0x90-0x9B and family 0x1A model 0xA0-0xAB
+ * belong to 6th Gen AMD EPYC Server family.
+ */
+static const u32 read_bitmap_zen6_variants[] = {
+	HSMP_MSG_BIT(HSMP_TEST) |
+	HSMP_MSG_BIT(HSMP_GET_SMU_VER) |
+	HSMP_MSG_BIT(HSMP_GET_PROTO_VER) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_POWER_LIMIT_MAX) |
+	HSMP_MSG_BIT(HSMP_GET_BOOST_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_PROC_HOT) |
+	HSMP_MSG_BIT(HSMP_SET_XGMI_LINK_WIDTH) |
+	HSMP_MSG_BIT(HSMP_SET_DF_PSTATE) |
+	HSMP_MSG_BIT(HSMP_GET_FCLK_MCLK) |
+	HSMP_MSG_BIT(HSMP_GET_CCLK_THROTTLE_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_C0_PERCENT) |
+	HSMP_MSG_BIT(HSMP_GET_NBIO_DPM_LEVEL) |
+	HSMP_MSG_BIT(HSMP_GET_DDR_BANDWIDTH) |
+	HSMP_MSG_BIT(HSMP_GET_DIMM_TEMP_RANGE) |
+	HSMP_MSG_BIT(HSMP_GET_DIMM_POWER) |
+	HSMP_MSG_BIT(HSMP_GET_DIMM_THERMAL) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_FREQ_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_CCLK_CORE_LIMIT) |
+	HSMP_MSG_BIT(HSMP_GET_RAILS_SVI) |
+	HSMP_MSG_BIT(HSMP_GET_SOCKET_FMAX_FMIN) |
+	HSMP_MSG_BIT(HSMP_GET_IOLINK_BANDWITH) |
+	HSMP_MSG_BIT(HSMP_GET_XGMI_BANDWITH),
+	HSMP_MSG_BIT(HSMP_SET_POWER_MODE) |
+	HSMP_MSG_BIT(HSMP_SET_PSTATE_MAX_MIN) |
+	HSMP_MSG_BIT(HSMP_GET_METRIC_TABLE_VER) |
+	HSMP_MSG_BIT(HSMP_GET_METRIC_TABLE) |
+	HSMP_MSG_BIT(HSMP_GET_METRIC_TABLE_DRAM_ADDR) |
+	HSMP_MSG_BIT(HSMP_CPU_RAIL_ISO_FREQ_POLICY) |
+	HSMP_MSG_BIT(HSMP_DFC_ENABLE_CTRL) |
+	HSMP_MSG_BIT(HSMP_PC6_ENABLE) |
+	HSMP_MSG_BIT(HSMP_CC6_ENABLE) |
+	HSMP_MSG_BIT(HSMP_GET_RAPL_UNITS) |
+	HSMP_MSG_BIT(HSMP_GET_RAPL_CORE_COUNTER) |
+	HSMP_MSG_BIT(HSMP_GET_RAPL_PACKAGE_COUNTER) |
+	HSMP_MSG_BIT(HSMP_DIMM_SB_RD) |
+	HSMP_MSG_BIT(HSMP_READ_CCD_POWER) |
+	HSMP_MSG_BIT(HSMP_READ_TDELTA) |
+	HSMP_MSG_BIT(HSMP_GET_SVI3_VR_CTRL_TEMP) |
+	HSMP_MSG_BIT(HSMP_GET_ENABLED_HSMP_CMDS) |
+	HSMP_MSG_BIT(HSMP_SET_GET_FLOOR_LIMIT) |
+	HSMP_MSG_BIT(HSMP_SDPS_LIMIT) |
+	HSMP_MSG_BIT(HSMP_PQOS_TRAFFIC_PRIORITY) |
+	HSMP_MSG_BIT(HSMP_PQOS_FLOATING_BW),
+	0,
+};
+
+static const u32 write_bitmap_zen6_variants[] = {
+	HSMP_MSG_BIT(HSMP_SET_SOCKET_POWER_LIMIT) |
+	HSMP_MSG_BIT(HSMP_SET_BOOST_LIMIT) |
+	HSMP_MSG_BIT(HSMP_SET_BOOST_LIMIT_SOCKET) |
+	HSMP_MSG_BIT(HSMP_SET_XGMI_LINK_WIDTH) |
+	HSMP_MSG_BIT(HSMP_SET_DF_PSTATE) |
+	HSMP_MSG_BIT(HSMP_SET_AUTO_DF_PSTATE) |
+	HSMP_MSG_BIT(HSMP_SET_NBIO_DPM_LEVEL),
+	HSMP_MSG_BIT(HSMP_SET_POWER_MODE) |
+	HSMP_MSG_BIT(HSMP_SET_PSTATE_MAX_MIN) |
+	HSMP_MSG_BIT(HSMP_CPU_RAIL_ISO_FREQ_POLICY) |
+	HSMP_MSG_BIT(HSMP_DFC_ENABLE_CTRL) |
+	HSMP_MSG_BIT(HSMP_PC6_ENABLE) |
+	HSMP_MSG_BIT(HSMP_CC6_ENABLE) |
+	HSMP_MSG_BIT(HSMP_SET_GET_FLOOR_LIMIT) |
+	HSMP_MSG_BIT(HSMP_DIMM_SB_WR) |
+	HSMP_MSG_BIT(HSMP_SDPS_LIMIT) |
+	HSMP_MSG_BIT(HSMP_PQOS_TRAFFIC_PRIORITY) |
+	HSMP_MSG_BIT(HSMP_PQOS_FLOATING_BW),
+	0,
+};
+
+#define set_read_enabled_msg_bitmap(sock, src)	\
+	bitmap_from_arr32((sock)->enabled_read_msg_ids, (src), HSMP_MAX_MSGS)
+#define set_write_enabled_msg_bitmap(sock, src)	\
+	bitmap_from_arr32((sock)->enabled_write_msg_ids, (src), HSMP_MAX_MSGS)
+
+int hsmp_populate_msg_bitmaps(u16 sock_ind)
+{
+	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
+
+	switch (boot_cpu_data.x86) {
+	case 0x19:
+		switch (boot_cpu_data.x86_model) {
+		case 0x00 ... 0x0F:
+			set_read_enabled_msg_bitmap(sock, read_bitmap_f19h_m00h_0fh);
+			set_write_enabled_msg_bitmap(sock, write_bitmap_f19h_m00h_0fh);
+			return 0;
+		case 0x10 ... 0x1F:
+		case 0xA0 ... 0xAF:
+			set_read_enabled_msg_bitmap(sock, read_bitmap_zen4_variants);
+			set_write_enabled_msg_bitmap(sock, write_bitmap_zen4_variants);
+			return 0;
+		case 0x80 ... 0x9F:
+			set_read_enabled_msg_bitmap(sock, read_bitmap_f19h_m80h_9fh);
+			set_write_enabled_msg_bitmap(sock, write_bitmap_f19h_m80h_9fh);
+			return 0;
+		}
+		break;
+	case 0x1A:
+		switch (boot_cpu_data.x86_model) {
+		case 0x00 ... 0x1F:
+			set_read_enabled_msg_bitmap(sock, read_bitmap_f1ah_m00h_1fh);
+			set_write_enabled_msg_bitmap(sock, write_bitmap_f1ah_m00h_1fh);
+			return 0;
+		case 0x50 ... 0x5F:
+		case 0x90 ... 0x9B:
+		case 0xA0 ... 0xAB:
+		case 0xC0 ... 0xCF:
+			set_read_enabled_msg_bitmap(sock, read_bitmap_zen6_variants);
+			set_write_enabled_msg_bitmap(sock, write_bitmap_zen6_variants);
+			/*
+			 * PC6 control (msg 0x29) is not supported from
+			 * protocol 0x70002 onwards on these models.
+			 */
+			if (sock->proto_ver >= 0x70002) {
+				clear_bit(HSMP_PC6_ENABLE, sock->enabled_read_msg_ids);
+				clear_bit(HSMP_PC6_ENABLE, sock->enabled_write_msg_ids);
+			}
+			return 0;
+		}
+	}
+	return -ENODEV;
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_populate_msg_bitmaps, "AMD_HSMP");
+
 static const struct file_operations hsmp_fops = {
 	.owner		= THIS_MODULE,
 	.unlocked_ioctl	= hsmp_ioctl,
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 5b05dcb074846..ee2bb95b66221 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -13,6 +13,8 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
+#include <linux/bitmap.h>
+#include <linux/bitops.h>
 #include <linux/compiler_types.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
@@ -26,6 +28,8 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
+#define HSMP_MAX_MSGS			96
+
 #define HSMP_METRICS_TABLE_NAME	"metrics_bin"
 
 #define HSMP_ATTR_GRP_NAME_SIZE	10
@@ -78,6 +82,8 @@ struct hsmp_socket {
 	struct device *dev;
 	u16 sock_ind;
 	u32 proto_ver;
+	DECLARE_BITMAP(enabled_read_msg_ids, HSMP_MAX_MSGS);
+	DECLARE_BITMAP(enabled_write_msg_ids, HSMP_MAX_MSGS);
 	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
 };
 
@@ -87,7 +93,28 @@ struct hsmp_plat_device {
 	u16 num_sockets;
 };
 
+/* HSMP_TEST, HSMP_GET_PROTO_VER, HSMP_GET_SMU_VER are always enabled in
+ * all the platforms and can't be masked by BIOS. Set those bits in the
+ * bitmap during bitmap initialization.
+ */
+#define init_read_enabled_msg_bitmap(sock)					\
+	do {									\
+		bitmap_zero((sock)->enabled_read_msg_ids, HSMP_MAX_MSGS);	\
+		bitmap_set((sock)->enabled_read_msg_ids, HSMP_TEST, 1);		\
+		bitmap_set((sock)->enabled_read_msg_ids, HSMP_GET_PROTO_VER, 1);\
+		bitmap_set((sock)->enabled_read_msg_ids, HSMP_GET_SMU_VER, 1);	\
+	} while (0)
+
+#define init_write_enabled_msg_bitmap(sock)	\
+	bitmap_zero((sock)->enabled_write_msg_ids, HSMP_MAX_MSGS)
+
+#define is_read_msg_enabled(sock, msg_id)	\
+	test_bit((msg_id), (sock)->enabled_read_msg_ids)
+#define is_write_msg_enabled(sock, msg_id)	\
+	test_bit((msg_id), (sock)->enabled_write_msg_ids)
+
 int hsmp_cache_proto_ver(u16 sock_ind);
+int hsmp_populate_msg_bitmaps(u16 sock_ind);
 int hsmp_test(u16 sock_ind, u32 value);
 long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
 void hsmp_misc_deregister(void);
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 40c98d9c66d4f..a0b1cac8225bc 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -178,6 +178,11 @@ static int init_platform_device(struct device *dev)
 		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
 		sema_init(&sock->hsmp_sem, 1);
 
+		if (!is_client_platform()) {
+			init_read_enabled_msg_bitmap(sock);
+			init_write_enabled_msg_bitmap(sock);
+		}
+
 		/* Test the hsmp interface on each socket */
 		ret = hsmp_test(i, 0xDEADBEEF);
 		if (ret) {
@@ -193,16 +198,26 @@ static int init_platform_device(struct device *dev)
 			return ret;
 		}
 
+		if (!is_client_platform()) {
+			ret = hsmp_populate_msg_bitmaps(i);
+			if (ret) {
+				dev_err(dev, "Failed to get enabled HSMP messages on this platform\n");
+				return ret;
+			}
+		}
+
 		if (sock->proto_ver == HSMP_PROTO_VER6) {
 			ret = hsmp_get_tbl_dram_base(i);
 			if (ret)
 				dev_info(dev, "Failed to init metric table\n");
 		}
 
-		/* Register with hwmon interface for reporting power */
-		ret = hsmp_create_sensor(dev, i);
-		if (ret)
-			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+		/* Skip hwmon registration on client platforms */
+		if (!is_client_platform()) {
+			ret = hsmp_create_sensor(dev, i);
+			if (ret)
+				dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+		}
 	}
 
 	return 0;
-- 
2.34.1

