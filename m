From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 00/14] Support Asus WMI capable Notebooks (asus-wmi, asus-nb-wmi and eeepc-wmi)
Date: Sat, 26 Feb 2011 10:20:29 +0100
Message-ID: <1298712045-17671-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:51278 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751707Ab1BZJWT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 26 Feb 2011 04:22:19 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Corentin Chary <corentincj@iksaif.net>, Randy Dunlap <rdunlap@xenotime.net>, Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>, "David S. Miller" <davem@davemloft.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user@lists.sourceforge.net>

Hi Matthew,

I hope this series won't break anything, because there are a lot of change.
Two new modules, asus-wmi.ko and asus-nb-wmi.ko, and almost all the code
of eeepc-wmi.c is now in asus-wmi.c.

I was able to test asus-nb-wmi.ko on a very new G73 laptop over ssh, and it
seems to work well.

More features are comming (keyboard backlight, more sensors, etc...), but
I think it's important to merge the first step as soon as possible.

Thanks,

Corentin Chary (14):
  asus-wmi: move generic code to asus-wmi
  eeepc-wmi: asus generic asus-wmi.ko module
  asus-wmi: minor cleanups
  asus-wmi: introduce struct asus_rfkill
  asus-wmi: handle "unknown status" bit
  asus-wmi: factorise wmi_evaluate_method call
  asus-wmi: try to guess the right DSTS methods
  asus-wmi: fix and clean backlight code
  asus-wmi: add calls to INIT, SPEC and SFUN on init
  asus-wmi: allow debugfs interface to call arbitrary method
  asus-nb-wmi: Asus Notebooks WMI Driver
  asus-wmi: add some common device ids and method ids
  asus-wmi: add hwmon interface and pwm1
  eeepc-wmi: restore KEY_CAMERA_* keys lost in 190ca27

 Documentation/ABI/testing/sysfs-platform-asus-wmi  |   31 +
 Documentation/ABI/testing/sysfs-platform-eeepc-wmi |   31 -
 MAINTAINERS                                        |   30 +-
 drivers/platform/x86/Kconfig                       |   39 +-
 drivers/platform/x86/Makefile                      |    2 +
 drivers/platform/x86/asus-nb-wmi.c                 |   98 ++
 drivers/platform/x86/asus-wmi.c                    | 1655 ++++++++++++++++++++
 drivers/platform/x86/asus-wmi.h                    |   58 +
 drivers/platform/x86/eeepc-wmi.c                   | 1372 +----------------
 9 files changed, 1924 insertions(+), 1392 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-asus-wmi
 delete mode 100644 Documentation/ABI/testing/sysfs-platform-eeepc-wmi
 create mode 100644 drivers/platform/x86/asus-nb-wmi.c
 create mode 100644 drivers/platform/x86/asus-wmi.c
 create mode 100644 drivers/platform/x86/asus-wmi.h

-- 
1.7.4
