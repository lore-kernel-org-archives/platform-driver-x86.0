Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8161129EE3
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PNpyAxoe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702907728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzZTbLsGxZYdWbvaeXG0BZtjF3qXQ01xbWNcYv8Z1hw=;
	b=PNpyAxoeijKzY3WBbcL8pwBd+j0EbNFeoPv0i7xND6At7/CVDSOOgUIEfmB0nQXig48OoW
	ICetvmFtPSZQCvJFtfsodx1K5FUv+r8tUucqANExUYuV1dDoYRmhZSiA5ETxJFIJnLL9JZ
	Ofbmcz7uBZcPj0S5MEB2JP5Aexm930g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-t28OtM0jMnq18LpZSIe_wQ-1; Mon, 18 Dec 2023 08:55:27 -0500
X-MC-Unique: t28OtM0jMnq18LpZSIe_wQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9fd0a58549bso324553666b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 05:55:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907726; x=1703512526;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzZTbLsGxZYdWbvaeXG0BZtjF3qXQ01xbWNcYv8Z1hw=;
        b=Z7+2AXDzG+Dn6TnThurz+cEOZWevTGwK1Skqdf+oivSqEj+K3upfoZlpdmyZy8SGGO
         KPlPu/7tOF+K0cVu/9Z0ohjfJ6A9uAOERfM2Zf5NIQkFDyaWV3HsRSR2RypdJJKNhLJB
         1UY+JOJuBcZuilLwKhsRCjEAbwaXjl7CPiPIGnPYP7DNR7OyI+0GGnIjw7sezdb+YQFZ
         dFJYPATKBecg9MNFJsZLkGyV0dL6QiJOn1OZGWLWSsb7TEMmG64EjefKtN/pVJmkuk4t
         yINMJnVTO3C66ncpG4ahBXZ1nS4D8oYqVWwWOStveXRXU+EqE5G2LQZdhn0zxyk0GwoA
         2+nA==
X-Gm-Message-State: AOJu0Yy0U29zdbKHy01ZV8crQdAN+E/XxFvo3Ly443yibeHLT52Dqb3A
	eC3/veMni6Of70q/NCd/rlwf5sHva9CgPY3y0v7gSWiVcMVMxQCO1Hd+szsRPaG0nHn7o0Biy/j
	bm4quFKgBsUJE8ki23KvJqsq4DHv5tJj8tw==
X-Received: by 2002:a17:906:3f12:b0:a1f:7065:1efc with SMTP id c18-20020a1709063f1200b00a1f70651efcmr13335633ejj.5.1702907726120;
        Mon, 18 Dec 2023 05:55:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF90CfPOt3NAYIFZacUGjA1NhrShXm2jKDdrrKbkNMkLsACJhttqc44ywv25ERjDXRB3echlw==
X-Received: by 2002:a17:906:3f12:b0:a1f:7065:1efc with SMTP id c18-20020a1709063f1200b00a1f70651efcmr13335619ejj.5.1702907725792;
        Mon, 18 Dec 2023 05:55:25 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i19-20020a170906265300b00a234c5d0834sm1791116ejc.175.2023.12.18.05.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 05:55:24 -0800 (PST)
Message-ID: <eaadc980-dfec-4882-964c-090a4fb09ff3@redhat.com>
Date: Mon, 18 Dec 2023 14:55:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: Non-ACPI support for AMD F1A~M0Fh
Content-Language: en-US
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
 <20231212103644.768460-8-suma.hegde@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231212103644.768460-8-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/23 11:36, Suma Hegde wrote:
> AMD EPYC family 0x1A and Model 0x0-0xF are having different
> mailbox message ID offset compared to previous
> platforms. In case of ACPI based BIOS, this information will be read
> from ACPI table, for non ACPI BIOS, this needs to be #defined.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/amd/hsmp.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 82bd4189cbd3..2c256a7f50b3 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -44,6 +44,7 @@
>   */
>  #define SMN_HSMP_BASE		0x3B00000
>  #define SMN_HSMP_MSG_ID		0x0010534
> +#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
>  #define SMN_HSMP_MSG_RESP	0x0010980
>  #define SMN_HSMP_MSG_DATA	0x00109E0
>  
> @@ -700,6 +701,15 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
>  	return ret;
>  }
>  
> +static inline bool is_f1a_m0h(void)
> +{
> +	if (boot_cpu_data.x86 == 0x1A &&
> +	    (boot_cpu_data.x86_model >= 0x00 && boot_cpu_data.x86_model <= 0x0F))
> +		return true;
> +
> +	return false;
> +}
> +
>  static int initialize_platdev(struct device *dev)
>  {
>  	int i;
> @@ -711,7 +721,16 @@ static int initialize_platdev(struct device *dev)
>  		plat_dev.sock[i].sock_ind		= i;
>  		plat_dev.sock[i].dev			= dev;
>  		plat_dev.sock[i].mbinfo.base_addr	= SMN_HSMP_BASE;
> -		plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
> +
> +		/*
> +		 * This is a tranisitional change from non ACPI to ACPI, only
> +		 * family 0x1A, model 0x00 platform is supported for both ACPI and non ACPI.
> +		 */
> +		if (is_f1a_m0h())
> +			plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
> +		else
> +			plat_dev.sock[i].mbinfo.msg_id_off      = SMN_HSMP_MSG_ID;
> +
>  		plat_dev.sock[i].mbinfo.msg_resp_off    = SMN_HSMP_MSG_RESP;
>  		plat_dev.sock[i].mbinfo.msg_arg_off     = SMN_HSMP_MSG_DATA;
>  		sema_init(&plat_dev.sock[i].hsmp_sem, 1);

