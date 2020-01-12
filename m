From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v11 04/10] firmware: Add new platform fallback mechanism
 and firmware_request_platform()
Date: Sun, 12 Jan 2020 14:54:04 -0800
Message-ID: <CALCETrXi_P1_nCp27yawLeUKuR=Wo11rKao222SVsnhi6qF9fA@mail.gmail.com>
References: <20200111145703.533809-1-hdegoede@redhat.com> <20200111145703.533809-5-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20200111145703.533809-5-hdegoede@redhat.com>
Sender: linux-doc-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-efi <linux-efi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>"open list:HID CORE LAYER" <li>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jan 11, 2020 at 6:57 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> In some cases the platform's main firmware (e.g. the UEFI fw) may contain
> an embedded copy of device firmware which needs to be (re)loaded into the
> peripheral. Normally such firmware would be part of linux-firmware, but in
> some cases this is not feasible, for 2 reasons:
>
> 1) The firmware is customized for a specific use-case of the chipset / use
> with a specific hardware model, so we cannot have a single firmware file
> for the chipset. E.g. touchscreen controller firmwares are compiled
> specifically for the hardware model they are used with, as they are
> calibrated for a specific model digitizer.
>
> 2) Despite repeated attempts we have failed to get permission to
> redistribute the firmware. This is especially a problem with customized
> firmwares, these get created by the chip vendor for a specific ODM and the
> copyright may partially belong with the ODM, so the chip vendor cannot
> give a blanket permission to distribute these.
>
> This commit adds a new platform fallback mechanism to the firmware loader
> which will try to lookup a device fw copy embedded in the platform's main
> firmware if direct filesystem lookup fails.
>
> Drivers which need such embedded fw copies can enable this fallback
> mechanism by using the new firmware_request_platform() function.

After finally wrapping my head around how this all fits together:

Early in boot, you check a bunch of firmware descriptors, bundled with
drivers, to search EFI code and data for firmware before you free said
code and data.  You catalogue it by name.  Later on, you use this list
as a fallback, again catalogued by name.  I think it would be rather
nicer if you simply had a list in a single file containing all these
descriptors rather than commingling it with the driver's internal dmi
data.  This gets rid of all the ifdeffery and module issues.  It also
avoids any potential nastiness when you have a dmi entry that contains
driver_data that points into the driver when the driver is a module.

And you can mark the entire list __initdata.  And you can easily (now
or later on) invert the code flow so you map each EFI region exactly
once and then search for all the firmware in it.

--Andy
