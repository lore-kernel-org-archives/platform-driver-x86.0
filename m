Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D143ABA2E
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714388603; cv=none; b=dBoeHWUxo6WMJp4GHPum3Rnu12h/PTeiVdEw4ejk8F43zId/+bKZUkR9gICbMOvAJKLpYMI5N765x8efRtSMqkYhselKQ6M9UvqgVbVJ6YvegFNEn1V2TmBVFX2CK+sXaLmIOuSqQXrTUPLmv5VYJNh/U76tOzXjeH1srS+1U2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714388603; c=relaxed/simple;
	bh=DizmVvoymQvAKI/J96lzMW5cvF/aIcOIof9SIfMLceM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZgPJQ0u3X7ic8cnFdXQor4Y+sAaWma698gUObMPo6q3EgZ2J+naNgPAa+eqbUkdr57SArglcCwXtAAMLx5P4BddBSQZNK85MaFsp6vveOGhQCVXXINkfjF96b46PCUYQ6hZ6/LTboQZGHue6JjPm0Jp2EsVnPvmJLKCGFpUOSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T+MlUeDL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T+MlUeDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714388600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbW61cPTq5VMph+SlwYX4bBGdewo3Ji/UxuDzLoeL0s=;
	b=T+MlUeDLNI0lOMCgb5K06Ro467rhFIf+GhiVr3K4RjRP/W7RQQE145ii/twK6+Cz3AghLI
	62S4hhU8vxWWYZPsktNzckMiOn7rZJqtb8G9jycoIPjdXcU1MXVlvQYMARt1PiRbHCNwQc
	Sm8z/D4XInNfWywqs977yRJCz5PR3LQ=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-mdQc3rUHNhicXH8TPUenxQ-1; Mon, 29 Apr 2024 07:03:19 -0400
X-MC-Unique: mdQc3rUHNhicXH8TPUenxQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2dd1dbde466so38514021fa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 04:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388597; x=1714993397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbW61cPTq5VMph+SlwYX4bBGdewo3Ji/UxuDzLoeL0s=;
        b=IT7Mzo92GqjuRnWXmwnyXtFjZ88z2noX+cK7hXyTpoOBTGkcKIM43nkQN4X3ohXBB6
         umRKR3W2YyrMjStJkphwcuChMqSSgIIwlkQWOnL9KOPFUd4OxGnYZDkY8sP1fSzpfITt
         29fu8NHCUoU6UPJv33a9EQIxlV61P4Gb0Q0ThlJgMyuGPdZmF6FOtQEaExRLO8XZeEw2
         y++mRhJ8gwxpFLB2Pt0OpDQo1bmowEmKNJVrbL0QLL/LwRatQyCztLn6f0vx5ZVQ4v3S
         QvWuY77Cu7241eJ1ToFhl+diLFHt/F94ZpsoZceNAmIxEcDpH3SBA7p0auVYFt+tta5l
         P0ZA==
X-Gm-Message-State: AOJu0Yz1dLaAe7OlFqqYTnwuvIBqUDA+4ANRlhcT5/Fd5yXggXh1qmQ7
	66fCMVqBG17x4tWszAnCS+EJ9N9ZuLtmTitpb3BxL14HwmZx6YTktEPtKx8x5OALTy4w7VLzwG1
	c0Zgron7Zc8OJBBvJ40U+w5pxUVWn2WtI5lelLZOdJiKvLBy0TX7gGLGUCM/W0j0tlE1RryU=
X-Received: by 2002:a19:2d54:0:b0:51b:6366:6267 with SMTP id t20-20020a192d54000000b0051b63666267mr5932853lft.32.1714388597622;
        Mon, 29 Apr 2024 04:03:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWrSYa6u56rkksTK55h/ogi20rYz6SGFz+72DxwAuEuGVFHx53aIUrAnaV17HapeFw79W1uA==
X-Received: by 2002:a19:2d54:0:b0:51b:6366:6267 with SMTP id t20-20020a192d54000000b0051b63666267mr5932826lft.32.1714388597201;
        Mon, 29 Apr 2024 04:03:17 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id v19-20020a05651203b300b005159412ab81sm4072210lfp.216.2024.04.29.04.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:03:16 -0700 (PDT)
Message-ID: <015908b2-8fd1-42f2-b145-96765163d06b@redhat.com>
Date: Mon, 29 Apr 2024 13:03:15 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Support partitioned systems
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240423204619.3946901-1-srinivas.pandruvada@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240423204619.3946901-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/23/24 10:46 PM, Srinivas Pandruvada wrote:
> A partitioned system has two PCI device per package compared to only one.
> This doesn't change any TPMI functionality. Just while reading, different
> MMIO region is used for TPMI instances.
> 
> Some patches are not directly related to partitions, but added for easy
> application of series.
> 
> Patches are applied on top of origin/review-hans branch as of April 23,
> 2024.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
> Srinivas Pandruvada (10):
>   platform/x86/intel/tpmi: Handle error from tpmi_process_info()
>   platform/x86/intel/tpmi: Check major version change for TPMI
>     Information
>   platform/x86/intel/tpmi: Align comments in kernel-doc
>   platform/x86/intel/tpmi: Add additional TPMI header fields
>   platform/x86: ISST: Use local variable for auxdev->dev
>   platform/x86: ISST: Shorten the assignments for power_domain_info
>   platform/x86: ISST: Support partitioned systems
>   platform/x86: ISST: Use in_range() to check package ID validity
>   platform/x86: ISST: Add dev_fmt
>   platform/x86: ISST: Add missing MODULE_DESCRIPTION
> 
>  .../intel/speed_select_if/isst_if_common.c    |   1 +
>  .../intel/speed_select_if/isst_tpmi_core.c    | 345 +++++++++++++++---
>  drivers/platform/x86/intel/tpmi.c             |  39 +-
>  include/linux/intel_tpmi.h                    |  12 +-
>  4 files changed, 333 insertions(+), 64 deletions(-)
> 

