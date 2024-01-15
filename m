Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3305168A4
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jan 2024 12:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NSM1Idq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705322535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYxTexZb/b4VhKV54bhicmPtKfPVnyXUOwSEKx57b+o=;
	b=NSM1Idq7/TaporMBQUzoG5mOYRBZL8kFxVivkqC/CRrw0rGuLiPEvWK27wVvBy581m5frs
	xwZmQCZzYloI+CSvUUSoGsY2xojCWmkY1EaUGTWeRu51XEfViRbys1R+t/sB6uFzodzxLU
	wXI0/J7fTT+NPfloQthSRg+absrh84I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-Hg2o65oWMLKlIyKyOkgPgQ-1; Mon, 15 Jan 2024 07:42:14 -0500
X-MC-Unique: Hg2o65oWMLKlIyKyOkgPgQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-557c1386095so4258469a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jan 2024 04:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705322533; x=1705927333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYxTexZb/b4VhKV54bhicmPtKfPVnyXUOwSEKx57b+o=;
        b=MqA/HRN7RPKICfZkbhh1W2b09hAyofUrGfk1PmtV+877E+Z+dsjGetRSMV5ULcvx0L
         3ZfrBbinzgcR+UGT++QxjJiepBpARKHdXJiLBCqzcc1PipbiRTxKuDY6XmtmntVNIlTE
         lT5ZgOQHoOXvClGZ/TwXQGPvIlmCd5bp3wIXHGuZl2OtePDYBrWhBFRn3z5lLBA5Sjza
         hc3WV7ACpSDqp11FBtvN8aQ8tIDAFGyvmXdov0Ps0aCRsE6Sjkp+YNUbZdIy1tyjLwCC
         9iKAs2jHTc2QEKmu8VvIg8mQswd2JxoOydYQmyvUjnz8d8a49sGOxCuNfEWtrUUyHowz
         baXQ==
X-Gm-Message-State: AOJu0Yy/bKef3xdvagRZjMl5BJL/RDfms+589VSoQ7AbidSxUkdqmVdj
	eZrtIfBEqOVj/5+lCxn0MVPq1K2DXie0kFJP5+4az4vRdbnm438fkeF9wTlQ3UwmvpHy0DwY3cq
	QzhMcxuethazb7kuN1qYuTEI8Xo7hUV2YTzfK4eCexA==
X-Received: by 2002:aa7:d80d:0:b0:559:565a:8fb0 with SMTP id v13-20020aa7d80d000000b00559565a8fb0mr486197edq.84.1705322533166;
        Mon, 15 Jan 2024 04:42:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQZX3YjMu233EuP5bhsafgOALGg/F4XBP7uz+F1vIjatCArkxpKBGpQrnYMxtjRzzBSSlJCw==
X-Received: by 2002:aa7:d80d:0:b0:559:565a:8fb0 with SMTP id v13-20020aa7d80d000000b00559565a8fb0mr486187edq.84.1705322532819;
        Mon, 15 Jan 2024 04:42:12 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id n7-20020a056402434700b0055915dc8e74sm2574816edc.81.2024.01.15.04.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 04:42:12 -0800 (PST)
Message-ID: <3beebe36-9080-4e60-a5f7-f8bea9f7dd29@redhat.com>
Date: Mon, 15 Jan 2024 13:42:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: silicom-platform: Add missing
 "Description:" for power_cycle sysfs attr
Content-Language: en-US
To: Henry Shi <henryshi2018@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240108140655.547261-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240108140655.547261-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/8/24 15:06, Hans de Goede wrote:
> The Documentation/ABI/testing/sysfs-platform-silicom entry
> for the power_cycle sysfs attr is missing the "Description:" keyword,
> add this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be fixes) branch now.

Regards,

Hans


> ---
>  Documentation/ABI/testing/sysfs-platform-silicom | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-silicom b/Documentation/ABI/testing/sysfs-platform-silicom
> index 2288b3665d16..4d1cc5bdbcc5 100644
> --- a/Documentation/ABI/testing/sysfs-platform-silicom
> +++ b/Documentation/ABI/testing/sysfs-platform-silicom
> @@ -10,6 +10,7 @@ What:		/sys/devices/platform/silicom-platform/power_cycle
>  Date:		November 2023
>  KernelVersion:	6.7
>  Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
>  		This file allow user to power cycle the platform.
>  		Default value is 0; when set to 1, it powers down
>  		the platform, waits 5 seconds, then powers on the

