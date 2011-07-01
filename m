From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 00/16] acpi4asus updates for 3.1
Date: Fri,  1 Jul 2011 11:34:25 +0200
Message-ID: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from fb1.tech.numericable.fr ([82.216.111.51]:51712 "EHLO
	fb1.tech.numericable.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755161Ab1GAJf1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 05:35:27 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user@lists.sourceforge.net>, open list <linux-kernel@vger.kernel.org>

Hi Matthew

Here are my updates for 3.1, most of them were ready for 3.0 but
I missed the merge window. Most of it is wmi stuff (all new notebooks
seems to use the wmi interface).

Thanks,

Corentin Chary (13):
  asus-wmi: fix hwmon/pwm1
  asus-wmi: second part of the version starts at 16 not 8
  asus-wmi: add keyboard backlight support
  asus-wmi: fix section mismatch
  asus-wmi: set backlight type
  asus-wmi: fix keyboard backlight detection
  asus-wmi: add some device ids
  asus-wmi: add thermal sensor
  asus-wmi: check for temp1 presence
  asus-wmi: return proper value in store_cpufv()
  asus-wmi: add CWAP support and clarify the meaning of WAPF bits
  asus-wmi: add gps rfkill support
  asus-wmi: add uwb rfkill support

Seth Forshee (3):
  asus-wmi: Add callback for hotkey filtering
  eeepc-wmi: Add support for T101MT Home/Express Gate key
  asus-wmi: Enable autorepeat for hotkey input device

 drivers/platform/x86/asus-laptop.c |    9 +-
 drivers/platform/x86/asus-nb-wmi.c |   27 ++++-
 drivers/platform/x86/asus-wmi.c    |  240 ++++++++++++++++++++++++++++++++----
 drivers/platform/x86/asus-wmi.h    |    7 +
 drivers/platform/x86/eeepc-wmi.c   |   27 ++++
 5 files changed, 274 insertions(+), 36 deletions(-)

-- 
1.7.3.4
