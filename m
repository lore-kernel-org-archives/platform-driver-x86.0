From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: [PATCH] Register KEY_TOUCHPAD_TOGGLE with input device
Date: Mon, 27 Jun 2016 10:03:24 +0200
Message-ID: <5770DDCC.8060507@fbihome.de>
References: <20160625091522.GA6423@eudyptula.hq.kempniu.pl>
 <1466926895-7830-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironchief.h-da.de ([141.100.10.235]:43363 "EHLO
	ironchief.h-da.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751664AbcF0IDc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Jun 2016 04:03:32 -0400
In-Reply-To: <1466926895-7830-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Probably just squash that into

[PATCH] fujitsu-laptop: Support touchpad toggle hotkey on Skylake-based models

Signed-off-by: Jan-Marek Glogowski <glogow@fbihome.de>
---
 fujitsu-laptop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 695bd5e..42319c8 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -884,6 +884,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 	set_bit(fujitsu->keycode3, input->keybit);
 	set_bit(fujitsu->keycode4, input->keybit);
 	set_bit(fujitsu->keycode5, input->keybit);
+	set_bit(KEY_TOUCHPAD_TOGGLE, input->keybit);
 	set_bit(KEY_UNKNOWN, input->keybit);
 
 	error = input_register_device(input);
-- 
1.9.1
