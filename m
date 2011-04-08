From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 3/4] samsung-laptop: set backlight type
Date: Fri,  8 Apr 2011 17:02:05 +0200
Message-ID: <1302274926-25985-4-git-send-email-mmarek@suse.cz>
References: <1302274926-25985-1-git-send-email-mmarek@suse.cz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1302274926-25985-1-git-send-email-mmarek@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: mjg@redhat.com
Cc: gregkh@suse.de, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Cherry-picked from drivers/staging/samsung-laptop/samsung-laptop.c

Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 drivers/platform/x86/samsung-laptop.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 39f30ff..d347116 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -781,6 +781,7 @@ static int __init samsung_init(void)
 
 	/* create a backlight device to talk to this one */
 	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_PLATFORM;
 	props.max_brightness = sabi_config->max_brightness;
 	backlight_device = backlight_device_register("samsung", &sdev->dev,
 						     NULL, &backlight_ops,
-- 
1.7.4.1
