From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH 0/2] add support for acpi interfaces of thinkpad hardware mute
Date: Mon, 16 Sep 2013 15:45:13 +0800
Message-ID: <1379317515-25777-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:39611 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753738Ab3IPHpY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Sep 2013 03:45:24 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, matthew.garrett@nebula.com, ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Newer Thinkpad models comes with a mute hotkey with a mute led. It also comes
with ACPI AML functions to control hardware mute + led. The patches add supports
to enable/disable and to change mute and its led via thinkpad-acpi.

Alex Hung (2):
  thinkpad-acpi: add a kernel parameter to disable hardware mute and its
    led
  thinkpad-acpi: support hardware mute and led

 drivers/platform/x86/thinkpad_acpi.c | 103 +++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

-- 
1.8.1.2
