Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE9E2900
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724062719; cv=none; b=FBHFA9/EJihzH4ee0edClaY3E98/Z8wUcUFemsu42UHDjYStEGy52bn1SyWnMuI5ryU95r2L3i72C7cliT2nQxAOK2MG8t8BfjkpAqgnNejW0MgmCyVwCG9Vk6LtLC1w1m7DjSWoeJiHX8c/4m8Wm3btG3IHee/j9L/0z0X/qa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724062719; c=relaxed/simple;
	bh=oumrPm6DGzPUztITkIJe6GoG8GPX3GGeTCBd7aMENIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksRQrOKBLSKLNu8Kh7MQEBlLN89EyObOWy5ejTpFiXSJTWKSc82FUKZ5bO7F4V6tewOlS1cu7Jpu6jTSakKV+uxtRby5WcsBbN6kzr03aToP8JO3lAHAR2gq6KzEdltd7s02gm9jD/gBFdzT6ns+BBiiHISPiKYVqQpq54Bc07g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TjMAELQW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TjMAELQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724062716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CaS0qKrTUR8JHDW/OqsG90P0FAlC4t7UObUfcxI9SoY=;
	b=TjMAELQWz211vX+oeJhYXEi34zz4gV5/YJLhmldRJ55l4fFVO9rktaYUCrcznoRUpRF3DV
	yiFm537FvXIuDKvNgdK6hOfBD9z/+svsdy1R8Z9RF634SBg+X+M0ohKy9rg2AViti3Lw4p
	pjHjJixe2p/xdZNBQBkkIQt6DsbI6no=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-a8Rol5F2NfqIgeN0WB7FVw-1; Mon, 19 Aug 2024 06:18:35 -0400
X-MC-Unique: a8Rol5F2NfqIgeN0WB7FVw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a837cc95c77so302344266b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 03:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724062714; x=1724667514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaS0qKrTUR8JHDW/OqsG90P0FAlC4t7UObUfcxI9SoY=;
        b=dYPUndgN64ERt7dd7VbOyEqeYaJWpyMUxVig/baFrI8kCuqfjIOGcthFLL4S5tpsK+
         //4ALnBFgG4PC7lMaY1Xd05qy33ISx6YHpp6hqKYdU/5EWniEUD4k2RCiwnLjQ31z7wa
         zZVGe5PO/eILmaekXFjRA+qefAw1Y2nscBQ0H0QprvM5WOvVYYb0SW1YndAR311+shCW
         eIbZNmlHSWGigPMhhhHbOs1MKHFx2I71hbn9q1FAzdFphUvC12i9Vfszi/rfglxmN0xV
         aw3PvVeK97/qH1zH2Ai80z9wwOcIZ+uuzB9Jd7IXiReqWQKhl+FMDNafNxJqBtmTOy38
         WJuA==
X-Gm-Message-State: AOJu0YwFheA2zJ8NCYPbxbSpTZ41CrzxD9KguQA/6kl3CIfzqx7MWj97
	lZpbHprXr52L+aa50a3eFuncWMRQEuGfQdsXeo/L62IVDJWASZ6/jy2lwuL4l3WD4k+O1HD1mZZ
	ZpPGB4oTTIgY9SFzvlbvk4Cqq2h6Iikc7cnZTA+oCV9+sUFCqJRVOujv3NLLlG/lD3/p+yxM=
X-Received: by 2002:a17:907:7dab:b0:a77:e1fb:7dea with SMTP id a640c23a62f3a-a83928a98eemr555553766b.2.1724062714149;
        Mon, 19 Aug 2024 03:18:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoI2MIW7ITZTSMZ1Ssl8UeIkEkX3TYd7xJi5xz9LsGkW5MH9D9SnIZsPA7xCmVmjUKC5AMHw==
X-Received: by 2002:a17:907:7dab:b0:a77:e1fb:7dea with SMTP id a640c23a62f3a-a83928a98eemr555552666b.2.1724062713613;
        Mon, 19 Aug 2024 03:18:33 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6760sm614042166b.23.2024.08.19.03.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 03:18:33 -0700 (PDT)
Message-ID: <e5862dfe-2488-427c-9558-689a77fa4325@redhat.com>
Date: Mon, 19 Aug 2024 12:18:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Add support for notifying Smart PC
 Solution updates
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240812131839.308768-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240812131839.308768-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/12/24 3:18 PM, Shyam Sundar S K wrote:
> The APMF function 14 (Notify Smart PC Solution Updates) allows the BIOS
> (AMD/OEM) to be informed about the outputs of custom Smart PC policies.
> Enhance the PMF driver to invoke APMF function 14 when these custom policy
> outputs are triggered.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

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
>  drivers/platform/x86/amd/pmf/acpi.c   | 31 +++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h    | 18 ++++++++++++
>  drivers/platform/x86/amd/pmf/tee-if.c | 40 +++++++++++++++++++++++++++
>  3 files changed, 89 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 1157ec148880..d5b496433d69 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -282,6 +282,29 @@ int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx)
>  	return 0;
>  }
>  
> +static int apmf_notify_smart_pc_update(struct amd_pmf_dev *pdev, u32 val, u32 preq, u32 index)
> +{
> +	struct amd_pmf_notify_smart_pc_update args;
> +	struct acpi_buffer params;
> +	union acpi_object *info;
> +
> +	args.size = sizeof(args);
> +	args.pending_req = preq;
> +	args.custom_bios[index] = val;
> +
> +	params.length = sizeof(args);
> +	params.pointer = &args;
> +
> +	info = apmf_if_call(pdev, APMF_FUNC_NOTIFY_SMART_PC_UPDATES, &params);
> +	if (!info)
> +		return -EIO;
> +
> +	kfree(info);
> +	dev_dbg(pdev->dev, "Notify smart pc update, val: %u\n", val);
> +
> +	return 0;
> +}
> +
>  int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data)
>  {
>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
> @@ -447,6 +470,14 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>  	return 0;
>  }
>  
> +int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq, u32 idx)
> +{
> +	if (!is_apmf_func_supported(dev, APMF_FUNC_NOTIFY_SMART_PC_UPDATES))
> +		return -EINVAL;
> +
> +	return apmf_notify_smart_pc_update(dev, val, preq, idx);
> +}
> +
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  {
>  	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 753d5662c080..9bf4326d06c3 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -35,6 +35,7 @@ struct cookie_header {
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
>  #define APMF_FUNC_DYN_SLIDER_AC				11
>  #define APMF_FUNC_DYN_SLIDER_DC				12
> +#define APMF_FUNC_NOTIFY_SMART_PC_UPDATES		14
>  #define APMF_FUNC_SBIOS_HEARTBEAT_V2			16
>  
>  /* Message Definitions */
> @@ -82,7 +83,17 @@ struct cookie_header {
>  #define PMF_POLICY_STT_SKINTEMP_APU				7
>  #define PMF_POLICY_STT_SKINTEMP_HS2				8
>  #define PMF_POLICY_SYSTEM_STATE					9
> +#define PMF_POLICY_BIOS_OUTPUT_1				10
> +#define PMF_POLICY_BIOS_OUTPUT_2				11
>  #define PMF_POLICY_P3T						38
> +#define PMF_POLICY_BIOS_OUTPUT_3				57
> +#define PMF_POLICY_BIOS_OUTPUT_4				58
> +#define PMF_POLICY_BIOS_OUTPUT_5				59
> +#define PMF_POLICY_BIOS_OUTPUT_6				60
> +#define PMF_POLICY_BIOS_OUTPUT_7				61
> +#define PMF_POLICY_BIOS_OUTPUT_8				62
> +#define PMF_POLICY_BIOS_OUTPUT_9				63
> +#define PMF_POLICY_BIOS_OUTPUT_10				64
>  
>  /* TA macros */
>  #define PMF_TA_IF_VERSION_MAJOR				1
> @@ -344,6 +355,12 @@ struct os_power_slider {
>  	u8 slider_event;
>  } __packed;
>  
> +struct amd_pmf_notify_smart_pc_update {
> +	u16 size;
> +	u32 pending_req;
> +	u32 custom_bios[10];
> +} __packed;
> +
>  struct fan_table_control {
>  	bool manual;
>  	unsigned long fan_id;
> @@ -717,6 +734,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
>  int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
> +int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq, u32 idx);
>  
>  /* Smart PC - TA interfaces */
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index e246367aacee..19c27b6e4666 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -160,6 +160,46 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n",
>  				amd_pmf_uevent_as_str(val));
>  			break;
> +
> +		case PMF_POLICY_BIOS_OUTPUT_1:
> +			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(0), 0);
> +			break;
> +
> +		case PMF_POLICY_BIOS_OUTPUT_2:
> +			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(1), 1);
> +			break;
> +
> +		case PMF_POLICY_BIOS_OUTPUT_3:
> +			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(2), 2);
> +			break;
> +
> +		case PMF_POLICY_BIOS_OUTPUT_4:
> +			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(3), 3);
> +			break;
> +
> +		case PMF_POLICY_BIOS_OUTPUT_5:
> +			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(4), 4);
> +			break;
> +
> +		case PMF_POLICY_BIOS_OUTPUT_6:
> +			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(5), 5);
> +			break;
> +
> +		case PMF_POLICY_BIOS_OUTPUT_7:
> +			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(6), 6);
> +			break;
> +
> +		case PMF_POLICY_BIOS_OUTPUT_8:
> +			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(7), 7);
> +			break;
> +
> +		case PMF_POLICY_BIOS_OUTPUT_9:
> +			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(8), 8);
> +			break;
> +
> +		case PMF_POLICY_BIOS_OUTPUT_10:
> +			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(9), 9);
> +			break;
>  		}
>  	}
>  }

