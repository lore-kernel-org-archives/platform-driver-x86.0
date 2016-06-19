From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/3] toshiba_acpi: Accelerometer updates
Date: Sun, 19 Jun 2016 17:27:01 -0600
Message-ID: <20160619232703.8820-1-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f194.google.com ([209.85.214.194]:34621 "EHLO
	mail-ob0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751359AbcFSX1I (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 19 Jun 2016 19:27:08 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These series of patches update the accelerometer axis data
reporting to use the IIO subsystem, deprecating the custom
position sysfs entry, and finally bumping the driver version
to 0.24.

Changes since v1:
- Small format and style changes
- Changed the iio code according to feedback from Jonathan Cameron

Azael Avalos (3):
  toshiba_acpi: Add IIO interface for accelerometer axis data
  toshiba_acpi: Remove the position sysfs entry
  toshiba_acpi: Bump driver version and update copyright year

 drivers/platform/x86/toshiba_acpi.c | 136 +++++++++++++++++++++++++++++-------
 1 file changed, 109 insertions(+), 27 deletions(-)

-- 
2.8.4
