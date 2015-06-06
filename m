From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v5 0/3] Dell Airplane Mode Switch driver
Date: Sat,  6 Jun 2015 10:23:27 +0200
Message-ID: <1433579010-10509-1-git-send-email-pali.rohar@gmail.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:34186 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750901AbbFFIX5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 6 Jun 2015 04:23:57 -0400
In-Reply-To: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

This patch series add new acpi Dell Airplane Mode Switch driver (DELLAB=
CE and
DELRBTN acpi devices). It provides radio HW switch events (together wit=
h current
state of radio devices) and export them via rfkill interface. These eve=
nts are
also used in dell-laptop driver instead i8042 filter hook function (whe=
n acpi
device is available).

In v2 was added support for laptops which have toggle button instead HW=
 slider
switch. For that I reused code done by Alex Hung.

v3 is just cleanup.

In v4 was fixed dependency problems.

In v5 was fixed checkpatch.pl problems.

Pali Roh=C3=A1r (3):
  dell-rbtn: Dell Airplane Mode Switch driver
  dell-rbtn: Export notifier for other kernel modules
  dell-laptop: Use dell-rbtn instead i8042 filter when possible

 MAINTAINERS                        |    5 +
 drivers/platform/x86/Kconfig       |   16 ++
 drivers/platform/x86/Makefile      |    1 +
 drivers/platform/x86/dell-laptop.c |   94 +++++++-
 drivers/platform/x86/dell-rbtn.c   |  423 ++++++++++++++++++++++++++++=
++++++++
 drivers/platform/x86/dell-rbtn.h   |   24 ++
 6 files changed, 555 insertions(+), 8 deletions(-)
 create mode 100644 drivers/platform/x86/dell-rbtn.c
 create mode 100644 drivers/platform/x86/dell-rbtn.h

--=20
1.7.9.5
