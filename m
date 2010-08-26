From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 04/10] WMI: do not leak memory in parse_wdg()
Date: Thu, 26 Aug 2010 00:14:58 -0700
Message-ID: <20100826071458.7976.98153.stgit@localhost.localdomain>
References: <20100826071442.7976.93972.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:58101 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752849Ab0HZHPC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 03:15:02 -0400
Received: by pvg2 with SMTP id 2so528876pvg.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2010 00:15:01 -0700 (PDT)
In-Reply-To: <20100826071442.7976.93972.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, platform-driver-x86@vger.kernel.org

If we _WDG returned object that is not buffer we were forgetting
to free memory allocated for that object.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/wmi.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 63ad45e..5abb2ad 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -837,8 +837,10 @@ static acpi_status parse_wdg(acpi_handle handle)
 
 	obj = (union acpi_object *) out.pointer;
 
-	if (obj->type != ACPI_TYPE_BUFFER)
-		return AE_ERROR;
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		status = AE_ERROR;
+		goto out_free_pointer;
+	}
 
 	total = obj->buffer.length / sizeof(struct guid_block);
 
