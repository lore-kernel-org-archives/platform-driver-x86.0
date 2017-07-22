From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] platform/x86: intel-vbtn: reduce unnecessary messages for normal users
Date: Sat, 22 Jul 2017 23:51:44 +0200
Message-ID: <1932733.PdyNOSXbJ3@aspire.rjw.lan>
References: <1500609408-30745-1-git-send-email-alex.hung@canonical.com> <20170721231620.GB7888@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:52529 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750921AbdGVV7k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 22 Jul 2017 17:59:40 -0400
In-Reply-To: <20170721231620.GB7888@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, andy@infradead.org, platform-driver-x86@vger.kernel.org

On Friday, July 21, 2017 04:16:20 PM Darren Hart wrote:
> On Thu, Jul 20, 2017 at 08:56:48PM -0700, Alex Hung wrote:
> > Unsupported events is only useful for developers and does not meaningful
> > for users. Using dev_dbg makes more sense and reduces noise in kernel
> > messages.
> > 
> > Signed-off-by: Alex Hung <alex.hung@canonical.com>
> > ---
> >  drivers/platform/x86/intel-vbtn.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> > index 61f1063..10f92ac 100644
> > --- a/drivers/platform/x86/intel-vbtn.c
> > +++ b/drivers/platform/x86/intel-vbtn.c
> > @@ -83,7 +83,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
> >  	} else if (sparse_keymap_report_event(priv->input_dev, event, 1, true)) {
> >  		return;
> >  	}
> > -	dev_info(&device->dev, "unknown event index 0x%x\n", event);
> > +	dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
> 
> info is the most common log level for these events in the platform
> driver x86 subsystem per 'git grep -i "unknown event"'.
> 
> My take on this is that we want these to be reported by users,

Well, for what purpose?

> rather than rely on developers to find them all - especially as the
> developers only see a fraction of the affected hardware.
> 
> Are you finding these to be causing a problem / or producing really
> excessive log messages?

These messages suggest that there's something wrong while it may just be
events that we really don't care about.

I'd rather want users to report missing functionality or things not working as
expected than silly messages in the log that may just be meaningless in
practice.

Thanks,
Rafael
