Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EBE3DB626;
	Wed, 25 Mar 2026 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444912; cv=none; b=RZNb5coxDYSHQU9tv0dNbkYklIXwHbDRcmWULXGmOLYgL46Vx3Jve0gSAtH+sn/zJtl2J1DnRJ5LvH0a96I7mnGRD1CEVJqmSNd/zOvLVINF67/qr3OfKoOHJh6VWDcoP4z66f82ffLXZwUZddKwNNQCgwabMuy1p7+FqbJ+yeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444912; c=relaxed/simple;
	bh=ahbdRZcVXSeE5AQYVQIiGNGki7XRqOy5e3Mi8KDWlr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mn38WTPimUB0jb+ZIoBoHbj58sNyqhArktAobseJSl7+CCYV6AMhPHxvNC3fkJ+TGTn0g8jELfFbEZe8KyNWtgpkg1nRAHstn7+EsKmZTXC3by+2K7SiwBYGBmAaySc3Xu9KsJawHvNJfBR17qISutPTTJhj9Rxzm0NH/dyWb58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=olkttcsP; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="olkttcsP"
Received: from [192.168.178.24] (i5C75F6C1.versanet.de [92.117.246.193])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 3CBC92FC0059;
	Wed, 25 Mar 2026 14:21:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1774444902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NBwDxVMmfDnvBn+twFP30mYMOyt4Yx/WE6449qQnV4w=;
	b=olkttcsPDVVyGquGiLXUCfgTE/ZkLqKgMvbVoUYgCIP8tJP7koaHrDwZlQ50r7Eusj4lcs
	4iFs13nUp/t8/IbvWpG0n3oG1zu0sbF80xVJ4mZ1QitYjgiK3SOEO9uoEKbS3PIl77c/MU
	ArJzanwHr37o23bBqDCiEZ7dN4rWD5Q=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <894b03aa-2fe3-4f1b-b91d-330133855830@tuxedocomputers.com>
Date: Wed, 25 Mar 2026 14:21:41 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] platform/x86: uniwill-laptop: More support for
 TUXEDO devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260324203413.454361-1-wse@tuxedocomputers.com>
 <704a7de4-ee2e-5f1b-56e1-452fbb1af242@linux.intel.com>
 <84878980-ff70-42bc-8556-0a21f30a5290@tuxedocomputers.com>
 <d89927ca-db50-f060-0ad9-804e91126656@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <d89927ca-db50-f060-0ad9-804e91126656@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 25.03.26 um 14:06 schrieb Ilpo Järvinen:
> On Wed, 25 Mar 2026, Werner Sembach wrote:
>
>> Hi,
>>
>> Am 25.03.26 um 13:40 schrieb Ilpo Järvinen:
>>> On Tue, 24 Mar 2026, Werner Sembach wrote:
>>>
>>>> v2: Incorporate Armins feedback.
>>>> v3: Incorporate more of Armins feedback.
>>>>       Rework USB-C power prio functions
>>>> v4: Readd system vendor SchenkerTechnologiesGmbH for XMG FUSION (L19)
>>>>       Replace for loops with if statements for USB-C power priority
>>>> functions
>>>>       Add missing mutex in usb_c_power_priority_restore
>>>> v5: Restructure patch around new entry for XMG Fusion
>>>>       Add missing Reviewed-by and Tested-by
>>>>       Spelling fixes in documentation
>>>> v6: Fix small format error in docs
>>>>       Fix Reviewed-by line
>>>> v7: Variable rename to lowercase
>>>> v8: Move USB-C power priority init to after probe call
>>>>       Clarify documentation
>>> Hi,
>>>
>>> Does this conflict with something that went through the fixes branch? I
>>> tried applying this through for-next and get fails so I guess I'll have
>>> to merge fixes to for-next before I can apply this.
>>>
>>> It would be nice to mention any known conflicts in the coverletter.
>> sorry, I thought the base-commit line was enough
>>
>> it applies cleanly to v7.0-rc3 and v7.0-rc4
>>
>> earlier rc versions of 7.0 are missing a required patch
> Okay, so there's a dependency for some commit that went through 'fixes'?
>
>> maybe for-next is not yet rebased on the latest rc?
> 'fixes' and 'for-next' are sort of independent normally. Both are based at
> -rc1.

Ah sorry didn't know that, thought for-next moves along the different rc 
releases and so I only checked if it applies to torvalds/master.

Quick checked the missing patchset is this one: 
https://lore.kernel.org/all/20260218005101.73680-1-W_Armin@gmx.de/ it came in 
between rc2 and rc3.

Best regards,

Werner

>
> I don't rebase 'for-next' from -rc1. If there's a conflict or some 'fixes'
> commit needed for a work to be done in 'for-next', I'll resolve those by
> merging 'fixes' changes back into 'for-next.
>
>> I will have a look
