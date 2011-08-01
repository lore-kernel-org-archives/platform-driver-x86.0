From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [PATCH 01/10] lis3lv02d: avoid divide by zero due to unchecked
Date: Mon, 1 Aug 2011 23:11:17 +0200
Message-ID: <201108012311.17881.chunkeey@googlemail.com>
References: <4E2D8858.8000900@tremplin-utc.net> <4E2D88C7.30409@tremplin-utc.net> <20110801132906.2d4cd28e.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:49900 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750862Ab1HAVLa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 1 Aug 2011 17:11:30 -0400
In-Reply-To: <20110801132906.2d4cd28e.akpm@linux-foundation.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?iso-8859-1?q?=C9ric_Piel?= <eric.piel@tremplin-utc.net>, Matthew Garrett <mjg@redhat.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Monday, August 01, 2011 10:29:06 PM Andrew Morton wrote:
> On Mon, 25 Jul 2011 17:16:23 +0200
> __ric Piel <eric.piel@tremplin-utc.net> wrote:
> 
> > +static int lis3lv02d_get_pwron_wait(struct lis3lv02d *lis3)
> > +{
> > +	int div = lis3lv02d_get_odr();
> > +
> > +	if (WARN_ONCE(div == 0, "device returned spurious data"))
> > +		return -ENXIO;
> > +
> > +	/* LIS3 power on delay is quite long */
> > +	msleep(lis3->pwron_delay / div);
> > +	return 0;
> > +}
> 
> The WARN_ONCE may not be very useful.  The user gets worried, might
> report it (often to a distro, not to you!).  But we won't actually *do*
> anything with the information?
The sensor is used to park the hdd in case of an "accident". However,
if the sensors is not working, the user should at least get a WARN
that something is very wrong, right?

Regards,
	Chr
