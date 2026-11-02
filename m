Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627121;
	b=Q3tLXkFmA1EXgJ9F4+JSEbFET8nH7GDiaqI1qyEgdeelfdMaGP3tHmNo4NDrAP6Enn2F
	 +/O5OJI2HK/iGTK928qYNktYoE5U9dKkNnIMr0wwKMYmggNERYgZdjT/Gpbzpyfmr2+Cf
	 ALPwM8OplMWXapdEAZGA4/3iY6Qf/WNEEJ1buQMQ798cyYkCmYE5gs/tTfdJVURH8BYhQ
	 G8wv2erGFvbIYSt+T0PCk3DirEWtYgNCVHXOtGnN5N0ZM8ChacRqc15R+puAPmX3ZYDOh
	 oQAWilrpQ44cK2eV7OBG3O7Ireo+M9tH0asoA5KC7v263HH2mDH36ebDg75YaJXX+sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627121;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=Wut76wPja3rY5EWLAZxeKXN2J3+NXIjzQxTslbLv4o0=;
	b=eJ1kjhCl/Q2vzKyRpj1VeEJp34gtDsWNf3fN/UHlwmj04eH+D+GAsijlrIE5LViLaC5A
	 FNi68GALvFcEI2URf3NCzFjtBx2G5IvC7S/SqhJYq37vtoQaVvOSk4sGFwuyW9purGZCU
	 d0axcgr09LWNDNgwBHxSTd6uLvI72RmlH6tq4elna8d4/VrVe/2DEu7E4MUU2UvHZ0I6M
	 l97BxQuVtb+iIBzyUwfZif16EiJ7ZUBLUQJ2JH6O9qkdcwhYt9CnyUcjF2LB73kzNRZFh
	 sjjNgw1qfvDhICTHF9Ua2w60ruyhtbKF7/x+NzWkL8oSRDWBZgIAtqlACh/fwG1DzYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D28xE5KX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E1606A324;
	Mon,  2 Nov 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D28xE5KX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747141F00A16;
	Mon,  2 Nov 2026 13:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627121;
	bh=Wut76wPja3rY5EWLAZxeKXN2J3+NXIjzQxTslbLv4o0=;
	h=From:Date:Subject:To:Cc;
	b=D28xE5KXK4V631GRrikMLEzqr6bgOq/oNKxxAixwd0UE2KooYO6UC/KpL/fQs/DCj
	 Cz4od4SKeRUkJy7isi8RWZjD+mMA/MHzLgdhHo325pqMzf0n40mizGt7MC1PCLGwt2
	 eHkq6X5xLJxOODYhiRoP9n+nKxDIcIClsrqLKrzS7MV6f+z/ayUR/l0Ijf9jtmrDNo
	 iOwq1lkRDifUCYdSmB6el+zwKXhioKlRKuKDvLDJTGRe2YwFiuJ4hYsmQIBDWdy0zx
	 j6wznKjL/9KEAvG/gzg6f+TXxNffp5GpGnSyMlfwpnliY+oAq5o+b9lJYPDk/52o24
	 nxb909qVYpZjA==
From: Mario Limonciello <superm1@kernel.org>
Date: Mon, 02 Nov 2026 07:45:12 -0600
Subject: [PATCH] platform/x86/amd: send WBRF DSM payload as buffer
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
Message-Id: <20261102-superm1-wbrf-v1-1-b58d8d85277c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNL3eLSgtSiXEPd8qSiNN0USxMDU4NEIwsjQyMloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAXRmSS3AAAAA=
X-Change-ID: 20261029-superm1-wbrf-d94050a28212
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hansg@kernel.org>, Ma Jun <Jun.Ma2@amd.com>, 
 Evan Quan <quanliangl@hotmail.com>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mario Limonciello <superm1@kernel.org>
X-Mailer: b4 0.16.0

Spec defines the WBRF record _DSM argument as a single buffer that packs
the header and frequency ranges. The driver instead built a package of
integers, so firmware on some systems abort \WBRF with AE_AML_OPERAND_TYPE
when dereferencing Arg2[0].

Encode the payload into a little-endian buffer and hand it as the lone
package element.

Fixes: 58e82a62669d ("platform/x86/amd: Add support for AMD ACPI based Wifi band RFI mitigation feature")
Signed-off-by: Mario Limonciello <superm1@kernel.org>
---
 drivers/platform/x86/amd/wbrf.c | 75 +++++++++++++++++++++++------------------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/amd/wbrf.c b/drivers/platform/x86/amd/wbrf.c
index 3281357185d1f..80088b755aa58 100644
--- a/drivers/platform/x86/amd/wbrf.c
+++ b/drivers/platform/x86/amd/wbrf.c
@@ -6,6 +6,8 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_amd_wbrf.h>
+#include <asm/byteorder.h>
+#include <linux/slab.h>
 
 /*
  * Functions bit vector for WBRF method
@@ -29,6 +31,17 @@ struct amd_wbrf_ranges_out {
 	struct freq_band_range	band_list[MAX_NUM_OF_WBRF_RANGES];
 } __packed;
 
+struct wbrf_record_entry {
+	__le64		start;
+	__le64		end;
+} __packed;
+
+struct wbrf_record_payload {
+	__le32			num_of_ranges;
+	__le32			action;
+	struct wbrf_record_entry	ranges[];
+} __packed;
+
 static const guid_t wifi_acpi_dsm_guid =
 	GUID_INIT(0x7b7656cf, 0xdc3d, 0x4c1c,
 		  0x83, 0xe9, 0x66, 0xe7, 0x21, 0xde, 0x30, 0x70);
@@ -41,9 +54,11 @@ static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
 
 static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ranges_in_out *in)
 {
+	struct wbrf_record_payload *payload __free(kfree) = NULL;
 	union acpi_object argv4;
+	union acpi_object args[1];
 	u32 num_of_ranges = 0;
-	u32 num_of_elements;
+	size_t payload_len;
 	u32 arg_idx = 0;
 	int ret;
 	u32 i;
@@ -64,45 +79,38 @@ static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ran
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
+	payload_len = sizeof(*payload) + num_of_ranges * sizeof(payload->ranges[0]);
+	payload = kzalloc(payload_len, GFP_KERNEL);
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
-		acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
-				  WBRF_REVISION, WBRF_RECORD, &argv4);
+		acpi_evaluate_dsm(adev->handle,
+				  &wifi_acpi_dsm_guid,
+				  WBRF_REVISION,
+				  WBRF_RECORD,
+				  &argv4);
 
 	if (!obj)
 		return -EINVAL;
@@ -236,8 +244,11 @@ int amd_wbrf_retrieve_freq_band(struct device *dev, struct wbrf_ranges_in_out *o
 	param.string.length = 0;
 	param.string.pointer = NULL;
 
-	obj = acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
-							WBRF_REVISION, WBRF_RETRIEVE, &param);
+	obj = acpi_evaluate_dsm(adev->handle,
+				&wifi_acpi_dsm_guid,
+				WBRF_REVISION,
+				WBRF_RETRIEVE,
+				&param);
 	if (!obj)
 		return -EINVAL;
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261029-superm1-wbrf-d94050a28212

Best regards,
--  
Mario Limonciello <superm1@kernel.org>

