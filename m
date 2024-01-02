Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5C2F9CC
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jan 2024 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UU5S3hoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704198267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8a8p/tz4/wo9Xo5tNF2/PSDKzKkEQri0kDPWt5RPsQM=;
	b=UU5S3hoFOCTRa/Upi400nhJhj3rXLyFLOCTg8KY1XpbzBT67vzY5p0gco6yq1VwhvWcgAp
	cyHH+XEw8G8fkW+gywal3oa6122kyxh3Tuq7SD1s1GBYSQeBzz3DwhmjUMEh67erdxqyiw
	wZOWi4fiGTTxF9gTLsoEdj42uhOFNWw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-oaoh0OYtNk62q_gIRisiCw-1; Tue, 02 Jan 2024 07:24:26 -0500
X-MC-Unique: oaoh0OYtNk62q_gIRisiCw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-556a2f19946so136145a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jan 2024 04:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704198265; x=1704803065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8a8p/tz4/wo9Xo5tNF2/PSDKzKkEQri0kDPWt5RPsQM=;
        b=n5szMB3ubgOa+EkbKV6U/VxAu6bHfyuTR4qTR4VCa2D/h6esJSRYfDDFyv08M18UkM
         gyBIldHfAEVUGou10baRgBM1aY/wSEzlutPP4PnVsznr9brnoU5epfbQULDM+m+HeaQU
         dRAyKY3V36axDmpqzqg6bHJf1Ph164BnzDFiT4fgqrVdH4UCNO/5Zbj74T1X6VX8zscL
         K4yhSlgrV7+rqABCU2GqknKOIlvvGRC2V1+yJH+Mqqd+MYqRMh/CWGkj+eLmj/XydXwb
         dKM8qXt+7G+JwKUYlHmo1O0dyfvVDFMo2E7UK9z4fwYAni3k5sf8Sa97umEUGSI5fHNu
         JWIA==
X-Gm-Message-State: AOJu0YzNNFWqJ2lEHZHZLOGQgogMK5Bwxzx0XFxZH6j36aaVzSckjw7d
	nb/cGskr4G1tTHsLSOKCU1lkcXckQwxk/5ysQJSJAwl/K2Zvj5JShM1V1aiDF7O6uqZKAjs7Sc6
	IOkWRNrZKbnM7iKFiVgEKLty6HqCCGl+4HbqXsr6DW5OXcYYHeA==
X-Received: by 2002:a05:6402:8d3:b0:555:f8d6:3958 with SMTP id d19-20020a05640208d300b00555f8d63958mr3238859edz.55.1704198265345;
        Tue, 02 Jan 2024 04:24:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQ6k4T2HeIqC2SuJg3ax/+d7LV51poDPZuTi2eYjdajjCqMNVS1Pc1vq+BSfDYOrxgp8tOUQ==
X-Received: by 2002:a05:6402:8d3:b0:555:f8d6:3958 with SMTP id d19-20020a05640208d300b00555f8d63958mr3238854edz.55.1704198265086;
        Tue, 02 Jan 2024 04:24:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ez9-20020a056402450900b0055504002a5fsm9824333edb.72.2024.01.02.04.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:24:24 -0800 (PST)
Message-ID: <37160e32-49ec-4977-aab0-4bb340335055@redhat.com>
Date: Tue, 2 Jan 2024 13:24:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-uncore-freq: Add additional client
 processors
Content-Language: en-US, nl
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231222203957.1348043-1-srinivas.pandruvada@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231222203957.1348043-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/22/23 21:39, Srinivas Pandruvada wrote:
> Add support for client processors starting from Kaby Lake.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> Rebased on top of review-hans branch. The processors are ordered based
> on their release similiar to intel-family.h.

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




> 
>  .../x86/intel/uncore-frequency/uncore-frequency.c   | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> index a3b25253b6fd..a5e0f5c22179 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> @@ -205,6 +205,16 @@ static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_D,	NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(SAPPHIRERAPIDS_X, NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(EMERALDRAPIDS_X, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE_L, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE_L, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(CANNONLAKE_L, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_L, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(ROCKETLAKE, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE_L, NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE, NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L, NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE, NULL),
> @@ -212,6 +222,9 @@ static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S, NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE, NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE_L, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(ARROWLAKE, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(ARROWLAKE_H, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(LUNARLAKE_M, NULL),
>  	{}
>  };
>  MODULE_DEVICE_TABLE(x86cpu, intel_uncore_cpu_ids);

