From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][V2] intel-hid: add a DMI quirk to support Wacom
 MobileStudio Pro
Date: Tue, 12 Dec 2017 08:00:12 -0800
Message-ID: <20171212160012.GI27831@fury>
References: <1512618023-30209-1-git-send-email-alex.hung@canonical.com>
 <20171209000423.GD14187@fury>
 <CANRwn3SpSfwpJk7OitXv6aLK4ES=AbHkmj7iyQsUP_dbZqbJTA@mail.gmail.com>
 <20171212005118.GF27831@fury>
 <CAHp75VeDarmDs1tALkv4tiO_NMa7uhC26bF_Yc0Bv98KpK_nHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:49699 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752256AbdLLQAP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Dec 2017 11:00:15 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VeDarmDs1tALkv4tiO_NMa7uhC26bF_Yc0Bv98KpK_nHw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jason Gerecke <killertofu@gmail.com>, Alex Hung <alex.hung@canonical.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Jason Gerecke <jason.gerecke@wacom.com>

On Tue, Dec 12, 2017 at 10:02:36AM +0200, Andy Shevchenko wrote:
> On Tue, Dec 12, 2017 at 2:51 AM, Darren Hart <dvhart@infradead.org> wrote:
> > On Mon, Dec 11, 2017 at 02:13:40PM -0800, Jason Gerecke wrote:
> >> On Fri, Dec 8, 2017 at 4:04 PM, Darren Hart <dvhart@infradead.org> wrote:
> >> > On Thu, Dec 07, 2017 at 11:40:23AM +0800, Alex Hung wrote:
> >> >> HEBC method reports capabilities of 5 button array but Wacom
> >> >> MobileStudio Pro does not have this control method. A DMI quirk
> >> >> was created to enable 5 button array for this system.
> >> >
> >> > Jason, have you been able to verify this patch with testing?
> >> >
> >>
> >> I tested the attachment at [1], which produces an identical copy of
> >> intel-hid.c as applying this patch to the
> >> platform-drivers-x86/review-dvhart branch of
> >> git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git.
> >>
> >> Assuming that's the correct code, feel free to attach the following:
> >> Tested-by: Jason Gerecke <jason.gerecke@wacom.com>
> >
> > Great, thanks. Queued up for testing.
> 
> Just in case you didn't promote it yet, could you move inclusion to be
> more ordered alphabetically? (After linux/acpi.h I suppose)

I had done that initially, but realized the entire list is in no apparent order
and it wasn't just moving the one line he added. So it'll need to be a cleanup
patch since all the test builds have run already.

-- 
Darren Hart
VMware Open Source Technology Center
