From: Darren Hart <dvhart@infradead.org>
Subject: Re: Keyboard backlight not working on my NP900X5N laptop
Date: Wed, 2 Jan 2019 18:03:23 -0800
Message-ID: <20190103020323.GA21617@wrath>
References: <ffa49970-ce0a-614e-3c90-03eb4924fbef@nisi.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ffa49970-ce0a-614e-3c90-03eb4924fbef@nisi.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Vlietland <j.vlietland@nisi.nl>
Cc: Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, open list <linux-kernel@vger.kernel.org>, "open list:SAMSUNG LAPTOP DRIVER" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 31, 2018 at 08:40:43PM +0100, Jan Vlietland wrote:
> Hi all,
> 

Hey Jan,

> Greg K-H suggested to mail you guys.
> 
> I installed Linux 4.20.0-rc7 (downloaded, compiled and installed) on a Samsung NP900X5N laptop and have noticed 3 bugs. 2 of them I found in Bugzilla and replied on them (i915 and Nouveau issues). I am currently discussing them with an intel engineer.
> 
> On other bug I haven't found so therefore a mail directly to you guys as maintainers.
> 
> On my other machine, a Samsung NP900X4D (just bought it in the USA, 2017 model), the samsung-laptop.ko module is enabling the use of the keyboard backlight keys.
> 
> It is not working on my new machine NP900X5N. My samsung-laptop.ko driver isn't loading. If I try to load it manually it complains about 'no such device".
> 
> My Linux kernel is working in CSM mode. The module is still not loaded.
> 

That's correct.

> As it is weekend I did some more reading and debugging of the module. To my understanding the module checks the model and type of the laptop. The known models and types are stored in the struct:
> 
> static struct dmi_system_id __initdata samsung_dmi_table[]
> 
> I wondr if the NP900X5N notebook is included in this list.
> 
> With dmidecode -t chassis it shows:
> Getting SMBIOS data from sysfs.
> SMBIOS 3.0.0 present.
> 
> Handle 0x0003, DMI type 3, 22 bytes
> Chassis Information
>         Manufacturer: SAMSUNG ELECTRONICS CO., LTD.
>         Type: Notebook
>         Lock: Not Present
>         Version: N/A
>         Serial Number: 0F4C91CJ900346
>         Asset Tag: No Asset Tag
>         Boot-up State: Safe
>         Power Supply State: Safe
>         Thermal State: Other
>         Security Status: None
>         OEM Information: 0x00000000
>         Height: Unspecified
>         Number Of Power Cords: 1
>         Contained Elements: 0
>         SKU Number: Chassis
> 
> If I use the -u flag. The notebook value is 0x0A, not 0x10!!!
> 
> Could that be the reason for not loading?

Seems likely.

> 
> 		.matches = {
> 			DMI_MATCH(DMI_SYS_VENDOR,
> 					"SAMSUNG ELECTRONICS CO., LTD."),
> 			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
> 		},
> 
> Maybe another reason could that that either the i915 and Nouveau modules are
> not working well. I get black screens with the i915 and MMIO faults with the
> nouveau driver. That is another issue that I need to tackle.
> 

I would expect a different error than "no such device" in that case.
I think your first thought was correct.

As a simple test, I'd suggest replacing "10" with "0A" in the existing
DMI_CHASSIS_TYPE match, recompile, and see if it loads and works
correctly.  Would you be able to test this?

> Oh happy new year :-)


Happy New Year!

-- 
Darren Hart
VMware Open Source Technology Center
