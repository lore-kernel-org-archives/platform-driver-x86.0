Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459A23101BD
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812638; cv=none; b=G9t7z6GU6Nl4HpkLsbkOgy+FsgZNNPFBUXhKRKIRWO6fN3KmR3PWApbC0V6JO/kwqdKmCJgvWQGZjHiXWcP32ycRMu0D0SIRzTXD7k6Xwf539bkaVnICaoh7L08Xk6MLieY/J+WmWaxy6bOdeRlWh43OhIv55ckiWqCC/mQJMTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812638; c=relaxed/simple;
	bh=DZ0LBhz/oKpXodBLS9ya98QCvTg/hx5+Fs4ko8fTL1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tsXnkjQ+Ygv3Nfu/FFxlwVZuSeQ8+OEY3fuPbs8FV5/zY1ewW3bumHdzCFGxOomTYm/lO3NHyMaTHm8DXw9VvJ3yASUava3DJFJ7x3KtHpIehw4qDQ+uCLr/j3fGbK8AUic+qa8LQd3p4j07FimaK2YV4i5mmrUfRTQYmweALic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KlBIIj2c; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KlBIIj2c"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775812624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=640T4J8RmJR2d+W7K9Y1lNuHeg4ogR4RK7QcQsJ0yH8=;
	b=KlBIIj2ccq1PScwf5RZXxq8OrDyDYL/keOMV1FDuotpOVaTQBIPafhmd2iLbKBlGKCN8OR
	LEK/KWNOw3KDVBGsnDvYnoDWNiqJrkvA4hfOhZTwRUlzXzghbeHHyssnUOLhL9eNTN2G+w
	mlFP1LNlChu5rFcxbVLbm9AZaI+wqZc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: use u8 * for raw byte buffers
Date: Fri, 10 Apr 2026 11:16:34 +0200
Message-ID: <20260410091633.2822-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5202; i=thorsten.blum@linux.dev; h=from:subject; bh=DZ0LBhz/oKpXodBLS9ya98QCvTg/hx5+Fs4ko8fTL1Q=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJk39n9UMFmreXitfsjCRV+zZ/2Tbto//8Wm09NOuf7ad M9mct5i0Y5SFgYxLgZZMUWWB7N+zPAtrancZBKxE2YOKxPIEAYuTgGYSPZvRoZ+KSuxhq3lciXT WE1nKXPY+/1c35zx/LbfwqZALzHROyIM/72ynHM8W2Ywsqu5vZh+Ruvgf9fXFm/PqacV3p4/++2 XYEYA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The buffer parameters in populate_{security,string}_buffer() and
call_{biosattributes,password}_interface() are raw byte buffers, not
character strings - use 'u8 *' instead of 'char *' to reflect this.

Update the local buffer variables at the call sites and in
populate_security_buffer() accordingly.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 .../x86/dell/dell-wmi-sysman/biosattr-interface.c         | 8 ++++----
 .../platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h   | 4 ++--
 .../x86/dell/dell-wmi-sysman/passwordattr-interface.c     | 4 ++--
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c        | 6 +++---
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
index c2dd2de6bc20..db278ff4cc4d 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
@@ -13,8 +13,8 @@
 #define SETBIOSDEFAULTS_METHOD_ID					0x03
 #define SETATTRIBUTE_METHOD_ID						0x04
 
-static int call_biosattributes_interface(struct wmi_device *wdev, char *in_args, size_t size,
-					int method_id)
+static int call_biosattributes_interface(struct wmi_device *wdev, u8 *in_args,
+					 size_t size, int method_id)
 {
 	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
 	struct acpi_buffer input;
@@ -51,7 +51,7 @@ int set_attribute(const char *a_name, const char *a_value)
 {
 	size_t security_area_size, buffer_size;
 	size_t a_name_size, a_value_size;
-	char *buffer = NULL, *start;
+	u8 *buffer = NULL, *start;
 	int ret;
 
 	mutex_lock(&wmi_priv.mutex);
@@ -109,7 +109,7 @@ int set_bios_defaults(u8 deftype)
 {
 	size_t security_area_size, buffer_size;
 	size_t integer_area_size = sizeof(u8);
-	char *buffer = NULL;
+	u8 *buffer = NULL;
 	u8 *defaultType;
 	int ret;
 
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
index 5278a93fdaf7..3bddedad5eba 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
@@ -190,8 +190,8 @@ int init_bios_attr_set_interface(void);
 int map_wmi_error(int error_code);
 size_t calculate_string_buffer(const char *str);
 size_t calculate_security_buffer(const char *authentication);
-void populate_security_buffer(char *buffer, const char *authentication);
-ssize_t populate_string_buffer(char *buffer, size_t buffer_len, const char *str);
+void populate_security_buffer(u8 *buffer, const char *authentication);
+ssize_t populate_string_buffer(u8 *buffer, size_t buffer_len, const char *str);
 int set_new_password(const char *password_type, const char *new);
 int init_bios_attr_pass_interface(void);
 void exit_bios_attr_pass_interface(void);
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
index e586f7957946..026c134b3f97 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
@@ -8,7 +8,7 @@
 #include <linux/wmi.h>
 #include "dell-wmi-sysman.h"
 
-static int call_password_interface(struct wmi_device *wdev, char *in_args, size_t size)
+static int call_password_interface(struct wmi_device *wdev, u8 *in_args, size_t size)
 {
 	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
 	struct acpi_buffer input;
@@ -42,7 +42,7 @@ int set_new_password(const char *password_type, const char *new)
 {
 	size_t password_type_size, current_password_size, new_size;
 	size_t security_area_size, buffer_size;
-	char *buffer = NULL, *start;
+	u8 *buffer = NULL, *start;
 	char *current_password;
 	int ret;
 
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 51d25fdc1389..ab46a023cc34 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -36,7 +36,7 @@ static int reset_option = -1;
  * @buffer_len: length of the destination buffer
  * @str: the string to insert into buffer
  */
-ssize_t populate_string_buffer(char *buffer, size_t buffer_len, const char *str)
+ssize_t populate_string_buffer(u8 *buffer, size_t buffer_len, const char *str)
 {
 	u16 *length = (u16 *)buffer;
 	u16 *target = length + 1;
@@ -87,10 +87,10 @@ size_t calculate_security_buffer(const char *authentication)
  *
  * Currently only supported type is PLAIN TEXT
  */
-void populate_security_buffer(char *buffer, const char *authentication)
+void populate_security_buffer(u8 *buffer, const char *authentication)
 {
 	size_t seclen = strlen(authentication);
-	char *auth = buffer + sizeof(u32) * 2;
+	u8 *auth = buffer + sizeof(u32) * 2;
 	u32 *sectype = (u32 *) buffer;
 	u32 *seclenp = sectype + 1;
 

base-commit: a29b5cd42f5bc6ba1be6422f61f3f05bab707ce8
