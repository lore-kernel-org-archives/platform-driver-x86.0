From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] platform/x86: Add IMS/ZII SCU driver
Date: Fri, 13 Jan 2017 15:11:39 -0800
Message-ID: <47290232-c049-94ab-7b79-4c0c982b2803@gmail.com>
References: <20170111212644.9217-1-f.fainelli@gmail.com>
 <CAHp75VcH9ez0AjybBA8mtJ=nSyTTjXeV6d_P_NBA-mZmxjZ+Ng@mail.gmail.com>
 <20170113182242.GA17467@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170113182242.GA17467@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, cphealy@gmail.com, Guenter Roeck <linux@roeck-us.net>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 01/13/2017 10:22 AM, Darren Hart wrote:
>> Btw, Darren, would it be good idea to start creating folders to make a
>> bit of order in the subsystem? For first I would move Intel's PMIC/SCU
>> stuff to somewhere (not sure if it should be per manufacturer or per
>> function).
> 
> If we create folder, I'd recommend by manufacturer as that is typically along
> the lines that our contributors work. Someone with a Dell laptop tends to focus
> on Dell. The Intel engineers will focus primarily on Intel SoCs, etc.
> 
> I'd like to avoid getting too granualar as it adds overhead with Makefiles,
> file navigation, etc. Any thoughts on a minimum file count to justify a new
> directory? Maybe 5?

Chris would be in a better position than I am to comment whether up to 5
x86-based designs from ZII could show up, how about we start with naming
this file zii_scu.c, keep it under drivers/platform/x86/ for now, and if
we have 4 more (or less, whatever the threshold is), then we create a
zii/ directory and move this one (and the new ones) there?
-- 
Florian
