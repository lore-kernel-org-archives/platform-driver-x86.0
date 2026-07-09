Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9192D425CFC
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 12:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599856; cv=none; b=DflKz2l8l6X3nSNAg2XjBNjmVD+mfZbCqsGwLgiltFlHdI3cID1sCArCvv2ZP6JvlVa9fP5XSKUmJ6H1nxUNUQrYC3095kJHFAk+Agcfx3JpFJfWAtNQwcLI5Tupocwlq79q62daiTvLaxxVTlxSDAOy1DFkYwYbiw5P5Udosag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599856; c=relaxed/simple;
	bh=yX8Ev8joxZLka55dwQAXYl7wMVZVG0WGn6DZbYMjtNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2SjeGq2XYUD1VKVEh5h2d23gKCdlw+C0v4AD+4J3iweGxJwTX1NhWYZeIMx2qT+tY3nfoQeZs/udGjeFcsC2ImOJ2+9tAindi2RUkdSQGzVJTbg9etx3+VkHXit/bSwqHjzF1ODWhfTxhS9CxB4qnHNlhFc9m4/zLwRWpRfDUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fnrjjd72; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fnrjjd72"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-847aa193d98so1491598b3a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 05:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783599854; x=1784204654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxrG0tDMRfjVHagtSUgPcufh4KD0cWSQDbXgyNSt9RU=;
        b=Fnrjjd72RV8zwunkiiPlO19uzZmpK/CnncwRjBPXryMITvPsMnGQJ/GpYL6uZnH9/3
         LDfBGcAeTC7NRy+4r8A7sagXf4j7QWRPJhYvslGXHp/7p5ytkE3UR3/M5o76gcpUhAjb
         4igVPD8qLMfHhMA9Cig+lebeLqbJdizY9P2+kJ4FQoWkH2+wFWHRFkez5OankW9LzB0Z
         P2NleIzc1hkIg1iWQtRRyqqRyRPnozvmVu3xBq2ZtJw3qS4/c6f2ebK9In4G+3ZpISKc
         LwnY3zH7CVR6vuQUPpHuAji6i9tqt9x97uHN5hcAVocG4Wuv2146gy/LdTOjSvaJcCdW
         bTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599854; x=1784204654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YxrG0tDMRfjVHagtSUgPcufh4KD0cWSQDbXgyNSt9RU=;
        b=RO5YDI0fs3EvaAfKEI9Wy7APNHXGXZzZ2Um+4J++jAwkaT/8c+wk5boq7SWRRmtCCl
         n1NgRPs+DvOIp7zV9n9Q0rme6SHQ6VfQoO5x1tfExCob1rvbDLBjen0mcDd+MVmcGDOT
         f/O3d5Q62PpJmqzX74CnyYXlUJoJ0BChwQqqPjtgp/TQTAx76XvQL/KJBV2WuDpw1FLT
         JIhWYIoxbeA1FLivOcGcqhzOOE4f1ka5daP62Z7EmDTfwwJVWB2dZYMx4v7yeTh3InIU
         JMrZlyRAJkdpCHFLzHLXFowPO/lRo8BmnV5i8G1HlfubTWxk3QZl5KGAOL9bG7PrcrTn
         NJGg==
X-Forwarded-Encrypted: i=1; AHgh+RrO9DyhuVUyWuot3+ewGXsYxeDNplgB1QPrUGi9mfF8rUcf6j88SLjzkJjjs15I/LVM6xd1tpu2P4zUObqMbngUj+4C@vger.kernel.org
X-Gm-Message-State: AOJu0YwsRv12LkYD8SezcZPkx4Th424d4q23cCUKnvuMrPfyc3+XSV8j
	aFcmgBa8Qkl5jYjLpeC3afsp47ozfqWgpOCVI8Hie5py7pZvnFuv7RJ7
X-Gm-Gg: AfdE7ckzyGxns5RezEih2ga7/+isWHGv7Yyc3zwLbqgJ4HaRxHuKJKUjGlnQfL6a+R8
	yY6r2oF5prNILnpbhvecWiH8Pcpwi/GNT6izGUOi8jjdfC0o56T+tEPuvZ/lxAvl67tLm682NXH
	W4XpI8l3VK/avpRJOXuCTXJvK9ThX6pvyKu3w0fZnWq+fRxqsrq+B6dM3IdzqEW5UMMFzBceUI1
	jZk0EkJh29Lm4Mqp/kFJlXbs7jx/wOU+6dMfnaAugkbpPgy6zW023b+5Ve8brNJLkKGNGkvUsGt
	9XK2/CYiXyGKcIFnD6kRB5vd5ke1X9T7khwxMkWqH/kj1H0hkMUb5gb6W7m7KWDI/rCdk2b9Z3q
	JvgSDYIcowN7PGFPQZbYzX2nnOyi3wMeDsH57fiw720chCTj1VHoqlmE0hAZ1BFM=
X-Received: by 2002:a05:6a00:244a:b0:847:9ce5:d293 with SMTP id d2e1a72fcca58-8484301f0a4mr6961545b3a.24.1783599853616;
        Thu, 09 Jul 2026 05:24:13 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8484f973c4bsm1672517b3a.25.2026.07.09.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:24:11 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 4/4] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Thu,  9 Jul 2026 20:23:37 +0800
Message-ID: <20260709122337.17417-5-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709122337.17417-1-qby140326@gmail.com>
References: <20260709122337.17417-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101 (Fn-lock disabled state)
- 0x00012101 (Fn-lock enabled state)

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index cbe118bbe428..7d8a3be5ec68 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -634,6 +634,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0),
 	{ KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0),
 	{ KEY_ASSISTANT } },
-- 
2.55.0

