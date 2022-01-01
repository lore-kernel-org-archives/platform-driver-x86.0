Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A814C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  1 Jan 2022 13:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbiAAND5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 1 Jan 2022 08:03:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37083 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229699AbiAAND5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 1 Jan 2022 08:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641042235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jEdnJ5V6e6dDfgBpeMguyXtUhNZckFfASUngcdFfCTk=;
        b=BwFg8BDljVfoknSg5vAqs7BoTFIW9dxhBvoCLtu/ROcvkOUun4EFZo6EsYRqeiqBW/BFMx
        9yHmoUnCzEgbf7nUUCO9d7qUNqLlkYJZe63w+WOiJtkQ1XH5hMNRuqjQvV9QPOj27MELKg
        t30XtyZrqFYNpM9qOtLukLTtYTGDJVU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-g5EOjx_sM_KAQAnT2kVckA-1; Sat, 01 Jan 2022 08:03:54 -0500
X-MC-Unique: g5EOjx_sM_KAQAnT2kVckA-1
Received: by mail-ed1-f71.google.com with SMTP id s12-20020a50ab0c000000b003efdf5a226fso20150104edc.10
        for <platform-driver-x86@vger.kernel.org>; Sat, 01 Jan 2022 05:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jEdnJ5V6e6dDfgBpeMguyXtUhNZckFfASUngcdFfCTk=;
        b=lWj7hLRXqv9Dmhh+924NZVoVwRkAAEJUERJptoWKifCLlfACScSKwNW8rR2WtHsZuA
         gaC1M2NLCWmtpQKtyqtGp1O52XD7e3toXLlForg+CVui9Ag8WPX4WFLlqeDq+w7KIaiZ
         qj6FGeKO1AkhcIjeVXnbunlbMl9H9H63TKVWqYTttX3kZ72aK+VD+5uNoCLDMo0/99sU
         CN2cGgiYKx0+YnaR08qqbW611ougEuWyXv8rJoHKvw6zfXnOLBnhqgdR8HCkgtsvgXiq
         54N9PLu/JTFQ7WO8ceCfL8KsSeJ2linq3kUABkrqQHI2FoqwfJ2mW8UccmR7i9+H/udX
         BfCw==
X-Gm-Message-State: AOAM530VNF0KVBNBXXC9JeGoB3AWTmK+L7r59wJi8ufJMkGWQXArY+rG
        C8xGEjily4grQg4Vftepkpq0Yz7MqN7OllWzS7DhtWpztp4pGmYmWdvEuuK6CGPbRE+ztA9v9R2
        /k1zKpMHPOc4YkSgXSISHzeCbKjIsWnlmlA==
X-Received: by 2002:a17:907:3e0b:: with SMTP id hp11mr30113732ejc.584.1641042233104;
        Sat, 01 Jan 2022 05:03:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7Y1adl3v/hPy2/ES5ul0vI6t8erfXHjHO2xkuYFjn2Jc6HysX14HpQzNuS1F971b17Nikbw==
X-Received: by 2002:a17:907:3e0b:: with SMTP id hp11mr30113718ejc.584.1641042232933;
        Sat, 01 Jan 2022 05:03:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id d17sm9136699ejd.217.2022.01.01.05.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jan 2022 05:03:52 -0800 (PST)
Message-ID: <91e95d59-f8b1-07f9-de57-824e6b1668d5@redhat.com>
Date:   Sat, 1 Jan 2022 14:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: intel_scu_ipc: Keep polling IPC status if
 it reads IPC_STATUS_ERR
Content-Language: en-US
To:     "Khandelwal, Rajat" <rajat.khandelwal@intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "Krogerus, Heikki" <heikki.krogerus@intel.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Westerberg, Mika" <mika.westerberg@intel.com>
References: <20211230082353.2585-1-rajat.khandelwal@intel.com>
 <CO1PR11MB48352F856F280F0E3716972196469@CO1PR11MB4835.namprd11.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CO1PR11MB48352F856F280F0E3716972196469@CO1PR11MB4835.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Rajat,

On 12/31/21 16:49, Khandelwal, Rajat wrote:
> Adding ++Heikki
> 
> Thanks
> Rajat

If you want me to apply this, please send this as a proper patch, not as an inline
forward to me, with the platform-driver-x86@vger.kernel.org list in the Cc.

Regards,

Hans


> -----Original Message-----
> From: Khandelwal, Rajat <rajat.khandelwal@intel.com> 
> Sent: Thursday, December 30, 2021 1:54 PM
> To: mika.westerberg@linux.intel.com
> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Khandelwal, Rajat <rajat.khandelwal@intel.com>; Westerberg, Mika <mika.westerberg@intel.com>
> Subject: [PATCH] platform/x86: intel_scu_ipc: Keep polling IPC status if it reads IPC_STATUS_ERR
> 
> The current implementation returns -EIO if and when IPC_STATUS_ERR is returned and returns -ETIMEDOUT even if the status is busy.
> This patch polls the IPC status even if IPC_STATUS_ERR is returned until timeout expires and returns -EBUSY if the status shows busy.
> Observed in multiple scenarios, trying to fetch the status of IPC after it shows ERR sometimes eradicates the ERR status.
> 
> Signed-off-by: Rajat-Khandelwal <rajat.khandelwal@intel.com>
> ---
>  drivers/platform/x86/intel_scu_ipc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
> index 7cc9089d1e14..1f90acaa7212 100644
> --- a/drivers/platform/x86/intel_scu_ipc.c
> +++ b/drivers/platform/x86/intel_scu_ipc.c
> @@ -233,17 +233,23 @@ static inline u32 ipc_data_readl(struct intel_scu_ipc_dev *scu, u32 offset)  static inline int busy_loop(struct intel_scu_ipc_dev *scu)  {
>  	unsigned long end = jiffies + IPC_TIMEOUT;
> +	u32 status;
>  
>  	do {
> -		u32 status;
> -
>  		status = ipc_read_status(scu);
> -		if (!(status & IPC_STATUS_BUSY))
> -			return (status & IPC_STATUS_ERR) ? -EIO : 0;
> +		if (!(status & IPC_STATUS_BUSY)) {
> +			if (!(status & IPC_STATUS_ERR))
> +				return 0;
> +		}
>  
>  		usleep_range(50, 100);
>  	} while (time_before(jiffies, end));
>  
> +	if (status & IPC_STATUS_BUSY)
> +		return -EBUSY;
> +	if (status & IPC_STATUS_ERR)
> +		return -EIO;
> +
>  	return -ETIMEDOUT;
>  }
>  
> --
> 2.17.1
> 

