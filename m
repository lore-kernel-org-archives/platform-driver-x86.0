Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E701422068F;
	Wed,  3 Dec 2025 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764748328; cv=none; b=sM+LlEgD1tQ51zfWg1MsLc9v0oxlZmPzKheuEzM8iqHB09K1ej9ywtuQQ62OtowcLiyF8dLEUwiI/0D1TVCfDkDcJzMRxGeuvcyUQOHFAKAQhIhi8d8mibotAxxXVUg4zODkF56qt2HiJY+s4qO3J8CcCoxGmFMumo8oJMdlpbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764748328; c=relaxed/simple;
	bh=PkSljsV6RVoB89MLkLzt7Y4HjJ4H4NFmvkLxhyL1S3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZfrlVRMbIurjZc7HOTxKc4LVwdSdFrSqIURmd5KUZ+4WokQ1PtqduWEKbdW48NltL+RtOTJLYoIqPqNUxbBSoV45Is9N4BLQNMHi5GcE9FBWPTnstHjxh7QbW46xtQbNc3sW4OIXfN133ydGyT45kau6P9PG0nMmRQl+N3rlL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBS4m5mQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBS4m5mQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF05C4CEFB;
	Wed,  3 Dec 2025 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764748324;
	bh=PkSljsV6RVoB89MLkLzt7Y4HjJ4H4NFmvkLxhyL1S3I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YBS4m5mQTvinN5S7TbM/mzs08+673SQbMHpuzZU2yl9h4FMyiKWxLUWMzSp8ytmKW
	 RZjmu83WnNXbDz5Lz2AtnYLBEvUG6tYYawkbMlzJspFKwMXFtooVTzgCvgK4X2NokA
	 yBTGzhgaa31OYuErcs6DeF0wiMvKeG21VRvf7Zb6xeFvdelPvWjor3gbvAUsHq0D2e
	 VYF74A3A0r370d4O/u7NvDmaZe05gQOClzE5ay+7s6rJ7LSVfc5b6GnqEZ1mXQd334
	 yQCo9M+A50eRPUIDODAWbhqJJpmvHwcZ1RTeVwl4fcbCNMWFLPUWnua3f+v7GWkyb7
	 AkU/jrfteI9hw==
Message-ID: <c8e4a0d2-0641-4e4b-b62a-9c92ec43b3cf@kernel.org>
Date: Wed, 3 Dec 2025 08:52:01 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: Nitin Joshi <nitjoshi@gmail.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251203034032.6018-1-nitjoshi@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251203034032.6018-1-nitjoshi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Interesting new feature. A few small remarks on the proposed
sysfs API below.

On 3-Dec-25 4:40 AM, Nitin Joshi wrote:
> Thinkpads are adding the ability to detect and report hardware damage
> status. Add new sysfs interface to identify the impacted component
> with status.
> Initial support is available for the USB-C replaceable connector.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  26 +++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 179 ++++++++++++++++++
>  2 files changed, 205 insertions(+)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 4ab0fef7d440..4a3220529489 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -54,6 +54,7 @@ detailed description):
>  	- Setting keyboard language
>  	- WWAN Antenna type
>  	- Auxmac
> +	- Hardware damage detection capability
>  
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1576,6 +1577,31 @@ percentage level, above which charging will stop.
>  The exact semantics of the attributes may be found in
>  Documentation/ABI/testing/sysfs-class-power.
>  
> +Hardware damage detection capability
> +-----------------
> +
> +sysfs attributes: hwdd_status
> +
> +Thinkpads are adding the ability to detect and report hardware damage.
> +Add new sysfs interface to identify the impacted component.
> +Initial support is available for the USB-C replaceable connector.
> +
> +The available commands are::
> +
> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
> +
> +This value displays device type and location of device with damage status.
> +For example:
> +if no damage is detected:
> +  No damage detected
> +if damage detected:
> +  Damage detected:
> +  Device: TYPE-C
> +  Location: Base, Right side, Center port
> +
> +The property is read-only. If feature is not supported then sysfs
> +class is not created.

Nitpick: s/class/attribute/ classes are standardized sysfs
interfaces living under /sys/class/ which this is not.

Besides the nitpick I'm wondering if we do not want to make
this a little bit more friendly / easy for software to parse ?

ATM this seems focused on a human directly reading
the output but what if we want some sort of automation,
like e.g. a Linux version of the Lenovo Vantage sw parsing
this in the future?

Note I've no specific suggestions for how to make this
easier to parse, this is just an observation.

Regards,

Hans


