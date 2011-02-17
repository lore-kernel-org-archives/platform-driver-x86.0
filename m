From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Enable Dell All-In-One volume up/down keys
Date: Thu, 17 Feb 2011 09:21:58 -0800
Message-ID: <20110217172158.GA21932@core.coreip.homeip.net>
References: <1297688524-26123-1-git-send-email-colin.king@canonical.com>
 <20110217075256.GB19814@core.coreip.homeip.net>
 <1297941011.2234.32.camel@lenovo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1297941011.2234.32.camel@lenovo>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Ian King <colin.king@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Feb 17, 2011 at 11:10:11AM +0000, Colin Ian King wrote:
> Thanks for your feedback Dmitry,
> 
> On Wed, 2011-02-16 at 23:52 -0800, Dmitry Torokhov wrote:
> > Hi Colin,
> > 
> > On Mon, Feb 14, 2011 at 01:02:04PM +0000, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > Enable volume up and down hotkeys on WMI events
> > > GUID 284A0E6B-380E-472A-921F-E52786257FB and
> > > GUID 02314822-307C-4F66-bf0E-48AEAEB26CC8.
> > > 
> > > Also works around a firmware bug where the _WED method
> > > should return an integer containing the key code and in fact
> > > the method returns the key code in element zero of a buffer.
> > > 
> > > BugLink: http://bugs.launchpad.net/bugs/701530
> > > BugLink: http://bugs.launchpad.net/bugs/676997
> > 
> > Looks generally good, one question though - should't it be part of
> > dell-wmi driver?
> 
> Good question.  A couple of points:
> 
> 1. The Dell All-In-One WMI hotkey mechanism is a little different from
> the
> normal Dell WMI hotkey mechanism, so I didn't really want to clutter up
> the
> Dell WMI driver with exceptions for these particular GUIDs and notifier
> IDs.
> 
> 2. These keys appear on a very limited subset of Dell machines, so
> keeping
> this code out of the Dell WMI driver for the majority of Dell machines
> will
> keep the original Dell WMI driver smaller. 
> 
> 3. I expect further additions in functionality for these machines, which
> makes sense to keep it specific to this limited All-In-One driver.
> 
> As it stands, this All-In-One interface has already been implemented by
> two different BIOS vendors and already there are two different
> implementations. I'd like to keep this all in one specific driver for
> this class of machine if possible.

OK, fair enough.

> From 7a4c2b706317df9be5b7514934e87412fa64eaf4 Mon Sep 17 00:00:00 2001
> From: Colin Ian King <colin.king@canonical.com>
> Date: Thu, 17 Feb 2011 10:49:30 +0000
> Subject: [PATCH] Enable Dell All-In-One volume up/down keys
> 
> Enable volume up and down hotkeys on WMI events
> GUID 284A0E6B-380E-472A-921F-E52786257FB4 and
> GUID 02314822-307C-4F66-bf0E-48AEAEB26CC8.
> 
> Also works around a firmware bug where the _WED method
> should return an integer containing the key code and in fact
> the method returns the key code in element zero of a buffer.
> 
> BugLink: http://bugs.launchpad.net/bugs/701530
> BugLink: http://bugs.launchpad.net/bugs/676997
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks much better, but I just noticed that we are missing calls to
sparse_keymap_free(dell_wmi_aio_input_dev) in both probe error handling
path and in remove method (they shoudl be called before unregistering
the device).

Also, can we have probe routine more streamlined, like this:

static int __init dell_wmi_aio_init(void)
{
	int err;
	char *guid;

	guid = dell_wmi_aio_find();
	if (!guid) {
		pr_error("No known WMI GUID found\n");
		return -ENXIO;
	}

	err = dell_wmi_aio_input_setup();
	if (err)
		return err;

	err = wmi_install_notify_handler(guid, dell_wmi_aio_notify, NULL);
	if (err) {
		pr_err("Unable to register notify handler - %d\n", err);
		sparse_keymap_free(dell_wmi_aio_input_dev);
		input_unregister_device(dell_wmi_aio_input_dev);
		return err;
	}

	return 0;
}

Thanks.

-- 
Dmitry
