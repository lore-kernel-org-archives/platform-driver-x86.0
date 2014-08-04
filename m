From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/2] toshiba_acpi: Qosmio backlight and keymap fixes
Date: Mon,  4 Aug 2014 09:21:00 -0600
Message-ID: <1407165662-1971-1-git-send-email-coproscefalo@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The following two patches fixes some issues regarding
the backlight method on Qosmios series X500/X505 and
X75-A (and probably others too), as well as adding
the latter to the new alternate keymap list.

Azael Avalos (2):
  toshiba_acpi: Add extra check to backlight code
  toshiba_acpi: Add Qosmio X75-A to the alt keymap dmi list

 drivers/platform/x86/toshiba_acpi.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

-- 
2.0.0
