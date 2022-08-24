Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCC3C00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Aug 2022 08:49:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235911AbiHXItI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 04:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236209AbiHXIsu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 04:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0924E9321E
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 01:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661330899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3b5H498963+AB/0Lty0yIaPk3vKHvLI1X+kTREvIeXQ=;
        b=Mzzbb1GMA1NbNr3ogEc2eROhSJ4ezl2b1hfZ6zhRGkQ83nq5abNQG7dLmeStIdVjiYIsGB
        Z0DKb/PZGQMq60gbB5LeQUZFd+ficB2l1JLS8lWW/HZXVqZbr3lnWNjKLO2LqPXuklluyL
        lfqqFf0SlESdweRx4qVrlJ7tZQeocU0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-98WCaHyZNMSauvuhG5fjLA-1; Wed, 24 Aug 2022 04:48:17 -0400
X-MC-Unique: 98WCaHyZNMSauvuhG5fjLA-1
Received: by mail-ed1-f71.google.com with SMTP id c14-20020a05640227ce00b0043e5df12e2cso10582680ede.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 01:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3b5H498963+AB/0Lty0yIaPk3vKHvLI1X+kTREvIeXQ=;
        b=f+MgnrAg6r3Uyo/P3FRpfZU+0LzJK/yFWbSKKQn8WRygTGc5WgaSmccDwGK3ljaLk3
         HwKHKhUhgPm2lql9uTJllFPuxovpQ4ylYH7prptIIUc5kRv4a13ujG2qpfGrt2pB+2zD
         4sSWK2XVbsFX9VFBRkPEapt25Vu60I9mBNrnKrY6TtziHTCLjW7u8GZtq4WVoRWM8VD7
         XZgvp66HbX06DeoEfRy2aBlWs20OlfjIaCa11qsc1AyyLBDmQRE5daqHh2IdrVrD+PHx
         R6R5AWUUpF8UC4Rjx4xgNr11r5wqP24eRFr1V3sgqspCnyx/4UxfQOw+DpOzS1yekK5Q
         4zOA==
X-Gm-Message-State: ACgBeo0TU+6MvmBphCgd5nfaSF7iGCJXkBqNwm1mUAcdzgtXTqj4ddrp
        bG59j0cvP8UD7BcRZEtnfK2aIPKaV9MgspWJxmdhWbt0Bm03eE3HYQVV6Sp8Vgmvgj89pC8VYob
        AarzVWKCUcBnrI36+IPOjy2dZSHbXl3snSQ==
X-Received: by 2002:a05:6402:254a:b0:446:d52a:6c8 with SMTP id l10-20020a056402254a00b00446d52a06c8mr6860614edb.107.1661330896507;
        Wed, 24 Aug 2022 01:48:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR48qUY/LgfcTxr0bevDtkTsOmAexPsXw+6/kZWgxlccgeMtQaRHyicq5rWuwm5/sgxWH4kgNw==
X-Received: by 2002:a05:6402:254a:b0:446:d52a:6c8 with SMTP id l10-20020a056402254a00b00446d52a06c8mr6860606edb.107.1661330896316;
        Wed, 24 Aug 2022 01:48:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ss2-20020a170907c00200b0073bdf71995dsm830352ejc.139.2022.08.24.01.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 01:48:15 -0700 (PDT)
Message-ID: <fec3470f-03c4-917c-fb36-92b50654a625@redhat.com>
Date:   Wed, 24 Aug 2022 10:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] platform/x86: Battery charge mode in toshiba_acpi
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>
References: <20220821200821.1837460-1-lkml@vorpal.se>
 <20220821200821.1837460-3-lkml@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220821200821.1837460-3-lkml@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/21/22 22:08, Arvid Norlander wrote:
> Unlike for example ThinkPads where this control is granular here it is
> just off/on. When off it charges to 100%. When on it charges to about 80%.
> 
> Controlling this setting is done via HCI register 0x00ba. Setting to value
> 1 will result in limiting the charing to 80% of the battery capacity,
> while setting it to 0 will allow charging to 100%.
> 
> Reading the current state is a bit weird, and needs a 1 set in the last
> position of the query for whatever reason. In addition, the read may
> return 0x8d20 (Data not available) rarely, so a retry mechanism is needed.
> 
> According to the Windows program used to control the feature the setting
> will not take effect until the battery has been discharged to around 50%.
> However, in my testing it takes effect as soon as the charge drops below
> 80%. On Windows Toshiba branded this feature as "Eco charging".
> 
> Signed-off-by: Arvid Norlander <lkml@vorpal.se>

As mentioned in my reply to the cover-letter it would be better IMHO
to use the standard /sys/class/power_supply/BAT*/charge_control_end_threshold
sysfs attribute for this functionality.

Regards,

Hans


> ---
>  drivers/platform/x86/toshiba_acpi.c | 110 ++++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 6cc617b2940e..2e13f241538a 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -112,6 +112,7 @@ MODULE_LICENSE("GPL");
>  #define HCI_KBD_ILLUMINATION		0x0095
>  #define HCI_ECO_MODE			0x0097
>  #define HCI_ACCELEROMETER2		0x00a6
> +#define HCI_BATTERY_CHARGE_MODE		0x00ba
>  #define HCI_SYSTEM_INFO			0xc000
>  #define SCI_PANEL_POWER_ON		0x010d
>  #define SCI_ILLUMINATION		0x014e
> @@ -201,6 +202,7 @@ struct toshiba_acpi_dev {
>  	unsigned int usb_three_supported:1;
>  	unsigned int wwan_supported:1;
>  	unsigned int cooling_method_supported:1;
> +	unsigned int battery_charge_mode_supported:1;
>  	unsigned int sysfs_created:1;
>  	unsigned int special_functions;
>  
> @@ -1285,6 +1287,69 @@ static int toshiba_cooling_method_set(struct toshiba_acpi_dev *dev, u32 state)
>  	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
>  }
>  
> +/* Battery charge control */
> +static void toshiba_battery_charge_mode_available(struct toshiba_acpi_dev *dev)
> +{
> +	u32 in[TCI_WORDS] = { HCI_GET, HCI_BATTERY_CHARGE_MODE, 0, 0, 0, 0 };
> +	u32 out[TCI_WORDS];
> +	acpi_status status;
> +
> +	dev->battery_charge_mode_supported = 0;
> +
> +	status = tci_raw(dev, in, out);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("ACPI call to get Battery Charge Mode failed\n");
> +		return;
> +	}
> +
> +	if (out[0] != TOS_SUCCESS && out[0] != TOS_SUCCESS2)
> +		return;
> +
> +	dev->battery_charge_mode_supported = 1;
> +}
> +
> +static int toshiba_battery_charge_mode_get(struct toshiba_acpi_dev *dev, u32 *state)
> +{
> +	u32 in[TCI_WORDS] = { HCI_GET, HCI_BATTERY_CHARGE_MODE, 0, 0, 0, 0x1 };
> +	u32 out[TCI_WORDS];
> +	int retries = 3;
> +
> +	do {
> +		acpi_status status = tci_raw(dev, in, out);
> +
> +		if (ACPI_FAILURE(status))
> +			pr_err("ACPI call to get Battery Charge Mode failed\n");
> +		switch (out[0]) {
> +		case TOS_SUCCESS:
> +		case TOS_SUCCESS2:
> +			*state = out[2];
> +			return 0;
> +		case TOS_NOT_SUPPORTED:
> +			return -ENODEV;
> +		case TOS_DATA_NOT_AVAILABLE:
> +			retries--;
> +			break;
> +		default:
> +			return -EIO;
> +		}
> +	} while (retries);
> +
> +	return -EIO;
> +}
> +
> +static int toshiba_battery_charge_mode_set(struct toshiba_acpi_dev *dev, u32 state)
> +{
> +	u32 result = hci_write(dev, HCI_BATTERY_CHARGE_MODE, state);
> +
> +	if (result == TOS_FAILURE)
> +		pr_err("ACPI call to set Battery Charge Mode failed\n");
> +
> +	if (result == TOS_NOT_SUPPORTED)
> +		return -ENODEV;
> +
> +	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
> +}
> +
>  /* Transflective Backlight */
>  static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, u32 *status)
>  {
> @@ -2334,6 +2399,44 @@ static ssize_t cooling_method_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(cooling_method);
>  
> +static ssize_t battery_charge_mode_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> +	int state;
> +	int ret;
> +
> +	ret = toshiba_battery_charge_mode_get(toshiba, &state);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sprintf(buf, "%d\n", state);
> +}
> +
> +static ssize_t battery_charge_mode_store(struct device *dev,
> +					    struct device_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> +	int state;
> +	int ret;
> +
> +	ret = kstrtoint(buf, 0, &state);
> +	if (ret)
> +		return ret;
> +
> +	if (state != 0 && state != 1)
> +		return -EINVAL;
> +
> +	ret = toshiba_battery_charge_mode_set(toshiba, state);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(battery_charge_mode);
> +
>  static struct attribute *toshiba_attributes[] = {
>  	&dev_attr_version.attr,
>  	&dev_attr_fan.attr,
> @@ -2350,6 +2453,7 @@ static struct attribute *toshiba_attributes[] = {
>  	&dev_attr_panel_power_on.attr,
>  	&dev_attr_usb_three.attr,
>  	&dev_attr_cooling_method.attr,
> +	&dev_attr_battery_charge_mode.attr,
>  	NULL,
>  };
>  
> @@ -2384,6 +2488,8 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
>  		exists = (drv->usb_three_supported) ? true : false;
>  	else if (attr == &dev_attr_cooling_method.attr)
>  		exists = (drv->cooling_method_supported) ? true : false;
> +	else if (attr == &dev_attr_battery_charge_mode.attr)
> +		exists = (drv->battery_charge_mode_supported) ? true : false;
>  
>  	return exists ? attr->mode : 0;
>  }
> @@ -2959,6 +3065,8 @@ static void print_supported_features(struct toshiba_acpi_dev *dev)
>  		pr_cont(" wwan");
>  	if (dev->cooling_method_supported)
>  		pr_cont(" cooling-method");
> +	if (dev->battery_charge_mode_supported)
> +		pr_cont(" battery-charge-mode");
>  
>  	pr_cont("\n");
>  }
> @@ -3166,6 +3274,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>  
>  	toshiba_cooling_method_available(dev);
>  
> +	toshiba_battery_charge_mode_available(dev);
> +
>  	print_supported_features(dev);
>  
>  	ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,

