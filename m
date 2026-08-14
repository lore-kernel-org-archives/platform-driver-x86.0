Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E769D48A8B9
	for <platform-driver-x86@vger.kernel.org>; Fri, 14 Aug 2026 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727622; cv=none; b=CsjRXXdIRpi0XVx6+YLK77O9oPUpCiS8Aic995+TPAAFvLNjg9LlTQ4DrcI64PDjhFnj5GZCG7UHIiApVeqKFfzXfgjP81UxyC4Xo0rGXwqa9GcvROCuRBBECVUgesEcxTHR1N3AbrARC06cAxVuWaID2Fi+RR7toyU5qodf9Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727622; c=relaxed/simple;
	bh=FeqbqNP3zLNoEG6b+EyVcihft2lb5wII998d67nc8ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUvIK6r/+mRzI7F86tdrJwitPTnYc95KX0eFW0jGHjDKUiu7voNp5HGie4FmFIouX5bVlRTs5lvr8G8VZJ7QtK7vvm/ExEpzdFcZhaA3PCjjjrzwjG5fDNHS0GIWp4gngIwznaqMyrgRjsSxvZuNoKGbhE01BmLEaG6QzgTvRmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUQz+QZh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUQz+QZh"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so1077609e87.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Aug 2026 10:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786727619; x=1787332419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJBvH/RhEcaopV2aPOOG9XqHhvKgYhLc4QE9wD0XMC8=;
        b=cUQz+QZhHn4psLkVYndIy1hoFhaM3/bxz4oiZf8L5E1LL5fCwafngWeoGUxMl31Ob8
         aNEj//E15UB8dwFhW5Cay28oGhBWhGqWxDrDoZtesfKymHfMSooA2pjnrrbB0KQw6i/r
         IFGBg2Nd7Zy3LKn0U1z/2CfHOSMfyGv/2jQYwhrXjal2oy0oVk/RYisFtdivgKGA1Z0b
         OTBgZkYkU1cKg5iBfUETVwtMQ+nBpQKUZvjANVBz3BV3tz0s8/iYBHqjVpE9vEL9ydf1
         jtuQK3YVSyE1JtLEUz8uG84LEniyiq3Yo/kFmsOhIh9iko9KqXDoQwV6qSZd1Dl58W6r
         7siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786727619; x=1787332419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJBvH/RhEcaopV2aPOOG9XqHhvKgYhLc4QE9wD0XMC8=;
        b=Qi/f3NBUJIQyQOOJloK1pBXJLa9/ZUfvSfa0BpeT5yL+pg3MZE9qEHpaM9Dgfy0JQs
         yvCmW0Lgyk+0HfqMwtEuGcr3rFxQwwiZFPvC6Yxh4aX4fQidtTBNlRrBVBFhxYi0IliU
         lEMScfhOg1P0toaniivyeQH1NQHz9eLDUTJVvu2Bv96iEnVLMFmFS9W8L1sBIMujsbs9
         P3SRR48VnQbJywszpG++taCTCiY5R8p1BmCSiXjUgknR7T6kEp7lXWVjcm+Qfxo9Dwm8
         lucyof2uf/FdldAhduXZNIG0+ssRgZxjMSR/azU3yF8S73pQuOlg9Y53iEqbdiI+wS49
         786Q==
X-Gm-Message-State: AOJu0Yxa0l1k1afeYi1ZCD2cSZwIPL/pAKwP4uvzUBId87/Je7tioj+C
	q8kUoCykbFtIJpNTepmT3inVZXO14d2P6lHj7yvh+9WIQKeBFzRFoJaO
X-Gm-Gg: AR+sD113ermvID2iYgGDwdGOWNCs85OBBsIdANwOcmSwXa+jItzs0lCYtG/grOWBE5H
	imVaNLierl0sJlWz7ROtNVHLU3XjcL7Vp6YoBuaezaEF6Wd/UItc9ghMlc6O+oa/2npjBn3ac5h
	u08QVU5uT0Z31zqLmtdiLpYfhUBCFAagvqFI8uYZ/1ejKZyssgz8A2c3SOzrg/8P04A0f4LBEDv
	E66csxJ3FnVmm+/NrCzEnrhh1kkjxtoikYt7jpGGf8eGXpWZRCV+2Susf7APTlp3nablyDlBlfW
	+vrm+j39z3LWENN5SkqMjgxcX4SAWs8W7usAUt+8pHYDatmeOlb/58P1gbxDyC1bpXAEzuqtuK8
	it5nfjwDNZYtqEumisw6MgHjJWL3BVyltpQCRlL0vy59HfibBDTixRT8/WSS5JsL3X667OWJwFM
	NpGF9mp4Hzujhl58dXASmV9S5f2xFwIWBaoBoApUdZ+av3jsujgyCx7d4AWTvv7xo=
X-Received: by 2002:ac2:4e08:0:b0:5b4:5f6b:d43e with SMTP id 2adb3069b0e04-5b45f6bde40mr158668e87.14.1786727618882;
        Fri, 14 Aug 2026 10:13:38 -0700 (PDT)
Received: from archlinux ([178.207.93.112])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458bed9c1sm663266e87.47.2026.08.14.10.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 10:13:38 -0700 (PDT)
From: Ruzal Daminov <daminovruzal7@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruzal Daminov <daminovruzal7@gmail.com>
Subject: [PATCH 2/2] platform/x86: huawei-wmi: add modern Honor MagicBook hotkeys
Date: Fri, 14 Aug 2026 20:13:24 +0300
Message-ID: <20260814171324.16727-1-daminovruzal7@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Honor MagicBook laptops (e.g. FMI-76 / X14 / X16 Plus series) use the
ACPI WMI interface (GUID 0xA0) with modern function key scancodes.

Add the missing keycodes to huawei_wmi_keymap[]:
 - 0x0287: Mic mute key (Fn+F7) -> KEY_MICMUTE
 - 0x0288: Camera toggle (Fn+F8) -> KEY_CAMERA
 - 0x028a: Honor Connect / Share (Fn+F10) -> KEY_CONFIG
 - 0x028b: YOYO AI Assistant (Fn+F11) -> KEY_VOICECOMMAND
 - 0x028e: Screenshot key (Fn+F12) -> KEY_PRINT

Tested on Honor MagicBook X14 Plus (FMI-76, AMD Ryzen 8845HS).

Signed-off-by: Ruzal Daminov <daminovruzal7@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 93cca17fd..d5f77fb68 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -72,6 +72,12 @@ struct huawei_wmi {
 static struct huawei_wmi *huawei_wmi;
 
 static const struct key_entry huawei_wmi_keymap[] = {
+	{ KE_KEY, 0x0287, { KEY_MICMUTE } },
+	{ KE_KEY, 0x0288, { KEY_CAMERA } },              /* Fn+F8: Camera */
+	{ KE_KEY, 0x028a, { KEY_CONFIG } },              /* Fn+F10: Honor Connect */
+	{ KE_KEY, 0x028b, { KEY_VOICECOMMAND } },        /* Fn+F11: YOYO AI */
+	{ KE_KEY, 0x028e, { KEY_PRINT } },               /* Fn+F12: Screenshot */
+
 	{ KE_KEY,    0x281, { KEY_BRIGHTNESSDOWN } },
 	{ KE_KEY,    0x282, { KEY_BRIGHTNESSUP } },
 	{ KE_KEY,    0x284, { KEY_MUTE } },
-- 
2.55.0

