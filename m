From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 0/8] asus-wmi: Get rid of quirk_no_rfkill{,_wapf4}
Date: Thu, 26 Jan 2017 10:30:05 -0500
Message-ID: <20170126153013.12753-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

This quirk avoids the conflicting usage of ASUS_WMI_DEVID_WLAN_LED (0x00010002)
by both asus-wireless and asus-wmi on machines where the BIOS can't set and
record the wlan status (wlan_ctrl_by_user in asus-wmi.c). At the moment we have
six models using that quirk upstream, but there are another fifteen for which
we have downstream patches, and will send upstream unless we find a more
dynamic solution. We also expect this list to continue growing.

This series makes use of ASUS_WMI_DSTS_USER_BIT plus the status of the ASHS
device to skip asus_wmi_rfkill_init(). Since asus-wmi now needs to know the ASHS
_HIDs, I have moved device_ids[] to a new header file, asus-wireless.h. I'm not
sure if there are any best practices in the kernel community against having one
module including headers from a different module, but I wanted to avoid
duplicating this list or creating an ordering dependency between the modules.
Any advice on alternatives here are welcome.

PS: I don't think asus-wireless.h needs to also be listed in MAINTAINERS,
please correct me if I'm wrong.

João Paulo Rechi Vita (8):
  Revert "asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UA"
  Revert "asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UF"
  Revert "asus-wmi: Add quirk_no_rfkill for the Asus Z550MA"
  Revert "asus-wmi: Add quirk_no_rfkill for the Asus U303LB"
  Revert "asus-wmi: Add quirk_no_rfkill for the Asus N552VW"
  Revert "asus-wmi: Create quirk for airplane_mode LED"
  asus-wireless: Export ids list
  asus-wmi: Don't register rfkill if ASHS and user bit are present

 drivers/platform/x86/asus-nb-wmi.c   | 49 ++----------------------------------
 drivers/platform/x86/asus-wireless.c | 15 +++++------
 drivers/platform/x86/asus-wireless.h | 10 ++++++++
 drivers/platform/x86/asus-wmi.c      | 21 ++++++++++++----
 drivers/platform/x86/asus-wmi.h      |  1 -
 5 files changed, 34 insertions(+), 62 deletions(-)
 create mode 100644 drivers/platform/x86/asus-wireless.h

-- 
2.11.0
