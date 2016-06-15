From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v3 0/4] dell-wmi: Changes in WMI event code handling
Date: Wed, 15 Jun 2016 21:49:09 +0200
Message-ID: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:38240 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752901AbcFOTt2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Jun 2016 15:49:28 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

=46irst patch describe problem about 0xe045 code. Second and third are =
just
cosmetic and last rework code which processing WMI events. It should be
properly tested on more Dell machines, to check that everything is stil=
l
working correctly.

Changes since v2:
* Updated description for 2/4 and 4/4
* Fixed comments over 80 characters in 2/4 and 4/4
* Use switch fall-through in 4/4
* Added Micha=C5=82's Reviewed-by line

Changes since v1:
* Fixed comments
* Fixed memory leak
* Added Tested-By lines
* Added event 0xe06e

Pali Roh=C3=A1r (4):
  dell-wmi: Ignore WMI event code 0xe045
  dell-wmi: Sort WMI event codes and update comments
  dell-wmi: Add information about other WMI event codes
  dell-wmi: Generate one sparse keymap for all machines

 drivers/platform/x86/dell-wmi.c |  290 ++++++++++++++++++++++---------=
--------
 1 file changed, 166 insertions(+), 124 deletions(-)

--=20
1.7.9.5
