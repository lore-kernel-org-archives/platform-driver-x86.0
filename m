From: Y Paritcher <y.linux@paritcher.com>
Subject: [PATCH v3 0/3] platform/x86: dell-wmi: new keys
Date: Mon,  8 Jun 2020 23:52:51 -0400
Message-ID: <cover.1591673143.git.y.linux@paritcher.com>
References: <cover.1591584631.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1591584631.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

Extended data and events like Fn lock are currently ignored.
This is consistent with what was done until now.
Changing this is out of scope of this patch and would require
rethinking how events are processed, as on some devices the status
is sent as it own event, and on some devices via extended data.
That is also dependent on better docs from the team at Dell.

The keycode 0xffff look to be a special case and was added as an
exception code (Thanks Randy for the implementation).
It was not found for any key on my device, it is only located in
the DMI table parsed at boot into the keymap.

Overall I am trying to get useless data (to me) out of my syslog
by documenting the correct scancode/keycode mappings

Y Paritcher (3):
  platform/x86: dell-wmi: add new backlight events
  platform/x86: dell-wmi: add new keymap type 0x0012
  platform/x86: dell-wmi: add new dmi mapping for keycode 0xffff

 drivers/platform/x86/dell-wmi.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

-- 
2.27.0
