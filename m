From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 0/5] toshiba_acpi: Refactor *{get, set} and *available functions
Date: Fri, 31 Jul 2015 21:58:11 -0600
Message-ID: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33521 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750901AbbHAD6Y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 31 Jul 2015 23:58:24 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches changes the *{get, set} and *available functions default
return type, changes the printed messages of the supported features,
removes some unnedded checks and bumps the driver version to 0.23.

Changes since v2:
- Introduced a new patch to remove unnecessary checks instead of
  cramming them in the patch series
- Updated patch descriptions
- Reverted some changes on the previous version to avoid compiler
  warnings

Changes since v1:
- Fixed typos in patch 01 description and use newly created
  *led_registered variables to unregister leds
- Adapt *{lcd, video}_proc functions in patch 03 to ensure we are not
  breaking userspace and updated patch description

Azael Avalos (5):
  toshiba_acpi: Change *available functions return type
  toshiba_acpi: Remove "*not supported" feature prints
  toshiba_acpi: Refactor *{get, set} functions return value
  toshiba_acpi: Remove unnecessary checks and returns in HCI/SCI
    functions
  toshiba_acpi: Bump driver version to 0.23

 drivers/platform/x86/toshiba_acpi.c | 531 +++++++++++++++++-------------------
 1 file changed, 248 insertions(+), 283 deletions(-)

-- 
2.4.6
