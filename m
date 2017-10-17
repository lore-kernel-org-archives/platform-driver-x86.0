From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 07/17] platform/x86: dell-smbios: only run if proper
 oem string is detected
Date: Tue, 17 Oct 2017 21:25:03 +0200
Message-ID: <20171017192503.z3yh5pdmxgr7rvbp@pali>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <255fc4b41a394542d63bf5a958314904e865a273.1508259916.git.mario.limonciello@dell.com>
 <20171017190336.iqhzmdsimx4f7mfw@pali>
 <f8132fa7a90a4954831fc3ee30be4329@ausx13mpc120.AMER.DELL.COM>
 <811c84e436424acaba9a02186db00cf8@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:55839 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753816AbdJQTZG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2017 15:25:06 -0400
Content-Disposition: inline
In-Reply-To: <811c84e436424acaba9a02186db00cf8@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com, gnomes@lxorguk.ukuu.org.uk

On Tuesday 17 October 2017 19:19:02 Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Limonciello, Mario
> > Sent: Tuesday, October 17, 2017 2:11 PM
> > To: 'Pali Rohár' <pali.rohar@gmail.com>
> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy
> > Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysocki.net;
> > mjg59@google.com; hch@lst.de; Greg KH <greg@kroah.com>; Alan Cox
> > <gnomes@lxorguk.ukuu.org.uk>
> > Subject: RE: [PATCH v9 07/17] platform/x86: dell-smbios: only run if proper oem
> > string is detected
> > 
> > > -----Original Message-----
> > > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > > Sent: Tuesday, October 17, 2017 2:04 PM
> > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> > Andy
> > > Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysocki.net;
> > > mjg59@google.com; hch@lst.de; Greg KH <greg@kroah.com>; Alan Cox
> > > <gnomes@lxorguk.ukuu.org.uk>
> > > Subject: Re: [PATCH v9 07/17] platform/x86: dell-smbios: only run if proper oem
> > > string is detected
> > >
> > > On Tuesday 17 October 2017 13:21:51 Mario Limonciello wrote:
> > > > The proper way to indicate that a system is a 'supported' Dell System
> > > > is by the presence of this string in OEM strings.
> > > >
> > > > Allowing the driver to load on non-Dell systems will have undefined
> > > > results.
> > > >
> > > > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > > > Reviewed-by: Edward O'Callaghan <quasisec@google.com>
> > > > ---
> > > >  drivers/platform/x86/dell-smbios.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-
> > > smbios.c
> > > > index e9b1ca07c872..7e779278d054 100644
> > > > --- a/drivers/platform/x86/dell-smbios.c
> > > > +++ b/drivers/platform/x86/dell-smbios.c
> > > > @@ -172,8 +172,15 @@ static void __init find_tokens(const struct dmi_header
> > > *dm, void *dummy)
> > > >
> > > >  static int __init dell_smbios_init(void)
> > > >  {
> > > > +	const struct dmi_device *valid;
> > > >  	int ret;
> > > >
> > > > +	valid = dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System",
> > > NULL);
> > >
> > > Are you sure that all Dell machines have exactly this string? IIRC this
> > > smbios interface via SMM is supported by machines back to 2005... Also
> > > in other DMI tables in dell-latop there is e.g. "Dell Inc." or "Dell
> > > Computer Corporation".
> > >
> > I checked the spec and it's been there since systems 1999 onward.
> > 
> 
> Oh and it's case it's not apparent, this is from OEM strings section.  It's not
> the same as standard SMBIOS strings for system manufacturer, bios vendor
> etc.  I'm checking this one specifically because a system can be rebranded.  
> When rebranded the drivers won't load automatically, but this interface 
> should still work on a if manually loaded.

So if machine is rebranded, then this string is also changed? If string
is changed, then this patch cause our kernel driver to refuse load on
those machines...

-- 
Pali Rohár
pali.rohar@gmail.com
