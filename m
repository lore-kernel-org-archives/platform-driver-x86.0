From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH v5 5/5] dell-rbtn: Add a comment about the XPS 13 9350
Date: Wed, 17 Feb 2016 07:07:28 -0600
Message-ID: <56C47090.1050106@dell.com>
References: <cover.1455553470.git.luto@kernel.org>
 <17238db9f090e8b2c80756ccd4bcd8f4f1e3bfab.1455553470.git.luto@kernel.org>
 <20160217111634.GQ1476@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxipps301.us.dell.com ([143.166.148.223]:13015 "EHLO
	ausxipps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964898AbcBQNLy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 08:11:54 -0500
In-Reply-To: <20160217111634.GQ1476@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>



On 02/17/2016 05:16 AM, Pali Roh=C3=A1r wrote:
> On Monday 15 February 2016 08:32:37 Andy Lutomirski wrote:
>> On the XPS 13 9350, the dell-rbtn mechanism has a new device id, and
>> the DSDT turns it off if a new enough _OSI is supported.  Add a
>> comment about why we don't bother supporting it.
>>
>> Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> ---
>>  drivers/platform/x86/dell-rbtn.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86=
/dell-rbtn.c
>> index cd410e392550..b51a2008d782 100644
>> --- a/drivers/platform/x86/dell-rbtn.c
>> +++ b/drivers/platform/x86/dell-rbtn.c
>> @@ -217,6 +217,21 @@ static void rbtn_notify(struct acpi_device *dev=
ice, u32 event);
>>  static const struct acpi_device_id rbtn_ids[] =3D {
>>  	{ "DELRBTN", 0 },
>>  	{ "DELLABCE", 0 },
>> +
>> +	/*
>> +	 * This driver can also handle the "DELLABC6" device that
>> +	 * appears on the XPS 13 9350, but that device is disabled
>> +	 * by the DSDT unless booted with acpi_osi=3D"!Windows 2012"
>> +	 * acpi_osi=3D"!Windows 2013".  Even if we boot that and bind
>> +	 * the driver, we seem to have inconsistent behavior in
>> +	 * which NetworkManager can get out of sync with the rfkill
>> +	 * state.
> Do you know reason for such behaviour? It is because event is send
> duplicated (by dell-rbtn and also by intel-hid)?
DELLABC6 is a custom interface that was created solely to have airplane
mode support for Windows 7.=20
=46or Windows 10 the proper interface is to use that which is handled b=
y
intel-hid.  A OEM airplane mode driver is not used.

Since the kernel doesn't identify as Windows 7 it would be incorrect to
do attempt to use that interface.
>> +	 * On the XPS 13 9350 and similar laptops, we're not supposed to
>> +	 * use DELLABC6 at all.  Instead, we handle the rfkill button
>> +	 * via the intel-hid driver.
>> +	 */
>> +
>>  	{ "", 0 },
>>  };
>> =20
