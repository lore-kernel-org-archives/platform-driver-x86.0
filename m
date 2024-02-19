Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540D033082
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708347238; cv=none; b=h+UKKXtZovenU4FpEEmNj6xchhgM9Nw6QPrUGDbD+IeeQyt3AP54k/Oy9n/CGsZ0xkDmk6PdXWCzJMuVi/74/T0vFBcGJSnl5/TwZNG9gLp975BgasOsJPYQRBnP9S+FED4QGEP98IwqFqw5/MvgQEuUyzo0g0DwOYiaU0XG97o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708347238; c=relaxed/simple;
	bh=IK1YKFqRtuE2mfhT11q3by4/x/k8+IGPRp2aD/FhCgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxzPFr5f1l1I1ETRNaC1JS6XRBS0hkF1ZIjKLtBQyI4S/JgWnB/QywrkYEGzLX+D2deZ1rRFWer7X2Wtw30ENf3KF4Z8MCat+K9oyEFKmkCVistMS6S3fh+DRtTV3xRg9L0tHYQC5qHn7p7cyLYM1I8GJ0xTDqz0vCdI4rDTuA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PFlWhYI4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PFlWhYI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708347236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vxVcIu/CK/dg3IHMZc7LXuNc9WC2XIQzpqqYwfsfx8=;
	b=PFlWhYI4j7wSeLPvG8RFq6ppE8wi6n+PXgJjbOZ6jOWLT6DRgWafdGf7R/WHdDRqCFqSsv
	RFX2T0S/epaSmd6ko9Gs02ND93zTRqxv381A+FMiOsbvm8BmlnIBJtlNyLCObsqh4hH9Vw
	uUBNQG86LlmIJDQAYFQKnTl+Vkms+I4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-L0BWTN5uP0-sbfaM0MqnTg-1; Mon, 19 Feb 2024 07:53:54 -0500
X-MC-Unique: L0BWTN5uP0-sbfaM0MqnTg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-563a2279f1bso4812752a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 04:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708347233; x=1708952033;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vxVcIu/CK/dg3IHMZc7LXuNc9WC2XIQzpqqYwfsfx8=;
        b=DxkiYlCFs6rvMiutsA20pW5zXJaQ+SswpDbZACMBadkEU3ZBkrKP/gsryOyKMyDnmw
         O/aUgImiMNM13CpESnsMBWJDpI3ifddDhinrL6Ub2zTi03UxPG1OFxiEudSZQ5xTKbEd
         hakh68p5tqR6Y1BlsCQGk3N5KEtBmVwKFMgIXrWx9XQZA4/p30QmHwxe86vu58I3t9AA
         Od/yH9mWEa4O/Cez4jbAJNvm0+F7Uab3o1IjfGMbIHleeDGH7+k2hrgaOiqBHfVhygs5
         WmB+ViyOqei9nnf4b5+9zjQkpKbOGnBfacKAD5fvcd7c9UIWjMKeJDxsc3e7kphM6s1M
         ohdw==
X-Gm-Message-State: AOJu0YygcllfZDJ904jQfUMBEoG/ifHZfCIbDwEgknJg9MM7FCY4rWum
	CvoCbF+vBM7fotcAWlXfSDr5/S1ywQ/cuYNZuPa0IAXT8qKbiK1D568eBTqHTcQ+37NcyjPfHC5
	FF0l6KONHb+hGvyWjXeVAQNAM0fxqksZZcEmIdO/U61YtfCfc8vbPrCmTAA4tssKvAuoWe5wwdH
	6Y2yM=
X-Received: by 2002:a05:6402:1a46:b0:564:92b7:a4d4 with SMTP id bf6-20020a0564021a4600b0056492b7a4d4mr1281213edb.17.1708347233367;
        Mon, 19 Feb 2024 04:53:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMCWEchpILPieM+V7qDP5z9R37Y1k4EvHo6owovwE4rpOgNuLvjIiKuFVq6mTdY7bU4TvW7Q==
X-Received: by 2002:a05:6402:1a46:b0:564:92b7:a4d4 with SMTP id bf6-20020a0564021a4600b0056492b7a4d4mr1281207edb.17.1708347233080;
        Mon, 19 Feb 2024 04:53:53 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id eg43-20020a05640228ab00b0056454c668f9sm1563584edb.53.2024.02.19.04.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 04:53:52 -0800 (PST)
Message-ID: <d4384718-b264-4545-ae3d-5113b3092bd3@redhat.com>
Date: Mon, 19 Feb 2024 13:53:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] platform/x86: x86-android-tablets: 2 regression fixes
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240216201721.239791-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240216201721.239791-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/16/24 21:17, Hans de Goede wrote:
> Hi All,
> 
> This series fixes 2 recent regressions in the x86-android-tablets code
> 
> Patch 1: Fixes the Goodix touchscreen in the Lenovo YogaBook1 X90
>          no longer working in 6.7 and 6.8
> Patch 2: Is a prep patch for manual serdev instantation failing on 6.8
> Patch 3: Fixes manual serdev instantation failing on 6.8
> Patch 4: Is just a rename of a single variable
> 
> Patches 1 - 3 are actual regression fixes and patch 4 although not
> technically a bugfix is trivial. So to keep things simple I plan
> to merge this entire series through the fixes branch.

I've added these to my review-hans (soon to be fixes) branch now.

Regards,

Hans




> Hans de Goede (4):
>   platform/x86: x86-android-tablets: Fix keyboard touchscreen on Lenovo
>     Yogabook1 X90
>   platform/x86: Add new get_serdev_controller() helper
>   platform/x86: x86-android-tablets: Fix serdev instantiation no longer
>     working
>   platform/x86: x86-android-tablets: Fix acer_b1_750_goodix_gpios name
> 
>  drivers/platform/x86/serdev_helpers.h         | 77 +++++++++++++++++++
>  .../platform/x86/x86-android-tablets/core.c   | 38 +++------
>  .../platform/x86/x86-android-tablets/lenovo.c |  1 +
>  .../platform/x86/x86-android-tablets/other.c  |  4 +-
>  .../x86-android-tablets/x86-android-tablets.h |  1 +
>  5 files changed, 93 insertions(+), 28 deletions(-)
>  create mode 100644 drivers/platform/x86/serdev_helpers.h
> 

