Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8EAC77B73
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Apr 2023 09:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243285AbjD0Jon (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Apr 2023 05:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243287AbjD0Jok (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Apr 2023 05:44:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25212735
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Apr 2023 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682588633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t6JNrboTICkCA0BY79Z1IaELuWkwaAi5ABacmsTvXwY=;
        b=RW5QOMOvyxPUrIJkaENvh4NPp2efai2JDghvyj7ysGnwAkQimpQBKuFOy7rA4h5Yk686iw
        +5Na705Tc/NsLpiNeusKeUSVTp/OuQdflCBTzj/E+SQb8KN4jgjUdORrykD+QXGZSEdKjf
        yHV0WXBGbEnXpYCsOV+lc/B2OSISaVE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-9CfR_fZtPWuwjDRKAoVyJQ-1; Thu, 27 Apr 2023 05:43:52 -0400
X-MC-Unique: 9CfR_fZtPWuwjDRKAoVyJQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9534238ffa6so929724166b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Apr 2023 02:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682588631; x=1685180631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6JNrboTICkCA0BY79Z1IaELuWkwaAi5ABacmsTvXwY=;
        b=KwviOaA0AWWTE2Pb+GR9y8PE8EIUlJdqRZ5RZuo8ehW4F8m/trwtDTC5sV9an6xCHh
         EYfb+si1PlyJ+HLmkhhHE/VxpMqijoLPCT7FuTwWCAOrHcoUO34d4BcNXhwLTxy/Mo5U
         GnKhWwdRvXop9vPXrKpfxPBt+RVUt3rrNrSgxvaacZvguwFK5K+rsYd6rk5EM35dI2rE
         xOaPzeho518ov6HzYE+5V+s08FWZBAg1ij32ZBofXFzOJjhc6RDMx1p9AyhjSB/bFGtP
         +Yx6HmQzoUSnylYwjHn6R2Cr8IodzDSr/h7fbKaEyTIk0GlwHhZsp1wDczxdMWT/k/ZO
         Tpyg==
X-Gm-Message-State: AC+VfDxdA2JmXulE7ixRJTaefN+/dov0I5cIwCbSPjjmjxUayWOQujxd
        j5/uS7ABIgWjFs+Ow/YnvsicLCawC/S/Gti0gPE0nC5UsA3AGj8po2oP0GA3KlKJ9KCGj1vPyFI
        HfHrDo1oPJsdRuW6b+znpIcbs2//szEL7jw==
X-Received: by 2002:a17:907:3e9f:b0:953:7e25:2156 with SMTP id hs31-20020a1709073e9f00b009537e252156mr1130342ejc.51.1682588631509;
        Thu, 27 Apr 2023 02:43:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ43HHGtLslcXYwrKnh8zTeDWIfmsPLEiefCtU+a6HKi1x2REffqexk8ukXXfxHoYfi2/kUjCQ==
X-Received: by 2002:a17:907:3e9f:b0:953:7e25:2156 with SMTP id hs31-20020a1709073e9f00b009537e252156mr1130320ejc.51.1682588631160;
        Thu, 27 Apr 2023 02:43:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id md23-20020a170906ae9700b0094fa846be48sm9308908ejb.132.2023.04.27.02.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 02:43:50 -0700 (PDT)
Message-ID: <339c6ba5-6d60-8271-1b5d-6c4165801187@redhat.com>
Date:   Thu, 27 Apr 2023 11:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC v2 1/2] platform/x86: wmi: Allow retrieving the number of
 WMI object instances
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     Mario.Limonciello@amd.com, prasanth.ksr@dell.com,
        jorgealtxwork@gmail.com, james@equiv.tech,
        Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230426212848.108562-1-W_Armin@gmx.de>
 <20230426212848.108562-2-W_Armin@gmx.de>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230426212848.108562-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Armin,

Thank you for your work on this.

On 4/26/23 23:28, Armin Wolf wrote:
> Currently, the WMI driver core knows how many instances of a given
> WMI object exist, but WMI drivers cannot access this information.
> At the same time, some current and upcoming WMI drivers want to
> have access to this information. Add wmi_instance_count() and
> wmidev_instance_count() to allow WMI drivers to get the number of
> WMI object instances.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/wmi.c | 40 ++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h       |  2 ++
>  include/linux/wmi.h        |  2 ++
>  3 files changed, 44 insertions(+)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index c226dd4163a1..7c1a904dec5f 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -263,6 +263,46 @@ int set_required_buffer_size(struct wmi_device *wdev, u64 length)
>  }
>  EXPORT_SYMBOL_GPL(set_required_buffer_size);
> 
> +/**
> + * wmi_instance_count - Get number of WMI object instances
> + * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
> + * @instance_count: variable to hold the instance count
> + *
> + * Get the number of WMI object instances.
> + *
> + * Returns: acpi_status signaling success or error.
> + */
> +acpi_status wmi_instance_count(const char *guid_string, u8 *instance_count)
> +{
> +	struct wmi_block *wblock;
> +	acpi_status status;
> +
> +	status = find_guid(guid_string, &wblock);
> +	if (ACPI_FAILURE(status))
> +		return status;
> +
> +	*instance_count = wmidev_instance_count(&wblock->dev);
> +
> +	return AE_OK;
> +}
> +EXPORT_SYMBOL_GPL(wmi_instance_count);

I would prefer this to have a normal kernel function prototype
which returns -errno rather then returning an acpi_status. E.g. :

/**
 * wmi_instance_count - Get number of WMI object instances
 * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
 *
 * Get the number of WMI object instances.
 *
 * Returns: The number of WMI object instances, 0 if the GUID is not found.
 */
int wmi_instance_count(const char *guid_string)
{
	struct wmi_block *wblock;
	acpi_status status;

	status = find_guid(guid_string, &wblock);
	if (ACPI_FAILURE(status))
		return 0;

	return wmidev_instance_count(&wblock->dev);
}
EXPORT_SYMBOL_GPL(wmi_instance_count);

This will also allow this to completely replace
the get_instance_count() function in dell-wmi-sysman.

Note I have just gone with always returning 0 here
on error. I guess you could look at the status and
return 0 for not-found and -errno for other errors
but I don't think any callers will care for the difference,
so just always returning 0 seems easier for callers to
deal with.

As always this is just a suggestion, let me know if
you think this is a bad idea.

Regards,

Hans










> +
> +/**
> + * wmidev_instance_count - Get number of WMI object instances
> + * @wdev: A wmi bus device from a driver
> + *
> + * Get the number of WMI object instances.
> + *
> + * Returns: Number of WMI object instances.
> + */
> +u8 wmidev_instance_count(struct wmi_device *wdev)
> +{
> +	struct wmi_block *wblock = container_of(wdev, struct wmi_block, dev);
> +
> +	return wblock->gblock.instance_count;
> +}
> +EXPORT_SYMBOL_GPL(wmidev_instance_count);
> +
>  /**
>   * wmi_evaluate_method - Evaluate a WMI method (deprecated)
>   * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index efff750f326d..ab2a4b23e7a3 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -412,6 +412,8 @@ extern bool acpi_is_pnp_device(struct acpi_device *);
> 
>  typedef void (*wmi_notify_handler) (u32 value, void *context);
> 
> +acpi_status wmi_instance_count(const char *guid, u8 *instance_count);
> +
>  extern acpi_status wmi_evaluate_method(const char *guid, u8 instance,
>  					u32 method_id,
>  					const struct acpi_buffer *in,
> diff --git a/include/linux/wmi.h b/include/linux/wmi.h
> index c1a3bd4e4838..763bd382cf2d 100644
> --- a/include/linux/wmi.h
> +++ b/include/linux/wmi.h
> @@ -35,6 +35,8 @@ extern acpi_status wmidev_evaluate_method(struct wmi_device *wdev,
>  extern union acpi_object *wmidev_block_query(struct wmi_device *wdev,
>  					     u8 instance);
> 
> +u8 wmidev_instance_count(struct wmi_device *wdev);
> +
>  extern int set_required_buffer_size(struct wmi_device *wdev, u64 length);
> 
>  /**
> --
> 2.30.2
> 

