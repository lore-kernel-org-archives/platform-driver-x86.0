From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Thu, 9 Feb 2017 07:57:02 +0100
Message-ID: <20170209065702.GA999@ozzy.nask.waw.pl>
References: <20170208134633.5152-1-kernel@kempniu.pl>
 <CAHp75VfaN+wefbk71OthMDTeDLc9pu7fwrnMm_0hrh8VocheHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfaN+wefbk71OthMDTeDLc9pu7fwrnMm_0hrh8VocheHw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> Regarding ACPI case and device presents you may assume it if you just call
> acpi_walk_namespace() (AFAIU) and check _STA for the device if it's in
> the table.
> 
> So, at any point you may have got understanding if device is present
> or not, and if it's active or not.

Thank you for the tip, though I am a bit confused, sorry.  I infer the
above is a response to this part of my message:

> >     On the other hand, registering the platform device before the ACPI
> >     driver is also incorrect due to reasons I already pointed out in
> >     another thread (in short: we cannot _assume_ FUJ02E3 is present).

Perhaps my wording was inaccurate, but I do not have a technical problem
with detecting an ACPI device.  Instead, this passage was meant to be a
reference to the fourth paragraph of my cover letter for the series
titled "fujitsu_init() cleanup", i.e. the lengthy one awaiting comments
from you and/or Darren.  For your convenience, here is the paragraph in
question (roughly the second half is relevant):

> That would leave us with the remaining three sysfs attributes of the
> platform device, namely dock, lid and radios.  These all depend on the
> FUJ02E3 ACPI device.  Which begs the question: shall we reassign them to
> that ACPI device and drop the platform device altogether?  This would
> logically be the correct thing to do (panasonic-laptop and toshiba_acpi
> already assign extra sysfs attributes to ACPI nodes).  But I understand
> that this would break an 8-year-old userspace interface as functions
> previously exposed through /sys/devices/platform/fujitsu-laptop would be
> moved to /sys/bus/acpi/devices/FUJ02E3:00.  If that is unacceptable, the
> least we can (and should) do is to move platform device registration to
> acpi_fujitsu_hotkey_add().  What the driver currently does may create
> confusion in the future, because the platform device is registered
> unconditionally while it clearly depends on FUJ02E3 being present.  I do
> not know whether FUJ02E3 is present on all Fujitsu devices today without
> exception, but I do know that if Fujitsu ever decides to drop that
> device from its firmware, we would again (see above) expose a userspace
> interface (dock, lid, radios) which simply will not be able to function
> properly.

Perhaps things will become a bit more clear once you dig through that
thread :)

-- 
Best regards,
Michał Kępień
