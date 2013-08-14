From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH 0/2] add sysfs for acpi interfaces of thinkpad hardware mute
Date: Wed, 14 Aug 2013 13:40:00 +0800
Message-ID: <1376458802-11923-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:33027 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751468Ab3HNFkM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Aug 2013 01:40:12 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Newer Thinkpad models comes with a mute hotkey with a mute led. It also comes
with ACPI AML functions to control hardware mute + led. The patches add sysfs
nodes so it is possible to enable, disable and control from user-space.


Alex Hung (2):
  thinkpad-acpi: add sysfs for getting and setting hardware mute
  thinkpad-acpi: add sysfs for enabling and disabling hardware mute

 drivers/platform/x86/thinkpad_acpi.c | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

-- 
1.8.1.2
