Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CDA17C6A
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Feb 2024 09:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707731262; cv=none; b=NeN2Y9+CH7jPnKhnJ37HmAsCGUdwVeVKg8Ko+iKSqkJxBhTfrw7kHzH2zaRumzdT0IiFIjEcDRj8b/hn/xxl0mGAbHYHrkdcKSGiaCDPpcdx6G7dGlqfjL1smn4uHhDFw6dG5OTn6c6uEPevszhUf566WFD6B+w4sv//7HaglmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707731262; c=relaxed/simple;
	bh=Eh9xpw7D9VV4tZED6QbHFh6Lr0Yocb1suzEQpJrU1bA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWnvqaYBcEZNRM5Cg2YUfn34YJATZlTu+8R1jxcsxswAjWVcTrOYaPuDh9UItp6g41EZba4+JmVH93b/NTTyEtL9xZ+46WlTGgVmmubm1zijOEdcgylNBDWAl1pjjuX4Hzi7KjlI8/P0begKCB9pZCnUCmS/p/EOPCq33x2ppBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q2VAmh2d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q2VAmh2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707731259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CaPpaCUSwcShsHWW20prOvoPELdfPTInE997EEB2p4c=;
	b=Q2VAmh2dw/RhqDenvvVR8PWchqYSJm4r2JXFapibNQU4j9MhNKL6vddf7cRHJiJ0fnKF0c
	WE7wEViiRDouVE2pF++nCxJsNYYkUpfmLgDWdRbndnGC8a5jaQ4pa2CTcn3yv6oDdKHAlN
	om3Onfy2PWvmHlXTP3jGrWTi1WQAUic=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-Oey7X_GdPT6Qnc0Y3G8R8A-1; Mon, 12 Feb 2024 04:47:37 -0500
X-MC-Unique: Oey7X_GdPT6Qnc0Y3G8R8A-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-558b04cb660so2269206a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Feb 2024 01:47:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707731256; x=1708336056;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaPpaCUSwcShsHWW20prOvoPELdfPTInE997EEB2p4c=;
        b=ZdG32T18/P3LIfSY0Fj69P2bsN0kS17W2zrKibrrRP5H3+MfnnuIgrvP/IN8/3rfIP
         lxq3yi6N65QOj+iqer/lSQrXVA+ThRrN9LUpTI2LfjlYXakXrF7d4DfiAR1TcV2/uaqv
         7VY70l0S9yQTyIWAwBn+voOoUtkFlueprXZkVmIErbRcRgXqFlUsB5l8oGdBmyUb5+X8
         yT7QtgASXp1g6/D+8H/7Kjq46gzqYnAjR1LD0IL1VFdYw+7Qr7LnEfOYSh9z0h7g5ul5
         riycYXjeRyGswosgeXjqREChQRvbQctZFIA7jbGk1Nx9LOXfxLWD9DERIqIZPSHf54Ga
         PSVw==
X-Gm-Message-State: AOJu0Yw6L9FkJ1kX0hrRcyVkmtTOSJxR4t3LtGBDSeO9rH6HHAw2Jxp9
	AM/6wZvpq06XVmhA31Vm6gBXeABD/W/CJQA6ctCKC85FTC199aM1ZMxaxEd8N6OKHrHpgX6Dh1S
	L7qTqnxusw8iim2Y3HVELIi1PU+/I5tGff1ab7PEUE4UIxFJEZWGSoCGcUfY0velQexFCOUE=
X-Received: by 2002:a05:6402:7c3:b0:561:a6f1:66e3 with SMTP id u3-20020a05640207c300b00561a6f166e3mr2063992edy.22.1707731256283;
        Mon, 12 Feb 2024 01:47:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELIRYTE+KeUDGeGfcHsa7uitjl6xrt6IXh51/cNfmgkq+avtNT7j+RQCKVhf+SKAmA3Es4KQ==
X-Received: by 2002:a05:6402:7c3:b0:561:a6f1:66e3 with SMTP id u3-20020a05640207c300b00561a6f166e3mr2063973edy.22.1707731255949;
        Mon, 12 Feb 2024 01:47:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIKxTqoffPN6TVMbtqIetEzXtjhgfyD8diXpnXaBXpLmD+R47pp41x26qmpQSUaF0Wu3nhq0KcsNXSDCRZt1ZJaKoZp7POPDV1GdzyB7v/oZt3hisjfkU03YPI09JlqTOEhLEgfDXMe66ej8YPYkQnkdOGLhRGz5YRyCn+Tg==
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f4-20020a056402194400b005617a858f21sm2173720edz.93.2024.02.12.01.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 01:47:35 -0800 (PST)
Message-ID: <ec06098b-5e69-4df0-94d0-22c5755b9351@redhat.com>
Date: Mon, 12 Feb 2024 10:47:34 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix TEE enact command failure after
 suspend and resume
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20240212092440.4135787-1-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240212092440.4135787-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for your patch.

On 2/12/24 10:24, Shyam Sundar S K wrote:
> TEE enact command failures are seen after each suspend/resume cycle;
> fix this by cancelling the policy builder workqueue before going into
> suspend and reschedule the workqueue after resume.
> 
> [  629.516792] ccp 0000:c2:00.2: tee: command 0x5 timed out, disabling PSP
> [  629.516835] amd-pmf AMDI0102:00: TEE enact cmd failed. err: ffff000e, ret:0
> [  630.550464] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_RESPONSE:1
> [  630.550511] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_ARGUMENT:7
> [  630.550548] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_MESSAGE:16
> 
> Fixes: ae82cef7d9c5 ("platform/x86/amd/pmf: Add support for PMF-TA interaction")
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index feaa09f5b35a..be9edb849006 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -296,6 +296,9 @@ static int amd_pmf_suspend_handler(struct device *dev)
>  {
>  	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>  
> +	if (!pdev->smart_pc_enabled)
> +		cancel_delayed_work_sync(&pdev->pb_work);
> +

These inverted checks are very confusing and this is all caused by this
enum which causes the smart_pc_enabled enabled bool to be inverted:

enum smart_pc_status {
        PMF_SMART_PC_ENABLED,
        PMF_SMART_PC_DISABLED,
};

Please do a preparation patch for this fix which:

1. Drops this broken enum, there is no need to have an enum for what
is simply a true/false case.

2. Replace PMF_SMART_PC_ENABLED with true, PMF_SMART_PC_DISABLED with false,
so that the contents of pdev->smart_pc_enabled actually matches its name
instead of being inverted.

3. Change the single existing smart_pc_enabled check from:

        if (!dev->smart_pc_enabled) {
                amd_pmf_deinit_smart_pc(dev);

Which is nonsensical code, if not enabled clean it up? Into
the much more sensible version of:

        if (dev->smart_pc_enabled) {
                amd_pmf_deinit_smart_pc(dev);

And then redo this patch on top of this preparation patch,
also replacing the "if (!dev->smart_pc_enabled)" checks
in this patch with "if (dev->smart_pc_enabled)" so that
the code actually makes sense to a casual reader.

Regards,

Hans






>  	kfree(pdev->buf);
>  
>  	return 0;
> @@ -312,6 +315,9 @@ static int amd_pmf_resume_handler(struct device *dev)
>  			return ret;
>  	}
>  
> +	if (!pdev->smart_pc_enabled)
> +		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
> +
>  	return 0;
>  }
>  

