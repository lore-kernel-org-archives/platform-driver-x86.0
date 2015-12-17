From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH] intel-hid: new hid event driver for hotkeys
Date: Thu, 17 Dec 2015 14:50:39 -0800
Message-ID: <CALCETrUoEyVKxcUJU76=5yZzCuihxtFJsxu2vAUxLr38cR+e2Q@mail.gmail.com>
References: <1450337402-4178-1-git-send-email-alex.hung@canonical.com> <20151217221553.GA23048@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34137 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751272AbbLQWu7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 Dec 2015 17:50:59 -0500
Received: by mail-oi0-f51.google.com with SMTP id o124so50931827oia.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Dec 2015 14:50:59 -0800 (PST)
In-Reply-To: <20151217221553.GA23048@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org

On Thu, Dec 17, 2015 at 2:15 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Thu, Dec 17, 2015 at 03:30:02PM +0800, Alex Hung wrote:
>> This driver supports various hid events including hotkeys.
>> Dell XPS 13 9350 requires it for wireless hotkey.
>>
>> Andy Lutomirski contributed greatly to this driver.
>>
>> Signed-off-by: Alex Hung <alex.hung@canonical.com>
>
> Queued for testing.
>
> Andy, please provide your Reviewed-by if you're happy with it.

Reviewed-and-tested-by: Andy Lutomirski <luto@kernel.org>

Minor nits, though:

+        This driver provides supports for Intel HID event. Some laptops
+        require this driver for hotkey supports.

Should that be "This driver provides support for the Intel HID Event
hotkey interface.  Some laptops require this driver for hotkey
support."?

Also, can we remove the word "Filter" a couple lines up in the Kconfig
file?  I'd guess the the Windows equivalent is a "filter' driver in
the Windows model, but it's not logically filtering anything, and
there's nothing filter-like about the Linux driver.

(I think it's slightly sad that HID is in the name, too, but that's
indeed what it seems to be called.)

>
> Alex, just one question maybe you can answer quickly and save me some time
> below:
>
>
>> +static int intel_hid_pl_suspend_handler(struct device *device)
>> +{
>> +     intel_hid_set_enable(device, 0);
>> +     return 0;
>> +}
>> +
>> +static int intel_hid_pl_resume_handler(struct device *device)
>> +{
>> +     intel_hid_set_enable(device, 1);
>> +     return 0;
>> +}
>
> Why not propagate the intel_hid_set_enable() return code? Is it because it just
> doesn't really impact suspend/resume, even if we do get an error?

That was me, actually.  I definitely don't want to cause suspect to
fail if the ACPI call fails.  At worst we'll report a spurious key
event when we resume.

--Andy
