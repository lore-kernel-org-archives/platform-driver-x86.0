From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 15/15] samsung-laptop: promote myself as maintainer of samsung-laptop
Date: Tue, 22 Nov 2011 23:02:46 +0100
Message-ID: <1321999366-23784-16-git-send-email-corentincj@iksaif.net>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Corentin Chary <corentincj@iksaif.net>, Andrew Morton <akpm@linux-foundation.org>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Joe Perches <joe@perches.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 MAINTAINERS |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3523ab0..bdde26f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5666,6 +5666,12 @@ F:	drivers/media/common/saa7146*
 F:	drivers/media/video/*7146*
 F:	include/media/*7146*
 
+SAMSUNG LAPTOP DRIVER
+M:	Corentin Chary <corentincj@iksaif.net>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/samsung-laptop.c
+
 SAMSUNG AUDIO (ASoC) DRIVERS
 M:	Jassi Brar <jassisinghbrar@gmail.com>
 M:	Sangbeom Kim <sbkim73@samsung.com>
-- 
1.7.5.4
