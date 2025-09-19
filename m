Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86246274FFD
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314896; cv=none; b=oi2B9pDXs4zK1ww67ZhEWCW+xqYtR9J56pdq+4TSi51tjxc3gtTfz/B1C9DWDWobHs80a8z229HJSWi2HuojJ/ZxPPaIHOiL7ljGGoHKDG+XF3zJzEXdlG3Wri6/Pk0vA+DVtsSUv+WDU4N1M17ayhEVEI2LVcYMeHo+kSfqWxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314896; c=relaxed/simple;
	bh=wWULpO+isX7u3ZPWRizCh6enKm0vnojMqlxgHL1WtWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vn2NBMghy++87fgRqMCmw2tPnuNz569xu5geKiICaKaLjjoyQDD2n81vc4uvQ2rX0pS6kpxBsZ6KzaaVVtS8ppLo2TwbxPp11tjCm9tugSpyMkRSInkyZPS9xEkmGt8M2/Z6Conm+wkYq/iZM7m3Cp+4q1FGHWWqLUrbXgQv8ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oi5xY6Un; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oi5xY6Un"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035FCC4CEF7;
	Fri, 19 Sep 2025 20:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314896;
	bh=wWULpO+isX7u3ZPWRizCh6enKm0vnojMqlxgHL1WtWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oi5xY6Ungbqo0ie7Ce2jT/DhzbbmZh5M/WuEU4M7eQPxuTNtl69hFczvDobFGpmSw
	 lQ9vLnsv6eWZtIyFQfzVLcQkkToC8VSkDVDuOoOCw1HkH0kjFh5K742dQWkAyiabEp
	 bMZ2UgHl2tDn7XBRanUAULJXyfQG/mZRTlLJOr9OXBHY05ta7yW+sCAN5TU7Sd/HnX
	 lAGegp4Cw1g83LCqa05ItdIqg3NhI9LU7WXl4YRy4w44Gm+uXru0JQDVw6quQW0lyv
	 p9tr5/k3rVWZ4XTmzwJIFylGtQl+QHzLh8EHnQ2gcvVgrDcS8NaMVfxuP4/BuygXfy
	 SXN8SRc+pnA8Q==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 17/19] platform/x86: x86-android-tablets: Simplify lenovo_yoga_tab2_830_1050_exit()
Date: Fri, 19 Sep 2025 22:47:40 +0200
Message-ID: <20250919204742.25581-18-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919204742.25581-1-hansg@kernel.org>
References: <20250919204742.25581-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lenovo_yoga_tab2_830_1050_exit() only gets called after a successful
lenovo_yoga_tab2_830_1050_init() call so there is no need to check
if lenovo_yoga_tab2_830_1050_codec_[dev|pinctrl] are set.

Also change the exit() order to be the exact reverse of init().

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 832be02495b5..08cabaa5e0c0 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -594,15 +594,10 @@ static void lenovo_yoga_tab2_830_1050_exit(void)
 {
 	unregister_sys_off_handler(lenovo_yoga_tab2_830_1050_sys_off_handler);
 
-	if (lenovo_yoga_tab2_830_1050_codec_dev) {
-		device_remove_software_node(lenovo_yoga_tab2_830_1050_codec_dev);
-		put_device(lenovo_yoga_tab2_830_1050_codec_dev);
-	}
-
-	if (lenovo_yoga_tab2_830_1050_codec_pinctrl) {
-		pinctrl_put(lenovo_yoga_tab2_830_1050_codec_pinctrl);
-		pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
-	}
+	device_remove_software_node(lenovo_yoga_tab2_830_1050_codec_dev);
+	pinctrl_put(lenovo_yoga_tab2_830_1050_codec_pinctrl);
+	pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
+	put_device(lenovo_yoga_tab2_830_1050_codec_dev);
 }
 
 /*
-- 
2.51.0

