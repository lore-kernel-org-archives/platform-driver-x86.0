From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH] WMI: properly cleanup devices to avoid crashes
Date: Sat, 08 Oct 2011 06:54:33 +0100
Message-ID: <3053753.3fcxNv2AyB@valkyrie>
References: <20110907220002.GB7104@core.coreip.homeip.net> <20111006224044.GB30738@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:41535 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910Ab1JHF66 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 8 Oct 2011 01:58:58 -0400
Received: by wyg34 with SMTP id 34so4500274wyg.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Oct 2011 22:58:57 -0700 (PDT)
In-Reply-To: <20111006224044.GB30738@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Colin Ian King <colin.king@canonical.com>, platform-driver-x86@vger.kernel.org

On Thursday 06 Oct 2011 15:40:44 Dmitry Torokhov wrote:
> On Wed, Sep 07, 2011 at 03:00:02PM -0700, Dmitry Torokhov wrote:
> > We need to remove devices that we destroy from the list, otherwise
> > we'll crash if there are more than one "_WDG" methods in DSDT.
> > 
> > This fixes https://bugzilla.kernel.org/show_bug.cgi?id=32052
> > 
> > Tested-by: Ilya Tumaykin <librarian_rus@yahoo.com>
> > Cc: stable@kernel.org
> > Signed-off-by: Dmitry Torokhov <dtor@mail.ru>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> > ---
> 
> * ping *
> 
> >  drivers/platform/x86/wmi.c |    6 +++++-
> >  1 files changed, 5 insertions(+), 1 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> > index f23d5a8..9b88be4 100644
> > --- a/drivers/platform/x86/wmi.c
> > +++ b/drivers/platform/x86/wmi.c
> > @@ -754,9 +754,13 @@ static void wmi_free_devices(void)
> > 
> >  	struct wmi_block *wblock, *next;
> >  	
> >  	/* Delete devices for all the GUIDs */
> > 
> > -	list_for_each_entry_safe(wblock, next, &wmi_block_list, list)
> > +	list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
> > +		list_del(&wblock->list);
> > 
> >  		if (wblock->dev.class)
> >  		
> >  			device_unregister(&wblock->dev);
> > 
> > +		else
> > +			kfree(wblock);
> > +	}
> > 
> >  }
> >  
> >  static bool guid_already_parsed(const char *guid_string)
