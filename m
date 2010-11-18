From: Zeng Zhaoming <zengzm.kernel@gmail.com>
Subject: [PATCH] ACPI, hp-wmi: Fix memory leak in acpi query
Date: Fri, 19 Nov 2010 00:46:19 +0800
Message-ID: <1290098779-2145-1-git-send-email-zengzm.kernel@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:52128 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759903Ab0KRQqq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Nov 2010 11:46:46 -0500
Received: by pxi15 with SMTP id 15so794741pxi.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Nov 2010 08:46:45 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: mjg@redhat.com, Zeng Zhaoming <zengzm.kernel@gmail.com>

Free acpi return memory after query.

Signed-off-by: Zeng Zhaoming <zengzm.kernel@gmail.com>
---
 drivers/platform/x86/hp-wmi.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 drivers/platform/x86/hp-wmi.c

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
old mode 100644
new mode 100755
index 1dac659..9e05af9
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -172,6 +172,8 @@ static int hp_wmi_perform_query(int query, int write, u32 *buffer,
 	bios_return = *((struct bios_return *)obj->buffer.pointer);
 
 	memcpy(buffer, &bios_return.value, sizeof(bios_return.value));
+
+	kfree(obj);
 	return 0;
 }
 
-- 
1.7.0.4
