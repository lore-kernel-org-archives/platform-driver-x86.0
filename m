From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] Introduce Intel RAPL cooling device driver
Date: Tue, 2 Apr 2013 16:03:23 -0700
Message-ID: <20130402230323.GB8713@kroah.com>
References: <1364940936-20846-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1364940936-20846-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <20130402230042.GA8713@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-da0-f49.google.com ([209.85.210.49]:40361 "EHLO
	mail-da0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758133Ab3DBXD0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Apr 2013 19:03:26 -0400
Received: by mail-da0-f49.google.com with SMTP id t11so382475daj.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Apr 2013 16:03:25 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20130402230042.GA8713@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>

On Tue, Apr 02, 2013 at 04:00:42PM -0700, Greg KH wrote:
> I'm not even going to review the rest of this file, please fix that up
> first, before sending it out again.  And, when you do so, please cc: me.

It's like a train wreck, you just can't tear away your eyes...

You race with userspace in the creation of your sysfs files.  Your
device is announced to userspace and then, later on, you create the
sysfs files.  This means that tools like libudev never sees your files,
so the attributes aren't read properly by loads of userspace programs
that you want to have read them.

Please fix that before resending this as well.

greg k-h
