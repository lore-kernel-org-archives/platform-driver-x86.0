From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH] toshiba_acpi: Avoid registering input device on WMI event laptops
Date: Wed, 22 Jul 2015 17:30:30 -0600
Message-ID: <CAGdLNWHP0W75=XT+HJN0gzCDE+LJ+8SKNf92jB24_FNaNAuCiw@mail.gmail.com>
References: <1437089937-4383-1-git-send-email-coproscefalo@gmail.com>
	<20150720215503.GC34611@vmdeb7>
	<CAGdLNWE2=jeafsxnNr4uxAFrV702jdH_h_G1vM4ciRS7WPf=6Q@mail.gmail.com>
	<20150722205459.GA102536@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:37057 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752704AbbGVXac (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jul 2015 19:30:32 -0400
In-Reply-To: <20150722205459.GA102536@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-07-22 14:54 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Mon, Jul 20, 2015 at 04:49:51PM -0600, Azael Avalos wrote:
>> Hi Darren,
>>
>> 2015-07-20 15:55 GMT-06:00 Darren Hart <dvhart@infradead.org>:
>> > On Thu, Jul 16, 2015 at 05:38:57PM -0600, Azael Avalos wrote:
>> >> Commit f11f999e9890 ("toshiba_acpi: Refuse to load on machines with
>> >> buggy INFO implementations") denied loading on laptops with a WMI Event
>> >> GUID given that such laptops manage the hotkeys via that interface,
>> >> however, such laptops have a working Toshiba Configuration Interface
>> >> (TCI), and thus, such commit denied several supported features.
>> >>
>> >> This patch avoids registering the input device and ignores all hotkey
>> >> events on laptops with such WMI Event GUI, making the supported
>> >
>> > GUID
>> >
>> >> features found in those laptops to work.
>> >>
>> >> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> >> ---
>> >>  drivers/platform/x86/toshiba_acpi.c | 21 +++++++++++++--------
>> >>  1 file changed, 13 insertions(+), 8 deletions(-)
>> >>
>> >> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> >> index 15d8f0d..a3c6ea2 100644
>> >> --- a/drivers/platform/x86/toshiba_acpi.c
>> >> +++ b/drivers/platform/x86/toshiba_acpi.c
>> >> @@ -2397,6 +2397,11 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
>> >>       u32 hci_result;
>> >>       int error;
>> >>
>> >> +     if (wmi_has_guid(TOSHIBA_WMI_EVENT_GUID)) {
>> >> +             pr_info("WMI event detected, hotkeys won't be monitored\n");
>> >
>> > It's best practice to avoid contractions in any form of technical writing. (See
>> > what I did there? ;-)
>> >
>> > While this is good for comments, I feel it's more important for kernel messages.
>> >
>> >> +             return 0;
>> >> +     }
>> >> +
>> >>       error = toshiba_acpi_enable_hotkeys(dev);
>> >>       if (error)
>> >>               return error;
>> >> @@ -2730,6 +2735,14 @@ static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 event)
>> >>
>> >>       switch (event) {
>> >>       case 0x80: /* Hotkeys and some system events */
>> >> +             /*
>> >> +              * Machines with this WMI guid aren't supported due to bugs in
>> >> +              * their AML.
>> >> +              *
>> >> +              * Return silently to avoid triggering a netlink event.
>> >> +              */
>> >> +             if (wmi_has_guid(TOSHIBA_WMI_EVENT_GUID))
>> >> +                     return;
>> >>               toshiba_acpi_process_hotkeys(dev);
>> >>               break;
>> >>       case 0x81: /* Dock events */
>> >> @@ -2816,14 +2829,6 @@ static int __init toshiba_acpi_init(void)
>> >>  {
>> >>       int ret;
>> >>
>> >> -     /*
>> >> -      * Machines with this WMI guid aren't supported due to bugs in
>> >
>> > Good idea to capitalize acronyms like GUID.
>> >
>> >> -      * their AML. This check relies on wmi initializing before
>> >> -      * toshiba_acpi to guarantee guids have been identified.
>> >> -      */
>> >> -     if (wmi_has_guid(TOSHIBA_WMI_EVENT_GUID))
>> >> -             return -ENODEV;
>> >> -
>> >>       toshiba_proc_dir = proc_mkdir(PROC_TOSHIBA, acpi_root_dir);
>> >>       if (!toshiba_proc_dir) {
>> >>               pr_err("Unable to create proc dir " PROC_TOSHIBA "\n");
>> >> --
>> >> 2.4.3
>> >>
>> >>
>> >
>> > Functional content looks good. No need to resend, just please keep the above in
>> > mind for the future. I'll make the minor updates and merge all three after your
>> > response to the first regarding user:kernel interface - unless of course you
>> > choose to resend the 3 at the same time, and I'll pick those up.
>>
>> OK, will keep those things in mind, will wait for comments on first patch and
>> send a v2.
>>
>
> I believe I've responded to all the patches in my queue from you. If I'm missing
> one, please let me know which one. I have 4 pending from you. If you send a v2,
> would you just send all 4 to avoid any confusion?

I was waiting for some feedback on the first patch, tho' if there is
no problem with
it, I'll send v2 in a few for you to queue, plus a few others for-review.

>
> Thanks,
>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
