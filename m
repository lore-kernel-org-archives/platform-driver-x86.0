From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 0/2] Dell Latitude freefall driver (ACPI SMO8800/SMO8810)
Date: Sat,  3 May 2014 12:47:55 +0200
Message-ID: <1399114077-19314-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:54002 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960AbaECKs4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 3 May 2014 06:48:56 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, Sonal Santan <sonal.santan@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

This patch series add dell-smo8800.ko driver and update program hpfall.=
c

Pali Roh=C3=A1r (2):
  platform: x86: dell-smo8800: Dell Latitude freefall driver (ACPI
    SMO8800/SMO8810)
  Documentation: Rename hpfall.c =3D> freefall.c, fixes for Dell

 Documentation/laptops/00-INDEX      |    4 +-
 Documentation/laptops/freefall.c    |  171 +++++++++++++++++++++++
 Documentation/laptops/hpfall.c      |  146 --------------------
 drivers/platform/x86/Kconfig        |   10 ++
 drivers/platform/x86/Makefile       |    1 +
 drivers/platform/x86/dell-smo8800.c |  253 +++++++++++++++++++++++++++=
++++++++
 6 files changed, 437 insertions(+), 148 deletions(-)
 create mode 100644 Documentation/laptops/freefall.c
 delete mode 100644 Documentation/laptops/hpfall.c
 create mode 100644 drivers/platform/x86/dell-smo8800.c

--=20
1.7.9.5
