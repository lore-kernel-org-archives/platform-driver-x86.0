Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D591B0F0A
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730715226; cv=none; b=COvhr47LwnusIZv9qnV1T0zgGwTsh5/dMWQsMV8nqZ9cBsELnKAViJfY9wJfxhdyaBl70zHB8oRMtHhjZ7SnmYCfjS0+75x9HVeU+9b6kjbb4P0oSHBlEEe/PlQvDCwDVKQMARAlWVAbTiHhHhFWGYtfDy09iSVFmzrUnLjHMfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730715226; c=relaxed/simple;
	bh=PTgox4e9FSSerGJRrnB4bOuIWsvK3BVoF5lju/xszuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHuvMSHxwjm13jjtJMZJAcyvDpYvt72VVEadPoaapfHpykVMwDLvgYjPZTj/Yn0fpAUhfGwHUTQn+0ZN8mUmytXaXC2MGN6AEUiJ9QDPpPsOtsKcCe2NyWuBojx6YTZTgoEBHbmZviVjqxUqHTff0A06RJpvq+ovlGvdAt2vQnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fOplvmPG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fOplvmPG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730715223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yGJ0ZAsOD6ODggfUDM3kNDHwIHDU79YqayeKJjeKiv8=;
	b=fOplvmPGV95mPPi6dw497HuEVyrgzHT1ZGG07Eiqj0l9wLWKCIvkaMSTk5xZaiNnyzcw24
	DGp3PJzmo/CQGpfQJV7RMPmXLz17qrmsAKsWNmqQJqP6CIIc7wfqRl/jdi0uGtlSOY2E48
	MCgBaB4xWEv1B/ZYDNbTozYY1HKw3Ig=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-KL6tsSRRMweqHnBam220pQ-1; Mon, 04 Nov 2024 05:13:39 -0500
X-MC-Unique: KL6tsSRRMweqHnBam220pQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9a0c259715so338651466b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Nov 2024 02:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730715218; x=1731320018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGJ0ZAsOD6ODggfUDM3kNDHwIHDU79YqayeKJjeKiv8=;
        b=epKnd+KoNysOz2QCIzJD8T9qGnh+z2XtS10H180vZXToTqv0wV8m+nK+P/PuewH6Rb
         n3LxiYwScQpqT2tDQTrLxUqpb5t0xAXwCD1eGhmAC7RepxsK1NQ1sM6LRzENPxE6A010
         bdHjCikdQmdEXxdCVfDlJ4QKKFpKIUpikWzi/ls/PgT1z3abScpi++BT/Y7LgVptlb68
         SWnoGyqEDb8rGl4IU8XGEtHkHk/T2Xw4b2NiFKa+6hyMKPCx8ihNjf6WJLQS3n2uPp/a
         ywHUdl31cQbm35Hhk1IxCo4l/IIlz7zUyN647af6lERdCFq6jx6vs75jv5iiGNYBUVLl
         Y/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXU9xHFSzv+DyKoEz26FJTUSsMDpGkY0Ag0S4bz0294s4cV4aIsnx2n3oicN/YjO6dCjjsb9jOjlJ9s/V+M/fiw6Ye5@vger.kernel.org
X-Gm-Message-State: AOJu0YzLf31S+wK/aTr1A3mHd4DiIRWfbPB6jU9R/eXQ72SRh60vAXZD
	XWYepHUWRvAUF4nvbSrGs8PpI5+IQ+rR0FoY7hTCC4n15O5mg38fdQhqW1xLeFK8HhsPp8++VsY
	+KR7mbqb20IScsR+WeC0JNxh4DpLptpa4JQzaI9g3sP+8uKphwGK9gsFzO80Ze45KHswDyT4=
X-Received: by 2002:a17:907:6e94:b0:a9a:67aa:31f5 with SMTP id a640c23a62f3a-a9e508aaa56mr1498409666b.10.1730715218346;
        Mon, 04 Nov 2024 02:13:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOmlFQ0C8DWcquNm6+JN7DJdW4bYk/a7WmMMRlzVpP2U9cmDUiA6/Y87bCbHqpOWtgvnyTMg==
X-Received: by 2002:a17:907:6e94:b0:a9a:67aa:31f5 with SMTP id a640c23a62f3a-a9e508aaa56mr1498406466b.10.1730715217668;
        Mon, 04 Nov 2024 02:13:37 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c574asm536889466b.60.2024.11.04.02.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 02:13:37 -0800 (PST)
Message-ID: <4dc23457-e70a-4dfa-880b-ca1c3f6c362b@redhat.com>
Date: Mon, 4 Nov 2024 11:13:34 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dell-smbios-base: Extends support to Alienware
 products
To: Kurt Borja <kuurtb@gmail.com>
Cc: Dell.Client.Kernel@dell.com, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, pali@kernel.org,
 platform-driver-x86@vger.kernel.org, w_armin@gmx.de
References: <20241031154023.6149-2-kuurtb@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241031154023.6149-2-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 31-Oct-24 4:40 PM, Kurt Borja wrote:
> Fixes the following error:
> 
> dell_smbios: Unable to run on non-Dell system
> 
> Which is triggered after dell-wmi driver fails to initialize on
> Alienware systems, as it depends on dell-smbios.
> 
> This effectively extends dell-wmi, dell-smbios and dcdbas support to
> Alienware devices, that might share some features of the SMBIOS intereface
> calling interface with other Dell products.
> 
> Tested on an Alienware X15 R1.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>

Thank you for your patches, I've applied both patches to
my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note they will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include these patches in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans

>
> ---
> v2:
>  - Commit message reflects Alienware devices may not necessarily support
>    the SMBIOS interface
>  - Commit message now has "Tested on"
> ---
>  drivers/platform/x86/dell/dell-smbios-base.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
> index 73e41eb69..01c72b91a 100644
> --- a/drivers/platform/x86/dell/dell-smbios-base.c
> +++ b/drivers/platform/x86/dell/dell-smbios-base.c
> @@ -576,6 +576,7 @@ static int __init dell_smbios_init(void)
>  	int ret, wmi, smm;
>  
>  	if (!dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System", NULL) &&
> +	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Alienware", NULL) &&
>  	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com", NULL)) {
>  		pr_err("Unable to run on non-Dell system\n");
>  		return -ENODEV;

