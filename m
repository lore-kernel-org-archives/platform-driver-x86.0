From: Eric Curtin <ericcurtin17@gmail.com>
Subject: [PATCH] Remove ambiguous logging for "Unsupported brightness interface"
Date: Wed, 27 Jan 2016 22:14:49 +0000
Message-ID: <CANpvso5_jzOgRv25isy0x6HJcTgKP4dabSH-_a5fM-uihdAUYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Kernel development list <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net
List-Id: platform-driver-x86.vger.kernel.org

Message gets logged on machines that are well supported.

Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c
b/drivers/platform/x86/thinkpad_acpi.c
index a268a7a..4eb41aa 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6661,7 +6661,6 @@ static void __init
tpacpi_detect_brightness_capabilities(void)
                pr_info("detected a 8-level brightness capable ThinkPad\n");
                break;
        default:
-               pr_info("Unsupported brightness interface\n");
                tp_features.bright_unkfw = 1;
                bright_maxlvl = b - 1;
        }
-- 
2.5.0
