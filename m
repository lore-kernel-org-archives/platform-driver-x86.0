Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4757B33CD4
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708347393; cv=none; b=qeN72zhyicA8VZof8CiadjzqIc/CWaYgfVdilZs/gXYm53CwooKjNUi9ykYd3Vidf9ceMMYUcRtKpWpVSHOHj0c20YwLMHyNjH+incrYy+A15W4HTsy6bS9vk+t7WJMnCTFUQ1WtW3hshz8Q7uvr7ZcsQ6tCjmtob9kyepZI26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708347393; c=relaxed/simple;
	bh=tXciXTnzI0WBYuYcYl+Mfk/2akjit8SB45KAKre+59k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shlIVgx44Htog/VNworCcZbO9IPNLkR+vBKY5waLuvv5CKCPV0qeaDCmZ3zP078iOtR5/9bF1Ef/EFhd40TliJB+qVpMg+JPu1fedv55vKyU88xdG0KDmV6WbDlc3C0V7aHy+DjTwSW/zMThyvhtFdir2IvwIpbr+yhCvKQ9UN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UMAIdOGX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UMAIdOGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708347391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fi85J7cNtF2hnvLt9MhW0sBhoZ2oZZ7roepbFsf0Fkw=;
	b=UMAIdOGXzeq/mA6/RLWbJaw1FXGT05lS4rbfE0q0i6qeyb82sn31MkUo3VTaPz+mDsAwSP
	rOicoVcJvjYj0zb+2KtUsSGQk+lROBZm6SamTTlatF1QuJ8pbbiGAkr0ZLYa+a/O7thugC
	UhzutUvEBc2OpK2lmdy5b7sJ6RtZMcU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-8DYM2tcYP6affx6_qCVTFA-1; Mon, 19 Feb 2024 07:56:29 -0500
X-MC-Unique: 8DYM2tcYP6affx6_qCVTFA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5642bbddd01so523142a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 04:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708347389; x=1708952189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi85J7cNtF2hnvLt9MhW0sBhoZ2oZZ7roepbFsf0Fkw=;
        b=iT6RU/bjmjlwHt9Lg0SlsAyvpKTZ32dybljWRh8ejWFa32Odsz02wmxk7rLY/m5SZm
         YFS3jxQQKxZ2EvUrdqBCY7GwRvLxp5ucn5VPxmmkPDKCUsEh1O1F8mtFlwv6fVbHPaz3
         IyNf040YeeFlYx/fQPXDFqOkgR6loWg3SSrqR/dsTT4ZZp8EQd3vPleW4nF6ItnQiPf1
         NLvS6isIWcSK+ejVtY5fQjFDq0pvk5ipBBpFuk7p/vho2RdvtV+sRsWhW6qZ1LScJosu
         CbbLzEeoQN1U/VKY3JACJpw/SpfNnL2PkgLd7hqHYIMHIXkWyc3O44aNSd/gcWHu1zv9
         6+Zw==
X-Gm-Message-State: AOJu0YyUhFz3Oe2hXDQJYaGlUIbW+lcuLWcbakZ16Uwm911wwhjfvBCk
	EN2liq7Cln/HinR2kLPUBreIR2vA6BjlVy0BmtHXgnrkDRWoLk53iu0+UFVb1oG1wvQgFDJE0e0
	ULUwicgFZ6nWq4N4hthNe371ZOPL6xu+OEM4KUo+GarKnYXOr0EbsjBN14bw3TuqR3fWNOYs=
X-Received: by 2002:a05:6402:3788:b0:563:ccd1:26c0 with SMTP id et8-20020a056402378800b00563ccd126c0mr8171954edb.8.1708347388896;
        Mon, 19 Feb 2024 04:56:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+MVN2syDIWOe2FngB3b16L83fgJ+fflH9UzHroMpLNKXN0V7dQIAj5/MRnEBHa4w3lVT60w==
X-Received: by 2002:a05:6402:3788:b0:563:ccd1:26c0 with SMTP id et8-20020a056402378800b00563ccd126c0mr8171936edb.8.1708347388548;
        Mon, 19 Feb 2024 04:56:28 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cs1-20020a0564020c4100b005617cebd051sm2684619edb.78.2024.02.19.04.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 04:56:28 -0800 (PST)
Message-ID: <753c02c9-267f-4b2d-b032-74dc9a03e751@redhat.com>
Date: Mon, 19 Feb 2024 13:56:27 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-vbtn: Stop calling "VBDL" from
 notify_handler
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Alexander Kobel
 <a-kobel@a-kobel.de>, regressions@lists.linux.dev,
 Arnold Gozum <arngozum@gmail.com>
References: <20240216203300.245826-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240216203300.245826-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/16/24 21:33, Hans de Goede wrote:
> Commit 14c200b7ca46 ("platform/x86: intel-vbtn: Fix missing
> tablet-mode-switch events") causes 2 issues on the ThinkPad X1 Tablet Gen2:
> 
> 1. The ThinkPad will wake up immediately from suspend
> 2. When put in tablet mode SW_TABLET_MODE reverts to 0 after about 1 second
> 
> Both these issues are caused by the "VBDL" ACPI method call added
> at the end of the notify_handler.
> 
> And it never became entirely clear if this call is even necessary to fix
> the issue of missing tablet-mode-switch events on the Dell Inspiron 7352.
> 
> Drop the "VBDL" ACPI method call again to fix the 2 issues this is
> causing on the ThinkPad X1 Tablet Gen2.
> 
> Fixes: 14c200b7ca46 ("platform/x86: intel-vbtn: Fix missing tablet-mode-switch events")
> Reported-by: Alexander Kobel <a-kobel@a-kobel.de>
> Closes: https://lore.kernel.org/platform-driver-x86/295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de/
> Cc: regressions@lists.linux.dev
> Cc: Arnold Gozum <arngozum@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be fixes) branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/intel/vbtn.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
> index 210b0a81b7ec..084c355c86f5 100644
> --- a/drivers/platform/x86/intel/vbtn.c
> +++ b/drivers/platform/x86/intel/vbtn.c
> @@ -200,9 +200,6 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  	autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
>  
>  	sparse_keymap_report_event(input_dev, event, val, autorelease);
> -
> -	/* Some devices need this to report further events */
> -	acpi_evaluate_object(handle, "VBDL", NULL, NULL);
>  }
>  
>  /*

