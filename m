From: Christos Gkekas <chris.gekas@gmail.com>
Subject: Re: [PATCH] intel-oaktrail: Clean up dead code
Date: Mon, 9 Oct 2017 21:45:46 +0100
Message-ID: <20171009204546.GA2839@inspiron>
References: <1507503469-22507-1-git-send-email-chris.gekas@gmail.com>
 <CAHp75Ve7404BFgitG=HNKP0EyZN-Uoa=JOhGvaKz1N1ERs=eXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Ve7404BFgitG=HNKP0EyZN-Uoa=JOhGvaKz1N1ERs=eXQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 09/10/17 13:21:17 +0300, Andy Shevchenko wrote:
> On Mon, Oct 9, 2017 at 1:57 AM, Christos Gkekas <chris.gekas@gmail.com> wrote:
> > A couple of macros are unused and need to be removed.
> > Also variable percent is unsigned so checking whether it is less than
> > zero is redundant.
> 
> > -#define OT_EC_CAMERA_MASK      (1 << 0)
> >  #define OT_EC_BT_MASK          (1 << 1)
> >  #define OT_EC_GPS_MASK         (1 << 2)
> >  #define OT_EC_WIFI_MASK                (1 << 3)
> >  #define OT_EC_WWAN_MASK                (1 << 4)
> > -#define OT_EC_TS_MASK          (1 << 5)
> 
> While they are unused they won't bring any additional code to the binary.
> The rationale to leave them is to have a bit descriptions in the code,
> so, anyone who is in possession of that old and rare hardware can do
> some tests or amendments without searching looking to documentation.
> 
> 
> > -       if (percent < 0 || percent > OT_EC_BL_BRIGHTNESS_MAX)
> > +       if (percent > OT_EC_BL_BRIGHTNESS_MAX)
> >                 return -EINVAL;
> 
> While it's true, doesn't compiler take care about that?
> 
> https://lkml.org/lkml/2006/11/28/206
> 
> So, unfortunately I have no reason to take it.
> 
> -- 
> With Best Regards,
> Andy Shevchenko

Fair enough, thanks for your time and feedback.

Regards,
Christos
