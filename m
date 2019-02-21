From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86: wmi: fix potential null pointer
 dereference
Date: Wed, 20 Feb 2019 17:29:47 -0800
Message-ID: <20190221012947.GD5838@wrath>
References: <20190130151424.28140-1-2pi@mok.nu>
 <CAHp75VfHDN7Q1YjFd7XM8tFpCcPphaDm0fvOaxHzko5AvF6jEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfHDN7Q1YjFd7XM8tFpCcPphaDm0fvOaxHzko5AvF6jEw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mattias Jacobsson <2pi@mok.nu>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 30, 2019 at 05:43:34PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 30, 2019 at 5:15 PM Mattias Jacobsson <2pi@mok.nu> wrote:
> >
> > In the function wmi_dev_match() the variable id is dereferenced without
> > first performing a NULL check. The variable can for example be NULL if
> > a WMI driver is registered without specifying the id_table field in
> > struct wmi_driver.
> >
> > Add a NULL check and return that the driver can't handle the device if
> > the variable is NULL.
> >
> 
> Good for me, thanks!

Queued for testing, thanks Mattias.

-- 
Darren Hart
VMware Open Source Technology Center
