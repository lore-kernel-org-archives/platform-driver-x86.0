Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D301466B08;
	Tue, 28 Jul 2026 18:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785263926; cv=none; b=cZqM0rNdfYECOPWTEEPOjBVFgwS4SwU3X7cfxrAjjKohebzepV1MxUOKapLtRtWWcrpRmnR4hgu+6FymKzr2QqizPR3lCXqqBXuWCywm7KkMLoQszMX04qzTTI1cZDv9L9m/PtxiK/ziTYMSfhfEyV17VMkeMoHrMq6oSItmQlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785263926; c=relaxed/simple;
	bh=FcVleo9EXXD23kUsqXh9C4+bO8LYDZ2mlevbyuZBo0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C43PllLTDbEzIxkKNtYSoTGL4toO2ZB0oCH+HQe5mmZl3tMzpag6jnLt9qyrgPNBvDDqzoW4FsbTBejzy4zsxoDalXg5tU60XPyJ01SF8MMQP/JXo4rjMFSA+nZ4H6p7n6OfYiakp47gvlHGxQK8+BGpvOSti8CXed8qAzb+vlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AUAiEMw4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AUAiEMw4"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50A902F8;
	Tue, 28 Jul 2026 20:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785263858;
	bh=FcVleo9EXXD23kUsqXh9C4+bO8LYDZ2mlevbyuZBo0k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AUAiEMw4pIkZhnTPBdzqgNxSqd0woOp3uT6UZvToL2IgM8qNKFcDWwwHT3kl66XXB
	 iLdkzK/7S3JBvdYyS1+J8+1kXJf+9YmWLY5QleOQXCUlsmPRYm5UrAxWb8G4CopjDX
	 XflaNg1DGIHAWv3PJ18vzNZ4NM676ml1rcWS4pUQ=
Message-ID: <1d7ca472-621f-41da-a367-09039a545a11@ideasonboard.com>
Date: Tue, 28 Jul 2026 19:38:39 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: Add L: linux-media for int3472
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 ilpo.jarvinen@linux.intel.com
References: <20260728181103.4413-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260728181103.4413-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari

On 28/07/2026 19:11, Sakari Ailus wrote:
> The int3472 patches now go via LMML, add the list to L: section for the
> int3472 driver in MAINTAINERS as well.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Acked-by: Daniel Scally <dan.scally@ideasonboard.com>
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index febe918d6316..580f03d9c2eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13371,6 +13371,7 @@ K:	\bSGX_
>   INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
>   M:	Daniel Scally <dan.scally@ideasonboard.com>
>   M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +L:	linux-media@vger.kernel.org
>   S:	Maintained
>   T:	git git://linuxtv.org/media.git
>   F:	drivers/platform/x86/intel/int3472/

