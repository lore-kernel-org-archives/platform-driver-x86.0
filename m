Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36190746E
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 May 2024 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996544; cv=none; b=eGuof/4DvHk0PpHftqAenrzMY1re6peXFStqkndygQAzQUrdcO6gdPl1mI79ln1FrjWyp4M7BVIqsi+UtTAUCatd5slTH7HVVeCZr2Z151H+saBx2CjTFnFluK47bpBDz1xzvUmFGawcx5m/1qHEyA6fzmA4DI3XkEuzrcpIdA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996544; c=relaxed/simple;
	bh=8TSpQpuVN6z+ZuZk68PMhyHU89nHlEi7bQ43I1w48bQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8Dmnd9Ceri4yE2gbWf+WeAlATtqCcmrGlg0fFPMBoFyUnUO1K4wRfZcyYDXjgnx5VO2j62NFNttZh+8uhvlL67e6qiGdm1c8JP3xY1RViOMuYY49GQWjnjyijC1ARb7B9V9fMKr1Ps08jTPwEeyRf9refJQFHDghA3Sb7aEPJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d560bNoH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d560bNoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716996542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFHpztQhwU5HG7lA94/ryMM368oC6ZMtci9dOyduPBc=;
	b=d560bNoHhvyGhyRkAMbL62elWnPbGw5OTgtprwHhX23FE1PFCqo1rmhKPGilo/4fIJtGTb
	5RCNjdqhODjcxXIUopT5g/ubc5aPhUIECLxzi66HQPYQ5eoAIZaeRTR8FVFuCcDyL1q7sn
	wOYS1ipyyytri7E7MQeyYao2kVinP8k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125--PMfWI3TNYW7eyz6lEo9lw-1; Wed, 29 May 2024 11:29:00 -0400
X-MC-Unique: -PMfWI3TNYW7eyz6lEo9lw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a62dfb30712so140263366b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 May 2024 08:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996539; x=1717601339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFHpztQhwU5HG7lA94/ryMM368oC6ZMtci9dOyduPBc=;
        b=pysCwA3TQPTF9N80rtiJQZDQ2gGjPDKOFEsuib8rz2mUGzAFtnjJ14lFRY63vMNIdk
         GWZ/kRiUbIhjbTwIhg+xZTZWVEob8VzunzkfptQHel/ngIz8K49EQmtXbKKLMISrq4d3
         tSzUh4gNK69FpWyOg+qspgLaXY+d4F8tSEHTMB2SmK4WVNPwIOAM1z0n768FuHgqnPaz
         4zX0Ifpo/8zodcm+fylqxu4z0x5+JHqmABmUWVLia/FN4A6Ur/3/feNIldC5C2lE+uQv
         0PZnUJVJJ3U8di/YPzkEi3n5gupkHVueyN4YamEfTrqFKQ3lRzm64fVrovote9eCL140
         MrzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNppw2ExqLNL1zTaaIBwtxGonVaJ+G3I3Cl0PvI20mLH//ZR2eygc1RL0lY+Jrum0svUJC8PFgRpAxBf3GmrEqCivXhD857l+IDsm8AT5lCggn+g==
X-Gm-Message-State: AOJu0YweJBDR0SW5gMrXgDuxYNTq1KLUyzV+ueKaMSCKGUKD3Fg9MQyA
	YauyT9s8nlOBi0V3M9OsmGUFLHnVRoNCFyk6iNY0B1wp0zIcCHnNvUdv2ZnKHxXroILBQnnCc4S
	+XS9fZ08rU0UMmlA4ukVTl3CuDJ3PKncbGfjbpPSFb7uOrXNk04zpK4izE+3CQh4O93iaxkw=
X-Received: by 2002:a17:906:6d95:b0:a59:bbd6:bb39 with SMTP id a640c23a62f3a-a6264f0ebfamr1092763366b.55.1716996539690;
        Wed, 29 May 2024 08:28:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHMNDZWVKqgo3ZdTUnkxjQybulw1cBwoyxNnQ5p2eVfu24cekgVLMgE/SKbIjgInYFIJtxtA==
X-Received: by 2002:a17:906:6d95:b0:a59:bbd6:bb39 with SMTP id a640c23a62f3a-a6264f0ebfamr1092760466b.55.1716996539217;
        Wed, 29 May 2024 08:28:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c8182edsm734297466b.9.2024.05.29.08.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 08:28:58 -0700 (PDT)
Message-ID: <b0d8eebc-5abb-4ec0-898c-af7eedc730d9@redhat.com>
Date: Wed, 29 May 2024 17:28:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] asus wmi and hid: use HID LED for brightness
To: "Luke D. Jones" <luke@ljones.dev>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20240529012827.146005-1-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240529012827.146005-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 5/29/24 3:28 AM, Luke D. Jones wrote:
> Changelog:
> - v1
>   - Split the patch in two
>   - Move function body to asus-wmi and export
>   - Use array of names and for loops
> 
> History:
> - https://lore.kernel.org/linux-input/20240528013959.14661-1-luke@ljones.dev/T/#u
> 
> Luke D. Jones (2):
>   hid-asus: use hid for brightness control on keyboard
>   hid-asus: change the report_id used for HID LED control
> 
>  drivers/hid/hid-asus.c                     | 32 +++++++++++++++++++-
>  drivers/platform/x86/asus-wmi.c            | 35 +++++++++++++++++++++-
>  include/linux/platform_data/x86/asus-wmi.h | 10 +++++++
>  3 files changed, 75 insertions(+), 2 deletions(-)

Jiri, Benjamin since the first patch now also touches pdx86 files
we need to coordinate merging this.

There also is a long list of patches pending for
drivers/platform/x86/asus-wmi.c

So I would prefer to take this series (both patches) upstream through
the pdx86 tree to avoid conflicts.

May we have an ack from one of you for merging this through pdx86/for-next ?

Regards,

Hans




