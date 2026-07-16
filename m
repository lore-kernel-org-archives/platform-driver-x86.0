Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2D6429CDF;
	Thu, 16 Jul 2026 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223615; cv=none; b=OLXbrdSmPQy1e4oj8v5N1GzFHIjpp25okC0Gc2Ds5BD74PqZn9Uk9a+XFwUX8s8ZS3XDI2HE1q6LPfthFuKlpx/aH+QE0ODX6a9kWnAFzjeyxcixOC+V4RTZfF4Qc3WyhiM1j/K0k14hhQ8y0k2BnpyzHP8ogx70lYlC1dygN6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223615; c=relaxed/simple;
	bh=K7+7rWyU0Lw+vD4Z4VZ9bGs8bt98S5v5zMwzYqW+xrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2xuhNetrxJciAmoPt/sdQ8Qyaj5w8RA6xVQkQAhQfqOLsmeVKJEiwMMEFwRy0Cxm+lu/DRAugmb+8no0PBr83iYiHNz3lR1TL0o5QJqRTDl0dRrji5OkESPri7t3AkxTmeZhkge/Fi9fXEspJYq6ybOdwfEVGXTlpsNG1fMWL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=nK1xVSCa; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="nK1xVSCa"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id CEFEE2FC0071;
	Thu, 16 Jul 2026 19:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1784223609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJ54t8crdZC1CKmDblrCBUBjlL2MjAtZkLfXx+Y68Js=;
	b=nK1xVSCaYEq1ynMoChtESIZ8vQ7QAVtEMExrRmkE0U5Y9OkH96I2IMRX+IbTwjtryauuCS
	yMElDZ/adyDYy4DD76LOiC0ViVSkuKy2JMsI4aG+UuMi9LQP/VDMVoS0PsrUYNC2ICyu4V
	gtRPs9bw8WCdy/G4KCi1tNpnChvhNYo=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <ce5c4f65-a4eb-4e91-9ef5-03175bcb2791@tuxedocomputers.com>
Date: Thu, 16 Jul 2026 19:40:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] platform/x86: uniwill-laptop: Prepare for
 extending keyboard backlight support
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260716162531.5744-1-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260716162531.5744-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 16.07.26 um 18:25 schrieb Armin Wolf:
> This patch series contains a couple of changes suggested by
> Werner Sembach from Tuxedo that are necessary for eventually
> enabling keyboard backlight support for Tuxedo devices.
>
> The first patch simply cleans up uniwill_kbd_led_init(), while
> the remaining two patches make two key properties (single color
> vs RGB, max intensity) configurable using the existing device
> descriptor infrastructure.
>
> Tested on a Tuxedo InfinityBook Pro 15 Gen 10 AMD.
FYI: I have the patch for adding all the TUXEDO devices ready. Just waiting for 
this to be included to sent it. Until then it can be found here: 
https://gitlab.com/tuxedocomputers/development/packages/linux/-/commits/wip_nb02 
(still needs some testing).
>
> Changes since v2:
> - drop 3rd patch
> - add Reviewed-by tag
> - reword commit description of 2nd patch
>
> Changes since v1:
> - add Suggested-by tags
>
> Armin Wolf (2):
>    platform/x86: uniwill-laptop: Split uniwill_kbd_led_init()
>    platform/x86: uniwill-laptop: Remove single color keyboard detection
>
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 119 +++++++++++---------
>   1 file changed, 63 insertions(+), 56 deletions(-)
>
