Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000172D595B
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Oct 2025 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642197; cv=none; b=gzx6tQMQ5Lf4DilyolWueK6Xz6oiBAyF5nF7VWd6fo2e2YhvR4AxejPZ21RDUzIpN289dTCA7tjbReC/Smp5Jygj+N3q6FwM6OeYlVVmr2FDh1XKR/N5CDUnnUQkrzdM8rdElPReLS/3406UciWRzg4u0OCdcLD/kmlavtEiRgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642197; c=relaxed/simple;
	bh=0KEWipz1V8+1I9gmXJPlHbemV+H9wCPTHrqoRZyO5HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pdis5qAQY6PVpGf1UBIqmD6vskfC4LlJ9UktTZ0SBnHWT9nHlKzIbVbftHK3B1ViytznHUO0CROk5klxN1/B1JsoZf7gCQBCammgymev6w9zCLgQNhqfoJ/CISBwIgZVbfRiErxQZGK0XRNACZR1uqfXn8kadEckp79bHXEVBAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mCywzS2i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mCywzS2i"
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B974B1D29;
	Tue, 28 Oct 2025 10:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761642082;
	bh=0KEWipz1V8+1I9gmXJPlHbemV+H9wCPTHrqoRZyO5HY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mCywzS2ikEOA4tRkwzoDcNXTP10GvATGDi/xdppQeDMxbfNAnNbfeytqU42rCuxBY
	 z9fgXGCGkc7mWmwUnzE8KI5m7WF5EOUcdfcjhSkLu5nV7z7zRlT4nPyKFRka/hozx5
	 SNR3lvenOd/o4m1Z2wJNIwSrDJ32V/U5ePk1cl8I=
Message-ID: <3a11dd34-d0fa-4a60-a134-5b577e5f9f59@ideasonboard.com>
Date: Tue, 28 Oct 2025 09:03:08 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: Update int3472 maintainers
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251028084959.394795-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20251028084959.394795-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 28/10/2025 08:49, Sakari Ailus wrote:
> Add myself as the maintainer of the int3472 driver. Also update Daniel's
> e-mail address while at it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Thanks Sakari!

Acked-by: Daniel Scally <dan.scally@ideasonboard.com>

(or whatever tag is appropriate...)

>   MAINTAINERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 252b06d4240c..ebc9f33f3f19 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12887,7 +12887,8 @@ F:	tools/testing/selftests/sgx/*
>   K:	\bSGX_
>   
>   INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
> -M:	Daniel Scally <djrscally@gmail.com>
> +M:	Daniel Scally <dan.scally@ideasonboard.com>
> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>   S:	Maintained
>   F:	drivers/platform/x86/intel/int3472/
>   F:	include/linux/platform_data/x86/int3472.h

