From: Y Paritcher <y.linux@paritcher.com>
Subject: [PATCH v2 0/3] platform/x86: dell-wmi: new keys
Date: Mon,  8 Jun 2020 19:05:27 -0400
Message-ID: <cover.1591656154.git.y.linux@paritcher.com>
References: <cover.1591584631.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1591584631.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

As per discussion backlight events are passed on as they are
filtered by acpi-video.

Events of type 0x0012 have extended data in the rest of the
buffer, this data is currently ignored.

The Fn lock key currently is ignored. If userspace has a way
to deal with this a function to pass on the extended data
can be added.

messages of type:
 
    firmware scancode 0xXX maps to unrecognized keycode 0xXXXX

are from unknown keycodes in the DMI table and should be added
to bios_to_linux_keycode to allow them to be processed.

Y Paritcher (3):
  platform/x86: dell-wmi: add new backlight events
  platform/x86: dell-wmi: add new keymap type 0x0012
  platform/x86: dell-wmi: add new dmi keys to bios_to_linux_keycode

 drivers/platform/x86/dell-wmi.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

-- 
2.27.0
