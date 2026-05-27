Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C3D328610
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 13:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889715; cv=none; b=OCH/1wDXcwrQ1Cm82j4zyeAlCycFYBR+Ea6RTn9Ba8686iv/H4Gb6/XHKJrFV9Rgd24Hm5W3OOg170JHe7qrjpC5bjgDty/aScdQw59AjsOdrPaUyi/5MKyOOLiCBZ2WjfSxOZpYl/gVGF8lijEY62kfflHhwm15XTwBU8amGtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889715; c=relaxed/simple;
	bh=bJnULGCRLCywdoyVfC0ArmNZElChU4wZGawKx6RpZ9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTnZ+m9tqpa8UuIHsx2ZHJiLAUxjkGP1+AcsYbbVYLPRu30Is1TaJ8UJejFJNGQQ2Gad9pQc9DV2qbmk2Qe8/HCfcxvlAHmkMpkeP4500Fr3oGj/WaPBdL6XvADpjx5WKFZxuYLXxbBhx/OS3ipStcMhEqfoZd9dPpP3wP8Lofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJ1+yc/k; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJ1+yc/k"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44c350a5b87so6950847f8f.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779889713; x=1780494513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bG6+lkEbuUyjTY4XeZmpXmBvQ0vkJPjr6t49okhXBY=;
        b=eJ1+yc/kUu8pvI0RmArYm/+Uxhs0kD0h/hsbLQ3xjPKhazKj7GL+RaTohyZNTtqoYc
         CrdcOkwppefO7rGQUENLvJjcNSDv5zSYKXgyvyX0n81upJsggWtOMUjOqdqVWjGoK4Ey
         dK61s1HO/E6SooMYq6P6hkUB3E8iPwe7Vbc19HcZonVxUmvXYF5c6ZxlO+qcppwX5Mgs
         /wTFaH499DDlMN9J0hOHIJ8B3dBPSoahVBWPoThg7l/nQFGdfa8JkBLfO9R1GoEnxy7t
         A+ubSHtQYLPSET27465jF+PQV4e4JfKFdi9+EgjCAosUP8EWpfPVDVKfRRpy3zIKc6Qp
         50Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889713; x=1780494513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bG6+lkEbuUyjTY4XeZmpXmBvQ0vkJPjr6t49okhXBY=;
        b=breEmVmZLrIArfeo6HnS067lI1TmlMwqZ2HYUP402zmcL8MqKvjVj6DJQvDuiFJorG
         zvr7dxMcf14P4/HaHXOnMAkGau9EqvnJ/wwRyJl94ZWJOo6Kaq8R9gjAbvMEke16dwyO
         tV7gBC+rONY8W0nYaOKj288YL9l0BbggjonmSFNUfIaJnON55xc66hvDpXHNGgKFcmzR
         ChKGmdtAsH+PL44Cyzubv8FlD+wD9OIrMFFEEOa5h9k0Jz/TKciHtHSsjQh2zKZPljsg
         uoLj7WZlPElMgqZaNeFdOviYCB7XMQilLErdlUNKEGLvdL9JOs/W3MPkZCR4lpeXoASX
         lrig==
X-Gm-Message-State: AOJu0YypNG6Rr6R6m2SVzI7XC4K7FirdeFxBZ5f6+08fyn1y9l5M/sIZ
	vznUCgmnhApeXnim/jTVwyoaL6Xs7UMgUvI6rtQi6N6BVHP+dIWQxVhjotY4A94y
X-Gm-Gg: Acq92OGQzUkBnvT74AUSBOFQoXD8XjBQ2b9EM6ibM+7ESgLSiNiisa0pp8lyJMWNIyO
	zxfmXYRtEGFi9lzmg9ojHKi+2J4IRwJmKU/JklMgVTdxOftu/IGXcxwUum4DeB9yAjmFCjuo8Qd
	XSS99mQ3v+IWxVXFsKWwbpDYQjdqku9G74KbYhpueNpt5fdVjVfAQl0hoXUhBki/9RNBV3wx1ew
	7tnYVzbUSpwnvno5Qb1+VjSEPbZGGhMls9vGj3/AmOzvZm3AAY5w/lkbGasEjIin1f87jfdKRpN
	zvpbTEjpfzp32NUgcYDVjlrmwoFmzwXgkcbde2xB+qxDxmLT5IX4ub7eE83410AYwjIGZIYwpey
	J+rRupgdf2JI+3WFgF1gMjZ6merIx0OjdwUF1Pag68XsyuY9k8grE4kwLoSd6VThMm5N6+IlGjF
	mwzWj3B5elN0/kukGdtWyIGKgXEZtRyAapDWFJMNCCmXs3Trtg5wGJ8Q==
X-Received: by 2002:a5d:5e84:0:b0:45e:6550:9557 with SMTP id ffacd0b85a97d-45eb38af95dmr39675862f8f.31.1779889712788;
        Wed, 27 May 2026 06:48:32 -0700 (PDT)
Received: from reskoldo73 (router-txt.fib.upc.es. [147.83.148.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b2a2asm6327053f8f.28.2026.05.27.06.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:48:32 -0700 (PDT)
From: Luis de Carlos <reskoldo73@gmail.com>
To: teackot@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis de Carlos <reskoldo73@gmail.com>
Subject: [PATCH v2] platform/x86: msi-ec: Add support for MSI Pulse GL66 12th Gen
Date: Wed, 27 May 2026 15:47:50 +0200
Message-ID: <20260527134750.25263-1-reskoldo73@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the firmware string '1583EMS1.109' to the ALLOWED_FW_10 array.
This enables Embedded Controller support, including battery charge
thresholds, for the MSI Pulse GL66 12UEK (MS-1583) laptop.

Signed-off-by: Luis de Carlos <reskoldo73@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index f19504dbf164..1ce7963a207e 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -823,6 +823,7 @@ static struct msi_ec_conf CONF9 __initdata = {
 
 static const char * const ALLOWED_FW_10[] __initconst = {
 	"1582EMS1.107", // GF66 11UC
+	"1583EMS1.109", // Pulse GL66 12UEK 
 	NULL
 };
 
-- 
2.54.0

