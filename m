From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] x86/platform: geode/alix.c needs module.h
Date: Fri, 29 Jul 2011 21:14:51 -0700
Message-ID: <20110729211451.b3dd3bfa.rdunlap@xenotime.net>
References: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andres Salomon <dilinger@queued.net>, linux-geode@lists.infradead.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, akpm <akpm@linux-foundation.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

geode/alix.c uses interfaces from linux/module.h, so it should
include that file.  This fixes build errors.

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 arch/x86/platform/geode/alix.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110729.orig/arch/x86/platform/geode/alix.c
+++ linux-next-20110729/arch/x86/platform/geode/alix.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/string.h>
 #include <linux/leds.h>
 #include <linux/platform_device.h>
