From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: Add IMS/ZII SCU driver
Date: Fri, 13 Jan 2017 10:22:42 -0800
Message-ID: <20170113182242.GA17467@localhost.localdomain>
References: <20170111212644.9217-1-f.fainelli@gmail.com>
 <CAHp75VcH9ez0AjybBA8mtJ=nSyTTjXeV6d_P_NBA-mZmxjZ+Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcH9ez0AjybBA8mtJ=nSyTTjXeV6d_P_NBA-mZmxjZ+Ng@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, cphealy@gmail.com, Guenter Roeck <linux@roeck-us.net>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jan 13, 2017 at 06:38:28PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 11, 2017 at 11:26 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> > From: Guenter Roeck <linux@roeck-us.net>
> >
> > This patch adds support for the IMS (now Zodiac Inflight Innovations)
> > SCU Generation 1/2/3 platform driver. This driver registers all the
> > on-module peripherals: Ethernet switches (Broadcom or Marvell), I2C to
> > GPIO expanders, Kontrom CPLD/I2C master, and more.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> > ---
> > Darren,
> >
> > This is against your "for-next" branch thanks!
> 
> I'm going to review this later, though few of comments.
> 
> > +config SCU
> 
> No, no. We have enough mess with Intel's SCU/PMIC here, not add more.
> 
> At least add manufacturer as prefix to option and file name.
> 
> Btw, Darren, would it be good idea to start creating folders to make a
> bit of order in the subsystem? For first I would move Intel's PMIC/SCU
> stuff to somewhere (not sure if it should be per manufacturer or per
> function).

If we create folder, I'd recommend by manufacturer as that is typically along
the lines that our contributors work. Someone with a Dell laptop tends to focus
on Dell. The Intel engineers will focus primarily on Intel SoCs, etc.

I'd like to avoid getting too granualar as it adds overhead with Makefiles,
file navigation, etc. Any thoughts on a minimum file count to justify a new
directory? Maybe 5?

-- 
Darren Hart
Intel Open Source Technology Center
