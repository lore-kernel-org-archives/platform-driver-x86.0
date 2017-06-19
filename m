From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance
 number
Date: Mon, 19 Jun 2017 23:02:40 +0800
Message-ID: <20170619150240.GG3016@linux-l9pv.suse>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
 <20170613184228.GC22450@fury>
 <20170614154654.GA22981@pali>
 <201706171847.54407@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201706171847.54407@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, Dave Airlie <airlied@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Pali,

On Sat, Jun 17, 2017 at 06:47:54PM +0200, Pali Rohár wrote:
> > So problematic drivers which use instance=1 without any comments are:
> > 
> >   acer-wmi
> >   asus-wmi
> >   mxm-wmi
> 
> Adding authors & maintainers of those drivers in loop.
> 
> WMI instance number is indexed from zero and therefore first instance
> number is 0, not 1. Can you check if for drivers and wmi functions
> (specified below) is really correct to use WMI instance number one?
> 
> In case in _WDG is specified for particular GUID that instance_count is
> 1, it means the only allowed instance number is 0 (first and the only
> one).
> 
> In some cases, when there is only one instance for WMI method, ACPI WMI
> bytecode does not check instance number, so any passed value is
> accepted by ACPI. But in current patch I'm trying to fix check for
> valid instance number based on instance_count information from _WDG.
> 
> So I need to know if nothing would be broken. And in case those driver
> issue invalid/incorrect instance number, they needs to be fixed.
> 
> Can you look at it? Simple look into _WDG dump should be enough... just
> check if instance number called from wmi driver is less then
> instance_count from _WDG.
> 
> On Wednesday 14 June 2017 17:46:54 Pali Rohár wrote:
> > Function wmi_query_block:
> > 
> >   acer-wmi.c:
> >   instance=1 /* no comment why, guid=95764E09-FB56-4E83-B31A-37761F60994A */
> > 
>  
> > Function wmi_evaluate_method:
> > 
> >   acer-wmi.c:
> >   instance=1 /* no comment why, guid=67C3371D-95A3-4C37-BB61-DD47B491DAAB */
> >   instance=1 /* no comment why, guid=6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3 */
> > 

I have checked DSDT dump on my hand, I think that your fixing is resonable.
I will send patch to fix acer-wmi driver.

Thanks
Joey Lee
