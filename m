Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C9C440A26
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 18:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362138; cv=none; b=e0SP4y4n4tBc2m6NNo7OxQfzYbuDSuNRj60MSGk5hw2Mq+cjAQwEPyCnImWlmTzhlReRmmHjKSx/GqTBwfnZX7CtBv9mKMEM/Vk341ahtJlfhLIuQf3avFLl9YgjHLz11GAjt87+SRHt3wznydcTGKtGBJ9AecvJ9krjblAEUa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362138; c=relaxed/simple;
	bh=X08H0OSq7MAXRMtWVx+2yXFWbe9mOdvCXV0iWxhQd/4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mQroqHbWvQ5yviAnMgPQLCbQS9rExy+R/TJRZfs+7O8Wq+WsDplf8GZZFpJlVZfN8zQXmtV4L91jMZplQ0mBLYGiPzUWSECvnRgG+L6O6RXxzHG3VaZrfnhzPGIgQoEZr3JzuX3uaP+9xhicg9Dx02YSIsgdZbDwI1W4af2RSzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=L+X+u3S9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=r+C6jzGC; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="L+X+u3S9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="r+C6jzGC"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 2FAA61D000D1;
	Fri, 25 Sep 2026 14:48:55 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 25 Sep 2026 14:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790362135;
	 x=1790448535; bh=1MdsHn8JEIJV+qqX6hiOIDRBqcglntrFyPwq7blHJlI=; b=
	L+X+u3S9DEKIb96D2KDt6jRhGoXBdUx26yd8pO11HxFkXo35useDa6Eph91MV4wU
	0KLHBVQZ5Y5eDYUnMsVbQ91fPMX3S5noD5k33qribIeO4CMyTDNpGHfzw/yp7K1j
	SYHzsup01Voof6/VwLy+zN3KtDz4D7dYELQo0Fm3Wotv7/Q8j1P09mYJsMDZBk9i
	DEn6Aendv2pzo3gBjyx3wBy1HXou4wVboEk/vbSTiOnMoVTd1EdJ1eMSiuzPghgQ
	iUpsfENktgjhbNHIqDOZTRFbSCCo8zG2yFniwMBojrO84g04ntdtjJGLzFoIO7K7
	xBm0qJKrfzw5fUZcGt7O1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790362135; x=
	1790448535; bh=1MdsHn8JEIJV+qqX6hiOIDRBqcglntrFyPwq7blHJlI=; b=r
	+C6jzGCjeYFP9lJljskg5Rhq1HpzZW0mTr+cKUkoBCo6MGO2rZPYcfRNTjezPSzg
	aKkUFXaIl9OBc+rbjTqjnJgWjqVVkn9N+r936H4L6ecTZb9d9sErJkiC3uMM8Ru2
	kiG12ekpISvjwin55/k4TvLW9mepVLPVjpxBBv2wmKzLlx3ictUBC65AAjdwIqiu
	08GjrUEByggTh+G6ivrNyJgAbO3ivDSuFGU/O+W65qprzgRBYYcNymt7qjTsiD4/
	QzGggtfBDuZE9ZsPLVprEDTXzLaaa9HkDdrEJqdzctgzsz17+/oOeB3DdATVmOUB
	TfPQxwAB2mkxo6/A9zkDg==
X-ME-Sender: <xms:FsK2amFHXRDJyMQKq4Uq31fkmu7kfKshHlugomB51ee08GfYTTmhpw>
    <xme:FsK2aiJe04ypBkKxWfpKAmw5FYMQQhvICsZNHUwiLs20Q3i2mtKv-nDAjdJJI18uc
    2v4NqiHEJQRWCLOe1fJy4NIApX9m0dGdu2o6OakXRWjYMTVHP5e44ap>
X-ME-Proxy-Cause: dmFkZTEq4tf8P8WothA4UcM99Z6cEbuPPVNOZVS/PBlTebQnwVMETOd5CMLsux4Ei5n0eY
    G/Zj5tI2oORUUrxjyoOjPS/NS0FlTA3eMVVkUAsLPy5SiOJ1kYwNeWyl5I1m5fYzE0sl9p
    /iyC6ceNongRQxisfEg8bW0q8TS5VGLvcc1I8gWV8DrrmDX+ORogLL7oSo5lrKU/GLhCsO
    KbCTmJNWErgu8nuBJ0hR/FyQB/m100iovu6/36SMJLwrXyk6vpKOwlO57iQO5gx4wBe5U0
    pPnerqE3l8QP2HvJhJsPyt5875xGMwoWdV3usb4hWQYTgx0Wbc1wkJ3NzMoiEvFcZbqHpz
    3GIGkT9Pi0nlAygDh/AyC2aAV1ysbw7bitwQ2p26zoldT4VB91VBgtFuFo31qIgLX0LmVE
    HMgAftvBSwNBFFbv2JJnbUk3VKXvXH8WbKv6yeSqhcT2w7WlvQvQ37Aysbj5d3R2j6I+xf
    zlg47ARqFrN8+5Fcn0Mb3qCR/lIlLCIXYg+mIJNy5tqroIZUh43kx/WnrNo9boAVfpPl95
    BAJ1esUQAFDoMODDR0kZfBs+J6g9NYJduPWPVrQ+xxPC9m5Wxf0ADybNgiNemQu4OmWQ3/
    ol4zKrvF2ii6mqCFxiG8hsEnBPvGdEIxB6cH9uqOBunr/AaFOTbmRi8bPoPg
X-ME-Proxy: <xmx:F8K2ansIVDKzfYjacXr4fJpuew-P0rOnxIZLf8hDLawa-fkaiioUZA>
    <xmx:F8K2aih-F7vs_3HFPiVA9r640Gn7hhzEE7LEVL9n5d1XUZQ8UeiF-g>
    <xmx:F8K2aqoCEzXO5cwc9_oNN3MsSADREdRXw4BUKT_hyoI5sGgzAJelpQ>
    <xmx:F8K2anvZnRz2-XebVrr0O5KoJGfafAV5mdafNQdAfHD8d1aI3no3-A>
    <xmx:F8K2avJisX-NUEcEhmEOP3zWhXDBeY_Y5G9OtviILoNivYR98QU4BViA>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id D48852C0006C; Fri, 25 Sep 2026 14:48:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AofVpfDJIkHw
Date: Fri, 25 Sep 2026 14:48:34 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: "Prasanth Ksr" <prasanth.ksr@dell.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, Dell.Client.Kernel@dell.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <3eb32163-6c02-4d2a-9f45-d46c73329199@app.fastmail.com>
In-Reply-To: <39972b87-3ace-4e91-b7e1-59d8d656dc67@gmx.de>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-3-mpearson-lenovo@squebb.ca>
 <39972b87-3ace-4e91-b7e1-59d8d656dc67@gmx.de>
Subject: Re: [RFC PATCH 2/7] platform/x86: think-lmi: think-lmi driver to load v1 or v2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Sep 25, 2026, at 2:40 PM, Armin Wolf wrote:
> Am 25.09.26 um 18:00 schrieb Mark Pearson:
>
>> More preparation for think-lmi-v2 driver.
>>
>> Create think-lmi driver that will be able to determine if v1 or v2
>> driver should be used.
>>
>> Add main GUIDs into think-lmi.h file
>
> Wouldn't it be easier if think-lmi-v1 simply checks if TLMI_V2_BIOS_SETTING_GUID
> exists during probe and simply aborts if that happens to be the case?
>
Hmmm....good point. That would be simpler.
I tried something like that early on but I can't remember why I bailed on it. I'll take a second look.

Mark

> Thanks,
> Armin Wolf
>
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>>   drivers/platform/x86/lenovo/Makefile       |  1 +
>>   drivers/platform/x86/lenovo/think-lmi-v1.c | 36 +++-----
>>   drivers/platform/x86/lenovo/think-lmi.c    | 99 ++++++++++++++++++++++
>>   drivers/platform/x86/lenovo/think-lmi.h    |  6 ++
>>   4 files changed, 120 insertions(+), 22 deletions(-)
>>   create mode 100644 drivers/platform/x86/lenovo/think-lmi.c
>>
>> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
>> index 98a3baa45fa6..c404cff99d35 100644
>> --- a/drivers/platform/x86/lenovo/Makefile
>> +++ b/drivers/platform/x86/lenovo/Makefile
>> @@ -4,6 +4,7 @@
>>   # Lenovo x86 Platform Specific Drivers
>>   #
>>   obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
>> +obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>>   obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi-v1.o
>>   obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>>   
>> diff --git a/drivers/platform/x86/lenovo/think-lmi-v1.c b/drivers/platform/x86/lenovo/think-lmi-v1.c
>> index e215e86e3db7..26a62e1a709b 100644
>> --- a/drivers/platform/x86/lenovo/think-lmi-v1.c
>> +++ b/drivers/platform/x86/lenovo/think-lmi-v1.c
>> @@ -34,7 +34,7 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
>>    * Returns: "Item,Value"
>>    * Example: "WakeOnLAN,Enable"
>>    */
>> -#define LENOVO_BIOS_SETTING_GUID "51F5230E-9677-46CD-A1CF-C0B23EE34DB7"
>> +#define LENOVO_BIOS_SETTING_GUID TLMI_V1_BIOS_SETTING_GUID
>>   
>>   /*
>>    * Name: SetBiosSetting
>> @@ -233,6 +233,7 @@ static const char * const level_options[] = {
>>   };
>>   static struct think_lmi tlmi_priv;
>>   static DEFINE_MUTEX(tlmi_mutex);
>> +static bool tlmi_initialised;
>>   
>>   static inline struct tlmi_pwd_setting *to_tlmi_pwd_setting(struct kobject *kobj)
>>   {
>> @@ -1818,13 +1819,17 @@ static int tlmi_analyze(struct wmi_device *wdev)
>>   	return ret;
>>   }
>>   
>> -static void tlmi_remove(struct wmi_device *wdev)
>> +void tlmi_v1_remove(struct wmi_device *wdev)
>>   {
>> -	tlmi_release_attr();
>> -	device_unregister(tlmi_priv.class_dev);
>> +	if (tlmi_initialised) {
>> +		tlmi_release_attr();
>> +		device_unregister(tlmi_priv.class_dev);
>> +		tlmi_initialised = false;
>> +	}
>>   }
>> +EXPORT_SYMBOL(tlmi_v1_remove);
>>   
>> -static int tlmi_probe(struct wmi_device *wdev, const void *context)
>> +int tlmi_v1_initialise(struct wmi_device *wdev, const void *context)
>>   {
>>   	int ret;
>>   
>> @@ -1832,23 +1837,11 @@ static int tlmi_probe(struct wmi_device *wdev, const void *context)
>>   	if (ret)
>>   		return ret;
>>   
>> -	return tlmi_sysfs_init();
>> +	ret = tlmi_sysfs_init();
>> +	tlmi_initialised = true;
>> +	return ret;
>>   }
>> -
>> -static const struct wmi_device_id tlmi_id_table[] = {
>> -	{ .guid_string = LENOVO_BIOS_SETTING_GUID },
>> -	{ }
>> -};
>> -MODULE_DEVICE_TABLE(wmi, tlmi_id_table);
>> -
>> -static struct wmi_driver tlmi_driver = {
>> -	.driver = {
>> -		.name = "think-lmi",
>> -	},
>> -	.id_table = tlmi_id_table,
>> -	.probe = tlmi_probe,
>> -	.remove = tlmi_remove,
>> -};
>> +EXPORT_SYMBOL(tlmi_v1_initialise);
>>   
>>   MODULE_AUTHOR("Sugumaran L <slacshiminar@lenovo.com>");
>>   MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
>> @@ -1856,4 +1849,3 @@ MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>");
>>   MODULE_DESCRIPTION("ThinkLMI Driver");
>>   MODULE_LICENSE("GPL");
>>   
>> -module_wmi_driver(tlmi_driver);
>> diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
>> new file mode 100644
>> index 000000000000..da1e54dab2d1
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>> @@ -0,0 +1,99 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Think LMI BIOS configuration supprt driver
>> + *
>> + * Copyright(C) 2025 Lenovo
>> + *
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/errno.h>
>> +#include <linux/fs.h>
>> +#include <linux/types.h>
>> +#include <linux/wmi.h>
>> +#include "think-lmi.h"
>> +
>> +#define THINKLMI_DEVICE(guid, version)		\
>> +	.guid_string = (guid),			\
>> +	.context = &(const unsigned int){version}
>> +
>> +static int use_version;
>> +module_param(use_version, int, 0444);
>> +MODULE_PARM_DESC(use_version, "Force use of version (1 or 2)");
>> +
>> +static int tlmi_version;
>> +static bool tlmi_initialised;
>> +
>> +static void tlmi_remove(struct wmi_device *wdev)
>> +{
>> +	switch (tlmi_version) {
>> +	case 1:
>> +		tlmi_v1_remove(wdev);
>> +		break;
>> +	case 2:
>> +		pr_err("Not yet implemented\n");
>> +	}
>> +}
>> +
>> +static int tlmi_probe(struct wmi_device *wdev, const void *context)
>> +{
>> +	int ret, ver;
>> +
>> +	if (tlmi_initialised)
>> +		return 0;
>> +
>> +	ver = *((const unsigned int *)context);
>> +
>> +	/* Until support is complete - we're going to ignore V2 */
>> +	if (!use_version && ver == 2) {
>> +		pr_info("TLMI version 2 detected but ignored as support not ready\n");
>> +		return 0;
>> +	}
>> +
>> +	/* Force use of version if requested */
>> +	if (use_version && use_version != ver) {
>> +		pr_info("Ignoring version %d as requested\n", ver);
>> +		return 0;
>> +	}
>> +
>> +	tlmi_version = ver;
>> +
>> +	switch (tlmi_version) {
>> +	case 1:
>> +		ret = tlmi_v1_initialise(wdev, context);
>> +		break;
>> +	case 2:
>> +		pr_err("Not yet implemented\n");
>> +		return -EOPNOTSUPP;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +	if (ret)
>> +		return ret;
>> +	tlmi_initialised = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct wmi_device_id tlmi_id_table[] = {
>> +	{ THINKLMI_DEVICE(TLMI_V1_BIOS_SETTING_GUID, 1) },
>> +	{ THINKLMI_DEVICE(TLMI_V2_BIOS_SETTING_GUID, 2) },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(wmi, tlmi_id_table);
>> +
>> +static struct wmi_driver tlmi_driver = {
>> +	.driver = {
>> +		.name = "think-lmi",
>> +	},
>> +	.id_table = tlmi_id_table,
>> +	.probe = tlmi_probe,
>> +	.remove = tlmi_remove,
>> +};
>> +
>> +MODULE_AUTHOR("Mark Pearson <mpearson-lenovo@squebb.ca>");
>> +MODULE_DESCRIPTION("ThinkLMI Support Driver");
>> +MODULE_LICENSE("GPL");
>> +
>> +module_wmi_driver(tlmi_driver);
>> diff --git a/drivers/platform/x86/lenovo/think-lmi.h b/drivers/platform/x86/lenovo/think-lmi.h
>> index 017644323d46..31359879629e 100644
>> --- a/drivers/platform/x86/lenovo/think-lmi.h
>> +++ b/drivers/platform/x86/lenovo/think-lmi.h
>> @@ -12,6 +12,9 @@
>>   #define TLMI_LANG_MAXLEN       4
>>   #define TLMI_INDEX_MAX        32
>>   
>> +#define TLMI_V1_BIOS_SETTING_GUID "51F5230E-9677-46CD-A1CF-C0B23EE34DB7"
>> +#define TLMI_V2_BIOS_SETTING_GUID "4B79FBA6-FFD4-41B6-8EA8-E81CDA0F5FC3"
>> +
>>   /* Possible error values */
>>   struct tlmi_err_codes {
>>   	const char *err_str;
>> @@ -137,4 +140,7 @@ struct think_lmi {
>>   	const struct tlmi_cert_guids *cert_guid;
>>   };
>>   
>> +void tlmi_v1_remove(struct wmi_device *wdev);
>> +int tlmi_v1_initialise(struct wmi_device *wdev, const void *context);
>> +
>>   #endif /* !_THINK_LMI_H_ */
