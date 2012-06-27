From: Marek Vasut <marex@denx.de>
Subject: Re: ACER: Add support for accelerometer sensor
Date: Wed, 27 Jun 2012 15:32:12 +0200
Message-ID: <201206271532.12841.marex@denx.de>
References: <20120627131534.GA31703@elgon.mountain>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:34074 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754528Ab2F0NcT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jun 2012 09:32:19 -0400
In-Reply-To: <20120627131534.GA31703@elgon.mountain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: platform-driver-x86@vger.kernel.org

Dear Dan Carpenter,

> Hello Marek Vasut,
> 
> The patch 6ae3a0876185: "ACER: Add support for accelerometer sensor"
> from Jun 1, 2012, leads to the following Smatch warning:
> drivers/platform/x86/acer-wmi.c:1886 acer_wmi_accel_destroy()
> 	 error: don't call input_free_device() after input_unregister_device()
> 
> drivers/platform/x86/acer-wmi.c
>   1883  static void acer_wmi_accel_destroy(void)
>   1884  {
>   1885          input_unregister_device(acer_wmi_accel_dev);
>   1886          input_free_device(acer_wmi_accel_dev);
>   1887  }
> 
> It is a double free.

I see, understood ... shall I submit subsequent patch?

> regards,
> dan carpenter

Best regards,
Marek Vasut
