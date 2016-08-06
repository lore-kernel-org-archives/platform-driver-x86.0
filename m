From: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: Re: [PATCH] asus-laptop: get rid of parse_arg()
Date: Sat, 6 Aug 2016 20:00:26 +0300
Message-ID: <20160806170026.GA20321@tyrael>
References: <20160805205710.4735-1-giedrius.statkevicius@gmail.com>
 <20160805231507.GD4952@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34368 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042AbcHFVYJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 6 Aug 2016 17:24:09 -0400
Content-Disposition: inline
In-Reply-To: <20160805231507.GD4952@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 05, 2016 at 04:15:07PM -0700, Darren Hart wrote:
> On Fri, Aug 05, 2016 at 11:57:10PM +0300, Giedrius Statkevičius wrote:
> > parse_arg() duplicates the funcionality of kstrtoint() so use the latter
> > function instead. There is no funcionality change except that in the
> > case of input being too big -ERANGE will be returned instead of -EINVAL
> > which is not bad because -ERANGE makes more sense here. The check for
> > !count is already done by the sysfs core so no need to duplicate it
> > again. Also, add some minor corrections to error handling to accommodate
> > the change in return values (parse_arg returned count if everything
> > succeeded whereas kstrtoint returns 0 in the same situation)
> > 
> > As a result of this patch asus-laptop.ko size is reduced by almost 1%:
> > add/remove: 0/1 grow/shrink: 1/6 up/down: 1/-149 (-148)
> > function                                     old     new   delta
> > __UNIQUE_ID_vermagic0                         69      70      +1
> > ls_switch_store                              133     117     -16
> > ledd_store                                   175     159     -16
> > display_store                                157     141     -16
> > ls_level_store                               193     176     -17
> > gps_store                                    200     178     -22
> > sysfs_acpi_set.isra                          148     125     -23
> > parse_arg.part                                39       -     -39
> > Total: Before=19160, After=19012, chg -0.77%
> > 
> > Signed-off-by: Giedrius Statkevičius <giedrius.statkevicius@gmail.com>
> > ---
> >  drivers/platform/x86/asus-laptop.c | 77 ++++++++++++++++++--------------------
> >  1 file changed, 36 insertions(+), 41 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> > index 15f1311..28551f5 100644
> > --- a/drivers/platform/x86/asus-laptop.c
> > +++ b/drivers/platform/x86/asus-laptop.c
> > @@ -932,30 +932,19 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
> >  }
> >  static DEVICE_ATTR_RO(infos);
> >  
> > -static int parse_arg(const char *buf, unsigned long count, int *val)
> > -{
> > -	if (!count)
> > -		return 0;
> > -	if (count > 31)
> > -		return -EINVAL;
> > -	if (sscanf(buf, "%i", val) != 1)
> > -		return -EINVAL;
> > -	return count;
> > -}
> > -
> >  static ssize_t sysfs_acpi_set(struct asus_laptop *asus,
> >  			      const char *buf, size_t count,
> >  			      const char *method)
> >  {
> >  	int rv, value;
> >  
> > -	rv = parse_arg(buf, count, &value);
> > -	if (rv <= 0)
> > +	rv = kstrtoint(buf, 0, &value);
> > +	if (rv < 0)
> >  		return rv;
> >  
> >  	if (write_acpi_int(asus->handle, method, value))
> >  		return -ENODEV;
> > -	return rv;
> > +	return count;
> 
> This makes explicit what was hidden before - count is merely a range check, it
> isn't used in parsing the string... I'm not sure if this is a problem, but it
> caught my interest. If count is passed as 12, but buf only contains 3 character,
> it may succeed and return 12. I suppose this is a failure in the caller, and
> doesn't impact this function - unless the caller isn't expected to properly
> terminate the string... but if that were the case, it would have failed
> previously as we didn't check for that in parse_arg either.... this is fine as
> is I suppose - can be addressed separately if need be.
> 
According to Documentation/filesystems/sysfs.txt:
"On write(2), ... A terminating null is added after the data on stores. This
makes functions like sysfs_streq() safe to use."
So it should be guaranteed that the buffer is a proper C string. Also, we could
say kstrtoint() or sscanf() uses all of the buffer so it is safe to return count
(as it says in the documentation) as it was before this patch (parse_int
returned count if everything succeeded).

> >  }
> >  
> >  /*
> > @@ -975,15 +964,17 @@ static ssize_t ledd_store(struct device *dev, struct device_attribute *attr,
> >  	struct asus_laptop *asus = dev_get_drvdata(dev);
> >  	int rv, value;
> >  
> > -	rv = parse_arg(buf, count, &value);
> > -	if (rv > 0) {
> > -		if (write_acpi_int(asus->handle, METHOD_LEDD, value)) {
> > -			pr_warn("LED display write failed\n");
> > -			return -ENODEV;
> > -		}
> > -		asus->ledd_status = (u32) value;
> > +	rv = kstrtoint(buf, 0, &value);
> > +	if (rv < 0)
> > +		return rv;
> >
> 
> This inverts the check to check for failure (this is preferred), but it does
> change the successful path to include the value of 0, which was skipped over in
> the original above.
> 
> > +	if (write_acpi_int(asus->handle, METHOD_LEDD, value)) {
> 
> What is value if rv is 0? Perhaps safer/more explicit to test for (rv <= 0)
> above. Please consider, and apply decision to all similar instances below.
> 
Yes but in this case 0 indicates success so it doesn't make sense to test for <=
0 as it would be triggered on success. To be honest I didn't get the idea of
what you wanted to say is wrong with this patch. Could you elaborate more?

-- 
        Giedrius
