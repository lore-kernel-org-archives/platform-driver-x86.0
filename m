From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: only supports AMW0_GUID1 on acer family
Date: Mon, 29 Aug 2016 20:55:20 +0800
Message-ID: <20160829125520.GC10967@linux-rxt1.site>
References: <1472464553-9922-1-git-send-email-jlee@suse.com>
 <87fupnx4sw.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87fupnx4sw.fsf@miraculix.mork.no>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Bjørn, 

On Mon, Aug 29, 2016 at 12:11:59PM +0200, Bjørn Mork wrote:
> "Lee, Chun-Yi" <joeyli.kernel@gmail.com> writes:
> 
> > The AMW0_GUID1 wmi is not only found on Acer family but also other
> > machines like Lenovo, Fujitsu and Medion. In the past days, acer-wmi
> > driver handled those non-Acer machines by quirks list.
> >
> > But actually acer-wmi driver was loaded on any machines that have
> > AMW0_GUID1. This behavior is strange because those machines should
> > be supported by appropriate wmi drivers. e.g. fujitsu-laptop,
> > ideapad-laptop.
> >
> > So, This patch adds the logic to check the machine that has AMW0_GUID1
> > should be in Acer/Packard Bell/Gateway white list. But, it still keeps
> > the quirk list of those supported non-acer machines for backward
> > compatible.
> 
> Works fine for me on a Lenovo Thinkpad X1 Carbon 4th gen.  Thanks.
> 
> Bogus accelerometer device without patch:
> 
>   acer_wmi: Acer Laptop ACPI-WMI Extras
>   input: Acer BMA150 accelerometer as /devices/virtual/input/input16
> 
> With patch:
> 
>   acer_wmi: Acer Laptop ACPI-WMI Extras
>   acer_wmi: Unsupported machine has AMW0_GUID1, unable to load
> 
> 
> So if you want it:
> 
> Tested-by: Bjørn Mork <bjorn@mork.no>
> 

Thanks for your help for issue report and testing!

Joey Lee
