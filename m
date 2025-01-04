Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394FA208CA;
	Sat,  4 Jan 2025 06:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735972095; cv=none; b=pJydhviy/BEJj0+fBRRrpUtaiK2hYcREWRjfGs25gcOrxcqCPfl4GII6vN5NhpZ+vQ9v9jzVSkt0JBHjoYcafRl7xOq6zaCBbC0K4+3APvc/rhbuuqVPJ+ZpHN+/TkRWG/fQFSLCcDhHDoDQ8m2RtUH2i1nP0YyaUcr41QCFZWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735972095; c=relaxed/simple;
	bh=GoPBKlYsesl8KI4WV+L0T9wD6XWJIaSXaDvlrNF2oSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nR9nGw9xlu4IxZS2s8dqYCkPHGrWLnr5s5BA9SqOj8GAszhheioIgLWCFLe+vOe/dvT0l4swtsjWDZB7OKGDthHMwIcojK4dFkWaWmF3UgXvhhg99jKKJFO2xJnRDowsBMZhqe6ovNhr6O97hM6J7oN54fxilaTvi8AZNi2TOj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mARYfUnr; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mARYfUnr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735972076; x=1736576876; i=w_armin@gmx.de;
	bh=7uZ8PJO7d/CP0cp6grQHsgaH3myUK7aE38e/xPN9W4c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mARYfUnrLF58LnpK7/b8qkggKV5YbcdLLW18BMiWVsm8m1ZLjUk6zqdqKWXwuxUW
	 QjMGZ1Sw5R2L5lga5RvFVGThX98hH5ya+/6VWa8JRBPVrxDFPVgpWSyDntWuiBBEP
	 r8t4CE6tIQ2rjc4lnrlwu+UvkIo8HIA2s0TBkEJqu+Tj3Wm6R5yDIWvptuAxlZ9ZL
	 +rYkGStrb2/jS39G5/U2sQAK5y2i5nmWSN6IrBIcynf1noJSpY3w/XvewkliCbngg
	 kf4GuzHqpWAq57UhxBIiljZOdeVsubnWvO+Lz8WNUJyd+G8DJENQE5imsx4lL2Igf
	 TPR47bDtSrSvgHLj2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6DWi-1tNLvw2BKa-006PJC; Sat, 04
 Jan 2025 07:27:56 +0100
Message-ID: <a8011f0f-1d44-42ec-9089-2da31f3852e2@gmx.de>
Date: Sat, 4 Jan 2025 07:27:54 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 platform-driver-x86@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241226153031.49457-1-josh@joshuagrisham.com>
 <0fbe58a9-ecca-437f-aa30-9d3a17c2bd43@gmx.de>
 <CAMF+KeYdshNex2h4kLJari=kXVxgcOZw7GDutJrV6vKC0PTe6A@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAMF+KeYdshNex2h4kLJari=kXVxgcOZw7GDutJrV6vKC0PTe6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Zl8AInhteNRbvE0NAo3iBZzjb9hcDfJ/9BkVQ3L57UeUdhos0zq
 8LyCIH2ydgAc1wiCkae803VDUA+KspQYZ5FUqs9CQV1/qki29SX2RTZgD3W4zOWb4uq+hV3
 y3olfzL7KPblpC7/kM42Rnrp2HAJYMO9GOCQEAg/CbnyQ5gWYd9DjlA5yWqmOMKx/pSBY09
 lgLBh8IdUcgX6UUfg/+3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oX1yDwgc1hQ=;Vre2WnPz1fUcDlGIYZBXviKeyfg
 vAX57MBofSsOfB+M3aRpn8EvCJyJfyqx46h23A0JQDdV+b7KOJaykPH96SrbDSOxRQv/9NEPA
 4CqICfrLqLoDSBsExLE8E5qg5JjGj0x2Rd7og905QMYdS7+sTQT1aYiJJwbfVJ5IITSYJQHzJ
 9u08KM1E6lWdOyjXnXw5pNwbdsX4mEINbp+zIiz5qCEAFOPt4ecINYPKsvinKKYtjKC84P6qD
 Sx6Xud6HvCDp2/cNDbOpnZ4R1epApcQVWt+iqQkT1aMvFYSoFV696qT4fMA6urE/lQyd5xsLl
 LzqVnpy2+C+vpzyPGShETKNNh8QHhH9HsrHZedwYKyfX3ZDnfdD3G/Xy5r0T0AAS3MGrwfijL
 0qMF2enJk4jGFdeWzgTIfu7O+pt3lrxt0Vh408gRW01yXluqD53VdI4nkmxrlj8jM3L7ts8xU
 tCQJmySTMfVNi/zu764AX7gLgGlzeNpOzcKHP8hfE015qx7bFMO9fpWYtMCX4wzlR+7mkBbru
 /jnJUCjZeC1hZtqUKBvo/v8psEGcWS3lgAVMwYSnuZyeGr+UES4PbISb0cO15kT5dD1NIy+E+
 Kz4WOODiMlwCGMcric0uKCmcATnkaUdhDgpedtJSDks+kph85xXjE3b6+tPw3bLhBGLNmB0gw
 cOkTC6xCOd8fqRLMCk8P4Awu365ajvbJdl7Dz1O0K3G7G48l3/KPaRc8FghlmutyKNSufFQVz
 soohMAQULMkgYlIzCu+px6JQ75/VCCaC199V7edToWaUmTIbXIBKppMeXrkZgAdwtpxY5IOpk
 sc4liS64aeA36gMUp9EpU6NbV17gdePxX6OZK1d1m4EL0pTk0M2b+9tNcsTpoYMRdFgESS38d
 fi4sefIMSgIK4C6VMwbqsPFKd+VaELKNmTXZBfO3+phEBxT4nQW0Ilq9NvWSgKih4fyDqyAjo
 S7B9dJLDnG3c668BGyBj1HDW8ODbxyufUWL/QlDYop28/R44j3HADJJZDUTgb/WqywNheMDkj
 T450QbrFIMHX5tT1Tk4HbJFZW3QgnWscSIzZ2szQV3P0ZVb5yZQ7IKsRhYBThRfGIedy/y13k
 poGH19F7zf78cWdbo1hQf2VGhC6ryGmB+gIoZuCcrqKdvNMbBK2BSlL90y4JWr4TFfHlzFMT8
 =

Am 04.01.25 um 02:07 schrieb Joshua Grisham:

> Thanks again Armin for all of the very detailed comments -- they are
> always super helpful!! A few things I think are pretty obvious and I
> agree with, as well as where I missed as copy/paste when moving around
> stuff that you caught (great!), so I will not bother to respond to
> those here and will instead just fix them. :) For other things where I
> have some questions, I will respond inline below.
>
> Den tors 2 jan. 2025 kl 20:14 skrev Armin Wolf <W_Armin@gmx.de>:
>>> +What:                /sys/class/firmware-attributes/*/attributes/usb_charging
>>> +Date:                December 2024
>>> +KernelVersion:       6.13
>>> +Contact:     Joshua Grisham <josh@joshuagrisham.com>
>>> +Description:
>>> +             This attribute can be used to control if USB ports can continue to deliver power to
>>> +             connected devices when the device is powered off or in a low sleep state. The value
>>> +             is a boolean represented by 0 for false and 1 for true.
>> Hi,
>>
>> please move the documentation of the firmware attributes to samsung-galaxybook.rst to avoid cluttering
>> the subsystem docs with too much driver-specific entries.
>>
> I guess I am a bit confused by the intention and usage
> firmware-attributes in general (including what should be in this
> documentation vs not) -- is the idea that these should be "relatively
> generic" attributes that control settings in the firmware that can
> persist across reboots and or steer the firmware/hardware in various
> ways (e.g. with admin password and/or pending reboot status etc) ? And
> if they are "relatively generic" (e.g. could be reused by more than
> one platform driver) then would the documentation belong here in a
> centralized place? Otherwise, if they are device-specific, why would
> they not be device attributes (e.g. via dev_groups for example),
> instead of firmware-attributes?

The reason for the firmware-attribute class original was that driver could export BIOS settings
to userspace applications, together with some metadata (min/max values, etc).

Because of this the exact meaning of each firmware attribute is usually only known to the user
changing those firmware attributes.

Your driver is a bit special in that it knows the meaning of each firmware attribute. However
you still have to follow the firmware-attribute class ABI since userspace applications do not
know this.

>
>>> +static void galaxybook_fw_attr_class_remove(void *data)
>>> +{
>>> +     device_destroy(fw_attr_class, MKDEV(0, 0));
>> Please use device_unregister() instead since multiple devices might share the same devt of MKDEV(0, 0).
>> This would also allow you to remove the global variable "fw_attr_class".
>>
> Here I am a bit confused on exactly how this would/should look; all
> existing usages of fw_attr_class I can see use exactly this same
> pattern: device_create() and then device_destroy() with MKDEV(0, 0).
> Taking a look at the latest proposed changes from Thomas and it stil
> seems the intention is the same, just that it is slightly simplified
> and use pointer to the firmware_attributes_class directly instead of
> fetching it using fw_attributes_class_get(). Or is there a better way
> to do this (including usage of device_unregister() and/or something
> different with the devt) that will help solve some other problem(s)?

This is the code of device_destroy():

void device_destroy(const struct class *class, dev_t devt)
{
	struct device *dev;

	dev = class_find_device_by_devt(class, devt);
	if (dev) {
		put_device(dev);
		device_unregister(dev);
	}
}

if multiple devices of a given class are using the same devt (like MKDEV(0, 0)) then
class_find_device_by_devt() might pick the wrong device.

The fact that the other drivers are using this function is actually an error. The only
reason why this error was not noticed until now seems to be that currently only a single
driver using the firmware-attribute class is typically active at the same time.

>
>>> +     sysfs_attr_init(&galaxybook->camera_lens_cover_attr);
>>> +     galaxybook->camera_lens_cover_attr.attr.name = "camera_lens_cover";
>>> +     galaxybook->camera_lens_cover_attr.attr.mode = 0644;
>>> +     galaxybook->camera_lens_cover_attr.show = camera_lens_cover_show;
>>> +     galaxybook->camera_lens_cover_attr.store = camera_lens_cover_store;
>>> +     err = sysfs_create_file(&galaxybook->fw_attrs_kset->kobj,
>>> +                             &galaxybook->camera_lens_cover_attr.attr);
>>> +     if (err)
>>> +             return err;
>>> +     return devm_add_action_or_reset(&galaxybook->platform->dev,
>>> +                                     galaxybook_camera_lens_cover_attr_remove, galaxybook);
>> That is not how the firmware attribute interface is supposed to work. For each firmware attribute you need to
>> create an attribute group (with a unique name of course) with the following attributes:
>>
>> - type: should return "enumeration"
>> - current_value: should return the current value of the firmware attribute
>> - default_value: should return the default value of the firmware attribute
>> - display_name: should contain a user friendly description of the firmware attribute
>> - display_name_language_code: should return "en"
>> - possible_values: should return "0;1" since this firmware attributes are boolean values
>>
>> You can theoretically use sysfs_create_groups() to add all groups in one go to simplify error handling. Since each
>> attribute_group specifies a .is_visible callback you can handle the visibility of each group there.
>>
>> Those groups then need to be added to the fw_attrs_kset.
>>
> I guess as a follow-on to my earlier question regarding
> firmware-attributes; here I was assuming that as these are very simple
> "on vs off" attributes, I used the attribute "pending_reboot" as a
> pattern for what I implemented here as my "best guess" on what to do
> :) As there are not very many examples to look at then it was a bit of
> a "best guess" on my part; apologies if I completely missed the boat!
> I can of course add these entire groups but IMHO it does seem like
> quite a bit of overkill to have all of these various attributes for
> on/off or enabled/disabled kind of boolean switches -- my guess is
> that if it is somehow "known" that an attribute is a boolean, then it
> is relatively self-explanatory and the need for current / default /
> possible_values etc attributes within this enumeration type group
> should not be needed?  (this is why I followed "pending_reboot" as a
> pattern when I did this, but as said I can change this to whatever is
> deemed appropriate).

Keep in mind that userspace applications usually do not know the meaning of such a firmware attribute.
This is why you need to supply type, current_value, etc, so that those userspace applications know enough
about the firmware attribute to show a nice settings GUI to the user (which will then use display_name to
understand the meaning of the firmware attribute).

> Also there are several other platform drivers that implement a very
> similar device attribute as ones that I have added here as a firmware
> attribute (namely I am thinking of "USB Charging" which exists in
> several other pdx86 drivers but a few other devices should/would
> probably support this kind of "Power on Lid Open" attribute as well);
> in the event that maintainers of those drivers should and eventually
> do migrate over to use the same or similar firmware attribute for this
> same kind of setting, should it include all of these attributes in the
> standard "enumeration" type attribute group or is it possible / would
> it make sense to have some sort of boolean-based fw attr type that is
> a bit more simple and a bit more self-explanatory?

Introducing a new "boolean" type would indeed be nice. This would allow userspace application to use a simple
on/off slider instead of a dropdown menu when displaying such firmware attributes.

In this case you could drop the "possible_values" attribute.

What is the opinion of the pdx86 maintainers on this proposal?

>> Just a small question: is the value of the camera lens cover persistent across reboots?
>>
> No (and I tested again to confirm), this "block recording" ACPI
> setting does not persist over reboots. Should this one be a device
> attribute (e.g. via dev_groups) instead of a firmware attribute in
> that case?

Good question, i will defer to the pdx86 maintainers for answering that question.

>>> +     /*
>>> +      * Value returned in iob0 will have the number of supported performance modes.
>>> +      * The performance mode values will then be given as a list after this (iob1-iobX).
>>> +      * Loop backwards from last value to first value (to handle fallback cases which come with
>>> +      * smaller values) and map each supported value to its correct platform_profile_option.
>>> +      */
>>> +     for (i = buf.iob0; i > 0; i--) {
>>> +             /*
>>> +              * Prefer mapping to at least performance, balanced, and low-power profiles, as they
>>> +              * are the profiles which are typically supported by userspace tools
>>> +              * (power-profiles-daemon, etc).
>>> +              * - performance = "ultra", otherwise "performance"
>>> +              * - balanced    = "optimized", otherwise "performance" when "ultra" is supported
>>> +              * - low-power   = "silent", otherwise "quiet"
>>> +              * Different models support different modes. Additional supported modes will be
>>> +              * mapped to profiles that fall in between these 3.
>>> +              */
>> To be honest i would prefer if you remove this overly complicated mapping algorithm. I rather suggest that the
>> userspace utilities in question are updated to handle such situations themself (other drivers would also benefit
>> from this).
>>
>> I think the following static mappings would make sense:
>>
>> PERFORMANCE_MODE_ULTRA -> performance
>> PERFORMANCE_MODE_PERFORMANCE -> balanced-performance
>> PERFORMANCE_MODE_OPTIMIZED -> balanced
>> PERFORMANCE_MODE_QUIET -> quiet
>> PERFORMANCE_MODE_SILENT -> low-power
>>
>> The legacy performance modes should not override other performance modes, i. e. PERFORMANCE_MODE_PERFORMANCE_LEGACY
>> should not override PERFORMANCE_MODE_PERFORMANCE. However non-legacy performance modes should override legacy
>> performance modes.
>>
>> If you can be sure that legacy performance modes are not mixed with non-legacy performance modes then you can omit
>> the override mechanism.
>>
> This whole thing was a bit "tricky" and the reason why I built the
> logic in the way I did is that there are so many variations in these
> devices which have different modes enabled depending on the hardware
> and what generation (keep in mind that there are around 20-30
> different models as of this writing that work with this driver and
> many of them have slight variations on what hardware exists and/or
> which modes are supported for various features including this
> "performance mode"!).
>
> For background, here is the original GitHub issue where I worked with
> my community to initially go from hard-coded modes to dynamic based on
> response from the ACPI method which gives the list of "supported
> modes": https://github.com/joshuagrisham/samsung-galaxybook-extras/issues/31
>
> Basically, some devices only have 2 "actively used" performance modes,
> some have 3, and some have 4. Some devices only have the "legacy"
> modes, but newer devices report (according to the ACPI method +
> payload that responds with "supported modes" on said device) to
> support BOTH the "legacy" and the "newer" modes, but in Windows they
> are only using the new modes, while "legacy" modes are ignored by the
> Samsung-developed apps and services in Windows.
>
> The response from the "supported performance modes" method gives the
> total number of supported "modes" followed by a list of each of them,
> and will look something like this (using enum names here to hopefully
> help make more sense, but leaving out my prefix "PERFORMANCE_MODE_"
> for brevity...):
>
> On my "Pro" Galaxy Book, it looks like this:
>
> 6 (# of supported modes), OPTIMIZED_LEGACY, PERFORMANCE_LEGACY,
> OPTIMIZED, QUIET, SILENT, PERFORMANCE
>
> Because I have seen that upower + GNOME integration does not even
> really work unless you have all three of low-power + balanced +
> performance available, then my goal was to map the above modes to
> these profiles:
>
> PERFORMANCE -> performance
> OPTIMIZED -> balanced
> QUIET -> quiet
> SILENT -> low-power
>
> (and, just as in Windows, ignore the "legacy" modes as I have a valid
> non-legacy mode to cover each different one)
>
> On the "Ultra" line of Galaxy Books, it looks like this:
>
> 6, OPTIMIZED_LEGACY, PERFORMANCE_LEGACY, OPTIMIZED, QUIET, PERFORMANCE, ULTRA
>
> (so no SILENT, but add an ULTRA...)
>
> In this case, in order to ensure to map at least low-power + balanced
> + performance and fit the rest in between, I would want:
>
> ULTRA -> performance
> PERFORMANCE -> balanced-performance
> OPTIMIZED -> balanced
> QUIET -> low-power
>
> Both of these examples match exactly how these devices also work in
> Windows with Samsung's own developed applications and services.
> Namely, that when the newer modes exist, they use them instead of the
> "legacy" modes even though the ACPI method includes all of them as
> "supported." I think it would be good to maintain this behavior, as
> these are the values which Samsung is supporting already in Windows
> and the others are potentially untested and I would worry about
> potential issues including overheating or otherwise harming the device
> in some way.
>
> In cases where only the "legacy" modes exist, then those are the modes
> that are used in Windows (e.g. for some devices with SAM0427) and the
> ACPI method does not respond with anything except the legacy mode
> values. Some of the SAM0427 devices I have seen can look like this,
> for example:
>
> 5, OPTIMIZED_LEGACY, PERFORMANCE_LEGACY, QUIET, SILENT, PERFORMANCE
>
> In this case, we want to map like this:
>
> PERFORMANCE -> performance
> OPTIMIZED_LEGACY -> balanced
> QUIET -> quiet
> SILENT -> low-power
>
> (using OPTIMIZED_LEGACY for balanced, as OPTIMIZED does not exist on
> this device, but there is a non-legacy mode for all of the others that
> should be used)
>
> So, with all of that background in mind, my idea and what I
> implemented was to basically take the list provided in response from
> the ACPI method, start from the end, looping backwards, and try to map
> them one-at-a-time, all the while checking if the desired profile for
> the given performance mode was already mapped or not, and if so,
> either "fitting it in" to another profile or just ignoring it.
>
> I am quite certain that the code can be cleaned up and/or refactored a
> bit, but I would hope that the result of the logic should stay the
> same (per what I described above); having said all of that, does it
> still make sense to try and simplify this somehow and/or any tips or
> recommendation how to achieve the desired result in a better way?

I am OK with you preferring the non-legacy modes over the legacy ones. However trying to limit yourself
to the profiles currently supported by gnome (AFAIK uses platform-profiles-daemon) is not a good idea.

I would like to see a more static mapping be implemented:

PERFORMANCE_MODE_ULTRA -> performance
PERFORMANCE_MODE_PERFORMANCE -> balanced-performance (can also be legacy if non-legacy is not available)
PERFORMANCE_MODE_OPTIMIZED -> balanced (can also be legacy is non-legacy is not available)
PERFORMANCE_MODE_QUIET -> quiet
PERFORMANCE_MODE_SILENT -> low-power

In this case the platform-profiles-daemon would have a similar job as the Samsung service, which is to
determine a suitable mapping for the supported modes to {performance, balanced, powersave}.

Looking at the code of the daemon it seems something similar is already being done, but only for the profiles
"quiet" and "low-power" (one of which is getting mapped to the "powersave" mode).

I am confident that the daemon could be extended be a bit more intelligent when it comes to determine the
mapping of the other modes.

>>> +     if (galaxybook->kbd_backlight.brightness < galaxybook->kbd_backlight.max_brightness)
>> Please use led_get_brightness() here.
>>
> When I looked at this originally I thought it would make sense to do
> this, but then found that this function is not part of leds.h in the
> kernel headers but instead you would have to include both
> <linux/leds.h> and also  "../../leds/leds.h" as a file header from the
> tree. Also, apart from led-core, there is only one LED driver that
> uses the function currently .. does this seem reasonable to include
> this extra file-based header or would it make more sense to just read
> the value of the member directly as all of the other drivers that need
> to do this work currently?
>
> (FWIW I did test to include this header file and it works fine to use
> the function instead, it just feels a bit "off"...)

Oops, my bad. In this case you can keep using the .brightness member of the LED device.

Thanks,
Armin Wolf

>
>>> +static void galaxybook_remove(struct platform_device *pdev)
>>> +{
>>> +     if (galaxybook_ptr)
>>> +             galaxybook_ptr = NULL;
>> As already being said, this will cause issues with the i8042 filter. I suggest you move the whole galaxybook_ptr
>> handling inside galaxybook_i8042_filter_install()/_remove().
>>
> Yes I think this makes sense as well and is what I will do in the next
> version in case your patch to pass a context pointer to i8042 filter
> does not go before then :)
>
>> All things considered the driver looks quite good, hoping for a v5 revision in the future :).
>>
>> Thanks,
>> Armin Wolf
>>
> Yes it has taken me a few days to get back and dig into this again due
> to the holidays, but am looking through it all again and will
> hopefully have a new version soon-ish to try and resolve more of the
> open issues. Thank you again for all of your help!!
>
> Best,
> Joshua
>
