From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 0/4] Add new wmi support to acer-wmi driver
Date: Thu, 25 Nov 2010 01:39:35 +0800
Message-ID: <1290620379-10133-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:47647 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751869Ab0KXRky (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Nov 2010 12:40:54 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: corentin.chary@gmail.com, dmitry.torokhov@gmail.com, tiwai@novell.com, carlos@strangeworlds.co.uk, jbenc@suse.cz, jdelvare@suse.de, trenn@suse.de, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>

Hi Matthew, 

These patches add new wmi support to acer-wmi driver, included the following
functions:

- Acer wmi hotkey events:
  Acer BIOS applied wmi hotkey events from 2010, this patch adds support.

- Enabled Acer Launch Manager mode:
  Directly enable it to avoid the raw EC behavior conflict with rfkill-input or
  userland solution.

- Add 3G rfkill sysfs file:
  Provide interface to userland for enable/disable 3G function by wmi method.

- Detect the WiFi/Bluetooth/3G devices available:
  Look for OEM type AAh in dmi to get the WiFi/BT/3G devices available.

Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
Reviewed-by: Thomas Renninger <trenn@suse.de>

Lee, Chun-Yi (4):
  Add acer wmi hotkey events support
  Enabled Acer Launch Manager mode
  Add 3G rfkill sysfs file
  Detect the WiFi/Bluetooth/3G devices available

 drivers/platform/x86/Kconfig    |    2 +
 drivers/platform/x86/acer-wmi.c |  400 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 394 insertions(+), 8 deletions(-)
