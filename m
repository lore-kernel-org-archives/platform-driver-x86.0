From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: ACER: Add support for accelerometer sensor
Date: Wed, 27 Jun 2012 16:43:26 +0300
Message-ID: <20120627134326.GF3007@mwanda>
References: <20120627131534.GA31703@elgon.mountain>
 <201206271532.12841.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:25548 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751602Ab2F0Nni (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jun 2012 09:43:38 -0400
Content-Disposition: inline
In-Reply-To: <201206271532.12841.marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Jun 27, 2012 at 03:32:12PM +0200, Marek Vasut wrote:
> Dear Dan Carpenter,
> 
> > Hello Marek Vasut,
> > 
> > The patch 6ae3a0876185: "ACER: Add support for accelerometer sensor"
> > from Jun 1, 2012, leads to the following Smatch warning:
> > drivers/platform/x86/acer-wmi.c:1886 acer_wmi_accel_destroy()
> > 	 error: don't call input_free_device() after input_unregister_device()
> > 
> > drivers/platform/x86/acer-wmi.c
> >   1883  static void acer_wmi_accel_destroy(void)
> >   1884  {
> >   1885          input_unregister_device(acer_wmi_accel_dev);
> >   1886          input_free_device(acer_wmi_accel_dev);
> >   1887  }
> > 
> > It is a double free.
> 
> I see, understood ... shall I submit subsequent patch?
> 

Yes, please.  Could you give me a:

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
