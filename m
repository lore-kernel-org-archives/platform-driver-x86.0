From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 0/3] Dell Airplane Mode Switch driver
Date: Sun, 23 Nov 2014 16:09:18 +0100
Message-ID: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:61844 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237AbaKWPJn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 23 Nov 2014 10:09:43 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

This patch series add new acpi Dell Airplane Mode Switch driver (DELLAB=
CE and
DELRBTN acpi devices). It provides radio HW switch events (together wit=
h current
state of radio devices) and export them via rfkill interface. These eve=
nts are
also used in dell-laptop driver instead i8042 filter hook function (whe=
n acpi
device is available).

Pali Roh=C3=A1r (3):
  platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
  platform: x86: dell-rbtn: Export notifier for other kernel modules
  platform: x86: dell-laptop: Use dell-rbtn instead i8042 filter when
    possible

 drivers/platform/x86/Kconfig       |   14 ++
 drivers/platform/x86/Makefile      |    1 +
 drivers/platform/x86/dell-laptop.c |   67 +++++++++-
 drivers/platform/x86/dell-rbtn.c   |  260 ++++++++++++++++++++++++++++=
++++++++
 drivers/platform/x86/dell-rbtn.h   |   35 +++++
 5 files changed, 372 insertions(+), 5 deletions(-)
 create mode 100644 drivers/platform/x86/dell-rbtn.c
 create mode 100644 drivers/platform/x86/dell-rbtn.h

--=20
1.7.9.5
