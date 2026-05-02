Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F491E9906
	for <platform-driver-x86@vger.kernel.org>; Sat,  2 May 2026 16:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777741149; cv=none; b=lwOCLd1vFc2IRU2mRX+QXMSloYK2RHR78X8nZK54FFbBH6SvcnFgcv1eaPQ8OrXr7y8HP9uVULTWRi+5kyAL6xO5Il6pkUTeqv5CHGHCziyJCu8tX6pvX4wAJZ/zQdlM5fhYHIgx9ywN/sJ+uW+1p83CcHloP+upl4xIoiHG63Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777741149; c=relaxed/simple;
	bh=XlRm3xHLoHDZ9p11H9l70P4pJIJzkitgaEmi328I3sI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZicCpTodb2ROc5RqYJsbuZZxLNrtE0Hz2JFdIWV0nJhsK12qjefwhJAoaIPlJJ3FGqYD4zK3E2luKOFCnclp4o/4FlDrL7F7cVX041xqbjO0fkyi3qXnExu1NePF2KAbHWHy50ycysKXQ40ViEEAiUwA4tvhAcDSYeAqPqxtTbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p1z5aJpO; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p1z5aJpO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777741136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=csYYPm3MGAHOEvE1tAJkD+kwqmaHdnfVxZSzLnErsk0=;
	b=p1z5aJpOKjz8HDm3Y5SRlxGBxMmIIWc/Rs/VxLI0DE+7NAmuw0bYP3g4qqNPp8QMYMWc54
	xZNSQ7ycDwDysdK50y3FnkDQLINeYb4Z0zB1sQiR1RqmYFfffXn1dTOT9gGbTxfgDkDlwm
	qhvK06Nmv5hPjcR8Y5MELnorNle33/Y=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-wmi-sysman: use strnlen in strlcpy_attr
Date: Sat,  2 May 2026 18:57:08 +0200
Message-ID: <20260502165707.242332-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2341; i=thorsten.blum@linux.dev; h=from:subject; bh=XlRm3xHLoHDZ9p11H9l70P4pJIJzkitgaEmi328I3sI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnfdB7fEbtsUKRyK+5Z2EsOTx2zVftX5KYLOQiEPnw/a VKIo9b6jlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZjI9q0M/zOCe8WafSY0ZjzT uGhx0Wh1rPkpaZm1c+JyL1pMmJJ5q4SR4YxQzBvVtETVyh0qcc05lcHzPqQ8+v3KlYeni0OZ48Z xPgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use strnlen() to limit source string scanning to MAX_BUFF bytes. Return
early on error and make the "empty string means not applicable" case
explicit.

Use 'const char *' for the read-only source string while at it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  2 +-
 .../x86/dell/dell-wmi-sysman/sysman.c         | 20 ++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
index 5278a93fdaf7..f6943301b857 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
@@ -162,7 +162,7 @@ static ssize_t curr_val##_store(struct kobject *kobj,				\
 
 union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
 int get_instance_count(const char *guid_string);
-void strlcpy_attr(char *dest, char *src);
+void strlcpy_attr(char *dest, const char *src);
 
 int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
 			struct kobject *attr_name_kobj, u32 enum_property_count);
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 51d25fdc1389..6c9911accefc 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -234,18 +234,20 @@ static const struct kobj_type attr_name_ktype = {
  * @dest: Where to copy the string to
  * @src: Where to copy the string from
  */
-void strlcpy_attr(char *dest, char *src)
+void strlcpy_attr(char *dest, const char *src)
 {
-	size_t len = strlen(src) + 1;
+	size_t len = strnlen(src, MAX_BUFF);
 
-	if (len > 1 && len <= MAX_BUFF)
-		strscpy(dest, src, len);
-
-	/*len can be zero because any property not-applicable to attribute can
-	 * be empty so check only for too long buffers and log error
-	 */
-	if (len > MAX_BUFF)
+	if (len == MAX_BUFF) {
 		pr_err("Source string returned from BIOS is out of bound!\n");
+		return;
+	}
+
+	/* Empty string means "not applicable" and is skipped intentionally. */
+	if (len == 0)
+		return;
+
+	strscpy(dest, src, len + 1);
 }
 
 /**
