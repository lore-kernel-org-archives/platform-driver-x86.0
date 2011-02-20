From: Anssi Hannula <anssi.hannula@iki.fi>
Subject: [PATCH 0/7] hp-wmi: various patches and 0x1b rfkill support
Date: Sun, 20 Feb 2011 19:01:40 +0200
Message-ID: <1298221307-29980-1-git-send-email-anssi.hannula@iki.fi>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from saarni.dnainternet.net ([83.102.40.136]:45400 "EHLO
	saarni.dnainternet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754352Ab1BTRKm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Feb 2011 12:10:42 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

Hi all!

Here are some patches for the hp-wmi platform driver. The most
interesting bit is support for the wireless query 0x1b, allowing rfkill
to be used on laptops where it is used.

Anssi Hannula (7):
      hp-wmi: check query return value in hp_wmi_perform_query
      hp-wmi: remove a variable that is never read
      hp-wmi: allow setting input and output buffer sizes separately
      hp-wmi: split rfkill initialization out of hp_wmi_bios_setup
      hp-wmi: clear rfkill device pointers when appropriate
      hp-wmi: make rfkill initialization failure non-fatal
      hp-wmi: add rfkill support for wireless query 0x1b
---
 drivers/platform/x86/hp-wmi.c |  312 +++++++++++++++++++++++++++++++++++-----
 1 files changed, 273 insertions(+), 39 deletions(-)

-- 
Anssi Hannula
