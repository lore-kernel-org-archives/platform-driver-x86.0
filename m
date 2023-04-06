Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3586DC76196
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 11:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237002AbjDFLDL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 07:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236906AbjDFLDK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 07:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1650F72A0
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 04:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680778942;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bAE7SQoO05MAF72dhWTUdwI4QbK72CuEmwSDrs77p6Y=;
        b=BzFojXZvgKdqe9mxkV8L46W5LD3YP+UbtzPHuiGZn/9evmOdYr0nrJznTvnNU5vKur5OqT
        UsYuN7Epg2qzqJ94/vhiVgX2ohMe5IED9TOsqJXlWz0C3tfKxw5C7ShsMNPzD0Cmp4OZXp
        wmNRX7Dv79eMrAdbGzPNgjclp7k8hq8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-oHVcP3FzNcyiPcJH4J7g6Q-1; Thu, 06 Apr 2023 07:02:21 -0400
X-MC-Unique: oHVcP3FzNcyiPcJH4J7g6Q-1
Received: by mail-ed1-f70.google.com with SMTP id i42-20020a0564020f2a00b004fd23c238beso52398970eda.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Apr 2023 04:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680778939; x=1683370939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAE7SQoO05MAF72dhWTUdwI4QbK72CuEmwSDrs77p6Y=;
        b=bX9XWEz/0PSdDY4FujedCofrhOB/QpnRszmoMWeyiKvhwO26QHbTStgj100ReVZuMg
         Nl7mVE8I8w/fKyYROZnJ1j6IrJw3g3UR6+jlR0UFM6MbG18Zo/1MU4VPFiLtE8ipqr8I
         BAtgLi782MLQ2vEeQnhP9iqMM+waErmQnGPyrVDVuNqPKlL/EPbWvm47mAcTS49BpLqG
         XN87U0hLNuZmyWHhi/qzdV7iKnliR7it+0LS8e8Gbi/ow/5lVDu+Cugoq1IZaHRbCmda
         5oA8RFkWsLRatLh6TPKglXugljcCH8v1VxoJRHhYQwIcC66anJoFcTJyp44da4v+Mlx2
         ohCw==
X-Gm-Message-State: AAQBX9dcLuws5l/SGF7j6goC1ws6rmpj/20DFBnzRLZBdH8yqa0BBRDx
        6s8xBgPkGvPjUNS1ZFRD/yEraLXKA4DwOkjV76FmxEMtu/Z1hLbTE350vnJV67JlJDhf57pYjBD
        7789/bpzaKc0YgRLY5BENtBUpP5g+KxUa5JosU+Gp5g==
X-Received: by 2002:a17:907:70d:b0:949:7c14:d890 with SMTP id xb13-20020a170907070d00b009497c14d890mr5135638ejb.62.1680778939384;
        Thu, 06 Apr 2023 04:02:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350YFG72XJBr9z4w0Q5/2UYv7I1uAAxI2dqv5ZvmLe3u6ro1oRjE7cgUFa7UljvKp73FXq87KQA==
X-Received: by 2002:a17:907:70d:b0:949:7c14:d890 with SMTP id xb13-20020a170907070d00b009497c14d890mr5135615ejb.62.1680778939077;
        Thu, 06 Apr 2023 04:02:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mc4-20020a170906eb4400b008d173604d72sm667651ejb.174.2023.04.06.04.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 04:02:18 -0700 (PDT)
Message-ID: <ea590fae-8282-fcde-542c-fbdf2d0f7d2f@redhat.com>
Date:   Thu, 6 Apr 2023 13:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] platform/x86: x86-android-tablets: Add Lenovo Yoga
 Book X90F/L data
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230401150737.597417-1-hdegoede@redhat.com>
 <20230401150737.597417-3-hdegoede@redhat.com>
 <CAHp75Ve5zx0rEDjQTkf2KsRC4ASVoxUkhpX2YFAJsNuV9+v3OQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve5zx0rEDjQTkf2KsRC4ASVoxUkhpX2YFAJsNuV9+v3OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/2/23 08:04, Andy Shevchenko wrote:
> On Sat, Apr 1, 2023 at 5:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Lenovo Yoga Book X90F/L is a x86 ACPI tablet which ships with Android
>> x86 as factory OS. Its DSDT contains a bunch of I2C devices which are not
>> actually there, causing various resource conflicts. Enumeration of these
>> is skipped through the acpi_quirk_skip_i2c_client_enumeration().
>>
>> Add support for manually instantiating the I2C + other devices which are
>> actually present on this tablet by adding the necessary device info to
>> the x86-android-tablets module.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../platform/x86/x86-android-tablets/dmi.c    |   9 ++
>>  .../platform/x86/x86-android-tablets/lenovo.c | 122 ++++++++++++++++++
>>  .../x86-android-tablets/x86-android-tablets.h |   1 +
>>  3 files changed, 132 insertions(+)
>>
>> diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
>> index 6ea47af1b480..23e640b7003d 100644
>> --- a/drivers/platform/x86/x86-android-tablets/dmi.c
>> +++ b/drivers/platform/x86/x86-android-tablets/dmi.c
>> @@ -76,6 +76,15 @@ const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
>>                 },
>>                 .driver_data = (void *)&czc_p10t,
>>         },
>> +       {
>> +               /* Lenovo Yoga Book X90F / X90L */
>> +               .matches = {
>> +                       DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
>> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
>> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "YETI-11"),
>> +               },
>> +               .driver_data = (void *)&lenovo_yogabook_x90_info,
>> +       },
>>         {
>>                 /* Lenovo Yoga Book X91F / X91L */
>>                 .matches = {
>> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
>> index 5d217cbbde30..d53928504c09 100644
>> --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
>> +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
>> @@ -38,6 +38,128 @@ static struct lp855x_platform_data lenovo_lp8557_pdata = {
>>         .initial_brightness = 128,
>>  };
>>
>> +/* Lenovo Yoga Book X90F / X90L's Android factory img has everything hardcoded */
>> +
>> +/*
>> + * The HiDeep IST940E touchscreen comes up in HID mode and could alternatively
>> + * be used in I2C-HID mode (I2C-HID descriptor reg 0x0020) if i2c-hid-of.c is
>> + * modified to use generic (non of) device-properties and thought to deal with
> 
> non-OF
> 
>> + * the reset GPIO. "hideep,force-native-protocol" resets it to native mode.
>> + */
>> +static const struct property_entry lenovo_yb1_x90_hideep_ts_props[] = {
>> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1200),
>> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1920),
>> +       PROPERTY_ENTRY_U32("touchscreen-max-pressure", 16384),
>> +       PROPERTY_ENTRY_BOOL("hideep,force-native-protocol"),
>> +       { }
>> +};
>> +
>> +static const struct software_node lenovo_yb1_x90_hideep_ts_node = {
>> +       .properties = lenovo_yb1_x90_hideep_ts_props,
>> +};
>> +
>> +static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
>> +       {
>> +               /* BQ27542 fuel-gauge */
>> +               .board_info = {
>> +                       .type = "bq27542",
>> +                       .addr = 0x55,
>> +                       .dev_name = "bq27542",
>> +                       .swnode = &fg_bq25890_supply_node,
>> +               },
>> +               .adapter_path = "\\_SB_.PCI0.I2C1",
>> +       }, {
>> +               /* Goodix Touchscreen in keyboard half*/
> 
> Missing space before */.
> 
>> +               .board_info = {
>> +                       .type = "GDIX1001:00",
>> +                       .addr = 0x14,
>> +                       .dev_name = "goodix_ts",
>> +               },
>> +               .adapter_path = "\\_SB_.PCI0.I2C2",
>> +               .irq_data = {
>> +                       .type = X86_ACPI_IRQ_TYPE_GPIOINT,
>> +                       .chip = "INT33FF:01",
>> +                       .index = 56,
>> +                       .trigger = ACPI_EDGE_SENSITIVE,
>> +                       .polarity = ACPI_ACTIVE_LOW,
>> +               },
>> +       }, {
>> +               /* LP8557 Backlight controller */
>> +               .board_info = {
>> +                       .type = "lp8557",
>> +                       .addr = 0x2c,
>> +                       .dev_name = "lp8557",
>> +                       .platform_data = &lenovo_lp8557_pdata,
>> +               },
>> +               .adapter_path = "\\_SB_.PCI0.I2C4",
>> +       }, {
>> +               /* HiDeep IST940E Touchscreen in display half */
>> +               .board_info = {
>> +                       .type = "hideep_ts",
>> +                       .addr = 0x6c,
>> +                       .dev_name = "hideep_ts",
>> +                       .swnode = &lenovo_yb1_x90_hideep_ts_node,
>> +               },
>> +               .adapter_path = "\\_SB_.PCI0.I2C6",
>> +               .irq_data = {
>> +                       .type = X86_ACPI_IRQ_TYPE_GPIOINT,
>> +                       .chip = "INT33FF:03",
>> +                       .index = 77,
>> +                       .trigger = ACPI_LEVEL_SENSITIVE,
>> +                       .polarity = ACPI_ACTIVE_LOW,
>> +               },
>> +       },
>> +};
>> +
>> +static struct gpiod_lookup_table lenovo_yb1_x90_goodix_gpios = {
>> +       .dev_id = "i2c-goodix_ts",
>> +       .table = {
>> +               GPIO_LOOKUP("INT33FF:01", 53, "reset", GPIO_ACTIVE_HIGH),
>> +               GPIO_LOOKUP("INT33FF:01", 56, "irq", GPIO_ACTIVE_HIGH),
>> +               { }
>> +       },
>> +};
>> +
>> +static struct gpiod_lookup_table lenovo_yb1_x90_hideep_gpios = {
>> +       .dev_id = "i2c-hideep_ts",
>> +       .table = {
>> +               GPIO_LOOKUP("INT33FF:00", 7, "reset", GPIO_ACTIVE_LOW),
>> +               { }
>> +       },
>> +};
>> +
>> +static struct gpiod_lookup_table * const lenovo_yb1_x90_gpios[] = {
>> +       &lenovo_yb1_x90_hideep_gpios,
>> +       &lenovo_yb1_x90_goodix_gpios,
>> +       NULL
>> +};
>> +
>> +static int __init lenovo_yb1_x90_init(void)
>> +{
>> +       /* Enable the regulators used by the touchscreens */
>> +
>> +       /* Vprog3B 3.0V used by the goodix touchscreen in the keyboard half */
>> +       intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0x9b, 0x02, 0xff);
>> +
>> +       /* Vprog4D 3.0V used by the HiDeep touchscreen in the display half */
>> +       intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0x9f, 0x02, 0xff);
>> +
>> +       /* Vprog5A 1.8V used by the HiDeep touchscreen in the display half */
>> +       intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0xa0, 0x02, 0xff);
>> +
>> +       /* Vprog5B 1.8V used by the goodix touchscreen in the keyboard half */
>> +       intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0xa1, 0x02, 0xff);
>> +
>> +       return 0;
>> +}
>> +
>> +const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
>> +       .i2c_client_info = lenovo_yb1_x90_i2c_clients,
>> +       .i2c_client_count = ARRAY_SIZE(lenovo_yb1_x90_i2c_clients),
>> +       .gpiod_lookup_tables = lenovo_yb1_x90_gpios,
>> +       .init = lenovo_yb1_x90_init,
>> +};
>> +
>>  /* Lenovo Yoga Book X91F/L Windows tablet needs manual instantiation of the fg client */
>>  static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __initconst = {
>>         {
>> diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
>> index c2b490519324..b6802d75dbdd 100644
>> --- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
>> +++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
>> @@ -94,6 +94,7 @@ extern const struct x86_dev_info asus_me176c_info;
>>  extern const struct x86_dev_info asus_tf103c_info;
>>  extern const struct x86_dev_info chuwi_hi8_info;
>>  extern const struct x86_dev_info czc_p10t;
>> +extern const struct x86_dev_info lenovo_yogabook_x90_info;
>>  extern const struct x86_dev_info lenovo_yogabook_x91_info;
>>  extern const struct x86_dev_info lenovo_yoga_tab2_830_1050_info;
>>  extern const struct x86_dev_info lenovo_yt3_info;
> 
> For the entire series
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks, I've added this to my review-hans branch now, with
the 2 suggested comment fixes squashed in.

Regards,

Hans


