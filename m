Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341AD14EC5E
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715601938; cv=none; b=u2Z9JgrN4I5XQM59ZqM3K4lwy6ZDUMl2DaRLee9HSNFN7dkenPQk+fyP339INbmdoGHIWPOT5BgTMf7EZTb2rC7tnym+17+sJLeo5FHDeJ7NbMQEqgsrpTROvk70/lk7gWm4+nj/nEVja/wvzWYS0/NWdcwN1z8vmhVehICT8No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715601938; c=relaxed/simple;
	bh=KscPNOKa9fM6zG0pH8M90EwEvbR4nBgJ11WfvT6c39c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGnmAw2u+lve4reveId5cxGBSEiGiw5y+yqqw8RxIDp3uEMlxRFgGqQ0YpOJ4jUD1in49+tJp0lEptMGAq6/QaVazXH6z7jVs3vDtelVg90e147BgSwBGOo+kEHON21KnjaQvdWSZFLwbqquWr/QxxTbcRADOkKTPh29RsdsG3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gk5Qb+ZN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gk5Qb+ZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715601934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGnGhzjEF+L1hBCmtD1Ml7yZ2HrqleI6ZqmhS8dKETE=;
	b=Gk5Qb+ZNkHESuripXoQQJAdstsLcKQD2c+UCEeYwDzBkcJEgPE6fI77q2aVzjHhUrfM8+c
	uBLpi47sSqAPK0z7sNNT4Fz4CctLw6VRQkjoX1fgsFiHi7eOT67lPpuYFL3fcrGkh0Vx6Y
	/ClXq0gK6rfg2ceMqNzN+vWueVayxsI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-0dbgbR7HOlquVYlmkkN0VQ-1; Mon, 13 May 2024 08:05:32 -0400
X-MC-Unique: 0dbgbR7HOlquVYlmkkN0VQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-51f60b1644cso3897366e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 05:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601931; x=1716206731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGnGhzjEF+L1hBCmtD1Ml7yZ2HrqleI6ZqmhS8dKETE=;
        b=q2ys47OOp9U/1MQqRtZ19hrqW0pH7OPYfTAwVFD8Ak3YGFH6YQ3B7xdwrIFQh7G6qG
         fa1bhbk97sEBlP4SQ+7fzHayrcaliZgSNYsOQgPd7ux+7uHFkhTQzrQhKrEZJ9pOJ9Kt
         lzjLWlZQMi0tflnnKTPa52Q6Z0M8UiJAY7GE/gCTQ4/GGQDD1tsoYGnBDDbBJFngTPOj
         Jzz4YJlkGNfY7RzCCsRdp+O07f6g9+1eoahKiAfOZnMAONxbD/5LtIqDF7xHSz59aqKJ
         HEwWnlw4z0lSHPnKkM8s4DbW7kNQt1E7C25uKlGI1lU97iwK4PvliPaAvV8oFqhcXhha
         yJlg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/KShgwWQOk+ay0u45PuV2sZd9yKB/FsYl8RF3AihxrgIUTPKVrDJyAUDoanH2sBb2f1m7FxVFuy0DLDXAJeEr78RlZ2yq3tkQywiSR9wm1+K0g==
X-Gm-Message-State: AOJu0Yy93hskWOjhZXbFyPfZ3YD/xaQVIjpGYQ8nQD+AKrrokA58tXq4
	tOxyuVaiLY2U/zhtzc+TJ2MLeu2KQrtjkfuxwp1EncIqNQhEEi8ll6RqolffHfoHlG+i88+OXuR
	eNn/o+SY0aUD5ukaYAbrcMDOn1GfX1e3pWUL7v06AORYrEJblCnhO0c1RiotnvdeZskDbzoetIl
	3hDIw=
X-Received: by 2002:ac2:5dd3:0:b0:518:c610:754f with SMTP id 2adb3069b0e04-5220fc7bf01mr7999427e87.19.1715601931145;
        Mon, 13 May 2024 05:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkESdgeowLSlWKQVmWRV/0a3zIXac8FF69j8gR4b0pUbOjBxdL/XJuMmQjEaIyR7gJAJRIfg==
X-Received: by 2002:ac2:5dd3:0:b0:518:c610:754f with SMTP id 2adb3069b0e04-5220fc7bf01mr7999420e87.19.1715601930859;
        Mon, 13 May 2024 05:05:30 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5735a4a485asm4665724a12.42.2024.05.13.05.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 05:05:30 -0700 (PDT)
Message-ID: <e7bf26f4-70cc-43a9-81d7-51e8f37e9f06@redhat.com>
Date: Mon, 13 May 2024 14:05:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: pmc: Add new ACPI ID AMDI000B
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20240510103946.877307-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240510103946.877307-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/10/24 12:39 PM, Shyam Sundar S K wrote:
> Add new ACPI ID AMDI000B used by upcoming AMD platform to the PMC
> supported list of devices.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 108e12fd580f..239e073ea663 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -1132,6 +1132,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
>  	{"AMDI0008", 0},
>  	{"AMDI0009", 0},
>  	{"AMDI000A", 0},
> +	{"AMDI000B", 0},
>  	{"AMD0004", 0},
>  	{"AMD0005", 0},
>  	{ }

