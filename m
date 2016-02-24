From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v4 0/5] Process Dell Instant Launch hotkey on Vostro V131 and Inspiron M5110
Date: Wed, 24 Feb 2016 08:20:10 +0100
Message-ID: <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This patch series makes use of the API exported by dell-smbios, so it
should be applied to either testing or dell-smbios.

Changes from v3:

  - Extract code issuing the WMI-controlling SMBIOS request into a
    separate function

  - Document the SMBIOS request used

  - Split keymap section "Shortcut and audio panel keys" into two
    separate sections

Changes from v2:

  - Use a static variable instead of a quirk structure

  - Use API exported by dell-smbios to issue the SMBIOS request required
    for generating WMI events, returning with error from dell_wmi_init()
    if it fails

  - Move dell_smi_error() from dell-laptop to dell-smbios and use it to
    determine error code for returning from dell_wmi_init() when
    enabling WMI fails

  - Support Dell Inspiron M5110

Changes from v1:

  - Use DMI matching instead of a module parameter
  - Change flag name to improve readability

 drivers/platform/x86/Kconfig       |    1 +
 drivers/platform/x86/dell-laptop.c |   30 ++++---------
 drivers/platform/x86/dell-smbios.c |   16 +++++++
 drivers/platform/x86/dell-smbios.h |    2 +
 drivers/platform/x86/dell-wmi.c    |   84 +++++++++++++++++++++++++++++++++++-
 5 files changed, 109 insertions(+), 24 deletions(-)

-- 
1.7.10.4
