From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/4] toshiba_acpi: Refactor *{get, set} and *available functions
Date: Wed, 22 Jul 2015 19:37:50 -0600
Message-ID: <1437615474-27936-5-git-send-email-coproscefalo@gmail.com>
References: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

These patches changes the *{get, set} and available *functions,
changes the printed messages of the supported features and bumps the
driver version to 0.23.

Azael Avalos (4):
  toshiba_acpi: Change *available functions return type
  toshiba_acpi: Remove "*not supported" feature prints
  toshiba_acpi: Refactor *{get, set} functions return value
  toshiba_acpi: Bump driver version to 0.23

 drivers/platform/x86/toshiba_acpi.c | 546 ++++++++++++++++++------------------
 1 file changed, 274 insertions(+), 272 deletions(-)

-- 
2.4.5
