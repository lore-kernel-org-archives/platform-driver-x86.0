From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 00/14] platform/x86: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:36 +0100
Message-ID: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34077 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752737AbdCIMMH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2017 07:12:07 -0500
Received: by mail-lf0-f68.google.com with SMTP id y193so4468797lfd.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2017 04:12:06 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy@infradead.org>, Azael Avalos <coproscefalo@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Harald Welte <laforge@gnumonks.org>, Herton Ronaldo Krzesinski <herton@canonical.com>, Ike Panhc <ike.pan@canonical.com>, "Lee, Chun-Yi" <jlee@suse.com>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi everyone,

This patch series removes all uses of sparse_keymap_free() in the x86
platform driver subsystem due to an upcoming change in
sparse_keymap_setup() behavior wrt memory management.  Specifically,
sparse_keymap_setup() will use managed memory for the keymap copy it
creates, which enables it to be automatically freed upon input device
removal, without the need to explicitly call sparse_keymap_free().

I thought it makes sense to post all these patches as a single series.
To minimize spamming, only this cover letter is addressed to all the
maintainers whose drivers are affected by this series, while each of the
subsequent patches will only be sent to the relevant recipients, plus
the platform-driver-x86 mailing list and subsystem maintainers.

Darren, Andy, all these patches should only be applied after merging an
immutable branch called ib/4.10-sparse-keymap-managed from Dmitry
Torokhov's git tree.

 drivers/platform/x86/acer-wmi.c         |  5 +----
 drivers/platform/x86/asus-laptop.c      |  8 ++------
 drivers/platform/x86/asus-wmi.c         |  8 ++------
 drivers/platform/x86/dell-wmi-aio.c     |  6 +-----
 drivers/platform/x86/dell-wmi.c         | 16 ++++------------
 drivers/platform/x86/eeepc-laptop.c     |  8 ++------
 drivers/platform/x86/hp-wmi.c           |  5 +----
 drivers/platform/x86/ideapad-laptop.c   |  5 +----
 drivers/platform/x86/msi-laptop.c       | 14 +++-----------
 drivers/platform/x86/msi-wmi.c          |  9 ++-------
 drivers/platform/x86/panasonic-laptop.c | 18 +++---------------
 drivers/platform/x86/topstar-laptop.c   |  5 +----
 drivers/platform/x86/toshiba-wmi.c      |  5 +----
 drivers/platform/x86/toshiba_acpi.c     |  8 ++------
 14 files changed, 26 insertions(+), 94 deletions(-)

-- 
2.12.0
