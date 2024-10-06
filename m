Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE232F2E
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Oct 2024 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728211687; cv=none; b=NSIdnB12DxEiH8TzTscK9gstmK5KZ6ccaTyPtesYhr7RqKKYX1ZdnuP0Urm7sCtiqt86BsfBT+gN0P/Jh7tqWcdWJ0aEkV0erBN7l7nBGAHUq9UePqrJT/jxCidD8fG49mFbNaWT11atFnMyD8LqeyRWb11k0Mb4u+77aAXa1Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728211687; c=relaxed/simple;
	bh=MxQOO5u84lA1S+vT3d3JI9UyHCndyYKnLfRTzdAJM6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SIbaiva56YKnCkQ0hpGCsXdKt1eM5JMxy/5+0vk5cPXfkhpwYLs96wnS/MI+Dzw1SkIJ9lbZYgmp49LvdQcSLB7NE5O73V9stGYZHl6cbWvjAOHJm5Vx/qaKVPiOoKIH6LDw8j8DUmKhmxdz5nO9ou30eADrDwwCrBIZR70lxTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HFfq4FNk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HFfq4FNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728211684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fXmkApj05qFOuNwex0AjhiRwwyAU6PpjHQvS7PGyaw=;
	b=HFfq4FNkZrm83KFruZ1R4Ggvm0VvfKGJlOT4P4CYEq5BBrdv+99OOJ36Lez9h0utIDsMvQ
	ULcb9JWHGRe9dAAdBXagoK0KkivFEKyxW/dKAodbg9Lu62//wkvfyMM87nSg59jCrrtEA6
	tFFapGSc/XVRiHwxqGnu17ZoWzftDuo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-jaEDDY7mNMuGEBKag5Ac_g-1; Sun, 06 Oct 2024 06:48:03 -0400
X-MC-Unique: jaEDDY7mNMuGEBKag5Ac_g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a8d0d87f204so558294866b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Oct 2024 03:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728211682; x=1728816482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fXmkApj05qFOuNwex0AjhiRwwyAU6PpjHQvS7PGyaw=;
        b=BAuz58wRMxtNtF9pPAMsth9Un2Dx+sQXRTg5G0NkqgfumgosVIRTcehQTfWX2zO066
         hPEZzXJxe843f5sW6vnM6Qn7+Z27BZljbb/wPSdS0iyM+c9S7AqBHP4mxJ50I3kXicEH
         6W8m0Ocf1m+2zwbkFCbw0dNj5MPaXo5gCLJAIMSJWNjVPhHf4xgH1dcuG2koQyCG6BRU
         9wQCkQXA1SZDasB5dDK8q3bucBX/gWLtAVT1Vv92pJmGb3A1v3Rn6cH8iwjypmIYTRNo
         8SNYTkYy3ibHQxtRUzpoGgvzbiVR+UnP/5qwaH1DComSJ4ICdLZK/LBKP5+ZEYkhqkVO
         vF/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQeSdw0rnqCUxC6Kimir1kxGC7FKkJyVjZtlg+Ixew/GkC++rWEae3MTH3ODTiN/mDTaNBa2Ida754ic6VLx1odiax@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0jr//6rnHfzU1RlYFPry8H+rSQgRnm8FZLZApxsyMkovgwF8O
	YC8ZwReTFfM6HYHu6+4S/rGM4fUc/SUJo+HNWOBLP9dKfxMkI+GXDekR3xfrMVM8wKqz8bMeVIo
	X2OuVHtsr5+kDXqQ5HOxLvO1Xr4PWHkaSJEheU+GGwvpyWVAdsptMn8hmgjjFf36CFKqSlak=
X-Received: by 2002:a17:907:940c:b0:a8a:6db7:665d with SMTP id a640c23a62f3a-a991cf73a24mr874540066b.17.1728211682448;
        Sun, 06 Oct 2024 03:48:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuNqsQyqhu6rTt71C7RDeAUHUoPwl4Vv39b6kqvUWQQv70XcqgELk6ZtsyqDgZgfAmWmdkOA==
X-Received: by 2002:a17:907:940c:b0:a8a:6db7:665d with SMTP id a640c23a62f3a-a991cf73a24mr874537766b.17.1728211681959;
        Sun, 06 Oct 2024 03:48:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99415b7c1fsm154034666b.151.2024.10.06.03.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 03:48:01 -0700 (PDT)
Message-ID: <b996038b-31a3-4f07-be70-8b5b2bbf689c@redhat.com>
Date: Sun, 6 Oct 2024 12:48:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: dell-ddv: Fix typo in documentation
To: Anaswara T Rajan <anaswaratrajan@gmail.com>, W_Armin@gmx.de
Cc: corbet@lwn.net, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241005070056.16326-1-anaswaratrajan@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241005070056.16326-1-anaswaratrajan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5-Oct-24 9:00 AM, Anaswara T Rajan wrote:
> Fix typo in word 'diagnostics' in documentation.
> 
> Signed-off-by: Anaswara T Rajan <anaswaratrajan@gmail.com>

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in the pdx86 review-hans branch once I've
pushed my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
> Changes in v2:
>   - Make the commit title and description more clearer.
> 
> Changes in v3:
>   - Add missing full stop to commit description.
> 
>  Documentation/wmi/devices/dell-wmi-ddv.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/wmi/devices/dell-wmi-ddv.rst b/Documentation/wmi/devices/dell-wmi-ddv.rst
> index 2fcdfcf03327..e0c20af30948 100644
> --- a/Documentation/wmi/devices/dell-wmi-ddv.rst
> +++ b/Documentation/wmi/devices/dell-wmi-ddv.rst
> @@ -8,7 +8,7 @@ Introduction
>  ============
>  
>  Many Dell notebooks made after ~2020 support a WMI-based interface for
> -retrieving various system data like battery temperature, ePPID, diagostic data
> +retrieving various system data like battery temperature, ePPID, diagnostic data
>  and fan/thermal sensor data.
>  
>  This interface is likely used by the `Dell Data Vault` software on Windows,
> @@ -277,7 +277,7 @@ Reverse-Engineering the DDV WMI interface
>  4. Try to deduce the meaning of a certain WMI method by comparing the control
>     flow with other ACPI methods (_BIX or _BIF for battery related methods
>     for example).
> -5. Use the built-in UEFI diagostics to view sensor types/values for fan/thermal
> +5. Use the built-in UEFI diagnostics to view sensor types/values for fan/thermal
>     related methods (sometimes overwriting static ACPI data fields can be used
>     to test different sensor type values, since on some machines this data is
>     not reinitialized upon a warm reset).

