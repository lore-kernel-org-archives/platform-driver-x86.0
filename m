Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604D84E8DE6;
	Wed, 14 Oct 2026 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981990; cv=none; b=f2He4KFUywQ4oExxfIHQyPtcg6NJiDrKZ3/yeTBqBORJrqen4Dah1gVcdNcOiZn1OEo9/0SctkBWrMhTYfJwzURS6ozyb0fLSijS1nszEZrl2DNNEm5bVpN8w6zwSQtK6oIbmhmoE5fvHQFIjZTgcu1qR2ZH50qyjPdiqI6uuXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981990; c=relaxed/simple;
	bh=FwIdmK/Fobi0USlDhQbtZ3+4sL6eKx+2lvg1PMayO44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GexdbUfbcd/QqtRWd1bkHizCrUgQdK8/v6DjxcTVAGRYka9ZpH935Dg4kTY6wyWbdmdYmjvpHy9XzTYdyU9ZXXsM1zn5casMGUD4xxtUps/aAgI5AYrsqqRWQBO2mVHCHd9SA6ugN3hZAEXWkU4+ZkOarxQbheMRF1zB1VBdhbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePhn/HY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePhn/HY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115A71F000FF;
	Wed, 14 Oct 2026 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981975;
	bh=Ulbr2YT3Sm148c2os6yQKC/cck5K4HaIPuoT7Ot2zmg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ePhn/HY/atReBXxmRXWskHsnp8UTYvuhBaY2k3eduWJc7cVJXGx/FsCs6mSnOubF1
	 uTeAioksM7puO3Yi8RlO5Gn24QN//ZcFuTMtDg0739tSQDyfOiftOJc/rn8iydAKCT
	 Zq/59MLWv6qVYAyiFq/niUWrIlqTQji0TtyFL9m6jRCPSx0CGG4c7X02B1wJNWwEcT
	 buKGoodJFcHZCk8x80hS/005YW1et3nrkXIiFfkNYRXLl4zsHwA+5RumjSCMYsiFNu
	 e+wM2fFbqPeLobMxj66wklnpoPntxrypFIyMSeijMEZPPh10SaLB1knxI3SznwvovK
	 JFNDvotHx6RXA==
Message-ID: <33d5b87e-9c79-4a8f-9ca3-f42f47b703d3@kernel.org>
Date: Wed, 14 Oct 2026 14:46:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] platform/arm64: lenovo-thinkpad-t14s: Adjust thermal
 trip with platform profile
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Kurt Borja <kuurtb@gmail.com>
Cc: sre@kernel.org, bryan.odonoghue@linaro.org,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 stephan.gerhold@linaro.org
References: <20261001181917.9367-1-daniel.lezcano@oss.qualcomm.com>
 <1eb6d74f-28c7-8f0a-4001-dfe717196836@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <1eb6d74f-28c7-8f0a-4001-dfe717196836@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 14-Oct-26 12:19, Ilpo Järvinen wrote:
> + more people.
> 
> On Thu, 1 Oct 2026, Daniel Lezcano wrote:
> 
>> Tie the keyboard thermal mitigation temperature to the platform profile
>> selected through the ThinkPad embedded controller.
>>
>> The EC reports Fn+L, Fn+M and Fn+H events corresponding to low-power,
>> balanced and performance operating modes. Use these events to update the
>> passive trip point of the "keyboard-thermal" zone to 49.85°C, 57.85°C
>> and 59.85°C respectively.
>>
>> These thresholds match the thermal mitigation temperatures used by the
>> platform for the corresponding operating profiles.
>>
>> Look up the keyboard thermal zone at probe time and locate the passive
>> trip named "keyboard-ec-alert". The trip name is used deliberately so
>> the EC driver can identify the device-tree trip associated with the
>> platform thermal profile without depending on its position in the trip
>> table.
>>
>> Initialize the thermal mitigation threshold to the balanced profile,
>> matching the default platform behaviour, and update the thermal zone
>> whenever a profile change event is reported by the EC so that the new
>> mitigation temperature takes effect immediately.
>>
>> Using the platform_profile API would provide a more appropriate interface
>> for exposing and managing these operating modes. However, while the API
>> itself is generic, the platform profile core implementation currently
>> lives under the ACPI framework. Making it available to device-tree based
>> platforms requires separating the generic infrastructure from ACPI,
>> which is a larger and independent piece of work.
> 
> So the only problem is that platform profile resides underneath acpi 
> namespace in sysfs?

That and that the module_init() for the shared platform-profile code has:

        if (acpi_disabled)
                return -EOPNOTSUPP;

I gave a talk about DT-ACPI hybrid mode for these laptops at plumbers:

https://lpc.events/event/20/contributions/2363/

The conclusions there where that:

1. DT-ACPI hybrid mode is interesting as an experiment and for reverse
engineering but not something we necessarily want in mainline.

2. We do however want to at least load the ACPI tables and make them
available under /sys/firmware/acpi/tables/ so that acpidump will work,
which is useful for improving the DT descriptions.

I believe there is consensus we want to do 2. Which means creating
/sys/firmware/acpi at which point we could just keep 

/sys/firmware/acpi/platform_profile[_choices]

there.

In hindsight it would have been better to have a firmware-type
agnostic place for this.

The question then becomes do we want to move this to
a firmware-type agnostic place with maybe a compat symlink,
or do we keep this as is ?

As mentioned I do expect we will get /sys/firmware/acpi/ on
these laptops even when booted in DT mode even if it is just
to expose the tables.

This means that we could keep things as is and future generation
Snapdragon SoCs for laptops are expected to eventually fully move
to ACPI.

Other ARM64 and Risc-V / Loongson laptops all seem to standardize
on ACPI.

So I think that just keeping this as /sys/firmware/acpi/platform_profile
is ok and we (I) need to move forward with always loading + sysfs
exporting the tables which will allow us to expose
/sys/firmware/acpi/platform_profile even when booted in DT mode.

I realize this will be a bit weird path to use in DT mode, but
it should work fine and these really are ACPI laptops booted in DT
mode, so I think this is fine.

Regards,

Hans


