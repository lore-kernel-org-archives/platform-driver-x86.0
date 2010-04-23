From: =?ISO-8859-1?Q?=C9ric_Piel?= <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH 1/2] Make WMI be selected automatically when needed
Date: Fri, 23 Apr 2010 21:51:54 +0200
Message-ID: <4BD1FA5A.6060406@tremplin-utc.net>
References: <4BC8FF9D.7050500@tremplin-utc.net> <20100416173127.6b968fd4.randy.dunlap@oracle.com> <4BC907B5.2050104@tremplin-utc.net> <20100423192059.GA32705@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailservice.tudelft.nl ([130.161.131.5]:42033 "EHLO
	mailservice.tudelft.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752663Ab0DWTwB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Apr 2010 15:52:01 -0400
In-Reply-To: <20100423192059.GA32705@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, platform-driver-x86@vger.kernel.org, Andrew Morton <akpm@osdl.org>, "Brown, Len" <len.brown@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Op 23-04-10 21:20, Matthew Garrett schreef:
> On Sat, Apr 17, 2010 at 02:58:29AM +0200, =C9ric Piel wrote:
>=20
>>  config LEDS_DELL_NETBOOKS
>>  	tristate "External LED on Dell Business Netbooks"
>> -	depends on X86 && ACPI_WMI
>> +	depends on X86
>> +	depends on ACPI
>> +	select ACPI_WMI
>=20
> I dislike this. The originally stated dependencies are correct and mo=
re=20
> accurately represent what the code requires, and changing that for th=
e=20
> sake of making it easier for people to find the driver sounds like it=
's=20
> trying to cover up shortcomings in our configuration system more than=
=20
> anything else.
>=20
Currently there are 2 modules which select ACPI_WMI and 4 which depend
on it. There are 7 modules which select BACKLIGHT_CLASS_DEVICE and as
many which depend on it. Making usage of the select functionality all
the time would avoid these inconsistencies.

Eric
--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
