From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH v4 0/3] Expanded hotkey support
Date: Thu, 15 Mar 2012 10:51:05 -0500
Message-ID: <20120315155105.GF9673@ubuntu-macmini>
References: <20120305220407.GA16312@ubuntu-macmini>
 <1331004633-11862-1-git-send-email-seth.forshee@canonical.com>
 <20120312140652.GA11375@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:53884 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030550Ab2COPvH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Mar 2012 11:51:07 -0400
Content-Disposition: inline
In-Reply-To: <20120312140652.GA11375@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Azael Avalos <coproscefalo@gmail.com>, Thomas Renninger <trenn@suse.de>, linux-kernel@vger.kernel.org, lenb@kernel.org

On Mon, Mar 12, 2012 at 02:06:52PM +0000, Matthew Garrett wrote:
> On Mon, Mar 05, 2012 at 09:30:30PM -0600, Seth Forshee wrote:
> > New version of the patches which remove the need to modify the EC
> > driver.
> > 
> > Changes since v3:
> > 
> >  * Drop patch to add ec_get_handle()
> >  * Use acpi_get_devices() to get EC handle
> 
> I'm not thrilled by this. I think making the change in the ec driver is 
> the appropriate thing to do rather than duplicating this code elsewhere 
> - Len, what's the holdup in merging that?

Still no response. Do we have any other options? I'd like to get these
changes in 3.4 if at all possible so I'm not working with a forked
version of the driver.

Seth
