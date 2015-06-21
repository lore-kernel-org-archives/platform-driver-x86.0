From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 3/4] dell-laptop: Fix allocating & freeing SMI buffer page
Date: Sun, 21 Jun 2015 10:41:03 +0200
Message-ID: <1434876063-13460-1-git-send-email-pali.rohar@gmail.com>
References: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:33700 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753507AbbFUIlX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 21 Jun 2015 04:41:23 -0400
In-Reply-To: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Michal Hocko <mhocko@suse.cz>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

This commit fix kernel crash when probing for rfkill devices in dell-la=
ptop
driver failed. Function free_page() was incorrectly used on struct page=
 *
instead of virtual address of SMI buffer.

This commit also simplify allocating page for SMI buffer by using
__get_free_page() function instead of sequential call of functions
alloc_page() and page_address().

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-laptop.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index aaef335..0a91599 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -306,7 +306,6 @@ static const struct dmi_system_id dell_quirks[] __i=
nitconst =3D {
 };
=20
 static struct calling_interface_buffer *buffer;
-static struct page *bufferpage;
 static DEFINE_MUTEX(buffer_mutex);
=20
 static int hwswitch_state;
@@ -2097,12 +2096,11 @@ static int __init dell_init(void)
 	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
 	 * is passed to SMI handler.
 	 */
-	bufferpage =3D alloc_page(GFP_KERNEL | GFP_DMA32);
-	if (!bufferpage) {
+	buffer =3D (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
+	if (!buffer) {
 		ret =3D -ENOMEM;
 		goto fail_buffer;
 	}
-	buffer =3D page_address(bufferpage);
=20
 	ret =3D dell_setup_rfkill();
=20
@@ -2165,7 +2163,7 @@ static int __init dell_init(void)
 fail_backlight:
 	dell_cleanup_rfkill();
 fail_rfkill:
-	free_page((unsigned long)bufferpage);
+	free_page((unsigned long)buffer);
 fail_buffer:
 	platform_device_del(platform_device);
 fail_platform_device2:
--=20
1.7.9.5
