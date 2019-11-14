From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v7 4/8] firmware: Add new platform fallback mechanism and
 firmware_request_platform()
Date: Thu, 14 Nov 2019 12:32:11 +0100
Message-ID: <b09922ec-a71e-c1ca-adcc-15f7fd02c2f4@redhat.com>
References: <20191004145056.43267-1-hdegoede@redhat.com>
 <20191004145056.43267-5-hdegoede@redhat.com>
 <20191011152920.GQ16384@42.do-not-panic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011152920.GQ16384@42.do-not-panic.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 11-10-2019 17:29, Luis Chamberlain wrote:
> On Fri, Oct 04, 2019 at 04:50:52PM +0200, Hans de Goede wrote:
>> diff --git a/drivers/base/firmware_loader/Makefile b/drivers/base/firmwa=
re_loader/Makefile
>> index 0b2dfa6259c9..fec75895faae 100644
>> --- a/drivers/base/firmware_loader/Makefile
>> +++ b/drivers/base/firmware_loader/Makefile
>> @@ -3,7 +3,7 @@
>>  =20
>>   obj-$(CONFIG_FW_LOADER_USER_HELPER) +=3D fallback_table.o
>>   obj-$(CONFIG_FW_LOADER)=09+=3D firmware_class.o
>> -firmware_class-objs :=3D main.o
>> +firmware_class-objs :=3D main.o fallback_platform.o
>>   firmware_class-$(CONFIG_FW_LOADER_USER_HELPER) +=3D fallback.o
>=20
> Why not just:
>=20
> firmware_class-$(CONFIG_EFI_EMBEDDED_FIRMWARE) +=3D fallback_platform.o
>=20
>>   obj-y +=3D builtin/
>> diff --git a/drivers/base/firmware_loader/fallback.h b/drivers/base/firm=
ware_loader/fallback.h
>> index 21063503e4ea..c4350f2e7cc2 100644
>> --- a/drivers/base/firmware_loader/fallback.h
>> +++ b/drivers/base/firmware_loader/fallback.h
>> @@ -66,4 +66,6 @@ static inline void unregister_sysfs_loader(void)
>>   }
>>   #endif /* CONFIG_FW_LOADER_USER_HELPER */
>>  =20
>> +int firmware_fallback_platform(struct fw_priv *fw_priv, enum fw_opt opt=
_flags);
>> +
>=20
> Inline this if not defined.
>=20
>>   #endif /* __FIRMWARE_FALLBACK_H */
>> diff --git a/drivers/base/firmware_loader/fallback_platform.c b/drivers/=
base/firmware_loader/fallback_platform.c
>> new file mode 100644
>> index 000000000000..7e9d730e36bf
>> --- /dev/null
>> +++ b/drivers/base/firmware_loader/fallback_platform.c
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/efi_embedded_fw.h>
>> +#include <linux/property.h>
>> +#include <linux/security.h>
>> +#include <linux/vmalloc.h>
>> +
>> +#include "fallback.h"
>> +#include "firmware.h"
>> +
>> +int firmware_fallback_platform(struct fw_priv *fw_priv, enum fw_opt opt=
_flags)
>> +{
>> +#ifdef CONFIG_EFI_EMBEDDED_FIRMWARE
>=20
> And we can do away with this eyesore.

Ok will fix for the next version.

> Otherwise looks good!

Thanks.

Regards,

Hans
