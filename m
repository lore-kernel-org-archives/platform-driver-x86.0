Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D378E50B8D4;
	Wed, 14 Oct 2026 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983453; cv=none; b=Og58gzaKSNwTDoS+weyq45bT9Lt2AG5YdpNlLSse3DIiXwlYCKOvg7stt2SMi3dBVsfELe1JINzIObl4oDKHbVoPSNny91EsCu1Onyl3sO/QgYzPmIQgIcLznStBPXRQSOLFHZrEwfyPhjnBih83OFnT1MMZ4yD7M+h4CeMCSFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983453; c=relaxed/simple;
	bh=IlMfouMOxpndHSvha7zoPut9EGbvEOesTefJMEaBFr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2SSHm9y8yaaCOgKAIP39AGHI2AMP+o/vZmnjtaIKolCrm2cUBBPgPRO4+7ASXP8NMz6fzl3VaPXbNSgJUpA7ulmQoruRj76unRAK2oG8/QzpwXUx62XImoEVEOXpoPZTNPK2feBrpiNtCKY48fC3+Zr8jj3y6MdN0SlbYa61d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhBcmTAV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhBcmTAV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBF81F000FF;
	Wed, 14 Oct 2026 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983451;
	bh=Esy1ty/NXoqM8qagD3dl2CUQc5Ou95Cl8V9mfrO5p3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XhBcmTAVPCmm0Ad7+szs7uERJLIa1v7dU6Qy2w3pd67UQecln2VGZYyOwYhG/5WuM
	 MSlDNlqJIZCVnY5vvQdnXrmPJ8ngAEyoIWMcf3Zvp/kXfAEcZKfjeUm2Q2eA8Ev7q/
	 TZP+tu332+INfQI5GZB5KOTDUyGGx3LioSBI3fjFXFTL8EtdvS8waFIVmomUWlZH3t
	 c7OWqI7IJXW8SlJrIZ/umNBwlEuznId+cEVUx3/JnAXUxqCDVDDuakE+corqhvuu8F
	 mAPn04HfSJgxCLlARMRmk+nm6y7HQw2QNYdII2WgdQzHQ3f7gOR8xVU2dS8jdiSxvS
	 3MNRVmtqg7RZg==
Message-ID: <4d396361-6dbb-449f-9849-c4c54bdbf568@kernel.org>
Date: Wed, 14 Oct 2026 15:10:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] platform/arm64: lenovo-thinkpad-t14s: Adjust thermal
 trip with platform profile
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Kurt Borja <kuurtb@gmail.com>
Cc: sre@kernel.org, bryan.odonoghue@linaro.org,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 stephan.gerhold@linaro.org
References: <20261001181917.9367-1-daniel.lezcano@oss.qualcomm.com>
 <1eb6d74f-28c7-8f0a-4001-dfe717196836@linux.intel.com>
 <36418d4e-ba34-4c31-b676-1e636cfb8a7a@oss.qualcomm.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <36418d4e-ba34-4c31-b676-1e636cfb8a7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 14-Oct-26 15:03, Daniel Lezcano wrote:
> On 10/14/26 12:19, Ilpo Järvinen wrote:
>> + more people.
>>
>> On Thu, 1 Oct 2026, Daniel Lezcano wrote:
>>
>>> Tie the keyboard thermal mitigation temperature to the platform profile
>>> selected through the ThinkPad embedded controller.
>>>
>>> The EC reports Fn+L, Fn+M and Fn+H events corresponding to low-power,
>>> balanced and performance operating modes. Use these events to update the
>>> passive trip point of the "keyboard-thermal" zone to 49.85°C, 57.85°C
>>> and 59.85°C respectively.
>>>
>>> These thresholds match the thermal mitigation temperatures used by the
>>> platform for the corresponding operating profiles.
>>>
>>> Look up the keyboard thermal zone at probe time and locate the passive
>>> trip named "keyboard-ec-alert". The trip name is used deliberately so
>>> the EC driver can identify the device-tree trip associated with the
>>> platform thermal profile without depending on its position in the trip
>>> table.
>>>
>>> Initialize the thermal mitigation threshold to the balanced profile,
>>> matching the default platform behaviour, and update the thermal zone
>>> whenever a profile change event is reported by the EC so that the new
>>> mitigation temperature takes effect immediately.
>>>
>>> Using the platform_profile API would provide a more appropriate interface
>>> for exposing and managing these operating modes. However, while the API
>>> itself is generic, the platform profile core implementation currently
>>> lives under the ACPI framework. Making it available to device-tree based
>>> platforms requires separating the generic infrastructure from ACPI,
>>> which is a larger and independent piece of work.
>>
>> So the only problem is that platform profile resides underneath acpi
>> namespace in sysfs?
> 
> Yes but I have a series I'm about to send decoupling the platform_profile from ACPI

Ah nice, as I mentioned in my other reply in this thread that might not
be strictly necessary, but long term decoupling is probably for the best.
I'm looking forward to your series for this.

Regards,

Hans

