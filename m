From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 00/11] acpi4asus updates
Date: Thu, 29 Nov 2012 09:12:28 +0100
Message-ID: <1354176759-630-1-git-send-email-corentin.chary@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:60704 "EHLO smtp5-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752687Ab2K2INB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 29 Nov 2012 03:13:01 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>

Hi Matthew,
Here are some patches that where lost on the list, plus
some new ones. Please apply them for next merge window.
Thanks,

AceLan Kao (5):
  asus-laptop: correct a touchpad hotkey mapping
  asus-laptop: add all video switch keys
  asus-nb-wmi: correct a touchpad hotkey mapping
  asus-nb-wmi: add all video switch keys
  asus-wmi: add display toggle quirk

Ben Hutchings (1):
  asus-laptop: Do not call HWRS on init

Corentin Chary (5):
  platform-drivers-x86: change my mail
  asus-laptop: map some new keys
  asus-{nb-wmi|laptop}.c: sync keymaps
  asus-wmi: always report brightness key events
  asus-laptop: always report brightness key events

 MAINTAINERS                        |    4 +-
 drivers/platform/x86/asus-laptop.c |  102 ++++++++++++++++++++++--------------
 drivers/platform/x86/asus-nb-wmi.c |   78 ++++++++++++++++++++++-----
 drivers/platform/x86/asus-wmi.c    |   34 ++++++++++---
 drivers/platform/x86/asus-wmi.h    |    9 +++
 drivers/platform/x86/eeepc-wmi.c   |    4 +-
 6 files changed, 166 insertions(+), 65 deletions(-)

-- 
1.7.8.6
