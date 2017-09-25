From: <gregkh@linuxfoundation.org>
Subject: patch "platform/x86: toshiba_acpi: drop assignment of iio_info.driver_module" added to staging-next
Date: Mon, 25 Sep 2017 13:22:40 +0200
Message-ID: <15063385603206@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:50132 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933200AbdIYLYU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2017 07:24:20 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jic23@kernel.org, Jonathan.Cameron@huawei.com, andy.shevchenko@gmail.com, coproscefalo@gmail.com, lars@metafoo.de, platform-driver-x86@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    platform/x86: toshiba_acpi: drop assignment of iio_info.driver_module

to my staging git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
in the staging-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


From 2a9e7f2f03d129f21f39b701f9086300608279fe Mon Sep 17 00:00:00 2001
From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 23 Jul 2017 17:26:20 +0100
Subject: platform/x86: toshiba_acpi: drop assignment of iio_info.driver_module

This is now handled by use of a macro for device registration.  The field
in iio_info will be going away shortly as it is no longer used.

Cc: <platform-driver-x86@vger.kernel.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Azael Avalos <coproscefalo@gmail.com>
Reviewed-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/platform/x86/toshiba_acpi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index bb1dcd7fbdeb..e8d058c5ef21 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2510,7 +2510,6 @@ static const struct iio_chan_spec toshiba_iio_accel_channels[] = {
 };
 
 static const struct iio_info toshiba_iio_accel_info = {
-	.driver_module = THIS_MODULE,
 	.read_raw = &toshiba_iio_accel_read_raw,
 };
 
-- 
2.14.1
