From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Fri, 17 Feb 2017 14:35:05 +0530
Message-ID: <1487322305.6980.14.camel@debian.org>
References: <20170214141612.16913-1-rrs@debian.org>
         <20170217033301.GI6814@wisp>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:32926 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755949AbdBQJFK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2017 04:05:10 -0500
Received: by mail-pg0-f68.google.com with SMTP id 5so4453790pgj.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2017 01:05:10 -0800 (PST)
In-Reply-To: <20170217033301.GI6814@wisp>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Rafael Wysocki <rjw@rjwysocki.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hello Darren,

On Thu, 2017-02-16 at 19:33 -0800, Darren Hart wrote:
> On Tue, Feb 14, 2017 at 07:46:12PM +0530, Ritesh Raj Sarraf wrote:
> > 
> > 
> That said, we need to make these systems usable, and as there appears not to
> be
> an accepted standard way of doing this, I don't object to the approach.
> However,
> you mentioned in the bug comments (#64) on 2/12:
> 
>     "I have attached the final patch that I had proposed, but for whatever
>     reasons, the maintainer isn't convinced that that interface is needed."
> 
> This is the only version of this patch I have seen. Who objected to the patch?
> 

Sorry. Nobody objected to it. I didn't hear back after last conversation with
Andy and wrongly presumed that adding that interface was a no go.


> I would like to hear from Rafael and Dmitry, for their opinion on an ACPI or
> INPUT
> interface for indicating TABLET_MODE to userspace. Even if we accept this
> patch
> as is, we should be thinking about how to do this in a standard way.
> 

Yes. That would be ideal. But as you mentioned, currently, not all drivers do
it. So my hope was to have this touchpad interface exposed, which could be used
by applications to derive tablet status.

Lenovo Yogas, when flipped to tablet mode orientation, disables the keyboard and
touchpad.


> > 
> > This patch adds a sysfs interface for read/write access under:
> > /sys/bus/platform/devices/VPC2004\:00/touchpad_mode
> > 

Can you please help here ?

Documentation/ABI/testing/sysfs-platform-ideapad-laptop mentions that the sysfs
path would be /sys/devices/platform/ideapad/ whereas what I actually see on my
machine is /sys/bus/platform/devices/VPC2004:00/

> > Signed-off-by: Ritesh Raj Sarraf <rrs@debian.org>
> > ---
> >  .../ABI/testing/sysfs-platform-ideapad-laptop      |  9 ++++++
> >  drivers/platform/x86/ideapad-laptop.c              | 33
> > ++++++++++++++++++++++
> >  2 files changed, 42 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > index b31e782bd985..401e37e5acbd 100644
> > --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > @@ -17,3 +17,12 @@ Description:
> >  			* 2 -> Dust Cleaning
> >  			* 4 -> Efficient Thermal Dissipation Mode
> >  
> > +What:		/sys/devices/platform/ideapad/touchpad_mode
> > +Date:		Jan 2017
> > +KernelVersion:	4.11
> > +Contact:	"Ritesh Raj Sarraf <rrs@debian.org>"
> > +Description:
> > +		Control touchpad mode.
> > +                        * 1 -> Switched On
> > +                        * 0 -> Switched Off
> 
> Please use consistent whitespace for indentation, in this case, use tabs for
> the
> above two lines.
> 

Thanks. Done (and fixed my .vimrc too).

> > +
> > diff --git a/drivers/platform/x86/ideapad-laptop.c
> > b/drivers/platform/x86/ideapad-laptop.c
> > index f46ece2ce3c4..639af45b45b6 100644
> > --- a/drivers/platform/x86/ideapad-laptop.c
> > +++ b/drivers/platform/x86/ideapad-laptop.c
> > @@ -423,9 +423,42 @@ static ssize_t store_ideapad_fan(struct device *dev,
> >  
> >  static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
> >  
> > +
> > +static ssize_t show_touchpad_mode(struct device *dev,
> > +				struct device_attribute *attr,
> > +				char *buf)
> > +{
> > +	unsigned long result;
> > +	struct ideapad_private *priv = dev_get_drvdata(dev);
> 
> For consistency of coding style, please list longest variable declarations
> first, and proceed in decreasing line length. "Reverse Christmas Tree Order".
> 

Thank you. Done.

> > +
> > +	if (read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result))
> > +		return sprintf(buf, "-1\n");
> > +	return sprintf(buf, "%lu\n", result);
> > +}
> > +
> > +static ssize_t store_touchpad_mode(struct device *dev,
> > +				 struct device_attribute *attr,
> > +				 const char *buf, size_t count)
> > +{
> > +	int ret, state;
> > +	struct ideapad_private *priv = dev_get_drvdata(dev);
> 
> Reverse christmas tree order
> 
> > +
> > +	if (!count)
> > +		return 0;
> > +	if (sscanf(buf, "%i", &state) != 1)
> > +		return -EINVAL;
> 
> Please use kstrtoint, and no need to check for count as this function won't
> get
> called if it is 0.
> 

Done. Thank you.

> > +	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
> > +	if (ret < 0)
> > +		return -EIO;
> > +	return count;
> > +}
> > +
> > +static DEVICE_ATTR(touchpad_mode, 0644, show_touchpad_mode,
> > store_touchpad_mode);
> 
> Please use:
> 
> static DEVICE_ATTR_RW(touchpad_mode);
> 
> You'll need to move the show_ and store_ prefixes to be postfixes, see
> toshiba-acpi.c for several examples.
> 

Thank you. I am building the kernel the test/verify the changes. Will post the
revised patch soon.

> > +
> >  static struct attribute *ideapad_attributes[] = {
> >  	&dev_attr_camera_power.attr,
> >  	&dev_attr_fan_mode.attr,
> > +	&dev_attr_touchpad_mode.attr,
> >  	NULL
> >  };
> >  
> > -- 
> > 2.11.0
> > 
> > 
> 
> 
- -- 
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAlimvMEACgkQpjpYo/Lh
dWlbUQ/8Cyj591QiHofqg9NsVcHMJ//1+sEy4rWSKykW+O0+Wss+GTfF7nufllV9
hU1rRQ3TVcZL/4zeFG+nVS9d8r4TbYxcAGisr8nxucHJmD9pDN9blVRP5rT7Meen
zWvy2vSZRVTMo/SrLObtwzTUrXjIiOZWZKwjiYiJYZ7T55tvj5i8+5byDb7ITlzJ
gmiNSrTByg7Q3Jr5IPc0nzSU84Iq1dV9N6Ym5FtYJhNssNe3I9vEZQCfEHEpFHID
7/N4GFHScSVCPb9TgdJ61mR9PbsWtiNraW297F9CsVEFwNseq8IAfZLXYCdpdWV8
BysBb28WCaY42D3hIl0ycDIFYuf+ydmu1C+nQlDYgjJ9i3j8TUhGCqP0pQpINXXb
yrVFIb5/ytHxzOgENwJgsycZT1sSTuc0PQzJlzaIkjR00tAcXOop9tNEH9sIFC6z
xkYoPcMWG/hO6eihV+62+04aySSjXID7/BD/5KBZpypZ+spSKyLqhSBaohjbIQ64
WBRFOCZaqc465WzhEJTIfLBao6OT18TYXUPeq5e6a2AhrsJHUzVzw0cJdx2MY/vO
JCkoFWokgDpGmHn/kc/CYaTKyE7IrWnQUGsQWHLAdaLeaqC8R1YsWG0eJs/Wvl6d
/rdzjHUv4dKv/CGpZ9V+P3P3EaKMyB3FDg9Q46D2uBDHPE+IJ4A=
=Oeu5
-----END PGP SIGNATURE-----
