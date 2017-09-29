From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 2/8] platform/x86: dell-smbios: Introduce a WMI-ACPI
 interface
Date: Fri, 29 Sep 2017 09:35:45 +0200
Message-ID: <20170929073545.GA13546@pali>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <7b632baafbfdc6c55c4d56225c54fd441b747286.1506571188.git.mario.limonciello@dell.com>
 <201709280853.51019@pali>
 <52059e7ff4b14fe5b4f4a187fd30d1fe@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:34804 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750709AbdI2Hfz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Sep 2017 03:35:55 -0400
Content-Disposition: inline
In-Reply-To: <52059e7ff4b14fe5b4f4a187fd30d1fe@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com

On Thursday 28 September 2017 22:43:36 Mario.Limonciello@dell.com wrote:
> > > @@ -170,10 +226,43 @@ static void __init find_tokens(const struct dmi_header
> > *dm, void *dummy)
> > >  	}
> > >  }
> > >
> > > -static int __init dell_smbios_init(void)
> > > +static int dell_smbios_wmi_probe(struct wmi_device *wdev)
> > > +{
> > > +	/* no longer need the SMI page */
> > > +	free_page((unsigned long)buffer);
> > > +
> > > +	/* WMI buffer should be 32k */
> > > +	buffer = (void *)__get_free_pages(GFP_KERNEL, 3);
> > > +	if (!buffer)
> > > +		return -ENOMEM;
> > > +	bufferlen = sizeof(struct wmi_calling_interface_buffer);
> > > +	wmi_dev = wdev;
> > > +	return 0;
> > > +}
> > > +
> > > +static int dell_smbios_wmi_remove(struct wmi_device *wdev)
> > >  {
> > > -	int ret;
> > > +	wmi_dev = NULL;
> > > +	free_pages((unsigned long)buffer, 3);
> > > +	return 0;
> > > +}
> > 
> > This code does not seem to be safe. dell_smbios_wmi_probe and
> > dell_smbios_wmi_remove are called at any time when kernel register new
> > device which matches some properties OR when user manually bind this
> > driver to that device.
> > 
> I'll adjust for the assumptions I made about it only happening at module init.
> 
> > buffer and wmi_dev is shared as a global variable which means that when
> > there are two devices which want to bind to this driver, kernel would
> > get double free at removing time.
> 
> But there is only one GUID in id_table.

That is truth, but ...

> How can two devices bind to this?
> This should be an impossible scenario.

... in ACPI DSDT can be more WMI _WDG buffers which could lead to more
wmi buses and each could have own GUID. Therefore there is a theoretical
chance that specially prepared ACPI DSDT code can cause this problem.

> > Devices from the bus subsystem should not use global shared variables,
> > but rather allocate own memory...
> 
> Part of the problem is that this module can operate in two modes now.
> I think there will have to be global shared variables when operating in SMI
> mode.  Or maybe put those bits into a platform_device for SMI mode usage?
> 
> The problem I think then becomes how do you handle dell_smbios_send_request?
> Without global shared memory for the module the dell-laptop and dell-wmi
> modules won't be able to use this.

The whole problem is that SMBIOS calls are implemented via singleton
pattern. And this singleton "instance" needs to use something which is
not a singleton, but a dynamic objects (wmi device <--> driver pattern).

Idea how to handle it:
* put wmi smbios call function into own driver
* put smm smbios call function into own driver
* create dispatcher function which take first available device of one of
  the above driver and call on them smbios call function

This problem is very similar to problems in objects world... driver as a
class and device as a instance.

(Or if somebody has a better idea, let us know...)

> > Also note that user can at any time unbound device from driver and also
> > can bind it again.
> I'll make some adjustments to account for this.

To prevent crashing kernel, this needs to be written correctly. And user
should not be able to crash kernel just when trying to unbound driver
from the device.

-- 
Pali Rohár
pali.rohar@gmail.com
