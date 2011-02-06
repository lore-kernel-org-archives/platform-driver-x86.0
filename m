From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 0/2] eeepc-wmi input patchs
Date: Sun,  6 Feb 2011 13:30:46 +0100
Message-ID: <1296995448-5591-1-git-send-email-corentincj@iksaif.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Corentin Chary <corentincj@iksaif.net>, Dmitry Torokhov <dtor@mail.ru>, Henrik Rydberg <rydberg@euromail.se>, Daniel Mack <daniel@caiaq.de>, Mauro Carvalho Chehab <mchehab@redhat.com>, Chase Douglas <chase.douglas@canonical.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,
These two patchs are separated from the other batch because they
may be delayed or re-worked.

The first patch add some camera specific keys, we can probably
use arrows and +/- to do the same thing, but then we loose some
keyboard information (eg: no distinction between Fn+E and Arrow Up).

The other patch only add some comments to some ambiguously mapped
keys. We may want to define to new key codes for these...

Corentin Chary (2):
  eeepc-wmi: add camera keys
  eeepc-wmi: comments keymap to clarify the meaning of some keys

 drivers/platform/x86/eeepc-wmi.c |   13 ++++++++++---
 include/linux/input.h            |    7 +++++++
 2 files changed, 17 insertions(+), 3 deletions(-)

-- 
1.7.4.rc3
