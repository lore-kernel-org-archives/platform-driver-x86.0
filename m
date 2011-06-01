From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: Accelerometer and orientation sensor on Lenovo Ideapad S10-3t
Date: Wed, 01 Jun 2011 15:23:26 +0800
Message-ID: <4DE5E8EE.3000204@canonical.com>
References: <4DDE9B92.3090504@users.sourceforge.net> <4DE0E488.8040108@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:33001 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752192Ab1FAHXn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jun 2011 03:23:43 -0400
In-Reply-To: <4DE0E488.8040108@t-online.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?UmljaGFyZCBTY2jDvHR6?= <r.schtz@t-online.de>
Cc: Alberto Mardegan <mardy@users.sourceforge.net>, platform-driver-x86@vger.kernel.org, "Javier S. Pedro" <maemo@javispedro.com>

On 05/28/2011 08:03 PM, Richard Sch=C3=BCtz wrote:
> On 05/26/11 20:27, Alberto Mardegan wrote:
>> Secondly, I'd like to add support for reading the accelerometer valu=
es,
>> as it's done here (again, kudos to Javier):
>> http://gitorious.org/iaps/iaps/blobs/master/iaps.c
>> I know that no one is happy of directly accessing the raw I/O ports,=
 but
>> all my attempts of reading these values through the ACPI interfaces =
or
>> the EC fields have failed: the fields are always set to 0.
>> So, what I plan to do is to check the DMI information, and if the
>> machine is a S10-3t I would you the code linked above to read and re=
port
>> the accelerometer values. Would that be acceptable?
>=20
> I'm wondering if the accelerometer driver is also compatible with the=
 ThinkPad SL laptops. It is said that their firmwares are quite similar=
 to the IdeaPad ones. As they have quasi nothing in common with the nor=
mal ThinkPad series there's no support for them in thinkpad-acpi/hdaps/=
tp_smapi.

So far what I know is SL400 has similar firmware with asus-laptops, and=
 other SL are using thinkpad-acpi.

I have a SL400 and tried to examine the DSDT but found nothing about ac=
celerometer sensor.

>=20
> I compiled the iaps module and loaded it successfully on my ThinkPad =
SL. There is also data passed by the driver to the input subsystem, whe=
n I move the laptop. Is there a way to validate this data?
>=20

Which SL you have? If we can find out a standard interface, that will b=
e good.
