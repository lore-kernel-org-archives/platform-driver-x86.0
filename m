Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61B4A1C
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715612422; cv=none; b=aQJCqimn2OxzOIzjdYIYA4mpUitrm0i5tqihARje0v9W7oMbLv45jSJ5lEFHFwES1XjINq20nCXZIft5OYnQDshD1z0FIJrtBsuzZIQbzR6m0uh8X46eT/I5zrRCZ5cpOF/4X0Uit6NQFhPXAl+HqGhcdLwZHfXgVUnsdl/YvUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715612422; c=relaxed/simple;
	bh=hz2xOqiswRv3JoX28eWR3jlVG+46jj3iSQP9eLEE2ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAO+cX928l7xFEcZN/ntlyNAF7vfS8RtvIybhEAcYvS4ceHl8JcL+HO3bZL+Bia1oEfBetW60feAYfkO0m7ENrKtHYPWeSYQJDf/DZFExpVeGI4wwuWrCa+SCmCOpcjaTVmS74oq+zPJZQli1/i3BSD0/IM6H3aal1L5vecDW8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vi52b7Ce; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vi52b7Ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715612420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUxX39RVZwD3eTQiuAS6U0pzbE30bIn2mgcuU5E7TnA=;
	b=Vi52b7CeducPbqXjfcokt3Nguyv8y6JQzfPdwhRZVR5VGWqwOIO26edy4qC0+o+rhiaEqd
	Pq4wS9LFdFzPGU046jAAtANkxkJr+GPfTbW29p/lboXYF1R+AGoInXSie7jN1DU/I+BPXS
	rutPTsAavsMJZUTQVJ8uQ3UFVdHY88g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-OiUrRGriOLi4lWpWuyZ6Dw-1; Mon, 13 May 2024 11:00:16 -0400
X-MC-Unique: OiUrRGriOLi4lWpWuyZ6Dw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a599b55056bso274178166b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 08:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715612415; x=1716217215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AUxX39RVZwD3eTQiuAS6U0pzbE30bIn2mgcuU5E7TnA=;
        b=wbRXStk3dc7mbipJqCDpfUHblghcs99vguYLJgysazfXJabJCsyjzEnk88mJhzD6qJ
         padwMvag2peqSVhu8J+3O3KxwYgm/TRHnYyqQKrV+AlCoXp0K3bhAkor5hPbNJ3nm+9I
         EqevvHSlG2BVaEjqwEFA7F8eWegXCG4HbmoDEdQ4y59sUFxEP2RNms2zLyU2ICmHrtTo
         BVGPOj5dbvXB9ra9I2GYjsx8hotlXKksYzy3jO8fPniEUYd6EgHq7l9San0kMAWu06GB
         OrgwhaRgeA0WJuZqIsPfcKF0294TwRBWwMrOFgAq+QkGapb+P4jxuUmAPjo/m6OBMViC
         giMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWLNxBwHqc300s1riq+u8pA4xvNXsdQ4+ILw5soFC5diSh1V7ye66pmlnUcGTobDW+8YDVfLSTQACzG9xzr0hShRhwkmsIqsuVw19SDWiJDqv3zQ==
X-Gm-Message-State: AOJu0YwePiiqrP6lscBULZQcJOBfzYbKY7MsQLhmugWU/nywb45NXGVG
	WVBlUvj1DIm4h6/WUQOxkQneCLN9Ad1+mHRQo8rLuKD19O1ReDWrduRXV1aw64vCl0wy6DBGxjo
	rIaKJ9zlZYfsccjkhpTXGFTiXD/ZLvknWu886ncRHI//q6mRStcSEQ1KKtHklqYyGrBFVMR4=
X-Received: by 2002:a17:906:eb16:b0:a59:9dc5:d655 with SMTP id a640c23a62f3a-a5a2d5c9f74mr675057866b.41.1715612415053;
        Mon, 13 May 2024 08:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUw8oNllfLYVSmk9sFtS5p4PD91pXPr3xj8lklFHHlOlCcMpYqVeSzLZVA4WKysD7JYE+G8g==
X-Received: by 2002:a17:906:eb16:b0:a59:9dc5:d655 with SMTP id a640c23a62f3a-a5a2d5c9f74mr675056166b.41.1715612414661;
        Mon, 13 May 2024 08:00:14 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a7a944664sm23008966b.37.2024.05.13.08.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 08:00:14 -0700 (PDT)
Message-ID: <3cac4bd6-33e3-4433-9bc3-d29eb2bbd86d@redhat.com>
Date: Mon, 13 May 2024 17:00:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] platform/x86: Add new Dell UART backlight driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>
Cc: Roman Bogoyev <roman@computercheck.com.au>,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org
References: <20240513144603.93874-1-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240513144603.93874-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/13/24 4:46 PM, Hans de Goede wrote:
> Hi All,
> 
> I recently learned that some Dell AIOs (1) use a backlight controller board
> connected to an UART. Canonical even submitted a driver for this in 2017:
> https://lkml.org/lkml/2017/10/26/78
> 
> This UART has a DELL0501 HID with CID set to PNP0501 so that the UART is
> still handled by 8250_pnp.c. Unfortunately there is no separate ACPI device
> with an UartSerialBusV2() resource to model the backlight-controller. An
> ACPI quirk has been merged recently to deal with this and create a serdev
> controller for the UART despite the missing UartSerialBusV2() resource:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=99b572e6136eab69a8c91d72cf8595b256e304b5
> 
> Patch 1 in this series adds a driver binding to the "dell-uart-backlight"
> device created by this quirk. This drivers creates a serdev-device for
> the DELL0501 serdev-controller and registers a serdev backlight driver
> which binds to this serdev-device.
> 
> Patch 2 contains a small emulator for the UART attached backlight
> controller found on this Dell AOIs, I wrote and used this to develop
> the driver since I did not have access to such an AOI myself.
> 
> This has been successfully tested by Roman Bogoyev (who originally
> reported the missing driver to me by email) on a Dell Inspiron 27 7000
> (7790) and by Kai-Heng Feng on a newer Dell AOI model.
> 
> Changes in v3:
> - Rework dell_uart_bl_receive() loop (based on suggestions from Ilpo)
> - Address some more review remarks from Andy
> 
> Changes in v2:
> - Address all the review-remarks Ilpo and Andy had on Patch 1/2,
>   thank you for the extensive review Ilpo and Andy


I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans




> Hans de Goede (2):
>   platform/x86: Add new Dell UART backlight driver
>   tools arch x86: Add dell-uart-backlight-emulator
> 
>  drivers/platform/x86/dell/Kconfig             |  15 +
>  drivers/platform/x86/dell/Makefile            |   1 +
>  .../platform/x86/dell/dell-uart-backlight.c   | 398 ++++++++++++++++++
>  .../dell-uart-backlight-emulator/.gitignore   |   1 +
>  .../x86/dell-uart-backlight-emulator/Makefile |  19 +
>  .../x86/dell-uart-backlight-emulator/README   |  46 ++
>  .../dell-uart-backlight-emulator.c            | 163 +++++++
>  7 files changed, 643 insertions(+)
>  create mode 100644 drivers/platform/x86/dell/dell-uart-backlight.c
>  create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/.gitignore
>  create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/Makefile
>  create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/README
>  create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/dell-uart-backlight-emulator.c
> 

