From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/3] toshiba_acpi: Functions cleanup
Date: Mon, 29 Aug 2016 09:37:33 -0600
Message-ID: <20160829153736.18273-1-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

These set of patches make some cleanup in some of the driver's functions.

The first patch changes the variables declaration, the second changes
the error checking logic and the third simply fixes a typo found while
making these changes.

Changes since v1:
- Small changes to patch 01 acording to Darren's comments
- Added a missing return on *eco_mode_available function

Azael Avalos (3):
  toshiba_acpi: Clean up variable declaration
  toshiba_acpi: Change error checking logic from TCI functions
  toshiba_acpi: Fix typo in *_cooling_method_set function

 drivers/platform/x86/toshiba_acpi.c | 261 +++++++++++++++++++++---------------
 1 file changed, 154 insertions(+), 107 deletions(-)

-- 
2.9.3
