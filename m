Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5D330E0F2;
	Wed, 11 Feb 2026 12:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813434; cv=none; b=JOe2DSXXj6WW8QiDXDR9RiuGEDdlVDlBhyj1votwE2ewu+YGwo/VTOfJV6pik85RONB1rap3XYxxKhzPTgLqdNJX6foWZUlN4d5KzRbvOf2GDmlG+qoUXB5W54b1uk30WlAk/7bUgnCbtTuJm1zq5OYu2vfXGwGn7Lhh5rA5clQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813434; c=relaxed/simple;
	bh=pMsR9ekDbDohh0ZTgxUocLwK4eD5XKZc/1q+gvYt81A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UF847++IZIcVps1q9eDmeLWOzQzFtHDZkhPkP3Rv/KiR0M0X3rJFqpzMwTUuBvpVxOBctUCuFc4O6gp3chi56wqcOY7uzY50DpjBrDPv9gHbQ8qprOVEsHwvf2MTh6zcVT5PAIZoO9TTL742t9vdr4nv2J7iCPEMwYRwi9Th2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=MVnDmSoi; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="MVnDmSoi"
Received: from [192.168.178.24] (i5C75F5CC.versanet.de [92.117.245.204])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id AD5382FC006C;
	Wed, 11 Feb 2026 13:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1770813430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RekqSuim2koJ8w/CUmPYEG1sSupn66Fz5NVwIY3uvqM=;
	b=MVnDmSoifZk4xLnpvvgQVtWEqn22MtWyiu/WXbEN5KCmZBd+XRmMuFxm59QfLWQXlicGJG
	H6YkebL/msz9CKRNiE6UZE7f4wZVW/99l7G989Hfz1+ntIlqGMW7v/7Tqmdba81ObHj060
	Y2A+9kzX0yCXQdY6vXUvzg6dSPz4KTs=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <1a302ede-5198-47a0-a714-ddb9b7796760@tuxedocomputers.com>
Date: Wed, 11 Feb 2026 13:37:09 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] uniwill-laptop: Input-related improvements
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210232946.302936-1-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260210232946.302936-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 11.02.26 um 00:29 schrieb Armin Wolf:
> This patch series contains a set of input-related improvements
> for the uniwill-laptop driver. The first patch renames the
> "fn_lock_toggle_enable" and "super_key_toggle_enable" sysfs attributes
> after it was discovered that the underlying hardware works differently
> than previously thought. This technically breaks user space
> applications using those sysfs attributes, but AFAIK no such users
> currently exist.

Just to note it down somewhere: Not every Uniwill device hast a shortcut to 
enable/disable the super key, but the programmatic switch seems to work on all 
devices (at least the ones I tested so far).

Best regards,

Werner

>
> The next two patches fix a potential crash and an issue with the fn
> lock status not being updated when using a key combination. The
> remaining patches ensure that when the users changes the fn lock
> status or enables/disables the super key using a key combination, a
> poll notification is being issued on the appropriate sysfs attr.
>
> Armin Wolf (5):
>    platform/x86: uniwill-laptop: Rename FN lock and super key lock attrs
>    platform/x86: uniwill-laptop: Fix crash on unexpected battery event
>    platform/x86: uniwill-laptop: Mark FN lock status as being volatile
>    platform/x86: uniwill-laptop: Handle FN lock event
>    platform/x86: uniwill-laptop: Handle super key lock events
>
>   .../ABI/testing/sysfs-driver-uniwill-laptop   |  10 +-
>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 109 ++++++++++++------
>   2 files changed, 80 insertions(+), 39 deletions(-)
>
