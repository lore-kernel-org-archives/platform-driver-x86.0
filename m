From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 05/10] WMI: fix potential NULL pointer dereference
Date: Thu, 26 Aug 2010 00:15:03 -0700
Message-ID: <20100826071503.7976.86482.stgit@localhost.localdomain>
References: <20100826071442.7976.93972.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:58101 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752959Ab0HZHPH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 03:15:07 -0400
Received: by mail-pv0-f174.google.com with SMTP id 2so528876pvg.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2010 00:15:07 -0700 (PDT)
In-Reply-To: <20100826071442.7976.93972.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, platform-driver-x86@vger.kernel.org

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/wmi.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 5abb2ad..4032fa4 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -836,6 +836,8 @@ static acpi_status parse_wdg(acpi_handle handle)
 		return status;
 
 	obj = (union acpi_object *) out.pointer;
+	if (!obj)
+		return AE_ERROR;
 
 	if (obj->type != ACPI_TYPE_BUFFER) {
 		status = AE_ERROR;
