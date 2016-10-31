From: Lyude <lyude@redhat.com>
Subject: [PATCH 0/3] Add support for X1 Yoga (2016) Tablet Mode + refactors
Date: Mon, 31 Oct 2016 18:55:31 -0400
Message-ID: <1477954535-12536-1-git-send-email-lyude@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:57376 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S946166AbcJaWzk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Oct 2016 18:55:40 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net
Cc: Lyude <lyude@redhat.com>, Daniel Martin <consume.noise@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Updated patchset for adding support for detecting tablet mode on the X1 Yoga
2016 model, along with some refactoring suggested by Daniel.

Important: I realized I never actually tried testing this on any of the older
Thinkpad tablets. If someone has one who is willing to test let me know,
otherwise I'll test it out when I get to the office on Thursday.

Signed-off-by: Lyude <lyude@redhat.com>
Cc: Daniel Martin <consume.noise@gmail.com>

Lyude (3):
  thinkpad_acpi: Move tablet detection into separate function
  thinkpad_acpi: Don't repeat ourselves in hotkey_init_tablet_mode()
  thinkpad_acpi: Add support for X1 Yoga (2016) Tablet Mode

 drivers/platform/x86/thinkpad_acpi.c | 88 ++++++++++++++++++++++++++++++------
 1 file changed, 73 insertions(+), 15 deletions(-)

-- 
2.7.4
