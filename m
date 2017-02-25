From: Christian Kellner <ckellner@redhat.com>
Subject: [PATCH 0/2] Support for T470s hotkeys
Date: Sat, 25 Feb 2017 19:20:28 +0100
Message-ID: <20170225182030.19232-1-ckellner@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54844 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751568AbdBYSUy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Feb 2017 13:20:54 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Christian Kellner <ckellner@redhat.com>

Hi!

On the new Levnovo T470s there are 4 hotkeys that emit currently
unsupported hkey event (0x1311 .. 0x1315). According to the manual
they are 'lanuch user selected fav. application' (0x1311), the
'snipping tool' (0x1312), 'enable/disable bluetooth' (0x1314) and
launch the keyboard settings dialog (0x1315). I tried to map them
to the corresponding input event codes, although I have to say
I am not 100% sure about the user selected fav app (KEY_FAVORITES).

Hans already did a round of review of it (thanks very much!),
comments are of course welcome!

Cheers,
Ck

Christian Kellner (2):
  platform/x86: thinkpad_acpi: guard generic hotkey case
  platform/x86: thinkpad_acpi: add mapping for new hotkeys on T470

 drivers/platform/x86/thinkpad_acpi.c | 97 ++++++++++++++++++++++++++++++------
 1 file changed, 82 insertions(+), 15 deletions(-)

-- 
Dr. Christian J. Kellner
Desktop Hardware Enablement
Red Hat
