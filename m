From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 3/4] platform/x86: peaq-wmi: Evaluate wmi method with instance number 0x0
Date: Sat, 12 Aug 2017 09:44:17 +0200
Message-ID: <1502523858-25716-4-git-send-email-pali.rohar@gmail.com>
References: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Hans de Goede <hdegoede@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

According to Hans de Goede, WMI interface of thh peaq-wmi module has 10
instances but corresponding ACPI WMBC method does not check Arg0 (instance
number) at all. Therefore evaluate WMI method with first instance number
(0x0) instead of second (0x1).

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/peaq-wmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
index 77d1f90..f59a5a2 100644
--- a/drivers/platform/x86/peaq-wmi.c
+++ b/drivers/platform/x86/peaq-wmi.c
@@ -39,7 +39,7 @@ static void peaq_wmi_poll(struct input_polled_dev *dev)
 	struct acpi_buffer input = { sizeof(dummy), &dummy };
 	struct acpi_buffer output = { sizeof(obj), &obj };
 
-	status = wmi_evaluate_method(PEAQ_DOLBY_BUTTON_GUID, 1,
+	status = wmi_evaluate_method(PEAQ_DOLBY_BUTTON_GUID, 0,
 				     PEAQ_DOLBY_BUTTON_METHOD_ID,
 				     &input, &output);
 	if (ACPI_FAILURE(status))
-- 
1.7.9.5
