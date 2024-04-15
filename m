Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDC173189
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713189649; cv=none; b=lo66Y//GGSWTAHKHbQ/h789K8Rw09e8cgRtA6L5MiI66MxeRrzHdiSOvZDR9rhrkhntgI6LITMm2cvPSwdefE8QKb5ZfAszAHvubbGq/Bw05oCufqBnGjL7CUvNKnxSsLuAv+v87HlqmMPw1R9JN5rmKaMDwZPNNQNp+Tl713GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713189649; c=relaxed/simple;
	bh=J9D9ZD3YmRKCcJMDmEJSvLRxg/tmVPX+gYfnHtVwCXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKm5UJr8hRbQ/RRH4Ki7RvmKRnkpIdGV8Ag+U3hwOmlv2i2rMbnoxE94we5feFKOvZwFyqq2skbXIxZTDqymz3yQo7UWOnftvlmermm+flDw62UmWUJ6llJVPDPhq6yKlFMpjVTi9jRViONBb6q0ZPfgyosDDdWzom3JyJtw+aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SW+gY6sc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SW+gY6sc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713189643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdkam44xP0FK1vCUPQhTP7b9I57DO8DUeya0uaI3NJI=;
	b=SW+gY6sc8luTSGxZI9ByPug/3ZUMjXgegTTHtHWZlX8nqt+yi53rmpbJhyWE9DRSSiKIwO
	Ka2YqNcqUd0kKhR+KBq18qlpKjaIeCnESqfSnvWEVuoYF90yMmbA4oC91uiH6SCKOb07oI
	zT/jA3FDuT/+jKfrTT+ZfAk1d7wu7ko=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-3MWQuBi-OJudpCzB5edcRw-1; Mon, 15 Apr 2024 10:00:41 -0400
X-MC-Unique: 3MWQuBi-OJudpCzB5edcRw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a5193fab7e5so209223666b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 07:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713189640; x=1713794440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdkam44xP0FK1vCUPQhTP7b9I57DO8DUeya0uaI3NJI=;
        b=BGh1inkMXPHWjI5nuNv7jgngcHQ/l5NyiKpfTw2o3z5L/ZwjSqQEXdHs4UYH5tN8gU
         bmFL5uvC5/k+QucH3IbFqSLcMzq1aUHYQA+N4rgH/iZs9bBANfluwtI1Vg8kc6M24nsk
         Fu0LtusM+CSPCCDu0aiiou+ce89HkCoq61rZn6I7oqWXHNTertg7hlERoKG3o/1pj/Wh
         o6g7K9QMpVTP8h5IS3Mm9mM7eKz9KX2W0Nr3NSu6Vk14drTnlh/Q70gRMO1uOPqvdv7w
         qqtv2HZjFy95dY3mooQvzQ+mva2/Id4u9Riok7bRTvwucRpvddvD/k0EcCu0pudJ3l3i
         gwLw==
X-Gm-Message-State: AOJu0YynJ80wHxcx1a1tYDeTIvydPEyGvkMKnQB03dLV5mZXPiIRH7LY
	KN83Ylt0rJ2QAO5Z9Wio/5KuTvrm7hNeTLUFZKv+0eZamp3gw9hZTcLoO24OfmSuDVg6AVzM3DZ
	veZNogV3uGp6AgHp6eh0dcjJ/P25/uRiivwG1GueX8kxgz/BUv3ynvrZZRWjw9EDo1mgEsP4=
X-Received: by 2002:a17:906:f81a:b0:a52:1c17:bf63 with SMTP id kh26-20020a170906f81a00b00a521c17bf63mr5532483ejb.44.1713189640448;
        Mon, 15 Apr 2024 07:00:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkfWE6Dzsaqy6/gZA1RRjhday6a/McV9W7w4lxuupVWdtUWtRfS9Pv3t/nmDpbp5d+HPAnkw==
X-Received: by 2002:a17:906:f81a:b0:a52:1c17:bf63 with SMTP id kh26-20020a170906f81a00b00a521c17bf63mr5532471ejb.44.1713189640010;
        Mon, 15 Apr 2024 07:00:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g17-20020a170906595100b00a521327b019sm5519285ejr.197.2024.04.15.07.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 07:00:39 -0700 (PDT)
Message-ID: <4170c053-85ca-40e4-91ca-bbaea8fb8e36@redhat.com>
Date: Mon, 15 Apr 2024 16:00:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: Don't allow HSMP=y and PMC to be
 enabled together
To: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20240410141025.410-1-mario.limonciello@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240410141025.410-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mario,

On 4/10/24 4:10 PM, Mario Limonciello wrote:
> If the HSMP driver is compiled into the kernel it can cause problems
> on systems that support PMC since it probes hardware it shouldn't.
> 
> Prevent users from compiling HSMP as built-in when PMC is enabled.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2414
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3285
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Your commit message says "Prevent users from compiling HSMP as
built-in when PMC is enabled."

But what you are doing is preventing building PMC at all when
HSMP is builtin. Not sure if that is actually what you want,
but if it is then the commit msg needs some work.

Also I'm wondering how this actually fixes anything. Users
can still enable both as a module and then load both modules
at the same time?

So wouldn't it be better for both drivers to somehow see
the other driver is bound and then exit from probe() early on?

Typically how this works is that there is a "struct device"
representing the hw-block and then only one device driver
can be bound at the same time.

IIRC the PMC is somewhat special and does not really have
a "struct device" automatically instantiated for it by
the kernel. But there could still be some shared common
code which instantiates a platform_device for the pmc and
then both drivers could become platform drivers and the user
can switch between the 2 even if both are builtin by unbinding
one platform-driver through sysfs and then binding the other
through sysfs.

Regards,

Hans




> ---
>  drivers/platform/x86/amd/pmc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
> index 883c0a95ac0c..d734f6698f97 100644
> --- a/drivers/platform/x86/amd/pmc/Kconfig
> +++ b/drivers/platform/x86/amd/pmc/Kconfig
> @@ -7,6 +7,7 @@ config AMD_PMC
>  	tristate "AMD SoC PMC driver"
>  	depends on ACPI && PCI && RTC_CLASS && AMD_NB
>  	depends on SUSPEND
> +	depends on (AMD_HSMP = n) || (AMD_HSMP = m)
>  	select SERIO
>  	help
>  	  The driver provides support for AMD Power Management Controller

