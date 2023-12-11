Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tc0K3etI"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3216DD1
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 02:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702289088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTI8ORsYY/KaDfknA8aoZfsjhbA8xLRWljuvGCGEoQY=;
	b=Tc0K3etIN6Z85E+mbaYG8LNUesJmIARAVMxxLxWGQxmEH/YUqRmQ92tXO6Vz6xx9jMG8pk
	SWT+xg1Zg93vgRwOuugnb48El2lStdmt04WFSAJWE6PMJYjBUQI19LNSeiIKfYxQ8MMNAn
	xfR3Bd79HVp4rrwWPIlMfkMdsvUrMwo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-F_yWP2u5N2GK9t1XkkrbKg-1; Mon, 11 Dec 2023 05:04:46 -0500
X-MC-Unique: F_yWP2u5N2GK9t1XkkrbKg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a1cc20d32dfso238489266b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 02:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702289085; x=1702893885;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zTI8ORsYY/KaDfknA8aoZfsjhbA8xLRWljuvGCGEoQY=;
        b=uaDVkTa+IsuzSKx+kG0mOUXkt0clU0pqkiSCpXN4vQbwvXhBYMUn3lvXaNb8Uaq0sE
         sf5QBEjIMDYFkZV1hp8j9abgNYIxmQUauneS1pS7rpwCyxmhWZu0joEkPRE9OrmXiH9z
         PfWD+Ss6eSt1D0tQByg5qLADosGwY8SEmnP7rUj9qHZRBd97sv35/ZGn40izXW7YLB/p
         fdoZS7VWJ2M82Y4eXd80QaUZJlGpq3kev8OiTeBr9YYa4skbpQTDzcviQj8yhd+CJnWh
         gp9Adr5dyzRNBnZNxxK31los/k0cCBCkHCHvvobc/7X6//teIE81SiciM209IV6ni/ch
         qSAQ==
X-Gm-Message-State: AOJu0YwN1LYlg954sUm5OJr2wx/Hpc+QhmjrmWpe6GpJhxGkbepvV1V+
	PtyjCzdTxTle62jajRwRhC+OtaPekZv4d3LKrrNUoe7AkLLDxILeKyoq2DQ5N+rITUXqqKO1Evl
	oD0qpddClroP6FRkWraur+ywmFXqnAZlQiw==
X-Received: by 2002:a17:906:22d8:b0:a1e:7be8:9564 with SMTP id q24-20020a17090622d800b00a1e7be89564mr1585299eja.57.1702289085234;
        Mon, 11 Dec 2023 02:04:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQxXHVdGAsaXewCyy8e6XmNCwLR86ivVqJcefy3RPgEgbK280kkHNwsj+v2/GrQb5QUMERWQ==
X-Received: by 2002:a17:906:22d8:b0:a1e:7be8:9564 with SMTP id q24-20020a17090622d800b00a1e7be89564mr1585295eja.57.1702289084910;
        Mon, 11 Dec 2023 02:04:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ss20-20020a170907c01400b00a18850d2240sm4661237ejc.143.2023.12.11.02.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 02:04:44 -0800 (PST)
Message-ID: <e779d481-0953-4ac6-86a9-711d88e9ffcd@redhat.com>
Date: Mon, 11 Dec 2023 11:04:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] clk: x86: lpss-atom: Drop unneeded 'extern' in the
 header
Content-Language: en-US, nl
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231208165238.3309058-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231208165238.3309058-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/8/23 17:52, Andy Shevchenko wrote:
> 'extern' for the functions is not needed, drop it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
>  include/linux/platform_data/x86/clk-lpss.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/platform_data/x86/clk-lpss.h b/include/linux/platform_data/x86/clk-lpss.h
> index 41df326583f9..7f132029316a 100644
> --- a/include/linux/platform_data/x86/clk-lpss.h
> +++ b/include/linux/platform_data/x86/clk-lpss.h
> @@ -15,6 +15,6 @@ struct lpss_clk_data {
>  	struct clk *clk;
>  };
>  
> -extern int lpss_atom_clk_init(void);
> +int lpss_atom_clk_init(void);
>  
>  #endif /* __CLK_LPSS_H */

