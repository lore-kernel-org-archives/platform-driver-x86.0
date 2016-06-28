From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 0/3] toshiba_acpi: Accelerometer updates
Date: Mon, 27 Jun 2016 19:46:42 -0600
Message-ID: <20160628014644.8417-1-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:33971 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751942AbcF1Bqu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Jun 2016 21:46:50 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These series of patches update the accelerometer axis data
reporting to use the IIO subsystem, deprecating the custom
position sysfs entry, and finally bumping the driver version
to 0.24.

Changes since v2:
- Small format and style changes once again
- Renamed toshiba_accel* functions to toshiba_iio_accel* to
  differentiate from the iio functions and the toshiba_acpi
  driver fuctions
- Print error messages instead of bailing out in case the
  iio_device* functions fail, this is to allow the driver
  to continue loading its many functions

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
