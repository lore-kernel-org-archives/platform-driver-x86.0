Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B1237F73B;
	Mon, 12 Jan 2026 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768240807; cv=none; b=CiR4bnDU1PDKAcq4UzVi/V/MM7W3vnqr7HaHOxxqr3x2qSKKGvOgurbXg/42/qZqIEN791NHi7POvOC48njbXSXD3hJ+eJUXsDUM+va+LFDyKcQw4maj6953imHGKa5mUbq/EwUfhEhEoDwgVhuvmwmJQkT3agiXzGuT8LWdDg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768240807; c=relaxed/simple;
	bh=+XKMV3OOEtvYjmoCrlnjMOI7gOPC0+A3nFMzDA//sHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+wt69VuzPod9Arzv3bitf1RaywglEsbMzxUDk86LsnNcABWqxI5sFGDGQ0mi4YBcf35qz2Y5wx7lG6jgMmDYjzlCosMIhTBm5TE8q5hBq49dNe+qIALS/34q1+tDqtwIxux8kS9KPONH8Zng0/abJKaKdZOJLc2kw9PapEd6g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CSG8V8JI; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CSG8V8JI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768240798; x=1768845598; i=w_armin@gmx.de;
	bh=aOWrVVU9Ml18tPQpq+CtHab5ucTzKyaYqgFFooqb9aw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CSG8V8JIyaGEpKrdGTfxDzG85uibp/vZxd4RlBwF8GioPthbzuI8wk4Rvj+Z4jnf
	 iWJPHQQCOupCv87m2j9uuihS+m6VAWrh9YZN9a1Le+xvbwrXQb7bPAnY6kQYC6e+i
	 0Xg3GnAlWshCMHn2Ncx3nNCfAv6YYMBatImGCOwFWqh8WPdE4bnbFfxn5SrYatz4V
	 nR+zQLvq6AhWPMvPNk/XFCt8qfZC2F2piOWAAwTlZNSuSUYSfq5VkFHym+gvrn5mg
	 MiLLl5d/J+QV5OtFqNYt4lL0nNCq05UImt5nwu/ievl3pdCWna2qmV06juSBCH4ue
	 LVJPxxPBtkRPFZ2w1A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1HZo-1vi75o1IWA-008Bpr; Mon, 12
 Jan 2026 18:59:58 +0100
Message-ID: <e1b3bc91-bc89-4a6e-8f80-f9ac25b2bedb@gmx.de>
Date: Mon, 12 Jan 2026 18:59:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] platform/wmi: Add kunit test for the string
 conversion code
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux@weissschuh.net,
 Dell.Client.Kernel@dell.com, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20260109214619.7289-1-W_Armin@gmx.de>
 <20260109214619.7289-5-W_Armin@gmx.de>
 <c8c399b0-7eda-a12a-61b4-9777e07c98ae@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <c8c399b0-7eda-a12a-61b4-9777e07c98ae@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9yinzvOOtLnQkUNC5Zlbh82Gv1jIWfmoZlFcQrkgCLrhNSp94F4
 NkfB0SMvZRu+jH1XXJcG13cdaP3nYc/P6plvyIwdeUBngte6lZaPCaCR++SFBHXVBPu039i
 JiO6+gW52Kgh8ioLRyPu/FcGFp/JvwkRhd8KSxL3lrCtWQGPktJx3X0Etr4Qh2lSDHhgYHq
 VFK1NiMs1iIQnRtIz/qJw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BMJG8Z/KfcA=;oEi8V701LbHDTZJ6+RIz1R/BwHi
 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

Am 12.01.26 um 17:34 schrieb Ilpo J=C3=A4rvinen:

> On Fri, 9 Jan 2026, Armin Wolf wrote:
>
>> The string conversion frunctions provided by the WMI driver core
>> have no dependencies on the remaining WMI API, making them suitable
>> for unit tests.
>>
>> Implement such a unit test using kunit. Those unit tests verify that
>> converting between WMI strings and UTF8 strings works as expected.
>> They also verify that edge cases are handled correctly.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/wmi/tests/Kconfig        |  11 +
>>   drivers/platform/wmi/tests/Makefile       |   3 +
>>   drivers/platform/wmi/tests/string_kunit.c | 278 +++++++++++++++++++++=
+
>>   3 files changed, 292 insertions(+)
>>   create mode 100644 drivers/platform/wmi/tests/string_kunit.c
>>
>> diff --git a/drivers/platform/wmi/tests/Kconfig b/drivers/platform/wmi/=
tests/Kconfig
>> index efcbcb51c251..f7f0f3c540f5 100644
>> --- a/drivers/platform/wmi/tests/Kconfig
>> +++ b/drivers/platform/wmi/tests/Kconfig
>> @@ -14,3 +14,14 @@ config ACPI_WMI_MARSHALLING_KUNIT_TEST
>>   	  to the KUnit documentation in Documentation/dev-tools/kunit/.
>>  =20
>>   	  If unsure, say N.
>> +
>> +config ACPI_WMI_STRING_KUNIT_TEST
>> +	tristate "KUnit Test for ACPI-WMI string conversion" if !KUNIT_ALL_TE=
STS
>> +	depends on KUNIT
>> +	default KUNIT_ALL_TESTS
>> +	help
>> +	  This builds unit tests for the ACPI-WMI string conversion code.
>> +	  For more information on KUnit and unit tests in general, please ref=
er
>> +	  to the KUnit documentation in Documentation/dev-tools/kunit/.
>> +
>> +	  If unsure, say N.
>> diff --git a/drivers/platform/wmi/tests/Makefile b/drivers/platform/wmi=
/tests/Makefile
>> index 252c3125353a..62c438e26259 100644
>> --- a/drivers/platform/wmi/tests/Makefile
>> +++ b/drivers/platform/wmi/tests/Makefile
>> @@ -6,3 +6,6 @@
>>  =20
>>   wmi_marshalling_kunit-y				:=3D marshalling_kunit.o
>>   obj-$(CONFIG_ACPI_WMI_MARSHALLING_KUNIT_TEST)	+=3D wmi_marshalling_ku=
nit.o
>> +
>> +wmi_string_kunit-y				:=3D string_kunit.o
>> +obj-$(CONFIG_ACPI_WMI_STRING_KUNIT_TEST)	+=3D wmi_string_kunit.o
>> diff --git a/drivers/platform/wmi/tests/string_kunit.c b/drivers/platfo=
rm/wmi/tests/string_kunit.c
>> new file mode 100644
>> index 000000000000..9aa3ffa85090
>> --- /dev/null
>> +++ b/drivers/platform/wmi/tests/string_kunit.c
>> @@ -0,0 +1,278 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * KUnit test for the ACPI-WMI string conversion code.
>> + *
>> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/string.h>
>> +#include <linux/wmi.h>
>> +
>> +#include <kunit/resource.h>
>> +#include <kunit/test.h>
>> +
>> +#include <asm/byteorder.h>
>> +
>> +struct wmi_string_param {
>> +	const char *name;
>> +	const struct wmi_string *wmi_string;
>> +	/*
>> +	 * Remember that using sizeof() on a struct wmi_string will
>> +	 * always return a size of two bytes due to the flexible
>> +	 * array member!
>> +	 */
>> +	size_t wmi_string_length;
>> +	const u8 *utf8_string;
>> +	size_t utf8_string_length;
>> +};
>> +
>> +#define TEST_WMI_STRING_LENGTH 12
>> +
>> +static const struct wmi_string test_wmi_string =3D {
>> +	.length =3D cpu_to_le16(10),
>> +	.chars =3D {
>> +		cpu_to_le16(u'T'),
> I've applied this to for-next and intend to keep these there but FYI the=
se
> trigger sparse errors. I don't know if they're fixable or not with
> reasonable effort on kernel side.

To me it seems that sparse ignores the u-prefix signaling that the charact=
er constant
has a length of 16-bits, but good catch.

If this really is a problem then gcc would issue a warning anyway (happene=
d when i was
using the =F0=9F=90=A7 character which does not fit into a 16-bit characte=
r constant).

Thanks,
Armin Wolf

>
> $ sparse --version
> 0.6.4 (Debian: 0.6.4-3)
>
> --
>   i.
>
