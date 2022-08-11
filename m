Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C02C19F2A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Aug 2022 13:53:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234453AbiHKNx3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Aug 2022 09:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbiHKNx2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Aug 2022 09:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A9A2F60695
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660226002;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SWuRKiT75z9a16q2MPD/aE6+mx39JiXpC1mrBGsKMEc=;
        b=cANN0H7DiigXXKLO1IvJ1ZoAg91MjHqPYhamC4EFAhfg5FknaqNAeofXaxGPisi+YZQd68
        QUxx7Cs2aSf6W27AixcUwNnNvSYOCV7LySandDhtRi5PLYm2KJ3cbOliKOp071rF0pvZAX
        RvHF2afwM3yVrzTnA7eg8k9gTFuTlkg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-TizkAp8QMQShcHUsqWNkQQ-1; Thu, 11 Aug 2022 09:53:21 -0400
X-MC-Unique: TizkAp8QMQShcHUsqWNkQQ-1
Received: by mail-ej1-f71.google.com with SMTP id gs35-20020a1709072d2300b00730e14fd76eso5528990ejc.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 06:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SWuRKiT75z9a16q2MPD/aE6+mx39JiXpC1mrBGsKMEc=;
        b=invcMx51LngU01kvCzcO1LgTLm6CP+8c6H8+KKEW+PPAKrJ036TNAzXKWh2/vX5Pbm
         lnWZB6CDNf5/ttepjg/CA3VgVEw6zuoK2ZZjk+9BOOJ6/MnUQv6Ni+ymJmHpIV9b8bi3
         XRttzJfPuquXfIyd3oxSbxp/temiGZPxzd6Vz9VUsW8uo7Xjm2Yx+oYvXbavSrSkzP30
         8EvEt/EhqJfn0T/W6q8iclMx48JLKlUfGimCbFHex30Dtq7FkhsFDuGQDwyozVkUxIk8
         eYpHuwt4jYNs/vEbcOSmVB/kfRFp36jnf/MFkY68Or/ekXw6ENBArUasytV67sqAYGhO
         VACw==
X-Gm-Message-State: ACgBeo2O5cn8PipDWVL8/7SK9oH93fXYXauzLQxTE6Q9A92KyvocSpp8
        EZ5/1ytvvrkl37ntxLcqa8p2fhC0Cx8z6HDKgdHRmq8cZRUKQ8jz7iJU4SbCnvCiS0Rzzyv2HBG
        qoA4n4mS3sQuV4QNQtXfZQBXcsDWT2ebSlg==
X-Received: by 2002:aa7:d795:0:b0:43c:eb00:fc77 with SMTP id s21-20020aa7d795000000b0043ceb00fc77mr30641908edq.284.1660226000540;
        Thu, 11 Aug 2022 06:53:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR540u5ikNl8UGmWgyWIFhXPkhu0rJJ2YoL/XzzsPBpJPOELwxayiGQvp9cQrdS7rFWaTcE/pA==
X-Received: by 2002:aa7:d795:0:b0:43c:eb00:fc77 with SMTP id s21-20020aa7d795000000b0043ceb00fc77mr30641898edq.284.1660226000365;
        Thu, 11 Aug 2022 06:53:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y2-20020a170906070200b007306df330e5sm3630873ejb.12.2022.08.11.06.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 06:53:19 -0700 (PDT)
Message-ID: <7365d41a-1475-118c-96a8-6ab927bda5b7@redhat.com>
Date:   Thu, 11 Aug 2022 15:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 6/6] asus-wmi: Support the hardware GPU MUX on some
 laptops
Content-Language: en-US
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     andy.shevchenko@gmail.com, pobrn@protonmail.com, pavel@ucw.cz,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220809025054.1626339-1-luke@ljones.dev>
 <20220809025054.1626339-7-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220809025054.1626339-7-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/9/22 04:50, Luke D. Jones wrote:
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

I see that you have replied to this that it needs more work.

Besides it needing more work, ideally this should hook into
the existing vga-switcheroo mechanism for this. Can you take
a look at that please?

I think this might be the first non GPU driver doing vga-
switcheroo stuff. So this may be something to discuss
on the dri-devel list.

And if things don't work out we can always go back to
just using an asus-wmi specific sysfs file for this as
is done in this patch.

Regards,

Hans



> ---
>  .../ABI/testing/sysfs-platform-asus-wmi       |  9 ++
>  drivers/platform/x86/asus-wmi.c               | 91 +++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h    |  3 +
>  3 files changed, 103 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> index 541dbfbbbb26..d483bc3cb2e6 100644
> --- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
> +++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> @@ -67,6 +67,15 @@ Description:
>  			* 0 - Disable,
>  			* 1 - Enable,
>  
> +What:		/sys/devices/platform/<platform>/gpu_mux_mode
> +Date:		Aug 2022
> +KernelVersion:	6.0
> +Contact:	"Luke Jones" <luke@ljones.dev>
> +Description:
> +		Switch the GPU used by the hardware MUX:
> +			* 0 - Dedicated GPU,
> +			* 1 - Optimus mode,
> +
>  What:		/sys/devices/platform/<platform>/panel_od
>  Date:		Aug 2022
>  KernelVersion:	5.17
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 78f1f3af1b12..c5fa21370481 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -246,6 +246,9 @@ struct asus_wmi {
>  	bool dgpu_disable_available;
>  	bool dgpu_disable;
>  
> +	bool gpu_mux_mode_available;
> +	bool gpu_mux_mode;
> +
>  	bool keyboard_rgb_state_available;
>  	bool keyboard_rgb_mode_available;
>  	struct keyboard_rgb_led keyboard_rgb_led;
> @@ -750,6 +753,86 @@ static ssize_t egpu_enable_store(struct device *dev,
>  
>  static DEVICE_ATTR_RW(egpu_enable);
>  
> +/* gpu mux switch *************************************************************/
> +static int gpu_mux_mode_check_present(struct asus_wmi *asus)
> +{
> +	u32 result;
> +	int err;
> +
> +	asus->gpu_mux_mode_available = false;
> +
> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_GPU_MUX, &result);
> +	if (err) {
> +		if (err == -ENODEV)
> +			return 0;
> +		return err;
> +	}
> +
> +	if (result & ASUS_WMI_DSTS_PRESENCE_BIT) {
> +		asus->gpu_mux_mode_available = true;
> +		asus->gpu_mux_mode = result & ASUS_WMI_DSTS_STATUS_BIT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int gpu_mux_mode_write(struct asus_wmi *asus)
> +{
> +	u32 retval;
> +	u8 value;
> +	int err;
> +
> +	/* Don't rely on type conversion */
> +	value = asus->gpu_mux_mode ? 1 : 0;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_GPU_MUX, value, &retval);
> +	if (err) {
> +		pr_warn("Failed to set dGPU-only mode: %d\n", err);
> +		return err;
> +	}
> +
> +	if (retval > 1) {
> +		pr_warn("Failed to set dGPU-only mode (retval): 0x%x\n", retval);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "gpu_mux_mode");
> +
> +	return 0;
> +}
> +
> +static ssize_t gpu_mux_mode_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	u8 mode = asus->gpu_mux_mode;
> +
> +	return sysfs_emit(buf, "%d\n", mode);
> +}
> +
> +static ssize_t gpu_mux_mode_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	bool optimus;
> +	int result;
> +
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +	result = kstrtobool(buf, &optimus);
> +	if (result)
> +		return result;
> +
> +	asus->gpu_mux_mode = optimus;
> +
> +	result = gpu_mux_mode_write(asus);
> +	if (result)
> +		return result;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(gpu_mux_mode);
> +
>  /* TUF Laptop Keyboard RGB Modes **********************************************/
>  static int keyboard_rgb_check_present(struct asus_wmi *asus)
>  {
> @@ -3496,6 +3579,7 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_touchpad.attr,
>  	&dev_attr_egpu_enable.attr,
>  	&dev_attr_dgpu_disable.attr,
> +	&dev_attr_gpu_mux_mode.attr,
>  	&dev_attr_keyboard_rgb_save.attr,
>  	&dev_attr_keyboard_rgb_mode.attr,
>  	&dev_attr_keyboard_rgb_speed.attr,
> @@ -3531,6 +3615,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		ok = asus->egpu_enable_available;
>  	else if (attr == &dev_attr_dgpu_disable.attr)
>  		ok = asus->dgpu_disable_available;
> +	else if (attr == &dev_attr_gpu_mux_mode.attr)
> +		ok = asus->gpu_mux_mode_available;
>  	else if (attr == &dev_attr_keyboard_rgb_save.attr)
>  		ok = asus->keyboard_rgb_mode_available;
>  	else if (attr == &dev_attr_keyboard_rgb_mode.attr)
> @@ -3810,6 +3896,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_dgpu_disable;
>  
> +	err = gpu_mux_mode_check_present(asus);
> +	if (err)
> +		goto fail_gpu_mux_mode;
> +
>  	err = keyboard_rgb_check_present(asus);
>  	if (err)
>  		goto fail_keyboard_rgb_mode;
> @@ -3932,6 +4022,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  fail_fan_boost_mode:
>  fail_egpu_enable:
>  fail_dgpu_disable:
> +fail_gpu_mux_mode:
>  fail_keyboard_rgb_mode:
>  fail_keyboard_rgb_state:
>  fail_platform:
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index b5c966798ef8..3faeb98f6ea9 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -98,6 +98,9 @@
>  /* dgpu on/off */
>  #define ASUS_WMI_DEVID_DGPU		0x00090020
>  
> +/* gpu mux switch, 0 = dGPU, 1 = Optimus */
> +#define ASUS_WMI_DEVID_GPU_MUX	0x00090016
> +
>  /* TUF laptop RGB control */
>  #define ASUS_WMI_DEVID_TUF_RGB_MODE	0x00100056
>  /* TUF laptop RGB state control */

