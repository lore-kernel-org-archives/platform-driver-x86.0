From: =?ISO-8859-1?Q?=C9ric_Piel?= <eric.piel@tremplin-utc.net>
Subject: Re: [PATCH 01/10] lis3lv02d: avoid divide by zero due to unchecked
Date: Wed, 03 Aug 2011 15:21:12 +0200
Message-ID: <4E394B48.8080506@tremplin-utc.net>
References: <4E2D8858.8000900@tremplin-utc.net>	<4E2D88C7.30409@tremplin-utc.net>	<20110801132906.2d4cd28e.akpm@linux-foundation.org>	<201108012311.17881.chunkeey@googlemail.com> <20110801142946.94542ff3.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailservice.tudelft.nl ([130.161.131.5]:46000 "EHLO
	mailservice.tudelft.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755752Ab1HCNVQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 3 Aug 2011 09:21:16 -0400
In-Reply-To: <20110801142946.94542ff3.akpm@linux-foundation.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Lamparter <chunkeey@googlemail.com>, Matthew Garrett <mjg@redhat.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

Op 01-08-11 23:29, Andrew Morton schreef:
> On Mon, 1 Aug 2011 23:11:17 +0200
> Christian Lamparter<chunkeey@googlemail.com>  wrote:
>
>> On Monday, August 01, 2011 10:29:06 PM Andrew Morton wrote:
>>> On Mon, 25 Jul 2011 17:16:23 +0200
>>> __ric Piel<eric.piel@tremplin-utc.net>  wrote:
>>>
>>>> +static int lis3lv02d_get_pwron_wait(struct lis3lv02d *lis3)
>>>> +{
>>>> +	int div =3D lis3lv02d_get_odr();
>>>> +
>>>> +	if (WARN_ONCE(div =3D=3D 0, "device returned spurious data"))
>>>> +		return -ENXIO;
>>>> +
>>>> +	/* LIS3 power on delay is quite long */
>>>> +	msleep(lis3->pwron_delay / div);
>>>> +	return 0;
>>>> +}
>>>
>>> The WARN_ONCE may not be very useful.  The user gets worried, might
>>> report it (often to a distro, not to you!).  But we won't actually =
*do*
>>> anything with the information?
>> The sensor is used to park the hdd in case of an "accident". However=
,
>> if the sensors is not working, the user should at least get a WARN
>> that something is very wrong, right?
>
> Well if we're doing this for the user's benefit (most WARNs are for d=
evelopers)
> then the message should be user-useful.  That one isn't, really.
>
> Can we come up with some text which is more useful to the user/operat=
or and
> won't require him/her/it to send emails and raise bug reports?
>
> Also, the stack trace which WARN emits is not useful in this applicat=
ion?
Thanks Andrew for pointing out this.
Indeed, a WARN with such a message seems not the best way to explain=20
what's is going on. IIRC, Christian suspects the bug happens due to som=
e=20
weird things that the bios does. So do you think this code looks better=
?

if (div =3D=3D 0) {
   pr_warn_once("device returned spurious data, it will not be used. "
	       "It might be a hardware or firmware bug. "
	       "Contact the driver's authors if you think it is not.");
   return -ENXIO;
}

If every one likes it, I'll update the patch and send you the new versi=
on.

See you,
=C9ric
