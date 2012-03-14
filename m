From: David Rientjes <rientjes@google.com>
Subject: [patch -next 2/2] drivers, samsung-laptop: fix usage of isalnum
Date: Tue, 13 Mar 2012 22:59:09 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1203132258460.5229@chino.kir.corp.google.com>
References: <alpine.DEB.2.00.1203132258160.5229@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="397155492-763871924-1331704743=:5229"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1203132258160.5229@chino.kir.corp.google.com>
Content-ID: <alpine.DEB.2.00.1203132259080.5229@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--397155492-763871924-1331704743=:5229
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.00.1203132259081.5229@chino.kir.corp.google.com>

linux/ctype.h is needed for isalnum() to avoid a build error:

drivers/platform/x86/samsung-laptop.c: In function ‘samsung_sabi_diag’:
drivers/platform/x86/samsung-laptop.c:1306: error: implicit declaration of function ‘isalnum’

Signed-off-by: David Rientjes <rientjes@google.com>
---
 drivers/platform/x86/samsung-laptop.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -25,6 +25,7 @@
 #include <linux/acpi.h>
 #include <linux/seq_file.h>
 #include <linux/debugfs.h>
+#include <linux/ctype.h>
 
 /*
  * This driver is needed because a number of Samsung laptops do not hook
--397155492-763871924-1331704743=:5229--
