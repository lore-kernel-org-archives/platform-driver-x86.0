From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH v2] platform/x86: thinkpad_acpi: Fix
 warning about deprecated hwmon_device_register
Date: Thu, 31 Aug 2017 13:54:42 -0300
Message-ID: <20170831165442.3zx4fkgqvvyqvoli@khazad-dum.debian.net>
References: <20170620051633.GB15974@khazad-dum.debian.net>
 <20170621034513.4023-1-kernel@fomichev.me>
 <20170818230106.GA15303@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50021 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751823AbdHaQyp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 31 Aug 2017 12:54:45 -0400
Content-Disposition: inline
In-Reply-To: <20170818230106.GA15303@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Stanislav Fomichev <kernel@fomichev.me>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Stanislav Fomichev <sdf@google.com>, andy@infradead.org

On Fri, 18 Aug 2017, Darren Hart wrote:
> > before:
> > $ cat /sys/devices/platform/thinkpad_hwmon/{name,fan1_input}

> > after:
> > $ cat /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon1/{name,fan1_input}
> > thinkpad
> > 3478
> > $ cat /sys/class/hwmon/hwmon1/{name,fan1_input}
> > thinkpad
> > 3478

I wonder what's the point of retaining the thinkpad_hwmon separate
device [from the thinkpad_acpi platform device] then... but changing
that might break the userspace API even further or cause other
annoyances down the road, so I guess it is the lesser evil.

> > $ sensors
> > thinkpad-isa-0000
> > Adapter: ISA adapter
> > fan1:        3489 RPM

Yeah, that should cover >90% of the usecases since most people just read
these.  It *will* break write accesses using /etc/sysfs.conf and
similar, though (to set fan mode on boot, etc).

It is documented and the userspace ABI is being updated according to the
hwmon subsystem rules *and* the thinkpad-acpi rules...  this is enough
for me, but be warned that people might complain.

> This looks very reasonable to me. The lm-sensors user experience is
> effectively unchanged, and the /sys/* changes move from a specific
> implementation to a generic implementation, taking advantage for the
> subsystem.

Yes, which is why I am not against the ABI change.

> This will be 4.14 because we let it sit too long. I'll correct this.
> 
> I've queued this to testing for 4.14.
> 
> Henrique, please shout if you have any objections here.

No objections.

-- 
  Henrique Holschuh
