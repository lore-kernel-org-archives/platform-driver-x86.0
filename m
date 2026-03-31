Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D443E1CFA
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973306; cv=none; b=AWJJMy/K1Q0b+a6RqvmsupwMKYXZPPnTFyruKPvkyMj06Lv+XD1+lq25pWpJnMdVgywCVBpKWrFZ6OUKPFZQqlU9ZfbYyxS47omIZIkAXVmDi4NCendIf266c6eAfNtAzhghxc/qjFhD4+gn71VxSnn+zungzaCcBMY17Ygq/MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973306; c=relaxed/simple;
	bh=MOYP2bXaIIXpqOGjHPCTKk+sNTIxFv7wLOzqfU/4tpA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=c/38sBe0GxIS9ZShyc1n7C9YGNw5Uzor31qA10YTaSB8aq8kZaoSdSAB1fNZ6mVC6P21WQLkvmsnp4vFNRywMjpTWko1bhlVwRwLgA/TsfRQbeepP9IpUBJXNLihi+2MukhpXfnyspkPTtU//hJQPgzjnrKncssetqr6xWJiZ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flntqM3B; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flntqM3B"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56cd842b60bso4161656e0c.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 09:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774973304; x=1775578104; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rs3Rb0+X++5tzUqyDuK2u5gBjFoIBlgxbqyGufCexW4=;
        b=flntqM3BHeBEx4Z8j49cFB5cV1FmABuTjL0P0RojJsw57BtD3q2fWAu8+wmgXIENmK
         HKDlWv08s3ID4ZWy73L+Sx9emI8KpXCTNk8Hrjf1RzmaT06tUUesNq0lZZGBd/4HaSk8
         Ib4uBgWHHFBQxaACLSSgbHAMEG4qgjyh1vqheorOI9JcREqOgXiE/jW09yW8Ag3PSXDB
         gZvIc5WDx+3ZiGuHq8pssRJM/yBgkPsWvzuc0cIGMn67ViiWhjVtx9E/4yPwCIG0gjRn
         Mhkah4isxw4js2vYwIB6paSKGclY57n/8Fbkmgu9GBAsHj7d61NaTtFlh1IbLAvm0WIy
         tQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973304; x=1775578104;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rs3Rb0+X++5tzUqyDuK2u5gBjFoIBlgxbqyGufCexW4=;
        b=BNWyW4f9KztgfW8ogsDqClxYhLcETMUDDuXlrzy85HqVKalaErWbveFdCXDLjaPJQu
         +qIY/7M6F0AU3t9bmiaaEaWc9NLDRgJ6Dk1K0O7D2dcwg8c/C3hqwMaxZFck/O6G5vmB
         v2YjD82h8/kE+eJynj3KGjrB88UQgYcPhbQ2G/SxF0YU7zDXbqF+uTGJX8P6fTqLdrzO
         kSRG2DWiHYqSvqR36UNXAL0TNrJJfBYqfGeXRVqpAKJxbGDoE3+zM6edClp0x6F9AMV9
         0wEgWuoEscInG3UsmfukW9LeXyGg5uGyHpX2Yg1oy3MtOG4j5vQX0MNdgsdBfl6WDk6Q
         QUzw==
X-Forwarded-Encrypted: i=1; AJvYcCUm0wXt2ck+zrw6L8rBbK+O8b2FdWOtwJGZ8Cwy3CWJ+Ly4SEFNSHDMqwgZlpzHvxkQbEw41oalrxpclBCU2P4vK1T5@vger.kernel.org
X-Gm-Message-State: AOJu0YyiwE9moizoUoNCLiySE0OnB3X6FQffIB4AqYeAHmnjCbaxE5lc
	uFWCIstFH2HVLWGLAbIlV28kem6MMzcimkNdbTyzmH5VoBbZsLe+hQY3
X-Gm-Gg: ATEYQzxlA+6BL4TWgC16DqSavH9sx38Fgqp219XLycKNUwL107saO7ikwDrH+dgISPa
	f+etRS9dIlmHDVFOWvKosTmiY8FMBUEpCsHsZ9QkjXUTun8Z1NTGKwnWDodiwg7Ekn8EcuCPU+D
	tDiqIHlMCZ4MI1NQBIE4U0RQt03x/lBK6osJjHQ8udtffUiePn7vfeDDTr13jvLADRzzd6RICqJ
	1ygms/4o6FtrKlCWI5I9Was554XNMeamrmSGoAnqQ9Ns8w50z3ykk97XO0fmQPB/BP6BkDkeMIh
	EB76bKav427bAoXp2Tc9lfEIT6GTrq0/iTZjAuexjTbdkkP1pArN0O6i8PUhSBsWyl9TliRJ1Dc
	EF8FkgMUh25opZMUM6jQs7HAl917QwWJXshNRbkKlG+wHz6MAaM39fISB0PBHeGfuTcuMeS6OIe
	ZPFPWGnn0okCxulA==
X-Received: by 2002:a05:6122:698c:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-56d8a834f8emr100328e0c.4.1774973303639;
        Tue, 31 Mar 2026 09:08:23 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a333c9sm12756843e0c.13.2026.03.31.09.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 09:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 11:08:16 -0500
Message-Id: <DHH3IRMAMTCB.5BLMYBIU6RMR@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: alienware-wmi-base: Transition to new
 WMI API
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Kurt
 Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331-aw-new-api-v2-1-3b0d33bf8d22@gmail.com>
 <d80f8562-f05d-c22a-5d62-398bf05b7030@linux.intel.com>
In-Reply-To: <d80f8562-f05d-c22a-5d62-398bf05b7030@linux.intel.com>

On Tue Mar 31, 2026 at 3:22 AM -05, Ilpo J=C3=A4rvinen wrote:
> On Tue, 31 Mar 2026, Kurt Borja wrote:
>
>> Transition to the new wmi_buffer based WMI API.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>> v2:
>>   - Cast wmi_buffer data to __le32 and then use le32_to_cpu() before
>>     returning
>>=20
>> v1: https://patch.msgid.link/20260330-aw-new-api-v1-1-95910bfa1b38@gmail=
.com
>> ---
>>  drivers/platform/x86/dell/alienware-wmi-base.c | 32 +++++++++++++++----=
-------
>>  1 file changed, 19 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/pl=
atform/x86/dell/alienware-wmi-base.c
>> index 64562b92314f..9abdc5de8e23 100644
>> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
>> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
>> @@ -9,11 +9,13 @@
>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> =20
>>  #include <linux/acpi.h>
>> -#include <linux/cleanup.h>
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/dmi.h>
>>  #include <linux/leds.h>
>> +
>> +#include <asm/byteorder.h>
>> +
>>  #include "alienware-wmi.h"
>> =20
>>  MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
>> @@ -150,23 +152,27 @@ u8 alienware_interface;
>>  int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
>>  			  void *in_args, size_t in_size, u32 *out_data)
>>  {
>> -	struct acpi_buffer out =3D {ACPI_ALLOCATE_BUFFER, NULL};
>> -	struct acpi_buffer in =3D {in_size, in_args};
>> -	acpi_status ret;
>> +	struct wmi_buffer out, in =3D {
>> +		.data =3D in_args,
>> +		.length =3D in_size,
>> +	};
>> +	int ret;
>> =20
>> -	ret =3D wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &ou=
t : NULL);
>> -	if (ACPI_FAILURE(ret))
>> -		return -EIO;
>> +	ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, out_data ? &out =
: NULL);
>> +	if (ret)
>> +		return ret;
>> =20
>> -	union acpi_object *obj __free(kfree) =3D out.pointer;
>> +	if (!out_data)
>> +		return 0;
>> =20
>> -	if (out_data) {
>> -		if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
>> -			*out_data =3D (u32)obj->integer.value;
>> -		else
>> -			return -ENOMSG;
>> +	if (out.length < sizeof(*out_data)) {
>> +		kfree(out.data);
>> +		return -ENOMSG;
>>  	}
>> =20
>> +	*out_data =3D le32_to_cpu(*(__le32 *)out.data);
>> +	kfree(out.data);
>
> Hi,
>
> Please don't bring back duplicated kfree() calls. Just assign out.data=20
> into a local variable so you can use __free() for it similar to what the=
=20
> old code did.


Hi Ilpo,

Sure! I'll use __free() again.

--=20
Thanks,
 ~ Kurt
