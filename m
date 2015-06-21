From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 4/4] dell-laptop: Show info about WiGig and UWB in debugfs
Date: Sun, 21 Jun 2015 10:41:42 +0200
Message-ID: <1434876102-13496-1-git-send-email-pali.rohar@gmail.com>
References: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:35269 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753483AbbFUIlx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 21 Jun 2015 04:41:53 -0400
In-Reply-To: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

This commit show additional information about rfkill state in debugfs b=
ased
on newly released documentation by Dell.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-laptop.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 0a91599..9777195 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -641,12 +641,21 @@ static int dell_debugfs_show(struct seq_file *s, =
void *data)
 		  (status & BIT(4)) >> 4);
 	seq_printf(s, "Bit 5 : Wireless keyboard supported: %lu\n",
 		  (status & BIT(5)) >> 5);
+	seq_printf(s, "Bit 6 : UWB supported:               %lu\n",
+		  (status & BIT(6)) >> 6);
+	seq_printf(s, "Bit 7 : WiGig supported:             %lu\n",
+		  (status & BIT(7)) >> 7);
 	seq_printf(s, "Bit 8 : Wifi is installed:           %lu\n",
 		  (status & BIT(8)) >> 8);
 	seq_printf(s, "Bit 9 : Bluetooth is installed:      %lu\n",
 		  (status & BIT(9)) >> 9);
 	seq_printf(s, "Bit 10: WWAN is installed:           %lu\n",
 		  (status & BIT(10)) >> 10);
+	seq_printf(s, "Bit 11: UWB installed:               %lu\n",
+		  (status & BIT(11)) >> 11);
+	seq_printf(s, "Bit 12: WiGig installed:             %lu\n",
+		  (status & BIT(12)) >> 12);
+
 	seq_printf(s, "Bit 16: Hardware switch is on:       %lu\n",
 		  (status & BIT(16)) >> 16);
 	seq_printf(s, "Bit 17: Wifi is blocked:             %lu\n",
@@ -655,6 +664,10 @@ static int dell_debugfs_show(struct seq_file *s, v=
oid *data)
 		  (status & BIT(18)) >> 18);
 	seq_printf(s, "Bit 19: WWAN is blocked:             %lu\n",
 		  (status & BIT(19)) >> 19);
+	seq_printf(s, "Bit 20: UWB is blocked:              %lu\n",
+		  (status & BIT(20)) >> 20);
+	seq_printf(s, "Bit 21: WiGig is blocked:            %lu\n",
+		  (status & BIT(21)) >> 21);
=20
 	seq_printf(s, "\nhwswitch_state:\t0x%X\n", hwswitch_state);
 	seq_printf(s, "Bit 0 : Wifi controlled by switch:      %lu\n",
@@ -663,6 +676,10 @@ static int dell_debugfs_show(struct seq_file *s, v=
oid *data)
 		   (hwswitch_state & BIT(1)) >> 1);
 	seq_printf(s, "Bit 2 : WWAN controlled by switch:      %lu\n",
 		   (hwswitch_state & BIT(2)) >> 2);
+	seq_printf(s, "Bit 3 : UWB controlled by switch:       %lu\n",
+		   (hwswitch_state & BIT(3)) >> 3);
+	seq_printf(s, "Bit 4 : WiGig controlled by switch:     %lu\n",
+		   (hwswitch_state & BIT(4)) >> 4);
 	seq_printf(s, "Bit 7 : Wireless switch config locked:  %lu\n",
 		   (hwswitch_state & BIT(7)) >> 7);
 	seq_printf(s, "Bit 8 : Wifi locator enabled:           %lu\n",
--=20
1.7.9.5
