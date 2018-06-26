From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-smbios: make a function and a pointer
 static
Date: Tue, 26 Jun 2018 14:33:58 -0700
Message-ID: <20180626213358.GA4945@fury>
References: <20180621181524.30550-1-colin.king@canonical.com>
 <20180623002237.GG27466@fury>
 <CAHp75VfWcosNzM03zsGnQrL6yRh0=uidV+SU-06hyYtwdJo3EQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfWcosNzM03zsGnQrL6yRh0=uidV+SU-06hyYtwdJo3EQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 26, 2018 at 10:32:17PM +0300, Andy Shevchenko wrote:
> On Sat, Jun 23, 2018 at 3:22 AM, Darren Hart <dvhart@infradead.org> wrote:
> > On Thu, Jun 21, 2018 at 07:15:24PM +0100, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> The function dell_smbios_smm_call and pointer platform_device are
> >> local to the source and do not need to be in global scope, so make
> >> them static.
> >>
> >> Cleans up sparse warnings:
> >> warning: symbol 'platform_device' was not declared. Should it be static?
> >> warning: symbol 'dell_smbios_smm_call' was not declared. Should it be
> >> static?
> 
> 
> >> -int dell_smbios_smm_call(struct calling_interface_buffer *input)
> >> +static int dell_smbios_smm_call(struct calling_interface_buffer *input)
> >
> > Hrm. So these are passed by pointer to dell_smbios_register_device(), which is in
> > turn called by dell_smbios_call() from dell-smbios-base.c.
> >
> > So while it is valid to make these static, since we're not referencing the
> > symbol, but the pointer value instead - I do worry about the "static" suggesting
> > to someone reading the code that this data is not used outside of this file,
> > when it is.
> >
> > I'm not finding a position on this in coding-style.
> >
> > Andy, do you care to weigh in on this?
> 
> We are using static keyword by almost all callback defined functions,
> so, for my point of view it's pretty much okay.

OK, just wanted to double check.

-- 
Darren Hart
VMware Open Source Technology Center
