Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E56A486BB2
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451848; cv=fail; b=OUKyaxwNDwphEiR3f5Dmlkr2U2pWD5fWOx0CJ7jUgDupdH0LM/Fi6LP5JPXoyqmYKes+5trFTpfnMFeSj7pKdWdigtoJhtSror2BB7D01MujbdNDeraajFghuA1nqnl34Heec6/0ycA6kj5zM1Nd1DpMPVQ3sOxZXigmTT9cZhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451848; c=relaxed/simple;
	bh=tZqc05JHmjyKBJwbQvu2FJYkm4/GieldIlCHqzDVQBg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y5Xk366p2ljyz2n5ZtEXhGZVUdzwrKMUQ7zd7EPeapDkbg0kI7EfF5eiqk0hsvHBZTrpIZrpqtyPZ447GiLX3rF2FxaAmbNSrUCJiOnt7rOhmOyjzRBz1EyALIPEutSMDuNbG/sOMhzsBWG+Xt6WCkL5LmouQB/qDPpVAFp1uaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JzCUgcG8; arc=fail smtp.client-ip=52.101.52.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JzCUgcG8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mklNUytTBY5JsNmLj6PbAjb30LDvyhfh5Ytx+3Y4/KHEhUatqPKjT1ktv4j3+dljQ8O8VfInWJaOqvSAPpBJM9bW/nRYzaD5X+rZklkNjBfPhHGUGqciuT20rKm9x2qKAM9fYjVgi+wCJVJdHEInf2CRTV5uSGJNbBFDVO6dT24zcGLBHIA/4mP1ILu1Q+PfYFasQ3b+ghHR0bttGGGn8W+EMcDISrpX14zJ9cHdS6ACrmFrpNsDIyLjb2E8kAQNATQjHNvu4XKrtrs3miXnMt7tVXZ+qVMakVfDqB/rs9iKVZxReeivUxesYGeKstXtrvZQNmpX1Qdk0DDpFOvjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsNXc2P8lui3E1Q4HpX63QE7VZhHnZBR7S0Jl9SSZUs=;
 b=kG023neZw+cYw55nooe4AcD+00VO+ecsHBLlVp68065l4W92mccashqhBDVGRNhfJcZl+QuZEw+u9HLTIr627Ax4vUgYzwbtQgcJ7wG581gB6qwxZjLaMnR7zT6mQFl4pI7dC7uuwotB9QI9Fd1kUVh8YHF8aDG6bWqNRkaIS0/KDQBPa+dMrojXVpFJrU62/wLLXZ1chAiFLDSeWwvxn2AcbelIeh/ysKsWztSRA+1Itfz/Eq+OZOrn6UGcGV+zqc9aFqHacTIV6Nd9rWJHnwVQpJst5/EOcNRx0o0acKjmnFgYqJnkrSf62gzyZ9z6TikV3hp+FgA0Z2MpXR9YlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsNXc2P8lui3E1Q4HpX63QE7VZhHnZBR7S0Jl9SSZUs=;
 b=JzCUgcG8L6xAtGjQqRUR+a2g92irIPwE+hvAXcTnnZWQ+/OxfYp5kSz5SZYkWMW4jVEC8YxDug+vn0qZg+sfI1jHBn5mcby04JpB8mzvXwtttgqrrRo/YvEqisoN91VvJgunUZc/YPewUZ2foLbvqHOEN7aDatWRew7bkoMbaTM=
Received: from BL1PR13CA0155.namprd13.prod.outlook.com (2603:10b6:208:2bd::10)
 by CH3PR12MB7764.namprd12.prod.outlook.com (2603:10b6:610:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 8 Oct
 2026 09:30:28 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::88) by BL1PR13CA0155.outlook.office365.com
 (2603:10b6:208:2bd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 8
 Oct 2026 09:30:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:20 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:30:13 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Dhruv Gupta <dhruv.gupta@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 07/11] platform/x86/amd/hsmp: Add per-platform bitmap to validate HSMP messages
Date: Thu, 8 Oct 2026 09:29:35 +0000
Message-ID: <497f394990dab5c089950a6ec83c70a512a5fab3.1791446401.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791446401.git.Suma.Hegde@amd.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|CH3PR12MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ff9dab-45c9-4e21-13cd-08df251ec598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|11063799006|10067099003|3023799007|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DK84F7pUPht1SNWcrwE1cShfzli1gIp/FskZ/gFxW4QHnfUqKbpC5dDwMqK1u4i5lWPlStsUqrNIf/ee1E5wdkNvUjr1bJYwnJRVp0xekYabzkUtsrzQqZPHRCATo/G59u2WCIlD33K7FTqM3dJor2RQi10r+TD4JPjg5Dd9gOfa/P+shGOgnamvS+Fkll6A9847Kc/XD4YDehZwwQ+Ogx9eCxLWY/HlnhNgboDlgcfjGp6nznfGJFhq+JDTlqzvL2AurvdBVQfWbys+P7u1V8l9Nym+2RWkZoogv6+kAlJWvQqvg0HGx36RgDuCBN9+dHQdrZ3sbnxgS+vzrzHExYBGKzOJ5e1gZvQanGHqLgS0r0RQCnu0aod/aybie72LhQKAP1btMtj43XzTmGlAC4lmlShdlZV7AiqkojagGoxz+r/l6o2oAu3gWv3W1Mk4BXNRoM/6qRmNesGO0ksWuciPxTxti90SpGBsWht5mXywDD0LQmcGkXOy8ThEu2MUgkJxhLEUNtNvSpE5AYZpqBy1bavSfmDrXPCIXCWW98zPyesZaTN89TvIaw606poRQd8058i70a76T1ifKSzaLIejeb+Y/wgwrDll6hOQSWTwFVqhfnTStIdUzoMB5PkNUQsQjx7qT/IlJW1b4p++3W2DAbMh3OBLtbqN0W8uXHcsQ+35/g3ndue4C8K+oy5jTlCYZ741HGBtXhkG/OD+QQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(11063799006)(10067099003)(3023799007)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rS8lVKZGkPqKPb9CBKR3bI104yWsyCrIRcVHwnpW6uBFmWUQZKIVHNjmdm0AMzkX/TsD4JBz46XP4he8WN4w413hNRopapmSb/Vwr7+pYmx0yLYsD31P0akAsFCm5C9EFml4qVeyUX8utf8e03mrY9uL3EM3MOSX6byqo+dXw4M3qJxy3+3B4wpOgC+o3blJ/7OKmBaB9CC8jgf7mc4bDtsenJBi2UU5ACIt5gpdr5eS24j8S6YqoWn3B2/+nIMCO6KdQWbZfPfoiz/pJekAvPZ4QONm3DFyRTkMnpQp7hItH2UdYre5aY1ZDPQNxpGGDxIsKj+t6eWnbcjZkkQ4GihOziKXb9nKFGA4Gsp4yl76BhcrgVTufFEc4aUYDH+FLb6ZprJbGv3EFT6ek6RJXgYJF6b8lzKQeDf7L1Iq5+UHZEj5w7dazut7NAm4U3on
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:20.3796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ff9dab-45c9-4e21-13cd-08df251ec598
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7764

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

Co-developed-by: Dhruv Gupta <dhruv.gupta@amd.com>
Signed-off-by: Dhruv Gupta <dhruv.gupta@amd.com>
Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 13 ++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 94 ++++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h | 27 ++++++++
 drivers/platform/x86/amd/hsmp/plat.c | 13 ++++
 4 files changed, 147 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index b6f54e8b91663..0d3b324fe2244 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -566,6 +566,11 @@ static int init_acpi(struct device *dev)
 
 	sock = &hsmp_pdev->sock[sock_ind];
 
+	if (!is_client_platform()) {
+		init_read_enabled_msg_bitmap(sock);
+		init_write_enabled_msg_bitmap(sock);
+	}
+
 	/* Test the hsmp interface */
 	ret = hsmp_test(sock_ind, 0xDEADBEEF);
 	if (ret) {
@@ -581,6 +586,14 @@ static int init_acpi(struct device *dev)
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
 	if ((is_client_platform() &&
 	     sock->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
 	    (!is_client_platform() &&
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 8dc1fc75bd9ba..89528632c9532 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -11,6 +11,7 @@
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
+#include <linux/bitmap.h>
 #include <linux/build_bug.h>
 #include <linux/cleanup.h>
 #include <linux/compiler.h>
@@ -285,6 +286,8 @@ static int validate_message(struct hsmp_message *msg)
 {
 	const struct hsmp_plat_desc *plat_desc = hsmp_desc();
 	const struct hsmp_msg_desc *desc;
+	struct hsmp_socket *sock;
+	unsigned int sock_ind;
 
 	if (!plat_desc->msg_desc) {
 		/*
@@ -294,6 +297,9 @@ static int validate_message(struct hsmp_message *msg)
 		 * supports in each direction and leave msg_id correctness,
 		 * such as an unsupported or out-of-range value, to the SMU
 		 * status code __hsmp_send_message() already translates.
+		 *
+		 * Client platforms also have no per-platform enabled-message
+		 * bitmaps yet, so skip that check here.
 		 */
 		if (msg->num_args > HSMP_CLIENT_MAX_MSG_LEN ||
 		    msg->response_sz > HSMP_CLIENT_MAX_MSG_LEN)
@@ -307,6 +313,17 @@ static int validate_message(struct hsmp_message *msg)
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
@@ -822,6 +839,83 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_cache_proto_ver, "AMD_HSMP");
 
+/*
+ * Predefine read and write enabled message bitmaps for use on platforms where
+ * HSMP_GET_ENABLED_HSMP_CMDS (37h) is not available.
+ */
+static const u32 read_bitmap_f19h_m00h_0fh[] = {0x001b8cde, 0x00000000, 0x00000000};
+static const u32 write_bitmap_f19h_m00h_0fh[] = {0x00047320, 0x00000000, 0x00000000};
+
+static const u32 read_bitmap_zen4_variants[] = {0x7fdb8cde, 0x00000000, 0x00000000};
+static const u32 write_bitmap_zen4_variants[] = {0x80047320, 0x00000007, 0x00000000};
+
+static const u32 read_bitmap_f19h_m80h_9fh[] = {0x7e0b8cde, 0x00000038, 0x00000000};
+static const u32 write_bitmap_f19h_m80h_9fh[] = {0x00040320, 0x00000000, 0x00000000};
+
+static const u32 read_bitmap_f1ah_m00h_1fh[] = {0x7fdb8cde, 0x00070182, 0x00000000};
+static const u32 write_bitmap_f1ah_m00h_1fh[] = {0x80047320, 0x000001c6, 0x00000000};
+/*
+ * Family 0x1A model 0x50-0x5f, family 0x1A model 0xC0-0xCF,
+ * family 0x1A model 0x90-0x9B and family 0x1A model 0xA0-0xAB
+ * belong to 6th Gen AMD EPYC Server family.
+ */
+static const u32 read_bitmap_zen6_variants[] = {0x7fdbbcde, 0x05ff07fe, 0x00000000};
+static const u32 write_bitmap_zen6_variants[] = {0x00047320, 0x070007c6, 0x00000000};
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
index 6c850c91a51b1..e67bbdd2b9bee 100644
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
@@ -77,6 +81,8 @@ struct hsmp_socket {
 	struct device *dev;
 	u16 sock_ind;
 	u32 proto_ver;
+	DECLARE_BITMAP(enabled_read_msg_ids, HSMP_MAX_MSGS);
+	DECLARE_BITMAP(enabled_write_msg_ids, HSMP_MAX_MSGS);
 	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
 };
 
@@ -86,7 +92,28 @@ struct hsmp_plat_device {
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
index 40c98d9c66d4f..310a776125961 100644
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
@@ -193,6 +198,14 @@ static int init_platform_device(struct device *dev)
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
-- 
2.34.1

