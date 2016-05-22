From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 0/4] dell-wmi: Changes in WMI event code handling
Date: Sun, 22 May 2016 13:36:19 +0200
Message-ID: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:36504 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752407AbcEVLgc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 22 May 2016 07:36:32 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

=46irst patch describe problem about 0xe045 code. Second and third are =
just
cosmetic and last rework code which processing WMI events. It should be
properly tested on more Dell machines, to check that everything is stil=
l
working correctly.

Pali Roh=C3=A1r (4):
  dell-wmi: Ignore WMI event code 0xe045
  dell-wmi: Sort WMI event codes and update comments
  dell-wmi: Add information about other WMI event codes
  dell-wmi: Rework code for generating sparse keymap and processing WMI
    events

 drivers/platform/x86/dell-wmi.c |  285 +++++++++++++++++++++++--------=
--------
 1 file changed, 166 insertions(+), 119 deletions(-)

--=20
1.7.9.5
