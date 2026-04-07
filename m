Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A5122083
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 19:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588826; cv=none; b=TlkwDIYvr41ywe1Vxx+h8o6ADAap0Br4b79CVNMeROhJKvGyoVHGEuytwvZ0ZaGMQbCWWSHOkiBbiM0hCDrU9GmU3LpDg3X9We6bFcFQZN3APpPNYD+WVZQQZoe+57KN7JQ6/Nlz83+G4YHJ+DaMdq/4P5w/wG40mkUD4FBQpJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588826; c=relaxed/simple;
	bh=uhFg3+9ZgdJm9nasdum5F6EMA45wwyoRtQZ6fZ/mEQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=earZ8OhHEH/pmZlQ09Rp5W20fLmqY8ynfROptVo6qNpJHn1F/8pSng4GjTAWX4oB+iVNkgSbBJFgdKQR/QyuhCVRL7MHTz8FgLzi08nINGlsikXjJZYksq0dclitCiAte6Y3gD/SoeJRwlMVMZf73LsFJbIEIq0KEQd+hF9B8/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6VFtn+Y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6VFtn+Y"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so39830875e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Apr 2026 12:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775588822; x=1776193622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ba51T9mIu5soKJaKA7rM/Odtxo9E0170cndvfoVPno=;
        b=W6VFtn+YEXipjHqx9V258lU7daDGI6+MUy5hKDeJzf/8WrtO91XU647aV0+Csn2LkL
         ok9ldHk0lGxGqtoW7jNLdmkQ7mDyKVu1e2PXcKBFZZVi0m0qXUA/MxTfCPFjOPEONwH3
         6M9nkOg1x47Hdn0NnqXixE/fIsOZJVQ3PCJaX+KztTMN8sSgaysZvhJAW3r4deYzfZq3
         5EeKczOFGyUkbWxax9sM/WOXoHtGk3IYCyYuKZ5GlmUFBSkvJXgehV3XFxdlPoyMY1l4
         ZW77WMe4+WcLL7GgXoVfSIrqPqiGtDW8u4iNp+/ysM7C1ftq1qEM1exES6tBEgTbYxHi
         1Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775588822; x=1776193622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Ba51T9mIu5soKJaKA7rM/Odtxo9E0170cndvfoVPno=;
        b=pWPE4pmdaGCeyHmoY5jdZOvKqd3Qg6ZqegAL2pyWmRBHMWveexAEn8k+9GvDQu4t3K
         zfhH8WM001nD738YTFvQKRwVnV+4b3jkRWT/Kw5pROOo4G7mFDenbkVTfqBR8mAIMMx+
         +YKHUCRPosO0DPK0g7bPIfzIjtRa2K5vI9giNHvc9EwZxqdBb2TfyJ2e7Cc/jfFxfAqP
         XgrXA+vGpAtywY6L2RnQQlt2+43+h6lRwn+T7zf6v00rYtocrm8loYlVdY6lOkf5yeTY
         A2f2p2QE9i6QkThHAROEYUw4Xucq/qOHDkxdOhTE+T2d6voJMsIcsiTOVy34IDLNYVvV
         ktoA==
X-Forwarded-Encrypted: i=1; AJvYcCVI8tnDMcGKWOZ0a1wSEy0P3XbfdTm6y/f2myxJJB7jT4T1xxoFGmpNW5pQ1KOGEMK3QLdU1WhSddCSNpjCAJdN3RZX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ypb2/A0un/cnLFeRCpsDKqKJE4uLNEX2AUhsJFoHh6TQRpVi
	qXyz0fUxE/4IEq1E6NUwFRIjZY0oS1rWgHnE/WdabeTZcHg6EeFPzWx+
X-Gm-Gg: AeBDieuUT2VByBTibahONXWzPH+/Orh1uCooya/xv6rPBoLGxcderkKjyzumQ8tERg5
	Bx8LEH1W/ahg5hCqzB9avN98aM5C6vPua60ffOM2+glgl3dEjbiErcHgD+erxIDQzLxCJmSFXlX
	SAMy+RX7D7kCEK7EglvKcMQBUQp68uPIfSXurw7JF3f07SLJXDk/jGy0ieZCvF3VOIes47+PCvF
	tq6uYscjzbRGsB0RGgcEBnaO11LkJXy6UgmzzmnNJ5GIAQ2o5ksYq2u3Vu2+EAgmMXvz+WIHQHR
	zkvazia7eCMJQApR+8NEi0yoI4LeI0LuzZ7boN49fiFrS2TurQ1qkKyx2YjFJr7SizwT1rMqgFz
	l3KG3Io+rVXbrrfqRfAmOxTuvradYWEUBSecLhoe+rPe0AilhXC8P+gli85eCJdR0zpxgarLGWM
	ZFf/+TFkb644iCNpSyZQNt
X-Received: by 2002:a05:600c:8b03:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488997d3188mr261053425e9.23.1775588822338;
        Tue, 07 Apr 2026 12:07:02 -0700 (PDT)
Received: from MEROWN ([85.93.99.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c524fecasm12983465e9.1.2026.04.07.12.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 12:07:01 -0700 (PDT)
From: Daniil Bulgar <bulgardaniil18@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniil Bulgar <bulgardaniil18@gmail.com>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: remove obsolete TODO comment
Date: Tue,  7 Apr 2026 21:05:46 +0200
Message-ID: <20260407190546.109900-1-bulgardaniil18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e4723a5a-0bdd-4062-af38-ca5f4a4f6d1d@app.fastmail.com>
References: <e4723a5a-0bdd-4062-af38-ca5f4a4f6d1d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes the obsolete TODO comment regarding fan speed
presets in fan_write_cmd_speed. After discussion with the
maintainers, it was decided that fixed presets (low/medium/high)
are not suitable due to platform-specific variations.

Signed-off-by: Daniil Bulgar <bulgardaniil18@gmail.com>
---
v2:
 - Removed the preset implementation as requested by Mark Pearson
   and only removed the TODO comment.
v1: 
 - Initial attempt to implement low/medium/high presets.
 
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 8982d92df..75e141304 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -9249,9 +9249,6 @@ static int fan_write_cmd_speed(const char *cmd, int *rc)
 {
 	int speed;
 
-	/* TODO:
-	 * Support speed <low> <medium> <high> ? */
-
 	if (sscanf(cmd, "speed %d", &speed) != 1)
 		return 0;
 
-- 
2.53.0

