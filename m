Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB1A48593A;
	Mon, 21 Sep 2026 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989963; cv=none; b=jwUjEZHpn1Cy6Xje4+PTT0QYxIMjUHt8RSF2uHMmX1hBaZ693v1/ESc4F45bEPj3xDo3XrQuuykKsHPv2oOoi3byyvH35QlzQhMdGtg1ULRlpjsUmKyXfasSMpoA/UCcqwpUGPUZXW3AB3L0nscIWJXTHWDFMrwcqgHZQKxC/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989963; c=relaxed/simple;
	bh=/adRi5bDzLLQyCvGNnyrZQWAsY8YgXE6SFZ7sUfceS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBW2daq3JOvvNLjC+tCCw3rInWQZoYgCmSpxVB+UA+2QGRy4kpjXKaVonBdTulwEPmYAfh+m7uwFX7L9Jv144mhIWjrUWeAa4jTQtrVv2G7F/qc2kn3ocgsfbWQxRrQzUgG3zFdmQK7TR5w82lO5cO4ZTIHOcLDong32onY8iso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8AMelli; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8AMelli"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F321E1F000FF;
	Mon, 21 Sep 2026 11:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789989960;
	bh=vQby94NzMPaPoZyxs7AnQ8vDfmu6KTXWzWVyEKm7s5A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=F8AMellioMREvj2Gh1jqNdxRYnqtSbarXI7+Ne8CD1rQi80gtcXlrk3/j6VtFDaCD
	 rAn1fj79PBVHMUpNIM/Caw2KHc731T78hb349sHlRZFkDL5SahQcHvBa/wEo2Sks7I
	 E9Vgswf4ikKv+pAUo5T/dqOWw3zUIi5piqp4UgDccW0JPtdso4uHfOjl5sz4U93oND
	 EArj2fB3R7sC+fvFLpVdz8Yj8roOoaDmEdIHMkuqY6RF8ZQHJFU0UyXOJJc1j90dNq
	 Petyy4CRiCNnI/QkzE1cKYfnS5eccyiNRvLVBUIgh6yfjdM/bcjOdCAN1kglH3BlLh
	 j/+PaUKGZJAaw==
Message-ID: <ee3735b5-6f56-4b88-a582-5bb0aaf3eda8@kernel.org>
Date: Mon, 21 Sep 2026 13:25:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform: Enable ACPI WMI and ASUS WMI driver for
 ARM64
To: chipang_kao <prozac2734@gmail.com>, bryan.odonoghue@linaro.org,
 ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <2384d8f5-106c-4cbd-a119-62d923725bf7@kernel.org>
 <20260921093339.261306-1-chipang_kao@asus.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260921093339.261306-1-chipang_kao@asus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Sep-26 11:33 AM, chipang_kao wrote:
> Hi Bryan, Hans,
> 
> Thanks for the review and valuable feedback.
> 
>> On Thu, 17 Sep 2026 15:30:00 +0100, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
>> Thanks, but there's already a series to this effect under discussion:
>>   https://lore.kernel.org/all/20260724025959.142826-1-W_Armin@gmx.de/
>>
>> I only now notice the second patch is not covered by Armin's series.
>> But this duplicates Kconfig entries.
>>
>> I suppose the best approach would be to split drivers/platform/x86/Kconfig 
>> into two and source the generic one here.
> 
> Thanks for pointing out Armin's series and the Kconfig duplication issue.
> I had review Armin's series and make sure not to duplicate work. Regarding 
> the driver location/Kconfig split, I agree that avoiding Kconfig duplication 
> is necessary, and moving/refactoring the driver directly under platform/wmi 
> (as Hans suggested below) seems to be the cleanest path forward.
> 
>> On Fri, 18 Sep 2026 09:38:04 +0200, Hans de Goede <hansg@kernel.org> wrote:
>> Yes ACPI / WMI is used on some ARM64 laptops, but AFAIK all of
>> those are currently still booting through Devicetree since
>> the current generation ARM64 laptops is missing various info Linux
>> needs in the ACPI tables. So for a fully functional system 
>> Devicetree is necessary.
>> ...
>> Questions:
>> 1. Has this been tested on an actual Asus ARM64 laptop or other
>>    ARM64 device? 
>> 2. On which laptop/device model ?
>> 3. How was this tested, how was the laptop booted; and does booting
>>    it this way lead to loosing any other functionality
>> 4. Were any other kernel patches used during testing?
> 
> Regarding Hans's questions:
> 
> 1. Yes, this has been tested on an actual ASUS ARM64 laptop.
> 2. This specific model has not been publicly released yet, so I
>    cannot disclose the exact model name or marketing designation
>    at this stage. However, it is an upcoming ARM64 platform 
>    featuring ACPI firmware.
> 3. The laptop was booted natively via ACPI firmware (UEFI). To>    verify the WMI functionality without modifying the base
>    distribution kernel, we built and tested the modules (`wmi.ko`,
>    `asus-wmi.ko`, and `asus-nb-wmi.ko`) out-of-tree and loaded
>    them using `insmod`. The driver successfully bound to the WMI
>    devices exposed by the ACPI tables and functioned as expected.
> 4. No additional kernel patches were required. Note that we have
>    dropped patch 1/2 from this series because Armin's patch series
>    already removes the X86 dependency from drivers/platform/wmi/Kconfig.
>    Since Armin's series is currently under discussion and not yet
>    merged, our v2 will focus solely on moving the ASUS drivers to
>    drivers/platform/wmi/asus/ while depending on the WMI updates.

Thank you for your answers and this all sounds good to me.

Based on this I've no objections against this series.

Regards,

Hans


