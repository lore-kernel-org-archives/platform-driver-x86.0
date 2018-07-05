From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] platform/x86: dell-laptop: Mark expected switch fall-throughs
Date: Thu, 5 Jul 2018 15:38:07 -0500
Message-ID: <20180705203807.GA10327@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: platform-driver-x86.vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/platform/x86/dell-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f1fa861..1938f11 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1565,8 +1565,10 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 		switch (unit) {
 		case KBD_TIMEOUT_DAYS:
 			value *= 24;
+			/* fall through */
 		case KBD_TIMEOUT_HOURS:
 			value *= 60;
+			/* fall through */
 		case KBD_TIMEOUT_MINUTES:
 			value *= 60;
 			unit = KBD_TIMEOUT_SECONDS;
-- 
2.7.4
