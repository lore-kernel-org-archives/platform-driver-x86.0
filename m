Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB21224C2
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jan 2024 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706296595; cv=none; b=DRyNFgnhxhKBBFLTPwxFd8WFSmS1QjpiL2WBf/WC4cBgnoA7JXnzq9nJzJf95LyiFbLuZC8fsYaRja2wniQmL6cvYMlFX+M2KEo+eCdbijampl40F2XgYgjTO4M3uD59Xb2O0WP310r1oTnzVzaoSYFyncZYMV1gLnInAr4UaXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706296595; c=relaxed/simple;
	bh=RVq1S9z1uRNg9gcGJ8LSCY81M7rpWZbI9HRM9B5h5Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5bnv+9y0P05Dnua4I4SI+aJSVYrlaElgroJqCQZZQvFej/KtzXvts17L9Ak9uqAuFPMIQy0jKDYQRez94zu+8NyvJ3LHr2PrTyDTdOzGiER7qeAp/resZEeieS8lfnC0TidSAlkjyeNPl1cSAIDrPBflEMsxpbTf5i71nmiCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FQaazu4T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FQaazu4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706296592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjtlai9R0ZyZGNIn1Lv6hD4/DC5a5VOznTf7omApR/0=;
	b=FQaazu4TP6dxF6FjsDLo/fNW587pMopzCkCxnXn8p/dv2o/cMW9uPDzkMn3LzVjS0VLPi2
	agBEBoEZFeA3BpFcZljq9f2Yl286hXCWIhVvLyc3JFEH0wYcV+54lMKRTMA7/DwWUg4khi
	rNWXwxRQW6OU/YNMKfUpqPlsuQ0YSBc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-VW9EMiZSN9yAzF2yowibyQ-1; Fri, 26 Jan 2024 14:16:30 -0500
X-MC-Unique: VW9EMiZSN9yAzF2yowibyQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2f1d0c3389so33007566b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jan 2024 11:16:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706296589; x=1706901389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjtlai9R0ZyZGNIn1Lv6hD4/DC5a5VOznTf7omApR/0=;
        b=kUGvcILdWC6R4BwnPndFp2cp1zOSLKN6UGaibWLAVMwJIqpFh3pzxb0Nd8IIcaxMr5
         boXmoi3V5gEpRBf7oSAHb3TWpDMLMndU2Ux602tc5Etq+co3lq5ZP8z5QxqTurFcWCsz
         UUjtLyDaJp/gpXbixN4CvrDSdGWOHTVnDgKKhSYLTxemLiOJ0bJ3ImFYjNB8ewbHyRfb
         eK8hnpZVleppKys6Az4SZhlXn6cUf8fSTTOojcCLTngVeH27CRtAt3XrYR707Bq8ow5J
         KLTBrWbhIbAEHouyYL8MrbFvn4GRkUtjIG0hIt6/SOAwzzSTsgwzQ8Scf3PmPSvDOuor
         pTmw==
X-Gm-Message-State: AOJu0Yxr3Ry9hlSPxEtzo/8kZlo8cYFF40L580+t25SB+OoZRYqUguJh
	zN6unZFELqRKxNaIT7PAoUJR1DtlSL8sRGRr1vjW2HycFAPJu0zAP/ZTJwhOdnkW2zwiDLMKxcR
	bqgqOE34z6Y+7edqZKO9pTfm6spcC8D//eIB+blw7CCEfQtHTmLGASPGa/GvXQhQDqBVI/yM=
X-Received: by 2002:a17:906:16da:b0:a31:9219:162a with SMTP id t26-20020a17090616da00b00a319219162amr78961ejd.7.1706296589736;
        Fri, 26 Jan 2024 11:16:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA+fXTgjP8hVlsFjcU2Fx7LJfoaUckuw3d6a1u45Yt/xp6teaiQsLqQb0VPf7ATOMSbY3OpA==
X-Received: by 2002:a17:906:16da:b0:a31:9219:162a with SMTP id t26-20020a17090616da00b00a319219162amr78954ejd.7.1706296589400;
        Fri, 26 Jan 2024 11:16:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g17-20020a1709067c5100b00a34a45c8a37sm930564ejp.145.2024.01.26.11.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 11:16:28 -0800 (PST)
Message-ID: <1c235fc1-887c-47c4-8b77-b93a60b99ace@redhat.com>
Date: Fri, 26 Jan 2024 20:16:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmf: Get Human presence information
 from AMD SFH driver
Content-Language: en-US, nl
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20240123141458.3715211-1-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240123141458.3715211-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/23/24 15:14, Shyam Sundar S K wrote:
> AMD SFH driver has APIs defined to export the human presence information;
> use this within the PMF driver to send inputs to the PMF TA, so that PMF
> driver can enact to the actions coming from the TA.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch series, I've applied this series
to my review-hans branch:
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
>  drivers/platform/x86/amd/pmf/Kconfig |  1 +
>  drivers/platform/x86/amd/pmf/spc.c   | 28 ++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index f246252bddd8..f4fa8bd8bda8 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -10,6 +10,7 @@ config AMD_PMF
>  	depends on AMD_NB
>  	select ACPI_PLATFORM_PROFILE
>  	depends on TEE && AMDTEE
> +	depends on AMD_SFH_HID
>  	help
>  	  This driver provides support for the AMD Platform Management Framework.
>  	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index a0423942f771..87ae7c41c9f8 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <acpi/button.h>
> +#include <linux/amd-pmf-io.h>
>  #include <linux/power_supply.h>
>  #include <linux/units.h>
>  #include "pmf.h"
> @@ -44,6 +45,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
>  	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
>  	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
> +	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
>  #else
> @@ -147,6 +149,31 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  	return 0;
>  }
>  
> +static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	struct amd_sfh_info sfh_info;
> +	int ret;
> +
> +	/* get HPD data */
> +	ret = amd_get_sfh_info(&sfh_info, MT_HPD);
> +	if (ret)
> +		return ret;
> +
> +	switch (sfh_info.user_present) {
> +	case SFH_NOT_DETECTED:
> +		in->ev_info.user_present = 0xff; /* assume no sensors connected */
> +		break;
> +	case SFH_USER_PRESENT:
> +		in->ev_info.user_present = 1;
> +		break;
> +	case SFH_USER_AWAY:
> +		in->ev_info.user_present = 0;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	/* TA side lid open is 1 and close is 0, hence the ! here */
> @@ -155,4 +182,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>  	amd_pmf_get_smu_info(dev, in);
>  	amd_pmf_get_battery_info(dev, in);
>  	amd_pmf_get_slider_info(dev, in);
> +	amd_pmf_get_sensor_info(dev, in);
>  }

