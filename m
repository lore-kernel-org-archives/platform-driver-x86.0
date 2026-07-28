Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E633A7F48;
	Tue, 28 Jul 2026 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785238784; cv=none; b=KvIabotaOWsErMXuYHTG9b9HjuzlY9RtBcNtLfRiYyn9h9f/7W4v2QhhI28QvTKQzBQINK5789whCIO9BaFvutsTXKI8tHqJxkDpf9HYnOCfw52YpkkvaQCKlNgACKRkJf1W7YJlixhZObY2kxWshokp1ESKAk+DBA4Br0j1anw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785238784; c=relaxed/simple;
	bh=FQDjBXq6iQwjRLOMLdNLrijAclqmY82ZdEZTJrMCov4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyPOPbKSvnczz1x3A6bYs9BaoceDcrzkreC6I7zg1IPb/0iIUKA9DHfRt9me/wiZQW/eJg+EEy2fha118Pi+CB0Oq7r7XfbKQNBEgp1q7wm+HD3oclFMc/vZ+Ajs9i3Dhm7BGLIFwqA7iM3xWNAWRSptvnM6adUBkoTBJvkxHGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/z833QN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/z833QN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1971F000E9;
	Tue, 28 Jul 2026 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238783;
	bh=oyHzdPY4Bf8P0+CDfdBNQQI3jA9mRWOL0IYNNizFPFc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W/z833QNg1W2Y9cVuH2mBIjH7F6/5EH3ZNagzgFsAc9LLb0Ji9R6tfYSLM+6jyIUt
	 NZO2lAVzIuu0pqUw5pP6mkGIEk1sHrdZM0uckGFuYgYQEHGpfYHKMVJlU9hRHjnd3K
	 m2vj6kB43cjDpR3WElOHNuRtP1tH64AlccwpsqeeuFfEmiu3nyjnW9Oqyi4aS2SOE/
	 K9R2aGrSQ0Qh0sWjGRkyiKSFyM5dc4l3L1Qo9PCanT00kf7Ku0m2AZtjm7cXEQS4Uv
	 0qoYEbacQ7QO8oAPcnwkiEPYrOYLPmlzIfrxoY8qf6lYSKazl2CRgwHlcK+a83mN03
	 rtJvOLpx9fH2A==
Message-ID: <d88d0945-71e0-4d21-b154-d0d837624858@kernel.org>
Date: Tue, 28 Jul 2026 13:39:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: asus-armoury: add Whisper Mode support
To: Marco Scardovi <scardracs@disroot.org>,
 platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 denis.benato@linux.dev, linux-kernel@vger.kernel.org
References: <20260728071843.130492-1-scardracs@disroot.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260728071843.130492-1-scardracs@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for your patch.

On 28-Jul-26 09:18, Marco Scardovi wrote:
> This series introduces support for ASUS WMI Whisper Mode hardware controls
> in the asus-wmi header and asus-armoury driver.
> 
> Background & Findings:
> ----------------------
> After talking with Denis and thanks to NeuroMarshal reverse engineering and
> firmware trace analysis on modern ASUS laptops, three specific WMI Device IDs
> were identified that manage acoustic profiles and thermal regulation under
> ASUS Whisper Mode:
> 
> 1. ASUS_WMI_DEVID_WHISPER_MODE (0x0012007A):
>    - Controls the BIOS-level Whisper Mode acoustic profile toggle (read/write boolean).
> 2. ASUS_WMI_DEVID_WHISPER_ENABLE (0x00090022):
>    - Enables or disables Dynamic Whisper acoustic regulation (read/write boolean).
> 3. ASUS_WMI_DEVID_WHISPER_STATUS (0x00090023):
>    - Reports status and allows runtime control over Dynamic Whisper state (read/write boolean).

I wonder how this interacts with the platform_profile stuff ?

I would expect enabling whisper mode to lower the max performance,
so does this automatically change the platform_profile away
from performance when it is set to performance ?

Note the platform_profile API is extensible. To me it seems more
logical to expose this as a whisper mode platform-profile ?

Regards,

Hans


> 
> Series Overview:
> ----------------
> - Patch 1/2: Adds WMI Device ID macro definitions to
>   include/linux/platform_data/x86/asus-wmi.h.
> - Patch 2/2: Exposes whisper_mode, whisper_enable, and whisper_status sysfs
>   attribute groups in drivers/platform/x86/asus-armoury.c.
> 
> Safety & Compatibility:
> -----------------------
> All newly introduced attributes are probed via armoury_has_devstate() before
> sysfs registration. On devices where these WMI methods are not implemented by
> firmware, the sysfs nodes are gracefully omitted without impacting existing
> attributes or functionality.
> 
> Validation:
> -----------
> - Build verification against linux-next cleanly with zero warnings or errors.
> - Coding style and formatting verified via git diff --check.
> 
> Note:
> -----------
> Unfortunately, due to it being missing on my laptop, I'm not able to verify
> if the WhisperMode works as intended. The values are the same reported by
> NeuroMarshal on his reverse engineering of Armoury Crate [1] so they *should*
> work.
> 
> [1] https://github.com/NeuroMarshal/armoury-linux-probe
> 
> Marco Scardovi (2):
>   platform/x86: asus-wmi: add Whisper Mode WMI device ID defines
>   platform/x86: asus-armoury: add Whisper Mode attributes
> 
>  drivers/platform/x86/asus-armoury.c        | 14 ++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  5 +++++
>  2 files changed, 19 insertions(+)
> 

