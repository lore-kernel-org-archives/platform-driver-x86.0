From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCHv2 0/2] platform/x86: asus-wmi: Substitute quirk_no_rfkill with a generic fix
Date: Mon, 20 Feb 2017 14:50:21 -0500
Message-ID: <20170220195023.17775-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:34493 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751454AbdBTTuw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2017 14:50:52 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

The quirk avoids the conflicting usage of ASUS_WMI_DEVID_WLAN_LED (0x00010002)
by both asus-wireless and asus-wmi on machines where the BIOS can't set and
record the wlan status (wlan_ctrl_by_user in asus-wmi.c). At the moment we have
six models quirked upstream, but another fifteen downstream, and we expect this
list to continue growing.

This series makes use of ASUS_WMI_DSTS_USER_BIT plus the status of the ASHS
device to skip asus_wmi_rfkill_init(), instead of static DMI-based quirks.

João Paulo Rechi Vita (2):
  platform/x86: asus-wmi: Detect quirk_no_rfkill from the DSDT
  platform/x86: asus-wmi: Remove quirk_no_rfkill

 drivers/platform/x86/asus-nb-wmi.c | 49 ++------------------------------------
 drivers/platform/x86/asus-wmi.c    | 22 +++++++++++++----
 drivers/platform/x86/asus-wmi.h    |  1 -
 3 files changed, 19 insertions(+), 53 deletions(-)

-- 
2.11.0
