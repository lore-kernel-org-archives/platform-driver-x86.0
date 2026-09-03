Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C776451071;
	Thu,  3 Sep 2026 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434837; cv=none; b=sy/UifPZWSz3dGEODM+6SZWfNe2hO1+dkNWWvMLVql1Gjrmru8sRGhLHKYYEbFdYEQOaimjx8w8pZiDaHlHLIwgMD0wbCWYOR3pmQ6bX56u1AdimPKMgqh36p1Z2Es5zSX1s1AD63t9EfmTeg4ptQ8TvxtCr3nkS+lem/eBAtRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434837; c=relaxed/simple;
	bh=9uE3zpnZ0gafd2h78p7EmP3AD+3862ZTMI+g39O+PxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHuF4a6CqjOdfx6vbIKJht1G/ce8bo4KuDvOy+oB5pEpS3xqsWB3Ynq4pI6CHqDeFYoN7WZxY1TdzsK9UxKj4vdVsH53CNy2EtDN9Hz6SZ7LpXZBsLBoIzB9tVQCSRoFg0Q7UWhixSzPwiMeHp+jjwHYEjLplH5eBcWllpJny+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=JIchZUdb; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="JIchZUdb"
Received: from [10.58.71.2] (dynamic-176-002-035-147.176.2.pool.telefonica.de [176.2.35.147])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 5FE4E2FC007D;
	Thu,  3 Sep 2026 13:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1788434829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2/AreLjgS7a78bAXMeD6eqCb+92ygOrQ4C6qZ28yNA=;
	b=JIchZUdbU6PwCG6qEuqarpTJjwdn/fWaGnEfssPDDWHru4ni83LpuWHg6OS0iwpSSBXP69
	lREU1bvVP9Pwir2DzC2aF1KHCCQExOljMZFvfKcjnc8gCrLAR1lvLfDMAxxLXbw5HxGXzv
	1Ef/gw7tHZ5HvfUdgkmGU+PIvmUk/DY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
Message-ID: <36280801-5615-4b47-aa4f-07219c9b25f6@tuxedocomputers.com>
Date: Thu, 3 Sep 2026 13:27:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] platform/x86/tuxedo: Fixes for TUXEDO NB04 driver
To: wse@tuxedocomputers.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260826081149.235487-1-aer@tuxedocomputers.com>
Content-Language: en-US
From: Aaron Erhardt <aer@tuxedocomputers.com>
In-Reply-To: <20260826081149.235487-1-aer@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

A friendly bump :)

I'd like to get this series merged because it is necessary for enabling
LampArray functionality on some TUXEDO devices in combination with the recent
patch sent here:

https://lore.kernel.org/linux-input/20260903073602.3815258-1-aer@tuxedocomputers.com/T/#m1b8fdad3bb17ddf6f9139b373ef41c626e52e44f

Am 26.08.26 um 10:11 schrieb Aaron Erhardt:
> This patch series contains several fixes for the TUXEDO NB04 driver.
> Additional userspace tooling and a new WIP generic lamp array driver 
> being tested brought more attention to this driver, thus uncovering 
> some problems and potential for improvements.
> 
> v3: Improve commit message to properly explain changes
> v2: Send all patches as one thread (sorry for the noise)
> 
> Aaron Erhardt (6):
>   platform/x86/tuxedo: Don't use device driver data
>   platform/x86/tuxedo: Set HID report ID on success
>   platform/x86/tuxedo: Use intensity according to HID spec
>   platform/x86/tuxedo: Fix keyboard LED map ordering
>   platform/x86/tuxedo: Update and extend documentation
>   MAINTAINERS: Add Aaron Erhardt as maintainer of TUXEDO DRIVERS
> 
>  MAINTAINERS                               |   1 +
>  drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 122 ++++++++++++----------
>  2 files changed, 70 insertions(+), 53 deletions(-)
> 

