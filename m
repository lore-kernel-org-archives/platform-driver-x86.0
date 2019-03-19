From: Renato Soma <renatoys08@gmail.com>
Subject: Re: [PATCH 0/1] platform/x86: dell-wmi: Uncomment events that were
Date: Mon, 18 Mar 2019 23:21:44 -0300
Message-ID: <20190319022144.GA14111@rys-Inspiron-5420>
References: <20190316010942.6448-1-renatoys08@gmail.com>
 <20190316091756.2zfccpnhfnjogktp@pali>
 <20190317183049.GA5989@rys-Inspiron-5420>
 <20190318120032.nynbshqudmlslxxz@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190318120032.nynbshqudmlslxxz@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>, mistave@countermail.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 18, 2019 at 01:00:32PM +0100, Pali Rohár wrote:
> > =====================================================================
> > 
> > ----------------------------------------
> > Left WMI key: Windows Mobility Center
> > Press:    'x'
> > Hold:     -
> > Release:  -
> > 
> > In my machine (Inspiron 5420), whenever I press this key, the key
> > outputs the character "x". I've seen nothing on dmesg even if I
> > keep this key pressed for longer amounts of time. I'm still trying
> > to understand why this is hapenning.
> 
> This is strange. Is not also some Alt/Meta/Ctrl or other modifier sent
> too? Because Meta+X could be some windows shortcut...
> 
> > 
> > ----------------------------------------
> > Middle WMI key: Dell Audio With Preset Switch
> > Press:    Key with type 0x0000 and code 0xe02a pressed
> > Hold:     -
> > Release:  Key with type 0x0000 and code 0xe02b pressed
> > 
> > Differently from what you saw on a Inspiron 7520, I could not
> > reproduce the behavior that you reported on the first link above.
> > In my case, when I press the key, the code 0xe02a is shown at dmesg
> > only once. Also, even though I keep it pressed for longer than ~30
> > seconds or so, I could not see the entry 0xe02c apper. More on that
> > behavior later on. When releasing the key, I can see the code 0xe02b
> > show up at dmesg.
> > 
> > ----------------------------------------
> > Right WMI key: Dell Instant Launch
> > Press:    -
> > Hold:     -
> > Release:  -
> > 
> > This key is with a really weird behavior on my machine.
> > When testing, I would normally press and relase so that the following
> > messages would pop-up:
> > 
> > [ 2830.499420] atkbd serio0: Unknown key pressed (translated set 2,
> > code 0x60 on isa0060/serio0).
> > [ 2830.499422] atkbd serio0: Use 'setkeycodes 60 <keycode>'
> > to make it known.
> 
> This means that you have not configured atkbd keycodes yet. Run
> setkeycodecs and assign some keycode for that scancode 60. After that
> kernel atkbd (PS/2 keyboard) starts sending events to userspace.

All right, I'll investigate and try these approaches, thanks!

> 
> There are two ways how Dell firmware can inform operating system that
> key was pressed. Notebook keyboard is connected to motherboard via
> classic PS/2 port (of PS/2 port is emulated for OS). So operating system
> sees PS/2 keyboard and key pressed are received by PS/2 atkbd driver.
> For some (unknown/strange?) reasons firmware send some keys not via PS/2
> keyboard port, but via ACPI interface, hence needs for dell_wmi driver
> which handle them.
> 
> So some keypress events come via PS/2, some via ACPI-WMI. Linux kernel
> then send all keypress events to userspace.
> 
> When debugging problems with hot keys, you always need to look at all
> possible sources...
> 
> 
> dell-wmi.c is a driver for receiving APCI-WMI events; atkbd.c is a PS/2
> keyboard driver.
> 
> In dell-wmi.c is a function dell_wmi_events_set_enabled which is needed
> to call on some Dell machines to start receiving those ACPI-WMI events.
> You can try to call it for your laptop, maybe it is needed too.
> Currently it is called only for two laptop models, see table
> dell_wmi_smbios_list.
> 
> > In the meantime, I'll try to find out why the first button is outputting
> > an "x" character on my machine.
> 
> Check that you caught all keypresses. X11 tools just print keys known to
> X server, not all which are supported by Linux kernel.
> 
> You can use e.g. input-events utility. And also check all input devices,
> as wrote some keys are send via PS/2 keyboard input device, some via
> ACPI-WMI input device.
> 

Ok, I was unaware of this, I'll keep this in mind when reasearching.

I think that now I'm going to take my time in order to process all that
you explained to me and study this issue a little more, then possibly
start a new thread regarding my findings.

Thanks for your attention and time,

Renato
