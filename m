From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: Fix capitalisation of GUID in module alias
Date: Wed,  6 Apr 2011 17:40:06 +0800
Message-ID: <1302082806-11807-1-git-send-email-jlee@novell.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:47247 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754152Ab1DFJnO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Apr 2011 05:43:14 -0400
Received: by ywj3 with SMTP id 3so513620ywj.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Apr 2011 02:43:13 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: carlos@strangeworlds.co.uk
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, =?utf-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg@redhat.com>

wmi:6AF4F258-B401-42Fd-BE91-3D4AC2D7C0D3 needs to be
wmi:6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3 in module alias for acer-wmi i=
s
automatically loaded.

Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/acer-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
index 0b23b75..fa8fa73 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -89,7 +89,7 @@ MODULE_LICENSE("GPL");
 #define ACERWMID_EVENT_GUID "676AA15E-6A47-4D9F-A2CC-1E6D18D14026"
=20
 MODULE_ALIAS("wmi:67C3371D-95A3-4C37-BB61-DD47B491DAAB");
-MODULE_ALIAS("wmi:6AF4F258-B401-42Fd-BE91-3D4AC2D7C0D3");
+MODULE_ALIAS("wmi:6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3");
 MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D14026");
=20
 enum acer_wmi_event_ids {
--=20
1.6.0.2
