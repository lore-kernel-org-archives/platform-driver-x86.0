Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5385648B367
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781040817; cv=none; b=PB9OU5UJjZ07/ay9Dgttk3FAys5Sm3BrQlMu2mN+f3RQhsTJqoh2m+WEObW9/dZc2j1QTgHqCaiBH2bMQrcB532inh8C0y5COru2NWqJI7NboQumizC1B9DRqeNrHGY0UElmMpQpVFmEKn5dbVI3kdIlrUMlGgq/apwP+0Yr6GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781040817; c=relaxed/simple;
	bh=m4UAdPRwefNDVYeDao4kkz7JiY2h/cyn5SWZMZrqMNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcOITWTNtaH1qM7BLCazhFBhyTGdbEhnjvdZvS9o7WeczPBcb+zW1ozskQDyKAaHWlrWCALguzoW7Q5rQSf9fZ91xCx9mEpcyBSca/CYey6JETfsUr/Oy4T40kUf6rIqlddgan4haqhqrmilhOd8DXGyIyrxiJghaLpxiba+xdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3oex9JF; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3oex9JF"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so38927615e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Jun 2026 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781040813; x=1781645613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZBJjCrkZ3RzSyjUlLWrVA7bCuKkhZfMdp7PMkk/Ds0=;
        b=Z3oex9JFttgf0Phgzq3dL08h1Pm6jD2b7xCvvd5/UkZtsRXHWDyNkpwr9FWgc+uHAO
         NbT+oO3D5i0H0ss5RIclGptpgbDLuOUV397HoW8roJG7sII/b95fyl4kyK+KTOyfqav+
         gYfT2qZ3+7cgoyAx11rSK1Xb2DHhAcFE9oFoFHBbK1x+vV1ii1zPoW+M0CPwuwzgHXhV
         OuY2REQEUC2oF8uC0s2scNYxm3Y5xpn9XDjpHj6St37S4ijV2tuxX+J4gQStpjLcf9AS
         Muy5xEP4w9aDtA1wwnTAG3Uaxix85sbARO5pyrAoOYMUWdcWESTaQxPQ4hecFd7sWBj1
         00mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781040813; x=1781645613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZBJjCrkZ3RzSyjUlLWrVA7bCuKkhZfMdp7PMkk/Ds0=;
        b=iXeLM5609iQvrQGPla5Y/HfXeXv3DgZWi281qWHnpf2uJzfS9vRKINwrxgKqI7Kwat
         Jk2uD2m72licrWwV29tejy2OoVYjWNEUD6Kv6LCJoRf0F3+3kcmv0JCkzpDS78csPO9k
         1ExUzet7Iw8sFzFE+o56HQnmu0tm1z2fl76G1Dwl3uIFZvXFhSEk0KacvizgvOesEPfx
         mIuUHk56HCEekQiCCUEjq/RVGpXxKvRN/7AsHRQJNvUY0vxIrn9mYtgxfW6zInqw1JLv
         6OE3zV82td6Yyv4zRVKJltIQHeXeOjVHZ4AnJaCZCkIjRYp31uw6r2cPFBl34j7sQDLt
         jY6A==
X-Gm-Message-State: AOJu0Yy95Rjwv7x/M0sE5idC5PY9FJWDhE7PEK8gqFX8FQVaol0fEa4n
	8r86PssZkPqs8mS63awf4QEIzgpmY1sNb7JADRVhFNZ5AHgGnqmH6UBJh9ALYcI1PG8jKg==
X-Gm-Gg: Acq92OE3x5Kky/9VoOnclE1siT8D/n8DpXOA7RU7Mhwb4sOJpb8Jvp/ex3R0iugXWE/
	QFyaTyK2ae3ZQCglOBqDK0+ytIg2KWpJ0ok1z5pOOmtrxyt9+BXCI3lNqV/XcUcpiwF5WHN05d2
	QE1cqEyTkzs1AArlkSahNaZhQZexMwLS/RGEINUOjqQa9uFjrGhE95ixcbOVBn/jEDz5cWIlrix
	SC1146+25DKvOONMlM3p6HuUL7hTE8SimznExsP0YGDCZhrDWh/K6NS/7PWlVR73376nBREJ9tS
	lN5DjujwSmKV0sdd/+EzuRtyrNmEdnI00sFpEhOw3f87r6WyBj/o2oZEGGQsmTUOiZZN/dSLPAZ
	GLenfWNCAQIv6vwdK4kYqnfI9+1c/0WflVtK0W3AY45PDlnS/BdMkXjSwNltdviQMtLR49AFvNP
	Aox8bbZt1tgBZdC76KgZi5BqaYz4KZcA==
X-Received: by 2002:a05:600c:45c4:b0:490:4ee0:82ff with SMTP id 5b1f17b1804b1-490c25fcfafmr379176425e9.27.1781040813317;
        Tue, 09 Jun 2026 14:33:33 -0700 (PDT)
Received: from hp ([147.12.255.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm591128825e9.1.2026.06.09.14.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:33:32 -0700 (PDT)
Sender: Nikolay Metchev <nikolaymetchevhomeassistant@gmail.com>
From: Nikolay Metchev <nikolaymetchev@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alex Hung <alexhung@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikolay Metchev <nikolaymetchev@gmail.com>
Subject: [PATCH v2] platform/x86: intel-hid: Add HP ProBook x360 440 G1 to button_array_table
Date: Tue,  9 Jun 2026 22:33:09 +0100
Message-ID: <20260609213309.445019-1-nikolaymetchev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <6f0e5451-0ce5-d4c2-8ade-3489701c9df6@linux.intel.com>
References: <6f0e5451-0ce5-d4c2-8ade-3489701c9df6@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The volume rocker buttons on the HP ProBook x360 440 G1 convertible emit
events 0xc4-0xc7 via the intel-hid ACPI device (INT33D5). These codes are
only present in intel_array_keymap, which is used when the "5 button
array" input device exists. On this machine button_array_present()
returns false because the firmware does not advertise the array through
the HEBC method, so notify_handler() routes the events to a NULL
priv->array and they are dropped as "unknown event 0xc4". As a result
the side volume keys do nothing.

Add the machine to button_array_table so the array device is created and
the volume rocker emits KEY_VOLUMEUP / KEY_VOLUMEDOWN. This is equivalent
to booting with the enable_5_button_array=1 module parameter, which was
used to confirm the fix on the affected hardware.

Signed-off-by: Nikolay Metchev <nikolaymetchev@gmail.com>
---
Changes since v1:
- Resend the patch inline instead of as an attachment, as requested.
- No code changes.

 drivers/platform/x86/intel/hid.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 085093506..73874d436 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -156,6 +156,13 @@ static const struct dmi_system_id button_array_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go 4"),
 		},
 	},
+	{
+		.ident = "HP ProBook x360 440 G1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP ProBook x360 440 G1"),
+		},
+	},
 	{ }
 };
 
-- 
2.54.0

