Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [178.154.239.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE244B8DEE;
	Wed,  6 May 2026 17:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778089867; cv=none; b=s/xBL78Y6lC8y67zZqdrjZVyd5d8sfnXjKNoRdcDWSAZgA2UI2775ctcfmmepej1YuZVwTD8AkUTkRfagsQFXf5GpN+3nMzKkgs3/pfetk/Em3hf7AG1NIieMGWcHXmPQ9fD/ULnEBS/KelY2H3zOtfwe5lWSeRy+Hjsi32UgNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778089867; c=relaxed/simple;
	bh=s/5SCWiToroUjkFj4o/9tKzgTO0a/LP9TyO+647NTzk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=P/x/E2+R4onXwGeKvwVylB6/ZPc6hZ/d3Bf3ummi1zEl2Oo/5NtlTFm6h4UkfXmjmLIEHJF9Kqj0f0JjVO8hHaU3UTD+6lup5a+xJ5QEWFAJ3gem/IP/LqKMiOtjO2+I+rTXrRcYk70aLoQsZBa+vckNFjYwLVLxwYAjpRa/mSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=Aod/YtVs; arc=none smtp.client-ip=178.154.239.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="Aod/YtVs"
Received: from mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net [IPv6:2a02:6b8:c22:d15:0:640:87c2:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id 47F8180627;
	Wed, 06 May 2026 20:50:50 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (smtp) with ESMTPSA id lolvKP0SGOs0-lINRl2sK;
	Wed, 06 May 2026 20:50:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noirlang.tr; s=mail;
	t=1778089849; bh=JB7/oy9IQ6zSn7dkB2JX4AAwqNBlNxuwLB6ERdK9rdc=;
	h=Message-ID:Date:Subject:To:From;
	b=Aod/YtVsBgjlvTjxaZC7aSknmnOY+KeoBvEv/aJX7GExHNwoWwbpEqR6PxJ8Moalk
	 OGj+GVkZM260PeHrauvQr74a41a4klAg/RtxlIWEHEwekBqUhjF2rdLThkkDV4YhTD
	 B81DqZhV1vOPhSYunssSRiq4LmeSuTifkUPFmSYQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net; dkim=pass header.i=@noirlang.tr
From: Melih Emik <melihemik@noirlang.tr>
To: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: replace strcpy() with strscpy()
Date: Wed,  6 May 2026 20:50:31 +0300
Message-ID: <20260506175031.25337-1-melihemik@noirlang.tr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strcpy() with strscpy() in dell_rbu to use the preferred

kernel string API for bounded copies.

The destination buffer size is known at compile time

(sizeof(image_type)), so this conversion is safe.

No functional change intended.

Signed-off-by: Melih Emik <melihemik@noirlang.tr>
---
 drivers/platform/x86/dell/dell_rbu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index 3fa9de9aa47b..85eea8898fac 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -562,9 +562,9 @@ static ssize_t image_type_write(struct file *filp, struct kobject *kobj,
 		buffer[count] = '\0';
 
 	if (strstr(buffer, "mono"))
-		strcpy(image_type, "mono");
+		strscpy(image_type, "mono", sizeof(image_type));
 	else if (strstr(buffer, "packet"))
-		strcpy(image_type, "packet");
+		strscpy(image_type, "packet", sizeof(image_type));
 	else if (strstr(buffer, "init")) {
 		/*
 		 * If due to the user error the driver gets in a bad
-- 
2.54.0

