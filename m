From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: acer-wmi auto-loaded on a Lenovo Thinkpad X1 Carbon 4th gen
Date: Mon, 08 Aug 2016 12:09:55 +0200
Message-ID: <87k2fr7erw.fsf@miraculix.mork.no>
References: <87vb07lx0s.fsf@miraculix.mork.no>
	<20160719045518.GA26365@linux-rxt1.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:53879 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751670AbcHHKMM convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 8 Aug 2016 06:12:12 -0400
In-Reply-To: <20160719045518.GA26365@linux-rxt1.site> (joeyli's message of
	"Tue, 19 Jul 2016 12:55:19 +0800")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org

joeyli <jlee@suse.com> writes:

> Hi Bjørn,
>
> On Thu, Jul 14, 2016 at 11:39:31PM +0200, Bjørn Mork wrote:
>> I recently got a new laptop.  And now I'm trying to figure out what all
>> the stuff they put into it actually is :)
>> .
>> One thing that doesn't seem quite right is that the acer-wmi driver is
>> loaded and claims that this laptop has an "Acer BMA150 accelerometer".
>> 
>> It is true that there is a device there matching
>> 
>>   #define AMW0_GUID1            "67C3371D-95A3-4C37-BB61-DD47B491DAAB"
>> 
>> as can be seen:
>> 
>>  bjorn@miraculix:~$ ls -l /sys/devices/virtual/wmi/67C3371D-95A3-4C37-BB61-DD47B491DAAB
>>  total 0
>>  -r--r--r-- 1 root root 4096 Jul 14 23:10 modalias
>>  drwxr-xr-x 2 root root    0 Jul 14 23:10 power
>>  lrwxrwxrwx 1 root root    0 Jul 14 23:10 subsystem -> ../../../../class/wmi
>>  -rw-r--r-- 1 root root 4096 Jul 14 23:10 uevent
>> 
>> 
>> But I sort of doubt there is an Acer specific device here.  Maybe this
>> is a generic accelerometer interface?  Or is there something else going
>> on?
>> 
>> The input device created by the driver just just returns -EPERM when I
>> try to open it, so I don't think this actually works as-is:
>> 
>>  root@miraculix:/tmp# cat /dev/input/event8
>>  cat: /dev/input/event8: Operation not permitted
>> 
>> 
>> And it does seem a little weird that a Thinkpad should need an Acer
>> specific platform driver anyway....  thinkpad_acpi is of course handling
>> all(?) the Thinkpad specifics as expected.
>> 
>> 
>> Bjørn
>
> Could you please check that what does the _HID of HKEY device in your DSDT?
>
> or please attached your acpidump data to me:
>  # acpidump > acpidump.raw

Sorry for the delay.  Just back from vacation.  I took a quick peek at
the driver and I don't think you need that dump. The DSDT is completely
irrelevant.  The driver will match and load on that generic WMI UUID,
and this code ensures that it successfully probes regardless of DSDT:


static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
						void *ctx, void **retval)
{
	*(acpi_handle *)retval = ah;
	return AE_OK;
}

static int __init acer_wmi_get_handle(const char *name, const char *prop,
					acpi_handle *ah)
{
	acpi_status status;
	acpi_handle handle;

	BUG_ON(!name || !ah);

	handle = NULL;
	status = acpi_get_devices(prop, acer_wmi_get_handle_cb,
					(void *)name, &handle);

	if (ACPI_SUCCESS(status)) {
		*ah = handle;
		return 0;
	} else {
		return -ENODEV;
	}
}


Since acer_wmi_get_handle_cb() doesn't actually test anything, this will
just return an arbitrary handle regardless of the value of *prop.


> Then I want to add HID to the norfkill_ids list in acer-wmi to avoid that
> it loaded on your Lenovo machine like LEN0068.

I see that this has been done before when this bug has been reported.
Sorry, but I believe that solution is plain wrong.  You are papering
over a more fundamental problem.

Solve the *real* problems in the driver instead:
1) "67C3371D-95A3-4C37-BB61-DD47B491DAAB"
>> 
>> as can be seen:
>> 
>>  bjorn@miraculix:~$ ls -l /sys/devices/virtual/wmi/67C3371D-95A3-4C37-BB61-DD47B491DAAB
>>  total 0
>>  -r--r--r-- 1 root root 4096 Jul 14 23:10 modalias
>>  drwxr-xr-x 2 root root    0 Jul 14 23:10 power
>>  lrwxrwxrwx 1 root root    0 Jul 14 23:10 subsystem -> ../../../../class/wmi
>>  -rw-r--r-- 1 root root 4096 Jul 14 23:10 uevent
>> 
>> 
>> But I sort of doubt there is an Acer specific device here.  Maybe this
>> is a generic accelerometer interface?  Or is there something else going
>> on?
>> 
>> The input device created by the driver just just returns -EPERM when I
>> try to open it, so I don't think this actually works as-is:
>> 
>>  root@miraculix:/tmp# cat /dev/input/event8
>>  cat: /dev/input/event8: Operation not permitted
>> 
>> 
>> And it does seem a little weird that a Thinkpad should need an Acer
>> specific platform driver anyway....  thinkpad_acpi is of course handling
>> all(?) the Thinkpad specifics as expected.
>> 
>> 
>> Bjørn
>
> Could you please check that what does the _HID of HKEY device in your DSDT?
>
> or please attached your acpidump data to me:
>  # acpidump > acpidump.raw

Sorry for the delay.  Just back from vacation.  I took a quick peek at
the driver and I don't think you need that dump. The DSDT is completely
irrelevant.  The driver will match and load on that generic WMI UUID,
and this code ensures that it successfully probes regardless of DSDT:


static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
						void *ctx, void **retval)
{
	*(acpi_handle *)retval = ah;
	return AE_OK;
}

static int __init acer_wmi_get_handle(const char *name, const char *prop,
					acpi_handle *ah)
{
	acpi_status status;
	acpi_handle handle;

	BUG_ON(!name || !ah);

	handle = NULL;
	status = acpi_get_devices(prop, acer_wmi_get_handle_cb,
					(void *)name, &handle);

	if (ACPI_SUCCESS(status)) {
		*ah = handle;
		return 0;
	} else {
		return -ENODEV;
	}
}


Since acer_wmi_get_handle_cb() doesn't actually test anything, this will
just return an arbitrary handle regardless of the value of *prop.


> Then I want to add HID to the norfkill_ids list in acer-wmi to avoid that
> it loaded on your Lenovo machine like LEN0068.

I see that this has been done before when this bug has been reported.
Sorry, but I believe that solution is plain wrong.  You are papering
over a more fundamental problem.

Solve the *real* problems in the driver instead:
1)  "67C3371D-95A3-4C37-BB61-DD47B491DAAB" is not an Acer specific GUID
 and should probably never have been used to match Acer specific
 devices.  The fact that it happens to work for some aribitrary laptop is
 not sufficient.

2) the "get_handle" code shown above is broken.  If it works for some
 specific DSDT, then that is just pure luck.

These things should be fixed ASAP, and backported to stable.  The driver
as it is will probably both load and probe successfully on a large
number of systems it has no business messing with.


> Then, thinkpad_acpi needs to support this _HID.

No.  Looking further at this, I don't think so. There is no indication
that there is any relation between that WMI ID and any of the hardware
functions supported by the acer-wmi driver.  So there is no reason to
believe that any of the matched Lenovo laptops have the same hardware
functions.



Bjørn
