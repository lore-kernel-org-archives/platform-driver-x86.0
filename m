From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] Introduce Intel RAPL cooling device driver
Date: Tue, 2 Apr 2013 17:13:00 -0700
Message-ID: <20130403001300.GA13838@kroah.com>
References: <1364940936-20846-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1364940936-20846-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <20130402230042.GA8713@kroah.com>
 <20130402165340.61b7da02@chromoly>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:40142 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751488Ab3DCANE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Apr 2013 20:13:04 -0400
Received: by mail-pb0-f54.google.com with SMTP id xa7so518386pbc.27
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Apr 2013 17:13:03 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20130402165340.61b7da02@chromoly>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>

On Tue, Apr 02, 2013 at 04:53:40PM -0700, Jacob Pan wrote:
> On Tue, 2 Apr 2013 16:00:42 -0700
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > And, one final complaint, never use "raw" kobjects, for loads of good
> > reasons, not the least being you just prevented userspace from seeing
> > what is happening with your devices.  Use the driver model, that's
> > what it is there for, if you need "sub children", or subdirectories.
> I chose to use to kobjects for the reason that userspace can see the
> device linking more clearly.

Then use a 'struct device'.

> Let me try to paraphrase, I have two options:
> 1. if I use the platform device model instead of raw kobjects, I would
> have one platform device for each rapl domain. Then link individual
> platform device with the generic thermal layer sysfs.

I don't understand.

> 2. In the current patch, I have one platform driver, then expose per
> domain kobject that can be linked to the generic thermal layer. Common
> attributes of all domains are grouped under the kset. 

Then use a 'struct device' that is attached to that kset, no need to use
a platform device, as that's not what is needed here, right?

> I did consider both options. I thought using #2 option is better since
> it allow user to discover the topologies easier by following the
> sysfs link. If i use use #1, it would be hard to expose the common
> attributes and more code too. Perhpas I misread
> Documentation/kobjects.txt which i thought kobject/kset are perfect for
> presenting situation like this.

No, kobjects are for things not using the device tree, like filesystems
or other stuff.  You are in the device tree, so use a 'struct device'.
If you use a "raw" kobject, you do not notify userspace what is going
on, and you loose out on a bunch of other stuff that the driver model
provides you.

But do you even need to use anything at all?

Let's step back and start over, what exactly are you trying to tell
userspace?  What data do you have that you need to express to it?  How
do you want userspace to see/use it?

greg k-h
