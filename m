From: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager
 (IOM) driver
Date: Fri, 28 Aug 2020 14:55:35 +0300
Message-ID: <20200828115535.GD174928@kuha.fi.intel.com>
References: <20200822040508.23510-1-rajmohan.mani@intel.com>
 <20200822040508.23510-2-rajmohan.mani@intel.com>
 <20200828074359.GC942935@kroah.com>
 <20200828090832.GB174928@kuha.fi.intel.com>
 <20200828100335.GB1229122@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200828100335.GB1229122-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Rajmohan Mani <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ayman Bagabas <ayman.bagabas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jithu Joseph <jithu.joseph-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?utf-8?B?Qmxhxb4=?= Hrastnik <blaz-piQ53kQ5nys@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pmalani-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Aug 28, 2020 at 12:03:35PM +0200, Greg Kroah-Hartman wrote:
> Handle the situation today, if, in the future, someone else needs/wants
> this, _then_ work on splitting it out into separate pieces.  Don't
> create additional complexity today, for no benefit today.  It's already
> caused numerous review comments/complaints the way this is designed...

OK. We'll handle this in the mux driver for now.


thanks,

-- 
heikki
