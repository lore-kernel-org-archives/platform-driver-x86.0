Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FA3C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 14:16:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C49564ED4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 14:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234633AbhCDOPr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 09:15:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34040 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241516AbhCDOPn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 09:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614867258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZHEtkAc+ANyrWdBz9aEx0kU8RbRQM2rmh1vdtm5/Uuk=;
        b=gjYbjfZmcWxxlc32QF37vlieChEORm9+CP/BBo2PWm6uk2NCiRG87qzeGIbzEyZ/67Hj7t
        zeRTe5NQXGTCLH7T2uhjXeF2czRV1fTjZqATmS9qhFjDSiLJBB9PiY8f8l3xsvnRXWk3c+
        rtnDeS85KJSYYTm0NyXd6cntLE7JFR4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-UVaoj0ngOxeGsutdgNqr-w-1; Thu, 04 Mar 2021 09:14:16 -0500
X-MC-Unique: UVaoj0ngOxeGsutdgNqr-w-1
Received: by mail-ed1-f72.google.com with SMTP id p12so14108908edw.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 06:14:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZHEtkAc+ANyrWdBz9aEx0kU8RbRQM2rmh1vdtm5/Uuk=;
        b=p5El9Pw44VnzdwVFGztivs7e/9FcYEKOkT+9yxeGwQLmbbcSSXWEsXatCpDueW1ioP
         GF2P9x51IS61ps14qdbq+5BOMO3NTBHtN6tblDwE9tzJHvnluB/knns2+NvuVepjw8Py
         WleLaiWZTjqwsTp5Tf+j/Xm74u3JlPCvrvFqiwGSMVYIplmbkkl1fSGFvjbSalZ9vyGP
         zSRD4kZhYSBMY8N/rn41YYABW/CHYjHcRN6Hfvo+J9WlZpnGmAxdT/ZxAretFn5rfpl4
         VOlRO9//c1QBv3NV2jK/LlnmhSsu9+acd5nDgKGp3aX7ylUbqeCXjmbRwA9FP3/ST6If
         y88Q==
X-Gm-Message-State: AOAM533/0FHaQOsB0Ah7TYE8D2SXFazYgt1HZhg43okTT77nvfiUXx9c
        qGQ++puZDCzA93jyExC54DKvQkaAr7ajG5dLa3J0H2xfs2LZ3kn+JssFiMnSVWyHRPQM07/Ma61
        z3PTG+curJdZZsxzkSMS2C3C70CCLpxvvFw==
X-Received: by 2002:a17:906:7384:: with SMTP id f4mr4561430ejl.196.1614867254034;
        Thu, 04 Mar 2021 06:14:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZWxXzWhWvumv+o5YcOwledvDlDhHzWNUT9BZkb/+OhIgI/Ka9cyaKLZ+FDljIiJ4YOgGPog==
X-Received: by 2002:a17:906:7384:: with SMTP id f4mr4561408ejl.196.1614867253804;
        Thu, 04 Mar 2021 06:14:13 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id la15sm20080084ejb.46.2021.03.04.06.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 06:14:13 -0800 (PST)
Subject: Re: [PATCH] platform/x86: wmi: Make remove callback return void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
References: <20210301160404.1677064-1-u.kleine-koenig@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7111fda6-f3ab-0999-8744-4768c2dc56ba@redhat.com>
Date:   Thu, 4 Mar 2021 15:14:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301160404.1677064-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/1/21 5:04 PM, Uwe Kleine-König wrote:
> The driver core ignores the return value of struct bus_type::remove()
> (and so wmi_dev_remove()) because there is only little that can be done.
> 
> To simplify the quest to make this function return void, let struct
> wmi_driver::remove() return void, too. All implementers of this callback
> return 0 already and this way it should be obvious to driver authors
> that returning an error code is a bad idea.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/dell/dell-smbios-wmi.c                  | 3 +--
>  drivers/platform/x86/dell/dell-wmi-descriptor.c              | 3 +--
>  .../platform/x86/dell/dell-wmi-sysman/biosattr-interface.c   | 3 +--
>  .../x86/dell/dell-wmi-sysman/passwordattr-interface.c        | 3 +--
>  drivers/platform/x86/dell/dell-wmi.c                         | 3 +--
>  drivers/platform/x86/intel-wmi-sbl-fw-update.c               | 3 +--
>  drivers/platform/x86/intel-wmi-thunderbolt.c                 | 3 +--
>  drivers/platform/x86/wmi-bmof.c                              | 3 +--
>  drivers/platform/x86/wmi.c                                   | 5 ++---
>  include/linux/wmi.h                                          | 2 +-
>  10 files changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
> index 27a298b7c541..a1753485159c 100644
> --- a/drivers/platform/x86/dell/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
> @@ -205,7 +205,7 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev, const void *context)
>  	return ret;
>  }
>  
> -static int dell_smbios_wmi_remove(struct wmi_device *wdev)
> +static void dell_smbios_wmi_remove(struct wmi_device *wdev)
>  {
>  	struct wmi_smbios_priv *priv = dev_get_drvdata(&wdev->dev);
>  	int count;
> @@ -218,7 +218,6 @@ static int dell_smbios_wmi_remove(struct wmi_device *wdev)
>  	count = get_order(priv->req_buf_size);
>  	free_pages((unsigned long)priv->buf, count);
>  	mutex_unlock(&call_mutex);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
> diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> index a068900ae8a1..3c4af7c08bb1 100644
> --- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
> +++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> @@ -174,14 +174,13 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
>  	return ret;
>  }
>  
> -static int dell_wmi_descriptor_remove(struct wmi_device *wdev)
> +static void dell_wmi_descriptor_remove(struct wmi_device *wdev)
>  {
>  	struct descriptor_priv *priv = dev_get_drvdata(&wdev->dev);
>  
>  	mutex_lock(&list_mutex);
>  	list_del(&priv->list);
>  	mutex_unlock(&list_mutex);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id dell_wmi_descriptor_id_table[] = {
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
> index f95d8ddace5a..c2dd2de6bc20 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
> @@ -152,12 +152,11 @@ static int bios_attr_set_interface_probe(struct wmi_device *wdev, const void *co
>  	return 0;
>  }
>  
> -static int bios_attr_set_interface_remove(struct wmi_device *wdev)
> +static void bios_attr_set_interface_remove(struct wmi_device *wdev)
>  {
>  	mutex_lock(&wmi_priv.mutex);
>  	wmi_priv.bios_attr_wdev = NULL;
>  	mutex_unlock(&wmi_priv.mutex);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id bios_attr_set_interface_id_table[] = {
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> index 5780b4d94759..339a082d6c18 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> @@ -119,12 +119,11 @@ static int bios_attr_pass_interface_probe(struct wmi_device *wdev, const void *c
>  	return 0;
>  }
>  
> -static int bios_attr_pass_interface_remove(struct wmi_device *wdev)
> +static void bios_attr_pass_interface_remove(struct wmi_device *wdev)
>  {
>  	mutex_lock(&wmi_priv.mutex);
>  	wmi_priv.password_attr_wdev = NULL;
>  	mutex_unlock(&wmi_priv.mutex);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id bios_attr_pass_interface_id_table[] = {
> diff --git a/drivers/platform/x86/dell/dell-wmi.c b/drivers/platform/x86/dell/dell-wmi.c
> index bbdb3e860892..5e1b7f897df5 100644
> --- a/drivers/platform/x86/dell/dell-wmi.c
> +++ b/drivers/platform/x86/dell/dell-wmi.c
> @@ -714,10 +714,9 @@ static int dell_wmi_probe(struct wmi_device *wdev, const void *context)
>  	return dell_wmi_input_setup(wdev);
>  }
>  
> -static int dell_wmi_remove(struct wmi_device *wdev)
> +static void dell_wmi_remove(struct wmi_device *wdev)
>  {
>  	dell_wmi_input_destroy(wdev);
> -	return 0;
>  }
>  static const struct wmi_device_id dell_wmi_id_table[] = {
>  	{ .guid_string = DELL_EVENT_GUID },
> diff --git a/drivers/platform/x86/intel-wmi-sbl-fw-update.c b/drivers/platform/x86/intel-wmi-sbl-fw-update.c
> index ea87fa0786e8..3c86e0108a24 100644
> --- a/drivers/platform/x86/intel-wmi-sbl-fw-update.c
> +++ b/drivers/platform/x86/intel-wmi-sbl-fw-update.c
> @@ -117,10 +117,9 @@ static int intel_wmi_sbl_fw_update_probe(struct wmi_device *wdev,
>  	return 0;
>  }
>  
> -static int intel_wmi_sbl_fw_update_remove(struct wmi_device *wdev)
> +static void intel_wmi_sbl_fw_update_remove(struct wmi_device *wdev)
>  {
>  	dev_info(&wdev->dev, "Slim Bootloader signaling driver removed\n");
> -	return 0;
>  }
>  
>  static const struct wmi_device_id intel_wmi_sbl_id_table[] = {
> diff --git a/drivers/platform/x86/intel-wmi-thunderbolt.c b/drivers/platform/x86/intel-wmi-thunderbolt.c
> index 974c22a7ff61..4ae87060d18b 100644
> --- a/drivers/platform/x86/intel-wmi-thunderbolt.c
> +++ b/drivers/platform/x86/intel-wmi-thunderbolt.c
> @@ -66,11 +66,10 @@ static int intel_wmi_thunderbolt_probe(struct wmi_device *wdev,
>  	return ret;
>  }
>  
> -static int intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
> +static void intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
>  {
>  	sysfs_remove_group(&wdev->dev.kobj, &tbt_attribute_group);
>  	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id intel_wmi_thunderbolt_id_table[] = {
> diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
> index 66b434d6307f..80137afb9753 100644
> --- a/drivers/platform/x86/wmi-bmof.c
> +++ b/drivers/platform/x86/wmi-bmof.c
> @@ -86,13 +86,12 @@ static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
>  	return ret;
>  }
>  
> -static int wmi_bmof_remove(struct wmi_device *wdev)
> +static void wmi_bmof_remove(struct wmi_device *wdev)
>  {
>  	struct bmof_priv *priv = dev_get_drvdata(&wdev->dev);
>  
>  	sysfs_remove_bin_file(&wdev->dev.kobj, &priv->bmof_bin_attr);
>  	kfree(priv->bmofdata);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id wmi_bmof_id_table[] = {
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index c669676ea8e8..aa9bd2ee7390 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -986,7 +986,6 @@ static int wmi_dev_remove(struct device *dev)
>  	struct wmi_block *wblock = dev_to_wblock(dev);
>  	struct wmi_driver *wdriver =
>  		container_of(dev->driver, struct wmi_driver, driver);
> -	int ret = 0;
>  
>  	if (wdriver->filter_callback) {
>  		misc_deregister(&wblock->char_dev);
> @@ -995,12 +994,12 @@ static int wmi_dev_remove(struct device *dev)
>  	}
>  
>  	if (wdriver->remove)
> -		ret = wdriver->remove(dev_to_wdev(dev));
> +		wdriver->remove(dev_to_wdev(dev));
>  
>  	if (ACPI_FAILURE(wmi_method_enable(wblock, 0)))
>  		dev_warn(dev, "failed to disable device\n");
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static struct class wmi_bus_class = {
> diff --git a/include/linux/wmi.h b/include/linux/wmi.h
> index 8ef7e7faea1e..2cb3913c1f50 100644
> --- a/include/linux/wmi.h
> +++ b/include/linux/wmi.h
> @@ -37,7 +37,7 @@ struct wmi_driver {
>  	const struct wmi_device_id *id_table;
>  
>  	int (*probe)(struct wmi_device *wdev, const void *context);
> -	int (*remove)(struct wmi_device *wdev);
> +	void (*remove)(struct wmi_device *wdev);
>  	void (*notify)(struct wmi_device *device, union acpi_object *data);
>  	long (*filter_callback)(struct wmi_device *wdev, unsigned int cmd,
>  				struct wmi_ioctl_buffer *arg);
> 

