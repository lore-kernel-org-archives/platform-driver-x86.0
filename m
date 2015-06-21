From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 0/4] Fixes for dell-laptop.c driver
Date: Sun, 21 Jun 2015 10:39:25 +0200
Message-ID: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:37544 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752610AbbFUIkK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 21 Jun 2015 04:40:10 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

This patch series contains contains two fixes (properly check return
values of all SMBIOS calls and fix calling correct page alloc/free
functions) and documentation update together with extending debugfs
code. Patch which fixes calling page alloc/free functions should be
backported to stable kernel series as it it fix kernel crash.

Pali Roh=C3=A1r (4):
  dell-laptop: Update information about wireless control
  dell-laptop: Check return value of all SMBIOS calls
  dell-laptop: Fix allocating & freeing SMI buffer page
  dell-laptop: Show info about WiGig and UWB in debugfs

 drivers/platform/x86/dell-laptop.c |  244 ++++++++++++++++++++++++++++=
--------
 1 file changed, 193 insertions(+), 51 deletions(-)

--=20
1.7.9.5
