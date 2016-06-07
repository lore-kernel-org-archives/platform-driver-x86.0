From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2 0/4] dell-wmi: Changes in WMI event code handling
Date: Wed,  8 Jun 2016 01:32:23 +0200
Message-ID: <1465342347-20635-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

=46irst patch describe problem about 0xe045 code. Second and third are =
just
cosmetic and last rework code which processing WMI events. It should be
properly tested on more Dell machines, to check that everything is stil=
l
working correctly.

Changes since v1:
* Fixed comments
* Fixed memory leak
* Added Tested-By lines
* Added event 0xe06e

Pali Roh=C3=A1r (4):
  dell-wmi: Ignore WMI event code 0xe045
  dell-wmi: Sort WMI event codes and update comments
  dell-wmi: Add information about other WMI event codes
  dell-wmi: Rework code for generating sparse keymap and processing WMI
    events

 drivers/platform/x86/dell-wmi.c |  290 +++++++++++++++++++++++--------=
--------
 1 file changed, 169 insertions(+), 121 deletions(-)

--=20
1.7.9.5
