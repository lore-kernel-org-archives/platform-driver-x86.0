From: David Rientjes <rientjes@google.com>
Subject: [patch -next 1/2] drivers, samsung-laptop: fix initialization of
 sabi_data in sabi_set_commandb
Date: Tue, 13 Mar 2012 22:59:06 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1203132258160.5229@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="397155492-357468266-1331704722=:5229"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-ID: <alpine.DEB.2.00.1203132259050.5229@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--397155492-357468266-1331704722=:5229
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.00.1203132259051.5229@chino.kir.corp.google.com>

Fields d0, d1, d2, and d3 are members of an anonymous struct inside an
anonymous union inside struct sabi_data.  Initialization must be done by
wrapping the anonymous union and structs with brackets to avoid a build
error:

drivers/platform/x86/samsung-laptop.c: In function ‘sabi_set_commandb’:
drivers/platform/x86/samsung-laptop.c:433: error: unknown field ‘d0’ specified in initializer
drivers/platform/x86/samsung-laptop.c:433: warning: missing braces around initializer
drivers/platform/x86/samsung-laptop.c:433: warning: (near initialization for ‘in.<anonymous>’)
...

Signed-off-by: David Rientjes <rientjes@google.com>
---
 drivers/platform/x86/samsung-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -430,7 +430,7 @@ exit:
 static int sabi_set_commandb(struct samsung_laptop *samsung,
 			     u16 command, u8 data)
 {
-	struct sabi_data in = { .d0 = 0, .d1 = 0, .d2 = 0, .d3 = 0 };
+	struct sabi_data in = { { { .d0 = 0, .d1 = 0, .d2 = 0, .d3 = 0 } } };
 
 	in.data[0] = data;
 	return sabi_command(samsung, command, &in, NULL);
--397155492-357468266-1331704722=:5229--
