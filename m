From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 4/5] toshiba_acpi: Remove unnecessary checks and
 returns in HCI/SCI functions
Date: Wed, 5 Aug 2015 16:36:56 -0700
Message-ID: <20150805233656.GA34034@vmdeb7>
References: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
 <1438401496-27744-5-git-send-email-coproscefalo@gmail.com>
 <20150805202134.GB12131@vmdeb7>
 <CAGdLNWFwvVWdTuYfYKgEj7E_9H66ncGpkhQszif2vdVi75xcQQ@mail.gmail.com>
 <20150805232105.GC74817@vmdeb7>
 <CAGdLNWGS-iQhkfMqzPrMAYw11XVYx_grobr53Qqa2-US4w3pTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43376 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751075AbbHFRR7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Aug 2015 13:17:59 -0400
Content-Disposition: inline
In-Reply-To: <CAGdLNWGS-iQhkfMqzPrMAYw11XVYx_grobr53Qqa2-US4w3pTg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Aug 06, 2015 at 10:21:15AM -0600, Azael Avalos wrote:
> Hi Darren,
> 
> 2015-08-05 17:21 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> > On Wed, Aug 05, 2015 at 04:23:49PM -0600, Azael Avalos wrote:
> >> Hi Darren,
> >>
> >> 2015-08-05 14:21 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> >> >> @@ -1131,14 +1055,10 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
> >> >>
> >> >>       result = sci_write(dev, SCI_USB_THREE, state);
> >> >>       sci_close(dev);
> >> >> -     if (result == TOS_FAILURE) {
> >> >> +     if (result == TOS_FAILURE)
> >> >>               pr_err("ACPI call to set USB 3 failed\n");
> >> >> -             return -EIO;
> >> >> -     } else if (result == TOS_NOT_SUPPORTED) {
> >> >> +     else if (result == TOS_NOT_SUPPORTED)
> >> >>               return -ENODEV;
> >> >> -     } else if (result == TOS_INPUT_DATA_ERROR) {
> >> >> -             return -EIO;
> >> >> -     }
> >> >>
> >> >>       return (result == TOS_SUCCESS || result == TOS_SUCCESS2) 0 : -EIO;
> >> >
> >> > Hrm... the above line cause patch application failure via git (note the
> >> > missing ? before the '0 : -EIO;'). This never existed upstream so far as
> >> > I can determine.
> >>
> >> I've spotted that while compile-checking my changes locally, but I might
> >> have sent you the wrong patch here, I'll double check in the future to avoid
> >> these embarrassments :-(
> >>
> >> >
> >> > It applied with some fuzz manually, but I'm concerned about how this
> >> > happened.  Did you have a dirty tree when you prepared these patches
> >> > perhaps?
> >>
> >> This is weird, all these patches applied cleanly on my local copy, I'll fetch
> >> a new copy from your "for-next" tree and check w/ it.
> >
> > Please verify what I have in "testing", if that's right, then we're good. It has
> > already passed my checks and 0day's.
> 
> I just checked it, and it's good, sorry for all the fuzz :-)

Great, these are all queued to for-next.

-- 
Darren Hart
Intel Open Source Technology Center
