From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro 3360 multimedia keys
Date: Mon, 20 Nov 2017 18:05:50 +0100
Message-ID: <20171120170550.hvsnuwjqfakablw7@pali>
References: <5089742.2pBsoxBtzf@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37494 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751726AbdKTRFz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2017 12:05:55 -0500
Content-Disposition: inline
In-Reply-To: <5089742.2pBsoxBtzf@natalenko.name>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario_limonciello@dell.com>

Hi!

On Monday 20 November 2017 16:08:41 Oleksandr Natalenko wrote:
> Hi.
> 
> I've got Dell Vostro 3360 with extra multimedia keys as shown here [1], but 
> have no luck to get them working.
> 
> I've modified dell_wmi_smbios_list structure in drivers/platform/x86/dell-
> wmi.c adding new entry:
> 
> ===
>  84     {
>  85         .callback = dmi_matched,
>  86         .ident = "Dell Vostro 3360",
>  87         .matches = {
>  88             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>  89             DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3360"),
>  90         },
>  91     },
> ===

What would happen if you do *not* add this new entry? Please do this
test after your notebook was fully turned off to prevent some cached
configuration in BIOS.

> While pressing keys "1" and/or "2" I get the following notice in dmesg:
> 
> ===
> Nov 20 15:53:35 spock kernel: dell_wmi: Unknown key with type 0x0000 and code 
> 0xe0f0 pressed
> ===

This means that in dell-wmi.c is missing mapping for code 0xe0f0 in key
type 0x0000.

Find array dell_wmi_keymap_type_0000[] and add there line:

  { KE_KEY, 0xe0f0, { KEY_something } },

(where something is correct name of key)

> (it is the same for both keys)

So for both first and second key you got same type+code? That is bad :-(
In this case with above definition we cannot distinguish which was was
pressed. But at least something.

> While pressing key "3" I get the following:
> 
> ===
> Nov 20 15:36:51 spock kernel: atkbd serio0: Unknown key pressed (translated 
> set 2, code 0x60 on isa0060/serio0).
> Nov 20 15:36:51 spock kernel: atkbd serio0: Use 'setkeycodes 60 <keycode>' to 
> make it known.
> ===

This key is not received by dell-wmi.c, but rather via PS/2 keyboard.
Use appropriate setkeycodes command line program to map that code 60 to
some key.

Today in most cases this mapping for PS/2 keyboards is done in udev or
systemd at system startup. They have database for it.

> Here is what I've found in DSDT:
> 
> ===
>                     Method (_Q70, 0, NotSerialized)  // _Qxx: EC Query
>                     {
>                         P8XH (Zero, 0x70)
>                         Notify (MBT1, 0x80) // Status Change
>                         ^^^^AMW0.INF0 = 0x04
>                         ^^^^AMW0.INF1 = Zero
>                         ^^^^AMW0.INF2 = 0xE0F0
>                         ^^^^AMW0.INF3 = One
>                         Notify (AMW0, 0xD0) // Hardware-Specific
>                     }
>  
>                     Method (_QAF, 0, NotSerialized)  // _Qxx: EC Query
>                     {
>                         P8XH (Zero, 0xAF)
>                         Notify (MBT, 0x80) // Status Change
>                         ^^^^AMW0.INF0 = 0x04
>                         ^^^^AMW0.INF1 = Zero
>                         ^^^^AMW0.INF2 = 0xE0F0
>                         ^^^^AMW0.INF3 = 0x02
>                         Notify (AMW0, 0xD0) // Hardware-Specific
>                     }
> ===
> 
> These are the only 2 records that contain 0xe0f0 sequence, and if they 
> correspond to first two multimedia keys, as you can see they differ only in 
> .INF3 field. Unfortunately, I do not know what it might mean.

Just guessing... if I concatenate INF0, INF1, INF2, INF3 and treat every
INF* as 16bit number I got this sequence:

  0x0004 0x0000 0xE0F0 0x0001

  0x0004 0x0000 0xE0F0 0x0002

And it looks like a valid buffer for dell_wmi_notify() function.

Look at this part of that function:

		switch (buffer_entry[1]) {
		case 0x0000: /* One key pressed or event occurred */
			if (len > 2)
				dell_wmi_process_key(wdev, 0x0000,
						     buffer_entry[2]);
			/* Other entries could contain additional information */

If I'm right that above INF* sequence is put into dell_wmi_notify()
function, then in buffer[3] you should be able to see either 0x01 or
0x02. And distinguish which key was pressed.

Can you test it? Beware of "len" of buffer_entry when you would do
tests.

> I was monitoring /proc/interrupts file and noticed that values here:
> 
> ===
>   9:        430        293         65         24   IO-APIC   9-fasteoi   acpi
> ===
> 
> are incremented by one on each key press. Also, if i press key "3" (the one 
> that generates different message in kernel log), the following interrupt is 
> fired too:
> 
> ===
>   1:        646       6391        358        487   IO-APIC   1-edge      i8042
> ===
> 
> Running evtest, I'm able to catch some output while pressing key "3":
> 
> ===
> Event: time 1511189973.016907, type 4 (EV_MSC), code 4 (MSC_SCAN), value e025
> Event: time 1511189973.016907, type 1 (EV_KEY), code 203 (KEY_PROG4), value 1
> Event: time 1511189973.016907, -------------- SYN_REPORT ------------
> Event: time 1511189973.016942, type 1 (EV_KEY), code 203 (KEY_PROG4), value 0
> Event: time 1511189973.016942, -------------- SYN_REPORT ------------
> ===

So it means that third key is also received by dell-wmi? Anyway see
function dell_wmi_process_key() and line:

	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
		return;

It is there just to ensure that key is not send via both PS/2 keyboard
and dell-wmi.

So I guess you should disable wmi_requires_smbios_request.

> I think this corresponds to what I see in drivers/platform/x86/dell-wmi.c file 
> here:
> 
> ===
> 143     /* Dell Instant Launch key */
> 144     { KE_KEY,    0xe025, { KEY_PROG4 } },
> ===
> 
> Other two keys do not produce any evtest output.
> 
> Here is acpidump output: [2]
> Here is decompiled DSDT: [3]
> 
> Also, I've raised this question before a couple of times (for instance, [4]), 
> but unfortunately got no result :(.
> 
> Could you please help me in fixing multimedia keys?

I Hope that this email helps you.

> Thanks.
> 
> [1] http://beta.hstor.org/files/c3b/a26/628/
> c3ba26628409486f8b9ae16d97be7d21.jpg
> [2] https://gist.github.com/7c04035ba2a3f0e5501af83efdb1456d
> [3] https://gist.github.com/83687126c46417b5bc0b48529de52460
> [4] https://www.spinics.net/lists/platform-driver-x86/msg05251.html

-- 
Pali Rohár
pali.rohar@gmail.com
