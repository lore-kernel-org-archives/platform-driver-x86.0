Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B6613957E
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228549; cv=none; b=vGIv1en0HQxytmMbKhIb3eOy/Lrf0rH4AyYBV8CZSwYAAn0WPniVXqK4g2eaPIHwotSMtlwvaH0gR7ftsOGYjDSShgjraGxG8UdM2TPygKCnHzCcv8El68Cm+CiCjbfBoJ+r4uh7RHxjwnLtqMJcYYD6IKCQeSleWVOzKYcUVRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228549; c=relaxed/simple;
	bh=1qAwwfNf4MnwCqHDzql7SkOV4rq42uupjeLt+HGb+dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUT1lSdIx+g9T8foy4MDY0pi2RS2dWhiFrcAsWUp+Vvq6GhLk95plHARk6lWMzHGoUAoV/7qpvZbDfUCn1JXf/CGGcJzMfZyH4zU0yI8sVng5ZFxebhK55cK+EkczbblnyOl4pHhvuQXKfqrjMK2A6UY5b2FlI0RkzjKbFBgs1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QB1eWrO4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QB1eWrO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719228546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VuWSdEk3j+b8KhLAZNkf4+BDUGxUYnMohmbFl55GlhM=;
	b=QB1eWrO4c/C0SEeagTt6v3jjUizR2lUbK1Kl5e+YJUpCuG/Lp53xcGKFJJGtRRuM7HyVNF
	YdVpTVre+feg+np+62kPouVxYl6DDVC6YaBx2vn3zMkUQUcE1EVqXg1RsZDf5OJNQvKVFp
	tihpOc97XQWF+UzdESWHaOx5piJsdQ0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-xf9XpP8NML-ed7wz9gX16w-1; Mon, 24 Jun 2024 07:29:05 -0400
X-MC-Unique: xf9XpP8NML-ed7wz9gX16w-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-57d3eca4c01so1051176a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 04:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228544; x=1719833344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuWSdEk3j+b8KhLAZNkf4+BDUGxUYnMohmbFl55GlhM=;
        b=npnbx0G3x2yLplRAnBaZdnyOWlJiu3+V+k+kL40YYUJnewZfsmd5/Uzh+PadvIMPk9
         6fdeShyEdYohSMujZRBYyEwvF9bsl2SU6zxQ8dsTIUQL7xS/WXDN/xDi7GbkmF4zYPEo
         cE2g7fdUffdV3lO1apg9TiJKLajjToeH+QpWkAMFxU8Rf320+0hporw5rDEOzDa8t/fH
         S8nPw1/1OUoh6WF3EMRA2dncjsQqCMrB24qJ3KIwYW3MLf0Oa1n9bjXRaC95V26ehNlf
         lpjRYeR6eeJzJxskrzjel6y3NNbW3p3TwuGuADiYGBlhZ+MT98PtVkKNz5Z1KT8+6XjL
         nojg==
X-Forwarded-Encrypted: i=1; AJvYcCUc1zYKIKV/8ibl8cDmtGotzCMLx4X3kePBCjsdoV8VauAsORwK651FDamDW70FdgBj+OtVnNI5YUrnrDpt1ADt2C4yZSAeK4r59bcI7WbN3XSqhw==
X-Gm-Message-State: AOJu0YxZhXqzwwww4ZJ2aK7b3qjnm1MuP696pjjdSq4nGRAwKbx6g26M
	/itdAWTbRUrU0AeLXC8mM5wnOAES2tIShOOf6WjY1uJ9mD0NN0vtLm3c0BGlWZPF3BtYUYD/vnU
	XJ5O44yBR7jnkYU7EL9AusoLNFyGrYNS9Drum7K3sx3IhmUX4jWDgXzjQfNGjHJNe250GVuI=
X-Received: by 2002:a50:a41b:0:b0:57d:17c3:a593 with SMTP id 4fb4d7f45d1cf-57d49dc1e73mr2687907a12.22.1719228544438;
        Mon, 24 Jun 2024 04:29:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/M9Q8OVoPb4oK46X+w0uQZLqriXcp9PtZcJDwxzPyLqCFia5SxA4gWcpD9ypWDrEgfW6z8Q==
X-Received: by 2002:a50:a41b:0:b0:57d:17c3:a593 with SMTP id 4fb4d7f45d1cf-57d49dc1e73mr2687897a12.22.1719228544052;
        Mon, 24 Jun 2024 04:29:04 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3040ea36sm4585206a12.21.2024.06.24.04.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:29:03 -0700 (PDT)
Message-ID: <22147391-0084-4504-a899-4a529dab1af3@redhat.com>
Date: Mon, 24 Jun 2024 13:29:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] platform/x86: lg-laptop: Support 2024 models
To: Armin Wolf <W_Armin@gmx.de>, matan@svgalib.org, agathe@boutmy.com
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240606233540.9774-1-W_Armin@gmx.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240606233540.9774-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/7/24 1:35 AM, Armin Wolf wrote:
> A user complained that the lg-laptop driver does not work on 2024
> models like the LG Gram 16Z90S-G.AD7BF. The underlying reason turned
> out to be that the ACPI methods used by this driver where not mapped
> under \XINI, but instead under \_SB.XINI. Those ACPI methods are
> associated with the LGEX0820 ACPI device, which was not used by this
> driver until now.
> 
> The first three patches move the airplane mode hotkey handling out
> of lg-laptop and into the wireless-hotkey driver. This necessary
> because the airplane mode hotkey is handled by a different ACPI
> device (LGEX0815).
> 
> The last patch finally fixes the underlying issue and uses the
> LGEX0820 ACPI device to find theWMAB/WMBB ACPI methods.
> 
> The modified drivers where tested by the user which created the
> bug report and appear to work without issues.
> 
> Armin Wolf (4):
>   platform/x86: wireless-hotkey: Add support for LG Airplane Button
>   platform/x86: lg-laptop: Remove LGEX0815 hotkey handling
>   platform/x86: lg-laptop: Change ACPI device id
>   platform/x86: lg-laptop: Use ACPI device handle when evaluating
>     WMAB/WMBB

Thank you for your patch-series, I've applied this series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans

