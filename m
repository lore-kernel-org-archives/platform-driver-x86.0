Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E040BC4338F
	for <platform-driver-x86@archiver.kernel.org>; Sat,  7 Aug 2021 10:32:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1A1B610FC
	for <platform-driver-x86@archiver.kernel.org>; Sat,  7 Aug 2021 10:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbhHGKdF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 7 Aug 2021 06:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbhHGKdE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Aug 2021 06:33:04 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E22C0613CF
        for <platform-driver-x86@vger.kernel.org>; Sat,  7 Aug 2021 03:32:47 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id u16so10659635ple.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Aug 2021 03:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rr80ttEZdruta2rkbj+QxN0hHtV6qurcu7r40s8iefg=;
        b=gINgVdxvsev3W5USPuMRsfU+ktRvbqu0f4l9lUJ4b3fhPkwAqJ/Z2FMkLDPsYhH03C
         aqzXH1R1p1RMiBnaTfnuHcb3oqJyzKhunDQOHHLUuFkP7p+rKMAanp6apNEm6DryVc8O
         Wmo3Uh3wUNci0hOyphGRxm9BpBQjLLb+7GyhIMne9XYyviWyL3f1KKICzWfLcOSocbIN
         teP6N1Xl520cvk+KjtBYrjtRrRZzOe+EwU9drulKXPCjDIQfrnAjuB8xpPuPtQFJ/jtd
         bnWV5+OaZx1re39r0UffwkmOSJJY292KPHiwNQm8RFhvgGiwaIpKCDsdCJ5Yqe6VSgUe
         71uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rr80ttEZdruta2rkbj+QxN0hHtV6qurcu7r40s8iefg=;
        b=s8gkkT8oNngdhuZ3jwRNzn01mW6Yl6sLUks/6xqppvOSqyykag+5ldBje8JBuk2xXv
         2S1IhV8tx7z6ZokNXwOHUU5Bw4zwFcnOHHEKK+8zZYZC9bGbIKnwxD9wMm8zDhLePmpr
         nvZ/K7w0YZNl6ivZhfzq3fbkGcibA7kxhgErVwc5hkWeB3YnNqkfabmCnS8+nm8lKYeX
         TQ3ZVzoxb459rnx+U7vlUe394IeNrYwMc5vGbugI2+ZyoKkS/hRHJiRXsjpSMxt72C6i
         oBFcNOYjHXbjvVBXWESFd+KJbO6wqnBxEkiQB2nuBPz0+/HfGpMOxrvwjDWdLHKw4t5I
         s2AQ==
X-Gm-Message-State: AOAM5327XUlmGCQU0QBe4coHNnC1PjoLgmsdWp4tPQPkrEdyrhrdjTbb
        /1l5GYLsFRbmfF+2C+zqoXLQGKkkYPbZGvCd7Yk=
X-Google-Smtp-Source: ABdhPJy4WFXDcSjH80cMNzhjGVFeb4FHWoKAhskOuxkEW1vYEG+bancm1f0ngt/rPAPx41GkxNfJW+rOGWA2CQglPAw=
X-Received: by 2002:aa7:800b:0:b029:330:455f:57a8 with SMTP id
 j11-20020aa7800b0000b0290330455f57a8mr14940534pfi.7.1628332366550; Sat, 07
 Aug 2021 03:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210806145630.8858-1-s.shravan@intel.com> <20210806145630.8858-2-s.shravan@intel.com>
In-Reply-To: <20210806145630.8858-2-s.shravan@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 7 Aug 2021 13:32:10 +0300
Message-ID: <CAHp75VfhiX+TmsY9UFJ0_aZM7wRhohP8QHNpTEXFYM+0fQs-4g@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] platform/x86: Add BIOS Dynamic SAR driver for
 Intel M.2 Modem
To:     Shravan S <s.shravan@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

(Side note, most of the comments you may have avoided if you had read
an internal Wiki page about popular style mistakes)
Another note, comments given even against one occurrence of similar
code should be considered for the others.

On Sat, Aug 7, 2021 at 12:24 AM Shravan S <s.shravan@intel.com> wrote:
>
> BIOS SAR driver for RF power regulation on Intel M.2 Modem.
> Uses ACPI to communicate to BIOS to retrieve SAR information data.
> Uses Sysfs to communicate this data to userspace via read and notify.
> Userspace will use MBIM interface to enable data communication to modem.

This is going to be a commit message. The one above is poorly written
to the reader. E.g. what should I get from it "Uses ACPI"? Perhaps
something more elaborative like "It uses ACPI specific methods FOO and
BAR to retrieve this and that information". "The driver provides a
custom sysfs interface, documented in Documentation/...."

...

>  drivers/platform/x86/Kconfig                  |  15 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/intel-sar.c              | 317 ++++++++++++++++++

Use intel/ subfolder, please.

...

> +               derived based on information like mcc/mnc that is available for

What are the mcc/mnc TLAs?

...

> +INTEL BIOS SAR DRIVER
> +M:     Shravan S <s.shravan@intel.com>
> +M:     Intel Corporation <linuxwwan@intel.com>
> +L:     platform-driver-x86@vger.kernel.org
> +S:     Maintained
> +F:     drivers/platform/x86/intel-sar.c

And nicely misses the file brought in this patch...

...

> +#include <asm/errno.h>

Why asm?
Why at the beginning of the inclusion list?

> +#include <linux/acpi.h>

> +#include <linux/kobject.h>
> +#include <linux/platform_data/x86/intel-sar.h>
> +#include <linux/platform_device.h>
> +#include <linux/sysfs.h>

...

> +/**
> + * get_int_value - Retrieve Integer values from ACPI Object

> + * Value of the integer from the object of ACPI is obtained.

Put this after field descriptions. Same for all kernel doc descriptions.

> + * @obj: acpi_object pointer which has the integer value
> + * @out: output pointer will get integer value

> + * returns 0 on success

and that's it?

Besides that, your style doesn't follow the grammar and punctuation rules.

> + */
> +static int get_int_value(union acpi_object *obj, int *out)
> +{
> +       if (obj && obj->type == ACPI_TYPE_INTEGER) {
> +               *out = (int)obj->integer.value;
> +               return 0;

> +       } else {

Redundant.

> +               return -EIO;
> +       }

Besides above, use standard pattern

  if (foo != expected)
    return error;

> +}

...

> +static acpi_status parse_package(struct wwan_sar_context *context, union acpi_object *item)
> +{
> +       struct wwan_device_mode_configuration *data;

> +       int value = 0, itr = 0, reg = 0, count = 0;

Why redundant assignments? They actually may hide the real errors.

> +       union acpi_object *num;
> +
> +       num = &item->package.elements[0];

> +       if ((get_int_value(num, &value) != 0) || (value < 0 || value >= MAX_REGULATORY))

Too many parentheses. " != 0" is redundant (this applies to many
places in the proposed patch).

> +               return AE_ERROR;
> +
> +       reg = value;
> +
> +       data = &context->config_data[reg];
> +       if (data->total_dev_mode > MAX_DEV_MODES || data->total_dev_mode == 0)
> +               return AE_ERROR;
> +       count = (data->total_dev_mode < item->package.count) ?
> +                        data->total_dev_mode : item->package.count;
> +       data->device_mode_info = kmalloc_array(data->total_dev_mode,
> +                                              sizeof(struct wwan_device_mode_info), GFP_KERNEL);
> +       if (!data->device_mode_info)
> +               return AE_ERROR;
> +       for (itr = 0; itr < count; itr++) {
> +               struct wwan_device_mode_info temp = { 0 };
> +
> +               num = &item->package.elements[itr + 1];
> +               if (num->type != ACPI_TYPE_PACKAGE || num->package.count < TOTAL_DATA)
> +                       continue;
> +               if (get_int_value(&num->package.elements[0], &temp.device_mode) != 0)
> +                       continue;
> +               if (get_int_value(&num->package.elements[1], &temp.bandtable_index) != 0)
> +                       continue;
> +               if (get_int_value(&num->package.elements[2], &temp.antennatable_index) != 0)
> +                       continue;
> +               if (get_int_value(&num->package.elements[3], &temp.sartable_index) != 0)
> +                       continue;
> +               data->device_mode_info[itr] = temp;
> +       }
> +       return AE_OK;
> +}

...

> +static acpi_status sar_get_device_mode(struct platform_device *device)
> +{
> +       struct wwan_sar_context *context = dev_get_drvdata(&device->dev);
> +       acpi_status status = AE_OK;
> +       union acpi_object *out;
> +       int value = 0;
> +       u32 rev = 0;
> +
> +       out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
> +                               COMMAND_ID_DEV_MODE, NULL);
> +       if (get_int_value(out, &value) != 0) {

> +               pr_err("%s: Cmd:%d Failed\n", __func__, COMMAND_ID_DEV_MODE);

Use dev_err() and similar when you have a struct device.
The message itself looks like debugging, to be an error you have to
provide a human readable one and without __func__.

> +               status = AE_ERROR;
> +               goto dev_mode_error;
> +       }
> +       context->sar_data.device_mode = value;
> +       sysfs_notify(&device->dev.kobj, NULL, SYSFS_DATANAME);
> +
> +dev_mode_error:
> +       ACPI_FREE(out);
> +       return status;
> +}
> +
> +static const struct acpi_device_id sar_device_ids[] = {
> +       { "INTC1092", 0},

> +       { "", 0},

No comma for terminator, moreover the { } is enough.

> +};

> +

Redundant blank line.

> +MODULE_DEVICE_TABLE(acpi, sar_device_ids);

...

> +static const struct platform_device_id sar_device_table[] = {
> +       {"intc1092", 0},
> +       {},

No comma.

> +};

...

> +static ssize_t intc_reg_store(struct device *dev, struct device_attribute *attr,
> +                             const char *buf, size_t count)
> +{
> +       struct wwan_sar_context *context = dev_get_drvdata(dev);
> +       unsigned long value = 0;
> +       int read = 0;

> +       if (!count) {
> +               pr_err("%s count = %d", __func__, (int)count);
> +               return -EFAULT;
> +       }

Is it ever possible?

> +       read = kstrtoul(buf, 0, &value);
> +       if (read <= 0) {
> +               pr_err("%s Not a integer", __func__);
> +               return -EINVAL;

Don't shadow an error code.

> +       }


> +       if (value >= MAX_REGULATORY)
> +               return -EINVAL;

ERANGE?
EOVERFLOW?

> +       context->reg_value = (int)value;

Why to use unsigned long in then cast to int? Maybe use int in the first place?

> +       update_sar_data(context);

> +       dev_set_drvdata(dev, context);

This seems a misuse of the field.

> +       sysfs_notify(&dev->kobj, NULL, SYSFS_DATANAME);
> +       return count;
> +}

> +

Redundant.

> +static DEVICE_ATTR_RO(intc_data);
> +static DEVICE_ATTR_RW(intc_reg);

Attach each of them to the respective functions.

...

> +static int sar_probe(struct platform_device *device)
> +{
> +       union acpi_object *out, *item, req;
> +       struct wwan_sar_context *context;
> +       acpi_status status = AE_OK;
> +       u32 rev = 0, reg = 0;
> +       int result = 0;

Why assignments?

> +       context = kmalloc(sizeof(*context), GFP_KERNEL);
> +       if (!context)
> +               return -ENOMEM;
> +       memset(context, 0, sizeof(struct wwan_sar_context));

NIH kzalloc().

> +       context->sar_device = device;
> +       dev_set_drvdata(&device->dev, context);

> +       if (guid_parse(SAR_DSM_UUID, &context->guid)) {

Shadowed error code

> +               pr_err("%s: UUID error\n", __func__);
> +               goto r_free;
> +       }
> +       context->handle = ACPI_HANDLE(&device->dev);

> +       for (reg = 0; reg < MAX_REGULATORY; reg++) {
> +               req.type = ACPI_TYPE_INTEGER;
> +               req.integer.value = reg;
> +               out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
> +                                       COMMAND_ID_CONFIG_TABLE, &req);
> +               if (!out) {
> +                       pr_err("%s: Cmd:%d Failed\n", __func__, COMMAND_ID_CONFIG_TABLE);
> +                       continue;
> +               }
> +               if (out->type == ACPI_TYPE_PACKAGE && out->package.count >= 3 &&
> +                   out->package.elements[0].type == ACPI_TYPE_INTEGER &&
> +                   out->package.elements[1].type == ACPI_TYPE_INTEGER &&
> +                   out->package.elements[2].type == ACPI_TYPE_PACKAGE) {
> +                       context->config_data[reg].version = out->package.elements[0].integer.value;
> +                       context->config_data[reg].total_dev_mode =
> +                               out->package.elements[1].integer.value;
> +                       if (context->config_data[reg].total_dev_mode <= 0 ||
> +                           context->config_data[reg].total_dev_mode > MAX_DEV_MODES) {
> +                               pr_err("total_dev_mode is not within range : %d\n",
> +                                      context->config_data[reg].total_dev_mode);
> +                               ACPI_FREE(out);
> +                               continue;
> +                       }
> +                       item = &out->package.elements[2];
> +                       if (item->package.count > 0)
> +                               status = parse_package(context, item);
> +                       else
> +                               status = AE_ERROR;
> +                       if (status != AE_OK) {
> +                               ACPI_FREE(out);
> +                               continue;
> +                       }
> +               }
> +               ACPI_FREE(out);
> +       }

Try to refactor this for-loop. Perhaps even move it out to a function or so.

> +       update_sar_data(context);
> +       result = sysfs_create_group(&device->dev.kobj, &intcsar_group);
> +       if (result) {
> +               pr_err("sysfs creation failed\n");
> +               goto r_free;
> +       }
> +       if (sar_get_device_mode(device) != AE_OK) {
> +               pr_err("Failed sar_get_device_mode\n");
> +               goto r_sys;
> +       }
> +       if (acpi_install_notify_handler(ACPI_HANDLE(&device->dev), ACPI_DEVICE_NOTIFY,
> +                                       sar_notify, (void *)device) != AE_OK) {
> +               pr_err("Failed acpi_install_notify_handler\n");
> +               goto r_sys;
> +       }
> +       return 0;
> +
> +r_sys:
> +       sysfs_remove_group(&device->dev.kobj, &intcsar_group);
> +r_free:
> +       kfree(context);

> +       return -1;

What is this?

> +}
> +
> +static int sar_remove(struct platform_device *device)
> +{
> +       struct wwan_sar_context *context = dev_get_drvdata(&device->dev);
> +       int reg = 0;
> +
> +       acpi_remove_notify_handler(ACPI_HANDLE(&device->dev),
> +                                  ACPI_DEVICE_NOTIFY, sar_notify);
> +       sysfs_remove_group(&device->dev.kobj, &intcsar_group);
> +       for (reg = 0; reg < MAX_REGULATORY; reg++) {
> +               kfree(context->config_data[reg].device_mode_info);
> +               context->config_data[reg].device_mode_info = NULL;
> +       }
> +       kfree(context);
> +       return 0;
> +}

...

> +MODULE_DEVICE_TABLE(platform, sar_device_table);

Besides the misplaced line in the code, why do you need this?

...

> +                       /* FOR ACPI HANDLING */

Useless.

...

> +       .id_table = sar_device_table,

Why?

> +};

> +

Redundant blank line.

...

> +/*
> + * Intel Corporation Header File for Specific Absorption Rate

What is this supposed to mean?

> + * Copyright (c) 2021, Intel Corporation.
> + */

It seems like your header lacks the inclusion of the needed headers
and/or type forward declarations.

-- 
With Best Regards,
Andy Shevchenko
