From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Subject: Re: Fwd: Acer Aspire 5733 - acer_wmi problems
Date: Tue, 27 Nov 2012 11:37:33 +0100
Message-ID: <50B497ED.401@profitbricks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:45091 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752596Ab2K0KhY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Nov 2012 05:37:24 -0500
Received: by mail-la0-f46.google.com with SMTP id p5so6612485lag.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Nov 2012 02:37:22 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Justin Chudgar <justin@justinzane.com>

On 26.11.2012 19:28, joeyli wrote:
> Hi Justin,=20
>
> OK, looks not just one problem on you machine. Let's clarify one by o=
ne:
> =20
> + For the Fn key you said:=20
>    <fn>+<brightness/volume/suspend/etc.> key combos not working=20
>   =20
>    That a bit strange for at least the volume control (normally on Ac=
er
> machine are Fn+up/down) should work because it direct send out useful
> scan code.=20
>
>    Please help to capture the scan code by showkey:
> 	- Add atkbd.softraw=3D0 kernel parameter and reboot system.
> 	- Switch to console and login with root account, then run:
> 		# showkey -s
>    	 press Fn key and monitor the showkey output.
>
>
> + For we want to make sure acer-wmi causes any problem:
>    Please add acer-wmi to the blacklist of modprobe
> (e.g. /etc/modprobe.d/blacklist), then try to reproduce all issues on
> your machine. (Fn key, AC power...)
>
>
> + For brightness control:
>   Please check does there have /sys/class/backlight/acpi_video0 folde=
r
> on your machine. If you found it, please try to change the backlight =
by:
> 	# echo 3 > /sys/class/backlight/acpi_video0/brightness
>
>   If you didn't see acpi_video0, please try 'acpi_backlight=3Dvendor'
> kernel parameter. Then /sys/class/backlight/intel_backlight should sh=
ow
> up on your machine if it used Intel graphics Adapter.
>
>
> + For the AC power problem:
> 	Per your DSDT, the EC _Q37 is mapping to AC unplug and _Q38 is AC pl=
ug.
> In _Q37 and _Q38, they notify AC, Battery and Processor acpi devices,
> but I didn't see it changed backlight. Did you set S3 suspend when li=
d
> close?

Interesting, there are similar issues with latest Samsung laptops and
the EC of the Intel HM76 chip-set:

https://bugzilla.kernel.org/show_bug.cgi?id=3D45461
https://bugzilla.kernel.org/show_bug.cgi?id=3D44161


> Thanks a lot!
> Joey Lee
>
> =E6=96=BC =E6=97=A5=EF=BC=8C2012-11-25 =E6=96=BC 17:05 -0800=EF=BC=8C=
Justin Chudgar =E6=8F=90=E5=88=B0=EF=BC=9A
>> The acpidump tarball isattached.What I meant by unplugged/plugged wa=
s this:
>> 1 - the laptop is plugged into AC power
>> 2 - the laptop is left with the lid closed, unused for longer than
>> ~15-30 minutes.
>> 3 - the laptop's power adapter is unplugged from the AC outlet for
>> ~30-60 seconds.
>> 4 - the laptop's power adapter is plugged into another AC outlet
>> *Problem*
>> - After the above sequence, the laptop screen will not work. This me=
ans
>> that the backlight is off and the screen is blank. The laptop does n=
ot
>> respond to any user input, via trackpad, normal keyboard keys,
>> <fn>+<SPECIAL> keys that I assume are handled by acer_wmi. It does w=
ork
>> perfectly fine when accessed via ssh, though even restarting kdm via=
 ssh
>> fails to reactivate the screen. The only way to recover the screen i=
s to
>> reboot.
>> *Other Problems*
>> - Multimedia keys do not work.
>>
>> Justin Chudgar  |  Weed, CA 96094  |  530 921 0738 | http://www.just=
inzane.com/
>>
>> On 11/24/2012 10:41 PM, joeyli wrote:
>>> Hi Justin,=20
>>>
>>> =E6=96=BC =E5=85=AD=EF=BC=8C2012-11-24 =E6=96=BC 12:33 -0800=EF=BC=8C=
Justin Chudgar =E6=8F=90=E5=88=B0=EF=BC=9A
>>>> This is what I am having problems with. Thanks for the quick reply=
=2E
>>>>
>>>> Justin Chudgar  |  Weed, CA 96094  |  530 921 0738 |
>>>> http://www.justinzane.com/
>>>>
>>>>
>>>>
>>>> -------- Original Message --------
>>>> Subject:        Acer Aspire 5733 - acer_wmi problems
>>>> Date:   Fri, 23 Nov 2012 11:47:02 -0800
>>>> From:   Justin Chudgar <justin@justinzane.com>
>>>> To:     platform-driver-x86@vger.kernel.org
>>>>
>>>>
>>>>
>>>> I have an Acer Aspire 5733 that is having issues with:
>>>> - <fn>+<brightness/volume/suspend/etc.> key combos not working
>>> Please provide acpidump from your Aspire 5733. Run the following co=
mmand
>>> by root:
>>>  # acpidump > acpidump.dat
>>>
>>> Please send acpidump.dat to me.
>>>
>>>> - screen not resuming when unplugging/replugging a system while sy=
stem
>>>> continues operating
>>> I am not fully understand what means 'unplugging/replugging'?=20
>>>
>>>> Could someone please help me determine how to triage these and dir=
ect
>>>> me
>>>> on what info the maintainer needs from me.
>>>>
>>>> Thank you.=20
>>> Thanks a lot!
>>> Joey Lee
>>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
Sebastian Riemer
Linux Kernel Developer - Storage

We are looking for (SENIOR) LINUX KERNEL DEVELOPERS!

ProfitBricks GmbH =95 Greifswalder Str. 207 =95 10405 Berlin, Germany
www.profitbricks.com =95 sebastian.riemer@profitbricks.com
Tel.: +49 - 30 - 60 98 56 991 - 915

Sitz der Gesellschaft: Berlin
Registergericht: Amtsgericht Charlottenburg, HRB 125506 B
Gesch=E4ftsf=FChrer: Andreas Gauger, Achim Weiss
