From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCHv3] platform/x86: asus-wireless: Fix identation
Date: Mon,  6 Feb 2017 10:20:21 -0500
Message-ID: <20170206152021.17671-1-jprvita@endlessm.com>
References: <CAHp75VeCJee46FHoyGdZ39CvTu0pb=k_R0CnWb9_vaX-per+rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeCJee46FHoyGdZ39CvTu0pb=k_R0CnWb9_vaX-per+rQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

Fix identation problem introduced when this driver was first merged into
the kernel.

Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-wireless.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
index 9f31bc1a47d0..a7ee18383146 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -76,8 +76,7 @@ static void led_state_update(struct work_struct *work)
 			     data->led_state);
 }
 
-static void led_state_set(struct led_classdev *led,
-				  enum led_brightness value)
+static void led_state_set(struct led_classdev *led, enum led_brightness value)
 {
 	struct asus_wireless_data *data;
 
-- 
2.11.0
