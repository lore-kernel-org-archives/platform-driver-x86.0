From: =?UTF-8?B?UmljaGFyZCBTY2jDvHR6?= <r.schtz@t-online.de>
Subject: Re: Accelerometer and orientation sensor on Lenovo Ideapad S10-3t
Date: Wed, 01 Jun 2011 21:29:46 +0200
Message-ID: <4DE6932A.90808@t-online.de>
References: <4DDE9B92.3090504@users.sourceforge.net> <4DE0E488.8040108@t-online.de> <4DE5E8EE.3000204@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout11.t-online.de ([194.25.134.85]:51523 "EHLO
	mailout11.t-online.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758490Ab1FAT3u (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jun 2011 15:29:50 -0400
In-Reply-To: <4DE5E8EE.3000204@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Alberto Mardegan <mardy@users.sourceforge.net>, platform-driver-x86@vger.kernel.org, "Javier S. Pedro" <maemo@javispedro.com>

On 06/01/2011 09:23, Ike Panhc wrote:
> On 05/28/2011 08:03 PM, Richard Sch=C3=BCtz wrote:
>> On 05/26/11 20:27, Alberto Mardegan wrote:
>>> Secondly, I'd like to add support for reading the accelerometer val=
ues,
>>> as it's done here (again, kudos to Javier):
>>> http://gitorious.org/iaps/iaps/blobs/master/iaps.c
>>> I know that no one is happy of directly accessing the raw I/O ports=
, but
>>> all my attempts of reading these values through the ACPI interfaces=
 or
>>> the EC fields have failed: the fields are always set to 0.
>>> So, what I plan to do is to check the DMI information, and if the
>>> machine is a S10-3t I would you the code linked above to read and r=
eport
>>> the accelerometer values. Would that be acceptable?
>>
>> I'm wondering if the accelerometer driver is also compatible with th=
e ThinkPad SL laptops. It is said that their firmwares are quite simila=
r to the IdeaPad ones. As they have quasi nothing in common with the no=
rmal ThinkPad series there's no support for them in thinkpad-acpi/hdaps=
/tp_smapi.
>
> So far what I know is SL400 has similar firmware with asus-laptops, a=
nd other SL are using thinkpad-acpi.

The EC of the ThinkPad SL laptops is from ASUSTeK as far as I know. At=20
least it looks like that in the DSDT. So asus-laptop handles some=20
hotkeys. No ThinkPad SL can be handled by thinkpad-acpi, because they=20
are totally different.

=46eatures like bluetooth rfkill and accessing the blue LED in the Leno=
vo=20
Care button are still not supported ([1] can do that, but never was=20
accepted for the kernel).

> I have a SL400 and tried to examine the DSDT but found nothing about =
accelerometer sensor.

There should be an accelerometer in your SL400. Try the driver mentione=
d=20
in this thread.

>>
>> I compiled the iaps module and loaded it successfully on my ThinkPad=
 SL. There is also data passed by the driver to the input subsystem, wh=
en I move the laptop. Is there a way to validate this data?
>>
>
> Which SL you have? If we can find out a standard interface, that will=
 be good.

I have a SL500. It looks like the mailing list disliked my attached=20
DSDT. What are the limitations on this? It is available under [2] now.


[1] https://github.com/tetromino/lenovo-sl-laptop
[2] http://richard.qasl.de/DSDT.dsl

--=20
Regards,
Richard Sch=C3=BCtz
