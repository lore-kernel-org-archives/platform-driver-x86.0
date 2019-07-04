From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 07/11] video: fbdev: wm8505fb: convert platform driver to
 use dev_groups
Date: Thu, 4 Jul 2019 16:25:07 +0200
Message-ID: <20190704142507.GA6281@kroah.com>
References: <20190704084617.3602-1-gregkh@linuxfoundation.org>
 <20190704084617.3602-8-gregkh@linuxfoundation.org>
 <CAHp75Vd7+Kg0paJ-eMNR2_AViW3mYgOCUqqPXS=eT8eY_J6xZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vd7+Kg0paJ-eMNR2_AViW3mYgOCUqqPXS=eT8eY_J6xZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 04, 2019 at 04:29:40PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 4, 2019 at 11:47 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > Platform drivers now have the option to have the platform core create
> > and remove any needed sysfs attribute files.  So take advantage of that
> > and do not register "by hand" a sysfs file.
> >
> > Cc: Darren Hart <dvhart@infradead.org>
> > Cc: Andy Shevchenko <andy@infradead.org>
> > Cc: platform-driver-x86@vger.kernel.org
> 
> Is it correct Cc list? Looks like a typo to me.

Ugh, wrong mapping of patch to maintainers, my scripts failed me :(

I'll resend this with the proper one, thanks.

greg k-h
