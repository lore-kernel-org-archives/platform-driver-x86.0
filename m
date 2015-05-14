From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v3 0/3] Dell Airplane Mode Switch driver
Date: Thu, 14 May 2015 12:54:24 +0200
Message-ID: <1431600868-11737-1-git-send-email-pali.rohar@gmail.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

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

Pali Roh=C3=A1r (3):
  dell-rbtn: Dell Airplane Mode Switch driver
  dell-rbtn: Export notifier for other kernel modules
  dell-laptop: Use dell-rbtn instead i8042 filter when possible

 MAINTAINERS                        |    5 +
 drivers/platform/x86/Kconfig       |   13 ++
 drivers/platform/x86/Makefile      |    1 +
 drivers/platform/x86/dell-laptop.c |   67 +++++-
 drivers/platform/x86/dell-rbtn.c   |  433 ++++++++++++++++++++++++++++=
++++++++
 drivers/platform/x86/dell-rbtn.h   |   35 +++
 6 files changed, 549 insertions(+), 5 deletions(-)
 create mode 100644 drivers/platform/x86/dell-rbtn.c
 create mode 100644 drivers/platform/x86/dell-rbtn.h

--=20
1.7.10.4
