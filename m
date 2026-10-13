Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557BA53F6A0;
	Tue, 13 Oct 2026 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919737; cv=pass; b=GXu/vVlnqdk4+1w3xjGrOuKqsTQTM9DJEdpTLjxITMEbhBEjYv2pyvwId+9FWutINViJ/w+56H6wDK0DYaAI2uyIc4w4aoAtSN88QBHugLli3+3likKpmPcuctcnBjkvvtWn9WMukxwmai6738s9ubLYNP5fJa29KslymtT89oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919737; c=relaxed/simple;
	bh=uHfnDD+jPNh8KieapDA9xzkwLCXguNL96+a1PNWWyoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fc7DWcQ5yvKm3jIw+pBiHSu7oMEMQEt+Y01qlne5qnHZeseF4BSEgOZY/FL44dvQZpdKIdlvmTgDGtgszehY5Cl39IAsDPOhH9vKs35/64u1+ptBITfTl2OF4Gww/t3i+p48DD0GCnzasjoboOcQw5DWjI1ikGJ9PzXOJJe0SeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=K58gh8hP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="K58gh8hP"
ARC-Seal: i=1; a=rsa-sha256; t=1791919632; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AbMDoCTsVnGLvqWrXMgH6leEiY6Di4vUyfyUgare/bBzbVEnv+A28+vqCPWacGGOCALCooYza1r4QWBa/Sz+OcgoJOmc25znx8AuG4sqUjfc2dQoYb9V5nOaDxZVoVqKdfyBaDA8s4o0P7CkOLvJEmPNIICXXZxbgKnHYGis+HM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791919632; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r7rA5rpFBvVY1ow6UQfRPytRSFWWYCs7Ekz7UsHWvRw=; 
	b=af/5z+P8eF7V5tidMJP0EKofOk2AHNPBZ7uAriQKnXGKsQ2/z+0cUxxWJ2is+tCrIbdwXU710KYRZRmAgb0B+JPD3D4LFa6h6iiK8gsh5k7Zmx/8tFPVUEUfFfZ/mWowBDdhWzp7xGyD3PCUO1OUexvBa4yXHBnNQCQsM5Q1LZk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791919632;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=r7rA5rpFBvVY1ow6UQfRPytRSFWWYCs7Ekz7UsHWvRw=;
	b=K58gh8hPBGAU+C1eeDVXTvQO/+B0/dQF9jMKzXbDDj8I0V+9EWPDPte2L3RiA/Jb
	CTzoC8dT8u/w5cqUk5WYaUYp6JiVg6Po9u2kos89sSpwUZwjQh1won4nujQ0qUaZRh3
	dH1LtTLvhf6cuITnHyF5dZIuQOD9/J8DPlP/xt7Y7s8zIC6VKnSprxKWAX/C+7jeEZN
	8EwDsdICkv8wyyjPTv46aiF/G8BOJqZGXld/lIEUbhjkfBf1FjMeOQYzwEqCtO6gJhJ
	NBvU8qGP/uKpf8fljtCq4D8YkGzF4Pr58MEvGJj2sMRtGYUIAKB4i95+zRWEQBgCONK
	aHVQXnYMWg==
Received: by smtp.zohomail.com with SMTPS id 1791919629797487.774529568703;
	Tue, 13 Oct 2026 12:27:09 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 14 Oct 2026 03:21:54 +0800
Subject: [PATCH v3 11/12] platform/x86: lenovo-wmi-helpers: Adopt new WMI
 API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-lwmi-wmi-new-api-v3-11-e1032bed1c81@rong.moe>
References: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
In-Reply-To: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
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
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
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

