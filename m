From: Hans de Goede <hdegoede@redhat.com>
Subject: Proper way to get platform/x86 (thinkpad, ideapad, asus) driver changes
 upstream ?
Date: Mon, 26 May 2014 13:41:21 +0200
Message-ID: <53832861.1030001@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:32258 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751527AbaEZLlb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 May 2014 07:41:31 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Ike Panhc <ike.pan@canonical.com>, Corentin Chary <corentin.chary@gmail.com>

Hi Matthew,

I've a number of platform/x86 driver changes pending, in all
cases I've mailed the maintainer according to get_maintainer,
you and the platform-driver-x86 list. Still these patches don't
seem to be getting any traction, so I'm wondering if I'm doing anything
wrong ?

I'm talking about the following patches:

"thinkpad_acpi: Add mappings for F9 - F12 hotkeys on X240 / T440 / T540"
 (this one has already been reviewed / acked)
"ideapad-laptop: Blacklist rfkill control on the Lenovo Yoga 2 11"
"asus-wmi: Add a no backlight quirk"
"eeepc-wmi: Add no backlight quirk for Asus H87I-PLUS Motherboard"

Thanks,

Hans
