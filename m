Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8AMMPKT"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4509DB6
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 02:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702289466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ezpyX3f9VoT7jM4ALDKRb6jfowJi43kmWWGKSXH5dwk=;
	b=F8AMMPKTAffESur0sUJKAaPolNkBlV+5dmxeOIRGkCIBgrjj6C3u5tTu17NseI1iLFd62A
	p9XYv7sJZXZLbYWPCfgcsc9qodVo51DgX2MbkodAATDP+zWlrKu61UI2hmHIrQiTWOlEiV
	OcsqjwR6YsGqvZtfvjc30zAZT8fVHOs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-1iRlZpWqPvKWcdAH7Txprg-1; Mon, 11 Dec 2023 05:11:04 -0500
X-MC-Unique: 1iRlZpWqPvKWcdAH7Txprg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ca31b054e4so31529001fa.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 02:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702289463; x=1702894263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezpyX3f9VoT7jM4ALDKRb6jfowJi43kmWWGKSXH5dwk=;
        b=dJ0N+hfPO1oEluS+8B1K9undEF11WVf6ii1Z93LPPEyDUjMwHeqFcdio+yCe/CDdEY
         1wcjTSQmrw7UAmaxG3Ljocrmjhb1+paCBHQZDHj7hbsLCLYgdUXHOZPW3j4sEdA/eiXF
         SYNPLNCp6NDYdnfx7Or4fHI1vbQIXwh65xjbw+XXOy/ElgZDXGH7T2G55GFYnKkBDGsd
         7L+rlWo2shDLgSu06FnpMYM/QfKTPn4T1f0agWPjuQvdkbfvtdONOwvRZU4wpFHZ0Mi0
         ygWIPhIGXHDvt5UktW0vBqDivqZ2Vpj1rdVCqnuPEeHMntFTaEgIZ7of+AbQJN/1T3tz
         iZZg==
X-Gm-Message-State: AOJu0YxUANAb7C+hMCrQe3jX5pdQSA7jhYQnvgiYKFxpGqat9V+ptk2/
	bhdaSLGgyBTxMhjXEyHbeRONv6s2McU9bLnBsTDSIOE8UvGSATgAl02njIzjz18DsNJxPKTC9yO
	c/pD83pdl7Rvv5BG1MGq1f9ucAbT+lRGAhRIcB0qxng==
X-Received: by 2002:a2e:bc8b:0:b0:2cc:1f90:5998 with SMTP id h11-20020a2ebc8b000000b002cc1f905998mr1295810ljf.98.1702289462817;
        Mon, 11 Dec 2023 02:11:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIKUq8HMjzDaeC3gKdW0s+eWE8fQtLYJA78Qm3O/rqIUpJfXkVDltyTxPImnwzJT6djKrmzQ==
X-Received: by 2002:a2e:bc8b:0:b0:2cc:1f90:5998 with SMTP id h11-20020a2ebc8b000000b002cc1f905998mr1295800ljf.98.1702289462431;
        Mon, 11 Dec 2023 02:11:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id tk10-20020a170907c28a00b00a1cfa7e0d40sm4557317ejc.61.2023.12.11.02.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 02:11:01 -0800 (PST)
Message-ID: <6cf13a55-cd6d-47a4-ba92-c0e9fe1ad2bc@redhat.com>
Date: Mon, 11 Dec 2023 11:11:01 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86: ips: Remove unused debug code
Content-Language: en-US, nl
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20231208134845.3900-1-ilpo.jarvinen@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231208134845.3900-1-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/8/23 14:48, Ilpo Järvinen wrote:
> Remove unused debug code inside #if 0 ... #endif.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

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
>  drivers/platform/x86/intel_ips.c | 33 --------------------------------
>  1 file changed, 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index 4dfdbfca6841..e26e7e14c44c 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -1105,39 +1105,6 @@ static int ips_monitor(void *data)
>  	return 0;
>  }
>  
> -#if 0
> -#define THM_DUMPW(reg) \
> -	{ \
> -	u16 val = thm_readw(reg); \
> -	dev_dbg(ips->dev, #reg ": 0x%04x\n", val); \
> -	}
> -#define THM_DUMPL(reg) \
> -	{ \
> -	u32 val = thm_readl(reg); \
> -	dev_dbg(ips->dev, #reg ": 0x%08x\n", val); \
> -	}
> -#define THM_DUMPQ(reg) \
> -	{ \
> -	u64 val = thm_readq(reg); \
> -	dev_dbg(ips->dev, #reg ": 0x%016x\n", val); \
> -	}
> -
> -static void dump_thermal_info(struct ips_driver *ips)
> -{
> -	u16 ptl;
> -
> -	ptl = thm_readw(THM_PTL);
> -	dev_dbg(ips->dev, "Processor temp limit: %d\n", ptl);
> -
> -	THM_DUMPW(THM_CTA);
> -	THM_DUMPW(THM_TRC);
> -	THM_DUMPW(THM_CTV1);
> -	THM_DUMPL(THM_STS);
> -	THM_DUMPW(THM_PTV);
> -	THM_DUMPQ(THM_MGTV);
> -}
> -#endif
> -
>  /**
>   * ips_irq_handler - handle temperature triggers and other IPS events
>   * @irq: irq number

