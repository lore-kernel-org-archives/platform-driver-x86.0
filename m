Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03E1DDC15
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 May 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482847; cv=none; b=FubRYa7ydzBKVRX4YYtXSkvsYPZoVtx5E0PYbI/jYHRO3esWGooNs0PZeTuSFdQG4/gKDJLVen2roeg2UmS2F6clO0XkpbTLc6FX2sOVDsvf0lZ60M45Rd9lGNV8yUcHIv8AtK/CRrmhY5/jXe89eaYX9vRqCSYmk3P+8Q4Aumg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482847; c=relaxed/simple;
	bh=mrtNgm9PmjqVjS9gD1LIlO+5NHzBFPAP29XyjDoDya8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRDsCQOHcwQdWFweKO1+cU9KRrGcKZ+T1ZukMNGrpQ7ATnAa2kIolRrDxJRNVnsSHy7pmHGPuOoXQqHNYqhwh50m7I8+KERw7dX+rGY2rwDEYzfnug1oTXdwdAFrl9pduYPxwju3nef+8UhPeAxf2gHhNdQ94OV1MshQGQBY1IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UBu1A0mc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UBu1A0mc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hh6Lu25XTdmvKagiXZzKLzic81mSh2IPF/qRIoPuAu4=;
	b=UBu1A0mcXTrLx43RnGwps/8+O1pHGq+OJJ3OF/ESA1Qop2grZbmIG9TmCLsx6f/WmIJlsO
	29H9B4Ux27QZQ4Vo9pk+jGnsQirDO6ESKqL6tsDGJRuaxd6z1xNpsMTgjOj+i4x6OocrL2
	KyfZgO7Mma5GvRELBEiWT6UgSS6WsHg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-nQ-uAr4HObq5R_tdOpJ8ug-1; Sat, 17 May 2025 07:54:03 -0400
X-MC-Unique: nQ-uAr4HObq5R_tdOpJ8ug-1
X-Mimecast-MFC-AGG-ID: nQ-uAr4HObq5R_tdOpJ8ug_1747482842
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-445135eb689so383255e9.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 May 2025 04:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747482842; x=1748087642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hh6Lu25XTdmvKagiXZzKLzic81mSh2IPF/qRIoPuAu4=;
        b=jRwtM/8Y8AQjZefqdOjmhl20Z9nzNcm8cDFNFD1GTd4gXT0bQPwwEa9NVtvKFkU4Cm
         BFKkW5wkZJSQe2fbLQmsUWz3+wOzk+mCRtImUd0SV80KiThaadArsEmqt67ajIzAkf3e
         6BKsjOUYTrcem6h4RzunloDKW4+jGJ7esxBUq1Erp6lBKnsp93Z+53bRD/3nGvgQxMei
         IQ6c113LRJfr+ADL9Gux3nVUUXITX82glFK6kET3d9R4t1ueW0L75Br8Fbla3R2ezEJn
         WLwQD8GNVPGhWlhHpSmeC/fjYOsbZFoh6lqZtEWXuos3zvJjYvLPZQaN91wVy9M8gTWO
         U0vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQWuK6nF7i9q3pTVJWPu9MKewkk/03CM49jsvP5hxhpiVuS4JKW0hmqAd03aYI5akQ70kXvshugu9bIoNvZqgyiF8d@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6IrpGRJn4WaHBKskAcAP1SMIxDA29w0y2bgs15+pigbUzabc4
	QCi/t6rR4kzFVyY6lHIwyGqswBc8DTz4GpYNt+w/YcGKSd56z06i0UxWZGsXCnvJfCqbESgR0rg
	QOmu4GKKAN+0LbwVGALmcjhfZQJMQJdPnlCNxrQVPNXEc/rwRjIACkKKkmmtkG914VHdhv4Tbrp
	8=
X-Gm-Gg: ASbGnctfw+6lKJOJm7R0b+0YOzVpzQkrDmLab5o45Wyq/mZ9V7ZTZVxyf+OopFCzDU5
	boPupgvl+Muq9Z9V0l+ujapVA+cL30sj7+mihMjnP63Lk/g5WuMV2XFvCkP36QUZyUHQAWmJhER
	CUDJ2eiz+qdsRSVf3s9oT0ZN24KoRL3FckVOahsXlt5KfNiEpH0rGNxRjKoMqvX3xzaOdB/PDVc
	6IVMf9Rw0sMdPk1tJmv+KkOWHyKtTziM5qZfbyK/kKYdRTaWOorZfe1lfpcOKQs2juzjttysd4C
	FBrxHmqID+usQw==
X-Received: by 2002:a05:600c:c0da:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-442fe667ec9mr54443915e9.29.1747482842522;
        Sat, 17 May 2025 04:54:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgm8sGwtCHVVoQNRjXJMOaCVwqM6s/IUkO878URW/AoE2AM+RHZfTnFxdEzmwOe/59yA7gpw==
X-Received: by 2002:a05:600c:c0da:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-442fe667ec9mr54443825e9.29.1747482842146;
        Sat, 17 May 2025 04:54:02 -0700 (PDT)
Received: from [10.124.0.73] ([89.207.171.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd59704esm68179285e9.36.2025.05.17.04.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 04:54:01 -0700 (PDT)
Message-ID: <18b8f82f-f5ea-436c-b7c8-d4182435ef05@redhat.com>
Date: Sat, 17 May 2025 13:53:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Ignore battery threshold
 change event notification
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Derek Barbosa <debarbos@redhat.com>
References: <mpearson-lenovo@squebb.ca>
 <20250517023348.2962591-1-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250517023348.2962591-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-May-25 04:33, Mark Pearson wrote:
> If user modifies the battery charge threshold an ACPI event is generated.
> Confirmed with Lenovo FW team this is only generated on user event. As no
> action is needed, ignore the event and prevent spurious kernel logs.
> 
> Reported-by: Derek Barbosa <debarbos@redhat.com>
> Closes: https://lore.kernel.org/platform-driver-x86/7e9a1c47-5d9c-4978-af20-3949d53fb5dc@app.fastmail.com/T/#m5f5b9ae31d3fbf30d7d9a9d76c15fb3502dfd903
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 92b21e49faf6..657625dd60a0 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -231,6 +231,7 @@ enum tpacpi_hkey_event_t {
>  	/* Thermal events */
>  	TP_HKEY_EV_ALARM_BAT_HOT	= 0x6011, /* battery too hot */
>  	TP_HKEY_EV_ALARM_BAT_XHOT	= 0x6012, /* battery critically hot */
> +	TP_HKEY_EV_ALARM_BAT_LIM_CHANGE	= 0x6013, /* battery charge limit changed*/
>  	TP_HKEY_EV_ALARM_SENSOR_HOT	= 0x6021, /* sensor too hot */
>  	TP_HKEY_EV_ALARM_SENSOR_XHOT	= 0x6022, /* sensor critically hot */
>  	TP_HKEY_EV_THM_TABLE_CHANGED	= 0x6030, /* windows; thermal table changed */
> @@ -3777,6 +3778,10 @@ static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
>  		pr_alert("THERMAL EMERGENCY: battery is extremely hot!\n");
>  		/* recommended action: immediate sleep/hibernate */
>  		break;
> +	case TP_HKEY_EV_ALARM_BAT_LIM_CHANGE:
> +		pr_debug("Battery Info: battery charge threshold changed\n");
> +		/* User changed charging threshold. No action needed */
> +		return true;
>  	case TP_HKEY_EV_ALARM_SENSOR_HOT:
>  		pr_crit("THERMAL ALARM: a sensor reports something is too hot!\n");
>  		/* recommended action: warn user through gui, that */

