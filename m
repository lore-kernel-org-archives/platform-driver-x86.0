Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9048E16E89E
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711377766; cv=none; b=e9lALsnAgBv3wSqCBfnfOILg7720Dlh1RRyPFhk4sLb2b7FmTDyNSVXouaNDF/PrwCKj595cmpcERqFinHtbL3wID5vWIOJfwvTYBwzoyYoMOKe457RY2+41yKGMduE7uez3J/MtaK5poFTWFVtkUnm6D0qlFA2hAoVZNqZfQfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711377766; c=relaxed/simple;
	bh=mA/+DxCC3ihFJ1zYlS33xrreGKwqQ4RqaLfQBqH+EWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ksdCee4OAuMHDs2sKmp5hfQgpZiZ4XGHLeNEWyVUpJ0sC7fomAi6bQTcoNyoiwC78Uq2+XmWcNITaZgqpcIzdPNh16EHMJTu94AD71/bMjZt48qQf9amSB8wd/B7lf1/3WG4wdujzcLyGdcCIVkc9G3OW6smPuzCT41dQDx9B20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HQ2/oSdL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HQ2/oSdL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711377763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/6IrLlIE3Da2db17jeCkesXkCWvY/kCb5MtDYcPSqDA=;
	b=HQ2/oSdLUh5k+9rbh92w2xuKzAf9YGu6eYSgyGWuk+2/LdGHT3uo6BWBSesS4nlDXE9HSn
	wmqNH0LAMe0pRzQxhaiKn2KgBPzahzEbnrWW/hvF7ZdhoZKQhY3/Pk+HUPtgGQabqedH0S
	AQF1L4ho4INlSsUQrBILD0BCadDpcMs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-zMN81BOUNKKy69_9wOWHiA-1; Mon, 25 Mar 2024 10:42:41 -0400
X-MC-Unique: zMN81BOUNKKy69_9wOWHiA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50e91f9d422so4262297e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 07:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711377760; x=1711982560;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6IrLlIE3Da2db17jeCkesXkCWvY/kCb5MtDYcPSqDA=;
        b=c77Ue1bv58EJq+5c44K0oSJNQoiGcCEnLTLZlobHI4Q+GWrWB01Nn+aVMkj4cVORc4
         7AK8lwgSBMr8kvowZjA3xFv/NxZsBRuRjBQ6Y8rSXIyGCf4T2YYIwufVlG0DJsf1w15+
         61jfGh/qBXSYKuRSFtwjCVITylJjDU99P/wXGC9/ieUT8QTVrAL2MXBeeGX5jpnnVylo
         11KPOBzqGptCWbJpdJoV3fS0VM+Q1sBgtWCkuVDBhFvMxcQ1rs9sVyqs1z+cYENkEv1U
         W5GqBORRgCLX8kr83SHtETZAJVTKSm4H2uAOEIpAgIAnSeLKjbG4WwhS/nb4SrI2cnrW
         EXNw==
X-Forwarded-Encrypted: i=1; AJvYcCXvSUoIdiJTQ0xvEPFnDIwis1otZnu5pmqNpEBXWiQKJNzA6wQ92HWO7GJrv06R9gWTi1OwhKfPLYrUzD0GQSKLJJgYQ/nvsVHj4gXcsYWuzUOfog==
X-Gm-Message-State: AOJu0YzLWU5UahsuKQer/eQXYMxrqt3NQ0ijfmz3kfy8NYixCo89Mvfn
	O7Ae+KLBl3AA5iAL1nfSiM5bOa1/0Bm1muemLRiolWm5zTj4VoW0kCzIso4UTVgS4JanRM1ks6J
	X5V93NhM/2YNJT4pKBb3eMccYao8/XOzbVz1JSpDfXdhYpF6prVTEryNnQFAgSXbbnVdt8uA=
X-Received: by 2002:a05:6512:29b:b0:515:afa8:ae7 with SMTP id j27-20020a056512029b00b00515afa80ae7mr1101738lfp.31.1711377760330;
        Mon, 25 Mar 2024 07:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG5RBNgmHdsXz6C+hHNh4VMkcoaC1us5TFtqUbGOGEuu51671qBAGuaYZzesHPmPltIhJ2tw==
X-Received: by 2002:a05:6512:29b:b0:515:afa8:ae7 with SMTP id j27-20020a056512029b00b00515afa80ae7mr1101724lfp.31.1711377759916;
        Mon, 25 Mar 2024 07:42:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g7-20020a056402320700b0056c0996bf72sm1794239eda.83.2024.03.25.07.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 07:42:39 -0700 (PDT)
Message-ID: <7d7c3357-48a1-4479-9365-19fb3e9ddf0a@redhat.com>
Date: Mon, 25 Mar 2024 15:42:39 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] platform/x86: huawei-wmi: use sysfs_emit() instead of
 sprintf()
Content-Language: en-US, nl
To: Ai Chao <aichao@kylinos.cn>, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240319064243.297320-1-aichao@kylinos.cn>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240319064243.297320-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/19/24 7:42 AM, Ai Chao wrote:
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

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
>  drivers/platform/x86/huawei-wmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
> index dde139c69945..09d476dd832e 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -379,7 +379,7 @@ static ssize_t charge_control_start_threshold_show(struct device *dev,
>  	if (err)
>  		return err;
>  
> -	return sprintf(buf, "%d\n", start);
> +	return sysfs_emit(buf, "%d\n", start);
>  }
>  
>  static ssize_t charge_control_end_threshold_show(struct device *dev,
> @@ -392,7 +392,7 @@ static ssize_t charge_control_end_threshold_show(struct device *dev,
>  	if (err)
>  		return err;
>  
> -	return sprintf(buf, "%d\n", end);
> +	return sysfs_emit(buf, "%d\n", end);
>  }
>  
>  static ssize_t charge_control_thresholds_show(struct device *dev,
> @@ -405,7 +405,7 @@ static ssize_t charge_control_thresholds_show(struct device *dev,
>  	if (err)
>  		return err;
>  
> -	return sprintf(buf, "%d %d\n", start, end);
> +	return sysfs_emit(buf, "%d %d\n", start, end);
>  }
>  
>  static ssize_t charge_control_start_threshold_store(struct device *dev,
> @@ -562,7 +562,7 @@ static ssize_t fn_lock_state_show(struct device *dev,
>  	if (err)
>  		return err;
>  
> -	return sprintf(buf, "%d\n", on);
> +	return sysfs_emit(buf, "%d\n", on);
>  }
>  
>  static ssize_t fn_lock_state_store(struct device *dev,

