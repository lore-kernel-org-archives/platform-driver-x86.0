Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TWXqHg+r"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004FAF2
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 06:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701698638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOSQTevegEaackgGd4KwYdNwyL12goH81E9c3CMgXEA=;
	b=TWXqHg+ro+XkLIC1yoZl7uBzgIcZBdLoGF/ijDzQytwbU5sau2DgIaD0GLyp/HvDOOx+eM
	7nDUEY3arAkF2qJUs4rNHj3HY2RNOlSOFyQzQcMoDIRq97d6UTR8Bu6V1J5LVZwwmy4chO
	ny6XMBiStJnz4cVZjzGHIfniQANR8KA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-C-PTb81xOkyYTISJE1-FKw-1; Mon, 04 Dec 2023 09:03:56 -0500
X-MC-Unique: C-PTb81xOkyYTISJE1-FKw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-54c9604921dso806234a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Dec 2023 06:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701698635; x=1702303435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOSQTevegEaackgGd4KwYdNwyL12goH81E9c3CMgXEA=;
        b=vjxNUHJZwhaOV4EzpWrI0cU9/jBD1FITmihBshaBY+oHvhHjIc7NJIqgEjszl25UXT
         qnzeioqUjk0kdhu3gficyV0rfSVnQuW+0/xVvc48Q1ekxhDako9lhBsImv2OgTxgBKib
         MUzLz+m8Qc0sJNtuIrN2SiVChz9dd12l48oyB4DGsYgVq/oVtgDyX/HkCDYEQmKZJ6RL
         3O/9+YRIPAKuA6VheMXM02kbfH0I0DEuBxF7+SIXblECOmaDWQind1sjhoCS2KI/Q8PU
         O3UBO+gqXVFR6fhYnn9/zqLF9nUl00dS0NhIrIEUEcIiobGaK2+Xqq3c/VnkjuHVS3Uj
         Ydcw==
X-Gm-Message-State: AOJu0Ywpr0nlTny61rnvXahhgHhWjNHKVGlSITKGUM9XZ9eSIxUhWKfk
	iXFNwyJvRUjRgXkeQ9UAdCyy25fLZk9MEOFH/syVmaWB2BHyxAehYyMk7kx3T+Q9LOL7jl7qfiz
	r03otymTaHhENQJI/zejqrh5oWd5dEX81BQ==
X-Received: by 2002:a50:d510:0:b0:54c:4837:9045 with SMTP id u16-20020a50d510000000b0054c48379045mr3301647edi.61.1701698635360;
        Mon, 04 Dec 2023 06:03:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxnNqMHfvc3hmg0PnaJNcBz/LbJu0J5u0V6kpPYAlasx6Xt6AjKYJa1d5gBNgpKZNeS5Z+Mg==
X-Received: by 2002:a50:d510:0:b0:54c:4837:9045 with SMTP id u16-20020a50d510000000b0054c48379045mr3301638edi.61.1701698635107;
        Mon, 04 Dec 2023 06:03:55 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z10-20020a05640235ca00b0054cc22af09esm1543404edc.46.2023.12.04.06.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 06:03:54 -0800 (PST)
Message-ID: <38aedeab-f307-42a8-84d8-782c355f021f@redhat.com>
Date: Mon, 4 Dec 2023 15:03:53 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] platform/x86/intel/tpmi: Don't create devices for
 disabled features
Content-Language: en-US
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com>
 <20231130214751.3100418-2-srinivas.pandruvada@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231130214751.3100418-2-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/30/23 22:47, Srinivas Pandruvada wrote:
> If some TPMI features are disabled, don't create auxiliary devices. In
> this way feature drivers will not load.
> 
> While creating auxiliary devices, call tpmi_read_feature_status() to
> check feature state and return if the feature is disabled without
> creating a device.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> v2
> - Add comment for returning -EOPNOTSUPP
> 
>  drivers/platform/x86/intel/tpmi.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
> index c89aa4d14bea..868067ff966e 100644
> --- a/drivers/platform/x86/intel/tpmi.c
> +++ b/drivers/platform/x86/intel/tpmi.c
> @@ -604,9 +604,21 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  	struct intel_vsec_device *vsec_dev = tpmi_info->vsec_dev;
>  	char feature_id_name[TPMI_FEATURE_NAME_LEN];
>  	struct intel_vsec_device *feature_vsec_dev;
> +	struct tpmi_feature_state feature_state;
>  	struct resource *res, *tmp;
>  	const char *name;
> -	int i;
> +	int i, ret;
> +
> +	ret = tpmi_read_feature_status(tpmi_info, pfs->pfs_header.tpmi_id, &feature_state);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If not enabled, continue to look at other features in the PFS, so return -EOPNOTSUPP.
> +	 * This will not cause failure of loading of this driver.
> +	 */
> +	if (!feature_state.enabled)
> +		return -EOPNOTSUPP;
>  
>  	name = intel_tpmi_name(pfs->pfs_header.tpmi_id);
>  	if (!name)

