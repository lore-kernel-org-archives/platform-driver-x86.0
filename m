From: Y Paritcher <y.linux@paritcher.com>
Subject: [PATCH 0/3] platform/x86: dell-wmi: new keys
Date: Mon,  8 Jun 2020 00:22:23 -0400
Message-ID: <cover.1591584631.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

add new backlight events with a type of 0x0010 and a code of 0x57 / 0x58,
add a new keymap type table 0x0012 for keycode of 0xe035 from the Fn-lock
key
extend bios_to_linux_keycode to 2 bytes to allow for a new keycode 0xffff

Y Paritcher (3):
  platform/x86: dell-wmi: add new backlight events
  platform/x86: dell-wmi: add new keymap type 0x0012
  platform/x86: dell-wmi: add new dmi keys to bios_to_linux_keycode

 drivers/platform/x86/dell-wmi.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

-- 
2.27.0
