From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Lenovo IdeaPAD ACPI driver
Date: Wed, 11 Aug 2010 14:39:59 +0100
Message-ID: <1281533999.3236.8.camel@localhost>
References: <1281480758.5887.33.camel@localhost>
	 <AANLkTin=Dwbe3gPDGd89Oc25mfOVVvc2_goP77sSVNeo@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:58885 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752136Ab0HKNkW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Aug 2010 09:40:22 -0400
In-Reply-To: <AANLkTin=Dwbe3gPDGd89Oc25mfOVVvc2_goP77sSVNeo@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Wed, 2010-08-11 at 14:59 +0200, Corentin Chary wrote:
> I'd suggest to name it ideapad-laptop (IDEAPAD_LAPTOP). We try to use
> that name for laptop related drivers.

OK.

> But ... new WMI drivers are named with the *-wmi suffix. So I'm not
> really sure. Anyway, it's not really important.

It doesn't do any WMI stuff... yet. I was looking at your discussion
from April and hoping you'd help make it work...

> What's DEV_KILLSW ? a global kill switch ?

Yes, that's a physical switch on the side of the laptop which
automatically kills all of wifi, bluetooth and 3g.

> > +static struct rfkill *ideapad_rfkill[5];
> > +
> > +static const char *ideapad_rfk_names[] = {
> > +       "ideapad_camera", "ideapad_wlan", "ideapad_bluetooth", "ideapad_3g", "ideapad_rfkill"
> > +};
> 
> Hum, ideapad_camera inside rfkill stuff ?

Element zero of the array doesn't get used. It was that or add a bunch
of '-1' in various places. I am entirely unconvinced which I like least.
It's the same for the types:

> > +static const int ideapad_rfk_types[] = {
> > +       0, RFKILL_TYPE_WLAN, RFKILL_TYPE_BLUETOOTH, RFKILL_TYPE_WWAN, RFKILL_TYPE_WLAN
> > +};
...
> > +static ssize_t store_ideapad_cam(struct device *dev,
> > +                                struct device_attribute *attr,
> > +                                const char *buf, size_t count)
> > +{
> > +       int ret, state;
> > +
> > +       if (!count)
> > +               return 0;
> > +       if (sscanf(buf, "%i", &state) != 1)
> > +               return -EINVAL;
> > +       ret = ideapad_dev_set_state(IDEAPAD_DEV_CAMERA, state);
> 
> What does it do with values other than 1 and 0 ? maybe you could send
> !!state instead

I could do. The ACPI code does so for itself anyway:

            If (Arg1)
            {
                Store (0x01, Local1)
            }
            Else
            {
                Store (0x00, Local1)
            }

> Also, it would be great not to use the "there will only be one of
> these device" anti-pattern.
> Of course, it will work, but I think it's better to get a clean,
> fully-reentrant driver.

Agreed. Will fix.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
