Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2CF44A3ED;
	Thu, 27 Aug 2026 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834969; cv=none; b=Dl+rRTa+XVEaU8kgcD7vASDPV++Qi1iO3SAPSlOPJGdg+FMiApxDHoqyQ6C/lXAiJY5R/hVin+u6d0A/mD2P2DNO6R9xWKkv4D0H+0n6ni4VMz1cmtUR8rhTqvVT2luEWmQFASGBJxa5b7PMBT3TmqH6L1NTLbAmeAAi7Qj+sYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834969; c=relaxed/simple;
	bh=WccHgyxAi+nBOE6XPI0X71OtXCwAStMIRl9JJFqDmUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpuy0c3iaQwdX4hXApcxU3BabSqtS8Sm2e+EEJPVo+Azaa24ZAXrqZDsBAKzIH07OzXJcaZVVV28stYFaeQY0FMMilfOYPiQLPIESjAD4dltHMMufEpI8sBYh2rVj5Bi0pMeIVhnpn3k1YJ1mGcYEkf/Po7BRg01CHDb6Qr+hC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjgXa3Bk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjgXa3Bk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1A31F000E9;
	Thu, 27 Aug 2026 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787834950;
	bh=HyDreMhM8N9JTmhSp9B7DPAqPwJUx4KyypUPXl0B5YU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UjgXa3BkL/lES3mcrKXQAccwqIUeoCH9pX7zqiI6VZCrau8vdTYwIvyomxGPkMiIG
	 rw3+KJz59pIgcnJv+BqBb5uUDUixzeiGhWXzPdpxYAXrFjE/g/v7pLNSCr5CDmw71T
	 x+B8nfrFBoEEqmqiY++UdyZvOlDGOQNLLnf62o7cqSBiBK3dgEmF24oShD9B9Voq/I
	 a0i0UA11p96DWClV+uwXMmXq6tLQdEUNrfZ8UkL0kRKsEJTochM9QlXbvIM2pMFykb
	 aS1yEduMnZoinNnIU/pMzToje2BPPfUWWyUO3rObHyR9NZPOKVHBAiZqIm1okYgVYN
	 isNLUwzK1ZBlw==
Date: Thu, 27 Aug 2026 13:49:05 +0100
From: Lee Jones <lee@kernel.org>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andriy.shevchenko@intel.com, v.vitovt@gmail.com
Subject: Re: [PATCH v8 0/6] Enable cameras on Dell Latitude 5285 2-in-1
Message-ID: <20260827124905.GH770273@google.com>
References: <20260826112452.13539-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826112452.13539-1-tchatard@gmail.com>

On Wed, 26 Aug 2026, Thierry Chatard wrote:

> This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
> cameras on the Dell Latitude 5285 2-in-1 under Linux.
> 
> Per Documentation/process/coding-assistants.rst: this work was developed
> with significant help from an AI coding assistant (Claude Code, by
> Anthropic). I used it to help reverse-engineer the ACPI/TPS68470 bring-up,
> iterate on the board data, and draft these patches. I have reviewed and
> tested all of it on the actual hardware and take full responsibility for
> the result.
> 
> The series spans two trees: patches 1-4 target platform-drivers-x86 and
> patches 5-6 target linux-media. All six are needed for a working system.
> 
> Changes since v7 (addressing Andy Shevchenko's review):
> - Patch 1 (intel_lpss): rework the quirk to be data-driven. Match the
>   machine by DMI and the device (INT3446) by ACPI ID, carry
>   QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data, and apply it to
>   the per-device info in probe, mirroring the PCI counterpart. Drop the
>   duplicate spt_i2c_info_ignore_conflicts struct and the machine-specific
>   dev_info(). Fix the include ordering.
> - New patch 2 (int3472: tps68470): split the int -> unsigned int loop
>   counter change out of the clock-consumer patch into its own cleanup.
> - Patch 3 (int3472: tps68470, was patch 2): trim the commit message; no
>   code change beyond the counter split above.
> - Patch 6 (ov8858, was patch 5): use a C99 initialiser for the ACPI match
>   entry and drop the comma after the sentinel.
> 
> On the open question from the review: I kept the per-table
> gpiod_add_lookup_table() loop rather than switching to
> gpiod_add_lookup_tables(). There is no gpiod_remove_lookup_tables()
> counterpart for the error-unwind path, the board data uses a counted (not
> NULL-terminated) array, and the singular form is what the rest of the tree
> uses, including int3472/discrete.c.
> 
> Earlier changelogs (v2-v7) are in the v7 posting:
>   https://lore.kernel.org/all/20260819140107.1329091-1-tchatard@gmail.com/
> 
> Tested on Ubuntu 25.10 (kernel 6.17.0-22-generic) and Ubuntu 26.04
> (kernel 7.0.0-30-generic). Both cameras working in Zoom, Chrome, and GNOME
> Camera via PipeWire. Also independently tested on the closely-related Dell
> Latitude 5290 2-in-1 (same IPU3/TPS68470/OV5670/OV8858/DW9714 stack) by
> Vitalii Tytskyi:
>   https://github.com/vitovt/dell-5290-camera-kernel/tree/master/patches
> 
> Thierry Chatard (6):
>   platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
>   platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop counters
>   platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
>   platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
>   media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
>   media: ov8858: add ACPI device ID INT3477

What command did you use to create this set?

Where is the diff?  Walking through each patch to see if there is
anything I should look at is suboptimal.

-- 
Lee Jones
