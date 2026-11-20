Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795197163;
	b=UcUA1+yjaNASvTJVQ5cymMGFoscvOWSwzMajvxHnO1x9Furx6OPYM81Aak8E944n22gl
	 Pdp0PuPhy7QxP+Euf21vIcnIgvjBcgTYFPhq6TYft1t7CqPWFQGLpY7UGIfUy/g/hy4+f
	 4pyoxGnrm2Gk4VV/Ku/IhpeWGMFxX+qwl+NUcfvoH0hJc+GrDU8HZ1TdL0sFDrDqCpp1N
	 9BBmrM1iWuwISQ82CShSv7ldQBZdZe870u/Sz0euXE+SpQXcVHhykhiCUXQ1TeK7QXCri
	 qOllnQiCzlS/0RzjMBJiQJFd5v2JQvJ6fxO2o+H7rTHXN6Ml+v3Oeoj7+QmZ3liA+ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197163;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:X-Originating-IP:
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
	bh=VkAxFaK0rEyfxoM2PYJn5im1fxj92QmEq4D5jpjQK2c=;
	b=fv3UuwNrx6KjH+3W9zLPAP8Rl+5rW//HldM9jj/ggBlPvXfJsZ/hqxG7Stwd/aNLsDZx
	 GrlSKMQL6vTmZPlQPwryTVIEqU3bt9SdHIGoRKQhswH1NYFP8twwoharmwG3pDXjHTvwK
	 c3cSA6BtZwcfHg2Unk6lZwuO9Y1VJk8tWwKM+iIXwWdAO+Fy9mIgyV1jSq2Ml+w9Jdha6
	 s/JJg5ZZYa3lwWzRF02/M3Fj3lL/A71WYEoEZiPMTuE74VNWupgPihOq6RWEvTIRTILrx
	 SvMx6rE3hIu3UnUAe1xnRVU/zw11pHpI34cj4kvEnTKw/kuVCag3gDII9q1yuvt1GXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="o4GBMB/q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.36
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013036.outbound.protection.outlook.com [40.93.201.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73A8606A32A;
	Fri, 20 Nov 2026 17:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C73A8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o4GBMB/q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bD07Qrbqm2zd5OjNganVpDJVG+ouwmdcFXhFVe2D6naR/fJW+nrfeP7j64+d4H2Uahef/HzxQkC3kLBhJuOBhFGyqcUmnPglk/SXpxd+k/fkenJbjRlaU6LhGG9t9rAqN6sM3GTsfHBnNiDRVXStJtrwMwy5LFRjDZkd1kHPqYx4jNFyfpt85fSCqsN6yNBRAIunKDb29dBldov38chrC/VjElqhBzfqjILY+CaXHNqB2MLWynAEiDDuP1Dd3fTtFdgCRxTFwGJzEbWko5BLvWtcJJABjorxPqqjJFmBCeKXI2fQ6jp2QjduwxNCeD4395p9zMCzCWeramWd63NSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkAxFaK0rEyfxoM2PYJn5im1fxj92QmEq4D5jpjQK2c=;
 b=n9xgonYLLff4TULDq84/of6X5ovkeO7j/03uOyPqV6b5WRl++0fH2eX70/jqUHa0tBL9pN9NUkfVSW5H2l5twkc6GXAJ3oMSKi9JHD5+Dg0g6A8Ml4JrI80G3yEZthVKdQP0A1mFQ+EPfqjIxeuOmFXibmOL9ed54fJvDHBvYV5lD0E0muLOeQwrTRgNx0rgT9XiQu+9SYktv2t8osyRUO61vMYMcQlNnDKUwPdGj2Rcke5nRDc0SmI9+y4ePsWtInuF9zTzkUiQogOYb/HNzWI9gxiPHpFbW0NKR+wFBxlnd/g+UDZDatGjKfX90w11bv5bE7sXFndzcN5nn6M5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkAxFaK0rEyfxoM2PYJn5im1fxj92QmEq4D5jpjQK2c=;
 b=o4GBMB/qizHY8a5Iek6DeAvBASyzPdxCC2jCkk1PpJczcdcHaOoZ2x+rSjjAQlVqfUb6JAAV+HNHxB0qQjt9uqpsuvnQ3rk7RuWMa6BH0TICW+9YyULpQ4t6csHtuvUDx2HBmqKvrI/4rGWchziYdgTzSopRxD/qgUGFJNsIQyI=
Received: from CY5PR22CA0071.namprd22.prod.outlook.com (2603:10b6:930:80::16)
 by PH7PR12MB6739.namprd12.prod.outlook.com (2603:10b6:510:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:52:36 +0000
Received: from PH3PEPF0005961A.namprd05.prod.outlook.com
 (2603:10b6:930:80:cafe::2b) by CY5PR22CA0071.outlook.office365.com
 (2603:10b6:930:80::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 17:52:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961A.mail.protection.outlook.com (10.167.243.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 17:52:33 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 11:52:31 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Fri, 20 Nov 2026 11:52:25 -0600
Subject: [PATCH v3 2/2] platform/x86/amd: send WBRF DSM payload as buffer
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261120-superm1-wbrf-v3-2-f6c872816dbb@amd.com>
References: <20261120-superm1-wbrf-v3-0-f6c872816dbb@amd.com>
In-Reply-To: <20261120-superm1-wbrf-v3-0-f6c872816dbb@amd.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>
CC: Hans de Goede <hansg@kernel.org>, Ma Jun <Jun.Ma2@amd.com>, Evan Quan
	<quanliangl@hotmail.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mario Limonciello <superm1@kernel.org>
X-Mailer: b4 0.15.1
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961A:EE_|PH7PR12MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6780d4-9af6-4b29-bf3c-08df472f0dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|32650700020|23010399003|6133799003|18002099003|22082099003|261009223027099003|261028144727099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003|56012099006|10067099003|261102130727099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	uQpM3lujbmwOnvG0TFEEh0ACGr9S9FplqnuGdGL3eGOi6FDhrJgRxO1Ldn9X6Hr+eKrPjWwR1Wn/GnnS94ZfbiqKurwIJMAvHbd3GI7szmTtKaZGJGsmycldM1u9TyPklKiC8GpAMHjnTra+27fMPbPFdYmG275guCBbA0Fo4QLqcgJjIi/9aFEujCr4TMVBb+ugpWqRvFkwA879ywidpDAI4MJazOVetUImwHMTLErvjpQtrWvNv8IlvBvPqjIT1RFAWtWIUMc9uVvAePbWYcyT/V2ec0E5ukcijeGqcorxNnqthw/a0gjfpIgub5qNuYXvo0V6h8k/i2QcMJ6Ae3Wr/ullODXwNrQZvL21cwA0YQ6xtOxmfvk2YLN6kB7IMzKXpx6lBY39CwB6aj2ShRhl818k7RggvTDqx5QamenS8wFs3BmM6OR2LG9+NjhKkoxaQRJ9FDtJK5/Gk/Dr5XmKgbgNE9T7hm4LGssYMux46NiKt8fZn1SCPatUKLA004ubtysbwhj0QLPDJA6jbKLJfylc1d2xRsxn1UdXjIoQLiesJLnIm2HyImmpJ2Fsjt3yKWlI9KkWLWVnqvUnsaT8nxZv5tiTqQElcmCDo0iI19Hj6pi9uGU8URuSWxH62K9zgexdl9JHkK1DuFi+GjckZXo1TIr1u7+oGV6Xv/nQpTlgegR3q3hihn2JRKpvnrHkIW5EHadD5UaWE7xSZg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(32650700020)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(56012099006)(10067099003)(261102130727099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6NSN8TEWLJniw4gpk7JkbrID/RIy6+IftUY6gGQte31YJRyrQE9KtgqXF9W3AKWRfON4aoZh1hoXa2evlipTpRYjsWPnJFbOeB9sNvj3fcnX1Xgp9azZPLXdm0VBLTQdo20p7sjMWXmmYzOTYi7fXV17Z+D44tvfVlVX0hjBaP179SRuYh0eBYxxZS8or4sMrc5Y8hV5ZmArtsxBvR84yPugfaRkAm2J2p1pRY7RPIt2yFK4NBoCP5Hz2jPrKY1F6fwfu9GKiKhwB/tzBHCte+2xkR19zv1evJ2BD3jR96c51W582PrxHbBtqlUPsJlTklahVd9A1s0W9aDIS7CxZf623pHXnQtvWPL0r0AiU43hx5zZSajruglM53eZSixe08Alo5D7MJYcdqUQxrsoxRrp7KMYWEUGSv5W1307cSl4XSaDts16YFLf2cFI22Sk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:52:33.2621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6780d4-9af6-4b29-bf3c-08df472f0dff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6739

From: Mario Limonciello <superm1@kernel.org>

Spec defines the WBRF record _DSM argument as a single buffer that packs
the header and frequency ranges. The driver instead built a package of
integers, so firmware on some systems abort \WBRF with AE_AML_OPERAND_TYPE
when dereferencing Arg2[0].

Encode the payload into a little-endian buffer and hand it as the lone
package element.

Fixes: 58e82a62669d ("platform/x86/amd: Add support for AMD ACPI based Wifi band RFI mitigation feature")
Signed-off-by: Mario Limonciello <superm1@kernel.org>
---
 drivers/platform/x86/amd/wbrf.c | 62 ++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/amd/wbrf.c b/drivers/platform/x86/amd/wbrf.c
index e3795f8a9ad84..191eb5d30083c 100644
--- a/drivers/platform/x86/amd/wbrf.c
+++ b/drivers/platform/x86/amd/wbrf.c
@@ -13,11 +13,14 @@
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/notifier.h>
+#include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/uuid.h>
 
+#include <asm/byteorder.h>
+
 /*
  * Functions bit vector for WBRF method
  *
@@ -40,6 +43,17 @@ struct amd_wbrf_ranges_out {
 	struct freq_band_range	band_list[MAX_NUM_OF_WBRF_RANGES];
 } __packed;
 
+struct wbrf_record_entry {
+	__le64		start;
+	__le64		end;
+};
+
+struct wbrf_record_payload {
+	__le32			num_of_ranges;
+	__le32			action;
+	struct wbrf_record_entry	ranges[];
+};
+
 static const guid_t wifi_acpi_dsm_guid =
 	GUID_INIT(0x7b7656cf, 0xdc3d, 0x4c1c,
 		  0x83, 0xe9, 0x66, 0xe7, 0x21, 0xde, 0x30, 0x70);
@@ -53,8 +67,9 @@ static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
 static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ranges_in_out *in)
 {
 	union acpi_object argv4;
+	union acpi_object args[1];
 	u32 num_of_ranges = 0;
-	u32 num_of_elements;
+	size_t payload_len;
 	u32 arg_idx = 0;
 	int ret;
 	u32 i;
@@ -75,42 +90,33 @@ static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ran
 	if (num_of_ranges != in->num_of_ranges)
 		return -EINVAL;
 
-	/*
-	 * Every input frequency band comes with two end points(start/end)
-	 * and each is accounted as an element. Meanwhile the range count
-	 * and action type are accounted as an element each.
-	 * So, the total element count = 2 * num_of_ranges + 1 + 1.
-	 */
-	num_of_elements = 2 * num_of_ranges + 2;
-
-	union acpi_object *tmp __free(kfree) = kzalloc_objs(*tmp,
-							    num_of_elements);
-	if (!tmp)
+	payload_len = struct_size_t(struct wbrf_record_payload, ranges, num_of_ranges);
+	struct wbrf_record_payload *payload __free(kfree) =
+		kzalloc(payload_len, GFP_KERNEL);
+	if (!payload)
 		return -ENOMEM;
 
-	argv4.package.type = ACPI_TYPE_PACKAGE;
-	argv4.package.count = num_of_elements;
-	argv4.package.elements = tmp;
-
-	/* save the number of ranges*/
-	tmp[0].integer.type = ACPI_TYPE_INTEGER;
-	tmp[0].integer.value = num_of_ranges;
-
-	/* save the action(WBRF_RECORD_ADD/REMOVE/RETRIEVE) */
-	tmp[1].integer.type = ACPI_TYPE_INTEGER;
-	tmp[1].integer.value = action;
+	payload->num_of_ranges = cpu_to_le32(num_of_ranges);
+	payload->action = cpu_to_le32(action);
 
-	arg_idx = 2;
+	arg_idx = 0;
 	for (i = 0; i < ARRAY_SIZE(in->band_list); i++) {
 		if (!in->band_list[i].start || !in->band_list[i].end)
 			continue;
 
-		tmp[arg_idx].integer.type = ACPI_TYPE_INTEGER;
-		tmp[arg_idx++].integer.value = in->band_list[i].start;
-		tmp[arg_idx].integer.type = ACPI_TYPE_INTEGER;
-		tmp[arg_idx++].integer.value = in->band_list[i].end;
+		payload->ranges[arg_idx].start = cpu_to_le64(in->band_list[i].start);
+		payload->ranges[arg_idx].end = cpu_to_le64(in->band_list[i].end);
+		arg_idx++;
 	}
 
+	argv4.package.type = ACPI_TYPE_PACKAGE;
+	argv4.package.count = ARRAY_SIZE(args);
+	argv4.package.elements = args;
+
+	args[0].type = ACPI_TYPE_BUFFER;
+	args[0].buffer.length = payload_len;
+	args[0].buffer.pointer = (u8 *)payload;
+
 	union acpi_object *obj __free(kfree) =
 		acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
 				  WBRF_REVISION, WBRF_RECORD, &argv4);

-- 
2.43.0

