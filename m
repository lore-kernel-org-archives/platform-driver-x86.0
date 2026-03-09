Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2E2DC76A
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091148; cv=none; b=sE/0KwfYyGBPDdtF8PA4tjnUZcDZuPhaRKMi5Mv7hf0qg7A3RU10PWizQv6AiAGK0qSCXkauOYs9d34G2y6s39uawGBYuEaN/nWGGqWJeHDVxtu3N8PSPXDpX1vk1IbgqsyIj984i4IQdHPlloZ4jJwrIcpqyeb63+8Hi7tXCP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091148; c=relaxed/simple;
	bh=DmGe+WE6i417ffQf5E790g4rwEx5gkm9xAKvPM1SAPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dcmAb2VcdApuuE3AKcdTR0ORxUeD0EYmjVTRA66gMNkL+fA3/flkSCZWCKtbesmh/qo9Eqhb78S+GQWX4S4Ev0LEasfgEDgRpfnhnTz+bSgh787nwWEpcSWET5sh/mOTRryvGTlTc6Mj3F5Pdnmw/vLW58RYmfjkc/lJ5WiBR0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z1l1lBQR; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z1l1lBQR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773091144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mJ77ctf4/DF4Ka3YDmnuCYQeO+UWpZxArW4MNGyzckQ=;
	b=Z1l1lBQRepUFCSU0Ga80CWHGRyv4JALTIchKFwcaUmQW22ZErksE6WzTTsPBhIlrrW+7rt
	jK4QPORt+cxhpqW2AJDqE5BAjxSXQg9Cfu6g+Fc2LK+djo2WOVxsI+B8NUUjmfKtK4F+kV
	ubD80zKZMx6VRKG3fMUnCi0K0uU26+s=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-wmi-sysman: Clean up security buffer helpers
Date: Mon,  9 Mar 2026 22:18:12 +0100
Message-ID: <20260309211811.82403-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3156; i=thorsten.blum@linux.dev; h=from:subject; bh=DmGe+WE6i417ffQf5E790g4rwEx5gkm9xAKvPM1SAPY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnrLYW5VFWPJB/x7Fyc9Vv15PPXDt/Wh/za9ndhv0SB1 lnFU8b2HaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCR3iKG//FdL+SfHz5vz/2x SL0i98y1VAYbltUfS5e+cJ35bYq0yC6Gf9rLV3p+s1ihckGNqW+P/MXrDVJNWm+mhl0I4XKS28P 0iAMA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

In calculate_security_buffer(), call strlen() once and use ALIGN() to
round up to an even size.

In populate_security_buffer(), also avoid recomputing strlen(), rename
the u32 pointer from 'seclen' to 'seclenp' to avoid confusion with the
new length variable, and drop the memcpy() guard since calling it with
size 0 is a no-op and therefore safe.

Use 'const char *' for the read-only source string in both helpers.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  4 ++--
 .../x86/dell/dell-wmi-sysman/sysman.c         | 20 ++++++++-----------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
index 817ee7ba07ca..5278a93fdaf7 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
@@ -189,8 +189,8 @@ void exit_bios_attr_set_interface(void);
 int init_bios_attr_set_interface(void);
 int map_wmi_error(int error_code);
 size_t calculate_string_buffer(const char *str);
-size_t calculate_security_buffer(char *authentication);
-void populate_security_buffer(char *buffer, char *authentication);
+size_t calculate_security_buffer(const char *authentication);
+void populate_security_buffer(char *buffer, const char *authentication);
 ssize_t populate_string_buffer(char *buffer, size_t buffer_len, const char *str);
 int set_new_password(const char *password_type, const char *new);
 int init_bios_attr_pass_interface(void);
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 9dddab6c9397..aba9ef2cfc03 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -72,13 +72,9 @@ size_t calculate_string_buffer(const char *str)
  *
  * Currently only supported type is Admin password
  */
-size_t calculate_security_buffer(char *authentication)
+size_t calculate_security_buffer(const char *authentication)
 {
-	if (strlen(authentication) > 0) {
-		return (sizeof(u32) * 2) + strlen(authentication) +
-			strlen(authentication) % 2;
-	}
-	return sizeof(u32) * 2;
+	return sizeof(u32) * 2 + ALIGN(strlen(authentication), 2);
 }
 
 /**
@@ -88,18 +84,18 @@ size_t calculate_security_buffer(char *authentication)
  *
  * Currently only supported type is PLAIN TEXT
  */
-void populate_security_buffer(char *buffer, char *authentication)
+void populate_security_buffer(char *buffer, const char *authentication)
 {
+	size_t seclen = strlen(authentication);
 	char *auth = buffer + sizeof(u32) * 2;
 	u32 *sectype = (u32 *) buffer;
-	u32 *seclen = sectype + 1;
+	u32 *seclenp = sectype + 1;
 
-	*sectype = strlen(authentication) > 0 ? 1 : 0;
-	*seclen = strlen(authentication);
+	*sectype = !!seclen;
+	*seclenp = seclen;
 
 	/* plain text */
-	if (strlen(authentication) > 0)
-		memcpy(auth, authentication, *seclen);
+	memcpy(auth, authentication, seclen);
 }
 
 /**
