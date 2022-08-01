Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEA3C00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 12:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235146AbiHAMzS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 08:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235082AbiHAMzA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 08:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE3F42BC7
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659358277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hAlkGi7q1fiu03C2CJ/Du+gzn1GkXZpcLQ3dqmpzGQQ=;
        b=Zhc3A3ngCPd3TnPcbC4Nz8dQC+t9VY2DbCTHlPUJ4mfCjtFCQDY66Hn9WnOFtNtHMhWAqh
        hGJtusxLENT1aIkSxUMgOQZXaiZmhHmywyLh+ViiAWfQLaIykJhSSXjUmeZiLfXqNiYSlR
        m5dWY/OXMykM5WbFVpVn6bTCA0hoorM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-13kIZMT7MqKU2FAqR7CIyw-1; Mon, 01 Aug 2022 08:51:16 -0400
X-MC-Unique: 13kIZMT7MqKU2FAqR7CIyw-1
Received: by mail-ed1-f72.google.com with SMTP id w17-20020a056402269100b0043da2189b71so1625800edd.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 05:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hAlkGi7q1fiu03C2CJ/Du+gzn1GkXZpcLQ3dqmpzGQQ=;
        b=Q6yFbatv62Gw1N6/11zJ3o9hSd5zmgya6Lqjsdr2fIaKDNwNwzBKYDIx9/Cp+OLILn
         SHY/DljgN+Bd/tRcva3t9yfjiyypbiac3dVckG4ibHoFubbZDBJzgrzXJXOY4nKvOS6t
         MoVqHE9A8e7lLDDUDT1Bfk6Mx0QwcyyQOySU51Ka54+dTl9NiN4ClcoEzT7ZSrz9YSpr
         trQ3FPE9hGfKfBxZe6nr9HvsEtqE3QTVblhSJqm2JD45EuYAufhRWpRl1PvLT6EZGeIJ
         m73tUu3brzSiXP/C88fWT2FY+2T/aSij84mTKb6qQo5o4jEenTQg24iqlNAdmcG/lrF/
         4RzA==
X-Gm-Message-State: AJIora/2duBaySbG+RmDvq40dBz3FvdegWTB+sPI4BCDLfdzZc8RdUD+
        9IlubD5h+J2mMM4pfr6+Yvkl412eCdTUAd1cOE82ogaU1TnxRzCTsoaZsFTOBa/Nxw/AuTJijIE
        eeYnr0hK2boaZScnyynuTy+rrME9aOEfnfw==
X-Received: by 2002:a17:906:84f0:b0:72b:72b6:c7b2 with SMTP id zp16-20020a17090684f000b0072b72b6c7b2mr12103143ejb.642.1659358274863;
        Mon, 01 Aug 2022 05:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTzyQwrHFOdRlkQ0Q8W708ZRsie6llrnq1VeqjDGezcj+hMLKfer3nZU3u0ut5BEGwGJOtiw==
X-Received: by 2002:a17:906:84f0:b0:72b:72b6:c7b2 with SMTP id zp16-20020a17090684f000b0072b72b6c7b2mr12103128ejb.642.1659358274670;
        Mon, 01 Aug 2022 05:51:14 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id c17-20020a170906d19100b0072ffbbc3341sm5048468ejz.204.2022.08.01.05.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 05:51:14 -0700 (PDT)
Message-ID: <061244e6-ad2d-e65f-cd26-fa654b05e6d7@redhat.com>
Date:   Mon, 1 Aug 2022 14:51:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND 06/11] platform/x86/amd/pmf: Add fan control
 support
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-7-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220728182028.2082096-7-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/22 20:20, Shyam Sundar S K wrote:
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
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 26 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 17 +++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 58e4893edea2..1814d48f8e44 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -99,6 +99,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>  {
>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>  	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
> +	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;

I just noticed that this is not correct, this should be:

	func->system_params = mask & BIT(APMF_FUNC_... - 1);

Which does something completely different!

Also this information is duplicated by:

is_apmf_func_supported(APMF_FUNC_...) so please drop the apmf_if_functions
struct completely and use is_apmf_func_supported() everywhere.

Regards,

Hans



>  }
>  
>  int is_apmf_func_supported(unsigned long index)
> @@ -134,6 +135,31 @@ static void apmf_sbios_heartbeat_notify(struct work_struct *work)
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
>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
>  {
>  	struct apmf_verify_interface output;
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index f546062a10a7..b6501a68aa4e 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -18,6 +18,7 @@
>  #define APMF_FUNC_VERIFY_INTERFACE			0
>  #define APMF_FUNC_GET_SYS_PARAMS			1
>  #define APMF_FUNC_SBIOS_HEARTBEAT			4
> +#define APMF_FUNC_SET_FAN_IDX				7
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
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
> @@ -133,6 +144,11 @@ struct amd_pmf_static_slider_granular {
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
> @@ -150,4 +166,5 @@ int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
>  				    struct apmf_static_slider_granular_output *output);
>  void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
>  
> +int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
>  #endif /* PMF_H */

