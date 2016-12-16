From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH] platform/x86: fujitsu-laptop: set default trigger for radio LED to rfkill-any
Date: Fri, 16 Dec 2016 15:46:03 +0100
Message-ID: <20161216144603.19100-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The "radio components indicator" LED present in Lifebook E734/E744/E754
should be lit when any radio transmitter is enabled, so set its default
trigger to rfkill-any.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
Note: the rfkill-any trigger is currently only present in
mac80211-next/master.

 drivers/platform/x86/fujitsu-laptop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 61f39ab..bfc0eb3 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -202,6 +202,7 @@ static void radio_led_set(struct led_classdev *cdev,
 
 static struct led_classdev radio_led = {
  .name = "fujitsu::radio_led",
+ .default_trigger = "rfkill-any",
  .brightness_get = radio_led_get,
  .brightness_set = radio_led_set
 };
-- 
2.10.2
