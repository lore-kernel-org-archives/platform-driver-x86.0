Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9B045BE3
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719229695; cv=none; b=sfU87vOTZ8mBeDCh16lk0G/SkmY4DlGCbc5u7Put+JZZFx1WDeBvaW7KWt21gGq9DCVWEvQKe8jKXl+ZiCRI6vzxiMDyfk0l9xrcy9ssbC7kM8MhPlSp1TUMRkshr1ikcjgc0cE/LJ67aec6N1lTsuJNUYK281Vt63ywiR5CYOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719229695; c=relaxed/simple;
	bh=xGsMt4ZMBJrDwABO0KnAkxwZA8PSWTKbV5FABWmD/aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCPlP/R7k/EWTJ9b/1RJ7QLWFHTWEh0WMnJCdgjApaSJWQMtDz8nh/XXnjsUw5ToopwhAOnJVTShNnqAyVt6MPRyYeXdAdnfOhs7xOIhm7UcDRi9gaLOPyw0o/CwpG3twMsw6fED5BgWw74XPzSTANKuZ7wEQ++lTU8/IsqHAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cu8C6kyo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cu8C6kyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719229692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EcV889m9n099FSa3hGP9VdafvCoKGrReBu+wZKTWFrk=;
	b=cu8C6kyotK+8d1uTkIV3m2cLq6prUPjm1qFFMcDJvrPybooqaBjkSKWxIHJq4Iy9d5i1YI
	FYVwDpMslebleGb4cQP+uc7bkZ9YpRh1YIk1hSlKsCOauI8BbW9h7Mkxvafl/YiPhhD+Kz
	aU6EK2WJDdKOiMTQl/YNJgNPFYak2B8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-8JEeVs4JMGeUWwJB6rp5cQ-1; Mon, 24 Jun 2024 07:48:10 -0400
X-MC-Unique: 8JEeVs4JMGeUWwJB6rp5cQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7135459efbso88257666b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 04:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719229690; x=1719834490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcV889m9n099FSa3hGP9VdafvCoKGrReBu+wZKTWFrk=;
        b=Hxvbs+S67xeGfjVFCziq5UrDytAbU1TqPV1o8CqCFA9O5AWZz8C6QdtOvxSu2eZq7z
         UxDtDn72PAMcWWv9fl6p0WXxhxTiFHsdM4NLgXkruM+QStTA5APsOXmrE2hjxsaZNZAT
         qBJcof081b6qaKR8tn6Jzub/+soiM17vNSyS2sKsb7Av7DmBacpg3A8SFyaDHDs6I1B4
         OkCGA7Ge1WxR6/UmroUKeSK4UQx2xmEY8gEsupx0KYTz/n9G796hAMCVQRDvw/zpU7f7
         kvbRFAxQ1MCNz+lkOsMlZD1oXBQodcqaUNumk0rZSyBlvL+sbub+s7jGU4pRPCQnszfh
         v7Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWLLt6SasMleEqm13w1GzzmS1XtpCYCVq1MOHXPxMp7Jf1z6EdHEGNnBxuAZjY0ghwy4xxqNyZHZ9XqeD2ClsB5seF4/ms8mWymswXwMu5ojho6rw==
X-Gm-Message-State: AOJu0Yx3LNUUgiwmqsEboWt9BFrTMA5DpvUIZr1ASi+bBJzhbm2Ba8Ka
	UrfSb2MQ+x5txbvU+RP5L7wZaJTP6CMMsVCmVEJ3RDJBCa9FV7QENNtvgMF4kdClYvWc/+6XTEb
	DC2ytRRDFB1SiUZiNPSTN21A7Cm1cNulk497fDj5uMaW/ZFU61a6Jdx5XfLaf/bCiVBtWRk4=
X-Received: by 2002:a17:906:a8d:b0:a6f:b940:10b with SMTP id a640c23a62f3a-a7245c824admr247625166b.62.1719229689809;
        Mon, 24 Jun 2024 04:48:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcCsPIHseM/1ERsjsN4BH9BeJrdjRCslHDdFQUF18nXEPnqFecu9/ZrknsYtKsmjg/BSm14g==
X-Received: by 2002:a17:906:a8d:b0:a6f:b940:10b with SMTP id a640c23a62f3a-a7245c824admr247624566b.62.1719229689456;
        Mon, 24 Jun 2024 04:48:09 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a725f74ee94sm33863466b.224.2024.06.24.04.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:48:09 -0700 (PDT)
Message-ID: <8a6e955e-1829-404a-a962-32dcbacd53cc@redhat.com>
Date: Mon, 24 Jun 2024 13:48:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: wmi: Add driver_override support
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: corbet@lwn.net, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240620194214.3071-1-W_Armin@gmx.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240620194214.3071-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/20/24 9:42 PM, Armin Wolf wrote:
> This patch series add support for using the driver_override sysfs
> attribute with WMI devices. The reason for this is that there will
> exist a couple of generic WMI drivers in the future for allowing
> driver developers to directly access the underlying WMI device.
> 
> Since those generic WMI drivers do not have an ID table, the
> driver_override mechanism is used to bind them to WMI devices.
> 
> Armin Wolf (2):
>   platform/x86: wmi: Add driver_override support
>   platform/x86: wmi: Add bus ABI documentation

Thanks, the series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

> 
>  Documentation/ABI/testing/sysfs-bus-wmi | 79 +++++++++++++++++++++++++
>  MAINTAINERS                             |  1 +
>  drivers/platform/x86/wmi.c              | 33 +++++++++++
>  include/linux/wmi.h                     |  4 ++
>  4 files changed, 117 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-wmi
> 
> --
> 2.39.2
> 

