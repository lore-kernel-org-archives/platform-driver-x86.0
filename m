Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A192537F8CB;
	Sun, 13 Sep 2026 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332706; cv=pass; b=WmwQq1nVLLmHP+s1iVLR/6HKzkUzujlqsGXTgscPJsjrOUXYqI2QSTUihPQ/pZOfstSUNWd3UET7m/joAgER3KS8tyeU7MG51z+BHM27cC2oS5IZyHlUgQjPnt/wDzriDkBu6XMqtSSJSvQ4P6H+sElFEj6aEc1+41STxg+H2gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332706; c=relaxed/simple;
	bh=ZOeGXeEkAkv34jClDSEtnI3oR0m4n7d53FJjNZiwUI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPFJBCmskk4auzIJr/zVSnuqwonqrlpp2EdZEbhY2Y4t1X6Sq73vjELSh+ElW9iyYaT5hNY8juOyM/YrabfV1aUXYrrlYQltQTxrRzPnV1N9Vv6UDJyTLG9jjCnUFJGIuhVecMXQm+h+dF7SEsIAYqn+gv+Wxx17hVdcqH/EzNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=e68vnmeu; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="e68vnmeu"
ARC-Seal: i=1; a=rsa-sha256; t=1789332652; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JE7X5bBKRDayLIG8Z7EMfZEpKzkIR1nxn+zqoc63gO/R1n/SiphgaMeQUV5zUASCyZg2h/trtn/+n+zq0nSFf70nWE+HlsvP1gtA2bTIh6e+lhnyrLnP2QxGaEHm4Kd4gkfOILOKt7fUb1ATwiz7S03cZ0iiASrdhM59OXbp+Ao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789332652; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HvRz4woefoDbgxNylMP+yqczp1WJkIWrl7x5Gi/BnVw=; 
	b=CCSGJl5akUgRYbEDemGNUQGI3o72Rjy8LRNxUg0s4qYw9MOmQ7vgSk8ceSATVaotfzGbDG6XPTn2Wqy3o1PxEcn318I9CpF8+PsKudq3v0rYeAfYkeMbCS7jHb1yw7k8lFPjQqPQLVbg2xIaga9AQ6VrAP8ZV8ERk/S4K0Vk/+U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789332652;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=HvRz4woefoDbgxNylMP+yqczp1WJkIWrl7x5Gi/BnVw=;
	b=e68vnmeu0zJHMp50cGYLlN7HskUfWACoZspIIILuT4r+uQ2E77gyLkcd8VZOHBSN
	7JSQ5xFcIPC7lglEUa6SaLQx6C5eEqMrptJX5WI/sxd3fwTZm8TPnOnS8UliygliTm2
	SE9RPJrBH3v+JHc4NnDKXnN2tDYsE5V+Yi9FGz51w9HpOxTlBEXYAum77X6rZgGJ6dq
	gskOOwYbxJHR3M744Esyz9xPi3I6CdNhl9ShSFjQKEy7sFgg33gNsK4odmMUh15yTzc
	pJO1OnWR2t5koHRWwB9jnow16V+8Hv3EHk7979lwNzsHnts07b9iF15UNu20nhbJnZJ
	3+qR90PZBA==
Received: by smtp.zohomail.com with SMTPS id 1789332650602879.5848041182492;
	Sun, 13 Sep 2026 13:50:50 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 14 Sep 2026 04:50:29 +0800
Subject: [PATCH 8/9] platform/x86: lenovo-wmi-helpers: Adopt new WMI API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-lwmi-wmi-new-api-v1-8-7a400f2f69f8@rong.moe>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
In-Reply-To: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
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

