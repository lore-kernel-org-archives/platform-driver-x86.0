From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] dell-wmi: Fix access out of memory
Date: Mon, 29 Sep 2014 15:10:51 +0200
Message-ID: <1411996251-13455-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:64715 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751949AbaI2NLI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Sep 2014 09:11:08 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

Without this patch driver dell-wmi is trying to access elements of dyna=
mically
allocated array without checking array size. This can lead to memory co=
rruption
or kernel panic. This patch adds missing checks for array size.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
This patch should be probably applied to stable kernel trees as it fixi=
ng
possible memory corruption.
---
 drivers/platform/x86/dell-wmi.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 390e8e3..25721bf 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -163,18 +163,24 @@ static void dell_wmi_notify(u32 value, void *cont=
ext)
 		const struct key_entry *key;
 		int reported_key;
 		u16 *buffer_entry =3D (u16 *)obj->buffer.pointer;
+		int buffer_size =3D obj->buffer.length/2;
=20
-		if (dell_new_hk_type && (buffer_entry[1] !=3D 0x10)) {
+		if (buffer_size >=3D 2 && dell_new_hk_type && buffer_entry[1] !=3D 0=
x10) {
 			pr_info("Received unknown WMI event (0x%x)\n",
 				buffer_entry[1]);
 			kfree(obj);
 			return;
 		}
=20
-		if (dell_new_hk_type || buffer_entry[1] =3D=3D 0x0)
+		if (buffer_size >=3D 3 && (dell_new_hk_type || buffer_entry[1] =3D=3D=
 0x0))
 			reported_key =3D (int)buffer_entry[2];
-		else
+		else if (buffer_size >=3D 2)
 			reported_key =3D (int)buffer_entry[1] & 0xffff;
+		else {
+			pr_info("Received unknown WMI event\n");
+			kfree(obj);
+			return;
+		}
=20
 		key =3D sparse_keymap_entry_from_scancode(dell_wmi_input_dev,
 							reported_key);
--=20
1.7.9.5
