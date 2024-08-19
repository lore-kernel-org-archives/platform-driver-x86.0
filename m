Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B2A2900
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724062732; cv=none; b=N7g+SmA6m6RqSzoG40tyP3LFBtzSIDadbbSFbvrIYMwrMGXB0yA16Ck8S4xPErgLWXBqoC/7flhZe8Io8sngK0GWoaIWUReeEMFL+tn5YYPivqbFnyedpjki0zhXNzmvOhv5c1Lj8WGb5JOWDAUBsJgfl5t/EkOITdLsjFleWeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724062732; c=relaxed/simple;
	bh=qMT97HKgYvdkMHls3AI92gtKJEnVbx03LP8/ij7Luoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDguWFaCymEuZFlG2EqQQcFpdXisg2vslm3yREguyaanmvsK1Vqwd5Y99J8J1ggYvVCBpWsRoULy/YkGRCy+d7pKITtB1hoEMzSY8KvdrR6utB/BPiQmZrgsIrV9KDQoVzLyMXv2jAywWKuJIMAnoaxUm9sinmhK6/f1FdsiqSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y/HsvQRe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y/HsvQRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724062729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dS1pFwmKA0J56vfJ4dhvmN1DKPn7WrZMgWmkqQ+URo=;
	b=Y/HsvQRen95fLFLrTFtazP34MRZ6dhXDXyyP3ryZzJq+aSsyb2zwAkr1gvhfp4QhqeB/J2
	3tBz99FHEJzt5uMi07KV9M3EiAW9ThltySk1A0Wn6n7BiyoFgNhTHOXGV5gnwdv+ZykryV
	nroeWGa4cdlFpIHt5Mrd3UloUHRXqPs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-egHHF79LP_-FLrtvX5ze8w-1; Mon, 19 Aug 2024 06:18:48 -0400
X-MC-Unique: egHHF79LP_-FLrtvX5ze8w-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a7a979cae97so339482666b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 03:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724062727; x=1724667527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dS1pFwmKA0J56vfJ4dhvmN1DKPn7WrZMgWmkqQ+URo=;
        b=M5ytC8LZpYVgP9yxkI18Ysh/RrI0ARnsdHaw90nlSolV0DWnwJe0t36AQXYvrFOLkq
         d5dtODUl9pMuzIGqQpzztmoCLKe70uknMwXBv4HaxET/DVryin2B11HM7pqH0T+JHrZO
         NuDVyilb1hdlA2fHr3YXxbT95aHOog/wnJ8cgpouZMCo4V2S6S+fNdJ5dx4CQl4wVY17
         uPGvJ3M9mu122Y0Nz8p9TNhmRUAl0JApA0w+CXMcSCNrfzdd28DRJtrKYxoH3eVp/xHw
         TJU/Cr8jeC1M7WgygniHcAdxdg+Bmm29U9y7O7R/ht368OUxvL+v38vZyitcb4vK/1u9
         gGww==
X-Gm-Message-State: AOJu0YyKlfJO4VeGXOQVEN73/B0ZMnZJFN5ZCQzhyvoPjkVombN6yGT0
	MXlX3Nm+ArDCb+2XVuyhTErg+OvW5Rdjb7tSlOkU9cVj1uxAcktt8Ue64ZfXAF9sii4ah4hU6H2
	EoiNBiIIqqPTTKCodz4NmeMaCm0uzc9d1Sai18Ho+EpVUom/zGbovt+VkGQbAxxC8Z/dZnpg=
X-Received: by 2002:a05:6402:50c9:b0:5bf:7dc:bbae with SMTP id 4fb4d7f45d1cf-5bf07dcbdaemr146480a12.6.1724062727074;
        Mon, 19 Aug 2024 03:18:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAsOz4DcthsWJKIkfFOMw0iGCP8j4qmdJ7v1yvS54PToreJV2oZdg0Wx9oUM2x7Kt4J9bRXw==
X-Received: by 2002:a05:6402:50c9:b0:5bf:7dc:bbae with SMTP id 4fb4d7f45d1cf-5bf07dcbdaemr146463a12.6.1724062726467;
        Mon, 19 Aug 2024 03:18:46 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbdfb923sm5315690a12.54.2024.08.19.03.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 03:18:46 -0700 (PDT)
Message-ID: <c7238607-76be-400f-8008-69528f0851d2@redhat.com>
Date: Mon, 19 Aug 2024 12:18:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] platform/x86/amd/pmf: Relocate CPU ID macros to
 the PMF header
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240819063404.378061-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240819063404.378061-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/19/24 8:34 AM, Shyam Sundar S K wrote:
> The CPU ID macros are needed by the Smart PC builder. Therefore, transfer
> the CPU ID macros from core.c to the common PMF header file.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

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
> v4:
>  - Add Reviewed-by Tag
> 
> V3:
>  - No change
> 
> V2:
>  - No change
> 
>  drivers/platform/x86/amd/pmf/core.c | 6 ------
>  drivers/platform/x86/amd/pmf/pmf.h  | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 8f1f719befa3..88314b0277a3 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -37,12 +37,6 @@
>  #define AMD_PMF_RESULT_CMD_UNKNOWN           0xFE
>  #define AMD_PMF_RESULT_FAILED                0xFF
>  
> -/* List of supported CPU ids */
> -#define AMD_CPU_ID_RMB			0x14b5
> -#define AMD_CPU_ID_PS			0x14e8
> -#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT	0x1507
> -#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT	0x1122
> -
>  #define PMF_MSG_DELAY_MIN_US		50
>  #define RESPONSE_REGISTER_LOOP_MAX	20000
>  
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 9bf4326d06c3..9fc26f672f12 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -19,6 +19,12 @@
>  #define POLICY_SIGN_COOKIE		0x31535024
>  #define POLICY_COOKIE_OFFSET		0x10
>  
> +/* List of supported CPU ids */
> +#define AMD_CPU_ID_RMB                  0x14b5
> +#define AMD_CPU_ID_PS                   0x14e8
> +#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
> +#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
> +
>  struct cookie_header {
>  	u32 sign;
>  	u32 length;

