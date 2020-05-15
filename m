From: =?UTF-8?q?Bernhard=20=C3=9Cbelacker?= <bernhardu@mailbox.org>
Subject: [PATCH v2] platform/x86: touchscreen_dmi: Add info for the Trekstor Yourbook C11B
Date: Fri, 15 May 2020 17:59:12 +0200
Message-ID: <20200515155912.48032-1-bernhardu@mailbox.org>
References: <CAHp75VfAeyMnwoJi8P0d4Gs5dziUQYhPGzS2fmev00UiRZ6vaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfAeyMnwoJi8P0d4Gs5dziUQYhPGzS2fmev00UiRZ6vaQ@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Bernhard=20=C3=9Cbelacker?= <bernhardu@mailbox.org>, Otmar Meier <otmarjun.meier@nexgo.de>
List-Id: platform-driver-x86.vger.kernel.org

Add touchscreen info for the Trekstor Yourbook C11B. It seems to
use the same touchscreen as the Primebook C11, so we only add a new DMI
match.

Cc: Otmar Meier <otmarjun.meier@nexgo.de>
Reported-and-tested-by: Otmar Meier <otmarjun.meier@nexgo.de>
Signed-off-by: Bernhard Übelacker <bernhardu@mailbox.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 87591cea127a..f9d9045cdf40 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1197,6 +1197,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "TREK.G.WI71C.JGBMRBA05"),
 		},
 	},
+	{
+		/* Trekstor Yourbook C11B (same touchscreen as the Primebook C11) */
+		.driver_data = (void *)&trekstor_primebook_c11_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TREKSTOR"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "YOURBOOK C11B"),
+		},
+	},
 	{
 		/* Vinga Twizzle J116 */
 		.driver_data = (void *)&vinga_twizzle_j116_data,
-- 
2.26.2
