From: Marek Vasut <marex@denx.de>
Subject: Re: ACER: Add support for accelerometer sensor
Date: Wed, 27 Jun 2012 18:22:23 +0200
Message-ID: <201206271822.23987.marex@denx.de>
References: <20120627131534.GA31703@elgon.mountain> <201206271701.23890.marex@denx.de> <20120627153447.GH3007@mwanda>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:56595 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754020Ab2F0QWb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jun 2012 12:22:31 -0400
In-Reply-To: <20120627153447.GH3007@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: platform-driver-x86@vger.kernel.org

Dear Dan Carpenter,

> On Wed, Jun 27, 2012 at 05:01:23PM +0200, Marek Vasut wrote:
> > Dear Dan Carpenter,
> > 
> > > On Wed, Jun 27, 2012 at 03:59:16PM +0200, Marek Vasut wrote:
> > > > Dear Dan Carpenter,
> > > > 
> > > > > On Wed, Jun 27, 2012 at 03:32:12PM +0200, Marek Vasut wrote:
> > > > > > Dear Dan Carpenter,
> > > > > > 
> > > > > > > Hello Marek Vasut,
> > > > > > > 
> > > > > > > The patch 6ae3a0876185: "ACER: Add support for accelerometer
> > > > > > > sensor" from Jun 1, 2012, leads to the following Smatch
> > > > > > > warning: drivers/platform/x86/acer-wmi.c:1886
> > > > > > > acer_wmi_accel_destroy()
> > > > > > > 
> > > > > > > 	 error: don't call input_free_device() after
> > > > > > > 	 input_unregister_device()
> > > > > > > 
> > > > > > > drivers/platform/x86/acer-wmi.c
> > > > > > > 
> > > > > > >   1883  static void acer_wmi_accel_destroy(void)
> > > > > > >   1884  {
> > > > > > >   1885          input_unregister_device(acer_wmi_accel_dev);
> > > > > > >   1886          input_free_device(acer_wmi_accel_dev);
> > > > > > >   1887  }
> > > > > > > 
> > > > > > > It is a double free.
> > > > > > 
> > > > > > I see, understood ... shall I submit subsequent patch?
> > > > > 
> > > > > Yes, please.  Could you give me a:
> > > > > 
> > > > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > 
> > > > Looking through input_unregister_device(), that call doesn't free the
> > > > structure. Actually, many drivers call explicitly kfree() on it.
> > > > 
> > > > Where do you see the double_free() ?
> > > 
> > > It's been a while since I looked at this code...
> > > 
> > > This is described in the comments for input_unregister_device().
> > > It's a refcounted thing.  It is freed when the last reference is
> > > dropped.
> > 
> > So kfree() eg. in here drivers/input/joystick/magellan.c is also wrong?
> 
> You are talking about this:?
> 
> 	input_unregister_device(magellan->dev);
> 	kfree(magellan);
> 
> The kfree() is fine.  It's just the ->dev pointer that you are not
> allowed to touch again after the unregister.

Ah, now it makes sense. Thanks for explaining :)

> regards,
> dan carpenter

Best regards,
Marek Vasut
