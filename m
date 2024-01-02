Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B51F4F4
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jan 2024 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OTdcbWI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704198676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pXm1eo2+cSSlRCUx7/WK9p72yxfZPBKBwAhmbPJUMo=;
	b=OTdcbWI2YGDVDTyr5gQPhBx2tBJ2oIBeT1cksZGsGCZIRUCIU8Q7PZ2vYWWTrAZH6DuGi3
	NxMkAJy9zWOYf1d8NBIZy4i0c5BMswXZZXpZfxXD2GzRyYDDMbIyFc+oJckU/vzMj+O3Yc
	viy1yTOz06UWAdonxnzg52/VLdvrhaM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-q90bTvL9NXSi0gkbZ7hBLQ-1; Tue, 02 Jan 2024 07:31:15 -0500
X-MC-Unique: q90bTvL9NXSi0gkbZ7hBLQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a26d99fe6d7so395255166b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jan 2024 04:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704198674; x=1704803474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pXm1eo2+cSSlRCUx7/WK9p72yxfZPBKBwAhmbPJUMo=;
        b=LnSmwdg6Pn2PGjjyGP+dJVZuK/v7W3hDmWJS+etfb4R0lIHVfkA7wXiBhHOo1Uc2oQ
         JnCWPgMCIH2p1QmWGFbvUgmQtrtqwZLfufEMi+s4g6HYNBhsJbLNAG8murSOMmDomxGt
         7q6/Zejip+dzuPsYugqPQw5JJayladrKIfImpCRmYnulh76Uin1+EttGrGPUMJLarjhD
         rxhhs4uLY9v1W5Se9MUvCWYvKkNJCtF+Hy6mrEmV7/ye/JIYZuV0Bzw0fidElslmxXuh
         fdozN1K4zsbIbcO6d5awBsj5Uk4KjPG1PIqgJqP/bt05tNaX3VvZB6WEkCV9FI4NdeLF
         34aw==
X-Gm-Message-State: AOJu0YxVEbu/O9KDxmXhk26/AJsTh31W4pd/amfcfzokOdZAfBpdWgNK
	iB82Em+mXaFdL/Q58FfL9SMstkA79S5Ri5lq///TslwuhUaWggjbzveaAyjE8nERgJJkFV/8x3S
	CVg++EqfuqIa7igSO6QtiPpyfkanVicwb4jwaxcYZTg==
X-Received: by 2002:a17:906:dffa:b0:a23:2762:e48b with SMTP id lc26-20020a170906dffa00b00a232762e48bmr7639240ejc.63.1704198674255;
        Tue, 02 Jan 2024 04:31:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQhmw/eDGvMUU+jSkGHAZ4e48rrwX5KtU/Tq6ha27grzHEuI2uh2bIV/ZGDpq8JjxvpIlOgg==
X-Received: by 2002:a17:906:dffa:b0:a23:2762:e48b with SMTP id lc26-20020a170906dffa00b00a232762e48bmr7639233ejc.63.1704198673994;
        Tue, 02 Jan 2024 04:31:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i3-20020a1709061cc300b00a26a9593a68sm11169117ejh.76.2024.01.02.04.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:31:13 -0800 (PST)
Message-ID: <f572489d-cdd7-4582-a355-ba0a917cf1f8@redhat.com>
Date: Tue, 2 Jan 2024 13:31:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/pmc: make lnl_d3_fixup static
Content-Language: en-US, nl
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, irenic.rajneesh@gmail.com
Cc: david.e.box@intel.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20231229020808.55840-1-jiapeng.chong@linux.alibaba.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231229020808.55840-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jiapeng,

On 12/29/23 03:08, Jiapeng Chong wrote:
> The lnl_d3_fixup are not used outside the file lnl.c, so the
> modification is defined as static.
> 
> drivers/platform/x86/intel/pmc/lnl.c:503:6: warning: no previous prototype for ‘lnl_d3_fixup’.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7811
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Thank you for your patch, but this has already been fixed
in the current version of the code, see:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/tree/?h=for-next


Regards,

Hans

> ---
>  drivers/platform/x86/intel/pmc/lnl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/lnl.c b/drivers/platform/x86/intel/pmc/lnl.c
> index 88b35931f5df..f18fdc68fd94 100644
> --- a/drivers/platform/x86/intel/pmc/lnl.c
> +++ b/drivers/platform/x86/intel/pmc/lnl.c
> @@ -500,7 +500,7 @@ const struct pmc_reg_map lnl_socm_reg_map = {
>   * Set power state of select devices that do not have drivers to D3
>   * so that they do not block Package C entry.
>   */
> -void lnl_d3_fixup(void)
> +static void lnl_d3_fixup(void)
>  {
>  	pmc_core_set_device_d3(LNL_IPU_PCI_DEV);
>  	pmc_core_set_device_d3(LNL_NPU_PCI_DEV);

