Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF60EC00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 11:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbiHALkp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 07:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbiHALko (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 07:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7F56C33372
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 04:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659354042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hi8E+PjVvepkExZ7cWQE2p4IaE1nSMVozQKvB1b1iCA=;
        b=Tk1OboMU9v8VPUwT4ZAkpcEdhbRn0ftyigyR7WOVsqeHQj9df38vN7+P6gYMWg2ok35YtK
        uu+c9rC+UwiYfMyuUD2gYWU9zlxSXzXx05Jw+9Dx09d/iLixQnf5kn3Hs2hTdJV5l77yHi
        OIrT/o/IXl3v6rl/P28R2ulTSCLiyzg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-WM668goYNP2irpGbeL6m0g-1; Mon, 01 Aug 2022 07:40:39 -0400
X-MC-Unique: WM668goYNP2irpGbeL6m0g-1
Received: by mail-ed1-f71.google.com with SMTP id b15-20020a056402278f00b0043acaf76f8dso7099523ede.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 04:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Hi8E+PjVvepkExZ7cWQE2p4IaE1nSMVozQKvB1b1iCA=;
        b=k73dLO8sy6DM8+UwNDQdLT4kZtkSsDN19vlCJJ2j7d/2xLWZIezKjR4jUDkZ7st9Q5
         fZe6UOzXnFnmDt68n07eGFCb1qvuegfTHNfWw/xsoOY272yF4YzsfGSZIzzUjQfhF/z7
         ziKCUOsm6/WnkDEzDaXykpx9mUVWUBhnmpnX5CsdLLS7HGzSXI4u7Z5WV9nREo/PnG8x
         7x+z4Y6wQletu4NUPzWEddbRK2RTuRoJozhPTmym/A/M1fttfmpiJ4AM7nzPShSt9p4q
         yazgeNjif2iTLSAPPEnGj2BbcmnOBTGOnEtSbhezXPz8ifIG7sjEfVtzjOQkuGV5SxcF
         E+Fw==
X-Gm-Message-State: AJIora9m2y6Be/5oYK33kYp0oHdMcP1XEq+tRMKg7Yd6kmdB59OjvPJu
        WsxLtD+qMNAbhllOym2bbOtVoZghkb5uAMs968a0gaWpzbKPwSR46cB0WT169k2T2vImDY1kCj5
        zT5DND5WI5ygiPVHZlL3vkvt4Ytx8CdbMwA==
X-Received: by 2002:a17:907:2724:b0:72b:526f:6389 with SMTP id d4-20020a170907272400b0072b526f6389mr12372913ejl.289.1659354038302;
        Mon, 01 Aug 2022 04:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uxQocpe0K3DQ1pVTzP0p+g+444BjiYHY581VPCGiOX7Z4+vw935ER8e6j2MvzSU0GmHyDNOA==
X-Received: by 2002:a17:907:2724:b0:72b:526f:6389 with SMTP id d4-20020a170907272400b0072b526f6389mr12372903ejl.289.1659354038087;
        Mon, 01 Aug 2022 04:40:38 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id u16-20020a056402065000b0043ab81e4230sm6717052edx.50.2022.08.01.04.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 04:40:37 -0700 (PDT)
Message-ID: <192237a9-0c27-f701-a220-8e4063c0cb49@redhat.com>
Date:   Mon, 1 Aug 2022 13:40:37 +0200
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

Still looks good to me.

Regards,

Hans


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

