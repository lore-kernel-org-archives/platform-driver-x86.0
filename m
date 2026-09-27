Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CE326E71E
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Sep 2026 01:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790473240; cv=none; b=mCfncfdjB6TaLqv6ieayhKukdAwuXubFVJiX4lZix8b6OzzCClZdCxWo92T9mYZbpyM0ZtZwCIk3G+zuGphXVcTiWKm2WN/GMEwoazmsLZNpWazzVNMmTXqHgkVB9lMZt1PGU07wmxjQDOI/iqICLms5MNvIpadG+2WM6tZHQFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790473240; c=relaxed/simple;
	bh=np1+UTDQL2ZRl08AEqQ1unEzN5csDoYIz3INoUK+B2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQPE10Y8G4vdquVZMdTRRuVMbiurqmS/GqGnFtF9eSwbJlsOzU8DbMqy61/B92W6OOA5aCmvKHn7PvAsB+W+0YRTrVN9TbSUyne2+4cNEpIejc7FuzFjswovUaCKzVGGqvCqqT9PDES8xGQxXeYwT+um4AYRPOhrf9FjERnUwF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwOSN0gi; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwOSN0gi"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48879d4fd8aso1082664f8f.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 18:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790473236; x=1791078036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDYuY7ezdVWq8b8O/Y4mNf/nduIcrzSrBVm3+9ayIgA=;
        b=JwOSN0gixqlGCa0Tk9vcfdx/3W48CtzjcNriL+lCWshMOf3HJ7Mn/Y2ruRxS4/vkM/
         h3oXJNgnazmVk5e7wMvz5Gn9ZHUbIvVxJ7lasIRW12iNR6GJncQDvtN7JKjrb8ojDwAe
         cAo2L9U9bH4Mgz0y/u5olrPnsDiH06vUN9Nf6hNzBeX6BD5nXlVpp9Ruapw07+Qsw4Hi
         sEYgldL24rFcGrTFvdhJkW6aJTdQ90ZE6K/AV80LBIigMr4eB2BY0MJqcY0syrUshgfV
         HZfpJIeQK/602wRjJ9kGfg+USQXclGbn4cyOKkIVO0OuX+X5pQuo+C40J8ssEZpLC+cg
         oi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790473236; x=1791078036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDYuY7ezdVWq8b8O/Y4mNf/nduIcrzSrBVm3+9ayIgA=;
        b=Kl8nzwYuKyCLLK0BdwJj1fwVvxysiyPMvYWluqFFww09OQorJmWhD+ZnmXanIHhoDB
         zQf6LgB1oGSGWy+e6ywEBgw+H9jqVfzXIc+QJHGkuUFjev6v0+m4UItlXb+hVMm8Nk6I
         3sskT7t2SlTR2vUeYr8a4/EjQH2eWxO3npquSK8x8yQuGL6wPor5pTst6uxcfowYZWRL
         vgLB3mMSLb65gJvh5jYg+CH8Hg/wGFZ+2HNCdYte4qig6MzFAq4c2yQkoM9oj5hMv2FZ
         5WVkLrn1mpzAjqGoqfNoIMVFDey9uZIqnoEZam3qy/U7xy8vfFmkZR+Nt9w7tlYhulsf
         1kJw==
X-Gm-Message-State: AFuF++mTKxMK1W/hq2xyPQTUPtVpxVBrxTZ0JO/yzdLt/9VGvROaDyvL
	w1iHGOCThT5X0rnxbmeJeXZDO34GoMRQAB7ytcTnD6wYN/6O5UxiWsZh22ZI1Q==
X-Gm-Gg: AYBFou13r4GmmbJPVGC0l2Kei9kJRev+yGH8oVD2+wMM82nrRnerLZbM9qlQnHWqfA6
	qY1po/lmc69PlG6lkBcwghBWAaVf8EFKIFGY7hZjUqMPZHSgnZo0UWwqZ21/3sfaTVePowd510u
	QXYx4wWeZBCFpVkTambrFWedrVS/H8j+ELhHTCadncSxkuygr/G4XeVjZ6dLG1sF+6hAtOqCYZx
	5NdC2O9XCnf4e0s+XTY/5CYwxXZSek+GQf0A2j7vMAukZ3QMz8bx5Eci6Zss4nUf82bOqcEuBxz
	oxRHZu2dkn/u4UWRpL1r6T+MiEUzBbLOXiF5lcbhNC+t/bisZNA5OzYESrmxukbyMKxS1XaoF5U
	3MGNh8eZo2upCMGSXd0+faJvQgml1eU9GoYJ4W2fLrXUxccdoZJnlFizpVy36tG3Coj/OPb7eP4
	jL0hUgcQGHEvUSUDFYxA55rCjxshHtAIQ+VWRN/uNgTDwF7gatihcXNocjU8zg2DVHaLpCLxac6
	baAwWBy3Q==
X-Received: by 2002:a05:600c:4689:b0:49f:fe48:d171 with SMTP id 5b1f17b1804b1-49ffe48d27amr38924965e9.35.1790473236417;
        Sat, 26 Sep 2026 18:40:36 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee9203f0sm114736595e9.1.2026.09.26.18.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:40:36 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH v2 2/2] platform/x86: uniwill-laptop: Map the screen rotation key
Date: Sun, 27 Sep 2026 02:40:31 +0100
Message-ID: <20260927014031.3465252-3-amad3v@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927014031.3465252-1-amad3v@gmail.com>
References: <20260927014031.3465252-1-amad3v@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD / TUXEDO Stellaris 16 Gen7 chassis has an
"Sc" key next to F12, meant to rotate the lay-flat screen by 180 degrees.
It reports WMI event 0xD0, which is currently reported as KEY_UNKNOWN.
Map it to KEY_ROTATE_DISPLAY.

Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
Changes in v2:
- Added Reviewed-by. tuxedo-drivers (4.24.0) has no entry for event 0xD0
  in its Uniwill keymap; there it only reaches the "Unknown code" debug
  message.

 drivers/platform/x86/uniwill/uniwill-acpi.c | 3 +++
 drivers/platform/x86/uniwill/uniwill-wmi.h  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7d39e97fa..2f440925d 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -506,6 +506,9 @@ static const struct key_entry uniwill_keymap[] = {
 	/* Reported when the user wants to toggle the webcam */
 	{ KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN }},
 
+	/* Reported when the user wants to rotate the (lay-flat) screen by 180 degrees */
+	{ KE_KEY,       UNIWILL_OSD_ROTATE_SCREEN,              { KEY_ROTATE_DISPLAY }},
+
 	{ KE_END }
 };
 
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform/x86/uniwill/uniwill-wmi.h
index b25b2f312..1b6f650c4 100644
--- a/drivers/platform/x86/uniwill/uniwill-wmi.h
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
@@ -117,6 +117,9 @@
 
 #define UNIWILL_OSD_WEBCAM_TOGGLE		0xCF
 
+/* "Sc" key next to F12 on the PCSpecialist Recoil 16 / Stellaris 16 Gen7 */
+#define UNIWILL_OSD_ROTATE_SCREEN		0xD0
+
 #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
 
 struct device;
-- 
2.55.0

