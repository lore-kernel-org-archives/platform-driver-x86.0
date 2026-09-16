Received: from mta0.migadu.com (out-22.mta0.migadu.com [91.218.175.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E6E501F5E
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569556; cv=none; b=GGaPOrFAsp87i+E97Hk6QIe4AVL5AnftXD/mmppZhWSf8GuvZTI14cgbHO1PYXtAGyWSJTtJz7w/iR9ZBkqdSzvSRWfjyU3ySF/eMT+fiS69jALWjaa4zhu1m6KdU7jW2N5movLNZmYPjIDt+0oYFS2A5t6aQd4MOMuXkr6V6h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569556; c=relaxed/simple;
	bh=yDRqn32T6OsTeld75ue/eGYhd366gSjMZAXI9ZW0rI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XGQ6LLnOrgdi0wGLJILSTJj6jianWpjs9BRKvbSDr/E9csZeDdjaPRBcSGYB2YkHWHdod7/8njxtFqDyXrP8GJJwD+wjtrC/8wIWj6Gs8fFXOg3TjUkw/iZqgwMbjMvqbBOrqflahg0rcK2KFCeuZWA21Uxl3SXZ7f28CvesTdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iajgI7HH; arc=none smtp.client-ip=91.218.175.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iajgI7HH"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yDRqn32T6OsTeld75ue/eGYhd366gSjMZAXI9ZW0rI0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789569551; v=1; x=1790174351;
 b=iajgI7HHLNHX1Xnn2IyFju6EY67RK2zcdyS6JxofPy0qgY3e6UP9VpigFRbMszcFebsqhiHF
 q59w6m0NxgFELSJB64zLcNp0ofWe3WY9tpEvJky/OzRxn57bIBeAobM+3JpewuWxqZvDFzAfEEg
 X8YYjvAcgwqlNs5WQOU5DDcE=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bc1733425284d87c;
	Wed, 16 Sep 2026 14:39:11 +0000
X-Mizu-Trace-ID: bc1733425284d87c
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Hans de Goede" <hansg@kernel.org>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Luke Jones" <luke@ljones.dev>,
	"Hugo Baigue" <hugobaigue2004@gmail.com>,
	"Ponali" <ponali2k@gmail.com>,
	=?UTF-8?q?Manuel=20A=2E=20R=2E=20de=20Or=C3=BAe=20R=C3=ADos?= <deor001@gmail.com>,
	"Salvatore Bonaccorso" <carnil@debian.org>,
	"Thorsten Leemhuis" <regressions@leemhuis.info>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v1 4/4] platform/x86: asus-wmi: remove unused screenpad_brightness
Date: Wed, 16 Sep 2026 14:38:28 +0000
Message-ID: <20260916143838.170950-5-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916143838.170950-1-denis.benato@linux.dev>
References: <20260916143838.170950-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing reads asus->driver->screenpad_brightness anymore: the last
reader went away when the screenpad update path stopped relying on a
driver-side copy of the brightness, leaving only the write in
asus_screenpad_init(). ASUS_SCREENPAD_BRIGHT_DEFAULT became unused in
the same rework.

Drop the field from struct asus_wmi_driver, the write and the unused
define. Nothing in the current code depends on remembering the last
brightness while the panel is off; should a model turn up that needs
it (the original screenpad implementation did, and older DUO models
may behave differently from the hardware tested so far), the field can
be reintroduced then.

Assisted-by: zcode:glm-5.3-flash
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-wmi.c | 2 --
 drivers/platform/x86/asus-wmi.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index e6f3a5c0dba9..440b86549eb9 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -127,7 +127,6 @@ module_param(fnlock_default, bool, 0444);
 #define NVIDIA_TEMP_MAX		87
 
 #define ASUS_SCREENPAD_BRIGHT_MAX 255
-#define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
 
 #define ASUS_MINI_LED_MODE_MASK		0x03
 /* Standard modes for devices with only on/off */
@@ -4586,7 +4585,6 @@ static int asus_screenpad_init(struct asus_wmi *asus)
 	}
 
 	asus->screenpad_backlight_device = bd;
-	asus->driver->screenpad_brightness = brightness;
 	bd->props.brightness = brightness;
 	bd->props.power = power;
 	backlight_update_status(bd);
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 5cd4392b964e..b45f81b38a47 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -57,7 +57,6 @@ struct quirk_entry {
 struct asus_wmi_driver {
 	int			brightness;
 	int			panel_power;
-	int			screenpad_brightness;
 	int			wlan_ctrl_by_user;
 
 	const char		*name;
-- 
2.47.3

