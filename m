From: "Nathanael D. Noblet" <nathanael@gnat.ca>
Subject: Re: Acer-WMI disables touchpad and other issues
Date: Thu, 13 Sep 2012 09:27:43 -0600
Message-ID: <5051FB6F.508@gnat.ca>
References: <502BD214.6090700@gnat.ca>  <50516276.7010103@gnat.ca> <1347530718.705.23.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from idcmail-mo1so.shaw.ca ([24.71.223.10]:11741 "EHLO
	idcmail-mo1so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756891Ab2IMP1o (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Sep 2012 11:27:44 -0400
In-Reply-To: <1347530718.705.23.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: jlee@novell.com, platform-driver-x86@vger.kernel.org

So far I've added the options acer-wmi ec_raw_mode=3D1 to a modprobe.d=20
conf file. Looking at /sys/modules/acer_wmi/parameters/ec_raw_mode=20
contains a Y. The mousepad remains unresponsive on boot prior to a=20
=46n+F7. I've added options acer_wmi ec_raw_mode=3D1 (note the acer_wmi=
 vs=20
acer-wmi) simply because the sysmodule was also underscore. There is no=
=20
difference, the module parameter is recorded as Y and the mousepad stil=
l=20
does not work on boot.

I will provide the other requested information soon.

On 09/13/2012 04:05 AM, joeyli wrote:
> Hi Nathanael,
>
> =E6=96=BC =E4=B8=89=EF=BC=8C2012-09-12 =E6=96=BC 22:35 -0600=EF=BC=8C=
Nathanael D. Noblet =E6=8F=90=E5=88=B0=EF=BC=9A
>> On 08/15/2012 10:45 AM, Nathanael D. Noblet wrote:
>>> Hello,
>>>
>>>     I recently purchased an Acer Aspire One (model A0275-0691). It =
has an
>>> elantech touchpad. As detailed in this bug:
>>> https://bugzilla.redhat.com/show_bug.cgi?id=3D848270 the acer-wmi d=
river
>>> has two issues on this device.
>>>
>>> #1) It is sending TOUCHPAD_TOGGLE and simultaneously changing state
>>> #2) It disables the touchpad at init
>>
>> So I tested the patch provided here.
>> https://bugzilla.redhat.com/show_bug.cgi?id=3D848270
>>
>> It definitely allows the Fn+F7 key combo to toggle the use of the
>> mousepad. Unfortunately the mousepad comes up disabled and is very m=
uch
>> confusing the users using the device. Is there somewhere I should lo=
ok
>> for what is causing that? I don't mind helping to debug the issue at=
 all
>> I just don't know where to start.
>>
>> Thanks,
>
> Please try 'ec_raw_mode=3D1' acer-wmi parameter to avoid acer-wmi run
> launch manager mode. Run the following statement through root and reb=
oot
> system:
> 	# echo "options acer-wmi ec_raw_mode=3D1" > /etc/modprobe.d/acer-wmi=
=2Econf
>
>
> On the other hand,
> I checked your dmideocde on brc#848720, the 0x82 is the RIGHT acpi co=
de
> to you for touchpad_toggle key, that means acer-wmi should emit
> KEY_TOUCHPAD_TOGGLE to userland. There have another thing also listen
> the KEY_TOUCHPAD_TOGGLE and do the change. I checked the
> gnome-settings-daemon, it just show up OSD but didn't change touchpad
> status.
>
> Could you please help provide the following information?
> 	+ please attach acpidump:
> 		# acpidump > acpidump.dat
> 	+ please help to capture acpi debug log:
> 		+ please remove ec_raw_mode=3D1 first.
> 		+ check your kernel parameter need enable: 'CONFIG_ACPI_DEBUG=3Dy'
> 		+ please add the following kernel parameter and reboot system:
> 			acpi.debug_level=3D0x0000000F acpi.debug_layer=3D0xffffffff log_bu=
f_len=3D5M
> 		+ after system reboot, please press Fn+F11 (touchpad toggle key) a =
couple of times.
> 		+ please attach on dmesg log.
>
> For your backlight function key problem, please file another bug on
> bugzilla.kernel.org.
>
>
>
> Thanks a lot!
> Joey Lee
>
>


--=20
Nathanael d. Noblet
t 403.875.4613
