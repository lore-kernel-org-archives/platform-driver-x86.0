Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ECB2222A9
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802732; cv=none; b=gA5fcrV3jJ9zMyMm8bvksUP2yWB5lieunaPmLUn/r1NRLaF/TKLc5h2Wu0+bWmKeLasMGrJ8S73t3CrDMeC8IGTFmae1IdtJyVLtsbLmPs3CP1Zk6ihMad6YandzN9bekViQjdpAwPE2KS5iVIXOyevbw8Yg82jcPTGEM5281oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802732; c=relaxed/simple;
	bh=AAlSmWZrtoAIOOQRg1MXw6UqFxREGu9APGyr/AK+fSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mww3N7i+x4EwI99vbN3syuXkd56DaAjwY8uCw7z4acM2v890bMqGPyivrYWFtPCDCsYfVa5038SrbBuIAVxDmGDj0ADjaDJjgI2D1i8GZipAFTw/bjbtR2wAEotTt+GFAFl0W32UZJiRMjmZsTKNRbXBvcp04COAHKp32Gp2o7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHtZ/kLY; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHtZ/kLY"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-516cbde40f2so56800751cf.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802728; x=1780407528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wZCPVfnp9y67+pbTO8vKjKg7F60cSZ9wzu2T/b5Z/jg=;
        b=nHtZ/kLYr7hA5/e9oPY22yJAATg0dMCzZysz18sB5J6vE+cFsYcf2wX3q7VwBUTGal
         YJ9cTP9Mm0g1JiAIEs5nL+aKIjo0s8PUF3vs42lIYY2hbl/L97e8o6LkDQmDpKT54/tm
         7Mw36Pfwh6h0+Gx9G477zE2GG9+qNDgygwcz9yuKgo35FgbC/mQukfObd60+KbLvsX5W
         w8+OPyVOn8zLq4zHOZgGwOcONNIkOAfW4tQSy3kDeEqCvCqYSX1IRK8FKIWxXGa+DnHC
         gZxiL6rRw6qtFFOrEr5DCmFcjfJFS0Vnv2uA8Z+8AG+kRxdNM6fpfvvzLOY3YQv2G2da
         v4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802728; x=1780407528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZCPVfnp9y67+pbTO8vKjKg7F60cSZ9wzu2T/b5Z/jg=;
        b=nd6Abv94tAo7/KbIDX1LQNcbxQtzFtwa6MzHHJ0RaC0m/rqNO0wsSglcL/p+z3iMp4
         EcbMn4rl+AG1t408qYBUoNPrZh2mZZZAZ2nXiUEvQIz0ICFhR5mXTgRdwQcW2Ke5dUe8
         5aWGEYHHdHPC9SLNhMIrgMxJeKYqD9mHXOtJFJGs/jKCNBMDalqTmoMKMWzoreeYGETl
         YCE0j/85L0L6+7Eckupn3bArIzqa++XqgOHmBBpUh6sYxHokFI358X4t+LVlNgSFYNcj
         2Twb6Q2HGb4jGHGddlok1koyoYxDRyMxXhf4Yr7AlN/Ew+o5a1+KaugXWOwz4O//Nj34
         qLiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iaNbkaM2vbJ/+6di7HF15uZXLfoPp+w8mRC9YZDVgyI7uGsrZOnwO2umo2kOLWvEsiCiDI0SwXj8VuioLXTKcTnx0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1w+Re83iVG3zZWcCDnnvG34UHSfOdBHAOwjsgXO31jpXxiiKI
	yXydQDL5LaUDgQz12iDIQn6/JfZPLevLPAr0QMHjmPRG7Nmqlf23dnhYNyMf1Q==
X-Gm-Gg: Acq92OHfA2VoFJpSZH5AaNnEW3Ggckob810xHYetXUaPWZUj0N0EwS70LLmPCGv6Url
	2YqYYlMXIBqV2miu6zAXe7MfUnWtzTLM7l9KNvPNowxa1lZszgvQYs44U7TXk7DwrdDFEofwyKU
	TedOHz3Nr0kdrPUeLOLkWj8x8khIK5v/Rmflhgwcm4sv6s/fNbnsoOY0MBTfS6iFyc36nmq/PzP
	arUxwvN4rwf7E0ltXNTa5RbBMAoZzjPj+aIygQJtkHQ71nKumJhSh7HMUZ/38o8NSrkSWvbE5Nh
	g5mfgR2Tk9rg2vmOU1VnahfkSlaC2S5DvcRNXI5CL0SPn17T4S8yY1tqthnOQ27acYnVs6PxtFv
	xHWtw3I5eh4VJE43ELnUa3F0dZm4qEs0poZKbTGmbNO89xWKqvtNrBWCe8KcXvJdgwku7rbCnh+
	0rYa7gXxDG2D5tHN5oNxS6Iq/w7oIR+fkNyd18YzGJfq3M5fFGwM0SXmQylcY3muwyS86MrYcs+
	ipoIOWV61fFcajdaQ==
X-Received: by 2002:a05:622a:a942:b0:516:d5aa:42d5 with SMTP id d75a77b69052e-516d5aa4534mr212425661cf.10.1779802727948;
        Tue, 26 May 2026 06:38:47 -0700 (PDT)
Received: from [192.168.0.83] (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51706adc68fsm18105201cf.14.2026.05.26.06.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 06:38:46 -0700 (PDT)
Message-ID: <cc1d6a5e-c2f1-43b0-bc7d-c1efb95efa0d@gmail.com>
Date: Tue, 26 May 2026 09:38:45 -0400
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86/lenovo: Add Yoga Book 9 keyboard dock
 detection driver
To: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com
References: <20260519000239.29446-1-carvsdriver@gmail.com>
 <20260521144034.282419-1-carvsdriver@gmail.com>
 <871f18d1-beb7-4d29-8e17-43b806ebcbda@gmx.de>
Content-Language: en-US
From: Dave Carey <carvsdriver@gmail.com>
In-Reply-To: <871f18d1-beb7-4d29-8e17-43b806ebcbda@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

ack.  will review your feedback.  thank you.

On 5/22/26 5:59 PM, Armin Wolf wrote:
> Am 21.05.26 um 16:40 schrieb Dave Carey:
>
>> The Lenovo Yoga Book 9 14IAH10 ships with a detachable Bluetooth 
>> keyboard
>> that magnetically attaches to the bottom (secondary) screen in one of 
>> two
>> positions.  The Embedded Controller tracks the attachment state in a 
>> 2-bit
>> field called BKBD and signals changes via WMI event GUID
>> 806BD2A2-177B-481D-BFB5-3BA0BB4A2285 (notify ID 0xEB on the WM10 ACPI
>> device).
>>
>> The current BKBD state is read via WMI query GUID
>> E7F300FA-21CD-4003-ADAC-2696135982E6 (WQAF method), which returns an
>> 8-byte buffer: bytes [0..3] hold the LFID constant 0x00060000 and bytes
>> [4..7] hold the BKBD value.
>
> Hi,
>
> does the device contain embedded BMOF data? Take a look at 
> Documentation/wmi/driver-development-guide.rst
> to find out how to decode said BMOF data.
>
>>
>> BKBD encoding:
>>    0 = keyboard detached
>>    1 = keyboard docked on top half of bottom screen
>>    2 = keyboard docked on bottom half of bottom screen
>>    3 = reserved (not observed in practice)
>>
>> This driver:
>>    - Registers as a WMI driver on the event GUID.
>>    - Queries BKBD state on probe and on each WMI notification.
>>    - Reports SW_TABLET_MODE=1 when detached, SW_TABLET_MODE=0 when 
>> docked
>>      in either position (a physical keyboard is present in both cases).
>>    - Exposes the raw BKBD value via a read-only sysfs attribute
>>      "keyboard_position" for use by userspace (e.g. to distinguish 
>> between
>>      the two docked positions for different UI layouts).
>>
>> Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 6.19.
>>
>> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
>> ---
>>   .../testing/sysfs-driver-lenovo-yb9-kbdock    |  21 ++
>>   MAINTAINERS                                   |   7 +
>>   drivers/platform/x86/lenovo/Kconfig           |  14 ++
>>   drivers/platform/x86/lenovo/Makefile          |   1 +
>>   drivers/platform/x86/lenovo/yb9-kbdock.c      | 216 ++++++++++++++++++
>>   5 files changed, 259 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
>>   create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock 
>> b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
>> new file mode 100644
>> index 0000000..bb57690
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
>> @@ -0,0 +1,21 @@
>> +What: /sys/bus/wmi/drivers/lenovo-yb9-kbdock/<guid>/keyboard_position
>> +Date:        April 2026
>> +KernelVersion:    6.10
>> +Contact:    Dave Carey <carvsdriver@gmail.com>
>> +Description:
>> +        Read-only attribute reporting the current keyboard dock 
>> position
>> +        as reported by the Embedded Controller on the Lenovo Yoga 
>> Book 9
>> +        14IAH10.
>> +
>> +        Possible values:
>> +
>> +        == ============================================================
>> +        0   detached  — keyboard is not docked to any screen
>> +        1   top-half  — keyboard docked on the top half of the 
>> bottom screen
>> +        2   bottom-half — keyboard docked on the bottom half of the 
>> bottom screen
>> +        == ============================================================
>> +
>> +        The value is formatted as "<n> (<name>)\n", e.g. "1 
>> (top-half)\n"
>
> IMHO a simple number would be much easier to parse.
>
>> +
>> +        SW_TABLET_MODE input events are also emitted: 0 when the 
>> keyboard
>> +        is docked (either position), 1 when detached.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d1cc0e1..00e8275 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14479,6 +14479,13 @@ L: platform-driver-x86@vger.kernel.org
>>   S:    Maintained
>>   F:    drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
>>   +LENOVO YOGA BOOK 9 KEYBOARD DOCK DRIVER
>> +M:    Dave Carey <carvsdriver@gmail.com>
>> +L:    platform-driver-x86@vger.kernel.org
>> +S:    Maintained
>> +F:    Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
>> +F:    drivers/platform/x86/lenovo/yb9-kbdock.c
>> +
>>   LETSKETCH HID TABLET DRIVER
>>   M:    Hans de Goede <hansg@kernel.org>
>>   L:    linux-input@vger.kernel.org
>> diff --git a/drivers/platform/x86/lenovo/Kconfig 
>> b/drivers/platform/x86/lenovo/Kconfig
>> index 9c48487..938b361 100644
>> --- a/drivers/platform/x86/lenovo/Kconfig
>> +++ b/drivers/platform/x86/lenovo/Kconfig
>> @@ -43,6 +43,20 @@ config LENOVO_WMI_CAMERA
>>         To compile this driver as a module, choose M here: the module
>>         will be called lenovo-wmi-camera.
>>   +config LENOVO_YB9_KBDOCK
>> +    tristate "Lenovo Yoga Book 9 keyboard dock detection"
>> +    depends on ACPI_WMI
>> +    depends on DMI
>> +    depends on INPUT
>> +    help
>> +      Say Y here to enable keyboard dock detection on the Lenovo 
>> Yoga Book 9
>> +      14IAH10.  The detachable Bluetooth keyboard magnetically 
>> attaches to
>> +      either screen; this driver reports SW_TABLET_MODE input events 
>> based
>> +      on the attachment state and exposes the raw position in sysfs.
>> +
>> +      To compile this driver as a module, choose M here: the module 
>> will be
>> +      called lenovo-yb9-kbdock.
>> +
>>   config LENOVO_YMC
>>       tristate "Lenovo Yoga Tablet Mode Control"
>>       depends on ACPI_WMI
>> diff --git a/drivers/platform/x86/lenovo/Makefile 
>> b/drivers/platform/x86/lenovo/Makefile
>> index 7b2128e..2842d7d 100644
>> --- a/drivers/platform/x86/lenovo/Makefile
>> +++ b/drivers/platform/x86/lenovo/Makefile
>> @@ -8,6 +8,7 @@ obj-$(CONFIG_THINKPAD_LMI)    += think-lmi.o
>>   obj-$(CONFIG_THINKPAD_ACPI)    += thinkpad_acpi.o
>>     lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)    += 
>> wmi-hotkey-utilities.o
>> +lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)    += yb9-kbdock.o
>>   lenovo-target-$(CONFIG_LENOVO_YMC)    += ymc.o
>>   lenovo-target-$(CONFIG_YOGABOOK)    += yogabook.o
>>   lenovo-target-$(CONFIG_YT2_1380)    += 
>> yoga-tab2-pro-1380-fastcharger.o
>> diff --git a/drivers/platform/x86/lenovo/yb9-kbdock.c 
>> b/drivers/platform/x86/lenovo/yb9-kbdock.c
>> new file mode 100644
>> index 0000000..693e287
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
>> @@ -0,0 +1,216 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Lenovo Yoga Book 9 keyboard-dock detection
>> + *
>> + * The Yoga Book 9 ships with a detachable Bluetooth keyboard that 
>> magnetically
>> + * attaches to the bottom screen in one of two positions.  The EC 
>> tracks
>> + * attachment state in a 2-bit field called BKBD and signals changes 
>> via WMI
>> + * event 0xEB on the WM10 ACPI device.
>> + *
>> + * BKBD values:
>> + *   0 = keyboard detached
>> + *   1 = keyboard docked on the top half of the bottom screen
>> + *   2 = keyboard docked on the bottom half of the bottom screen
>> + *   3 = reserved / not observed
>> + *
>> + * This driver registers for the WMI event GUID, queries BKBD on 
>> probe and on
>> + * each event, reports SW_TABLET_MODE=0 when the keyboard is docked 
>> (either
>> + * position) and SW_TABLET_MODE=1 when detached, and exposes the raw 
>> BKBD
>> + * value in sysfs as "keyboard_position".
>> + *
>> + * Copyright (C) 2026 Dave Carey <carvsdriver@gmail.com>
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/dmi.h>
>> +#include <linux/input.h>
>> +#include <linux/module.h>
>> +#include <linux/wmi.h>
>> +
>> +/*
>> + * WM10 ACPI device (_UID "GMZN"):
>> + *   Event GUID — notify ID 0xEB fires on keyboard attachment change.
>> + *   Query GUID — object "AF", maps to WQAF(); returns 8-byte buffer
>> + *                {LFID=0x00060000, BKBD[31:0]}.
>> + */
>> +#define YB9_KBDOCK_EVENT_GUID "806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
>> +#define YB9_KBDOCK_QUERY_GUID "E7F300FA-21CD-4003-ADAC-2696135982E6"
>> +
>> +#define YB9_KBDOCK_QUERY_INSTANCE    0
>> +
>> +/* BKBD encoding — keyboard always docks on the bottom screen */
>> +#define BKBD_DETACHED        0
>> +#define BKBD_TOP_HALF        1    /* docked on top half of bottom 
>> screen */
>> +#define BKBD_BOTTOM_HALF    2    /* docked on bottom half of bottom 
>> screen */
>> +
>> +static const struct dmi_system_id yb9_kbdock_dmi_table[] = {
>> +    {
>> +        /* Lenovo Yoga Book 9 14IAH10 */
>> +        .matches = {
>> +            DMI_MATCH(DMI_SYS_VENDOR,   "LENOVO"),
>> +            DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
>> +        },
>> +    },
>> +    { }
>> +};
>> +
>> +struct yb9_kbdock_priv {
>> +    struct input_dev *input_dev;
>> +    unsigned int bkbd;    /* last read BKBD value (0-3) */
>> +};
>> +
>> +/* Read current BKBD state via WQAF.  Returns 0-3 or -errno. */
>> +static int yb9_kbdock_query(struct wmi_device *wdev)
>> +{
>> +    struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
>> +    union acpi_object *obj;
>> +    acpi_status status;
>> +    u32 bkbd;
>> +
>> +    status = wmi_query_block(YB9_KBDOCK_QUERY_GUID,
>> +                 YB9_KBDOCK_QUERY_INSTANCE, &out);
>
> That method is deprecated, please use wmidev_query_block(); I suggest 
> you use a notifier
> to connect both the WMI event device and the WMI blockd device. Take a 
> look at drivers/platform/
> x86/uniwill/uniwill-wmi.c for example.
>
>> +    if (ACPI_FAILURE(status)) {
>> +        dev_warn(&wdev->dev, "WQAF query failed: %s\n",
>> +             acpi_format_exception(status));
>> +        return -EIO;
>> +    }
>> +
>> +    obj = out.pointer;
>> +    if (!obj) {
>> +        dev_warn(&wdev->dev, "WQAF returned NULL\n");
>> +        return -EIO;
>> +    }
>> +
>> +    /*
>> +     * WQAF returns an 8-byte buffer: bytes [0..3] = LFID (0x00060000),
>> +     * bytes [4..7] = BKBD value.  Guard against short buffers.
>> +     */
>> +    if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length >= 8) {
>> +        memcpy(&bkbd, obj->buffer.pointer + 4, sizeof(bkbd));
>> +        bkbd &= 0x3;
>> +    } else if (obj->type == ACPI_TYPE_INTEGER) {
>> +        bkbd = obj->integer.value & 0x3;
>> +    } else {
>> +        dev_warn(&wdev->dev,
>> +             "WQAF: unexpected result type %d len %u\n",
>> +             obj->type,
>> +             obj->type == ACPI_TYPE_BUFFER
>> +                ? obj->buffer.length : 0);
>> +        kfree(obj);
>> +        return -EIO;
>> +    }
>> +
>> +    kfree(obj);
>> +    return (int)bkbd;
>> +}
>> +
>> +static void yb9_kbdock_update(struct wmi_device *wdev)
>> +{
>> +    struct yb9_kbdock_priv *priv = dev_get_drvdata(&wdev->dev);
>> +    int bkbd;
>> +    int tablet_mode;
>> +
>> +    bkbd = yb9_kbdock_query(wdev);
>> +    if (bkbd < 0)
>> +        return;
>> +
>> +    priv->bkbd = bkbd;
>> +
>> +    /*
>> +     * Report tablet mode only when the keyboard is fully detached.
>> +     * Both docked positions (top-half and bottom-half of the bottom 
>> screen)
>> +     * indicate a physical keyboard is present — report laptop mode.
>> +     */
>> +    tablet_mode = (bkbd == BKBD_DETACHED) ? 1 : 0;
>> +
>> +    input_report_switch(priv->input_dev, SW_TABLET_MODE, tablet_mode);
>> +    input_sync(priv->input_dev);
>> +
>> +    dev_dbg(&wdev->dev, "BKBD=%u tablet_mode=%d\n", bkbd, tablet_mode);
>> +}
>> +
>> +static void yb9_kbdock_notify(struct wmi_device *wdev, union 
>> acpi_object *data)
>> +{
>> +    yb9_kbdock_update(wdev);
>> +}
>> +
>> +/* sysfs: keyboard_position — exposes raw BKBD value */
>> +static ssize_t keyboard_position_show(struct device *dev,
>> +                      struct device_attribute *attr, char *buf)
>> +{
>> +    struct yb9_kbdock_priv *priv = dev_get_drvdata(dev);
>> +    static const char * const names[] = {
>> +        "detached", "top-half", "bottom-half", "unknown"
>> +    };
>> +    unsigned int bkbd = priv->bkbd;
>> +
>> +    if (bkbd > 3)
>> +        bkbd = 3;
>
> I think you should protect bkbd with a spinlock. Or you could just 
> read the current value
> from the hardware directly.
>
>> +    return sysfs_emit(buf, "%u (%s)\n", bkbd, names[bkbd]);
>> +}
>> +static DEVICE_ATTR_RO(keyboard_position);
>> +
>> +static struct attribute *yb9_kbdock_attrs[] = {
>> +    &dev_attr_keyboard_position.attr,
>> +    NULL,
>> +};
>> +ATTRIBUTE_GROUPS(yb9_kbdock);
>> +
>> +static int yb9_kbdock_probe(struct wmi_device *wdev, const void *ctx)
>> +{
>> +    struct yb9_kbdock_priv *priv;
>> +    struct input_dev *input_dev;
>> +    int err;
>> +
>> +    if (!dmi_check_system(yb9_kbdock_dmi_table)) {
>> +        dev_dbg(&wdev->dev, "not a Yoga Book 9, skipping\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>> +    if (!priv)
>> +        return -ENOMEM;
>> +
>> +    input_dev = devm_input_allocate_device(&wdev->dev);
>> +    if (!input_dev)
>> +        return -ENOMEM;
>> +
>> +    input_dev->name = "Lenovo Yoga Book 9 keyboard dock switch";
>> +    input_dev->phys = YB9_KBDOCK_EVENT_GUID "/input0";
>> +    input_dev->id.bustype = BUS_HOST;
>> +    input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
>> +
>> +    err = input_register_device(input_dev);
>> +    if (err) {
>> +        dev_err(&wdev->dev, "failed to register input device: %d\n", 
>> err);
>> +        return err;
>> +    }
>> +
>> +    priv->input_dev = input_dev;
>> +    dev_set_drvdata(&wdev->dev, priv);
>> +
>> +    /* Report initial state */
>> +    yb9_kbdock_update(wdev);
>> +    return 0;
>> +}
>> +
>> +static const struct wmi_device_id yb9_kbdock_wmi_id_table[] = {
>> +    { .guid_string = YB9_KBDOCK_EVENT_GUID },
>> +    { }
>> +};
>> +MODULE_DEVICE_TABLE(wmi, yb9_kbdock_wmi_id_table);
>> +
>> +static struct wmi_driver yb9_kbdock_driver = {
>> +    .driver = {
>> +        .name = "lenovo-yb9-kbdock",
>> +        .dev_groups = yb9_kbdock_groups,
>> +    },
>> +    .id_table = yb9_kbdock_wmi_id_table,
>> +    .probe    = yb9_kbdock_probe,
>> +    .notify   = yb9_kbdock_notify,
>
> Please set .no_singleton = true. Also please update the docking state 
> when resuming from suspend or hibernation.
>
> Thanks,
> Armin Wolf
>
>> +};
>> +module_wmi_driver(yb9_kbdock_driver);
>> +
>> +MODULE_AUTHOR("Dave Carey <carvsdriver@gmail.com>");
>> +MODULE_DESCRIPTION("Lenovo Yoga Book 9 keyboard dock detection");
>> +MODULE_LICENSE("GPL");
