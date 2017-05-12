From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH 1/1] thinkpad_acpi: Add support for
 status (external cover) LED
Date: Fri, 12 May 2017 14:23:21 -0300
Message-ID: <20170512172321.GA16100@khazad-dum.debian.net>
References: <20170119172132.36029-1-agoode@google.com>
 <20170507163812.GA14896@xo-6d-61-c0.localdomain>
 <20170507234903.GA15137@khazad-dum.debian.net>
 <20170512104315.GC6780@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170512104315.GC6780@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Adam Goode <agoode@google.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 12 May 2017, Pavel Machek wrote:
> On Sun 2017-05-07 20:49:03, Henrique de Moraes Holschuh wrote:
> > On Sun, 07 May 2017, Pavel Machek wrote:
> > > On Thu 2017-01-19 12:21:32, Adam Goode wrote:
> > > > This allows the control of the red status LED, which is the dot of the "i"
> > > > in the word "ThinkPad" on the outside cover of newer models.
> > > > 
> > > > In the manual, both this LED and the power LED are referred to as
> > > > the "system-status indicators" without distinction between the two, so
> > > > I chose "status" as the LED name.
> > > 
> > > Could we name it something like external_status or something? "status" is way too generic.
> > 
> > "thinkdot" ;-)
> 
> Sounds good to me ;-).

Ok.  Adam, care to respin this when you have the time?

-- 
  Henrique Holschuh
