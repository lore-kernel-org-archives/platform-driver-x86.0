Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818D2846D;
	Sat,  4 Jan 2025 07:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976282; cv=none; b=Z2jslTYiJEMH5Iv9JbQh7G/+rR2zpJ9y9wHb1Ucn6/lZ0tMwxwYtFmwCXSisLT3oGpYgS7UUFMgyht820avscpZk3tTs2/g25OvSb+wba/wZLNcisyy13xKGOvrzff7IXWmnYae9cOP/cB9ViNoKNSg20z/A4kmClLR3EvZU9AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976282; c=relaxed/simple;
	bh=m5Qw8KHAhiKmrTqnLov0rjJScfR/r9obY3REpnH7zuo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QKCJlEXFRW49j6d6n8+A+bC7NJDdAukIZwyV2PkY/URfXzCoVGFiPseP+zNrjFffAErTeo+03QOiqUh1ULFG/YVfynKsz+EqOd0fM2T/R5USmR403DPAh5tAR8isqHWuqZSp6JNg4UT0FF+pHodLVJQeHxVB5C29M0JGA8bNqJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=VxvSu1Ab; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="VxvSu1Ab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735976253; x=1736581053; i=w_armin@gmx.de;
	bh=m5Qw8KHAhiKmrTqnLov0rjJScfR/r9obY3REpnH7zuo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VxvSu1AbH/c475gKThaU1jH6LTMbVBlyfKegwtZxl8Jk7I3G8ecfyJ/48RbZrw3g
	 L/wgzmHGe6WRuOwvqCEsieKCVwsCqJ0PjdGMz8AxDKqnNycErt7MWEhJCEIm+yNfl
	 9pMQWK0ilYiBl5MfEefcVB9FGlJz0X+EO73DJ10xZkLVSZTg/IbbwdSvgrIy1w1/V
	 JWYfjF0I24cPZ31fps5D2R7Epn1DSTmuRNh9TEg1Ber7tWl5enAyYS8F/DAydZ+1R
	 N0KQKis+ZJ0WK3m0YcaHlc0uz165Ggi1QnOOYh8UJhCZsluMWGfOh7JDsvITBeRLS
	 HDlVYb9f4kQbI7IgAg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wPb-1tOEMA34fr-005ZRG; Sat, 04
 Jan 2025 08:37:33 +0100
Message-ID: <dbb4aaa7-c642-4955-8bef-d397ff5c5875@gmx.de>
Date: Sat, 4 Jan 2025 08:37:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86: firmware_attributes_class: Move include
 linux/device/class.h
From: Armin Wolf <W_Armin@gmx.de>
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
 <f4783864-1bbe-48ea-9a2e-2709c94c519c@gmx.de>
Content-Language: en-US
In-Reply-To: <f4783864-1bbe-48ea-9a2e-2709c94c519c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QhXxvnLMKPZLCZk7mKA0gMQNuDTePKMKM7Jorl/Chyf7ru42jpn
 Js5yRGlpb97NhFxPYt4oMZoTflPby6KzvMh60nZHEWLcRrt5NHKzwRzOueHnAfxXGR0qHxm
 GHp6BO0CWrqC12WR7u2mxgE0Cqmsspooi86WVnz5E9fLmtKxQ9a5ZF/faQEPC5K/FLB4sYG
 mAyymDZbZF1PNZd07uUQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VcELgFwopfE=;LApA1l6XiA2MkI+qBdko05ndyMx
 U3kWESnn0RL+YtvR6xJlZ2LbqC+OMy0uUC/k2LW0a5Q9AO595ausDKQjS4NRBbJwL0Vdc00Na
 MoLSaQNh32cwlaI97cCjEAjSe+le/Zl8BG5gWDqfc4C2cRCugTLuXkln3AVvxePgOOFFfWAl3
 vWn4aCEdDaM96z3+nNy4l/gqFBRzgjYPjrXsBWLMmE72iuypN0sIPtdOhbRRJZ3T86UTRTa+J
 6j4j9/jKYSHUeXeXV0i4NG/MJ17tV6pnH2i3lNS5eQz+lCYf+dB/80duJuHecFMCt43sUvAhW
 uPKbaWPeLosg99Clgq/5KVK92hbpBZ1UoROdcKYQQZ3kzPwvkXt3j00bAQTHWpqKBoRK8prVV
 1jvClcyNfTgImwrS1YsOStpZ/pIhY9pA3WyFivg2JSAQkkuTqwMXgaV8iIbGQEQa16kKOs9ch
 1rNsZuyvc+Jz2pZRSoMdiaiCTVYSGlskuh+eOxD/Gxk7S/nxYCJtTPa3Y/VY1PUho4O8RkT4Z
 VcTcXJzBXM92qbARFu0T+HE9JKrFGgpdrQVebMu/YtKbHbhBpEAtipRy4pPM1piXTvrn9uDZV
 qH9Rh7+B+XaXwjLOlfjPhgIF+Tif+TlWIwxNOd3u5HNV1Nyn3w7UMibvURRaOlEkAR1dSIL/7
 LDkQG8wx0DPSpULGlRC+G6hWzsuD46e5SJkGP+xmVKCdnoDHtv9vR1Svuzhc2ziDOymi8Zi39
 Jdf1glVho7BsHDeTvZXLd4fLe0ZlGZ7+a2bsItKlwsDX3sDM9Pjy7TpvTea0GlI8V5V3ClXhG
 O3CvrL54zDcN569VlL7tBXYmmwjMKf1Aa/pSYFIg2CTDM61GfDhdef7OeMBRVnowzh/MIdKCC
 q+CNFkt5zpg70WldJlQEfk9i+KK87zKBVhvPoYQlzt+X1lOfP3ru2kd5x1FiN+8t//5qpJjhz
 K25cQ62riOvvQApjOaYJUHJKwPyEOxlhkkR1Sh4PolvxXlI1oB3c2rjCas58gHnCrmaSj6BCG
 nMoUMOZubcDT4rZ/jSBGAVLRYhTPlDszikCfLPjgExzMTjyMTb8APqF8jhrsFuHIFq0vmm6Ee
 RoNlTJArEDx5oIUdgViO/Y4MLs0GPv

Am 04.01.25 um 08:20 schrieb Armin Wolf:

> Am 04.01.25 um 08:06 schrieb Thomas Wei=C3=9Fschuh:
>
>> Hi,
>>
>> On 2025-01-04 07:55:15+0100, Armin Wolf wrote:
>>> Am 04.01.25 um 00:05 schrieb Thomas Wei=C3=9Fschuh:
>>>
>>>> The header firmware_attributes_class.h uses 'struct class'. It should
>>>> also include the necessary dependency header.
>>> i like this patch series, but i would prefer that we do not expose
>>> the raw class through the header.
>>>
>>> Looking at the callers of fw_attributes_class_get(), everywhere the
>>> class value is used only to call:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0device_create(fw_attr_class, NULL, MKDEV(0, 0)=
, NULL, "%s",
>>> <driver name>);
>>>
>>> I suggest that we introduce two new functions for that:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0struct device *firmware_attributes_device_regi=
ster(struct device
>>> *parent, const char *name);
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0void firmware_attributes_device_unregister(str=
uct device *dev);
>>>
>>> This would have three major benefits:
>>>
>>> - the raw class can be made internal
>>> - reduced code size
>>> - drivers would stop copying the flawed use of device_destroy()
>>>
>>> Regarding the use of device_destroy(): this is actually an error
>>> since device_destroy() cannot be
>>> reliably used when devt is not unique. Since all those drivers are
>>> setting devt to MKDEV(0, 0) this
>>> could result in a kernel panic should multiple firmware-attribute
>>> class devices exist at the same time.
>>>
>>> What do you think?
>> Completely agree. This is exactly what the "further improvements"
>> mentioned in the cover letter do.
>> And also add devm_firmware_attributes_device_register() and a custom
>> sysfs attribute type that makes the driver code much simplerr.
>>
>> But this will be some more work. Also the conversions of the drivers
>> will be harder and take longer, so we can't drop the raw exposed class
>> as easily and have to keep the "legacy" interface for a bit.
>
> Fair point. In this case the current approach should be fine.
>
>>> Thanks,
>>> Armin Wolf
>>>
>>>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>>> ---
>>>> =C2=A0=C2=A0 drivers/platform/x86/firmware_attributes_class.c | 1 -
>>>> =C2=A0=C2=A0 drivers/platform/x86/firmware_attributes_class.h | 2 ++
>>>> =C2=A0=C2=A0 2 files changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/firmware_attributes_class.c
>>>> b/drivers/platform/x86/firmware_attributes_class.c
>>>> index
>>>> 182a07d8ae3dfa8925bb5b71a43d0219c3cf0fa0..cbc56e5db59283ba99ac0b915ac=
5fb2432afbdc9
>>>> 100644
>>>> --- a/drivers/platform/x86/firmware_attributes_class.c
>>>> +++ b/drivers/platform/x86/firmware_attributes_class.c
>>>> @@ -3,7 +3,6 @@
>>>> =C2=A0=C2=A0 /* Firmware attributes class helper module */
>>>>
>>>> =C2=A0=C2=A0 #include <linux/mutex.h>
>>>> -#include <linux/device/class.h>
>>>> =C2=A0=C2=A0 #include <linux/module.h>
>>>> =C2=A0=C2=A0 #include "firmware_attributes_class.h"
>>>>
>>>> diff --git a/drivers/platform/x86/firmware_attributes_class.h
>>>> b/drivers/platform/x86/firmware_attributes_class.h
>>>> index
>>>> 363c75f1ac1b89df879a8689b070e6b11d3bb7fd..8e0f47cfdf92eb4dc8722b7d837=
1916af0d84efa
>>>> 100644
>>>> --- a/drivers/platform/x86/firmware_attributes_class.h
>>>> +++ b/drivers/platform/x86/firmware_attributes_class.h
>>>> @@ -5,6 +5,8 @@
>>>> =C2=A0=C2=A0 #ifndef FW_ATTR_CLASS_H
>>>> =C2=A0=C2=A0 #define FW_ATTR_CLASS_H
>>>>
>>>> +#include <linux/device/class.h>
>
> I think it would make more sense to not include the complete class
> header and instead only
> define "struct class;" inside firmware_attributes_class.h.
>
> Thanks,
> Armin Wolf

Forget what i just said, we still need the header once we expose the class=
.

For the whole series:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
>>>> +
>>>> =C2=A0=C2=A0 int fw_attributes_class_get(const struct class **fw_attr=
_class);
>>>> =C2=A0=C2=A0 int fw_attributes_class_put(void);
>>>>
>>>>
>
