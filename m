Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A4AC04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 20:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbiG0ULK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 16:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbiG0ULJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 16:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 98ADE564C9
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658952667;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i10HBe4b3tXwl7pQfY6yAyJQYnbg84dUIpWfAGNAHTM=;
        b=KKPbTbdqbbJj4qfK3sPWci0UJpE4c30bWhFC53JFdQSZ905Zr9NH0KKxJfqbLU8zb1+y4y
        PZt2y5Q54Tqo4gBpRBQ4PiE3kqCARnHh6yX44cOQ0fM9tyF7KW16b113f8xgDssD86Jtv2
        GLUEDenHzbXFjjBaYzuK2qmS79rB5Yk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-FbUfKmthOdWUs8BGnj-3UA-1; Wed, 27 Jul 2022 16:11:06 -0400
X-MC-Unique: FbUfKmthOdWUs8BGnj-3UA-1
Received: by mail-ej1-f72.google.com with SMTP id ne36-20020a1709077ba400b0072b64ce28aaso5317813ejc.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i10HBe4b3tXwl7pQfY6yAyJQYnbg84dUIpWfAGNAHTM=;
        b=gDmeIURPhSxvZt0WEiONIdUAce4MK1tXp9/lVujLptcpANZ+ZD7YAeuvkWI18uOxuK
         E92sW5GMCIL+qsJcfiDdlAKi15DcBvGoUsJDKCC6hbJUWovPLVWqdGsTehca185MCgX+
         nCa9eQ7DNWPYQOHfUeHTvHRGU3oBYdNrlyPOHPrzxnJjvZ3G+4OZA9Xy76glZfoRP72+
         RtRfGcdxisGfevAhdaDTjPgQsVcNBCKhYBHcyebxLeLPt7AtKbvkaWuRw02DWRYm4tQ4
         xG4fseK8dx/BUzGR42ymJm7/MmrKpRLZQ+KRZgHqC3HefHJp7K/0T+se83oNBtHUWf8I
         JoxQ==
X-Gm-Message-State: AJIora+0q5WQ2s11mZiIg7bskYf9Vc3BKaUcOO/DNRLWSB/sIsE8+JTv
        D5XHDyxrWu0pdJqKVTujKpND9EAtPDQZNwo1o+QNs8OtnyOAV/25ZpNSldKOnZcSqfQOYuSfXhL
        WfnlyvgWjC8rbZfjl1MVYqoTPDYpwpITUEw==
X-Received: by 2002:a05:6402:28c8:b0:43a:aba5:efe5 with SMTP id ef8-20020a05640228c800b0043aaba5efe5mr24581068edb.2.1658952665261;
        Wed, 27 Jul 2022 13:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ve9KjJHxIZUVw3WkhaZmRCibF1hN9T7+NV4bvPXqoCENLRzrLAXrI4ql0aZnbqHSJgVvnNYg==
X-Received: by 2002:a05:6402:28c8:b0:43a:aba5:efe5 with SMTP id ef8-20020a05640228c800b0043aaba5efe5mr24581051edb.2.1658952664932;
        Wed, 27 Jul 2022 13:11:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id l1-20020a1709063d2100b006fec27575f1sm7972461ejf.123.2022.07.27.13.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 13:11:04 -0700 (PDT)
Message-ID: <2a2279d9-6d1b-7bda-ef43-f70e62ae461f@redhat.com>
Date:   Wed, 27 Jul 2022 22:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 07/15] platform/x86/amd/pmf: Add fan control support
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-8-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-8-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> PMF has a generic interface defined via PMF ACPI fn9 for influencing fan
> policy during mode switch.
> 
> PMF ACPI fn9 will normally be invoked when AMDPMF needs to change the fan
> table index for the EC. When AMDPMF is loaded this function will be invoked
> to change fan speed. OEM can also choose to report the actual fan table
> index and fan RPM to PMF through OEM structure.
> 
> This information will be communicated by PMF driver to customer BIOS.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 26 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 17 +++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 60ffc9ba4adc..e4822c6f4259 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -55,6 +55,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>  {
>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>  	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
> +	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
>  }
>  
>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *ampf_if)
> @@ -182,6 +183,31 @@ static void apmf_sbios_heartbeat_notify(struct work_struct *work)
>  	kfree(info);
>  }
>  
> +int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx)
> +{
> +	union acpi_object *info;
> +	struct apmf_fan_idx args;
> +	struct acpi_buffer params;
> +	int err = 0;
> +
> +	args.size = sizeof(args);
> +	args.fan_ctl_mode = manual;
> +	args.fan_ctl_idx = idx;
> +
> +	params.length = sizeof(args);
> +	params.pointer = (void *)&args;
> +
> +	info = apmf_if_call(ampf_if, APMF_FUNC_SET_FAN_IDX, &params);
> +	if (!info) {
> +		err = -EIO;
> +		goto out;
> +	}
> +
> +out:
> +	kfree(info);
> +	return err;
> +}
> +
>  static acpi_handle apmf_if_probe_handle(void)
>  {
>  	acpi_handle handle = NULL;
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 504e1ae79706..1e9e2e498d15 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -18,6 +18,7 @@
>  #define APMF_FUNC_VERIFY_INTERFACE			0
>  #define APMF_FUNC_GET_SYS_PARAMS			1
>  #define APMF_FUNC_SBIOS_HEARTBEAT			4
> +#define APMF_FUNC_SET_FAN_IDX				7
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR	9
>  
>  /* Message Definitions */
> @@ -39,12 +40,16 @@
>  #define GET_STT_LIMIT_APU	0x20
>  #define GET_STT_LIMIT_HS2	0x21
>  
> +/* Fan Index for Auto Mode */
> +#define FAN_INDEX_AUTO 0xFFFFFFFF
> +
>  #define ARG_NONE 0
>  
>  /* AMD PMF BIOS interfaces */
>  struct apmf_if_functions {
>  	bool system_params;
>  	bool sbios_heartbeat;
> +	bool fan_table_idx;
>  	bool static_slider_granular;
>  };
>  
> @@ -73,6 +78,12 @@ struct apmf_system_params {
>  	u32 heartbeat_int;
>  } __packed;
>  
> +struct apmf_fan_idx {
> +	u16 size;
> +	u8 fan_ctl_mode;
> +	u32 fan_ctl_idx;
> +} __packed;
> +
>  enum amd_stt_skin_temp {
>  	STT_TEMP_APU,
>  	STT_TEMP_HS2,
> @@ -137,6 +148,11 @@ struct amd_pmf_static_slider_granular {
>  	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX][POWER_MODE_MAX];
>  };
>  
> +struct fan_table_control {
> +	bool manual;
> +	unsigned long fan_id;
> +};
> +
>  /* Core Layer */
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
> @@ -154,4 +170,5 @@ int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
>  				    struct apmf_static_slider_granular_output *output);
>  void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
>  
> +int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
>  #endif /* PMF_H */

