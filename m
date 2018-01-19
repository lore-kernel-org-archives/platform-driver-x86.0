From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Some buttons on the Fujitsu u7[25]7 laptops are not working
Date: Fri, 19 Jan 2018 23:40:11 +0100
Message-ID: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironchief.h-da.de ([141.100.10.235]:41938 "EHLO
        ironchief.h-da.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756314AbeASWqT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jan 2018 17:46:19 -0500
Content-Language: en-GB
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

Hi everybody,

I (not so) recently got new Fujitsu Skylake hardware (u7[25]7) from our HW service provider to replace the e7x6 series and finally found some time to start fixing the issues on Linux.
So just like 1 1/2 years ago some buttons don't work.

And again the brightness buttons are broken - that's on current Ubuntu Bionic AKA some 4.13 kernel, which should have all the i915 patches I backported to fix these problems for us (AKA LiMux) in 2016.

But the appended patch at least fixes the rfkill button and emits a keycode for the microphone mute button.

I'm still pondering about the microphone mute. Should this be handled like the all the other volume buttons, which seem to work without touching the fujitsu-laptop.c driver? I have no idea how these other buttons are forwarded to the sound drivers.
And I'm still wondering about the ECO button, which is still handled via FUNC 0x1002, which was previously just used for extra HW buttons.

So please have a look at my preliminary patch. I don't have the HW with me on the weekend, so won't be able to answer questions regarding the HW before Monday.

Thanks and have a nice WE

Jan-Marek

P.S. this patch not only toggles the rfkill led but correctly sets the software rfkill status (which IMHO is as important as the correct led status).
P.P.S. if someone has a good idea how to "route" the touchpad toggle key to the touchpad drivers without involving the userspace via evrouter, that would be nice too.


From 13df42d4ebaca4e72e28037694c3655480d988cd Mon Sep 17 00:00:00 2001
From: Jan-Marek Glogowski <glogow@fbihome.de>
Date: Fri, 19 Jan 2018 21:48:22 +0100
Subject: [PATCH] Emit some more button events

Seems Fujitsu continues to move HW functionality into software.
These are my observations from the U727.

Fn+F1 is now a button to mute the microphone.
Fn+F5 is now the rfkill button.
Fn+F9 is now labeled ECO and emits a FUNC 0x1002 (args 0x1, 0x0,
0x0) returned 0x40000413

So in addition to the still working KEY_TOUCHPAD_TOGGLE, we now
have to emit KEY_RFKILL for BIT(5) and KEY_MICMUTE for BIT(29).

Emitting the KEY_RFKILL will also correctly toggle the
corresponding led.
---
 fujitsu-laptop.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/fujitsu-laptop.c b/fujitsu-laptop.c
index e31ecfa..f784e89 100644
--- a/fujitsu-laptop.c
+++ b/fujitsu-laptop.c
@@ -462,6 +462,8 @@ static const struct key_entry keymap_default[] = {
        { KE_KEY, KEY4_CODE, { KEY_PROG4 } },
        { KE_KEY, KEY5_CODE, { KEY_RFKILL } },
        { KE_KEY, BIT(26),   { KEY_TOUCHPAD_TOGGLE } },
+       { KE_KEY, BIT(5),    { KEY_RFKILL } },
+       { KE_KEY, BIT(29),   { KEY_MICMUTE } },
        { KE_END, 0 }
 };

@@ -915,7 +917,7 @@ static void acpi_fujitsu_laptop_release(struct acpi_device *device)
 static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 {
        struct fujitsu_laptop *priv = acpi_driver_data(device);
-       int scancode, i = 0;
+       int scancode, i = 0, funcret;
        unsigned int irb;

        if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
@@ -949,9 +951,15 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
         * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
         * handled in software; its state is queried using FUNC_FLAGS
         */
-       if ((priv->flags_supported & BIT(26)) &&
-           (call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26)))
-               sparse_keymap_report_event(priv->input, BIT(26), 1, true);
+       if (priv->flags_supported & (BIT(26) | BIT(5) | BIT(29))) {
+               funcret = call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0);
+               if (funcret & BIT(29))
+                       sparse_keymap_report_event(priv->input, BIT(29), 1, true);
+               else if (funcret & BIT(26))
+                       sparse_keymap_report_event(priv->input, BIT(26), 1, true);
+               else if (funcret & BIT(5))
+                       sparse_keymap_report_event(priv->input, BIT(5), 1, true);
+       }
 }

 /* Initialization */
-- 
2.7.4
