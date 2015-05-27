From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 0/3] Add support for X51-R3 to alienware-wmi
Date: Wed, 27 May 2015 14:36:59 -0500
Message-ID: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

An upcoming Alienware platform, X51-R3 will support some new features in the 
WMI BIOS control API as well as emit some scan codes when particular hardware 
is used in conjunction.

Mario Limonciello (3):
  Add support for X51-R3
  Add support for Alienware graphics amplifier.
  Capture cable events created by Alienware GFX Amplifier.

 drivers/platform/x86/Kconfig         |   1 +
 drivers/platform/x86/alienware-wmi.c | 179 ++++++++++++++++++++++++++++++-----
 2 files changed, 156 insertions(+), 24 deletions(-)

-- 
1.9.1
