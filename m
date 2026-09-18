Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3693C3A9013;
	Fri, 18 Sep 2026 07:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717098; cv=none; b=mo2gK3dy+V20Vxs3ePmD7+afmxVrrBa9H+utMGXLbsEbF8DQqPHc9jjVIDnKypD3lAp1V7tyqOK2fBHXch6vOVOOrqRc/1Xx72c4r/JEOa2Qn7gpyUp8gZ/1uh0j4EuxiO2Nm5zvCjRu+/mSe6mdHruPtRIVqxeA1llB0WGiW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717098; c=relaxed/simple;
	bh=7BrrV7AehTnGjC9gSf58u46X8TAtQftac1nVa0bTp7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFyZaj0uzm1NmMp8RXrN9G3v6j8pwJRcmCbICuz6yFTLdZuU2GmVqx+XbIwfdCU5BJaV26d/NubmQwp+awWYcvUlodqaowwv2P0iVQaju6L2ob/9CtC/0BUPW2wtG8V5YQ0nA4EjL9TVbYxYoNEG+Ma+xb+h6J9IvE6+WYX1Gz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHeeebV1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHeeebV1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD261F000FF;
	Fri, 18 Sep 2026 07:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789717088;
	bh=503mo/X0Uj5uw7WFqHnkSpePuvYL7gWtidtTQRcnQHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QHeeebV1yNVsFuaxSU6dENXr0azq8pARsPLH/eFvuUgi9AMbd4YT0JJukmyJdvUSe
	 2RD2zY6msDOydpaLlq2gPKvm7d9E2GMv8jlufMM4n2rKNVRaMfnphs455edR2DZ82+
	 oTruau9O/oKz09uWnn7BUQcC9HdOQ7qfzDtjW9zmJAOyTb1aQ2XnfHKVH6ULEZgU1A
	 FMjEUmRa9X7FIvCa3nigJRYPD4GxPehBs1R2Oyb6V/UrenSUoAvOfE/v1BDVQdUOzt
	 5nQxQ2iSXMTTh4lEBa3pFNTZOQsRfcpOthc2kPO12ulxLZnOdwg7R0HZzwgS5CICx4
	 tMESEjzBBccUA==
Message-ID: <2384d8f5-106c-4cbd-a119-62d923725bf7@kernel.org>
Date: Fri, 18 Sep 2026 09:38:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform: Enable ACPI WMI and ASUS WMI driver for
 ARM64
To: chipang_kao <prozac2734@gmail.com>, ilpo.jarvinen@linux.intel.com,
 bryan.odonoghue@linaro.org, W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 chipang_kao <chipang_kao@asus.com>
References: <20260917021055.8029-1-chipang_kao@asus.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260917021055.8029-1-chipang_kao@asus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Sep-26 04:10, chipang_kao wrote:
> This series enables ACPI WMI core support and the ASUS WMI platform
> driver on ARM64 architectures.
> 
> ACPI WMI is not limited to x86 platforms. Modern ARM64 laptops and
> platforms have adopted ACPI WMI to expose vendor-specific features
> such as hotkeys and fan control.
> 
> To support these devices:
> 1. Removes the strict 'X86' dependency from CONFIG_ACPI_WMI.
> 2. Updates the ARM64 platform driver infrastructure to allow
>    building the ASUS WMI driver without duplicating source code.

This cover-letter is missing some important information, namely
why do this.

Yes ACPI / WMI is used on some ARM64 laptops, but AFAIK all of
those are currently still booting through Devicetree since
the current generation ARM64 laptops is missing various info Linux
needs in the ACPI tables. So for a fully functional system 
Devicetree is necessary.

I think making the generic WMI code availabe on ARM64 is good
and this is something which Armin has already been working on.

But I wonder what the concrete use-case is to build the ASUS WMI
driver on ARM64.

Questions:

1. Has this been tested on an actual Asus ARM64 laptop or other
   ARM64 device? 

2. On which laptop/device model ?

3. How was this tested, how was the laptop booted; and does booting
   it this way lead to loosing any other functionality

4. Were any other kernel patches used during testing?

As for patch 2/2 I think that if we want this the driver should
simply be moved to platform/wmi .

Regards,

Hans



> 
> chipang_kao (2):
>   platform/wmi: Remove X86 dependency for ACPI_WMI
>   platform/arm64: Enable ASUS WMI driver support
> 
>  drivers/platform/arm64/Kconfig  | 46 +++++++++++++++++++++++++++++++++
>  drivers/platform/arm64/Makefile |  2 ++
>  drivers/platform/wmi/Kconfig    |  2 +-
>  3 files changed, 49 insertions(+), 1 deletion(-)
> 

