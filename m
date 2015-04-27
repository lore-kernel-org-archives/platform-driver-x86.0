From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/6] toshiba_bluetooth: Add rfkill code to driver
Date: Mon, 27 Apr 2015 14:32:44 -0600
Message-ID: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

These patches add support to use the rfkill core functionality to the
Toshiba bluetooth driver and adapting the existing code to it.

Azael Avalos (6):
  toshiba_bluetooth: Add a container struct named toshiba_bluetooth_dev
  toshiba_bluetooth: Add RFKill handler functions
  toshiba_bluetooth: Clean toshiba_bluetooth_enable function
  toshiba_bluetooth: Adapt *_notify and *_resume functions to rfkill
  toshiba_bluetooth: Change BT status message to debug
  platform/x86: Add RFKILL dependency to toshiba_bluetooth driver

 drivers/platform/x86/Kconfig             |   1 +
 drivers/platform/x86/toshiba_bluetooth.c | 175 ++++++++++++++++++++++++-------
 2 files changed, 137 insertions(+), 39 deletions(-)

-- 
2.3.5
