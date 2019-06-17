From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/8] platform: x86: acer-wmi: no need to check return
 value of debugfs_create functions
Date: Mon, 17 Jun 2019 15:32:13 +0300
Message-ID: <CAHp75Vc7HeHgkq6h9TKrNHO-g_5uDtbnD8jY9HpHLuu607AUkA@mail.gmail.com>
References: <20190612121258.19535-1-gregkh@linuxfoundation.org>
 <CAHp75VeQy9o6tHtqKEE3o9ijBE4c11cWcc00+RqCj+P1FOky1w@mail.gmail.com> <20190614065339.GB21447@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614065339.GB21447@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Lee, Chun-Yi" <jlee@suse.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 14, 2019 at 9:53 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jun 14, 2019 at 09:48:04AM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 12, 2019 at 3:13 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > When calling debugfs functions, there is no need to ever check the
> > > return value.  The function can work or not, but the code logic should
> > > never do something different based on this.
> > >
> > > Also, because there is no need to save the file dentry, remove the
> > > variable that was saving it and just recursively delete the whole
> > > directory.
> > >
> >
> > Through which tree you want to proceed this?
>
> What ever is easier for you, I can take it through mine, as I have a lot
> of other patches like this queued up already, or it can go through
> yours.

All 8 pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko
