From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] toshiba_acpi: Only register backlight device when
 interface is read/write
Date: Thu, 3 May 2012 16:10:32 -0500
Message-ID: <20120503211032.GE23573@thinkpad-t410>
References: <1334852630-8829-1-git-send-email-seth.forshee@canonical.com>
 <20120503203257.GE29437@srcf.ucam.org>
 <20120503210218.GD23573@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:56862 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932170Ab2ECVKf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 May 2012 17:10:35 -0400
Content-Disposition: inline
In-Reply-To: <20120503210218.GD23573@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Akio Idehara <zbe64533@gmail.com>

On Thu, May 03, 2012 at 04:02:18PM -0500, Seth Forshee wrote:
> On Thu, May 03, 2012 at 09:32:57PM +0100, Matthew Garrett wrote:
> > Merged for -next, thanks. I fixed up the conflicts with the the 
> > transflective display patch, but someone should probably verify them.
> 
> At a glance I see a couple of obvious mistakes, one of which will fail
> to build.
> 
> >  static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
> >  {
> >  	u32 hci_result;
> >  	u32 value;
> > +	int brightness;
> 
> brightness needs to be initialized to 0. As-is it should generate a
> warning about using an uninitialized variable.
> 
> >  static const struct backlight_ops toshiba_backlight_data = {
> > +	.iotns = BL_CORE_SUSPENDRESUME,
> 
> Should be options.

Also:

+       
+       /* Determine whether or not BIOS supports transflective backlight */
+       ret = get_tr_backlight_status(dev, &enabled);
+       dev->tr_backlight_supported = !ret;

The first line of this block has trailing white-space.
