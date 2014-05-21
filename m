From: Ismael Luceno <ismael.luceno@gmail.com>
Subject: [PATCHv2 1/2] Documentation: Add list of laptop models supported by the Compal driver
Date: Wed, 21 May 2014 17:24:27 -0300
Message-ID: <1400703868-17571-1-git-send-email-ismael.luceno@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:51272 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752673AbaEUUZM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 May 2014 16:25:12 -0400
Received: by mail-yk0-f171.google.com with SMTP id 142so2037299ykq.30
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 May 2014 13:25:12 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Ismael Luceno <ismael.luceno@gmail.com>

Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
 Documentation/platform/x86-laptop-drivers.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/platform/x86-laptop-drivers.txt

diff --git a/Documentation/platform/x86-laptop-drivers.txt b/Documentation/platform/x86-laptop-drivers.txt
new file mode 100644
index 0000000..01facd2
--- /dev/null
+++ b/Documentation/platform/x86-laptop-drivers.txt
@@ -0,0 +1,18 @@
+compal-laptop
+=============
+List of supported hardware:
+
+by Compal:
+	Compal FL90/IFL90
+	Compal FL91/IFL91
+	Compal FL92/JFL92
+	Compal FT00/IFT00
+
+by Dell:
+	Dell Vostro 1200
+	Dell Mini 9 (Inspiron 910)
+	Dell Mini 10 (Inspiron 1010)
+	Dell Mini 10v (Inspiron 1011)
+	Dell Mini 1012 (Inspiron 1012)
+	Dell Inspiron 11z (Inspiron 1110)
+	Dell Mini 12 (Inspiron 1210)
-- 
1.9.1
