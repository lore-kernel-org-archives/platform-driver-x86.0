From: joeyli <jlee@suse.com>
Subject: Re: acer-wmi auto-loaded on a Lenovo Thinkpad X1 Carbon 4th gen
Date: Sun, 21 Aug 2016 09:15:18 +0800
Message-ID: <20160821011518.GA3740@linux-rxt1.site>
References: <87vb07lx0s.fsf@miraculix.mork.no>
 <20160719045518.GA26365@linux-rxt1.site>
 <87k2fr7erw.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:52876 "EHLO
        smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751222AbcHUBPd (ORCPT
        <rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
        Sat, 20 Aug 2016 21:15:33 -0400
Content-Disposition: inline
In-Reply-To: <87k2fr7erw.fsf@miraculix.mork.no>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: platform-driver-x86@vger.kernel.org

Hi Bjørn, 

Sorry for my delay because I stuck on other issues.

On Mon, Aug 08, 2016 at 12:09:55PM +0200, Bjørn Mork wrote:
> joeyli <jlee@suse.com> writes:
> 
[...snip]
> 
> Sorry for the delay.  Just back from vacation.  I took a quick peek at
> the driver and I don't think you need that dump. The DSDT is completely
> irrelevant.  The driver will match and load on that generic WMI UUID,
> and this code ensures that it successfully probes regardless of DSDT:
> 
> 
> static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
> 						void *ctx, void **retval)
> {
> 	*(acpi_handle *)retval = ah;
> 	return AE_OK;
> }
> 
> static int __init acer_wmi_get_handle(const char *name, const char *prop,
> 					acpi_handle *ah)
> {
> 	acpi_status status;
> 	acpi_handle handle;
> 
> 	BUG_ON(!name || !ah);
> 
> 	handle = NULL;
> 	status = acpi_get_devices(prop, acer_wmi_get_handle_cb,
> 					(void *)name, &handle);
> 
> 	if (ACPI_SUCCESS(status)) {
> 		*ah = handle;
> 		return 0;
> 	} else {
> 		return -ENODEV;
> 	}
> }
> 
> 
> Since acer_wmi_get_handle_cb() doesn't actually test anything, this will
> just return an arbitrary handle regardless of the value of *prop.
> 
>

OK! Understood!
 
> > Then I want to add HID to the norfkill_ids list in acer-wmi to avoid that
> > it loaded on your Lenovo machine like LEN0068.
> 
> I see that this has been done before when this bug has been reported.
> Sorry, but I believe that solution is plain wrong.  You are papering
> over a more fundamental problem.
> 
> Solve the *real* problems in the driver instead:
> 1) "67C3371D-95A3-4C37-BB61-DD47B491DAAB"
> >> 
> >> as can be seen:
> >> 
> >>  bjorn@miraculix:~$ ls -l /sys/devices/virtual/wmi/67C3371D-95A3-4C37-BB61-DD47B491DAAB
> >>  total 0
> >>  -r--r--r-- 1 root root 4096 Jul 14 23:10 modalias
> >>  drwxr-xr-x 2 root root    0 Jul 14 23:10 power
> >>  lrwxrwxrwx 1 root root    0 Jul 14 23:10 subsystem -> ../../../../class/wmi
> >>  -rw-r--r-- 1 root root 4096 Jul 14 23:10 uevent
> >> 
> >> 
> >> But I sort of doubt there is an Acer specific device here.  Maybe this
> >> is a generic accelerometer interface?  Or is there something else going
> >> on?
> >> 
> >> The input device created by the driver just just returns -EPERM when I
> >> try to open it, so I don't think this actually works as-is:
> >> 
> >>  root@miraculix:/tmp# cat /dev/input/event8
> >>  cat: /dev/input/event8: Operation not permitted
> >> 
> >> 
> >> And it does seem a little weird that a Thinkpad should need an Acer
> >> specific platform driver anyway....  thinkpad_acpi is of course handling
> >> all(?) the Thinkpad specifics as expected.
> >> 
> >> 
> >> Bjørn
> >
> > Could you please check that what does the _HID of HKEY device in your DSDT?
> >
> > or please attached your acpidump data to me:
> >  # acpidump > acpidump.raw
> 
> Sorry for the delay.  Just back from vacation.  I took a quick peek at
> the driver and I don't think you need that dump. The DSDT is completely
> irrelevant.  The driver will match and load on that generic WMI UUID,
> and this code ensures that it successfully probes regardless of DSDT:
> 
> 
> static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
> 						void *ctx, void **retval)
> {
> 	*(acpi_handle *)retval = ah;
> 	return AE_OK;
> }
> 
> static int __init acer_wmi_get_handle(const char *name, const char *prop,
> 					acpi_handle *ah)
> {
> 	acpi_status status;
> 	acpi_handle handle;
> 
> 	BUG_ON(!name || !ah);
> 
> 	handle = NULL;
> 	status = acpi_get_devices(prop, acer_wmi_get_handle_cb,
> 					(void *)name, &handle);
> 
> 	if (ACPI_SUCCESS(status)) {
> 		*ah = handle;
> 		return 0;
> 	} else {
> 		return -ENODEV;
> 	}
> }
> 
> 
> Since acer_wmi_get_handle_cb() doesn't actually test anything, this will
> just return an arbitrary handle regardless of the value of *prop.
> 
> 
> > Then I want to add HID to the norfkill_ids list in acer-wmi to avoid that
> > it loaded on your Lenovo machine like LEN0068.
> 
> I see that this has been done before when this bug has been reported.
> Sorry, but I believe that solution is plain wrong.  You are papering
> over a more fundamental problem.
> 
> Solve the *real* problems in the driver instead:
> 1)  "67C3371D-95A3-4C37-BB61-DD47B491DAAB" is not an Acer specific GUID
>  and should probably never have been used to match Acer specific
>  devices.  The fact that it happens to work for some aribitrary laptop is
>  not sufficient.
> 
> 2) the "get_handle" code shown above is broken.  If it works for some
>  specific DSDT, then that is just pure luck.
> 
> These things should be fixed ASAP, and backported to stable.  The driver
> as it is will probably both load and probe successfully on a large
> number of systems it has no business messing with.
> 
> 
> > Then, thinkpad_acpi needs to support this _HID.
> 
> No.  Looking further at this, I don't think so. There is no indication
> that there is any relation between that WMI ID and any of the hardware
> functions supported by the acer-wmi driver.  So there is no reason to
> believe that any of the matched Lenovo laptops have the same hardware
> functions.
> 
> 
> 
> Bjørn
>

I have a question about removed 67C3371D-95A3-4C37-BB61-DD47B491DAAB. It
already in acer-wmi a long time since Carlos contributed this driver in
2008. 

Does it possible cause regression on some laptops if we removed this GUID
support in acer-wmi? 


Thanks a lot!
Joey Lee
