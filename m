From: Nick Leiten <nickleiten@gmail.com>
Subject: [PATCH] asus-wmi: Ambient sensor toggle key
Date: Sun, 19 Jun 2016 14:59:26 +0300
Message-ID: <9711814.jjoeah4X4e@nl-ubook>
Reply-To: nickleiten@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35883 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711AbcFSL7b (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 19 Jun 2016 07:59:31 -0400
Received: by mail-lf0-f66.google.com with SMTP id a2so3137767lfe.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jun 2016 04:59:30 -0700 (PDT)
Received: from nl-ubook.localnet ([134.249.130.86])
        by smtp.gmail.com with ESMTPSA id 39sm4501976lja.37.2016.06.19.04.59.28
        for <platform-driver-x86@vger.kernel.org>
        (version=TLSv1/SSLv3 cipher=OTHER);
        Sun, 19 Jun 2016 04:59:28 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi, 
here is little patch for Fn+A key assignment in asus-nb-wmi.c file so userspace can control ALS (ambient light sensor) on/off state.

As I can see mentions in Internet Asus makes 0x7a code in all their laptops to be assigned to Toggle ALS.
Tested on Asus U38N.


Signed-off-by: Nick Leiten <nickleiten@gmail.com>

diff -Npru a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
--- linux-4.6-orig/drivers/platform/x86/asus-nb-wmi.c	2016-05-16 01:43:13.000000000 +0300
+++ linux-4.6-diff/drivers/platform/x86/asus-nb-wmi.c	2016-06-06 07:00:27.000000000 +0300
@@ -356,6 +356,7 @@ static const struct key_entry asus_nb_wm
 	{ KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
 	{ KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_IGNORE, 0x6E, },  /* Low Battery notification */
+	{ KE_KEY, 0x7a, { KEY_ALS_TOGGLE } }, /* Ambient Light Sensor Toggle, Fn+A*/
 	{ KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
 	{ KE_KEY, 0x7E, { KEY_BLUETOOTH } }, /* Bluetooth Disable */
 	{ KE_KEY, 0x82, { KEY_CAMERA } },
