From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 0/2] Fixes for dell-wmi
Date: Thu, 24 Dec 2015 22:18:44 +0100
Message-ID: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch series adds check if Dell WMI descriptor structure is valid =
and
fixes processing WMI events on devices with WMI interface version 0.

After testing, second patch is good candidate for backporting into stab=
le
kernels, but problem is that it cannot be used without first patch. So =
I
let decision to other people.

Gabriele and Micha=C5=82, this patch series should fix processing event=
s on
yours Dell laptops (you have in DSDT defined version 0). Can you test i=
t?

Pali Roh=C3=A1r (2):
  dell-wmi: Check if Dell WMI descriptor structure is valid
  dell-wmi: Process only one event on devices with interface version 0

 drivers/platform/x86/dell-wmi.c |   94 +++++++++++++++++++++++++++++++=
+++++++-
 1 file changed, 92 insertions(+), 2 deletions(-)

--=20
1.7.9.5
