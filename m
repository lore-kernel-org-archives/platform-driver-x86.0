From: Puranjay Mohan <puranjay12@gmail.com>
Subject: [PATCH v2] Documentation: platform: Delete x86-laptop-drivers.txt
Date: Fri, 21 Jun 2019 00:08:27 +0530
Message-ID: <20190620183827.23704-1-puranjay12@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Puranjay Mohan <puranjay12@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Documentation List <linux-doc@vger.kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

The list of laptops supported by drivers in PDx86 subsystem is quite
big and growing. x86-laptop-drivers.txt contains details of very few
laptop models. Remove it because it does not  serve any purpose.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 Documentation/platform/x86-laptop-drivers.txt | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 Documentation/platform/x86-laptop-drivers.txt

diff --git a/Documentation/platform/x86-laptop-drivers.txt b/Documentation/platform/x86-laptop-drivers.txt
deleted file mode 100644
index 01facd2590bb..000000000000
--- a/Documentation/platform/x86-laptop-drivers.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-compal-laptop
-=============
-List of supported hardware:
-
-by Compal:
-	Compal FL90/IFL90
-	Compal FL91/IFL91
-	Compal FL92/JFL92
-	Compal FT00/IFT00
-
-by Dell:
-	Dell Vostro 1200
-	Dell Mini 9 (Inspiron 910)
-	Dell Mini 10 (Inspiron 1010)
-	Dell Mini 10v (Inspiron 1011)
-	Dell Mini 1012 (Inspiron 1012)
-	Dell Inspiron 11z (Inspiron 1110)
-	Dell Mini 12 (Inspiron 1210)
-- 
2.21.0
