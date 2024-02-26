Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B0F21A0D
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 10:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708944549; cv=none; b=parVkAAhox6dCQPzOLnk6RXvqSs0Zs3K8lc0QW1wZeu8YrKem+/v8hfaCz97HhFpMobsmFea1dIGG1Vwqxb9BpvEzpmpB19m8JjH0pHINV6bSbPg05ekxFfPvyFwov33AVwkBj6dI/ZM5uSJte3xu52AW5RneUDtk45bfOeal7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708944549; c=relaxed/simple;
	bh=oN6z/Ma+rlJcjTxPxoSfXJuY6hkPlkN3GBr7lfToEJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBnHsIYaeXAFr2gkPYfJsYRFTokFiVWQvmHS1Sl0lnIMt2ylCLFc976ddjcnjP1wCwc1kzHgfRh/kPvfX5hPxD0jGWOmvuSC8wHLAsRtE+DPNyloO85Huju/4Z34kaHv33A0lbywqVKWnoxFT4s6aDJNeh7b0Jjxf8hBIDsgiqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qgh1Oz/M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qgh1Oz/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708944547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrWLYtqd2oPYXe7xrqMQ9XAg0ahyT9g/GSMPGa3xAnU=;
	b=Qgh1Oz/MLDuf50FOQB15sVfprhoGJx+juaCbGchUYvv3F6FV7EuhZlRbfUWaoL0KwJair3
	wDLfmc6fjzgucLNjMdveKfRSqjXpAp1U2uOpM5ah0Ueb9VTylDQSyWrqZqeh1gXlNv7NfR
	CcP0UVlGD+CnKTHk5hBGKqTXZmwCi4A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-DSRc2rsmPEO8lyYUe0VOwQ-1; Mon, 26 Feb 2024 05:49:05 -0500
X-MC-Unique: DSRc2rsmPEO8lyYUe0VOwQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a43381a778aso67747466b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 02:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708944544; x=1709549344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrWLYtqd2oPYXe7xrqMQ9XAg0ahyT9g/GSMPGa3xAnU=;
        b=FS4TxJ7ekJQckX5McwKmm80wKgGe1brE3Kyno+fkUV524S1b2AW4yDCKMX4mqAqubT
         l9S5r3mQH+ibKc7pR+J17GvsoubLHTbxILrlVl72R0ePbW3cIIj0U165lniLErtb6wjJ
         1X8UgJ878q5cHSkyWYZknDRF5/NDy3nZrTmOfA12Im79WrpZfhamMAm/rDVZmdh4evEE
         TlgYb+epJ5HjP35nNAlDPioxHiIRmc/QhfigiwnZ5cxEcpiVFegcv/oL7PD12efmCOSe
         uQTYF9FwTASH3Y9K5bz0/bpPiVcS9smKiy7nD66llKA7rg6cOpICK+pfotjShnj3z2JK
         H2JA==
X-Forwarded-Encrypted: i=1; AJvYcCWWRAX+5NmV96wpH6I30NCCVyqMM/5UUQwifhXSQ56NuQBBQBnG4w7FZ+Dnp2Cysfdk+786tnEev33R7yspdn+fKRLKLvug1YhPLdd3q4GS9r7SFA==
X-Gm-Message-State: AOJu0YwsThjq5EjIgkbcl7VuDbP9mH7JHm8RbgO1ECq5rg2hz7q+fN79
	+NCBVLZnGeGxUxjtkYOj8mpewMJuC3TLzwYQBw6q4EHbx2Hybdh35ZcaVZaw8JGagGwLZUWsV6C
	wMvaZhDNIBugwfpzWCffRq2hkUAGXHMJG3S/4XWIMip/02uM781P5eijkueC+q3nLGt+6sIo=
X-Received: by 2002:a17:906:c40c:b0:a3f:d2f3:d226 with SMTP id u12-20020a170906c40c00b00a3fd2f3d226mr3902607ejz.17.1708944544474;
        Mon, 26 Feb 2024 02:49:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgFHc4kU42ZCWURdwrBTU2m+DV9YfBo4gixVnObYtzVknKuFLf5Ic5UH7eLPkpUMhjJLrKkQ==
X-Received: by 2002:a17:906:c40c:b0:a3f:d2f3:d226 with SMTP id u12-20020a170906c40c00b00a3fd2f3d226mr3902592ejz.17.1708944544206;
        Mon, 26 Feb 2024 02:49:04 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id rf14-20020a1709076a0e00b00a4339b8b1bbsm1143238ejc.212.2024.02.26.02.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 02:49:03 -0800 (PST)
Message-ID: <549ba85b-9902-4fed-9f67-e3ebc3aec3ec@redhat.com>
Date: Mon, 26 Feb 2024 11:49:03 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: dell-privacy: Remove usage of
 wmi_has_guid()
Content-Language: en-US
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240223162905.12416-1-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240223162905.12416-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/23/24 17:29, Armin Wolf wrote:
> The WMI driver core already takes care that the WMI driver is
> only bound to WMI devices with a matching GUID.
> 
> Remove the unnecessary call to wmi_has_guid(), which will always
> be true when the driver probes.
> 
> Tested on a Dell Inspiron 3505.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/dell/dell-wmi-privacy.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platform/x86/dell/dell-wmi-privacy.c
> index 4d94603f7785..4b65e1655d42 100644
> --- a/drivers/platform/x86/dell/dell-wmi-privacy.c
> +++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
> @@ -297,10 +297,6 @@ static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
>  	struct key_entry *keymap;
>  	int ret, i, j;
> 
> -	ret = wmi_has_guid(DELL_PRIVACY_GUID);
> -	if (!ret)
> -		pr_debug("Unable to detect available Dell privacy devices!\n");
> -
>  	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> --
> 2.39.2
> 

