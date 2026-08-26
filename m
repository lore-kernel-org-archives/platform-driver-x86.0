Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A26361DDC;
	Wed, 26 Aug 2026 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732928; cv=none; b=ipzqJR7g+zKUZuxANDXiBImOkZODREQi3JwZPbm4y6KNmNEBs27F+jQEMIR7YL1LyqSVyKWzTfMshQLCUt2AHzIz82Z4s9f0yTMQrRSBHdwNh4zm1Ig+77bO/SieoJKcV+qQPqqhwWwyFfEps/Lp9BuvtTa/QLIkx9RmvYX5O7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732928; c=relaxed/simple;
	bh=zR4367prPnDJS+GFM9idA6gHDGuYjrpgbwmqams6yPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwcyjkrl4Puzy0L5T3hsgZZ2rsM59Zg2L91i/FdS87r8Mh8tgSlkGUiCFcPkuWr2CGaG0XrzyN4w4IsUKrKH3h4YeMDL+MmNkZ4HkeTJubkDjYLVidP77m+s0Aj0ciB10v0vv2UEB0TfQxxNwv+frrHB/WtuJk+CCkkgiTP1cpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=muWAlIFw; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="muWAlIFw"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 91D302FC0052;
	Wed, 26 Aug 2026 10:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1787732924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yEvvGqQgGoFB0L7ETRVOquHE2mLiz0o5YCgA3fjOX0E=;
	b=muWAlIFwmiTVV5LVDgLgWY6Qlhy7Qr6uzdUqzOpUP9nInz27qZNlcM9h8Pk9ckcegRk8TY
	AyrqTQWTWhNv0gvKMRYnxw765z+FNTnVbdCLLZd3gwJUZZk+XEyiIkQI/vn65pPceuGSK1
	usXNmKPaXu/Nb3B1VRNZirGGVHUTH+s=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <5f4aa491-42fd-4c3c-b77c-e81be7e969a4@tuxedocomputers.com>
Date: Wed, 26 Aug 2026 10:28:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] MAINTAINERS: Add Aaron Erhardt as maintainer of
 TUXEDO DRIVERS
To: Aaron Erhardt <aer@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260826081149.235487-1-aer@tuxedocomputers.com>
 <20260826081149.235487-7-aer@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260826081149.235487-7-aer@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 26.08.26 um 10:11 schrieb Aaron Erhardt:
> I'm actively working on this driver as part of my responsibilities now.
>
> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a674e36529f7..792eb26722b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27551,6 +27551,7 @@ F:	tools/testing/selftests/turbostat/
>   
>   TUXEDO DRIVERS
>   M:	Werner Sembach <wse@tuxedocomputers.com>
> +M:	Aaron Erhardt <aer@tuxedocomputers.com>
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Supported
>   F:	drivers/platform/x86/tuxedo/
