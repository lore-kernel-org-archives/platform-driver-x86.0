Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2942F84F
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812638; cv=none; b=N5NXA/QDaS6TrWi//JdEtuG7vGx4BsRG1N/Ym3mCkxmOY92c6Fe4c6NIACvKfYz2/RXAOT9yWNVcfTLe38dbWrYEpDpdjstfJ6A/2UgmOPfoXGhRejYGHk9HKLHWHHWs0R1UF61svK2tPg/arAdvpAAmXyg+WzhotTlBpCeE9Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812638; c=relaxed/simple;
	bh=N7hgLADy8aiOTM1qhLBnVb+w7c+8o9/LkA5fcdu11zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/eEhE8hLZp2TNLbAzIA+jMYw/c3+azOTYKumj5SCkQfrMS8FUU/bfhU8vsV3VXaxHgx2yUoOEyalWePGNf1i3wl44rV/84mif7Hvf572uEl4xY+ew8/Vd5w0wJ94mqpEpRrnglYvilqd1KyNlcUsbO3UrGneKBXsNZUhjRppxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YPKmNxXf; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YPKmNxXf"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775812635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0D0wtc4oKupY94LZzu0tKltSws4Q8LXlk/e7vAJ17k=;
	b=YPKmNxXfwmhe2hGwsRLJdarb/bxXI4SEbPUIeinO2XWp8uJVkrqn3/1YU65LMnKmETerDG
	N0RyHyn/MbVA86JAWC/QLESg4Q1Y27SR2i+idatnn3k5ptdxdwvUl5Dp4A9tojA859U5KN
	2hauFsnMgjlnhgIiLd2wfs+zTw0SwN4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: dell_rbu: use strscpy in image_type_write
Date: Fri, 10 Apr 2026 11:16:36 +0200
Message-ID: <20260410091633.2822-6-thorsten.blum@linux.dev>
In-Reply-To: <20260410091633.2822-4-thorsten.blum@linux.dev>
References: <20260410091633.2822-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=thorsten.blum@linux.dev; h=from:subject; bh=N7hgLADy8aiOTM1qhLBnVb+w7c+8o9/LkA5fcdu11zw=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJk39v+5uvpv8TIJ0fN9uZOr1u5gWVdjdj6kfjtnGtuqT 5PenX6W0FHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATuW/CyHBd9DLzsSClYMkv a4zVZkvvfvdcrEbmc2qS3d8plzm6Hi5kZNijmPprXbc687qaLvkK/6T7DVevZS1ktEzxEzLltHt zix0A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows. While the
current code works correctly, replace strcpy() with the safer strscpy()
to follow secure coding best practices.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/platform/x86/dell/dell_rbu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index 3fa9de9aa47b..768b15f406d3 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -562,9 +562,9 @@ static ssize_t image_type_write(struct file *filp, struct kobject *kobj,
 		buffer[count] = '\0';
 
 	if (strstr(buffer, "mono"))
-		strcpy(image_type, "mono");
+		strscpy(image_type, "mono");
 	else if (strstr(buffer, "packet"))
-		strcpy(image_type, "packet");
+		strscpy(image_type, "packet");
 	else if (strstr(buffer, "init")) {
 		/*
 		 * If due to the user error the driver gets in a bad
