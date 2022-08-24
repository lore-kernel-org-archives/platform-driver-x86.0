Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9E5C38142
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Aug 2022 13:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238658AbiHXNy7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 09:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbiHXNym (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 09:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B889A9B7
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661349114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CXkViq0AL4M4jKlvREvWic60usHrsSFfTWZqwClV86Y=;
        b=GwlCrf6GBt4IoJpEWPNjT9ELd3aNrIas29sDJNmza80l/vhD2o4KWv3F+odbQwpl1yVJKG
        FZxUlfG4aHOXsUr0mpHT4RjJaXiZHY5qd0+BKDt09vN4RRfkXWFwwBpHAu9XHTB9Mp9aFo
        e1XtB2B8l4A2MB5vDVCtTuBmw3TLIKs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-pAw6_HDLOFKHQxfYe8AZDQ-1; Wed, 24 Aug 2022 09:51:53 -0400
X-MC-Unique: pAw6_HDLOFKHQxfYe8AZDQ-1
Received: by mail-ed1-f71.google.com with SMTP id m16-20020a056402431000b0044662a0ba2cso8096425edc.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 06:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=CXkViq0AL4M4jKlvREvWic60usHrsSFfTWZqwClV86Y=;
        b=QVh7s5M7njTt9eshkq/0gdJyi4FpuRlsh1myxH0WzoYjKDYuOuehpbYKqNRmClx59z
         Z3oaybq4TY1r9kmNhK07Y73k52XPfkRMGR/AG8k+6/Pijbtk4Vml9HwHK1ivL8xDRNvd
         eVdMqby+v6GUzxHrF7bPmrOISQ36YQmygnL0B0pwPP/7rE3PzBJKKtDg5u8IuKJFi0Xc
         y264rgkLjnbxIeIQ204YpKoUKbN+Z3TYJDhe4dfMooj0ogaGQaFIuujPTBb/51vipghR
         JvPDYysoP0p84dSVaOTqUAm2+ENlqSCfs5kZOCl/cs+h+VugGWc0d75DT85kgDVREh74
         Jing==
X-Gm-Message-State: ACgBeo1DE91pjA6ugA84Hiua6m0vzUNyTv2p7/WzuYVkAdkepgBmgJDZ
        vim7NkmybGoFx9RC8lSx4h3fhHbgTzMM0vrKEVpz7hkdgcPE1HbwgHBPOHgXsY3jLfkpyv4Vf5o
        QlwcYWf/DY2Lt2YSfoOz+BHli3rKuO/O/Ag==
X-Received: by 2002:a17:906:5a4c:b0:73d:60b8:618c with SMTP id my12-20020a1709065a4c00b0073d60b8618cmr3019851ejc.740.1661349112209;
        Wed, 24 Aug 2022 06:51:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7jVVal+ZBOJliVJemZcZdjoAJ/YIbvtSmhX0ToQoagmAazizDmmBCKCHbfnCBU0inxmW0xDQ==
X-Received: by 2002:a17:906:5a4c:b0:73d:60b8:618c with SMTP id my12-20020a1709065a4c00b0073d60b8618cmr3019841ejc.740.1661349111953;
        Wed, 24 Aug 2022 06:51:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090618a900b007311eb42e40sm1228393ejf.54.2022.08.24.06.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:51:51 -0700 (PDT)
Message-ID: <44b937bf-dff7-c301-1c5e-51fb1aed87e8@redhat.com>
Date:   Wed, 24 Aug 2022 15:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] asus-wmi: Support the hardware GPU MUX on some laptops
Content-Language: en-US
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220813092624.6228-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220813092624.6228-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/13/22 11:26, Luke D. Jones wrote:
> Support the hardware GPU MUX switch available on some models. This
> switch can toggle the MUX between:
> 
> - 0, Dedicated mode
> - 1, Optimus mode
> 
> Optimus mode is the regular iGPU + dGPU available, while dedicated
> mode switches the system to have only the dGPU available.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note there were several whitespace/indentation issues with this
patch. The documentation patch was using spaces instead of tabs
and the .c changes where using 3 space indents instead of tabs
in some places. I've fixed this up while merging this time around,
but for future submissions please ensure that you get the indentation
right and that you only use tabs and not spaces.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  .../ABI/testing/sysfs-platform-asus-wmi       | 11 ++++
>  drivers/platform/x86/asus-wmi.c               | 62 +++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h    |  3 +
>  3 files changed, 76 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> index 574b5170a37d..03124eab7f01 100644
> --- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
> +++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> @@ -58,6 +58,17 @@ Description:
>  			* 1 - overboost,
>  			* 2 - silent
>  
> +What:          /sys/devices/platform/<platform>/gpu_mux_mode
> +Date:          Aug 2022
> +KernelVersion: 6.1
> +Contact:       "Luke Jones" <luke@ljones.dev>
> +Description:
> +               Switch the GPU hardware MUX mode. Laptops with this feature can
> +			   can be toggled to boot with only the dGPU (discrete mode) or in
> +			   standard Optimus/Hybrid mode. On switch a reboot is required:
> +                       * 0 - Discrete GPU,
> +                       * 1 - Optimus/Hybrid,
> +
>  What:          /sys/devices/platform/<platform>/dgpu_disable
>  Date:          Aug 2022
>  KernelVersion: 5.17
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index e2b51b5550e8..0421ffb81927 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -230,6 +230,7 @@ struct asus_wmi {
>  
>  	bool egpu_enable_available;
>  	bool dgpu_disable_available;
> +	bool gpu_mux_mode_available;
>  
>  	bool throttle_thermal_policy_available;
>  	u8 throttle_thermal_policy_mode;
> @@ -668,6 +669,59 @@ static ssize_t egpu_enable_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(egpu_enable);
>  
> +/* gpu mux switch *************************************************************/
> +static int gpu_mux_mode_check_present(struct asus_wmi *asus)
> +{
> +	asus->gpu_mux_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_GPU_MUX);
> +
> +   return 0;
> +}
> +
> +static ssize_t gpu_mux_mode_show(struct device *dev,
> +                  struct device_attribute *attr, char *buf)
> +{
> +   struct asus_wmi *asus = dev_get_drvdata(dev);
> +   int result;
> +
> +   result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_GPU_MUX);
> +   if (result < 0)
> +       return result;
> +
> +   return sysfs_emit(buf, "%d\n", result);
> +}
> +
> +static ssize_t gpu_mux_mode_store(struct device *dev,
> +                   struct device_attribute *attr,
> +                   const char *buf, size_t count)
> +{
> +   struct asus_wmi *asus = dev_get_drvdata(dev);
> +   int result, err;
> +   u32 optimus;
> +
> +   err = kstrtou32(buf, 10, &optimus);
> +   if (err)
> +       return err;
> +
> +   if (optimus > 1)
> +       return -EINVAL;
> +
> +   err = asus_wmi_set_devstate(ASUS_WMI_DEVID_GPU_MUX, optimus, &result);
> +   if (err) {
> +       dev_err(dev, "Failed to set GPU MUX mode: %d\n", err);
> +       return err;
> +   }
> +	/* !1 is considered a fail by ASUS */
> +	if (result != 1) {
> +		dev_warn(dev, "Failed to set GPU MUX mode (result): 0x%x\n", result);
> +       return -EIO;
> +   }
> +
> +   sysfs_notify(&asus->platform_device->dev.kobj, NULL, "gpu_mux_mode");
> +
> +   return count;
> +}
> +static DEVICE_ATTR_RW(gpu_mux_mode);
> +
>  /* Battery ********************************************************************/
>  
>  /* The battery maximum charging percentage */
> @@ -3165,6 +3219,7 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_touchpad.attr,
>  	&dev_attr_egpu_enable.attr,
>  	&dev_attr_dgpu_disable.attr,
> +	&dev_attr_gpu_mux_mode.attr,
>  	&dev_attr_lid_resume.attr,
>  	&dev_attr_als_enable.attr,
>  	&dev_attr_fan_boost_mode.attr,
> @@ -3195,6 +3250,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		ok = asus->egpu_enable_available;
>  	else if (attr == &dev_attr_dgpu_disable.attr)
>  		ok = asus->dgpu_disable_available;
> +	else if (attr == &dev_attr_gpu_mux_mode.attr)
> +		ok = asus->gpu_mux_mode_available;
>  	else if (attr == &dev_attr_fan_boost_mode.attr)
>  		ok = asus->fan_boost_mode_available;
>  	else if (attr == &dev_attr_throttle_thermal_policy.attr)
> @@ -3464,6 +3521,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_dgpu_disable;
>  
> +	err = gpu_mux_mode_check_present(asus);
> +   if (err)
> +       goto fail_gpu_mux_mode;
> +
>  	err = fan_boost_mode_check_present(asus);
>  	if (err)
>  		goto fail_fan_boost_mode;
> @@ -3578,6 +3639,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  fail_fan_boost_mode:
>  fail_egpu_enable:
>  fail_dgpu_disable:
> +fail_gpu_mux_mode:
>  fail_platform:
>  fail_panel_od:
>  	kfree(asus);
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index a571b47ff362..c023332842a2 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -98,6 +98,9 @@
>  /* dgpu on/off */
>  #define ASUS_WMI_DEVID_DGPU		0x00090020
>  
> +/* gpu mux switch, 0 = dGPU, 1 = Optimus */
> +#define ASUS_WMI_DEVID_GPU_MUX 0x00090016
> +
>  /* DSTS masks */
>  #define ASUS_WMI_DSTS_STATUS_BIT	0x00000001
>  #define ASUS_WMI_DSTS_UNKNOWN_BIT	0x00000002

