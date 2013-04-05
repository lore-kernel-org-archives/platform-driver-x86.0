From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] Introduce Intel RAPL cooling device driver
Date: Fri, 5 Apr 2013 14:35:18 -0700
Message-ID: <20130405213518.GA5615@kroah.com>
References: <1365195724-8945-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1365195724-8945-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <1365197195.2075.23.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1365197195.2075.23.camel@joe-AO722>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 05, 2013 at 02:26:35PM -0700, Joe Perches wrote:
> On Fri, 2013-04-05 at 14:02 -0700, Jacob Pan wrote:
> > +static ssize_t store_event_control(struct device *dev,
> > +				struct device_attribute *attr,
> > +				const char *buf,
> > +				size_t size)
> > +{
> > +	struct rapl_domain *rd = dev_get_drvdata(dev);
> > +	unsigned int efd, new_threshold;
> > +	struct file *efile = NULL;
> > +	int ret = 0;
> > +	int prim;
> > +	struct rapl_event *ep;
> > +	u64 val;
> > +	char cmd[MAX_PRIM_NAME];
> > +
> > +	if (sscanf(buf, "%u %s %u", &efd, cmd, &new_threshold) != 3)
> > +		return -EINVAL;
> 
> This sscanf looks fragile.
> 
> buf = "1 some_really_long_name_longer_than_MAX_PRIM_NAME 2"
> 
> stack overrun.
> 
> Where does buf come from?

It comes from the sysfs core, which limits it to a PAGE_SIZE.  But yes,
it does look fragile, and flat out wrong, but I'm not going into that
just yet, as that whole api should just be deleted for now.

greg k-h
