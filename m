Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BDD46C83F
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467796; cv=none; b=gA/qhR3k2bHJ9eUXF5xXH8tlbPy1/GldXvnsFdLQ56SC+fWJyt5Tg4OHC2Fq253x7xiNijxULuUGOO4qg27y5AwMHtMoHdZejMD8Fn641pBUeDosB8NRfMNEW9cFZA51Ll0QyQ9oRWcpXL5bNayMO+cwvAwJ2dEskGAwUJY3/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467796; c=relaxed/simple;
	bh=zU05OYynPYFbwF2vZq0gF9lGn3ZbFTGrMnzuOj9sYFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g60Dry+B4S0LqeXPMai7N0YHetdCuHt5agax/39EfpUgex0lDJ5lJRF7UA7jGY0tcnrXnKAH5Q8FRyrz/1Op8+DpWVjKNaI+Z0FqZeASRsVNVrZUi/ZQLY0L7sqceaMVTdIMrzCLylK2Ehu5OSFTLP7jL7ONnZjJnXOZVPPEI0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nS5wmZHS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nS5wmZHS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a01933b584so28142655e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2026 06:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791467793; x=1792072593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpFf7kKepc+cEYa2iUeL+3Vreuqq8d5j5p27iCak5pY=;
        b=nS5wmZHSakZuL6SVs/U5LA6ViqpHCFm6QEGankIvS7F7DHaMmlmGJjqw3O1We1aNoC
         bR9/OFNcizIfDlZwGxuDJLFcgzMJ04Aual7nieV66qn0jH6rUm2ujq0hTU7WdMitA2rj
         Ny5vcmQy8YQJkEn6DpRj9SkSxeTL6fKn3S/jXeZxdzjN6U27LpV1G+9Zw4zHwsj9RvEk
         GLlhtvsZsaQgqeGxQjM0aAY0/VCXofqcF4+B4myE4NsOS5H6hXON4PQghbfjfjwvYFtH
         XAodB2VZzfXwsbxqCbZwRvEVdsym64pMglugyKPaipARqUJdSsW3Ss+UjeSpb8gizm3Z
         0S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791467793; x=1792072593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gpFf7kKepc+cEYa2iUeL+3Vreuqq8d5j5p27iCak5pY=;
        b=F2DechW5V3uByexwFbuE+hCxqbkYVDa2l1MaOdnBn/l/cvRe9Jguc+5PuUjRdfnSI/
         N5GAOY5UzIahIlNzbbvbfxNlyyZfyQ/hEnPWc2kftYBB12qvUt5YhY5Vhp4dY2sI3zJY
         bZujxDbL//vch0/4L0WT5TsxCZi3/lYYIFxsgBEAljBRdYLoek1qvN9XYxBywFbGaVZb
         meuLr4OZ29QdW4DK2ek+cKnJk9hP7U8d+rCbsk5hWd7UmGGybkssM+2XpVjluVCLgY6Z
         WrfGKNx2mK0FEWOK60VGfaessS9tmvz8Xis7IfQSOM9osoNj7Cl0Q0iko6xwHWYoEwBp
         EjVw==
X-Forwarded-Encrypted: i=1; AKwUvBwH86Fo+AdF8sP3SUwevS2bAksTe9VZ+KwSlD/K7X9nECYfi2BuGJotvlih4BeVHU2rLoQguudTMU1q8omEls70giMK@vger.kernel.org
X-Gm-Message-State: AFuF++mPzGnxBYxCuVyut4kXLxA8fFUOoFx6Z7YtGSUGD5QjyFPTE7iF
	sl3peXOdPmYK6M51zuFzRdJcVDid3vpdQB440QLzyTOX/03+nDUNV0dG
X-Gm-Gg: AYBFou2i4bUh4zNUbbw07JQFGVeOEb1tL00b55q3Gu/WK6NOiy+JVf/9n0x42g6joMY
	y732Ia17G1QYGxdA8zmkxRJMqH5MFpyEo8oMtjjkImvJn+AU7bBCtMNfKlQF7sUibokUEFm0D+n
	8kTVHWoH6v7S8mgv0rovRxjyNwkcXfvMqQCvkOAQJt2iwzcT0uca252QyGLZtV+mV0959k5zuan
	ee65p0lPNLy1t4yiDwCYjhWgnDzG79/Ww+c6oXDYfxwvmzQVi7YZt5vTG17M/+/SN1pyxU53c/8
	yIZSTUmIvSPEm3CBXXWiVhCGKNCZDiKIzJTQShlCxS01a2cUbucbMn/tVSoO8u0MWZaYYA/6Dx5
	bz9dy4vzmay/VVUudRgmHMcDQCB/QANjiCu/l+y9tvX/nZ9AnufMSWxp3/1b/z4QEwjaDd4lEZr
	fn4qG0JLF1mWd/jgclPPLrMMg34b40ZM494uJ7y+WzmxSmUQGIG5xSVk/eEDBn/QgjMvLuIOThr
	oHJlD80Sg==
X-Received: by 2002:a05:600c:a088:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4a180313b89mr93347465e9.5.1791467792826;
        Thu, 08 Oct 2026 06:56:32 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a184260f9asm76512765e9.0.2026.10.08.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:56:32 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	Christoffer Sandberg <cs@tuxedo.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH v3 1/2] platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
Date: Thu,  8 Oct 2026 14:56:23 +0100
Message-ID: <20261008135624.3520849-2-amad3v@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008135624.3520849-1-amad3v@gmail.com>
References: <20261008135624.3520849-1-amad3v@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
but reports sys_vendor "PCSpecialist" and board name "X6FR57TY", so the
existing entry does not match it. Use the Stellaris 16 Gen7 AMD feature
set.

Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
---
Changes in v3:
- Rebased on for-next; the feature set is now named
  gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor (Ilpo).

Changes in v2:
- Use the existing Stellaris 16 Gen7 AMD feature set (charging profiles)
  instead of a separate descriptor with the percentage charge limit.

 drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 07b69629b..dc9b73afd 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -3451,6 +3451,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
+	{
+		.ident = "PCSpecialist Recoil 16 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PCSpecialist"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR57TY"),
+		},
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
+	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
 		.matches = {
-- 
2.56.0

