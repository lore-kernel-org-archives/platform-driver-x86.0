From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH] toshiba_acpi: Fix keyboard backight sysfs entries not
 being updated
Date: Fri, 20 Nov 2015 16:55:06 -0700
Message-ID: <CAGdLNWF66_R1DB3mQDqTMQMxUMLv9zidOc+upa-AabFQBzkqGA@mail.gmail.com>
References: <1447703971-8079-1-git-send-email-coproscefalo@gmail.com>
	<20151120233956.GF7413@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:33196 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761217AbbKTXzI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 18:55:08 -0500
In-Reply-To: <20151120233956.GF7413@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-11-20 16:39 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> On Mon, Nov 16, 2015 at 12:59:31PM -0700, Azael Avalos wrote:
>> Certain Toshiba models with the second generation keyboard backlight
>> (type 2) do not generate the keyboard backlight changed event (0x92),
>> and thus, the sysfs entries are never being updated.
>>
>> This patch adds a workquee and a global boolean variable to address
>> the issue.
>>
>> For those models that do generate the event, the sysfs entries are
>> being updated via the *notify function and the boolean is set to
>> true to avoid a second call to update the entries.
>>
>> For those models that do not generate the event, the workquee is
>> used to update the sysfs entries and also to emulate the event via
>> netlink, to make userspace aware of such change.
>
> Thanks Azael,
>
> Rather than ask you to wait while I research workqueues and their use more, what
> is it about this task that requires a workqueue? Why can we not call what's in
> the workqueue below directly from the kbd_backlight_mode_store sysfs write
> callback?

I used the workquee to let the sysfs *store function to finish w/o affecting
the "refresh" of the sysfs entries.

Previously the sysfs_update_group resided inside the *store function,
but caused a lock everytime the keyboard mode was changed, and the
sysfs entries were never updated, this was fixed by moving such function
to the *notify function, but turns out that some models do not fire such
event.


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
