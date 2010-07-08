From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] asus-laptop: fix incorrect return value for
	write_acpi_int_ret if handle is NULL
Date: Thu, 08 Jul 2010 13:52:33 +0800
Message-ID: <1278568354.7162.15.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:38455 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810Ab0GHFwZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Jul 2010 01:52:25 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

According to the comments of write_acpi_int_ret(),
write_acpi_int_ret() should return 0 if write is successful, -1 else.
Thus if handle is NULL, the write does not happen, it should return -1.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/asus-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 71db2ef..93487eb 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -297,7 +297,7 @@ static int write_acpi_int_ret(acpi_handle handle, const char *method, int val,
 	acpi_status status;
 
 	if (!handle)
-		return 0;
+		return -1;
 
 	params.count = 1;
 	params.pointer = &in_obj;
-- 
1.5.4.3
