Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1099C77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 09:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjEIJ0a (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 05:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbjEIJ03 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 05:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B9D97
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 02:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683624338;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eGDlZetmlCOLO0fUqhWWdR3cbHCPh418SeujG8QKx34=;
        b=RnwQioB+xFJd5kU2fwYnKCQn7c6/CW4T+DQUAkRi9wfvzJ52rivPgsT8oee2V9WmWmU/7v
        66BBw71an2eDIUJSMGNe+24yweF4FMXizU/USOBzOR50gRfrQDn8OAfRnW3lX8gg5tGoQ2
        PzOOgRUQvM8DHJFqgww5K5p3V7Nk2Hc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-Ci4L5bX9PzuyJ6D_HpJQew-1; Tue, 09 May 2023 05:25:37 -0400
X-MC-Unique: Ci4L5bX9PzuyJ6D_HpJQew-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a35b0d4ceso538323466b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 May 2023 02:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683624336; x=1686216336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGDlZetmlCOLO0fUqhWWdR3cbHCPh418SeujG8QKx34=;
        b=QIeNykNa0vE1c0asjJKpGCNqzw8LWgRakT1bTOdyndecBuSmCRp/d82rToLUQQ70vg
         bBNmfDyk4bWirqZ7Jo3NwVLg6cBqsrb2UMHC9xVm02LxPd/AX2OyTgFhg4faFLYjtg4V
         yzWqE2QqrDcGpHXTASsRzA/h7C/okkzH0HRnzGOCMtB81PY9uSwsQDSSgnE2wEOUJppV
         GjtyaHeo2jRAzMAnQ1/pthPzvEU7wSrQnGw0l/4pCmCLd5wfxNR0vL/jILzyV7PmdwMM
         ta7cbBb5Gv0M/3uGzcKZnoU3MjtkR0a6SD70Xcp+2ZpWqzjgwi147+aRWFNIGJG0WWVL
         epMg==
X-Gm-Message-State: AC+VfDxixj+scwI4mi6nYBfQicC8KPDlUoavkY4/EwvIShMeLrA3kb14
        euPC4kHp7G+BrqgGxNDxhpLrDxBYccxqmGXa+g0TZDdTrbuhe/AJmTdgOkqOGQx1yGCjuIzcxtA
        psPzWl4lwsG1ZYy/xlaPX+tsn9xm/Zb/JeA==
X-Received: by 2002:a17:907:3203:b0:94a:8f3a:1a77 with SMTP id xg3-20020a170907320300b0094a8f3a1a77mr11316333ejb.8.1683624335964;
        Tue, 09 May 2023 02:25:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5L2cJvxvF3rn+zunfCjbSxurCfWaR08aJvGuB510l7OsCPVOgewV+EY3vby9MN8ZVsRC04OQ==
X-Received: by 2002:a17:907:3203:b0:94a:8f3a:1a77 with SMTP id xg3-20020a170907320300b0094a8f3a1a77mr11316318ejb.8.1683624335648;
        Tue, 09 May 2023 02:25:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ml17-20020a170906cc1100b009661484e84esm1077409ejb.191.2023.05.09.02.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 02:25:34 -0700 (PDT)
Message-ID: <b212b426-7339-1ffd-6a59-a1dd7cc3ad72@redhat.com>
Date:   Tue, 9 May 2023 11:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/2] platform/x86: hp-wmi: Add HP WMI camera switch
Content-Language: en-US, nl
To:     Jonathan Singer <jes965@nyu.edu>,
        Mario Limonciello <Mario.Limonciello@amd.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Jorge Lopez <jorge.lopez2@hp.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20230426184852.2100-1-jes965@nyu.edu>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230426184852.2100-1-jes965@nyu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/26/23 20:48, Jonathan Singer wrote:
> Previously, when the camera toggle switch was hit, the hp-wmi driver
> would report an invalid event code. By adding a case for that in the
> event handling switch statement we can eliminate that error code and
> enable a framework for potential further kernel handling of that key.
> This change was tested on my HP Envy x360 15-ey0023dx laptop, but it
> would likely work for any HP laptop with a camera toggle button. Now
> we emit an SW_CAMERA_LENS_COVER event, on a device that gets created
> on the first such event so as to not report incorrectly the state of
> the camera shutter before we can know its state.
> 
> Signed-off-by: Jonathan Singer <jes965@nyu.edu>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
> V2 changes: Added SW_CAMERA_LENS_COVER switch event
> V3 changes: removed input dev sync, changed pr_info to pr_err/pr_warn
> 
>  drivers/platform/x86/hp/hp-wmi.c | 46 ++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 873f59c3e280..18d40270aa0d 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -90,6 +90,7 @@ enum hp_wmi_event_ids {
>  	HPWMI_PEAKSHIFT_PERIOD		= 0x0F,
>  	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
>  	HPWMI_SANITIZATION_MODE		= 0x17,
> +	HPWMI_CAMERA_TOGGLE		= 0x1A,
>  	HPWMI_OMEN_KEY			= 0x1D,
>  	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
>  };
> @@ -228,6 +229,7 @@ static const struct key_entry hp_wmi_keymap[] = {
>  };
>  
>  static struct input_dev *hp_wmi_input_dev;
> +static struct input_dev *camera_shutter_input_dev;
>  static struct platform_device *hp_wmi_platform_dev;
>  static struct platform_profile_handler platform_profile_handler;
>  static bool platform_profile_support;
> @@ -739,6 +741,33 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
>  	return count;
>  }
>  
> +static int camera_shutter_input_setup(void)
> +{
> +	int err;
> +
> +	camera_shutter_input_dev = input_allocate_device();
> +	if (!camera_shutter_input_dev)
> +		return -ENOMEM;
> +
> +	camera_shutter_input_dev->name = "HP WMI camera shutter";
> +	camera_shutter_input_dev->phys = "wmi/input1";
> +	camera_shutter_input_dev->id.bustype = BUS_HOST;
> +
> +	__set_bit(EV_SW, camera_shutter_input_dev->evbit);
> +	__set_bit(SW_CAMERA_LENS_COVER, camera_shutter_input_dev->swbit);
> +
> +	err = input_register_device(camera_shutter_input_dev);
> +	if (err)
> +		goto err_free_dev;
> +
> +	return 0;
> +
> + err_free_dev:
> +	input_free_device(camera_shutter_input_dev);
> +	camera_shutter_input_dev = NULL;
> +	return err;
> +}
> +
>  static DEVICE_ATTR_RO(display);
>  static DEVICE_ATTR_RO(hddtemp);
>  static DEVICE_ATTR_RW(als);
> @@ -866,6 +895,20 @@ static void hp_wmi_notify(u32 value, void *context)
>  		break;
>  	case HPWMI_SANITIZATION_MODE:
>  		break;
> +	case HPWMI_CAMERA_TOGGLE:
> +		if (!camera_shutter_input_dev)
> +			if (camera_shutter_input_setup()) {
> +				pr_err("Failed to setup camera shutter input device\n");
> +				break;
> +			}
> +		if (event_data == 0xff)
> +			input_report_switch(camera_shutter_input_dev, SW_CAMERA_LENS_COVER, 1);
> +		else if (event_data == 0xfe)
> +			input_report_switch(camera_shutter_input_dev, SW_CAMERA_LENS_COVER, 0);
> +		else
> +			pr_warn("Unknown camera shutter state - 0x%x\n", event_data);
> +		input_sync(camera_shutter_input_dev);
> +		break;
>  	case HPWMI_SMART_EXPERIENCE_APP:
>  		break;
>  	default:
> @@ -1564,6 +1607,9 @@ static void __exit hp_wmi_exit(void)
>  	if (wmi_has_guid(HPWMI_EVENT_GUID))
>  		hp_wmi_input_destroy();
>  
> +	if (camera_shutter_input_dev)
> +		input_unregister_device(camera_shutter_input_dev);
> +
>  	if (hp_wmi_platform_dev) {
>  		platform_device_unregister(hp_wmi_platform_dev);
>  		platform_driver_unregister(&hp_wmi_driver);

