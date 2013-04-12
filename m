From: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v2] Introduce Intel RAPL cooling device driver
Date: Fri, 12 Apr 2013 08:32:03 -0700
Message-ID: <20130412083203.13cf56b0@chromoly>
References: <1365195724-8945-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1365195724-8945-2-git-send-email-jacob.jun.pan@linux.intel.com>
	<1365197195.2075.23.camel@joe-AO722>
	<20130405213518.GA5615@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:22822 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751367Ab3DLPcG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 12 Apr 2013 11:32:06 -0400
In-Reply-To: <20130405213518.GA5615@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>

On Fri, 5 Apr 2013 14:35:18 -0700
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Fri, Apr 05, 2013 at 02:26:35PM -0700, Joe Perches wrote:
> > On Fri, 2013-04-05 at 14:02 -0700, Jacob Pan wrote:
> > > +static ssize_t store_event_control(struct device *dev,
> > > +				struct device_attribute *attr,
> > > +				const char *buf,
> > > +				size_t size)
> > > +{
> > > +	struct rapl_domain *rd = dev_get_drvdata(dev);
> > > +	unsigned int efd, new_threshold;
> > > +	struct file *efile = NULL;
> > > +	int ret = 0;
> > > +	int prim;
> > > +	struct rapl_event *ep;
> > > +	u64 val;
> > > +	char cmd[MAX_PRIM_NAME];
> > > +
> > > +	if (sscanf(buf, "%u %s %u", &efd, cmd,
> > > &new_threshold) != 3)
> > > +		return -EINVAL;
> > 
> > This sscanf looks fragile.
> > 
> > buf = "1 some_really_long_name_longer_than_MAX_PRIM_NAME 2"
> > 
> > stack overrun.
> > 
> > Where does buf come from?
> 
> It comes from the sysfs core, which limits it to a PAGE_SIZE.  But
> yes, it does look fragile, and flat out wrong, but I'm not going into
> that just yet, as that whole api should just be deleted for now.
> 
> greg k-h
> 
I am just curious to know besides fixing string length check, is the
problem related to the fact that I have more than
one element for the event_control sysfs node?
i.e. <eventfd> <event_name> <threshold>

If so, the reason being I don't know if there is a standard way
to a transaction via sysfs where I can commit multiple inputs
atomically.

-- 
Thanks,

Jacob
