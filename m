From: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v2 3/5] toshiba_acpi: Fix accelerometer direction
 reporting
Date: Mon, 15 Sep 2014 14:13:58 -0700
Message-ID: <20140915211358.GA64909@vmdeb7>
References: <1410569437-3066-1-git-send-email-coproscefalo@gmail.com>
 <1410569437-3066-2-git-send-email-coproscefalo@gmail.com>
 <20140915192923.GA61529@vmdeb7>
 <20140915195617.GA3652@kroah.com>
 <541753A3.8010102@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <541753A3.8010102-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Azael Avalos <coproscefalo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 15, 2014 at 02:01:23PM -0700, H. Peter Anvin wrote:
> On 09/15/2014 12:56 PM, Greg Kroah-Hartman wrote:
> > 
> >> I have also suggested this device (2 actually) would be better supported as an
> >> IIO accelerometer device, but even that would change the sysfs interface by
> >> removing these altogether and using the IIO standardized path and accelerometer
> >> interface.
> > 
> > That's a better goal overall, then the "odd" sysfs files are now gone,
> > to be replaced with the standard interface which all tools should
> > already be using.
> > 
> 
> I would definitely agree with that, although I understood there were
> technical concerns with that?
> 
> 	-hpa

Yes, the accelerometer is hidden behind two ACPI HIDs with a very limited polled
position and acceleration threshold interface. I've asked the IIO maintainer if
this would be feasible to use as an IIO device, but have not yet heard back.

Jonathan and linux-iio added to Cc.

-- 
Darren Hart
Intel Open Source Technology Center
