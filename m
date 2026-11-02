Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653103;
	b=ODYgBFFx1l49JS7mD1zvmxGWIALID2Ce7fQ+JZkGGxnclEiNYqJHNFLCEvBVyXztrrHB
	 eB2YVpx+aSSXSwmfs9PRyVzNz0j7yWSvriux/8SW43JOsKDTP3hP5CtsN63ZoPRFDhBqh
	 jx/Jt+DqOzAvfM7yWjD/WKcx79/kHzR+Y7GnWTjhA0CvbWR60nadb042R2iKKWwEDYRN3
	 PyE0jrpgxzC62kVW1Q8iWfKWZ/gPF26hDlPXwppoOmVW6P3HOahLAQn4rzVp2QwaSrY3Q
	 OY6CuLrjrKi1dFELdKV5AroThXw21dlL+hormpziTZpfhq2hsIzxt+fzrxEFt7QiCZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653103;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=H8CCJNeUjqX/fD9Zuv2hnoBkQYJRETeIY57UcmYbbhU=;
	b=CPEWPlow4dH0ietwWCRJ/rRyoVZylt/wb/L8kYus0UI/XdNiFcm8DO+tH/pirg0iPsXp
	 Ve5eOerd5tzQPqSOgrQorXe1KreX85JPUu4JKTJt9XH5qRDnOydoBci448qEcn89X1aff
	 38MI1Doq7zvt1U47gHP8yfUVUfW0ZQagryI/RwVIICjia+ajmyue8ioSRP1QGNBiqFWTW
	 8eofXu9DPo4GQMpQwP3nSzXQ4O7ZfhQOqll45+t8vAbH4b2sh05FUNwKzo/EFxSguy5kI
	 l+SGJrwyFRBUNBRyHgFj5woxjuvgJ30oELEk1N/7cIHE+K5cYuqXWOBIeAH/0jiD8xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WHDq41xV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02807606A324;
	Mon,  2 Nov 2026 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WHDq41xV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C7B1F00A17;
	Mon,  2 Nov 2026 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793653102;
	bh=H8CCJNeUjqX/fD9Zuv2hnoBkQYJRETeIY57UcmYbbhU=;
	h=From:Date:Subject:To:Cc;
	b=WHDq41xV0Z81XSmj3g9nrz+b3+2JLD8AVaGritCYE3nVq/w0pN3B0t0AoLrLTuBFE
	 m7bXRpBPWpXZGlOnviCqom1T9JpjwpK4n9F/CiNQqcCMDoLZzWTNdGE607O24OM8Be
	 8NtreipsfDcGt+DF8ie59e5sY54ALEOrVGwiFFSlY5xC4r0cVadrGsxKlLWTlIHSP8
	 og/yBDO2bZ1IKsTqirrTlDhEe3dXPbGDpl0wAoHzeAyeb/9Kbl2bqz8EtHRqUnG3Nc
	 mHjGIS2aFRgeQFHHADRvVRJEkVk52jZ3vlr0yFARTsxRbS3eHK3qalcQNRg6p0Yfr+
	 hY398hym/mqIA==
From: Mario Limonciello <superm1@kernel.org>
Date: Mon, 02 Nov 2026 14:58:08 -0600
Subject: [PATCH v2] platform/x86/amd: send WBRF DSM payload as buffer
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
Message-Id: <20261102-superm1-wbrf-v2-1-28b02bb4ce61@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNyw6CMBBFf4XM2pp2IgKu/A/DgscA9UHJFKqG9
 N9tYWXu6iT3nruCJdZk4ZKswOS01WYMgIcEmqEaexK6DQwo8awkFsIuE/FLiXfNnWiLk0xlhTk
 qhDCZmDr92XS3cme71Hdq5uiIjUHb2fB3+3Mq9nZ1cP+rnRJK1GnehqSYZc31QTzS82i4h9J7/
 wOohYSYuwAAAA==
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
Changes in v2:
- Declare payload with __free(kfree) at the kzalloc() site, after input
  validation, instead of initializing it to NULL at the top of
  wbrf_record() (Sashiko)
- Compute payload length with struct_size_t() so it no longer depends on
  payload being declared earlier (Sashiko)
- Link to v1: https://patch.msgid.link/20261102-superm1-wbrf-v1-1-b58d8d85277c@kernel.org
---
 drivers/platform/x86/amd/wbrf.c | 75 +++++++++++++++++++++++------------------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/amd/wbrf.c b/drivers/platform/x86/amd/wbrf.c
index 3281357185d1f..2afb574e4327d 100644
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
@@ -42,8 +55,9 @@ static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
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
@@ -64,45 +78,39 @@ static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ran
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

