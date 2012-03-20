From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 00/14] ACPI4Asus + samsung-laptop patches for 3.4
Date: Tue, 20 Mar 2012 09:53:00 +0100
Message-ID: <1332233594-13099-1-git-send-email-corentin.chary@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from fb1.tech.numericable.fr ([82.216.111.51]:35722 "EHLO
	fb1.tech.numericable.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030640Ab2CTJBA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 20 Mar 2012 05:01:00 -0400
Received: from smtp5.tech.numericable.fr (smtp5.nc.sdv.fr [10.0.0.72])
	by fb1.tech.numericable.fr (Postfix) with ESMTP id DC7C9A5C18
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Mar 2012 09:54:04 +0100 (CET)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>

Hello Matthew,

Here are some patches for Asus and Samsung X86 platform drivers.
You can also pull them from:
   git://github.com/iksaif/platform-drivers-x86.git acpi4asus

Thanks,

AceLan Kao (2):
  asus-wmi: add scalar board brightness adj. support
  asus-wmi: store backlight power status for AIO machine

Chih-Wei Huang (1):
  eeepc-wmi: add extra keymaps for EP121

Corentin Chary (8):
  ACPI / Video: blacklist some samsung laptops
  asus-nb-wmi: ignore useless keys
  asus-wmi: on/off bit is not set when reading the value
  asus-wmi: move WAPF variable into quirks_entry
  asus-nb-wmi: set panel_power correctly
  eeepc-wmi: refine quirks handling
  eeepc-wmi: split et2012 specific hacks
  asus-wmi: don't update power and brightness when using scalar

Dan Carpenter (1):
  samsung-laptop: cleanup return type: mode_t vs umode_t

David Rientjes (2):
  drivers, samsung-laptop: fix initialization of sabi_data in
    sabi_set_commandb
  drivers, samsung-laptop: fix usage of isalnum

 drivers/acpi/video_detect.c           |   49 +++++++++++++++
 drivers/platform/x86/asus-nb-wmi.c    |   12 +++-
 drivers/platform/x86/asus-wmi.c       |   68 ++++++++++++++++-----
 drivers/platform/x86/asus-wmi.h       |   14 +++-
 drivers/platform/x86/eeepc-wmi.c      |  108 +++++++++++++++++++++++++--------
 drivers/platform/x86/samsung-laptop.c |    5 +-
 6 files changed, 207 insertions(+), 49 deletions(-)

-- 
1.7.3.4
