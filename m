Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672AEC433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Mar 2022 14:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347593AbiCHOkm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Mar 2022 09:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347570AbiCHOka (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Mar 2022 09:40:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3DC1538DBE
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Mar 2022 06:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646750369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jVV+jSQzmykZM67bRo5szL7r6DtIxoamQ2h3vq07Guo=;
        b=G5WC4aKTNFJDSUEFN6P9hD1+cLvm68+4JFMsEYPJoVEIms6UBt3uU9ME6Sr8A59/Zc2t5k
        m9WfxXGf3V8+QBMA3eaYZFgZsblMQ9TpO+4y4w1HeWLI0bRmdmO70WjlgwE3LUn0R60dVa
        P9tZFD7sZwJ62W9HA0shhlGVvKNDygw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-JEiVnhj2Pruw6pXIAHrk0A-1; Tue, 08 Mar 2022 09:39:27 -0500
X-MC-Unique: JEiVnhj2Pruw6pXIAHrk0A-1
Received: by mail-ej1-f70.google.com with SMTP id ey18-20020a1709070b9200b006da9614af58so6756754ejc.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Mar 2022 06:39:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jVV+jSQzmykZM67bRo5szL7r6DtIxoamQ2h3vq07Guo=;
        b=oUYA67lU9isBhUP6khVsyO+zIlAScVOTHz4LZ3rOXUuuOKQSR0BDPzzUp79gNGr1cI
         7ElwvhN8ZOzdGXx/YWvLOR2F/jeZH2tIwE9pq+F22Whv9kQ8KjJWH6RxlnB7VWVQGuiP
         GDJuq/5JoPJa4jHak2ZUQ6NtViKuUrdMK8jD72Y1QeaSItbQC5nCRYiWLdHi8awEHT9u
         0cf9NjmWLXeePJ/wno4/ZEf7x3AugA2rE/VaZa1mTi9EYUaD9ZXKfn7EYqt8IWtM+eZg
         mcPzAm3LOtyoZ5SQe/3gk2xcFxgzbmAi/I7+0OUFODbzqxdyNMCphAQLgGFFP1zUA/Zh
         gI5g==
X-Gm-Message-State: AOAM530w+4pK2ypp6x4Im2/t2xf8W0133A89HTSt8N98XD0vQTB/P5QR
        s7sa60c9wrrnsBBtcOp0VIBAp2ZTVde9+PJirtGO5zZYHU4e0PbS8sKm/LP6FaIoj/3Hn/kFGMR
        npyvnfpgggm1ntqhkzwZIm4WJ4pVW5VFPvQ==
X-Received: by 2002:a17:907:7b9f:b0:6d7:a24:8cbd with SMTP id ne31-20020a1709077b9f00b006d70a248cbdmr13831326ejc.588.1646750366443;
        Tue, 08 Mar 2022 06:39:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP+wM46Er7BenPPwo5K7AaHbs/1gqnz1TROa6BPXb2RrFZbL1JXNPKBbvRem5T4vgKGWsERQ==
X-Received: by 2002:a17:907:7b9f:b0:6d7:a24:8cbd with SMTP id ne31-20020a1709077b9f00b006d70a248cbdmr13831311ejc.588.1646750366185;
        Tue, 08 Mar 2022 06:39:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id p4-20020a50d884000000b004128cf5fe2asm7757990edj.79.2022.03.08.06.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 06:39:25 -0800 (PST)
Message-ID: <65d8cf3b-0eea-0583-fa23-e2c71287fb85@redhat.com>
Date:   Tue, 8 Mar 2022 15:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC] ACPI: platform-profile: support for AC vs DC modes
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     rafael@kernel.org, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220301201554.4417-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220301201554.4417-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 3/1/22 21:15, Mark Pearson wrote:
> Looking for feedback on this feature. Whether it is worth
> pursuing and any concerns with the general implementation.
> 
> I've recently been working on PSC platform profile mode support
> for Lenovo AMD platforms (patch proposed upstream last week). 
> One of the interesting pieces with the Lenovo PSC implementation
> is it supports different profiles for AC (plugged in) vs DC
> (running from battery).

Nitpick: the power going to the laptop has long been converted
to DC when it goes into the laptop and when e.g. charging
with a car-lighter-connection-to-type-c convertor it has never
not been DC.

IMHO external_power vs battery would be better names.

> I was thinking of adding this support in the thinkpad_acpi driver,
> but it seems it would be nicer to make this generally available for
> all platforms that offer profile support.
> 
> This implementation allows the user to set one profile for when a
> system is plugged in, and a different profile for when they are
> unplugged. I imagine this would be used so that performance mode
> is used when plugged in and low-power used when unplugged (as an
> example). The user could configure it to match their preference.
> 
> If the user doesn't configure a DC profile it behaves the same as
> previously and any ACPI power events will be ignored. If the user
> configures a DC profile then when a system is unplugged it will
> automatically configure this setting.
> 
> I've added platform_profile_ac and platform_profile_dc sysfs nodes.
> The platform_profile and platform_profile_ac nodes will behave the
> same when setting a profile to maintain backwards compatibility.
> 
> If you read the platform_profile it will return the currently
> active profile.
> If you read the platform_profile_ac or platform_profile_dc node it
> will return the configured profile. This is something missing from
> the current implementation that I think is a nice bonus.
> 
> User space implementation could potentially be used to do the same
> idea, but having this available allows users to configure from
> cmdline or use scripts seemed valuable.
> 
> Note - I'm aware that I still need to:
>  1) Update the API documentation file
>  2) Implement a disable/unconfigure on the profile_dc setting
> But I figured this was far enough along that it would be good to get
> comments.
> 
> Thanks in advance for any feedback.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

If I understand things correctly, then there is no difference
between e.g. performance on AC vs on battery, this is just
automatic switching the profiles when connecting/disconnecting
the charger, correct?

If I got that correct, there is no reason why userspace could
not do this itself and implementing this in userspace has the
advantage that it will work everywhere including on non
PSC ThinkPads

The hardest part of implementing something like this would
be the userspace UI design and any policy decisions surrounding
this, if we spend time on implementing those then making userspace
do the actual switching of the profiles is pretty trivial in
comparison and as said would be a much more universal way
to implement this.

So IMHO even though some hardware may offer this functionality,
this is best left to an universal  userspace implementation.

Regards,

Hans


> ---
>  drivers/acpi/platform_profile.c  | 130 +++++++++++++++++++++++++++++--
>  include/linux/platform_profile.h |   1 +
>  2 files changed, 125 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
> index d418462ab791..e4246e6632cf 100644
> --- a/drivers/acpi/platform_profile.c
> +++ b/drivers/acpi/platform_profile.c
> @@ -7,6 +7,7 @@
>  #include <linux/init.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_profile.h>
> +#include <linux/power_supply.h>
>  #include <linux/sysfs.h>
>  
>  static struct platform_profile_handler *cur_profile;
> @@ -22,6 +23,51 @@ static const char * const profile_names[] = {
>  };
>  static_assert(ARRAY_SIZE(profile_names) == PLATFORM_PROFILE_LAST);
>  
> +static struct notifier_block ac_nb;
> +static int cur_profile_ac;
> +static int cur_profile_dc;
> +
> +static int platform_profile_set(void)
> +{
> +	int profile, err;
> +
> +	if (cur_profile_dc == PLATFORM_PROFILE_UNCONFIGURED)
> +		profile = cur_profile_ac;
> +	else {
> +		if (power_supply_is_system_supplied() > 0)
> +			profile = cur_profile_ac;
> +		else
> +			profile = cur_profile_dc;
> +	}
> +
> +	err = mutex_lock_interruptible(&profile_lock);
> +	if (err)
> +		return err;
> +
> +	err = cur_profile->profile_set(cur_profile, profile);
> +	if (err)
> +		return err;
> +
> +	sysfs_notify(acpi_kobj, NULL, "platform_profile");
> +	mutex_unlock(&profile_lock);
> +	return 0;
> +}
> +
> +static int platform_profile_acpi_event(struct notifier_block *nb,
> +					unsigned long val,
> +					void *data)
> +{
> +	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
> +
> +	WARN_ON(cur_profile_dc == PLATFORM_PROFILE_UNCONFIGURED);
> +
> +	/* if power supply changed, then update profile */
> +	if (strcmp(entry->device_class, "ac_adapter") == 0)
> +		return platform_profile_set();
> +
> +	return 0;
> +}
> +
>  static ssize_t platform_profile_choices_show(struct device *dev,
>  					struct device_attribute *attr,
>  					char *buf)
> @@ -77,9 +123,34 @@ static ssize_t platform_profile_show(struct device *dev,
>  	return sysfs_emit(buf, "%s\n", profile_names[profile]);
>  }
>  
> -static ssize_t platform_profile_store(struct device *dev,
> +static ssize_t configured_profile_show(struct device *dev,
>  			    struct device_attribute *attr,
> -			    const char *buf, size_t count)
> +			    char *buf, int profile)
> +{
> +	if (profile == PLATFORM_PROFILE_UNCONFIGURED)
> +		return sysfs_emit(buf, "Not-configured\n");
> +
> +	/* Check that profile is valid index */
> +	if (WARN_ON((profile < 0) || (profile >= ARRAY_SIZE(profile_names))))
> +		return -EIO;
> +	return sysfs_emit(buf, "%s\n", profile_names[profile]);
> +}
> +
> +static ssize_t platform_profile_ac_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	return configured_profile_show(dev, attr, buf, cur_profile_ac);
> +}
> +
> +static ssize_t platform_profile_dc_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	return configured_profile_show(dev, attr, buf, cur_profile_dc);
> +}
> +
> +static int profile_select(const char *buf)
>  {
>  	int err, i;
>  
> @@ -105,11 +176,50 @@ static ssize_t platform_profile_store(struct device *dev,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	err = cur_profile->profile_set(cur_profile, i);
> -	if (!err)
> -		sysfs_notify(acpi_kobj, NULL, "platform_profile");
> -
>  	mutex_unlock(&profile_lock);
> +	return i;
> +}
> +
> +static ssize_t platform_profile_store(struct device *dev,
> +			    struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	int profile, err;
> +
> +	profile	= profile_select(buf);
> +	if (profile < 0)
> +		return profile;
> +
> +	cur_profile_ac = profile;
> +	err = platform_profile_set();
> +	if (err)
> +		return err;
> +	return count;
> +}
> +
> +static ssize_t platform_profile_ac_store(struct device *dev,
> +			    struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	return platform_profile_store(dev, attr, buf, count);
> +}
> +
> +static ssize_t platform_profile_dc_store(struct device *dev,
> +			    struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	int profile, err;
> +
> +	profile = profile_select(buf);
> +	if (profile < 0)
> +		return profile;
> +
> +	/* We need to register for ACPI events now */
> +	if (cur_profile_dc == PLATFORM_PROFILE_UNCONFIGURED)
> +		register_acpi_notifier(&ac_nb);
> +
> +	cur_profile_dc = profile;
> +	err = platform_profile_set();
>  	if (err)
>  		return err;
>  	return count;
> @@ -117,10 +227,14 @@ static ssize_t platform_profile_store(struct device *dev,
>  
>  static DEVICE_ATTR_RO(platform_profile_choices);
>  static DEVICE_ATTR_RW(platform_profile);
> +static DEVICE_ATTR_RW(platform_profile_ac);
> +static DEVICE_ATTR_RW(platform_profile_dc);
>  
>  static struct attribute *platform_profile_attrs[] = {
>  	&dev_attr_platform_profile_choices.attr,
>  	&dev_attr_platform_profile.attr,
> +	&dev_attr_platform_profile_ac.attr,
> +	&dev_attr_platform_profile_dc.attr,
>  	NULL
>  };
>  
> @@ -161,7 +275,9 @@ int platform_profile_register(struct platform_profile_handler *pprof)
>  	}
>  
>  	cur_profile = pprof;
> +	cur_profile_ac = cur_profile_dc = PLATFORM_PROFILE_UNCONFIGURED;
>  	mutex_unlock(&profile_lock);
> +	ac_nb.notifier_call = platform_profile_acpi_event;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(platform_profile_register);
> @@ -169,6 +285,8 @@ EXPORT_SYMBOL_GPL(platform_profile_register);
>  int platform_profile_remove(void)
>  {
>  	sysfs_remove_group(acpi_kobj, &platform_profile_group);
> +	if (cur_profile_dc != PLATFORM_PROFILE_UNCONFIGURED)
> +		unregister_acpi_notifier(&ac_nb);
>  
>  	mutex_lock(&profile_lock);
>  	cur_profile = NULL;
> diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
> index e5cbb6841f3a..34566256bb60 100644
> --- a/include/linux/platform_profile.h
> +++ b/include/linux/platform_profile.h
> @@ -15,6 +15,7 @@
>   * If more options are added please update profile_names array in
>   * platform_profile.c and sysfs-platform_profile documentation.
>   */
> +#define PLATFORM_PROFILE_UNCONFIGURED -1
>  
>  enum platform_profile_option {
>  	PLATFORM_PROFILE_LOW_POWER,

