From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH 0/6] toshiba_acpi: Cleanup and TOS1900 device support
Date: Wed, 21 Sep 2011 11:10:44 -0500
Message-ID: <20110921161043.GC29983@thinkpad-t410>
References: <1316555754-25949-1-git-send-email-seth.forshee@canonical.com>
 <20110921153137.GA26436@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:37880 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752436Ab1IUQKr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Sep 2011 12:10:47 -0400
Content-Disposition: inline
In-Reply-To: <20110921153137.GA26436@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 21, 2011 at 04:31:37PM +0100, Matthew Garrett wrote:
> On Tue, Sep 20, 2011 at 04:55:48PM -0500, Seth Forshee wrote:
> > Hi Matthew,
> > 
> > Please consider merging the following patches. They represent a
> > signficant cleanup of toshiba_acpi as well as adding support for SPFC as
> > an HCI method. The latter provides basic but functional support for the
> > TOS1900 devices found on newer Toshiba models, which will serve as a
> > good starting point for further enhancements. I've tried to leave the
> > details of the hardware interaction unchanged to reduce the risk of
> > regression for machines already supported by the driver.
> 
> Great. Has this been tested on any older hardware? I'd think that the 
> risk of regression is pretty low, but it'd be a nice sanity check. I've 
> only got one TOS1800 type around here, and it's a 1.2GHz Pentium M, so 
> I'd prefer to have got someone else to do it :)

No, I don't have any older hardware to test on, and I'm pretty sure
Azael doesn't either. Not that I want to afflict any additional pain
beyond what you already have from dealing with firmware all day ;)
