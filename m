From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: Add WMI driver for controlling AlienFX features on some
 Alienware products
Date: Wed, 9 Apr 2014 18:20:01 +0300
Message-ID: <20140409152001.GA24536@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:42044 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933256AbaDIPUM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Apr 2014 11:20:12 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mario_limonciello@dell.com
Cc: platform-driver-x86@vger.kernel.org

Hello Mario Limonciello,

This is a semi-automatic email about new static checker warnings.

The patch d17a5ee12973: "Add WMI driver for controlling AlienFX
features on some Alienware products" from Apr 4, 2014, leads to the
following Smatch complaint:

drivers/platform/x86/alienware-wmi.c:551 alienware_wmi_exit()
	 warn: variable dereferenced before check 'platform_device' (see line 549)

drivers/platform/x86/alienware-wmi.c
   548	{
   549		alienware_zone_exit(platform_device);
                                    ^^^^^^^^^^^^^^^
   550		remove_hdmi(platform_device);
                            ^^^^^^^^^^^^^^^
   551		if (platform_device) {
                    ^^^^^^^^^^^^^^^
   552			platform_device_unregister(platform_device);
   553			platform_driver_unregister(&platform_driver);

regards,
dan carpenter
