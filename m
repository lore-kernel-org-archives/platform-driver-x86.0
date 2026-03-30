Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE672F90E0
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881676; cv=none; b=lJe4qcR6pucapwKHTaT/9M5S8g/BH/QyJoKH6s3YDhcB7pSqfDFbT3ESMs8hEfnN1rfGCLrKALAVnDoaAKhq/nX9lLHjrJwuMNYuk2lhN3mnOaeBUOL+WJv4vawx2n1C6tcUunlRbxyomQ6zu5mRxCNlSvjiBlxIK+uX4yJ9XwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881676; c=relaxed/simple;
	bh=DmGe+WE6i417ffQf5E790g4rwEx5gkm9xAKvPM1SAPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BuiuS+TOWoasmXzXRgaU19aDgLbj/CDR7SVewEV6z49ZRuvLjdsCkSpmVWSkeScaVdXnijOjRQl2MKytllgM9MtpxkQt383GT7DIazILc3NTlnhqxy577G42FJ1YJEzCzYpPGSqVZYBBRVCltY+vwgI3YLWCHjpYYcb1LKBUumw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BqIXs3JJ; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BqIXs3JJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774881662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mJ77ctf4/DF4Ka3YDmnuCYQeO+UWpZxArW4MNGyzckQ=;
	b=BqIXs3JJY4Zho39dk7BVukO7PgndDfYT9xIYR+yL5erUyQWNIl16yolGRnRGdsHls70W3J
	IUYWZ9m/oKnw5YRHH+RPB/fTtF3WsZqVxcnMqyClHXjXMtzFtMcYb/FrivFQuzOOfmgsRI
	J8Un2kKB/aH01JedMg/Rrkmw7Fq7upM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] platform/x86: dell-wmi-sysman: Clean up security buffer helpers
Date: Mon, 30 Mar 2026 16:40:36 +0200
Message-ID: <20260330144034.478801-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3156; i=thorsten.blum@linux.dev; h=from:subject; bh=DmGe+WE6i417ffQf5E790g4rwEx5gkm9xAKvPM1SAPY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmnupO4VFWPJB/x7Fyc9Vv15PPXDt/Wh/za9ndhv0SB1 lnFU8b2HaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRowoM/5SDPqs4XA9ZlGTJ 6FF1Jb2zL2FTdFfip6MFJSySom1OGxkZWuceqvy10f6c5y0n1zZNJ+cfy7PtQ/a6fE0STavJPuT PAwA=
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
