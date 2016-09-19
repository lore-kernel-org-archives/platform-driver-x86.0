From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-laptop: get rid of parse_arg()
Date: Sun, 18 Sep 2016 17:52:17 -0700
Message-ID: <20160919005217.GA77003@f23x64.localdomain>
References: <20160805205710.4735-1-giedrius.statkevicius@gmail.com>
 <20160805231507.GD4952@f23x64.localdomain>
 <20160806170026.GA20321@tyrael>
 <20160812214002.GA2855@f23x64.localdomain>
 <20160816094950.GA2374@tyrael>
 <20160817182315.GD81374@f23x64.localdomain>
 <20160903055126.GA12426@tyrael>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37830 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932596AbcISAwU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Sep 2016 20:52:20 -0400
Content-Disposition: inline
In-Reply-To: <20160903055126.GA12426@tyrael>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Sep 03, 2016 at 08:51:26AM +0300, Giedrius Statkevičius wrote:
> On Wed, Aug 17, 2016 at 11:23:15AM -0700, Darren Hart wrote:
> > On Tue, Aug 16, 2016 at 12:49:50PM +0300, Giedrius Statkevičius wrote:
> > > On Fri, Aug 12, 2016 at 02:40:02PM -0700, Darren Hart wrote:
> > > > On Sat, Aug 06, 2016 at 08:00:26PM +0300, Giedrius Statkevičius wrote:
> > > > > On Fri, Aug 05, 2016 at 04:15:07PM -0700, Darren Hart wrote:
> > > > > > On Fri, Aug 05, 2016 at 11:57:10PM +0300, Giedrius Statkevičius wrote:
> > > > > > > parse_arg() duplicates the funcionality of kstrtoint() so use the latter
> > > > > > > function instead. There is no funcionality change except that in the
> > > > > > > case of input being too big -ERANGE will be returned instead of -EINVAL
> > > > > > > which is not bad because -ERANGE makes more sense here. The check for
> > > > > > > !count is already done by the sysfs core so no need to duplicate it
> > > > > > > again. Also, add some minor corrections to error handling to accommodate
> > > > > > > the change in return values (parse_arg returned count if everything
> > > > > > > succeeded whereas kstrtoint returns 0 in the same situation)
> > > > > > > 
> > > > > > > As a result of this patch asus-laptop.ko size is reduced by almost 1%:
> > > > > > > add/remove: 0/1 grow/shrink: 1/6 up/down: 1/-149 (-148)
> > > > > > > function                                     old     new   delta
> > > > > > > __UNIQUE_ID_vermagic0                         69      70      +1
> > > > > > > ls_switch_store                              133     117     -16
> > > > > > > ledd_store                                   175     159     -16
> > > > > > > display_store                                157     141     -16
> > > > > > > ls_level_store                               193     176     -17
> > > > > > > gps_store                                    200     178     -22
> > > > > > > sysfs_acpi_set.isra                          148     125     -23
> > > > > > > parse_arg.part                                39       -     -39
> > > > > > > Total: Before=19160, After=19012, chg -0.77%
> > > > > > > 
> > > > > > > Signed-off-by: Giedrius Statkevičius <giedrius.statkevicius@gmail.com>
> > > > > > >  }

...

> > > > > > >  
> > > > > > >  /*
> > > > > > > @@ -975,15 +964,17 @@ static ssize_t ledd_store(struct device *dev, struct device_attribute *attr,
> > > > > > >  	struct asus_laptop *asus = dev_get_drvdata(dev);
> > > > > > >  	int rv, value;
> > > > > > >  
> > > > > > > -	rv = parse_arg(buf, count, &value);
> > > > > > > -	if (rv > 0) {
> > > > > > > -		if (write_acpi_int(asus->handle, METHOD_LEDD, value)) {
> > > > > > > -			pr_warn("LED display write failed\n");
> > > > > > > -			return -ENODEV;
> > > > > > > -		}
> > > > > > > -		asus->ledd_status = (u32) value;
> > > > > > > +	rv = kstrtoint(buf, 0, &value);
> > > > > > > +	if (rv < 0)

I was pointing out that for functional equivalence, this should be:

		if (rv <= 0)

But as you point out below, this can't be achieved directly as kstrtoint returns
0 on success. I missed that in my first review (I guess), apologies.

> > > > > > > +		return rv;
> > > > > > >
> > > > > > 
> > > > > > This inverts the check to check for failure (this is preferred), but it does
> > > > > > change the successful path to include the value of 0, which was skipped over in
> > > > > > the original above.
> > > > > > 
> > > > > > > +	if (write_acpi_int(asus->handle, METHOD_LEDD, value)) {
> > > > > > 
> > > > > > What is value if rv is 0? Perhaps safer/more explicit to test for (rv <= 0)
> > > > > > above. Please consider, and apply decision to all similar instances below.
> > > > > > 
> > > > > Yes but in this case 0 indicates success so it doesn't make sense to test for <=
> > > > > 0 as it would be triggered on success. To be honest I didn't get the idea of
> > > > > what you wanted to say is wrong with this patch. Could you elaborate more?
> > > > > 
> > > >
> > > > Your commit message states there is no functional change, but this changes the
> > > > behavior of this function (and others) for the 0 edge case.
> > > >
> > > > Previously if rv == 0, it would not call write_acpi_int(), now it will and set
> > > > the ledd_status.
> > > >
> > >
> > > sysfs already takes care of this edge case. parse_arg() returned 0 iff count ==
> > > 0 but in fs/sysfs/file.c sysfs_kf_write() there already is:
> > >
> > > if (!count)
> > >     return 0;
> >
> > From a defensive programming context, we should be explicit in what we pass on
> > to other functions and not rely on the caller to filter for us, especially when
> > it's a simple matter of <= versus < in our comparison.
> 
> Which comparison? kstrtoint returns 0 on success so we can't use <=.
> 
> >
> > Please update the changed comparison sites in the patch to have the same end
> > result as before with respect to what it would do if a 0 were received.
> >
> 
> So you want me to add:
> 
> if (!count)
>     return 0;
> 
> Before each kstrtoint()? Sorry but I don't see a point in adding duplicated code
> that is not functional because these functions aren't and will never be used
> outside of sysfs. Just take a look at how many drivers in your own tree use
> kstrtoint() in sysfs methods and there isn't such check in place because it's
> pointless. Only samsung-laptop.c is an exception but it could be cleaned up
> because !count is a pointless check. Not only sysfs can't call us when count is
> 0 but kstrtoint() also returns -EINVAL if the string is empty (in case of the
> code in samsung-laptop).

You're correct.

Queued to testing. Thanks for taking the time to follow up. Sorry for the
hassle.


-- 
Darren Hart
Intel Open Source Technology Center
