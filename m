From: Kenneth Chan <kenneth.t.chan@gmail.com>
Subject: [PATCH 0/9] platform/x86: panasonic-laptop: add optical drive, brightness and battery charging threshold
Date: Sat, 22 Aug 2020 02:14:24 +0800
Message-ID: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: laforge@gnumonks.org, Kenneth Chan <kenneth.t.chan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org


This patch series is to follow up https://lkml.org/lkml/2020/8/19/186

Martin Lucina <mato@kotelna.sk> added a platform device to power on/off the
optical drive. The patch somehow never made its way to upstream.
This patch merges his work.

The Panasonic Let's Note series have firmware registers that store the
state of mute, AC/DC brightness, current brightness and battery charging
threshold (ECO mode). This patch series also add support to them. 


Kenneth Chan (9):
  add support for optical driver power in Y and W series
  replace ACPI prints with pr_*() macros
  split MODULE_AUTHOR() by one author per macro call
  fix naming of platform files for consistency with other modules
  fix sticky key init bug
  add write support to mute
  resolve hotkey double trigger bug
  add support for battery charging threshold (eco mode)
  add platform devices for firmware brightness registers

 drivers/platform/x86/panasonic-laptop.c | 509 +++++++++++++++++++++---
 1 file changed, 454 insertions(+), 55 deletions(-)


base-commit: 06a4ec1d9dc652e17ee3ac2ceb6c7cf6c2b75cdd
-- 
2.17.5
