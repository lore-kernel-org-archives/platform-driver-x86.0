From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 0/8] ACPI4Asus and friends updates
Date: Wed,  3 Oct 2012 11:26:23 +0200
Message-ID: <1349256392-20320-1-git-send-email-corentin.chary@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtpfb1-g21.free.fr ([212.27.42.9]:59284 "EHLO
	smtpfb1-g21.free.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753071Ab2JCJ1V (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 3 Oct 2012 05:27:21 -0400
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 4DFAF2D8DD
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Oct 2012 11:27:17 +0200 (CEST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

From: Corentin Chary <corentincj@iksaif.net>

Hi Matthew,
Some patches collected from AceLan and me for asus related drivers.
Nothing big, mainly keymaps and quirks.
Thanks,

AceLan Kao (5):
  asus-laptop: correct a touchpad hotkey mapping
  asus-laptop: add all video switch keys
  asus-nb-wmi: correct a touchpad hotkey mapping
  asus-nb-wmi: add all video switch keys
  asus-wmi: add display toggle quirk

Corentin Chary (3):
  platform-drivers-x86: change my mail
  asus-laptop: map some new keys
  asus-{nb-wmi|laptop}.c: sync keymaps

 MAINTAINERS                        |    4 +-
 drivers/platform/x86/asus-laptop.c |   61 ++++++++++++++++++++---------
 drivers/platform/x86/asus-nb-wmi.c |   76 +++++++++++++++++++++++++++++-------
 drivers/platform/x86/asus-wmi.c    |   33 ++++++++++++++--
 drivers/platform/x86/asus-wmi.h    |    7 +++
 drivers/platform/x86/eeepc-wmi.c   |    2 +-
 6 files changed, 142 insertions(+), 41 deletions(-)

-- 
1.7.8.6
