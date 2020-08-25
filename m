From: Kenneth Chan <kenneth.t.chan@gmail.com>
Subject: [PATCH] panasonic-laptop: take over maintainership
Date: Tue, 25 Aug 2020 18:13:41 +0800
Message-ID: <20200825101341.5699-1-kenneth.t.chan@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: laforge@gnumonks.org, Kenneth Chan <kenneth.t.chan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Take over maintaniership of panasonic-laptop from Harald Welte.


Signed-off-by: Kenneth Chan <kenneth.t.chan@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b186ade3597..3815ba053136 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13039,7 +13039,7 @@ F:	include/net/page_pool.h
 F:	net/core/page_pool.c
 
 PANASONIC LAPTOP ACPI EXTRAS DRIVER
-M:	Harald Welte <laforge@gnumonks.org>
+M:	Kenneth Chan <kenneth.t.chan@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/panasonic-laptop.c

base-commit: 6a9dc5fd6170d0a41c8a14eb19e63d94bea5705a
-- 
2.17.5
