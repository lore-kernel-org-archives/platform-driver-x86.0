From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] platform/x86: acer-wmi: Silence "unsupported" message  a bit
Date: Thu, 16 Aug 2018 09:27:10 +1000
Message-ID: <7ccdc39d7e255547e851497ef9f449715b45f8bd.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Lee, Chun-Yi" <jlee@suse.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

This driver prints that "Unsupported machine..." message on every boot on
ThinkPad X1 Carbon laptops (and I assume a number of other systems), which
causes graphical boots to "glitch" a bit and is rather annoying ...

Make it a pr_debug instead.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 8952173dd380..7f7192e8fdab 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2216,7 +2216,7 @@ static int __init acer_wmi_init(void)
        if (wmi_has_guid(AMW0_GUID1) &&
            !dmi_check_system(amw0_whitelist) &&
            quirks == &quirk_unknown) {
-               pr_err("Unsupported machine has AMW0_GUID1, unable to load\n");
+               pr_debug("Unsupported machine has AMW0_GUID1, unable to load\n");
                return -ENODEV;
        }
  
