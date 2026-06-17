Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8ED4BC008;
	Wed, 17 Jun 2026 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711499; cv=none; b=KeLM22TAijnvh8UW2SJ1HWjRzDykGUiDIw6MAc4bZHD65gpoEarhzJ92MOJlJ+JvZfHF+LJWVfWufuUwrsxo31Cg9t/sJxibbQ0KtM0G+y1kQBn6Q3nWXdyBAff5miCnnW0HqIulIG7C/CPXY40YiyaxceaartcDzm5mAhSft1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711499; c=relaxed/simple;
	bh=PlssXmDM3WJDuWNa0MZRKxNi42W1bvTJ8Sp12KrZi+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R/1FvK/XW6/94H7SviSxr5p2P/BI0C0T24G2OwXFQkuB5vw395Y4wOox3+0eS9o9QTor/WQz3dgYrZyghRB9FBaXkt8HEQLcZkuTCWG1f7xg07OIpL5lXcFoxHffxW/3BuOjFFbMW27zlcWTdr3Vij735HMT0tkDWYIveXmxdC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=VGNBYl9O; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="VGNBYl9O"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 710A7270A5;
	Wed, 17 Jun 2026 17:51:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1bjSKgW-E-h; Wed, 17 Jun 2026 17:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781711480; bh=PlssXmDM3WJDuWNa0MZRKxNi42W1bvTJ8Sp12KrZi+k=;
	h=From:To:Cc:Subject:Date;
	b=VGNBYl9OZBdLRgt+GAXuErC075eWjQ+zA4LfSaGuNFkIPHjn0AVEOoQtv1gOwKEhU
	 Znzn67kKOYbBhG9E/QwJRkqzYX637EAZCnIX3zH7njYGAI6K8GesZqwU7H2D6fH2Ie
	 X28+yZ/gCl+O6kJyytntKE3CO5jZStNuR6rO6lPjI+c84K6vqHwkJ/e76VS82/15wk
	 aiduqjBDlAZ+WbfDc97+Sm7O3x3F+aRrSaJytZzXOwBOSU5vhLak6GWZCwtCUfsu+X
	 vPAUBgaZkU8RPUKyCZJEATya9QGAfxQk2weGSfjukYh39pEZ/9y/hCj1UaiWdPhQ68
	 yxzLU+OXZiA3w==
From: Marco Scardovi <scardracs@disroot.org>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH] platform/x86: asus-wmi: fix resource leaks on probe failure
Date: Wed, 17 Jun 2026 17:51:04 +0200
Message-ID: <20260617155104.10111-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During driver initialization in asus_wmi_add(), various subsystems are
registered sequentially. However, the error path labels are out of order
relative to the registration sequence.

Specifically:
1. If asus_wmi_custom_fan_curve_init() fails, the driver jumps to
   fail_custom_fan_curve. Because this label is placed below fail_sysfs,
   it bypasses the cleanup calls for the input device and sysfs groups,
   which were successfully registered before, leaking those resources.
2. If asus_screenpad_init() fails, the driver jumps to fail_screenpad.
   Because fail_screenpad is placed below fail_backlight, it bypasses the
   cleanup calls for backlight and rfkill, leaking those resources.

Fix these resource leaks by reordering the error path labels in
asus_wmi_add() to match the exact reverse order of the resource
allocations.

Fixes: 0f0ac158d28f ("platform/x86: asus-wmi: Add support for custom fan curves")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 3c9ef826551d..764caa7e7fba 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -5224,20 +5224,20 @@ static int asus_wmi_add(struct platform_device *pdev)
 	return 0;
 
 fail_wmi_handler:
+	asus_screenpad_exit(asus);
+fail_screenpad:
 	asus_wmi_backlight_exit(asus);
 fail_backlight:
 	asus_wmi_rfkill_exit(asus);
-fail_screenpad:
-	asus_screenpad_exit(asus);
 fail_rfkill:
 	asus_wmi_led_exit(asus);
 fail_leds:
+fail_custom_fan_curve:
 fail_hwmon:
 	asus_wmi_input_exit(asus);
 fail_input:
 	asus_wmi_sysfs_exit(asus->platform_device);
 fail_sysfs:
-fail_custom_fan_curve:
 fail_platform_profile_setup:
 fail_fan_boost_mode:
 fail_platform:
-- 
2.54.0

