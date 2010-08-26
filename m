From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 03/10] WMI: fix wmi_gtoa() to actully terminate the string
Date: Thu, 26 Aug 2010 00:14:53 -0700
Message-ID: <20100826071453.7976.1882.stgit@localhost.localdomain>
References: <20100826071442.7976.93972.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:60482 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752882Ab0HZHO5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 03:14:57 -0400
Received: by pzk9 with SMTP id 9so501410pzk.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2010 00:14:56 -0700 (PDT)
In-Reply-To: <20100826071442.7976.93972.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, platform-driver-x86@vger.kernel.org

Courtesy of sparse...

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 030d5f2..63ad45e 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -232,7 +232,7 @@ static int wmi_gtoa(const char *in, char *out)
 	for (i = 10; i <= 15; i++)
 		out += sprintf(out, "%02X", in[i] & 0xFF);
 
-	out = '\0';
+	*out = '\0';
 	return 0;
 }
 
