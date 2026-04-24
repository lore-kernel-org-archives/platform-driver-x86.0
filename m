Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691A536D9EA
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 07:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017514; cv=none; b=ByZacvZDYQEZ0SYwCL/rjXCtUYGnFbf/yFm0X1NHK0Ev91oFAgIrhIjuqJWkJHb851dimup6MOBQQDHWCQQzszBLXXyuh+grbyDTPQvd1sw/U4izC2DYFvD2CUssoibfB2KE1tocxceNGcpnM/DH12uecgYWMKKYXXY/xNTLF2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017514; c=relaxed/simple;
	bh=ZWYP6mT6fA+JgNjY1AEzNNqS3PWco9MPoV33KM4nSr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JDHIYt46OPu4XQw09rNRsdzRJkl9JJVjRokT9GckKoOAHWl4MwVZjbffWYMQh2WyJ8W6xe47+WRS8PjsqaQsnqmnrSot0NOsCPnCLXZX0D8RNtFRRTIdbW9hT6ndy/+WuHb0whEe8Ju5c3Z6JTWebfXkwWeqnATG1wdskR5vNVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ImA6J1S7; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ImA6J1S7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777017511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bDCEtKW5Ib4ErBCREqf+dOFi6J08OrsZfJ1xvOpO73A=;
	b=ImA6J1S7xcABIfrwkp9AAqikA6dlyOVYWp5CpmrZ+CPK3FQm3VaHON9XXIbfOz/mu8DQHJ
	5d9sHkpjsFBYKaZCmecB1lb62A+UY3xGLlqA0fHXFUHXaA3gIV2fbQUMJ1aCpbfLW0H9cX
	fy6rCN3QjHnjnCslinmik7U+n7yFz3U=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Mattia Dongili <malattia@linux.it>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sonypi: use strscpy() in sonypi_acpi_probe
Date: Fri, 24 Apr 2026 09:57:57 +0200
Message-ID: <20260424075755.305770-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=thorsten.blum@linux.dev; h=from:subject; bh=ZWYP6mT6fA+JgNjY1AEzNNqS3PWco9MPoV33KM4nSr8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmvlVquzVF0MzM5GHerLrLqraHDvtUBAtHX3O7LdQu9f Rf7MOdiRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzkWjDDP5sfM97X1aQ+ODP1 xjER57/Tn6p2VTw6tiORudhv0mqOChuG/8HX2VTjDfdLpToLqIT7H+zcaPmeUclqmWRXe+f+Yz9 M+AE=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() has been deprecated¹ because it performs no bounds checking on
the destination buffer, which can lead to buffer overflows. While the
current code works correctly, replace strcpy() with the safer strscpy()
to follow secure coding best practices.

¹ https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Based on linux-next and the new function name sonypi_acpi_probe().
---
 drivers/char/sonypi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/char/sonypi.c b/drivers/char/sonypi.c
index ccda997a9098..959949f04f7d 100644
--- a/drivers/char/sonypi.c
+++ b/drivers/char/sonypi.c
@@ -37,6 +37,7 @@
 #include <linux/kfifo.h>
 #include <linux/platform_device.h>
 #include <linux/gfp.h>
+#include <linux/string.h>
 #include <linux/string_choices.h>
 
 #include <linux/uaccess.h>
@@ -1120,8 +1121,8 @@ static int sonypi_acpi_probe(struct platform_device *pdev)
 	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
 
 	sonypi_acpi_device = device;
-	strcpy(acpi_device_name(device), "Sony laptop hotkeys");
-	strcpy(acpi_device_class(device), "sony/hotkey");
+	strscpy(acpi_device_name(device), "Sony laptop hotkeys");
+	strscpy(acpi_device_class(device), "sony/hotkey");
 	return 0;
 }
 
