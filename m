Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422306;
	b=KhdEQawTXDq1/jr2GxLCOPytCXnP/yimIhgsACoVkMPeQIkXZO0GBqoZnXE8UPXcJkJQ
	 xs5y25WyEDdYE5dRCHUARLrjvWCcf670LN98ey9hMlL6dcvn47zwKZsTNT25jFQx4qFX9
	 8ds6DLkTQcFYdE/nAvsE5JllcFa3eXHH65F7dA6JXAIocBECh9k0dvhSQRGiKjjCNyGpL
	 GPpGx5QdJb7vwxsb51GVmjQX9gRGLX5s0hHVz7Q2O8YeBdVldoETM+2JAHx9JvV3IMPh+
	 oPq9mSO8ojDt0LQ5dHmmx68pwflCsiSnPUDE2nDBXX2EsGcfTg4NELeTok5mb0m+4Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422306;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=FnTa9xUrHpkEZLnF/C/Uhf2QRS6M/PPDbqmx71vQSBI=;
	b=NqfUrgSz0VquD2LChGZ56DgRUUw2aVYqvjmuHMIN1XR4hAmOo0aSjZnQFKOymKoQoU9S
	 /K8OSkWCFLEwSLdWRPlaccFXqZAIRbwRp+nO/y+Y4/FMb/mp4/cvoLCQ+2Y4biAEgizBX
	 zPvzMPsV10eAyux8MrV+tzev7ixV2jV1zGk+MA0ICTJD+w2RwT5+vWbkHDcB8HqU+Tk5V
	 JaE6E1ioJV9Dvd06syG6YyIBaQuBDKxRg3mcsS46jOofCCFYbeBdEfgEBCI8Djr1yMxnd
	 PBAomFK/gk23S9O2Cqv0UAvNqb4CTl+Cv8H3ydCYVLUhNGKRfG639i6ncd1yz19zwSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=OazP6l3+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B4B607F4BB;
	Mon, 19 Oct 2026 15:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46B4B607F4BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=OazP6l3+
ARC-Seal: i=1; a=rsa-sha256; t=1792422221; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OWTvOStEtrydX6runmwaOj72222u12oXwLH748Vd7xkQWzwq8JV1Jjhh4GWVl8diUm91f55aUsvzoF8yR9iGj+pFKeixzAkYnXtZus6rw5ywt56ishZeYuU2XMbsCRDAwdqOW2RqiaRff2ZklD3r7IqZrgr0POFKQx/XTVJwo+o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792422221; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FnTa9xUrHpkEZLnF/C/Uhf2QRS6M/PPDbqmx71vQSBI=; 
	b=gnuqSx8srvGv02rdgDybrUGhxhSsCSsGv06aIsJpMyXtEHXWrp+6vk45RiW+k9QaMPsU3U1oEgR47lli5Y0BM1DVXmxAp7cUs1prPm4MDwXECCECdcdtzpr7qfKtTzs5kGsfy5Ufvt78IdFmOS2fl9cfdIYgFuTYMByhc61CSgU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792422221;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FnTa9xUrHpkEZLnF/C/Uhf2QRS6M/PPDbqmx71vQSBI=;
	b=OazP6l3+l5WRNO5R7EPj3+A2Lrau6F/20Kb9mBtZORCLr4WN7rmnmypnQovJCeSQ
	HqlRCQsaTyZGqvcBZH6kSMoOpnPgoft7vz6bfZbS4m3YVLz8fPooZQPcYmrVfB+Y9RF
	UdAN8FfxFQQ4Y5CNz1BRgxpyatU355ckn134e63todQXl5PjXOr/7QfY7GxPB8QfeJj
	KR/X0Kg+P6QDbsJdotLo4V3HkxeqzruB/ZpADgCxUVPkJBKUjbJi47nk+gHPazPSYlP
	fr7ekizoUPP+b62G4rxvAkmQuiKTnTW9Ye3F3XpAwxLEf11D60dj/Zp9qQYIMPOXuRV
	PT8S7LBtHw==
Received: by smtp.zohomail.com with SMTPS id 1792422215333737.0129824035191;
	Mon, 19 Oct 2026 08:03:35 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 19 Oct 2026 23:02:33 +0800
Subject: [PATCH v5 11/12] platform/x86: lenovo-wmi-helpers: Adopt new WMI
 API
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
Message-Id: <20261019-lwmi-wmi-new-api-v5-11-71557d28d058@rong.moe>
References: <20261019-lwmi-wmi-new-api-v5-0-71557d28d058@rong.moe>
In-Reply-To: <20261019-lwmi-wmi-new-api-v5-0-71557d28d058@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-6be7c
X-ZohoMailClient: External

The new WMI API supports multiple ACPI types by converting them into a
unified buffer that satisfies alignment and size requirements.

Adopt it to make our life easier.

Note that the Windows WMI-ACPI driver converts all ACPI objects into a
common buffer format, so adopting the new API intentionally accepts more
ACPI types as a followup of commit 465dc9da8ff6 ("platform/x86:
lenovo-wmi-helpers: Convert returned buffer into u32").

Suggested-by: Armin Wolf <W_Armin@gmx.de>
Link: https://lore.kernel.org/r/f1787927-b655-4321-b9d9-bc12353c72db@gmx.de/
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 61 ++++++++++++-------------------
 1 file changed, 23 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 8f5766c391eb..687caa226263 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -24,9 +24,10 @@
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
-#include <linux/unaligned.h>
 #include <linux/wmi.h>
 
+#include <asm/byteorder.h>
+
 #include "wmi-helpers.h"
 
 /* Thermal mode notifier chain. */
@@ -42,49 +43,33 @@ static BLOCKING_NOTIFIER_HEAD(tm_chain_head);
  * @size: Length of the buffer.
  * @retval: Pointer for the return value to be assigned.
  *
- * Calls wmidev_evaluate_method for Lenovo WMI devices that return an ACPI
- * integer. Validates the return value type and assigns the value to the
- * retval pointer.
+ * Calls the specified WMI method for Lenovo WMI devices that return a WMI
+ * integer. Validates the return value and assigns it to @retval when it's not
+ * NULL, otherwise the return value is not validated.
  *
  * Return: 0 on success, or an error code.
  */
 int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 			  unsigned char *buf, size_t size, u32 *retval)
 {
-	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-	struct acpi_buffer input = { size, buf };
-	acpi_status status;
-
-	status = wmidev_evaluate_method(wdev, instance, method_id, &input,
-					&output);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	union acpi_object *ret_obj __free(kfree) = output.pointer;
-
-	if (retval) {
-		if (!ret_obj)
-			return -ENODATA;
-
-		switch (ret_obj->type) {
-		/*
-		 * The ACPI method may simply return a buffer when a u32
-		 * is expected. This is valid on Windows as its WMI-ACPI
-		 * driver converts everything to a common buffer.
-		 */
-		case ACPI_TYPE_BUFFER:
-			if (ret_obj->buffer.length < sizeof(u32))
-				return -ENXIO;
-
-			*retval = get_unaligned_le32(ret_obj->buffer.pointer);
-			return 0;
-		case ACPI_TYPE_INTEGER:
-			*retval = (u32)ret_obj->integer.value;
-			return 0;
-		default:
-			return -ENXIO;
-		}
-	}
+	struct wmi_buffer input = {
+		.length = size,
+		.data = buf,
+	};
+	struct wmi_buffer output;
+	int ret;
+
+	if (!retval)
+		return wmidev_invoke_procedure(wdev, instance, method_id, &input);
+
+	ret = wmidev_invoke_method(wdev, instance, method_id, &input,
+				   &output, sizeof(__le32));
+	if (ret)
+		return ret;
+
+	__le32 *valp __free(kfree) = output.data;
+
+	*retval = le32_to_cpu(*valp);
 
 	return 0;
 };

-- 
2.55.0

