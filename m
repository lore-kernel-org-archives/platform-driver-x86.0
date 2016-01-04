From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2 0/2] Fixes for dell-wmi
Date: Mon,  4 Jan 2016 22:26:34 +0100
Message-ID: <1451942796-26574-1-git-send-email-pali.rohar@gmail.com>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:34440 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752064AbcADV0s (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 16:26:48 -0500
In-Reply-To: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

This patch series adds check if Dell WMI descriptor structure is valid =
and
fixes processing WMI events on devices with WMI interface version 0.

After testing, second patch is good candidate for backporting into stab=
le
kernels, but problem is that it cannot be used without first patch. So =
I
let decision to other people.

Pali Roh=C3=A1r (2):
  dell-wmi: Check if Dell WMI descriptor structure is valid
  dell-wmi: Process only one event on devices with interface version 0

 drivers/platform/x86/dell-wmi.c |   96 +++++++++++++++++++++++++++++++=
+++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

--=20
1.7.9.5
