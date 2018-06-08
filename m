From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Fri, 8 Jun 2018 13:10:57 +0200
Message-ID: <20180608111057.4wxpg7m7nm7suf6n@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi! With up-to-date thinkpad_acpi.ko driver on ThinkPad T480s I'm seeing
a strange behavior of LEDs which are integrated into mic mute (Fn+F4)
and mute (Fn+F1) keys.

When thinkpad_acpi.ko is not loaded, then mute key is working fine. When
pressed, it correctly generates KEY_MUTE on AT Translated Set 2 keyboard
input device and also turn on/of mute led. But when micmute key is
pressed then, nothing happen. No key event is reported and also led is
not turned on/off.

On the other hand, when thinkpad_acpi.ko is loaded, then both buttons
mute and micmute correctly generates input events; mute via AT keyboard
and micmute via ThinkPad Extra Buttons. But led is not changed. When
thinkpad_acpi.ko is loaded it turn off both leds (mute and micmute) and
leds after pressing any of those buttons, leds are not turned on again.

When thinkpad_acpi.ko is unloaded, then pressing mute button again start
switching led on/off.

So it seems that some init sequence of thinkpad_acpi.ko breaks mute led.
And fini sequence of thinkpad_acpi.ko makes mute led working again.

-- 
Pali Rohár
pali.rohar@gmail.com
