From: Jala - <herra.melkor@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Add wapf=4 quirk for Asus X302UA
Date: Tue, 4 Apr 2017 13:14:36 +0300
Message-ID: <CAN88QNC1B6TyqJbNVmCD6J72zdWAJyFyjrCXrXOT=2p5FMGrEQ@mail.gmail.com>
References: <CAN88QNC4bv0JKRxzyCOjDh2pex9t1+7J9WXt2C1d6vOF6tT+eQ@mail.gmail.com>
 <20170403230540.GC17322@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36501 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753084AbdDDKOh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 06:14:37 -0400
Received: by mail-pg0-f66.google.com with SMTP id 81so36271881pgh.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Apr 2017 03:14:37 -0700 (PDT)
In-Reply-To: <20170403230540.GC17322@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Santeri Toivonen <santeri.toivonen@vatsul.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The issue should be corrected in the following.

---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c
b/drivers/platform/x86/asus-nb-wmi.c
index dea98ffb6f60..1ae58d906536 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -144,6 +144,15 @@ static const struct dmi_system_id asus_quirks[] = {
  },
  {
  .callback = dmi_matched,
+ .ident = "ASUSTeK COMPUTER INC. X302UA",
+ .matches = {
+ DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+ DMI_MATCH(DMI_PRODUCT_NAME, "X302UA"),
+ },
+ .driver_data = &quirk_asus_wapf4,
+ },
+ {
+ .callback = dmi_matched,
  .ident = "ASUSTeK COMPUTER INC. X401U",
  .matches = {
  DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.11.0.windows.3
