From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] platform/x86: peaq-wmi: silence a static checker warning
Date: Tue, 18 Jul 2017 22:02:07 +0300
Message-ID: <20170718190207.aprsubzfak6vzn3e@mwanda>
References: <20170718092849.nim5tiaycdenfyfz@mwanda>
 <CAHp75VdSD0zVFtnwF8oWt24P8DM6vZQNO93F_38yaCYBzCCBRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VdSD0zVFtnwF8oWt24P8DM6vZQNO93F_38yaCYBzCCBRw@mail.gmail.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jul 18, 2017 at 06:08:30PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 18, 2017 at 12:28 PM, Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
> > Static checkers complain because:
> >
> >         if (peaq_ignore_events_counter && --peaq_ignore_events_counter >= 0)
> >                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > The second part of the condition is always true because
> > "peaq_ignore_events_counter" is unsigned.  It doesn't cause a problem
> > because the first part of the condition prevents underflows, but it's
> > simple enough to make the static checker happy.
> 
> Isn't it the same to
> 
> if (peaq_ignore_events_counter && peaq_ignore_events_counter--)
> 
> ?

Yeah.  That's probably a little cleaner.  I'll resend.

regards,
dan carpenter

