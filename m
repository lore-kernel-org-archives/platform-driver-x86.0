From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/3] toshiba_acpi: Accelerometer updates
Date: Sat, 11 Jun 2016 12:52:43 -0600
Message-ID: <20160611185245.14155-1-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33020 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751708AbcFKSww (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 11 Jun 2016 14:52:52 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These series of patches update the accelerometer axis data
reporting to use the IIO subsystem, deprecating the custom
position sysfs entry, and finally bumping the driver version
to 0.24.

Azael Avalos (3):
  toshiba_acpi: Add IIO interface for accelerometer axis data
  toshiba_acpi: Remove the position sysfs entry
  toshiba_acpi: Bump driver version and update copyrignt year

 drivers/platform/x86/toshiba_acpi.c | 147 +++++++++++++++++++++++++++++-------
 1 file changed, 120 insertions(+), 27 deletions(-)

-- 
2.8.3
