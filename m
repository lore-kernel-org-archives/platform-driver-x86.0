Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2807A4DA9B2;
	Fri,  9 Oct 2026 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550579; cv=pass; b=CGWI23GWKgBAVqXiwSpkoaqyZ0UkhFxio+0M3u6K7p2Y19019D4UGN3HxU/7HA5fYsMrRzELaCg3Ov+J2f8Y8ylVyRcyDxBu7lV6SPBrYMxAJ/Owp/rAH8gBAThiWg77ej5GE7SM6/AB5ugvsDJI1t6D3DhPTHoMmDJdyMk5zRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550579; c=relaxed/simple;
	bh=ZOeGXeEkAkv34jClDSEtnI3oR0m4n7d53FJjNZiwUI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gh7jV9res6Fs5uo80WFFg1p1b9bDlIUPvOTfHIyn2qhjzPl4v/Ul+Fobt4TE2IZX3SJhlnqSI0ZHBsFqYkBhFsOQb3LcUtGQjDaK2tI3WTWeT4QiJmzeR2w9Ci3W6Kv3FL1/qBtS9rK+DG4HbsWIr8XWDJGglRIM8mhJBG9nMJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=en3cCBIK; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="en3cCBIK"
ARC-Seal: i=1; a=rsa-sha256; t=1791550491; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aFf+PEcMhZdr39Xx7ZlP7+oZTOdqXXTBiwAU69JuiFuaIoQt8XjV8CdpTRdsrY4J8kNFdF3zAQpsonIMexLirm692kPOTiGRj26FdF76gSGa1dhbAo8dDHXc3HodvmbG7waIxuztsokJ/5rtWC4u0wmi844wj25jiwd6M2WkOWo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791550491; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HvRz4woefoDbgxNylMP+yqczp1WJkIWrl7x5Gi/BnVw=; 
	b=WzSex2x+TiwrSOGLR0gSTYqnyPeaEjPBLWZDSMmmx0t1kNhb0oWu6IJ1nEtOt0KrJfNZ5OzF1xSZB7A1DDdGBw4nr8WrGykPGz7Roov0SyNEwe7vFU10e+sDgTpgPxL5t29aqyOHIA8yuvp5xm32fKhvuyBMfLQaK9KGR0qt2sE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791550491;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=HvRz4woefoDbgxNylMP+yqczp1WJkIWrl7x5Gi/BnVw=;
	b=en3cCBIKfiV83l3oHrorn/SXvs4t1bdqzooIEagXlg/wM31m5iPqjU2vWnCvOmOi
	epKL9hTMDxyvzfGfUZDqbMj+4ssrd2EBlL7+qyTiu96XS3xQ0cq1Fx7FFB2DhJjEo2T
	ySkGBShAMZfK4Ngts3WGyHLY8o1Nfwxh8fi4KVsHaNdl8HpWqfTKp9gu8kIeKLG1sGn
	Lil4jqeqKDGXW78ICAz/Lfzr2PUFxC7JRBkMCTUT1fDUps0mjnunmH8xYvxHb6feZTr
	o3C+8/n+sehxbUYbOpTiskCIT704gyK798KiYgSz6cSiuIWf/spl71kGiGZtyJivUzu
	FQ5+eHb8/g==
Received: by smtp.zohomail.com with SMTPS id 17915504902061022.9860069210005;
	Fri, 9 Oct 2026 05:54:50 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 09 Oct 2026 20:53:53 +0800
Subject: [PATCH v2 11/12] platform/x86: lenovo-wmi-helpers: Adopt new WMI
 API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-lwmi-wmi-new-api-v2-11-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-73bef
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

