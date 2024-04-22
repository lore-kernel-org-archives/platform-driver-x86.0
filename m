Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9390314F9F8
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 13:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713793165; cv=none; b=lyhn6yq+KQU7HY5/gLi4fWKCUJ/HlzaqqkZFjRWjLvJrh6+blrxgp5ckcK3XU/izVz1kIRG9LF7AoQlJ9EOeoFHHOcXQ5AO9bT6SDoixJVCj2inf2h8rPGgVoQAB077BtXPuMBS1rz3cNyCAGL5RuYejM4jfMMHeCgyZGZ0FlOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713793165; c=relaxed/simple;
	bh=rKNWGbbelSWXmDZk6qzieOynFuUJzmm3g4Nik3RV2uE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rhh+4g2ado6aKMYGdl3TglGWlcvFNjYPQeEGuFbi+EAnber4mSlY7K/eJjrewAuHL+oRSnwFDQzwv9USq5KCii2lDW4EVLcxCOO7gqfZgLwx4EzLM27z0ynjOpl0TU46y+dxfuwczysg32fbvmRDvGVucCsftV6dFC1JD4+nHQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c20hvpVZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c20hvpVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713793162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EKCizU5xv1hF+5h7xbiS1EPOIMbVIqYGGrC9ITejgdo=;
	b=c20hvpVZhFOU1VEZQTnkl31heUc1YdlNWbo0079IWppiKCljp8cqSHvQdFzPD+/VyavZmU
	1/3DLmZs2BaPVf3okjboZpmNJWBWPVTVC793YIISQnhr4uYS7RK/rLWlVVJ2ATorPGxqq/
	h9hz+O+dp1Rtka3CE1rVe4wxzjhXDUw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-DyEnvs58NY2d2LEAggDxXA-1; Mon, 22 Apr 2024 09:39:21 -0400
X-MC-Unique: DyEnvs58NY2d2LEAggDxXA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a523cb0c818so118926366b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 06:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793160; x=1714397960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKCizU5xv1hF+5h7xbiS1EPOIMbVIqYGGrC9ITejgdo=;
        b=bq4RauuQBH18so6ik+LoSlMg7w61ozXdp0mz75jpuglS5XIiGUTzzLmDYFntRuKoO6
         lELydvi+AcuL+KX+iBNu2zmW2+DlGSBtOvcptD48tiOgzT41od87cv+TpJR7BWdH51Os
         9Nzl58mGS45TJf3iNWuDwuiHUFvKiucfvIKJm1+4/YaxuDzO2bv3RIZPk7zjasCl+ZL/
         b42pW8wURUzijTgDJJzPiHR6AtRfU88cYW41zoqMnCN3k5WS+pa+ztLlHoJDDmtE1QqI
         muFOzNYcF7B2S2KoXzxqSBv1o66ZdKBTVCsP8WnFVY9CcthxSvV48SzNRczAMVTwu+KK
         FMXA==
X-Gm-Message-State: AOJu0YzfM2piDtVTJIpH8M9xeXEZyl8D3+v4Byac+EzzVJouiYa4fIj7
	rOkK1hC1IgpX00nbNgebzTS4nxoJ9ph3AhzL+oTxT0m3KO8dFC9eq5o4FLDVXJNx2AiUvWqcnUP
	Fo7e/xt6ozyMfSlbCr8DofRzauQCImUehI/p5pYG1hWMIQdr+LZvId0JWhGtl9HjI1heIIxw=
X-Received: by 2002:a50:9f43:0:b0:56e:2b80:d87e with SMTP id b61-20020a509f43000000b0056e2b80d87emr8777964edf.2.1713793159973;
        Mon, 22 Apr 2024 06:39:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqU43ogGpA6obw7aoysC5Rf0RNBQASyMYOWXcZAdZLCK6tL3ZeClYHMviS29cAKvVBljXK4w==
X-Received: by 2002:a50:9f43:0:b0:56e:2b80:d87e with SMTP id b61-20020a509f43000000b0056e2b80d87emr8777939edf.2.1713793159535;
        Mon, 22 Apr 2024 06:39:19 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id l11-20020a50cbcb000000b0057030326144sm5555206edi.47.2024.04.22.06.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 06:39:19 -0700 (PDT)
Message-ID: <49263c2d-4fb8-49be-b74e-9f432e8a5994@redhat.com>
Date: Mon, 22 Apr 2024 15:39:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: change sprintf() to
 sysfs_emit()
To: yunshui <jiangyunshui@kylinos.cn>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, hmh@hmh.eng.br,
 ilpo.jarvinen@linux.intel.com, Ai Chao <aichao@kylinos.cn>
References: <20240417092055.1170586-1-jiangyunshui@kylinos.cn>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240417092055.1170586-1-jiangyunshui@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/17/24 11:20 AM, yunshui wrote:
> As Documentation/filesystems/sysfs.rst suggested,
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: yunshui <jiangyunshui@kylinos.cn>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 82429e59999d..1ed27fc21a7d 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -817,7 +817,7 @@ static int __init setup_acpi_notify(struct ibm_struct *ibm)
>  	}
>  
>  	ibm->acpi->device->driver_data = ibm;
> -	sprintf(acpi_device_class(ibm->acpi->device), "%s/%s",
> +	sysfs_emit(acpi_device_class(ibm->acpi->device), "%s/%s",
>  		TPACPI_ACPI_EVENT_PREFIX,
>  		ibm->name);
> 

This is not a sysfs show() function.

 
> @@ -857,7 +857,7 @@ static int __init register_tpacpi_subdriver(struct ibm_struct *ibm)
>  		return -ENOMEM;
>  	}
>  
> -	sprintf(ibm->acpi->driver->name, "%s_%s", TPACPI_NAME, ibm->name);
> +	sysfs_emit(ibm->acpi->driver->name, "%s_%s", TPACPI_NAME, ibm->name);
>  	ibm->acpi->driver->ids = ibm->acpi->hid;
>  
>  	ibm->acpi->driver->ops.add = &tpacpi_device_add;

This also is not a sysfs show() function.

I've dropped these 2 parts of the patch while applying it:

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




> @@ -2679,7 +2679,7 @@ static ssize_t hotkey_bios_enabled_show(struct device *dev,
>  			   struct device_attribute *attr,
>  			   char *buf)
>  {
> -	return sprintf(buf, "0\n");
> +	return sysfs_emit(buf, "0\n");
>  }
>  
>  static DEVICE_ATTR_RO(hotkey_bios_enabled);
> @@ -9789,7 +9789,7 @@ static ssize_t tpacpi_battery_show(int what,
>  		battery = BAT_PRIMARY;
>  	if (tpacpi_battery_get(what, battery, &ret))
>  		return -ENODEV;
> -	return sprintf(buf, "%d\n", ret);
> +	return sysfs_emit(buf, "%d\n", ret);
>  }
>  
>  static ssize_t charge_control_start_threshold_show(struct device *device,

