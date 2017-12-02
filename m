From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/4] platform/x86: ideapad-laptop: add lenovo RESCUER R720-15IKBN to no_hw_rfkill_list
Date: Sat,  2 Dec 2017 21:45:34 +0800
Message-ID: <20171202134534.3252-4-jiaxun.yang@flygoat.com>
References: <20171202134534.3252-1-jiaxun.yang@flygoat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171202134534.3252-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ike Panhc <ike.pan@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Jargoyhen <rjargoyhen@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: platform-driver-x86.vger.kernel.org

Since Roger Jargoyhen <rjargoyhen@gmail.com> reported that this device doesn't have
Hardware rfkill switch, this patch add it to no_hw_rfkill_list to prevent radio always
be blocked

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 924b07f7db06..4d3c7a6990d4 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -971,6 +971,13 @@ static void ideapad_wmi_notify(u32 value, void *context)
  * report all radios as hardware-blocked.
  */
 static const struct dmi_system_id no_hw_rfkill_list[] = {
+	{
+		.ident = "Lenovo RESCUER R720-15IKBN",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "80WW"),
+		},
+	},
 	{
 		.ident = "Lenovo G40-30",
 		.matches = {
-- 
2.14.1
