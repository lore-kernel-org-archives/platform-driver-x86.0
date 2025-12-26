Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E931242D98
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 20:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766781299; cv=none; b=FQR8bhya0Ak2Am6SS5cdam/dMQshZySGUeDaxi8dMFFG4VIVHr7PXNPG30sTzPvDAWNmc2qG6KPjTZ+bO3p6hFU48zdvk9cB19wG0Y6A3cgKwh0B4tkWT29x4rIIb9CeIN1Cus0dgJyOORJCnD8DXTD+CxFKDoHxUu1pVPTZ+EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766781299; c=relaxed/simple;
	bh=hmKsO/1JWno4d/Yci4BzgDUhGgq7HD6XQb5UtyHvm8g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gePjONScVdqp8JWXg71swUDnqHhdd+4VYtBoFDOApkdwXSkuvL2vhKKw5fCymcBwCrYWwORTd32fq5MAoHTW+g1MjY8kh2hvi9xpyZoAMR01RPiMAhVU7xnKAt7nexYVmBg/AfCuRpj96c557qypRlfUle3ZP1Sp/C0F2sctpas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXr4R1S9; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXr4R1S9"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47a9567bcd9so5670805e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 12:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766781295; x=1767386095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CV3oeGImNqWDpohcfzcqKappaYTZtWAuPzG0OYSH1YQ=;
        b=CXr4R1S9LUfdex6EUHikkXOcq86IbumuZ5GhVH849qRiyqjhuVhFVtVUYlNu+Mrn1f
         YsL8kDzjc6QkbuOY9VuX/xO4zAEgpNFMXDXfqawgjTU1FwZ+IZ7qSRv1QXAbWHmUSpHk
         aEJapesptFDGL2ojXDL5TRDx4MpX9L//2yfQ4JBuvK82B90eQy7BKeOOtK2RplIt1yFf
         Fo+4amjoih41dhK4fzFPUL7XLhdQSqGDpl/kSQTthtEJD3XGOrcOIX2w0ix5M+W56kY6
         NauRxpyE27ooQKJWHZiU6iTGl0S4h1U5hntdKBmUlIwqYlE3GgjziuoOkfhB+AvdrIn2
         tRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766781295; x=1767386095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CV3oeGImNqWDpohcfzcqKappaYTZtWAuPzG0OYSH1YQ=;
        b=OWZxUK8izhiIKvv3+IHPFFuGrQyCQI4135bgextsojXmPkoyREbCWcnrKrO5pa1tmL
         cOX22ayrvbRI6PuFhmN4JrFrQV8qo021Yd1T5U2NjAd8BZ2uZdkk8qC3rOKO3O+af3UM
         Lfxh2Dx+26g2Yeerdui+ZpHa/FDDcwUFuxQr7fbXFGzqCG05Y3zWUjKAt1/nF6eKDDMO
         z45DX9L744GQFbKBEK4iPPpTWbTR+eE2c3BXGnBWDtjchWLSv2pZr0cEvWfWNNeB3Emk
         KfhoyB5GD5AbFXtPu2hoRNXdxdQzXtonL2MSeMM5K4L2sOygyulKmLaMg7wEl1sSAANe
         nqUw==
X-Gm-Message-State: AOJu0YxiP9CJvNoKK6zta6C8jnK6KvfP9cLaRBhacHIEdJMNwwo1mkWI
	QaC/JGuh9ThEDoH4ZiqU4yUxoxLtkgJq+m0lX4xdS+Y36+JC7311/e8PKFGpcQkiE00=
X-Gm-Gg: AY/fxX4nybwND4ptgACKru3Rly9ZRByUkjiIBgG7LonwdFvluolEw4YmZbQ7GhvoefP
	KTPopNU/EKTdcqMZpblfBMc3b7x94xQJwcf70CGlMkn0XKdBbHNzZi5yQldCculx+LO0B8CHj9L
	TPMppErUrqeIWDHCcrgl/WVeGNheio7tXcIfBivt8bMAjW1L+KWLV8dqVD1J76nRaYPmFnp+3LG
	6ui8vo4ZB5jr+FCFuAEnNdVdGDX6CdgxcvdI37uaGqW7jNbpvBSeMhilaAUqvecj6uXJcuEDBHs
	pl46JOBhkpd1raMNSljNMu2Wy9w/peTRsrY7uwa22dgjtklLYQdGT0A+sGsO/S2ldz7+dO45x78
	2IfP2lj3j3K0yDz6AYwDteL1ZQo9uO4CaZVLQEBvYBvp+Lo7Lr9KoqwE2REWR0kF1jZxJYNpKON
	64yhy6sh0=
X-Google-Smtp-Source: AGHT+IH+ldne5N2p05s9YWLRcQ0W+T4cd156gSQADmyPE3yc7KZi0SwIcudMUCJCdDqOV0PP5AHL1Q==
X-Received: by 2002:a05:600c:8b44:b0:477:9c40:2fa1 with SMTP id 5b1f17b1804b1-47d19574dfemr154689355e9.4.1766781295500;
        Fri, 26 Dec 2025 12:34:55 -0800 (PST)
Received: from GreenOne.lan ([2a03:a900:1000:22b1::9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm441929315e9.8.2025.12.26.12.34.54
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 12:34:55 -0800 (PST)
From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Hnyk?= <tomashnyk@gmail.com>
To: platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: ideapad-laptop: Reassign KEY_CUT to KEY_SELECTIVE_SCREENSHOT
Date: Fri, 26 Dec 2025 21:34:54 +0100
Message-ID: <20251226203454.405520-1-tomashnyk@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As per Lenovo documentation, Fn+Print-Screen should "Open the Snipping
tool" which corresponds to KEY_SELECTIVE_SCREENSHOT (keycode 0x27a). It
is currently assigned to KEY_CUT because keycodes under 248 were
preferred due to X11 limitations.

Reassign Fn+Print-Screen from KEY_CUT to KEY_SELECTIVE_SCREENSHOT.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220566

Signed-off-by: Tomáš Hnyk <tomashnyk@gmail.com>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 5171a077f62c..7d5f7a2f6564 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1367,7 +1367,7 @@ static const struct key_entry ideapad_keymap[] = {
 	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
 	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
 	/* shift + prtsc */
-	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
+	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
 	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
 
-- 
2.52.0

