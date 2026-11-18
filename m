Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983078;
	b=1NcnFq1F2oWuq+TLDOKw/qDdqdE+LvdNTrnPJNtxIT9MHBMBPypIh0onw38PvXREdiP0
	 4+0J604D4oFlb3kblcng5zd9lESaa14Vf00Wt+K3pODrYgKSQ9aNrf5xGsjYwhEMWaQYi
	 Dmzvwp8hOy5pPGDRWVe/Lli5/f1BKpQvV/PHOfSb40MpwRfLeZYF8VSqAdqSIvNtXZRz7
	 Tk9wuWoEv83s46B+x3r+tzVX5rf9tfVwpLS1sVIBOOP21E3ijWBePCQF+BtI05k/XGd5J
	 B+cQ25bt55gjBb/i8V/Ixpuw/0rsnMyo3iltFbZ7w6L6ZkeW2lOlIRtqYh55vU3LoGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Content-Transfer-Encoding:From:Mime-Version:Subject:Date:
	 Message-Id:References:Cc:In-Reply-To:To:X-Mailer;
	bh=na/KvaP9r6HHnCtVPiRJkOHiqbHZrFGDFwAb0LX3mh0=;
	b=XO0PeYyhpkd/9/0I748wcYn1TW202pFOqLXKMTQ4Ik/Lj3M4MPFCwoaaG0E3xWiq0Hib
	 zZI2ITt32/o45YiO0WgRQHTt/QCZ28eMPODzw4rKfF6npNd+3v+/1xIguwBX/awxFu+Xu
	 wEYCrUpBCxcIryLW1wgyVhOQ4HxaQvy3PylMvbpuV0xc3HsmW11Q0rZUDnC3SUqkisA/T
	 fqT4WPwq9Tup2txxSbt22+XjBUzbBRbWLCIMCLNW90QNF0ijOK8dZ6ZQnjP7T/RtvB3+/
	 QyUuUfbc+arBOgjLZ3oWC6228RUjKwnT0rxe7l5cqZTK/ktfuJt9ZOCbgzBQH9qw/+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AztHoGjR;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC54D606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 06:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC54D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AztHoGjR
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491971ac844so504297f8f.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 22:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983076; x=1795587876; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=na/KvaP9r6HHnCtVPiRJkOHiqbHZrFGDFwAb0LX3mh0=;
        b=AztHoGjRjFnPNy5DkAr00cNJqNbqzrXZSUaXAuai7KIeM8cqlWxyYmJoZp+NzNNzAX
         EP2Ue1M6w+ySbbDzoVCysgvgkynYoMX9NoCZ3uspbrx9bjdjAGXvKwnMZwNx4qvt4Vnw
         i6I9Z+b2DPJOh2Kz+TYg7vl45VpSabfQWg7OI4QSJ8Nln2pO9VUxqjZt8HSRP3tLA6cy
         8glPMVNCJeE1+OqCEcuWGuVxetJ7/b959CY2XItoIpOVdeEFe1u/vQQyiNQsby6KdGU0
         zo8Ad7d8jIu3MGdeCwcklXRk+5C7RP3vk2OMYEQW3qlbpm1aCwFRBLYVo4PkTg3QEisb
         lRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983076; x=1795587876;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=na/KvaP9r6HHnCtVPiRJkOHiqbHZrFGDFwAb0LX3mh0=;
        b=H0VKSaQX2vtTST/TUZIOiQ2uFyUG69LlO2uTcGi9k8IE3xa08NhSanQPPLmgpJDimX
         sYfqsFqAh99crt85D2MKoNX5ItMDWwWBn/S19xi80721+Sbj8hcfxAXq65y1DezQ51n4
         Bv9YwJWsx8njF1WE3htm9gr7I+9c1kllh904NFxtkI6dqHbQ7MIMc4WTidKIdyd7q5iO
         TCOKNQ/GddQVBD/eBA7ZpWWAsiQEFyBUZa6xEokRyiWCUeEH7dh92K4t1e1y0qFrv0It
         nVix4P2jYbXBgV3KGC0xOkTEDpAjs3QBy1dXPCw/MVwUizCkkRuwiMo0l/yNOGLiqwWm
         VjPQ==
X-Forwarded-Encrypted: i=1; AL+hErFn+NS93dvJFXscJxl6VlDESF+k28ZsF2SlWPHE+8zqVU4Dc7Q4q+6DxvC8QkLZihAiWvtWu5kZDold9tpWlYb1yhY1@vger.kernel.org
X-Gm-Message-State: APuU4Z/piAMgXV2nyKYoNcFJfbK0Gh3FPd7qWrNMyh5g0SSh5z4IvIHv
	ofIlpgQj9MTbVdm9Mt/v4y9Rfneep+AnDm42pJUfJZzzrnV9vks1zFKk
X-Gm-Gg: AZFdTZfU69zgcem6enEQ5fgge6WdhWetvCKidpCwTbV3R59Ez1cs8a80FeUmq2R+wKT
	mqvWTslRn9Fx3cDJJSn9r7d/Yvq9LCFhHawoVwPoDKJv4PS8WydhfrOJzDcXV62QgT1bcHfxHRM
	hcHPE49w004/KsQXNYkU2lZBchSBcfC9Yttm5t6kHu6Asn+pJwajaPeSUmPgD9PdpeO/rPOcnsb
	yfk/V9JyHSzam7QB0Gd2NPFnYMZgLf1TqrN/3HGOYVh4KS7T2disenkIVOM1FCSJ29MLsOkhhXH
	oSzMMXKRhOWAeurFiIgfiiWnYynrXbTbD9f1xuJOM6gp+KwWoKjiCbYui/s2xGkwI4lPkKiR1wJ
	9GGB7SnMCvNcsgK060blq/sbWLsO/Q+5sS9DfdYCza1ytqFeaF02p9ah8ofXZ5D9flA71SKuMIm
	iMD5A+GCZzOCyHkYkzwuFdbvJNATB+bnIzI11kILNVPHYFGlhjNZAoXHSqnp3OVlPmgEk2eMGTs
	jwNDzQS4pstgvSX6JIH7opp5/abLYD31BpjwobnY7skKvfJXZ4uGKVGwUoTOucx6XN/gmfZIi1Y
	po06YMQFdr5opNOlS/huy53mwINzV7kKqW8wi2sE9VI7KPtNW6T+8X8XvTY5TE7GnMftD9t6R0Q
	YrFz1b7TxxSqAJI3wsjwgW38biu5xba2AP+o=
X-Received: by 2002:a05:6000:4812:b0:490:6fbc:9457 with SMTP id ffacd0b85a97d-4a63c18831bmr3346488f8f.41.1794983075935;
        Tue, 17 Nov 2026 22:24:35 -0800 (PST)
Received: from smtpclient.apple ([2a05:b100:188e:3c00:e0ee:5dba:4f48:db8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm2289481f8f.15.2026.11.17.22.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:24:34 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: teolyub@gmail.com
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/2] platform/x86: dell: Add new dell-wmi-pega driver
Date: Wed, 18 Nov 2026 06:24:22 +0000
Message-Id: <5C8178E2-6BDF-4110-82FA-0AA4628DEFB6@gmail.com>
References: <848ebb18-b9bf-4747-9403-fa8da4fba2ad@gmx.de>
Cc: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <848ebb18-b9bf-4747-9403-fa8da4fba2ad@gmx.de>
To: Armin Wolf <W_Armin@gmx.de>
X-Mailer: iPhone Mail (24A446)

Hi all - please proceed with the patch and thank you all for your work!

Sent from my mighty iPhone 13 mini

> On 17 Nov 2026, at 22:31, Armin Wolf <W_Armin@gmx.de> wrote:
>=20
> =EF=BB=BFAm 17.11.26 um 23:17 schrieb Ilpo J=C3=A4rvinen:
>>> On Tue, 17 Nov 2026, Armin Wolf wrote:
>>> A user has reported that the WMI hotkey events on Dell All-In-One
>>> machines need to be manually enabled on some models thru a separate
>>> WMI device. This WMI device seems to be present on many other models
>>> but has no effect on them.
>> Can you rephrase this to not textually depend on "user" or "user's
>> report", just state what the problem is, not how you became aware of it.
>>> Add a small driver for enabling support for this WMI device. This
>>> enables the HDMI Input key on the Dell OptiPlex 7400 All-in-One
>>> machine.
>>>=20
>>> Reported-by: Teodora <teolyub@gmail.com>
>>> Closes: https://lore.kernel.org/platform-driver-x86/0TZENT.54P2IBFQRED22=
@gmail.com
>>> Tested-by: Teodora <teolyub@gmail.com>
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---
>>>  Documentation/wmi/devices/dell-wmi-pega.rst | 82 ++++++++++++++++++
>>>  MAINTAINERS                                 |  6 ++
>>>  drivers/platform/x86/dell/Kconfig           | 13 +++
>>>  drivers/platform/x86/dell/Makefile          |  1 +
>>>  drivers/platform/x86/dell/dell-wmi-pega.c   | 93 +++++++++++++++++++++
>>>  5 files changed, 195 insertions(+)
>>>  create mode 100644 Documentation/wmi/devices/dell-wmi-pega.rst
>>>  create mode 100644 drivers/platform/x86/dell/dell-wmi-pega.c
>>>=20
>>> diff --git a/Documentation/wmi/devices/dell-wmi-pega.rst b/Documentation=
/wmi/devices/dell-wmi-pega.rst
>>> new file mode 100644
>>> index 000000000000..935c8511594b
>>> --- /dev/null
>>> +++ b/Documentation/wmi/devices/dell-wmi-pega.rst
>>> @@ -0,0 +1,82 @@
>>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +Dell All-In-One Series Platform Integration (dell-wmi-pega)
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Introduction
>>> +------------
>>> +
>>> +Many Dell All-In-One devices contain a WMI device for notifying the und=
erlying platform
>>> +of various OS-specific events like power up, shutdown and backlight bri=
ghtness control.
>>> +
>>> +Not implementing support for this WMI device might prevent hotkeys expo=
sed over WMI from
>>> +working on some models.
>>> +
>>> +WMI interface description
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>> +
>>> +The WMI interface description can be decoded from the embedded binary M=
OF (bmof)
>>> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>>> +
>>> +::
>>> +
>>> + [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>>> +  Description("Class used to operate method - WMBC"),
>>> +  guid("{2D703EE8-36AC-4F88-BDB5-7556CE6B2946}") : ToInstance]
>>> + class AcpiOSD_WMBC_method : WMIMethod {
>>> +
>>> +   [key, read]
>>> +   string InstanceName;
>>> +
>>> +   [read]
>>> +   boolean Active;
>>> +
>>> +   [WmiMethodId(1), Implemented, read, write,
>>> +    Description("Invoked by AP when system up.")]
>>> +   void PegaOemNotificationStartUp([out, Description("Return Value")] u=
int32 RetVal);
>>> +
>>> +   [WmiMethodId(2), Implemented, read, write,
>>> +    Description("Invoked by AP when system is going to off state.")]
>>> +   void PegaOemNotificationStop([out, Description("Return Value")] uint=
32 RetVal);
>>> +
>>> +   [WmiMethodId(3), Implemented, read, write,
>>> +    Description("Invoked by Application to tune up brightness.")]
>>> +   void PegaOemNotificationBrightnessUP([out, Description("Return Value=
")] uint32 RetVal);
>>> +
>>> +   [WmiMethodId(4), Implemented, read, write,
>>> +    Description("Invoked by Application to tune down brightness.")]
>>> +   void PegaOemNotificationBrightnessDown([out, Description("Return Val=
ue")] uint32 RetVal);
>>> +
>>> +   [WmiMethodId(5), Implemented, read, write, Description("Reserved.")]=

>>> +   void PegaOemNotificationRSVD1([out, Description("Return Value")] uin=
t32 RetVal);
>>> +
>>> +   [WmiMethodId(6), Implemented, read, write, Description("Reserved.")]=

>>> +   void PegaOemNotificationRSVD2([out, Description("Return Value")] uin=
t32 RetVal);
>>> + };
>>> +
>>> +The return value of each WMI method should be equal to the WMI method I=
D.
>>> +
>>> +WMI method PegaOemNotificationStartUp()
>>> +---------------------------------------
>>> +
>>> +Notifies the platform that the OS is operational. On some models this W=
MI method also enables
>>> +reporting of hotkey events over WMI.
>>> +
>>> +WMI method PegaOemNotificationStop()
>>> +------------------------------------
>>> +
>>> +Notifies the platform that the OS is shutting down.
>>> +
>>> +WMI method PegaOemNotificationBrightnessUP()
>>> +--------------------------------------------
>>> +
>>> +Notifies the platform that the user wants to increase the backlight bri=
ghtness. This WMI method
>>> +usually only forwards this request to the acpi-video driver, so the del=
l-wmi-pega driver does
>>> +not use it.
>> Could these paragraphs be reflowed to 80 chars as long textual lines are
>> harder to read (eye movement required).
>=20
> Sure, will do.
>=20
>>> +WMI method PegaOemNotificationBrightnessDown()
>>> +----------------------------------------------
>>> +
>>> +Notifies the platform that the user wants to decrease the backlight bri=
ghtness. See
>>> +``PegaOemNotificationBrightnessUP()`` for details.
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index bd31e734669e..fb9a80f96900 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -7534,6 +7534,12 @@ M:    Pali Roh=C3=A1r <pali@kernel.org>
>>>  S:    Maintained
>>>  F:    drivers/platform/x86/dell/dell-wmi-base.c
>>>  +DELL WMI PEGA DRIVER
>>> +M:    Armin Wolf <W_Armin@gmx.de>
>>> +S:    Odd Fixes
>>> +F:    Documentation/wmi/devices/dell-wmi-pega.rst
>>> +F:    drivers/platform/x86/dell/dell-wmi-pega.c
>>> +
>>>  DELL WMI SYSMAN DRIVER
>>>  M:    Prasanth Ksr <prasanth.ksr@dell.com>
>>>  L:    Dell.Client.Kernel@dell.com
>>> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/de=
ll/Kconfig
>>> index 9f0016056d7e..289379383ccb 100644
>>> --- a/drivers/platform/x86/dell/Kconfig
>>> +++ b/drivers/platform/x86/dell/Kconfig
>>> @@ -228,6 +228,7 @@ config DELL_WMI_AIO
>>>      depends on ACPI_WMI
>>>      depends on INPUT
>>>      select INPUT_SPARSEKMAP
>>> +    imply DELL_WMI_PEGA
>>>      help
>>>        Say Y here if you want to support WMI-based hotkeys on Dell
>>>        All-In-One machines.
>>> @@ -262,6 +263,18 @@ config DELL_WMI_LED
>>>        This adds support for the Latitude 2100 and similar
>>>        notebooks that have an external LED.
>>>  +config DELL_WMI_PEGA
>>> +    tristate "Dell WMI AIO Platform Support"
>>> +    default m
>>> +    depends on ACPI_WMI
>>> +    help
>>> +      This option adds support for WMI-based platform integration on De=
ll All-In-One machines.
>>> +      This driver is necessary for enabling the delivery of hotkey even=
ts to the dell-wmi-aio
>>> +      driver on some machines.
>>> +
>>> +      To compile this drivers as a module, choose M here: the module wi=
ll be called
>>> +      dell-wmi-pega.
>>> +
>>>  config DELL_WMI_SYSMAN
>>>      tristate "Dell WMI-based Systems management driver"
>>>      default m
>>> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/d=
ell/Makefile
>>> index 470874c6e6e6..46c91c240a2c 100644
>>> --- a/drivers/platform/x86/dell/Makefile
>>> +++ b/drivers/platform/x86/dell/Makefile
>>> @@ -27,5 +27,6 @@ obj-$(CONFIG_DELL_WMI_AIO)            +=3D dell-wmi-ai=
o.o
>>>  obj-$(CONFIG_DELL_WMI_DESCRIPTOR)        +=3D dell-wmi-descriptor.o
>>>  obj-$(CONFIG_DELL_WMI_DDV)            +=3D dell-wmi-ddv.o
>>>  obj-$(CONFIG_DELL_WMI_LED)            +=3D dell-wmi-led.o
>>> +obj-$(CONFIG_DELL_WMI_PEGA)            +=3D dell-wmi-pega.o
>>>  obj-$(CONFIG_DELL_WMI_SYSMAN)            +=3D dell-wmi-sysman/
>>>  obj-$(CONFIG_DELL_DW5826E_RESET)        +=3D dell-dw5826e-reset.o
>>> diff --git a/drivers/platform/x86/dell/dell-wmi-pega.c b/drivers/platfor=
m/x86/dell/dell-wmi-pega.c
>>> new file mode 100644
>>> index 000000000000..ddb1b6cc6b1c
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/dell/dell-wmi-pega.c
>>> @@ -0,0 +1,93 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * WMI platform integration for Dell All-In-One series.
>>> + *
>>> + * Copyright (C) 2026 Armin Wolf <W_Armin@gmx.de>
>>> + *
>>> + * Based on earlier work by Teodora <teolyub@gmail.com>.
>>> + */
>>> +
>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>> +
>>> +#include <linux/cleanup.h>
>>> +#include <linux/device.h>
>>> +#include <linux/device/driver.h>
>>> +#include <linux/dev_printk.h>
>>> +#include <linux/kernel.h>
>> What for is this?
>> I suspect direct device.h include isn't necessary either (and it's
>> anyway guaranteed to come through wmi.h).
>=20
> Good question, i copied it from one of the other WMI drivers.
>=20
> I will remove both includes in the next revision.
>=20
>>> +#include <linux/module.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/types.h>
>>> +#include <linux/wmi.h>
>>> +
>>> +#define PEGA_GUID    "2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
>>> +
>>> +enum dell_pega_method {
>>> +    DELL_PEGA_NOTIFICATION_STARTUP        =3D 0x01,
>>> +    DELL_PEGA_NOTIFICATION_STOP        =3D 0x02,
>>> +    DELL_PEGA_NOTIFICATION_BRIGHTNESS_UP    =3D 0x03,
>>> +    DELL_PEGA_NOTIFICATION_BRIGHTNESS_DOWN    =3D 0x04,
>>> +    DELL_PEGA_NOTIFICATION_RESERVED_1    =3D 0x05,
>>> +    DELL_PEGA_NOTIFICATION_RESERVED_2    =3D 0x06,
>>> +};
>>> +
>>> +static int dell_wmi_pega_invoke(struct wmi_device *wdev, enum dell_pega=
_method method)
>>> +{
>>> +    struct wmi_buffer input =3D { };
>>> +    struct wmi_buffer output;
>>> +    int ret;
>>> +
>>> +    ret =3D wmidev_invoke_method(wdev, 0x0, method, &input, &output, si=
zeof(__le32));
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    __le32 *result __free(kfree) =3D output.data;
>>> +    /* The return value should always be equal to the WMI method ID */
>>> +    if (le32_to_cpu(*result) !=3D method)
>> Include for le32_to_cpu()
>=20
> What would be the correct include for this?
>=20
>>> +        return -EIO;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int dell_wmi_pega_probe(struct wmi_device *wdev, const void *con=
text)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STARTUP);=

>>> +    if (ret < 0)
>>> +        dev_err(&wdev->dev,
>>> +            "Failed to notify platform of startup, some hotkeys might n=
ot work\n");
>> braces for multiline constructs.
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static void dell_wmi_pega_shutdown(struct wmi_device *wdev)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STOP);
>>> +    if (ret < 0)
>>> +        dev_warn(&wdev->dev, "Failed to notify platform of shutdown\n")=
;
>>> +}
>>> +
>>> +static const struct wmi_device_id dell_wmi_pega_id_table[] =3D {
>>> +    { PEGA_GUID, NULL },
>>> +    { }
>>> +};
>>> +MODULE_DEVICE_TABLE(wmi, dell_wmi_pega_id_table);
>>> +
>>> +static struct wmi_driver dell_wmi_pega_driver =3D {
>>> +    .driver =3D {
>>> +        .name =3D "dell-wmi-pega",
>>> +        .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>>> +    },
>>> +    .id_table =3D dell_wmi_pega_id_table,
>>> +    .probe =3D dell_wmi_pega_probe,
>>> +    .remove =3D dell_wmi_pega_shutdown,
>>> +    .shutdown =3D dell_wmi_pega_shutdown,
>>> +    .no_singleton =3D true,
>>> +};
>>> +module_wmi_driver(dell_wmi_pega_driver);
>>> +
>>> +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
>>> +MODULE_DESCRIPTION("Dell All-In-One series platform integration");
>>> +MODULE_LICENSE("GPL");
>> Just the mandatory nitpicking :-), seems fine otherwise.
>=20
> Thanks,
>=20
> i will wait with sending a v2 until Teodora has tested the second patch.
>=20
> Thanks,
> Armin Wolf
