From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: ACER: Add support for accelerometer sensor
Date: Wed, 27 Jun 2012 16:15:34 +0300
Message-ID: <20120627131534.GA31703@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:48993 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751720Ab2F0NPr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jun 2012 09:15:47 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: marex@denx.de
Cc: platform-driver-x86@vger.kernel.org

Hello Marek Vasut,

The patch 6ae3a0876185: "ACER: Add support for accelerometer sensor"
from Jun 1, 2012, leads to the following Smatch warning:
drivers/platform/x86/acer-wmi.c:1886 acer_wmi_accel_destroy()
	 error: don't call input_free_device() after input_unregister_device()

drivers/platform/x86/acer-wmi.c
  1883  static void acer_wmi_accel_destroy(void)
  1884  {
  1885          input_unregister_device(acer_wmi_accel_dev);
  1886          input_free_device(acer_wmi_accel_dev);
  1887  }

It is a double free.

regards,
dan carpenter
