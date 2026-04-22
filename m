Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F3A1A5B90;
	Wed, 22 Apr 2026 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871855; cv=none; b=DljEl3tF1mV0GaIvPdsZr3kZNhLnqLqTbtRmJhp9Z+ltwVIOnn5hrQE9MzrCPDbyogiJ5AfMQHdOjxHj1pmbHBuHlIgjPsBafEWEoASzA0srtK65hfk9ULidzl76bJtLDHs+b2aDEESyuT7wIV3opedSr5DQ/bFqsTP88cMDx1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871855; c=relaxed/simple;
	bh=r+Hwy0PObFq5IoyLTEReBmWvUG8dpy/fqj/gqPJXRj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PhUKyyxthAXeNRbr7r/ICNMyt89DHZWMxRqQMB8+aJuXHI2ff9AeyibvZsDb05FqPLAoqtZjo4crP8GamKYEG3ETFutGxyWCwstMx1HziXVCLBJhAHOg69opobHQQ36rlUM+X+PCOQaYnYklpsz2v9m7FGq3nsDsgEbpVJe0eD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=pyyoovf0; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="pyyoovf0"
Received: from [192.168.178.25] (i5C75F720.versanet.de [92.117.247.32])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 589BA2FC022B;
	Wed, 22 Apr 2026 17:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1776871849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HlSMMvjiznxtUdbAo/4K4+cB1heLVP/6ONN2Yl8L8nQ=;
	b=pyyoovf05U9xAY+Rb8uay3LQIdMZdHS7dStC8d02igq32vDiSLIYd8u1TxDMdaT+l2eWWE
	SghKYe0dG9p4qJVD93WMIbEwXvvobY8NyJ8MOW90ZAWdv6+jR+nXStHV7/nAnDBtM84sem
	fazZk09Fp6E12juFi+/RZs9mclfTEh8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <119c3496-9f2f-460d-9727-251731e32686@tuxedocomputers.com>
Date: Wed, 22 Apr 2026 17:30:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] platform/x86: uniwill-laptop: Another improvement
 and another feature
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260421201103.142403-1-wse@tuxedocomputers.com>
 <00de99ce-cb58-491d-81fc-f8bfb8ea4a16@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <00de99ce-cb58-491d-81fc-f8bfb8ea4a16@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 22.04.26 um 13:28 schrieb Armin Wolf:
> Am 21.04.26 um 22:01 schrieb Werner Sembach:
>> Hi,
>>
>> This series is based on another not yet accepted series
>> https://lore.kernel.org/all/20260417050912.5582-1-W_Armin@gmx.de/
>>
>> RFC because of that, because the third patch is not yet tested, and because
>> I have a question regarding the 3rd patch:
>>
>> Should I abstract the call to wmi_evaluate_method away in a wrapper
>> function in uniwill-wmi somehow, or is it ok to have it straight in the
>> uniwill-laptop code like that? It is quite self contained.
>>
>> Best regards,
>>
>> Werner
>
> Hi,
>
> i prefer having the code for this WMI interface inside a separate file. I 
> think we have to first rename uniwill-wmi* to uniwill-wmi-event*, then the new 
> code can live in uniwill-wmi.c
>
> However we also need some synchronization mechanism between uniwill-acpi and 
> the new uniwill-wmi because some code path need to check EC registers before 
> enabling support for local dimming. I suggest that you use the component 
> framework for that. Basically the new WMI driver registers a component during 
> probing, while the EC acts as a component master _if_ local dimming support is 
> present. When the component and the component master match a sysfs attribute 
> is registered to allow userspace application to control this feature.

Calling the old uniwill-wmi uniwill-wmi-event and the new driver uniwill-wmi 
from here on:

I haven't yet worked with the component framework, but i wonder: since the same 
manual register call structure that we already have for uniwill-wmi-event will 
be also required for uniwill-wmi, can't this call not also be used to exchange 
callbacks like for uniwill-wmi-event and the notifier block? just the other way 
around with uniwill-acpi receiving a callback instead of providing one.

ofc these callbacks must be guarded in some way to not accidentally call 
uninitialized code, if uniwill-wmi fails to init or probe

>
> Thanks,
> Armin Wolf
>
>>
>> Werner Sembach (3):
>>    platform/x86: uniwill-laptop: Make super key init lineup with other
>>      inits
>>    platform/x86: uniwill-laptop: Implement lightbar for XMG Fusion (L19)
>>    platform/x86: uniwill-laptop: Offer support to activate local dimming
>>
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 195 ++++++++++++++++++--
>>   1 file changed, 182 insertions(+), 13 deletions(-)
>>
>
