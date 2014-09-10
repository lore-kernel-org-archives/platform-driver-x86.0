From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 3/5] toshiba_acpi: Add accelerometer input polled device
Date: Wed, 10 Sep 2014 09:08:58 -0700
Message-ID: <20140910160858.GB16596@kroah.com>
References: <1409937247-2525-1-git-send-email-coproscefalo@gmail.com>
 <1409937247-2525-4-git-send-email-coproscefalo@gmail.com>
 <20140906024253.GB11389@vmdeb7>
 <CAGdLNWGhdQU3Fpud9Zgvx3AQ5Lb=WdEkJb_wWTb1hJoHxXPXpQ@mail.gmail.com>
 <20140909000429.GB5835@vmdeb7>
 <20140909013553.GC16363@kroah.com>
 <20140910033520.GC39541@vmdeb7>
 <CAGdLNWEgJmNQ_F7kozn4tGCq_AseuE95xHKoxTWgtNqdBwSm5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGdLNWEgJmNQ_F7kozn4tGCq_AseuE95xHKoxTWgtNqdBwSm5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Azael Avalos <coproscefalo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 10, 2014 at 09:28:44AM -0600, Azael Avalos wrote:
> Hi there,
> 
> 2014-09-09 21:35 GMT-06:00 Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>:
> >
> > I immediately went to a tablet with a marble maze game and it didn't seem too
> > crazy, but I don't suppose that is what people are actually doing with it...
> >
> > What are people actually doing with this thing Azael?
> 
> Gaming mostly (supertuxkart anyone?), but some others (including myself)
> want to use it as a movement detection (one exists for the IBM/Lenovo
> Thinkpads).
> 
> Digging into platform drivers, I've found that the hdaps and also the lis3lv02d
> drivers report the axes via polldev, and since I don't want to break userspace,
> I'm left with two choices:
> 
> 1 - Keep sysfs entry and adapt it to properly report direction, and no
> polled device.
> 
> 2 - Keep sysfs entry and adapt it to properly report direction, and also
> a polled device.
> 
> Let me know your decision so I can send an updated patch.

3 - use the correct api and change it to iio so that all userspace tools
can correctly interact with it, instead of dealing with a
driver-specific sysfs file.

thanks,

greg k-h
