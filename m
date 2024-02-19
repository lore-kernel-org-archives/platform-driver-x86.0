Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4819C2C68B
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708342589; cv=none; b=K3ln+1GkYuKPschWcM2ki3UhzKeVbA2xD04Qc5bZbhURW8YREW5Peg03azCK389c7c+Tlwa971FZZDJM1rA9h9PjXSyHtFWDHC+A9UCG8GCfJF/2YQV66QmYU8WA8NB63rGPaL44my2BIQyngMlC63DI335Y8ynQGK1X/jyuOok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708342589; c=relaxed/simple;
	bh=EWkBavHLn+OopLzpvPPHkNXk/lsnfjFePZMUx0qJkqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dahpg+tlhUQsAMLCJce70GvAGbtAp1pZpDBbqcVhtmsxa5lLjsdt6360fXW2SAmPGt77skFqUo8F1a5ism9x0x1TKkBYUd8koO9aa3C74tLPfcqTaeA2rdiSPfTaywUnyEQEsByLwnv6TCWmN++6i3p8j293MfBmt6ZnPyCuI3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XwRZ05+o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XwRZ05+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708342586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RaZBYDrNrWIpQuwZRoJJQwbTIgMqN6IhSLTRJ6ho8ik=;
	b=XwRZ05+oYRwzPEJ76alV0JPnjsXm6rEJB97CRCsHYoQ70OKKIze7pm9ZxAmBFmvnClduSz
	YJxWFIKsPRBPoziwYk93Y/TRIjvjLCL6GtUOz/EEd2b5By9QGEdKJb0tBXkMrsJbdmRE+V
	2Mzzh0mTti92PdYuSo6SRrKhoq97eMo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-I9Y-q3zuPnCv8L28wUDyfQ-1; Mon, 19 Feb 2024 06:36:25 -0500
X-MC-Unique: I9Y-q3zuPnCv8L28wUDyfQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2c4e9cb449so332930566b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 03:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708342584; x=1708947384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaZBYDrNrWIpQuwZRoJJQwbTIgMqN6IhSLTRJ6ho8ik=;
        b=LqCW6AVbmGyK7RLE4glSGjUVstUr6Hmo8RzzpGNMGAlSQuqEOn7DdnWYRbJIrWF+u7
         9V5A/ikJm3yLl7+NXUUufkocp2/tmh9CY31akQG0B6dDr8yZaxxJ+5tc04VSKFTFjcLK
         9OKxsNJ7wqm+O6k/gK9pncgq4J5Cgnx44iMdSz7oFhWkgfXASXIZnGigEJ+scV+hujd1
         3sntkPsm2O/i5Kv6YfwHkakTrxwjVY/aMw6pzET3jTgVp1j4E0tsMouFT9y0J9G3dwnP
         ApE8G64goP1db/oBMXGrKAwCY63t88m1oQab+PFXFjOyga49jubw2XoGiyW5dUzNxDQJ
         aJwA==
X-Forwarded-Encrypted: i=1; AJvYcCWkiE/VsG+XG2I9GKs7xmIA5w+e5/IJaPcSjoy3+zM9UiFAHxAYMs09R/bCBF3uGntYrls4EE/8hYZAJXa6xnNlJG5FjaPrYdClcn4G/HFYY4HaaQ==
X-Gm-Message-State: AOJu0Yy7fCm+fBF4mTKlffgpMwNOB3lQI/talxge+19jPcZeRcTU51gv
	csrud/ZbyfTWmgpNf2H4dV4ltoimu7g5B//ZPlyt09u5MnwcZAObR+qT85t5Fr4U/GKJGOcKJwp
	QMhLUOQBy+dRzwJFOahCs8oX8zEknRVll5S0vX67aDFmmLj7urHbvVAyF9WzlxLHH9kUUKas=
X-Received: by 2002:a17:906:495b:b0:a3e:97e6:dc1d with SMTP id f27-20020a170906495b00b00a3e97e6dc1dmr1492137ejt.52.1708342584340;
        Mon, 19 Feb 2024 03:36:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPeDNv4cXcgUWAC9iho6U9B8/ESsy4IzGVIwiKZk+yOmu8MJv0kiojeheRtgqEd62dyLttfw==
X-Received: by 2002:a17:906:495b:b0:a3e:97e6:dc1d with SMTP id f27-20020a170906495b00b00a3e97e6dc1dmr1492124ejt.52.1708342584045;
        Mon, 19 Feb 2024 03:36:24 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ss1-20020a170907c00100b00a3e0c07c1a0sm2739493ejc.23.2024.02.19.03.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 03:36:23 -0800 (PST)
Message-ID: <a6682692-531e-4a21-abde-8c2df518a1eb@redhat.com>
Date: Mon, 19 Feb 2024 12:36:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: think-lmi: Fix password opcode ordering for
 workstations
Content-Language: en-US
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20240209152359.528919-1-mpearson-lenovo@squebb.ca>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240209152359.528919-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/9/24 16:23, Mark Pearson wrote:
> The Lenovo workstations require the password opcode to be run before
> the attribute value is changed (if Admin password is enabled).
> 
> Tested on some Thinkpads to confirm they are OK with this order too.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I've also added the Fixes tag and Ilpo's Reviewed-by.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  drivers/platform/x86/think-lmi.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 3a396b763c49..ce3e08815a8e 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -1009,7 +1009,16 @@ static ssize_t current_value_store(struct kobject *kobj,
>  		 * Note - this sets the variable and then the password as separate
>  		 * WMI calls. Function tlmi_save_bios_settings will error if the
>  		 * password is incorrect.
> +		 * Workstation's require the opcode to be set before changing the
> +		 * attribute.
>  		 */
> +		if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
> +			ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
> +						  tlmi_priv.pwd_admin->password);
> +			if (ret)
> +				goto out;
> +		}
> +
>  		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
>  				    new_setting);
>  		if (!set_str) {
> @@ -1021,17 +1030,10 @@ static ssize_t current_value_store(struct kobject *kobj,
>  		if (ret)
>  			goto out;
>  
> -		if (tlmi_priv.save_mode == TLMI_SAVE_BULK) {
> +		if (tlmi_priv.save_mode == TLMI_SAVE_BULK)
>  			tlmi_priv.save_required = true;
> -		} else {
> -			if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
> -				ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
> -							  tlmi_priv.pwd_admin->password);
> -				if (ret)
> -					goto out;
> -			}
> +		else
>  			ret = tlmi_save_bios_settings("");
> -		}
>  	} else { /* old non-opcode based authentication method (deprecated) */
>  		if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
>  			auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",

