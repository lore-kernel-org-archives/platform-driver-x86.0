Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40311497B62
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467796; cv=none; b=CZ6IzM+OfWkiT8lVn8MeSjHiGVFYo1ynQARCCarBhs8KZVUgzZanRTW3z2N2O5SgrFBtWR8Q92/nTGMwX9Ka4ns7/PdgalcOfTmbkvX4VER/bmKy7mSoPJESvYriykoOyGqohHwyHr7vrgkciafWaLaCLsrk7XJzTmHA1DZe9GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467796; c=relaxed/simple;
	bh=LAtogNg3GGTrfds1O+SyiSrcHa26CQG9HkfS/nZnFzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9V9GxFUknXqXR02DSry8Of9gE3yGy8v3u2M82MttivloadV/5h23n1qvbFTUSdgVPuaY1+jpK3zUwf+NLcWeq7+RC89R64bFK74axtihZqLPbeixPXXsoT0G7XKYI+nwPdOcqAopQSsbe5iElpc+o9ASjU/+4xIGfXgCKVCMvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huXeIoRb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huXeIoRb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so26134395e9.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2026 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791467793; x=1792072593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6WX9i8mKVLwKoFhKGD1gOnudX0Yq9IQNCIvcNZ0AP8=;
        b=huXeIoRb5nKQyHR81HunYdy/poQ5jaXb/GFPDgqG477JsOKDugBWVZLQNcYjZMtlb8
         QmwQ7HdX/IYpmjta9Mh9sKa9k9h8WvFbjLgTJk6QLdOVty/8dNZ1fkAEReku7jRAXiok
         zA+YrbMbybD1SZ608C12E9qoykVyezVUROSN9aeV7oExjUrHiD4Ss5TnWkUUG4Mo0UKC
         QZQ66rB2q1lg2QyJLqPLi8ZZvNP5BJA9pQX3B03SHerDOq01PmPW/j2IVA6hFWtSER9e
         SIVdH+ZICVgv4jyTcF4w6TFwT0jHbe8/5LMQyINamCUmg9Ir3lhldF2A7AlLyWwJi87R
         MXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791467793; x=1792072593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6WX9i8mKVLwKoFhKGD1gOnudX0Yq9IQNCIvcNZ0AP8=;
        b=RpMVwqpzpUXbK2PSXre/05Id5u81ijng3QsW7PhzbDGWSmSeriDHbpgJGRrpmP18Sh
         m6lG5sZmsc9tZxFpH/qEsqbKwawEnM1+B4pTbDB56DPxGIrIP22NDn20CwNWIPNcKjOM
         GeUPKHpy3pbuUefjDcMh/pGLUSwRZPz4i/iZvCEcbE3vc5g8mAT+Ho1ZUPOq6amUkrwg
         FUa3XbOGekHUbzqHTyMYkTz3AghwApAEyjN33rAFn+svN202yN9UKb/vFeI+3Qa/ywu3
         WcrVgxDLnuvd9lkPvwOikv9smskB92/bCeYdI7BpxASZudTX35Wit0CDFVCztVeGbukU
         t5pQ==
X-Forwarded-Encrypted: i=1; AKwUvBypZfrCsKZEJaVV/FlZsg1GrIONVfDdbTU2YVX5I++i8n12xmYlIKrv2vPVmk45cYf8p+KWgENHQwItYtuSUkuynFT6@vger.kernel.org
X-Gm-Message-State: AFuF++kJEX4ntAKWoOLp6qmZtUYmu5Sfc+RPXS8k6LVaOM2RjbgKjrCI
	KU1vePKAl6tDiemQP4JNwsEl1VPBUOnR58DxLk1dmNNCeAMn06iTNKu4
X-Gm-Gg: AYBFou3R1OE7Ezy8IPOMbc9luGHsKGTKJ6Jx+okCEz2KkJALA4tyOoDt1gCd4JRCElW
	sYv196CrU5Xm3cnqstJ5C9ghcqBu7gjLiP2/crnUVUC59VGw1ShWO3Vw7PV4a5l/R+XZBz/Zebm
	5ehay4Z+AJLeE2dQbJCDO9qtv+YUlol9JJcLRNbHQcZX0HDn9ivKXSvC7IKoG80E54v3jh0988K
	B94+vyImtiHvmCF/rhxuEJ711GQu6tufFAl2ReDxKWJjLaTwBfQ2sWho5qRqAPaz50psTcTw8A+
	D1/9G6UXped7YxmfKzUKSwwsv86EX7LVRpv0vZvAWghIObCIbPiWaVhunqTwN0TPBbPfty70nOD
	V/+8VqwUjJJYqRssYl9A6fqjgQek6gVzWFaRgeLLzgAgYof1pwOJYQu1Cqqw3P2elwd5y6GFXoj
	Ld+ZgVxVZEZd3lfaW663hUUfd/22KeUcQUiOBFCAcAqrytuGXg3kKydzmzjP8jdTuq2215L3lH0
	efvIygzlQw=
X-Received: by 2002:a05:600c:3b86:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a18043c2a2mr124984465e9.24.1791467793365;
        Thu, 08 Oct 2026 06:56:33 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a184260f9asm76512765e9.0.2026.10.08.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:56:33 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	Christoffer Sandberg <cs@tuxedo.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH v3 2/2] platform/x86: uniwill-laptop: Map the screen rotation key
Date: Thu,  8 Oct 2026 14:56:24 +0100
Message-ID: <20261008135624.3520849-3-amad3v@gmail.com>
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

The PCSpecialist Recoil 16 AMD / TUXEDO Stellaris 16 Gen7 chassis has an
"Sc" key next to F12, meant to rotate the lay-flat screen by 180 degrees.
It reports WMI event 0xD0, which is currently reported as KEY_UNKNOWN.
Map it to KEY_ROTATE_DISPLAY.

Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
Changes in v3:
- None. TUXEDO know of no device using event 0xD0:
  https://lore.kernel.org/r/66a47248ecfa1704186274f2c245d3f5@tuxedo.de

Changes in v2:
- Added Reviewed-by.

 drivers/platform/x86/uniwill/uniwill-acpi.c | 3 +++
 drivers/platform/x86/uniwill/uniwill-wmi.h  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index dc9b73afd..6b0dd0e4f 100644
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
2.56.0

