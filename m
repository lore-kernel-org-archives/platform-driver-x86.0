From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v8 4/8] firmware: Add new platform fallback mechanism and
 firmware_request_platform()
Date: Tue, 19 Nov 2019 19:36:09 +0000
Message-ID: <20191119193609.GT11244@42.do-not-panic.com>
References: <20191115153529.215244-1-hdegoede@redhat.com>
 <20191115153529.215244-5-hdegoede@redhat.com>
 <20191118213542.GI11244@42.do-not-panic.com>
 <c559a739-6be3-ae3e-e641-4ae82ffe71f6@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c559a739-6be3-ae3e-e641-4ae82ffe71f6@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 19, 2019 at 03:03:48PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 18-11-2019 22:35, Luis Chamberlain wrote:
> > On Fri, Nov 15, 2019 at 04:35:25PM +0100, Hans de Goede wrote:
> > > In some cases the platform's main firmware (e.g. the UEFI fw) may contain
> > > an embedded copy of device firmware which needs to be (re)loaded into the
> > > peripheral. Normally such firmware would be part of linux-firmware, but in
> > > some cases this is not feasible, for 2 reasons:
> > > 
> > > 1) The firmware is customized for a specific use-case of the chipset / use
> > > with a specific hardware model, so we cannot have a single firmware file
> > > for the chipset. E.g. touchscreen controller firmwares are compiled
> > > specifically for the hardware model they are used with, as they are
> > > calibrated for a specific model digitizer.
> > > 
> > > 2) Despite repeated attempts we have failed to get permission to
> > > redistribute the firmware. This is especially a problem with customized
> > > firmwares, these get created by the chip vendor for a specific ODM and the
> > > copyright may partially belong with the ODM, so the chip vendor cannot
> > > give a blanket permission to distribute these.
> > > 
> > > This commit adds a new platform fallback mechanism to the firmware loader
> > > which will try to lookup a device fw copy embedded in the platform's main
> > > firmware if direct filesystem lookup fails.
> > > 
> > > Drivers which need such embedded fw copies can enable this fallback
> > > mechanism by using the new firmware_request_platform() function.
> > > 
> > > Note that for now this is only supported on EFI platforms and even on
> > > these platforms firmware_fallback_platform() only works if
> > > CONFIG_EFI_EMBEDDED_FIRMWARE is enabled (this gets selected by drivers
> > > which need this), in all other cases firmware_fallback_platform() simply
> > > always returns -ENOENT.
> > > 
> > > Reported-by: Dave Olsthoorn <dave@bewaar.me>
> > > Suggested-by: Peter Jones <pjones@redhat.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > This looks good to me now thanks!
> > 
> > Acked-by: Luis Chamberlain <mcgrof@kernel.org>
> > 
> > Just one more thing: testing. Since this requires EFI memeory, I guess
> > we can't mimic a fake firmware somehow to use to test the API on any x86
> > system? If not we'd have no test coverage through the selftests for this
> > new call at all, and so could not easily detect regressions. We could
> > perhaps *fake* an entry if a DEBUG kconfig option is enabled, which
> > would stuff the EFI fw entry *once*. What do you think?
> 
> We could give the found_fw_list list_head from drivers/firmware/efi/embedded-firmware.c
> a name which is better suited for exporting it and then actually export it.
> That combined with moving the struct embedded_fw type declaration into
> linux/efi_embedded_fw.h, 

Sure.

> with a note saying that it is private and should only
> be used for the selftests.

No need, we now have symbol namespaces [0]. You can use that then.

[0] https://lwn.net/Articles/759928/

> Then a selftest can indeed simply add a fake fw entry to the list and then
> excercise the API and check that it gets the contents of its own fake
> entry back.

Great.

> Hmm, I see that the tests under tools/testing/selftests/firmware
> are doing everything through a special sysfs API,

That's incorrect.

tools/testing/selftests/firmware/fw_fallback.sh - tests sysfs fallback
tools/testing/selftests/firmware/fw_filesystem.sh - tests direct loading

The fw_fallback.sh should probably be renamed to something like
fw_fallback_sysfs.sh and you could have your own script for this
new API.

> in case of testing
> the userspace fallbacks this makes sense, but in this case I
> was thinking more along the lines of writing the test itself in a
> module (or add it to the lib/test_firmware.c) module rather then doing
> this complex dance.

What the scripts do is *configure* a test type in userspace and then
trigger the test. It should pretty trivial to add an entry to enable
your API to be used. The benefit of this is that we can then tweak
*how* we test the API in userspace, and kick a trigger.

Doing a new module could be done but we'd have to answer why we can't
implement the test with the test knob interface currently used.

> I guess this test could just be another store method for a new sysfs
> attribute, which does not interact with any of the state/config, like the
> trigger_request test.

Right, the syfs for for that test driver is just to *configure* the
test in userspace, nothing to do with the firmware API. The firmware
API is then *used* once the trigger is used.

> I can try to write a follow up series which does this this weekend.

That would be fantastic, thanks!

  Luis
