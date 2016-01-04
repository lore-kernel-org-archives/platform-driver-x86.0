From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel-hid: Fix build failure when
 CONFIG_INTEL_HID_EVENT=m
Date: Mon, 4 Jan 2016 11:28:59 -0800
Message-ID: <20160104192859.GA26072@malice.jf.intel.com>
References: <1451559413-30977-1-git-send-email-sedat.dilek@gmail.com>
 <CALCETrVnyMgKGwPPn2Tp7gy_=y7jeXN-oFJOKW8ZXvdds_LtFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43115 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752040AbcADT3C (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 14:29:02 -0500
Content-Disposition: inline
In-Reply-To: <CALCETrVnyMgKGwPPn2Tp7gy_=y7jeXN-oFJOKW8ZXvdds_LtFA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, platform-driver-x86@vger.kernel.org, Alex Hung <alex.hung@canonical.com>, Andy Lutomirski <luto@kernel.org>

On Thu, Dec 31, 2015 at 04:28:08AM -0800, Andy Lutomirski wrote:
> Hi Darren-
> 
> It looks like your tree will need this fix.
> 
> Thanks,
> Andy

Thanks, since this is still in for-next, I've merged the following, crediting
Sedat, with the original patch. We don't want to introduce a build breakage by
applying this as a separate patch.

Sedat, please Cc all maintainers listed by get_maintainer.pl in the future.

Thanks,

> 
> On Thu, Dec 31, 2015 at 2:56 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > When building with CONFIG_INTEL_HID_EVENT=m on Andy's luto.git#xps13
> > Git branch I see the following build failure:
> >
> > ERROR: "sparse_keymap_setup" [drivers/platform/x86/intel-hid.ko] undefined!
> > ERROR: "sparse_keymap_report_event" [drivers/platform/x86/intel-hid.ko] undefined!
> >
> > Looks like 'select INPUT_SPARSEKMAP' is missing.
> >
> > Fixes: e06871da47db ("intel-hid: new hid event driver for hotkeys")
> > CC: Alex Hung <alex.hung@canonical.com>
> > CC: Andy Lutomirski <luto@kernel.org>
> > Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> > ---
> >  drivers/platform/x86/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index 96a4f18a1c35..ee0ff9287159 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -747,6 +747,7 @@ config INTEL_HID_EVENT
> >         tristate "INTEL HID Event Filter"
> >         depends on ACPI
> >         depends on INPUT
> > +       select INPUT_SPARSEKMAP
> >         help
> >          This driver provides supports for Intel HID event. Some laptops
> >          require this driver for hotkey supports.
> > --
> > 2.6.4
> >
> 
> 
> 
> -- 
> Andy Lutomirski
> AMA Capital Management, LLC
> 

-- 
Darren Hart
Intel Open Source Technology Center
