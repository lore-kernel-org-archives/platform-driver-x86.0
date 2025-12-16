Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2920634844D;
	Tue, 16 Dec 2025 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892459; cv=none; b=BtLPX+Gs7tHWHo75ydbrn8PTCpJKc+ID8Z80gdAMddX8/+PvjmWLWrM7fyTmvn+EAe1RPVFyMB9grvucJVhxCdkuP+pMG7Gg0frFrpMQlvLYY9mnuIAo2IFdEn+Pql8EIvkT5J5uaCnQligss+tTEcvJLucpX3R5SfsBiLtfMNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892459; c=relaxed/simple;
	bh=G4zKK7pXScB3c+E9x/CXmaPNFbujvcUxxsl9PB9BGTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XyHmXZmLniIEqNWAHbxzBYpwkzy9o5sh37wwrjcXIysVQvD/pbxucT6LWl3gZ3tJAf9wJiVMwOz+vxX06Dp2kVcYmLSboO+tbuVgk6ofmaalJbaNrAseksUJzitKEwq94gZxL9iSeMsMFFvL1Ve/8DFMvuX6C1W1QQCEgFI1f24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Wf515hB4; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Wf515hB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1765892450; x=1766497250; i=w_armin@gmx.de;
	bh=nQJJuCkMYDYKNLCQSSNiYYJOEE8BqfsHpWjiqOfWPnU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Wf515hB4jXAbWK2HwjULWzJs9wYsUk9UtSM8DEtpOa/9v24uE0xxY94d3wOeKsNY
	 TDmM3vVswXCUjou/v1mtQPh8kp3lOC+AlzYqk7+6HAO66IzMJmTAhJg1x+eBKaCj8
	 vNgiHN4PN0/qdAXo32j8o9ubro4iR5RpKzuwYecTG729qob08072e8I26tTy3wgF/
	 KwgI9P7iWhyz4ZiKVPdztClX6AJDdguCS2BUDH3W7SC938q8+kv+3WG6tOE1V7e/v
	 ZZ1NhRLAJ3YBQq4RfxgiwIRIWjNX6sC8MmplYG0cvbS1tB5SrMvKzhgthp53Y5x6+
	 +84Cm9cFdjlUeSRijA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.84.53] ([141.76.8.149]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QWG-1vZv980htI-00F7ps; Tue, 16
 Dec 2025 14:40:50 +0100
Message-ID: <f6ae4c18-f17e-456b-acb9-75234564b980@gmx.de>
Date: Tue, 16 Dec 2025 14:40:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] platform/wmi: Update driver development guide
To: Randy Dunlap <rdunlap@infradead.org>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@weissschuh.net, Dell.Client.Kernel@dell.com, corbet@lwn.net,
 linux-doc@vger.kernel.org
References: <20251122203803.6154-1-W_Armin@gmx.de>
 <20251122203803.6154-10-W_Armin@gmx.de>
 <e57d7ade-cea7-43e2-91db-585485025b91@infradead.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <e57d7ade-cea7-43e2-91db-585485025b91@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WEt13CdBnE2vj/bulWTV3FNuby3Z79L0k2YrUPcvjWE3Ru2ZKNR
 EKr877AWMOIeXxdzJMLgVyLE8+d5Np7LxzpFg3ppO0P9MpjR48l4t73zU50q4Le1gucNyEg
 M0W48B85LwYMfTXyxOLnLGoiGgRqy45dWR74QFWx3GVZ07lzqcb7hGjLB8RFlP+KwlLL68V
 MqGGpBymuiyigtFH1n2CA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OzPB4s7zlZs=;MUdUwZoslF6Zw2QTffLon9ivT5a
 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
 U44gqsKo0GPo1zcCjBt6

Am 23.11.25 um 02:32 schrieb Randy Dunlap:

>
> On 11/22/25 12:38 PM, Armin Wolf wrote:
>> New WMI drivers should use the new buffer-based WMI API instead of
>> the deprecated ACPI-based API. Update the driver development guide
>> to recommend the buffer-based API to driver developers and explain
>> the purpose of struct wmi_buffer.
>>
>> Also update the ACPI interface documentation to describe the
>> conversion rules for converting ACPI objects into WMI buffers.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   Documentation/wmi/acpi-interface.rst          | 68 +++++++++++++++++
>>   .../wmi/driver-development-guide.rst          | 76 +++++++++++++-----=
-
>>   2 files changed, 121 insertions(+), 23 deletions(-)
>>
>> diff --git a/Documentation/wmi/acpi-interface.rst b/Documentation/wmi/a=
cpi-interface.rst
>> index 1ef003b033bf..6dad191ac59d 100644
>> --- a/Documentation/wmi/acpi-interface.rst
>> +++ b/Documentation/wmi/acpi-interface.rst
>> @@ -104,3 +104,71 @@ holding the notification ID of the event. This met=
hod should be evaluated every
>>   time an ACPI notification is received, since some ACPI implementation=
s use a
>>   queue to store WMI event data items. This queue will overflow after a=
 couple
>>   of WMI events are received without retrieving the associated WMI even=
t data.
>> +
>> +Conversion rules for ACPI data types
>> +------------------------------------
>> +
>> +Consumers of the ACPI-WMI interface use binary buffers to exchange dat=
a with the WMI driver core,
>> +with the internal structure of the buffer being only know to the consu=
mers. The WMI driver core is
>> +thus responsible for converting the data inside the buffer into an app=
ropriate ACPI data type for
>> +consumtion by the ACPI firmware. Additionally, any data returned by th=
e various ACPI methods needs
>     consumption (or: use)
>
>> +to be converted back into a binary buffer.
>> +
>> +The layout of said buffers is defined by the MOF description of the WM=
I method or data block in
>> +question [1]_:
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Data Type       Layout                                                =
                  Alignment
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +``string``      Starts with a unsigned 16-bit little endian integer sp=
ecifying          2 bytes
>                                 an unsigned
>
>> +                the length of the string data in bytes, followed by th=
e string data
>> +                encoded as UTF-16LE with **optional** nul termination =
and padding.
>                                                           NUL
>
>> +                Keep in mind that some firmware implementations might =
depend on the
>> +                terminating nul character to be present. Also the padd=
ing should
>                                 NUL
>
>> +                always be performed with nul characters.
>                                              NUL
>
>> +``boolean``     Single byte where 0 means ``false`` and nonzero means =
``true``.         1 byte
>> +``sint8``       Signed 8-bit integer.                                 =
                  1 byte
>> +``uint8``       Unsigned 8-bit integer.                               =
                  1 byte
>> +``sint16``      Signed 16-bit little endian integer.                  =
                  2 byte
>> +``uint16``      Unsigned 16-bit little endian integer.                =
                  2 byte
>> +``sint32``      Signed 32-bit little endian integer.                  =
                  4 byte
>> +``uint32``      Unsigned 32-bit little endian integer.                =
                  4 byte
> Above 4 lines should end with "bytes".
>
>> +``sint64``      Signed 64-bit little endian integer.                  =
                  8 bytes
>> +``uint64``      Unsigned 64-bit little endian integer.                =
                  8 bytes
>> +``datetime``    A fixed-length 25-character UTF-16LE string with the f=
ormat             2 bytes
>> +                *yyyymmddhhmmss.mmmmmmsutf* where *yyyy* is the 4-digi=
t year, *mm* is
>> +                the 2-digit month, *dd* is the 2-digit day, *hh* is th=
e 2-digit hour
>> +                based on a 24-hour clock, *mm* is the 2-digit minute, =
*ss* is the
>> +                2-digit second, *mmmmmm* is the 6-digit microsecond, *=
s* is a plus or
>> +                minus character depending on whether *utc* is a positi=
ve or negative
>                                                           ^^^ utf: or 5 =
lines up should be utc
>
>> +                offset from UTC (or a colon if the date is an interval=
). Unpopulated
>> +                fields should be filled with asterisks.
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Arrays should be aligned based on the alignment of their base type, wh=
ile objects should be
>> +aligned based on the largest alignment of an element inside them.
>> +
>> +All buffers returned by the WMI driver core are 8-byte aligned. When c=
onverting ACPI data types
>> +into such buffers the following conversion rules apply:
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> +ACPI Data Type  Converted into
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> +Buffer          Copied as-is.
>> +Integer         Converted into a ``uint32``.
>> +String          Converted into a ``string`` with a terminating nul cha=
racter
>                                                                    NUL
>
>> +                to match the behavior the of the Windows driver.
>> +Package         Each element inside the package is converted with alig=
nment
>> +                of the resulting data types being respected. Nested pa=
ckages
>> +                are not allowed.
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> +
>> +The Windows driver does attempt to handle nested packages, but this re=
sults in internal data
>> +structures (``_ACPI_METHOD_ARGUMENT_V1``) erroneously being copied int=
o the resulting buffer.
>> +ACPI firmware implementations should thus not return nested packages f=
rom ACPI methods
>> +associated with the ACPI-WMI interface.
>> +
>> +References
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. [1] https://learn.microsoft.com/en-us/windows-hardware/drivers/kern=
el/driver-defined-wmi-data-items
>> diff --git a/Documentation/wmi/driver-development-guide.rst b/Documenta=
tion/wmi/driver-development-guide.rst
>> index 99ef21fc1c1e..9019661180a0 100644
>> --- a/Documentation/wmi/driver-development-guide.rst
>> +++ b/Documentation/wmi/driver-development-guide.rst
>> @@ -69,7 +69,7 @@ to matching WMI devices using a struct wmi_device_id =
table:
>>           .probe =3D foo_probe,
>>           .remove =3D foo_remove,         /* optional, devres is prefer=
red */
>>           .shutdown =3D foo_shutdown,     /* optional, called during sh=
utdown */
>> -        .notify =3D foo_notify,         /* optional, for event handlin=
g */
>> +        .notify_new =3D foo_notify,     /* optional, for event handlin=
g */
>>           .no_notify_data =3D true,       /* optional, enables events c=
ontaining no additional data */
>>           .no_singleton =3D true,         /* required for new WMI drive=
rs */
>>     };
>> @@ -89,9 +89,9 @@ the WMI device and put it in a well-known state for t=
he WMI driver to pick up la
>>   or kexec. Most WMI drivers need no special shutdown handling and can =
thus omit this callback.
>>  =20
>>   Please note that new WMI drivers are required to be able to be instan=
tiated multiple times,
>> -and are forbidden from using any deprecated GUID-based WMI functions. =
This means that the
>> -WMI driver should be prepared for the scenario that multiple matching =
WMI devices are present
>> -on a given machine.
>> +and are forbidden from using any deprecated GUID-based and ACPI-based =
WMI functions. This means
>                                           I would say:     or
>
>> +that the WMI driver should be prepared for the scenario that multiple =
matching WMI devices are
>> +present on a given machine.
>>  =20
>>   Because of this, WMI drivers should use the state container design pa=
ttern as described in
>>   Documentation/driver-api/driver-model/design-patterns.rst.
>> @@ -103,38 +103,37 @@ Documentation/driver-api/driver-model/design-patt=
erns.rst.
>>   WMI method drivers
>>   ------------------
>>  =20
>> -WMI drivers can call WMI device methods using wmidev_evaluate_method()=
, the
>> -structure of the ACPI buffer passed to this function is device-specifi=
c and usually
>> -needs some tinkering to get right. Looking at the ACPI tables containi=
ng the WMI
>> -device usually helps here. The method id and instance number passed to=
 this function
>> -are also device-specific, looking at the decoded Binary MOF is usually=
 enough to
>> -find the right values.
>> +WMI drivers can call WMI device methods using wmidev_invoke_method(). =
For each WMI method
>> +invocation the WMI driver needs to provide the instance number and the=
 method ID, as well as
>> +a buffer with the method arguments and optionally a buffer for the res=
ults.
>>  =20
>> -The maximum instance number can be retrieved during runtime using wmid=
ev_instance_count().
>> +The layout of said buffers is device-specific and described by the Bin=
ary MOF data associated
>> +with a given WMI device. Said Binary MOF data also describes the metho=
d ID of a given WMI method
>> +with the ``WmiMethodId`` qualifier. WMI devices exposing WMI methods u=
sually expose only a single
>> +instance (instance number 0), but in theory can expose multiple instan=
ces as well. In such a case
>> +the number of instances can be retrieved using wmidev_instance_count()=
.
>>  =20
>> -Take a look at drivers/platform/x86/inspur_platform_profile.c for an e=
xample WMI method driver.
>> +Take a look at drivers/platform/x86/intel/wmi/thunderbolt.c for an exa=
mple WMI method driver.
>>  =20
>>   WMI data block drivers
>>   ----------------------
>>  =20
>> -WMI drivers can query WMI device data blocks using wmidev_block_query(=
), the
>> -structure of the returned ACPI object is again device-specific. Some W=
MI devices
>> -also allow for setting data blocks using wmidev_block_set().
>> +WMI drivers can query WMI data blocks using wmidev_query_block(), the =
layout of thereturned
>                                                                   (). Th=
e layout of the returned
>
>> +buffer is again device-specific and described by the Binary MOF data. =
Some WMI data blocks are
>> +also writeable and can be set using wmidev_set_block(). The number of =
data block instances can
>> +again be retrieved using wmidev_instance_count().
>>  =20
>> -The maximum instance number can also be retrieved using wmidev_instanc=
e_count().
>> -
>> -Take a look at drivers/platform/x86/intel/wmi/sbl-fw-update.c for an e=
xample
>> -WMI data block driver.
>> +Take a look at drivers/platform/x86/intel/wmi/sbl-fw-update.c for an e=
xample WMI data block driver.
>>  =20
>>   WMI event drivers
>>   -----------------
>>  =20
>> -WMI drivers can receive WMI events via the notify() callback inside th=
e struct wmi_driver.
>> +WMI drivers can receive WMI events via the notify_new() callback insid=
e the struct wmi_driver.
>>   The WMI subsystem will then take care of setting up the WMI event acc=
ordingly. Please note that
>> -the structure of the ACPI object passed to this callback is device-spe=
cific, and freeing the
>> -ACPI object is being done by the WMI subsystem, not the driver.
>> +the layout of the buffer passed to this callback is device-specific, a=
nd freeing of the buffer
>> +is being done by the WMI subsystem itself, not the driver.
>     is done by
>
>>  =20
>> -The WMI driver core will take care that the notify() callback will onl=
y be called after
>> +The WMI driver core will take care that the notify_new() callback will=
 only be called after
>>   the probe() callback has been called, and that no events are being re=
ceived by the driver
>>   right before and after calling its remove() or shutdown() callback.
>>  =20
>> @@ -146,6 +145,36 @@ the ``no_notify_data`` flag inside struct wmi_driv=
er should be set to ``true``.
>>  =20
>>   Take a look at drivers/platform/x86/xiaomi-wmi.c for an example WMI e=
vent driver.
>>  =20
>> +Exchanging data with the WMI driver core
>> +----------------------------------------
>> +
>> +WMI drivers can exchange data with the WMI driver core using struct wm=
i_buffer. The internal
>> +structure of those buffers is device-specific and only known by the WM=
I driver. Because of this
>> +the WMI driver itself is responsible for parsing and validating the da=
ta received from its
>> +WMI device.
>> +
>> +The strcture of said buffers is described by the MOF data associated w=
ith the WMI device in
>         structure
>
>> +question. When such a buffer contains multiple data items it usually m=
akes sense to define a
>> +C structure and use it during parsing. Since the WMI driver core guara=
ntees that all buffers
>> +received from a WMI device are aligned on a 8-byte boundary, WMI drive=
rs can simply perform
>                                            on an 8-byte
>
>> +a cast between the WMI buffer data and this C structure.
>> +
>> +This however should only be done after the size of the buffer was veri=
fied to be large enough
>> +to hold the whole C structure. WMI drivers should reject undersized bu=
ffers as they are usually
>> +send by the WMI device to signal an internal error. Oversized buffers =
however should be accepted
>     sent
>
>> +to emulate the behavior of the Windows WMI implementation.
>> +
>> +When defining a C structure for parsing WMI buffers the alignment of t=
he data items should be
>> +respected. This is especially important for 64-bit integers as those h=
ave different alignments
>> +on 64-bit (8-byte alignment) and 32-bit (4-byte alignment) architectur=
es. It is thus a good idea
>> +to manually specify the alignment of such data items or mark the whole=
 structure as packed when
>> +appropriate. Integer data items in general are little-endian integers =
and should be marked as
>> +such using ``__le64`` and friends. When parsing WMI string data items =
the struct wmi_string should
>> +be used as WMI strings have a different layout than C strings.
>> +
>> +See Documentation/wmi/acpi-interface.rst for more information regardin=
g the binary format
>> +of WMI data items.
>> +
>>   Handling multiple WMI devices at once
>>   -------------------------------------
>>  =20
>> @@ -170,6 +199,7 @@ Things to avoid
>>   When developing WMI drivers, there are a couple of things which shoul=
d be avoided:
>>  =20
>>   - usage of the deprecated GUID-based WMI interface which uses GUIDs i=
nstead of WMI device structs
>> +- usage of the deprecated ACPI-based WMI interface which uses ACPI obj=
ects instead of plain buffers
>>   - bypassing of the WMI subsystem when talking to WMI devices
>>   - WMI drivers which cannot be instantiated multiple times.
>>  =20
> Otherwise LGTM. Thanks.

Thank you, i will soon send a v2 series with the requested changes.

Thanks,
Armin Wolf

