Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CD62914;
	Sat,  4 Jan 2025 07:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735975271; cv=none; b=A6bm3VaHXG/B2Ai3zf6HXykkM5Q4J0qGHPEOeu/0v38mdR+P4UbB9xsRKOkK7o3x/9iZ+CONlHtMpvBxQ11HghMb8kMVTYgs3LSFrH8+dt1uqwZr95pRJdNEhEr3xLFt0Hb16RQRyTfaPdVYxv1mGiBcNLitHxdi1io8dHIEeFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735975271; c=relaxed/simple;
	bh=Pndi/JxeOiaBLzswDOzc+XsfLH5V6LxB/cGH0fXERv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/poVHno4xXTSNeiKpSh4crj94TLw9hHDJDrq2kdi2gwaLZ5apgXjwu6ChP8CmA4escnVe9kb4mHcwyZUhJsF9lX/RyYdJEX8A7gQyQ12Mgph26/OtKCaLPLvpm3UsEV+x45QAE10D4/9Ui7GVH2Ue+feWUuEF8/0rIxyOlrLaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FdvruR1x; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FdvruR1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735975250; x=1736580050; i=w_armin@gmx.de;
	bh=h5QtWmCiCUT5orOnO3LcLDNc8BTyjYN+04OH7ofH0qU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FdvruR1xhSmCW+cP8nWQv1Tc8vJiQOTQyTUnlcb1Qhf7WT64Qi36bNcUGXAJEUSB
	 Vnc1Chcp67Qrx9KSjxFWU6EA3WpbvvafgPgKrvpG/xh+xKLx5mA7Qm2mlLrPemPY2
	 mJPwSSQWLU+ol5zBDcyIADwQZfJYzMH4oi8yR9k64MwuldZ/XCB3XwqZMKBJpTMx5
	 pXXZBvoCAXnoirsVnbKeqHS/AUi0D61959DLBPdJCm1NoKEmqWsuYRxRiJr2pP2bz
	 a7WbPoYne5lmX6w4NfsVtFNlVmo7kwthyajIDt4oA/lloW/wvA/EfdqG2ZfwZgcB5
	 811NvVmiY4Kdj2uQKA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79uI-1tX41N45fQ-018Ld2; Sat, 04
 Jan 2025 08:20:50 +0100
Message-ID: <f4783864-1bbe-48ea-9a2e-2709c94c519c@gmx.de>
Date: Sat, 4 Jan 2025 08:20:48 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86: firmware_attributes_class: Move include
 linux/device/class.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Pearson <markpearson@lenovo.com>, Jorge Lopez <jorge.lopez2@hp.com>,
 Prasanth Ksr <prasanth.ksr@dell.com>, Joshua Grisham
 <josh@joshuagrisham.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
 <20250104-firmware-attributes-simplify-v1-1-949f9709e405@weissschuh.net>
 <119c9e8a-6797-4774-bb08-9f911b6a8243@gmx.de>
 <3a553631-1936-4f29-ae91-8276327d5fb4@t-8ch.de>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <3a553631-1936-4f29-ae91-8276327d5fb4@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:piwRizSZ6BoiC/GmQgllz3OeF19yKWA1584GgmXS232Vz+5kBYy
 PulZUQt5KQ0wW6N/5eAlGeLZR5JIRDZbeu1Dyot5CIdDBjRdUR2nQX+lLQejm2cFsA+4Lti
 4HWvX2ebf0oC2qss+kPtgzc7Fl37Ed8oe9sIyFdY6GxAk9X2n4/ZeGKR2dQn0fj2SWJZeiB
 rxmqF9+2+iY4DVVS2Rb/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kWOhQS+I4hk=;P49gbxp7cScYAUvkkPEjAD7EmXx
 MtGDUkz3QvmQZPXV4rJQfojzjsZ7kfc4idisE54xicom6G52Tbm3oSe53J4cGi4ZE2IelNPCx
 sZXtBlTpefzxW+0DJjsetP+ime4NYvh8I3NDJJGBVKojNAgWJaZYqMIqf8yZApCGeOIO/y5h0
 f9KRcTd6wlrV2KXKAc/M1GkWj6FosTQAy1v24FJcXoAsfoFgcHSDT2Bn3cDwGG/64PJy+aFc2
 ftyN5pfSyunEeaYuy0KAWbozPKEWmhMfWBN4oprRWLb0POh/kl1l35BaozBZMWJ27HwqWF1/T
 6Mkq5hrlcYHlTAjEnuZxHKu4RigVNVTiu3WC7HXyvwMYshgykkKtwWnRSnNDDosaYxT9VaXJK
 6IXW0OzeS2mzlqZ43pglwIPC0baPk+LEavZeoDtG3f+UhVk0/3YDNYWfFhzh8O4DjPdIFFckD
 JUJ77EttP6tiT3EqiydhZy7GZuPPmY43aZJKlWkAPwxvYF2lugL9k7QSap0vrCBLGpypBEw+3
 rF1Dhb/ltnahj/jV7lD8yJuIwhL9wZni1R1VuaPPWkrfwQinzPgUyRKLqGOKCUKG2dVXqLZaO
 cLjhX9+sTBmK0/NwyM6tlH6GAigrQc6QYuIr+WHz3lwr+95W6IdTIXjq5rA1ZsPfFPDZS5KfR
 loCi9ayJ+YxQ2Qt5JBkv0tJyHAxP4XPh3k5QjttVN/P42C7qw6GMnghXK5a8IHCkoDw0O23WJ
 JOi1xQfx0GXz3JaGjtVmcyky1BEa3bbjwwb1YCZAepUM3k0Ik+Je5hKba7ZrVG4dWgjVhP0h0
 9d3bYfq3rg1Vspi9lz0tpjdorXHdK36XIlfF2ulHrMgsZi4Z4ohZXUPh+E4rTA4zC81qKI2fX
 xGte2oBGs+eS0kO0SwNwdDgVn59Szj9ZSk+9KCbHIkaEKMWt+f3RNJ2G0bYaNebxXaHAuWKef
 u8aGB48HR8Rpb+t7SHoP5iAv8KMseoqzlghBblGgdYBPKeLsaKvnup11IrNw/oKV9CtMtkzMt
 RAfawli3qqppyX/ABsH4A+iWD4BdxAqXJZyNmgpc+LwkLO2ew7N3kCMePIHITrm4/VoiaLkTj
 BalbaqdT80X5XvSNhbymp3IgpN4KjE

Am 04.01.25 um 08:06 schrieb Thomas Wei=C3=9Fschuh:

> Hi,
>
> On 2025-01-04 07:55:15+0100, Armin Wolf wrote:
>> Am 04.01.25 um 00:05 schrieb Thomas Wei=C3=9Fschuh:
>>
>>> The header firmware_attributes_class.h uses 'struct class'. It should
>>> also include the necessary dependency header.
>> i like this patch series, but i would prefer that we do not expose the =
raw class through the header.
>>
>> Looking at the callers of fw_attributes_class_get(), everywhere the cla=
ss value is used only to call:
>>
>> 	device_create(fw_attr_class, NULL, MKDEV(0, 0), NULL, "%s", <driver na=
me>);
>>
>> I suggest that we introduce two new functions for that:
>>
>> 	struct device *firmware_attributes_device_register(struct device *pare=
nt, const char *name);
>>
>> 	void firmware_attributes_device_unregister(struct device *dev);
>>
>> This would have three major benefits:
>>
>> - the raw class can be made internal
>> - reduced code size
>> - drivers would stop copying the flawed use of device_destroy()
>>
>> Regarding the use of device_destroy(): this is actually an error since =
device_destroy() cannot be
>> reliably used when devt is not unique. Since all those drivers are sett=
ing devt to MKDEV(0, 0) this
>> could result in a kernel panic should multiple firmware-attribute class=
 devices exist at the same time.
>>
>> What do you think?
> Completely agree. This is exactly what the "further improvements"
> mentioned in the cover letter do.
> And also add devm_firmware_attributes_device_register() and a custom
> sysfs attribute type that makes the driver code much simplerr.
>
> But this will be some more work. Also the conversions of the drivers
> will be harder and take longer, so we can't drop the raw exposed class
> as easily and have to keep the "legacy" interface for a bit.

Fair point. In this case the current approach should be fine.

>> Thanks,
>> Armin Wolf
>>
>>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>> ---
>>>    drivers/platform/x86/firmware_attributes_class.c | 1 -
>>>    drivers/platform/x86/firmware_attributes_class.h | 2 ++
>>>    2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/driver=
s/platform/x86/firmware_attributes_class.c
>>> index 182a07d8ae3dfa8925bb5b71a43d0219c3cf0fa0..cbc56e5db59283ba99ac0b=
915ac5fb2432afbdc9 100644
>>> --- a/drivers/platform/x86/firmware_attributes_class.c
>>> +++ b/drivers/platform/x86/firmware_attributes_class.c
>>> @@ -3,7 +3,6 @@
>>>    /* Firmware attributes class helper module */
>>>
>>>    #include <linux/mutex.h>
>>> -#include <linux/device/class.h>
>>>    #include <linux/module.h>
>>>    #include "firmware_attributes_class.h"
>>>
>>> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/driver=
s/platform/x86/firmware_attributes_class.h
>>> index 363c75f1ac1b89df879a8689b070e6b11d3bb7fd..8e0f47cfdf92eb4dc8722b=
7d8371916af0d84efa 100644
>>> --- a/drivers/platform/x86/firmware_attributes_class.h
>>> +++ b/drivers/platform/x86/firmware_attributes_class.h
>>> @@ -5,6 +5,8 @@
>>>    #ifndef FW_ATTR_CLASS_H
>>>    #define FW_ATTR_CLASS_H
>>>
>>> +#include <linux/device/class.h>

I think it would make more sense to not include the complete class header =
and instead only
define "struct class;" inside firmware_attributes_class.h.

Thanks,
Armin Wolf

>>> +
>>>    int fw_attributes_class_get(const struct class **fw_attr_class);
>>>    int fw_attributes_class_put(void);
>>>
>>>
