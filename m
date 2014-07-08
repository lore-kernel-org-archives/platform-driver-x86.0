From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 0/2] asus-wmi: Disable acpi-video backlight on desktop machi
Date: Tue,  8 Jul 2014 10:47:20 +0200
Message-ID: <1404809242-8575-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42786 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751610AbaGHIrh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Jul 2014 04:47:37 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net

Hi All,

Here is v2 of my patch series to stop certain asus desktop motherboards
registering a backlight interface for a non-existent backlight.

Changes since v1:
-Simply stop acpi-video from registering a backlight interface on all boards
 with a dmi-chassis-type of desktop rather then using a dmi-product-name based
 blacklist
-Add a patch to make the asus-wmi not register its own backlight interface
 despite the BIOS having no support for it

Regards,

Hans
