Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208805;
	b=l6oNRDXCqzM5wahM0IvqMumx6x4TXmlSNvQdrNciWVjRNpoyxTpNKVoSeqy9cinPaPiG
	 wBWYBgt34O87unSGl2ws5SDetTfApmmn0YBFgXC++Ss7OkWqlfU2dGhKN9HvDKOYoiA7w
	 tS8gjUY2jGM9BI0TEJYymviBWPF1J+twdc12DJegsh8uR09M7Czp6m3gEUKm6IPLN3YNr
	 GPqzsSuLFN7BUXXfa61tib7hxsp6kooVDg0Vf6t50bynGWngZHXSBNig2qo+R+qp+FwkM
	 bkmj5LzUokslNr+jEu97UoZcT4CrLMKSKNXD8Kcwfk2xKGdRkfgviTUejHAuDs8Ql0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208805;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=6U6AGc8ZgeKouCzFgNRh66cV28S9p0vRy7XYM3K9kTg=;
	b=oM8qJg/aU6qHnWcoU85SIHuCjX8tD9ybKvPrUiU5rsJcHdoQXaxiugTQpv8MJfq2Pu/y
	 3j7zE2wvuYRXWQXrNSf3YrWM7RNEGKaCrUTd/fCOMBOidpdrfR5ODT+y3a2J2Cy/Unc2p
	 Bf+cc+X4sP7dowsOpryqE49jyxIbAacdp1j/ZTmCZLBgBtoNXJ7jF5A6761MG0OAFCJAv
	 nOk/51uy62LFDEWXQUVHAuNCKu8M9tXFBnp3oJ5FwZ2rRlk6FPfyLJoq7hdD1NT1wzyVf
	 0aYTaXybNeC6+EUsDd9imDrPiUa6ieeR/VZmXbFCXCvJq2YA33jtrWLHooLng8IDMGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=amgnmvL6;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D239606A6B4
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 21:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D239606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=amgnmvL6
DKIM2-Signature:  i=1; m=1; t=1795208799;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:kiZnva7lBBDdOkLV3JAvEcir55ep
   +IOljRKxwfWjbIAozcpO3Wu1F6FIDT/ho8KUTjOieDKiAf70LBuSb140XA+IxAyGEuPGn0El6Kv
   mgRI7mw5u7jk2Eclt8VmjS7XdsIEYwRwhMC/P/vBZSUPlEx0grPjH4FDqzftz34TuxGLNMRUJKw
   pBo+wO5ibBSzU0NxbvYlU3N4nQ8i6ckRqOtqfSWK72FZxJ/Ed2JF9vRe0PMOjM1qIgJPeuWncEt
   A8W4I6KWSMTqyIn7+yMY+gyOG6HmRJuPHHUhKynGHE3ILhs34OSYT7gzE6UwMxyFLJBlB8Wb5Hs
   YC5bBTqcaoG0SA==;
Message-Instance:  m=1;
 h=sha256:
   bT70qQkgPbAtkbNoK/J5dsbWg2xOfqdsQ3tpGiH7KHc=:
   qpa6h3jUssXGnHhGS/PQsypOyzwf8DZYEL4K/nN14qU=,
  sha512:
   V96+bjQQ8FYQsQe1tUoNCy2ZcYkYFIN78Xrw5oDkWFC2hw+gNtmXertt8KNcetaDbGksvTW3R4uFe073UnOlTQ==:
   Vri59OCsd12sKntk+UIL12jGx++MzeN0xOkl1joWX3vlTzluqbvYMd/0cifXha0UcnIy+e2vnexPPXzOUVwx0A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795208779; x=1795813579; i=w_armin@gmx.de;
	bh=6U6AGc8ZgeKouCzFgNRh66cV28S9p0vRy7XYM3K9kTg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=amgnmvL66ASLoDzKJClxZgRlCTGI2/6k629l6QzvZ/9+OhzP9KHXqpKbikiot+jG
	 hb13p12nRExJGaZeVm774TdiViCT75mgkrsfK/LhUbTipupF7LPa0hg+Ewahac4hp
	 PkpyONP2sBTT8cihlJ4xFpng4UFF1zF591WS1dqAX/qQLNZJt0J1HPWmmJ4VsHZ2S
	 1z1RXAUWxmBNjhRGskGeu3hVm9oDcOz/6IeVBNdmYdHUW1m2koGI+Y+okNVjndEh5
	 P1oRMPeC65+4Yl1gyb920Pgvlovz0WHmUbhvngJa5i0Lg9NaWxMrrhcDFsW4qwKB2
	 rCQmBps3e46l+Qvu8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFbW0-1xlVn321Py-009MO9; Fri, 20
 Nov 2026 22:06:19 +0100
Message-ID: <310d09a6-8cef-4ccc-95f2-cd2378e1f27f@gmx.de>
Date: Fri, 20 Nov 2026 22:06:18 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: dell: Add new dell-wmi-pega driver
To: teolyub@gmail.com
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <848ebb18-b9bf-4747-9403-fa8da4fba2ad@gmx.de>
 <5C8178E2-6BDF-4110-82FA-0AA4628DEFB6@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <5C8178E2-6BDF-4110-82FA-0AA4628DEFB6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eY09n1JR8OmyD7FdsDOapqD0rj4WYOxnDuf1lmCOBj4ivLCYkeK
 FPfafSEvvrg2LP1sPw21KVUoWxexsLbLZ8H4l+hJF69WE+6Ea7oqVVZR1XygBkuFCfXTDwM
 Odna1+QKY7B05lwm9NaAPrNEwS+mJdtTyX7+FlayLWLlLFBpuZsIFgDzOWMuvuCIAPMgqFR
 uEf02lEEwSpml2iDhB8KA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YriakVY9lIE=;hWoYWbYFG5SQ7z101Lu9qkPeORu
 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
 81XPvD40SMiUk=

Am 18.11.26 um 07:24 schrieb teolyub@gmail.com:

> Hi all - please proceed with the patch and thank you all for your work!
>
> Sent from my mighty iPhone 13 mini

Thanks, did you check the second patch as well? This one was not included =
in the
custom module i send you, so i want to make sure that said patch does not =
break
the event handling.

Thanks,
Armin Wolf

>> On 17 Nov 2026, at 22:31, Armin Wolf <W_Armin@gmx.de> wrote:
>>
>> =EF=BB=BFAm 17.11.26 um 23:17 schrieb Ilpo J=C3=A4rvinen:
>>>> On Tue, 17 Nov 2026, Armin Wolf wrote:
>>>> A user has reported that the WMI hotkey events on Dell All-In-One
>>>> machines need to be manually enabled on some models thru a separate
>>>> WMI device. This WMI device seems to be present on many other models
>>>> but has no effect on them.
>>> Can you rephrase this to not textually depend on "user" or "user's
>>> report", just state what the problem is, not how you became aware of i=
t.
>>>> Add a small driver for enabling support for this WMI device. This
>>>> enables the HDMI Input key on the Dell OptiPlex 7400 All-in-One
>>>> machine.
>>>>
>>>> Reported-by: Teodora <teolyub@gmail.com>
>>>> Closes: https://lore.kernel.org/platform-driver-x86/0TZENT.54P2IBFQRE=
D22@gmail.com
>>>> Tested-by: Teodora <teolyub@gmail.com>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>>   Documentation/wmi/devices/dell-wmi-pega.rst | 82 ++++++++++++++++++
>>>>   MAINTAINERS                                 |  6 ++
>>>>   drivers/platform/x86/dell/Kconfig           | 13 +++
>>>>   drivers/platform/x86/dell/Makefile          |  1 +
>>>>   drivers/platform/x86/dell/dell-wmi-pega.c   | 93 ++++++++++++++++++=
+++
>>>>   5 files changed, 195 insertions(+)
>>>>   create mode 100644 Documentation/wmi/devices/dell-wmi-pega.rst
>>>>   create mode 100644 drivers/platform/x86/dell/dell-wmi-pega.c
>>>>
>>>> diff --git a/Documentation/wmi/devices/dell-wmi-pega.rst b/Documentat=
ion/wmi/devices/dell-wmi-pega.rst
>>>> new file mode 100644
>>>> index 000000000000..935c8511594b
>>>> --- /dev/null
>>>> +++ b/Documentation/wmi/devices/dell-wmi-pega.rst
>>>> @@ -0,0 +1,82 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>>>> +
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +Dell All-In-One Series Platform Integration (dell-wmi-pega)
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +Introduction
>>>> +------------
>>>> +
>>>> +Many Dell All-In-One devices contain a WMI device for notifying the =
underlying platform
>>>> +of various OS-specific events like power up, shutdown and backlight =
brightness control.
>>>> +
>>>> +Not implementing support for this WMI device might prevent hotkeys e=
xposed over WMI from
>>>> +working on some models.
>>>> +
>>>> +WMI interface description
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>>> +
>>>> +The WMI interface description can be decoded from the embedded binar=
y MOF (bmof)
>>>> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>>>> +
>>>> +::
>>>> +
>>>> + [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>>>> +  Description("Class used to operate method - WMBC"),
>>>> +  guid("{2D703EE8-36AC-4F88-BDB5-7556CE6B2946}") : ToInstance]
>>>> + class AcpiOSD_WMBC_method : WMIMethod {
>>>> +
>>>> +   [key, read]
>>>> +   string InstanceName;
>>>> +
>>>> +   [read]
>>>> +   boolean Active;
>>>> +
>>>> +   [WmiMethodId(1), Implemented, read, write,
>>>> +    Description("Invoked by AP when system up.")]
>>>> +   void PegaOemNotificationStartUp([out, Description("Return Value")=
] uint32 RetVal);
>>>> +
>>>> +   [WmiMethodId(2), Implemented, read, write,
>>>> +    Description("Invoked by AP when system is going to off state.")]
>>>> +   void PegaOemNotificationStop([out, Description("Return Value")] u=
int32 RetVal);
>>>> +
>>>> +   [WmiMethodId(3), Implemented, read, write,
>>>> +    Description("Invoked by Application to tune up brightness.")]
>>>> +   void PegaOemNotificationBrightnessUP([out, Description("Return Va=
lue")] uint32 RetVal);
>>>> +
>>>> +   [WmiMethodId(4), Implemented, read, write,
>>>> +    Description("Invoked by Application to tune down brightness.")]
>>>> +   void PegaOemNotificationBrightnessDown([out, Description("Return =
Value")] uint32 RetVal);
>>>> +
>>>> +   [WmiMethodId(5), Implemented, read, write, Description("Reserved.=
")]
>>>> +   void PegaOemNotificationRSVD1([out, Description("Return Value")] =
uint32 RetVal);
>>>> +
>>>> +   [WmiMethodId(6), Implemented, read, write, Description("Reserved.=
")]
>>>> +   void PegaOemNotificationRSVD2([out, Description("Return Value")] =
uint32 RetVal);
>>>> + };
>>>> +
>>>> +The return value of each WMI method should be equal to the WMI metho=
d ID.
>>>> +
>>>> +WMI method PegaOemNotificationStartUp()
>>>> +---------------------------------------
>>>> +
>>>> +Notifies the platform that the OS is operational. On some models thi=
s WMI method also enables
>>>> +reporting of hotkey events over WMI.
>>>> +
>>>> +WMI method PegaOemNotificationStop()
>>>> +------------------------------------
>>>> +
>>>> +Notifies the platform that the OS is shutting down.
>>>> +
>>>> +WMI method PegaOemNotificationBrightnessUP()
>>>> +--------------------------------------------
>>>> +
>>>> +Notifies the platform that the user wants to increase the backlight =
brightness. This WMI method
>>>> +usually only forwards this request to the acpi-video driver, so the =
dell-wmi-pega driver does
>>>> +not use it.
>>> Could these paragraphs be reflowed to 80 chars as long textual lines a=
re
>>> harder to read (eye movement required).
>> Sure, will do.
>>
>>>> +WMI method PegaOemNotificationBrightnessDown()
>>>> +----------------------------------------------
>>>> +
>>>> +Notifies the platform that the user wants to decrease the backlight =
brightness. See
>>>> +``PegaOemNotificationBrightnessUP()`` for details.
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index bd31e734669e..fb9a80f96900 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -7534,6 +7534,12 @@ M:    Pali Roh=C3=A1r <pali@kernel.org>
>>>>   S:    Maintained
>>>>   F:    drivers/platform/x86/dell/dell-wmi-base.c
>>>>   +DELL WMI PEGA DRIVER
>>>> +M:    Armin Wolf <W_Armin@gmx.de>
>>>> +S:    Odd Fixes
>>>> +F:    Documentation/wmi/devices/dell-wmi-pega.rst
>>>> +F:    drivers/platform/x86/dell/dell-wmi-pega.c
>>>> +
>>>>   DELL WMI SYSMAN DRIVER
>>>>   M:    Prasanth Ksr <prasanth.ksr@dell.com>
>>>>   L:    Dell.Client.Kernel@dell.com
>>>> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86=
/dell/Kconfig
>>>> index 9f0016056d7e..289379383ccb 100644
>>>> --- a/drivers/platform/x86/dell/Kconfig
>>>> +++ b/drivers/platform/x86/dell/Kconfig
>>>> @@ -228,6 +228,7 @@ config DELL_WMI_AIO
>>>>       depends on ACPI_WMI
>>>>       depends on INPUT
>>>>       select INPUT_SPARSEKMAP
>>>> +    imply DELL_WMI_PEGA
>>>>       help
>>>>         Say Y here if you want to support WMI-based hotkeys on Dell
>>>>         All-In-One machines.
>>>> @@ -262,6 +263,18 @@ config DELL_WMI_LED
>>>>         This adds support for the Latitude 2100 and similar
>>>>         notebooks that have an external LED.
>>>>   +config DELL_WMI_PEGA
>>>> +    tristate "Dell WMI AIO Platform Support"
>>>> +    default m
>>>> +    depends on ACPI_WMI
>>>> +    help
>>>> +      This option adds support for WMI-based platform integration on=
 Dell All-In-One machines.
>>>> +      This driver is necessary for enabling the delivery of hotkey e=
vents to the dell-wmi-aio
>>>> +      driver on some machines.
>>>> +
>>>> +      To compile this drivers as a module, choose M here: the module=
 will be called
>>>> +      dell-wmi-pega.
>>>> +
>>>>   config DELL_WMI_SYSMAN
>>>>       tristate "Dell WMI-based Systems management driver"
>>>>       default m
>>>> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x8=
6/dell/Makefile
>>>> index 470874c6e6e6..46c91c240a2c 100644
>>>> --- a/drivers/platform/x86/dell/Makefile
>>>> +++ b/drivers/platform/x86/dell/Makefile
>>>> @@ -27,5 +27,6 @@ obj-$(CONFIG_DELL_WMI_AIO)            +=3D dell-wmi=
-aio.o
>>>>   obj-$(CONFIG_DELL_WMI_DESCRIPTOR)        +=3D dell-wmi-descriptor.o
>>>>   obj-$(CONFIG_DELL_WMI_DDV)            +=3D dell-wmi-ddv.o
>>>>   obj-$(CONFIG_DELL_WMI_LED)            +=3D dell-wmi-led.o
>>>> +obj-$(CONFIG_DELL_WMI_PEGA)            +=3D dell-wmi-pega.o
>>>>   obj-$(CONFIG_DELL_WMI_SYSMAN)            +=3D dell-wmi-sysman/
>>>>   obj-$(CONFIG_DELL_DW5826E_RESET)        +=3D dell-dw5826e-reset.o
>>>> diff --git a/drivers/platform/x86/dell/dell-wmi-pega.c b/drivers/plat=
form/x86/dell/dell-wmi-pega.c
>>>> new file mode 100644
>>>> index 000000000000..ddb1b6cc6b1c
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/dell/dell-wmi-pega.c
>>>> @@ -0,0 +1,93 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * WMI platform integration for Dell All-In-One series.
>>>> + *
>>>> + * Copyright (C) 2026 Armin Wolf <W_Armin@gmx.de>
>>>> + *
>>>> + * Based on earlier work by Teodora <teolyub@gmail.com>.
>>>> + */
>>>> +
>>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>>> +
>>>> +#include <linux/cleanup.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/device/driver.h>
>>>> +#include <linux/dev_printk.h>
>>>> +#include <linux/kernel.h>
>>> What for is this?
>>> I suspect direct device.h include isn't necessary either (and it's
>>> anyway guaranteed to come through wmi.h).
>> Good question, i copied it from one of the other WMI drivers.
>>
>> I will remove both includes in the next revision.
>>
>>>> +#include <linux/module.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/types.h>
>>>> +#include <linux/wmi.h>
>>>> +
>>>> +#define PEGA_GUID    "2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
>>>> +
>>>> +enum dell_pega_method {
>>>> +    DELL_PEGA_NOTIFICATION_STARTUP        =3D 0x01,
>>>> +    DELL_PEGA_NOTIFICATION_STOP        =3D 0x02,
>>>> +    DELL_PEGA_NOTIFICATION_BRIGHTNESS_UP    =3D 0x03,
>>>> +    DELL_PEGA_NOTIFICATION_BRIGHTNESS_DOWN    =3D 0x04,
>>>> +    DELL_PEGA_NOTIFICATION_RESERVED_1    =3D 0x05,
>>>> +    DELL_PEGA_NOTIFICATION_RESERVED_2    =3D 0x06,
>>>> +};
>>>> +
>>>> +static int dell_wmi_pega_invoke(struct wmi_device *wdev, enum dell_p=
ega_method method)
>>>> +{
>>>> +    struct wmi_buffer input =3D { };
>>>> +    struct wmi_buffer output;
>>>> +    int ret;
>>>> +
>>>> +    ret =3D wmidev_invoke_method(wdev, 0x0, method, &input, &output,=
 sizeof(__le32));
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    __le32 *result __free(kfree) =3D output.data;
>>>> +    /* The return value should always be equal to the WMI method ID =
*/
>>>> +    if (le32_to_cpu(*result) !=3D method)
>>> Include for le32_to_cpu()
>> What would be the correct include for this?
>>
>>>> +        return -EIO;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int dell_wmi_pega_probe(struct wmi_device *wdev, const void *=
context)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STARTU=
P);
>>>> +    if (ret < 0)
>>>> +        dev_err(&wdev->dev,
>>>> +            "Failed to notify platform of startup, some hotkeys migh=
t not work\n");
>>> braces for multiline constructs.
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static void dell_wmi_pega_shutdown(struct wmi_device *wdev)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STOP);
>>>> +    if (ret < 0)
>>>> +        dev_warn(&wdev->dev, "Failed to notify platform of shutdown\=
n");
>>>> +}
>>>> +
>>>> +static const struct wmi_device_id dell_wmi_pega_id_table[] =3D {
>>>> +    { PEGA_GUID, NULL },
>>>> +    { }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(wmi, dell_wmi_pega_id_table);
>>>> +
>>>> +static struct wmi_driver dell_wmi_pega_driver =3D {
>>>> +    .driver =3D {
>>>> +        .name =3D "dell-wmi-pega",
>>>> +        .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>>>> +    },
>>>> +    .id_table =3D dell_wmi_pega_id_table,
>>>> +    .probe =3D dell_wmi_pega_probe,
>>>> +    .remove =3D dell_wmi_pega_shutdown,
>>>> +    .shutdown =3D dell_wmi_pega_shutdown,
>>>> +    .no_singleton =3D true,
>>>> +};
>>>> +module_wmi_driver(dell_wmi_pega_driver);
>>>> +
>>>> +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
>>>> +MODULE_DESCRIPTION("Dell All-In-One series platform integration");
>>>> +MODULE_LICENSE("GPL");
>>> Just the mandatory nitpicking :-), seems fine otherwise.
>> Thanks,
>>
>> i will wait with sending a v2 until Teodora has tested the second patch=
.
>>
>> Thanks,
>> Armin Wolf
