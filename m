Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCDF37F73A
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 16:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439945; cv=none; b=mpe8x5yk1xxp020r6PXEMf1kxNOgHEMGa9iXzBm3YNC8l531jsk9jz7qUHMKgGxr/lVyXVZwS7AcLPyHgZBJ7wNscMLNl1CyPOIZRdSpKSTq14Mjt5JVNl0XMO42c4Gw2CqcZdB+LEu37cDOjyPCv/mZxFixLGDi1gfKayqSKHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439945; c=relaxed/simple;
	bh=V3ZllMYRxRSz7OEVR6Ox4snTCmgHokWNBNQgaorQTw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TAVf9cPG55+nvlV9gEHTj9C+XIE2BNGldywF85CvOBwYBxExHq+Kt2mpEfmcz0Rw04ENrKK23IDnH5gddJ2r9SlC7jZilwRSKrX0vsQvukGi1l+Wfk+i6IZjOPWTK/Ww/qtlgaI4tBRH54AcUTRUyZGnb8pY/+gtax8y8OklfSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohRqhuNx; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohRqhuNx"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-530fa0716f6so21361231cf.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439932; x=1791044732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ClV361TQ2pqfwGMdnIThGuqNSY7+Osp+o669BRRfF4M=;
        b=ohRqhuNx2uKib7NyKetJWS0X9Mru7IRACtvkkrLFY5nvOZ6FXBpbkuHm7yd+ghcf9Z
         0jXttxo2mVSJv55omaK4x26tf/LfQ/DHYUek8x5H2YG4N/q1rY6Jyzy1iwsTuv4CXl6H
         JltEKRckjJYhYs1D7XG0BqCmBN6RWQzZgmheJu3Zvel2BASBU6ObXZlrEbg8zHgCjAUU
         +PIIMlNXyBtb7+jGyFt0+PAKJfNRrg2YXL01IlmyzEhv0yWdAjSFRVHnwzbevsdwczYR
         Jz3ZDxgh8oy7LOkxEzOPK+QPm60kk/lbAcpa3e4N1Ps50pL5CY/mDs6NPGoYJxFbe4Y2
         6dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439932; x=1791044732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClV361TQ2pqfwGMdnIThGuqNSY7+Osp+o669BRRfF4M=;
        b=1AQZcXj9gr8CIvrj/GUWdXKGcnAT2X2TVD9RfeifYNwPhAHVgdJe7q4slg9yypOaI6
         2WeW3K+ZuAoNgP2ggNN5odSowGuUGBhsrQrcRS7+KmtvM/2+lXMsQJXY/z4oUo7d4tcn
         f2/mh+tUyp3ICmVZrGKJB3iZSq11DUgQ2NbckBxsd0rv6mxtQstxbBmbUTZJOYBFko/W
         P1FxQYXuOnZM29XE0t347GgF6HZxEyni/9M02GPOAC4kkDAHGU/dzxAaYO4b2wnXeadf
         71eLmx/AWBmWD0cmJa7qIWHZyZ+PakM1pJ0E6RLT2aR9M4vFJrvpCgOhmpjyaMvJ6a47
         qXPw==
X-Forwarded-Encrypted: i=1; AKwUvBxGTJHpFthbflDxx4g7UUhUTCIxTcC/3gJD8sLLb7cVRW1KHfmHU5u4Mljiy8e7ZtQDvWLuDxVhN5H8FfQt3USv4afQ@vger.kernel.org
X-Gm-Message-State: AFuF++nww4TZgVBsu7n5kU9wAIXcoHPeiXlUBbW8/GRMPyhQ7NwheLWJ
	/8QBHAVIHA3TKTbG51XO+5GIOB6cvJLcdLYe7ijuLx9cuGtCtUed4IPB
X-Gm-Gg: AYBFou2+dllkc4zht6TaWJFQvhL2pXZ7aY4QADzPc4PRzyLkPRVwdmHQhjDD8rC0Q9d
	Bj4NdO/rrxBh+4w4aCzJjQ1U6h+7hq4gdhYiD+Ir7Xe7+Z9yixdwKayC8NLkVKewUipMpxZ0xr3
	PSpHIUf02C0SXVfja3RjJI7Wd/Ek1Vuo3qDNvJbNZajJQuQWKEUwg4FnXxiozmLqRTREp6cvpVg
	kuI0rHKWSUZ1xxKyQsXvAXtmcrWPk+qi2tjwB0XHcMBKxskFFAXPoKa1SXym6lslDMtsWGrXQTc
	9ije9UGY59Wwy2D+Rpsx2a7h8TPlmsNRl9zQoiXxrx4pQt87iMtPXTe35SLiPxf6T8srnbFGnEE
	ZrzpTfvvnGbWKq9emCyfCos7iYEbGJWFaiJEm1wtfa9EXPWBE4JP14RKIRVF5XtphF8dzppr95h
	ue6KeMyaDWNmg+z0uOieyGcDHNkdHcWw4Sj1jLU7KYVcIPLDvFW6mt56JuhTOGDPsBXfzpcP6Z1
	K9Cjn/1TmnAJrKZbsnB5nP1EAqYWD9G4d72QFMSBfcPoroU
X-Received: by 2002:ac8:5f88:0:b0:533:2985:eae with SMTP id d75a77b69052e-53329851318mr33634181cf.31.1790439931933;
        Sat, 26 Sep 2026 09:25:31 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332238bdfasm20896291cf.18.2026.09.26.09.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:31 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: fix typos in comments
Date: Sat, 26 Sep 2026 12:25:28 -0400
Message-ID: <20260926162528.25365-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various spelling mistakes in comments found by codespell.

Assisted-by: Claude:claude-opus-5-5 codespell
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1225b01ed14d..ee831e6b8fbe 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2108,7 +2108,7 @@ static int hotkey_mask_set(u32 mask)
 	}
 
 	/*
-	 * We *must* make an inconditional call to hotkey_mask_get to
+	 * We *must* make an unconditional call to hotkey_mask_get to
 	 * refresh hotkey_acpi_mask and update hotkey_user_mask
 	 *
 	 * Take the opportunity to also log when we cannot _enable_
@@ -3770,7 +3770,7 @@ static bool hotkey_notify_dockevent(const u32 hkey, bool *send_acpi_ev)
 		return true;
 
 	/*
-	 * Deliberately ignore attaching and detaching the keybord cover to avoid
+	 * Deliberately ignore attaching and detaching the keyboard cover to avoid
 	 * duplicates from intel-vbtn, which already emits SW_TABLET_MODE events
 	 * to userspace.
 	 *
@@ -4047,7 +4047,7 @@ static void hotkey_resume(void)
 	hotkey_wakeup_hotunplug_complete_notify_change();
 	hotkey_poll_setup_safe(false);
 
-	/* restore previous mode of adapive keyboard of X1 Carbon */
+	/* restore previous mode of adaptive keyboard of X1 Carbon */
 	if (tp_features.has_adaptive_kbd) {
 		if (!acpi_evalf(hkey_handle, NULL, "STRW", "vd",
 					adaptive_keyboard_prev_mode)) {
@@ -7131,7 +7131,7 @@ static bool software_mute_active;
 static int software_mute_orig_mode;
 
 /*
- * Used to syncronize writers to TP_EC_AUDIO and
+ * Used to synchronize writers to TP_EC_AUDIO and
  * TP_NVRAM_ADDR_MIXER, as we need to do read-modify-write
  */
 static struct mutex volume_mutex;
@@ -7324,7 +7324,7 @@ static int volume_set_software_mute(bool startup)
 
 	/*
 	 * In software mute mode, the standard codec controls take
-	 * precendence, so we unmute the ThinkPad HW switch at
+	 * precedence, so we unmute the ThinkPad HW switch at
 	 * startup.  Just on case there are SAUM-capable ThinkPads
 	 * with level controls, set max HW volume as well.
 	 */
@@ -8043,7 +8043,7 @@ TPACPI_HANDLE(fanw, ec, "FANW",	/* E531 */
 	   );			/* all others */
 
 /*
- * Unitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
+ * Uninitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
  * HFSP register at boot, so it contains 0x07 but the Thinkpad could
  * be in auto mode (0x80).
  *
@@ -10623,7 +10623,7 @@ static int dytc_profile_set(struct device *dev,
 			 * To get back to balanced mode we need to issue a reset command.
 			 * Note we still need to disable CQL mode before hand and re-enable
 			 * it afterwards, otherwise dytc_lapmode gets reset to 0 and stays
-			 * stuck at 0 for aprox. 30 minutes.
+			 * stuck at 0 for approx. 30 minutes.
 			 */
 			err = dytc_cql_command(DYTC_CMD_RESET, &output);
 			if (err)
@@ -11685,7 +11685,7 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 static struct proc_dir_entry *proc_dir;
 
 /*
- * Module and infrastructure proble, init and exit handling
+ * Module and infrastructure probe, init and exit handling
  */
 
 static bool force_load;
-- 
2.53.0

