From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 3/3] platform/wmi: Expose the raw WDG data in sysfs
Date: Tue, 1 Aug 2017 11:29:52 -0700
Message-ID: <CALCETrVjQ6sHkfUNhLo8Xxi7unrTyomWfNFnMvauhWfkj19aMA@mail.gmail.com>
References: <cover.1501601667.git.luto@kernel.org> <e6df9d038af0a0ce4d4119395aaea58366ade26d.1501601667.git.luto@kernel.org>
 <20170801154613.GC25574@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751327AbdHASaO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 14:30:14 -0400
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com [209.85.213.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EAF6822DA6
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Aug 2017 18:30:13 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id u133so9517223vke.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Aug 2017 11:30:13 -0700 (PDT)
In-Reply-To: <20170801154613.GC25574@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Tue, Aug 1, 2017 at 8:46 AM, Pali Rohár <pali.rohar@gmail.com> wrote:
> On Tuesday 01 August 2017 08:37:28 Andy Lutomirski wrote:
>> This adds a sysfs binary attribute 'wdg' on the bus device
>> (i.e. /sys/class/wmi_bus/wmi_bus-*/wdg) that contains the raw _WDG
>> data from ACPI.  This can be used along with the wmi-bmof driver to
>> decode the raw interface data from ACPI.
>>
>> There is very little new information here, as most of the contents
>> were already exposed in sysfs attributes on the wmi devices.
>>
>> Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> ---
>>  drivers/platform/x86/wmi.c | 63 ++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 61 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
>> index 1a764e311e11..37ca56aa6025 100644
>> --- a/drivers/platform/x86/wmi.c
>> +++ b/drivers/platform/x86/wmi.c
>> @@ -76,6 +76,11 @@ struct wmi_block {
>>       bool read_takes_no_args;
>>  };
>>
>> +struct wmi_bus_priv {
>> +     union acpi_object *wdg_obj;
>> +     struct bin_attribute wdg_bin_attr;
>> +     bool wdg_bin_attr_created;
>> +};
>>
>>  /*
>>   * If the GUID data block is marked as expensive, we must enable and
>> @@ -938,6 +943,7 @@ static bool guid_already_parsed(struct acpi_device *device,
>>   */
>>  static int parse_wdg(struct device *wmi_bus_dev, struct acpi_device *device)
>>  {
>> +     struct wmi_bus_priv *priv = dev_get_drvdata(wmi_bus_dev);
>>       struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
>>       const struct guid_block *gblock;
>>       struct wmi_block *wblock, *next;
>> @@ -1017,11 +1023,35 @@ static int parse_wdg(struct device *wmi_bus_dev, struct acpi_device *device)
>>               }
>>       }
>>
>> +     priv->wdg_obj = obj;
>> +     return 0;
>> +
>>  out_free_pointer:
>>       kfree(out.pointer);
>>       return retval;
>>  }
>>
>> +static ssize_t
>> +read_wdg(struct file *filp, struct kobject *kobj,
>> +      struct bin_attribute *attr,
>> +      char *buf, loff_t off, size_t count)
>> +{
>> +     struct wmi_bus_priv *priv =
>> +             container_of(attr, struct wmi_bus_priv, wdg_bin_attr);
>> +
>> +     if (off < 0)
>> +             return -EINVAL;
>> +
>> +     if (off >= priv->wdg_obj->buffer.length)
>> +             return 0;
>> +
>> +     if (count > priv->wdg_obj->buffer.length - off)
>> +             count = priv->wdg_obj->buffer.length - off;
>> +
>> +     memcpy(buf, priv->wdg_obj->buffer.pointer + off, count);
>> +     return count;
>> +}
>> +
>>  /*
>>   * WMI can have EmbeddedControl access regions. In which case, we just want to
>>   * hand these off to the EC driver.
>> @@ -1138,6 +1168,8 @@ static void acpi_wmi_notify_handler(acpi_handle handle, u32 event,
>>
>>  static int acpi_wmi_remove(struct platform_device *device)
>>  {
>> +     struct device *wmi_bus_dev = dev_get_drvdata(&device->dev);
>> +     struct wmi_bus_priv *priv = dev_get_drvdata(wmi_bus_dev);
>>       struct acpi_device *acpi_device = ACPI_COMPANION(&device->dev);
>>
>>       acpi_remove_notify_handler(acpi_device->handle, ACPI_DEVICE_NOTIFY,
>> @@ -1145,7 +1177,13 @@ static int acpi_wmi_remove(struct platform_device *device)
>>       acpi_remove_address_space_handler(acpi_device->handle,
>>                               ACPI_ADR_SPACE_EC, &acpi_wmi_ec_space_handler);
>>       wmi_free_devices(acpi_device);
>> -     device_unregister((struct device *)dev_get_drvdata(&device->dev));
>> +
>> +     if (priv->wdg_bin_attr_created)
>> +             sysfs_remove_bin_file(&wmi_bus_dev->kobj,
>> +                                   &priv->wdg_bin_attr);
>> +     kfree(priv->wdg_obj);
>> +     kfree(priv);
>> +     device_unregister(wmi_bus_dev);
>>
>>       return 0;
>>  }
>> @@ -1154,6 +1192,7 @@ static int acpi_wmi_probe(struct platform_device *device)
>>  {
>>       struct acpi_device *acpi_device;
>>       struct device *wmi_bus_dev;
>> +     struct wmi_bus_priv *priv;
>>       acpi_status status;
>>       int error;
>>
>> @@ -1190,14 +1229,34 @@ static int acpi_wmi_probe(struct platform_device *device)
>>       }
>>       dev_set_drvdata(&device->dev, wmi_bus_dev);
>>
>> +     priv = kzalloc(sizeof(struct wmi_bus_priv), GFP_KERNEL);
>> +     if (!priv) {
>> +             error = -ENOMEM;
>> +             goto err_remove_busdev;
>> +     }
>> +     dev_set_drvdata(wmi_bus_dev, priv);
>> +
>>       error = parse_wdg(wmi_bus_dev, acpi_device);
>>       if (error) {
>>               pr_err("Failed to parse WDG method\n");
>> -             goto err_remove_busdev;
>> +             goto err_free_priv;
>>       }
>>
>> +     sysfs_bin_attr_init(&priv->wdg_bin_attr);
>> +     priv->wdg_bin_attr.attr.name = "wdg";
>> +     priv->wdg_bin_attr.attr.mode = 0400;
>> +     priv->wdg_bin_attr.read = read_wdg;
>> +     priv->wdg_bin_attr.size = priv->wdg_obj->buffer.length;
>> +
>> +     /* A failure here isn't fatal. */
>> +     if (sysfs_create_bin_file(&wmi_bus_dev->kobj, &priv->wdg_bin_attr) == 0)
>> +             priv->wdg_bin_attr_created = true;
>
> There should be at least some warning...

Fixed for v2.

--Andy
