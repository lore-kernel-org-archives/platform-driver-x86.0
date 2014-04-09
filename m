From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: toshiba_acpi: Add keyboard backlight support
Date: Wed, 9 Apr 2014 18:20:24 +0300
Message-ID: <20140409152024.GB24536@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:42341 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933256AbaDIPUf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Apr 2014 11:20:35 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: coproscefalo@gmail.com
Cc: platform-driver-x86@vger.kernel.org

Hello Azael Avalos,

The patch 811be48a6c0e: "toshiba_acpi: Add keyboard backlight
support" from Mar 25, 2014, leads to the following static checker
warning:

	drivers/platform/x86/toshiba_acpi.c:1742 toshiba_acpi_add()
	warn: we tested 'ret' before and it was 'false'

drivers/platform/x86/toshiba_acpi.c
  1736          ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,
  1737                                   &toshiba_attr_group);
  1738          if (ret) {
                    ^^^
  1739                  dev->sysfs_created = 0;
  1740                  goto error;
                             ^^^^^
  1741          }
  1742          dev->sysfs_created = !ret;
                                     ^^^^
  1743  
  1744          create_toshiba_proc_entries(dev);


regards,
dan carpenter
