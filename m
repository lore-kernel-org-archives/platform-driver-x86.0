From: Julian Andres Klode <jak@jak-linux.org>
Subject: [PATCH 0/4] thinkpad_acpi: Add support for controlling charge thresholds
Date: Mon, 11 Nov 2013 14:56:29 +0100
Message-ID: <1384178195-12218-1-git-send-email-jak@jak-linux.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:46126 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753891Ab3KKN4q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Nov 2013 08:56:46 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <matthew.garrett@nebula.com>
Cc: Julian Andres Klode <jak@jak-linux.org>, "open list:THINKPAD ACPI EXT..." <ibm-acpi-devel@lists.sourceforge.net>, "open list:THINKPAD ACPI EXT..." <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

This patch series adds support for specifying charging thresholds,
forcing a battery to discharge, and inhibiting charging, on ThinkPad
Laptops using Sandy Bridge or newer processors.

The first two patches should be stable now, the third one does not work on
my test system (but I'd appreciate if anyone with something other than an
X230 tests it). 

The inhibit charging part is a bit unprecise, and I can obviously not test
that -1 really means permanently, but I assume it does. I don't know whether
this one should be merged.

Changes since the RFC PATCH:
  - Define batteries more dynamically instead of statically using large
    macros. Added support for up to 3 batteries, unsupported ones will not
    be exported.
  - Added 3 more new patches with more features

Julian Andres Klode (4):
  thinkpad_acpi: Add support for controlling charge thresholds
  thinkpad_acpi: battery: Add force_discharge attribute
  thinkpad_acpi: battery: Add force_discharge_ac_break attribute
  thinkpad_acpi: battery: Add inhibit_charge_minutes attribute

 Documentation/laptops/thinkpad-acpi.txt |  37 ++++
 drivers/platform/x86/thinkpad_acpi.c    | 300 ++++++++++++++++++++++++++++++++
 2 files changed, 337 insertions(+)

-- 
1.8.4.2
