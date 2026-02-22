Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5E035C1B9
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Feb 2026 22:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771799198; cv=none; b=i1kF+mLaJR4emc0O3WRmHaFZO31oqT+x9+U/vdKZDD2cqABzipQ3EN6TvWolJsDb+FjoFg6fNTHwGc4xTSGx1yVsxwvO9q4Hcb+iSQs4jgKohLGsfoQQFXdmSzkdLMJb/uZALD1FUkh1tx+9D/J+/zlsgk5sg/i7UQ5sXPFwFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771799198; c=relaxed/simple;
	bh=xhcvYszpM9QLlyAJ9YzoALnPzlRYvDwGrZ96RYVNowc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhgbjWMYMBlq3PCqctHnlOStD8FwaWK0a9eEYk/UFJq9t0zbjU5h2RgM5zlsrSAv0vGHNfdSkYH+Y3gxqVPagwSXjy5wRuGIaIxcixR3qwCJiNUDZg1aeTIVRUgORYrMgbcMK9OW+Tm4xlXBl7b9quXmUSt0iP4ZsXGdH6wxCnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WTmM6jKg; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WTmM6jKg"
Message-ID: <3dca0acb-2dea-4a65-a98e-8b40c878b076@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771799194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvB44nvWYq1sT2ycvayIJfhrecfsGnFpNo++3uG80CY=;
	b=WTmM6jKgJy0SAGEdiAxRFmRFKvbY6oOx5YlYMBl6NTwdZhT1ML9yZT0Fo/3Zn9I8wERspr
	sh+921vlShReS8nze6sWEdLLsfbH4aVgcom61DZIVVGZAplKLL8Qfxu18KFyYZPTSpGr8W
	iRvGE9l8xCacenq+V2ijAHKrkQcuXNI=
Date: Sun, 22 Feb 2026 23:26:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add UX7602ZM DMI quirk
To: =?UTF-8?Q?Pawe=C5=82_Hofman?= <phofman@o2.pl>, corentin.chary@gmail.com,
 luke@ljones.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20260222220526.285327-1-phofman@o2.pl>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260222220526.285327-1-phofman@o2.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hello and than you for this.


There a few things missing here:
- a commit description for the why this was required
- your signed-off-by tag

On 2/22/26 23:05, Paweł Hofman wrote:
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index a38a65f5c550..19cd7ea13fef 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -553,6 +553,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_z13,
>  	},
> +        {
> +                .callback = dmi_matched,
> +                .ident = "ASUS Zenbook UX7602ZM",
> +                .matches = {
> +                        DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                        DMI_MATCH(DMI_PRODUCT_NAME, "Zenbook UX7602ZM_UX7602ZM"),
> +                },
> +                .driver_data = &quirk_asus_zenbook_duo_kbd,
> +        },
Please use tabs to align and ensure it is aligned with other entries.

Also keep all quirk_asus_zenbook_duo_kdb entries together please.
>  	{},
>  };
>  
