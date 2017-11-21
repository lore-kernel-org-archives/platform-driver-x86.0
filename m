From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro 3360 multimedia keys
Date: Tue, 21 Nov 2017 14:51:10 +0100
Message-ID: <20171121135110.nbnxc3n3xxlbvyis@pali>
References: <5089742.2pBsoxBtzf@natalenko.name>
 <20171120170550.hvsnuwjqfakablw7@pali>
 <32854318.MItBFFhxJX@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <32854318.MItBFFhxJX@natalenko.name>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksandr Natalenko <oleksandr@natalenko.name>, Mario Limonciello <mario_limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi!

What would happen if you enable wmi_requires_smbios_request? Nothing?
And situation is exactly same?

Mario, can you comment why Dell Vostro 3360 generates same WMI keycode
event for two different keys and distinguish key via third value in WMI
buffer? Looks like this is first Dell machine which do such thing.

Or is needed some magic sequence to enable those media keys on Dell
Vostr 3360 to work correctly? We already have some special "enable" code
for Dell Inspirion M5110 and Dell Vostro V131.

On Monday 20 November 2017 22:31:18 Oleksandr Natalenko wrote:
> Hi, Pali et al.
> 
> Thanks for the detailed explanation. I've managed to craft the following ugly 
> hack:
> 
> (I explain my thoughts on it under the snippet)
> 
> ===
> commit a2baeaba1657a47359efea61865aa012da509e03
> Author: Oleksandr Natalenko <oleksandr@natalenko.name>
> Date:   Mon Nov 20 13:25:43 2017 +0100
> 
>     dell-wmi: support Dell Vostro 3360
>     
>     Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 28d9f8696081..23dd55a6463c 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -49,6 +49,7 @@ MODULE_LICENSE("GPL");
>  #define DELL_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
>  
>  static bool wmi_requires_smbios_request;
> +static bool wmi_keycode_combined;
>  
>  MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
>  MODULE_ALIAS("wmi:"DELL_DESCRIPTOR_GUID);
> @@ -64,6 +65,12 @@ static int __init dmi_matched(const struct dmi_system_id 
> *dmi)
>  	return 1;
>  }
>  
> +static int __init dmi_keycode_combined_matched(const struct dmi_system_id 
> *dmi)
> +{
> +	wmi_keycode_combined = 1;
> +	return 1;
> +}
> +
>  static const struct dmi_system_id dell_wmi_smbios_list[] __initconst = {
>  	{
>  		.callback = dmi_matched,
> @@ -81,6 +88,14 @@ static const struct dmi_system_id dell_wmi_smbios_list[] 
> __initconst = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
>  		},
>  	},
> +	{
> +		.callback = dmi_keycode_combined_matched,
> +		.ident = "Dell Vostro 3360",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3360"),
> +		},
> +	},
>  	{ }
>  };
>  
> @@ -189,6 +204,10 @@ static const struct key_entry dell_wmi_keymap_type_0000[] 
> = {
>  	/* Dell Support Center key */
>  	{ KE_IGNORE, 0xe06e, { KEY_RESERVED } },
>  
> +	/* Dell Vostro 3360 combined keycode */
> +	{ KE_KEY,    0xe0f1, { KEY_PROG1 } },
> +	{ KE_KEY,    0xe0f2, { KEY_PROG2 } },

What is purpose of those two keys? Does not linux kernel already have
better description for them as KEY_PROG1 and KEY_PROG2?

> +
>  	{ KE_IGNORE, 0xe0f7, { KEY_MUTE } },
>  	{ KE_IGNORE, 0xe0f8, { KEY_VOLUMEDOWN } },
>  	{ KE_IGNORE, 0xe0f9, { KEY_VOLUMEUP } },
> @@ -398,7 +417,16 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  
>  		switch (buffer_entry[1]) {
>  		case 0x0000: /* One key pressed or event occurred */
> -			if (len > 2)
> +			pr_info("len: %d, quirk: %d\n",
> +				len, wmi_keycode_combined);
> +			if (len > 3) {
> +				pr_info("%x, %x, %x\n",
> +					buffer_entry[2], buffer_entry[3],
> +					buffer_entry[2] | buffer_entry[3]);
> +				if (wmi_keycode_combined)
> +					dell_wmi_process_key(wdev, 0x0000,
> +							     buffer_entry[2] | buffer_entry[3]);
> +			} else if (len > 2)
>  				dell_wmi_process_key(wdev, 0x0000,
>  						     buffer_entry[2]);
>  			/* Other entries could contain additional information */
> 
> ===
> 
> First, I've added a new quirk handler, specifically for my laptop. It hides 
> all the further ugly hackery under distinct code branch.
> 
> Then, if buffer length is > 3 and if quirk is set, bitwise OR on 
> buffer_entry[2] and buffer_entry[3] is performed (IOW, on "key code" and INF3 
> field in DSDT) to get new "fake" keycode, which will be different for key "1" 
> and "2":
> 
> code   | INF3 | fake code
> -------+------+----------
> 0xe0f0 | 0x1  | 0xe0f1
> 0xe0f0 | 0x2  | 0xe0f2
> 
> Finally, I add two new fake keycodes to the table, and kernel recognizes 
> multimedia keys like this. First key:
> 
> ===
> Nov 20 22:24:45 spock kernel: dell_wmi: len: 5, quirk: 1
> Nov 20 22:24:45 spock kernel: dell_wmi: e0f0, 1, e0f1
> ===
> 
> Second key:
> 
> ===
> Nov 20 22:25:07 spock kernel: dell_wmi: len: 5, quirk: 1
> Nov 20 22:25:07 spock kernel: dell_wmi: e0f0, 2, e0f2
> ===
> 
> In evtest I get this:
> 
> ===
> Event: time 1511213126.916920, type 4 (EV_MSC), code 4 (MSC_SCAN), value e0f1
> Event: time 1511213126.916920, type 1 (EV_KEY), code 148 (KEY_PROG1), value 1
> Event: time 1511213126.916920, -------------- SYN_REPORT ------------
> Event: time 1511213126.916944, type 1 (EV_KEY), code 148 (KEY_PROG1), value 0
> Event: time 1511213126.916944, -------------- SYN_REPORT ------------
> 
> Event: time 1511213127.266903, type 4 (EV_MSC), code 4 (MSC_SCAN), value e0f2
> Event: time 1511213127.266903, type 1 (EV_KEY), code 149 (KEY_PROG2), value 1
> Event: time 1511213127.266903, -------------- SYN_REPORT ------------
> Event: time 1511213127.266919, type 1 (EV_KEY), code 149 (KEY_PROG2), value 0
> Event: time 1511213127.266919, -------------- SYN_REPORT ------------
> ===
> 
> Third key (the one that is handled via PS/2 keyboard) produces this in the 
> kernel buffer:
> 
> ===
> Nov 20 22:27:08 spock kernel: atkbd serio0: Unknown key pressed (translated 
> set 2, code 0x60 on isa0060/serio0).
> Nov 20 22:27:08 spock kernel: atkbd serio0: Use 'setkeycodes 60 <keycode>' to 
> make it known.
> Nov 20 22:27:08 spock kernel: dell_wmi: len: 3, quirk: 1
> ===
> 
> But evtest remains silent.
> 
> So, kinda working?

Seems you still have not configured keycode for your internal PS/2
keyboard to make this key working. Use 'setkeycodes 60 <keycode>' as
written in dmesg.

> The only question that remains is how to avoid this ugly hack with OR'ing 
> multiple values. Apparently, calling dell_wmi_process_key() with only INF2 
> DSDT field is insufficient to distinguish two different keys with the same 
> code.

After Mario (from @Dell) clarifies how to handle your laptop, I can
write patch for dell-wmi.c driver.

And if there be no statement, then I would try to clean your patch.
There is probably no better option then checking it in buffer/event
handling.

> Also, I've noticed this remark:
> 
> ===
> /* Other entries could contain additional information */
> ===
> 
> As you may see, they indeed do. Any unimplemented idea behind this statement?

If you look into dell_wmi_keymap_type_0000[] array there are comments
what is after some key codes. E.g. after key code for brightness up/down
may be value which represent new brightness level. But all those data
are not parsed as dell-wmi does not need it and because those data are
send also via different interfaces (e.g. brightness level via standard
ACPI methods...).

> Any other ideas on how to avoid ugly hackery? Maybe, key table should be 
> extended with extra column for INF3 value, and new quirk for this should be 
> implemented?
> 
> Thanks.
> 
> On pondělí 20. listopadu 2017 18:05:50 CET Pali Rohár wrote:
> > Hi!
> > 
> > On Monday 20 November 2017 16:08:41 Oleksandr Natalenko wrote:
> > > Hi.
> > > 
> > > I've got Dell Vostro 3360 with extra multimedia keys as shown here [1],
> > > but
> > > have no luck to get them working.
> > > 
> > > I've modified dell_wmi_smbios_list structure in drivers/platform/x86/dell-
> > > wmi.c adding new entry:
> > > 
> > > ===
> > > 
> > >  84     {
> > >  85         .callback = dmi_matched,
> > >  86         .ident = "Dell Vostro 3360",
> > >  87         .matches = {
> > >  88             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > >  89             DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3360"),
> > >  90         },
> > >  91     },
> > > 
> > > ===
> > 
> > What would happen if you do *not* add this new entry? Please do this
> > test after your notebook was fully turned off to prevent some cached
> > configuration in BIOS.
> > 
> > > While pressing keys "1" and/or "2" I get the following notice in dmesg:
> > > 
> > > ===
> > > Nov 20 15:53:35 spock kernel: dell_wmi: Unknown key with type 0x0000 and
> > > code 0xe0f0 pressed
> > > ===
> > 
> > This means that in dell-wmi.c is missing mapping for code 0xe0f0 in key
> > type 0x0000.
> > 
> > Find array dell_wmi_keymap_type_0000[] and add there line:
> > 
> >   { KE_KEY, 0xe0f0, { KEY_something } },
> > 
> > (where something is correct name of key)
> > 
> > > (it is the same for both keys)
> > 
> > So for both first and second key you got same type+code? That is bad :-(
> > In this case with above definition we cannot distinguish which was was
> > pressed. But at least something.
> > 
> > > While pressing key "3" I get the following:
> > > 
> > > ===
> > > Nov 20 15:36:51 spock kernel: atkbd serio0: Unknown key pressed
> > > (translated
> > > set 2, code 0x60 on isa0060/serio0).
> > > Nov 20 15:36:51 spock kernel: atkbd serio0: Use 'setkeycodes 60 <keycode>'
> > > to make it known.
> > > ===
> > 
> > This key is not received by dell-wmi.c, but rather via PS/2 keyboard.
> > Use appropriate setkeycodes command line program to map that code 60 to
> > some key.
> > 
> > Today in most cases this mapping for PS/2 keyboards is done in udev or
> > systemd at system startup. They have database for it.
> > 
> > > Here is what I've found in DSDT:
> > > 
> > > ===
> > > 
> > >                     Method (_Q70, 0, NotSerialized)  // _Qxx: EC Query
> > >                     {
> > >                     
> > >                         P8XH (Zero, 0x70)
> > >                         Notify (MBT1, 0x80) // Status Change
> > >                         ^^^^AMW0.INF0 = 0x04
> > >                         ^^^^AMW0.INF1 = Zero
> > >                         ^^^^AMW0.INF2 = 0xE0F0
> > >                         ^^^^AMW0.INF3 = One
> > >                         Notify (AMW0, 0xD0) // Hardware-Specific
> > >                     
> > >                     }
> > >                     
> > >                     Method (_QAF, 0, NotSerialized)  // _Qxx: EC Query
> > >                     {
> > >                     
> > >                         P8XH (Zero, 0xAF)
> > >                         Notify (MBT, 0x80) // Status Change
> > >                         ^^^^AMW0.INF0 = 0x04
> > >                         ^^^^AMW0.INF1 = Zero
> > >                         ^^^^AMW0.INF2 = 0xE0F0
> > >                         ^^^^AMW0.INF3 = 0x02
> > >                         Notify (AMW0, 0xD0) // Hardware-Specific
> > >                     
> > >                     }
> > > 
> > > ===
> > > 
> > > These are the only 2 records that contain 0xe0f0 sequence, and if they
> > > correspond to first two multimedia keys, as you can see they differ only
> > > in
> > > .INF3 field. Unfortunately, I do not know what it might mean.
> > 
> > Just guessing... if I concatenate INF0, INF1, INF2, INF3 and treat every
> > INF* as 16bit number I got this sequence:
> > 
> >   0x0004 0x0000 0xE0F0 0x0001
> > 
> >   0x0004 0x0000 0xE0F0 0x0002
> > 
> > And it looks like a valid buffer for dell_wmi_notify() function.
> > 
> > Look at this part of that function:
> > 
> > 		switch (buffer_entry[1]) {
> > 		case 0x0000: /* One key pressed or event occurred */
> > 			if (len > 2)
> > 				dell_wmi_process_key(wdev, 0x0000,
> > 						     buffer_entry[2]);
> > 			/* Other entries could contain additional information */
> > 
> > If I'm right that above INF* sequence is put into dell_wmi_notify()
> > function, then in buffer[3] you should be able to see either 0x01 or
> > 0x02. And distinguish which key was pressed.
> > 
> > Can you test it? Beware of "len" of buffer_entry when you would do
> > tests.
> > 
> > > I was monitoring /proc/interrupts file and noticed that values here:
> > > 
> > > ===
> > > 
> > >   9:        430        293         65         24   IO-APIC   9-fasteoi  
> > >   acpi
> > > 
> > > ===
> > > 
> > > are incremented by one on each key press. Also, if i press key "3" (the
> > > one
> > > that generates different message in kernel log), the following interrupt
> > > is
> > > fired too:
> > > 
> > > ===
> > > 
> > >   1:        646       6391        358        487   IO-APIC   1-edge     
> > >   i8042> 
> > > ===
> > > 
> > > Running evtest, I'm able to catch some output while pressing key "3":
> > > 
> > > ===
> > > Event: time 1511189973.016907, type 4 (EV_MSC), code 4 (MSC_SCAN), value
> > > e025 Event: time 1511189973.016907, type 1 (EV_KEY), code 203
> > > (KEY_PROG4), value 1 Event: time 1511189973.016907, --------------
> > > SYN_REPORT ------------ Event: time 1511189973.016942, type 1 (EV_KEY),
> > > code 203 (KEY_PROG4), value 0 Event: time 1511189973.016942,
> > > -------------- SYN_REPORT ------------ ===
> > 
> > So it means that third key is also received by dell-wmi? Anyway see
> > function dell_wmi_process_key() and line:
> > 
> > 	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
> > 		return;
> > 
> > It is there just to ensure that key is not send via both PS/2 keyboard
> > and dell-wmi.
> > 
> > So I guess you should disable wmi_requires_smbios_request.
> > 
> > > I think this corresponds to what I see in drivers/platform/x86/dell-wmi.c
> > > file here:
> > > 
> > > ===
> > > 143     /* Dell Instant Launch key */
> > > 144     { KE_KEY,    0xe025, { KEY_PROG4 } },
> > > ===
> > > 
> > > Other two keys do not produce any evtest output.
> > > 
> > > Here is acpidump output: [2]
> > > Here is decompiled DSDT: [3]
> > > 
> > > Also, I've raised this question before a couple of times (for instance,
> > > [4]), but unfortunately got no result :(.
> > > 
> > > Could you please help me in fixing multimedia keys?
> > 
> > I Hope that this email helps you.
> > 
> > > Thanks.
> > > 
> > > [1] http://beta.hstor.org/files/c3b/a26/628/
> > > c3ba26628409486f8b9ae16d97be7d21.jpg
> > > [2] https://gist.github.com/7c04035ba2a3f0e5501af83efdb1456d
> > > [3] https://gist.github.com/83687126c46417b5bc0b48529de52460
> > > [4] https://www.spinics.net/lists/platform-driver-x86/msg05251.html
> 

-- 
Pali Rohár
pali.rohar@gmail.com
