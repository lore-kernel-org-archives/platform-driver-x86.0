Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FBB41834A;
	Tue,  1 Sep 2026 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275355; cv=none; b=gAwd5h9OJSclo/JSjjGtgABLGFyK2qg0hrQz7zLV6Ni0295wMNQ5T50LbyqBIQZ1mIHOpbcZj5ZxmO00MXbsOCsLtS5D5qOPHaC1E1JoyWeDyaXULVTDPdcT/ZBSAGZhDK5ft4RRlEgiaShxxaViNkUtSFAolCSFldeZuoyIkeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275355; c=relaxed/simple;
	bh=qdZIrGsYtpKF0jD6D3TXpSKXSMansKwbWqNgyncJx1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q7BFurWmvBGFeDU1SWR1wzz3+eY4WkF5vajNkduznGi1o3FlFJNGf7m5K195LdaGoc6z+3Gn4N28rbbmrNYEzZNl/1W4YPg2l5TH/bWdWUtraN+s0nCkSmyaag1mgts8OuDylfUZnsn6Ekfk/yfrxOIpv+IBLLqpLKUfiQAyg9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8GDKfzM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8GDKfzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451A21F000E9;
	Tue,  1 Sep 2026 15:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788275353;
	bh=cxCzQVp3dn2zkb9xI9KYVvtk2KgN++DYQbd3xIdl0nM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P8GDKfzMin3+VLBtqOnaBmxyPho65vXmoFCR2y/wj5kftoxAMOEJ7SBrOsYE559gR
	 xpc6ZstKjxYfZD+T8SezOGj74QX7OA3glneUFH0MKp9z841k0QRp7rqFWPd+GHFmNn
	 RnvZGtSMyi/duDz2GF6V6AIv1KkJKIHBXT7F4VUOuBcX+O3j+6u+SmctddH36mJuH3
	 eR4nKvYtAJBDQv28Hn5KQjL5ArNxUkT+ODscKQG7HTtnorcBiB5T0ORpsKflHHibas
	 5yNN37DVmVrhwcseYiv6Bk+0tdY8d5/95BgquumKKbEkKHfGJX7Sh0neYlg9tauDxh
	 It7GpkvWlfY4w==
Message-ID: <fe3427a3-1771-4ae0-9043-8576640f5e45@kernel.org>
Date: Tue, 1 Sep 2026 10:09:12 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] platform/x86/amd/pmf: Clean up undesirable function
 outlining
Content-Language: en-US
To: Rong Zhang <i@rong.moe>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Sanket Goswami <Sanket.Goswami@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 10:02, Rong Zhang wrote:
> The amd-pmf driver is notably bloated due to undesirable function
> outlining and linkage. Simple and dump helper functions as well as
> wrappers should really be static inline functions instead of global ones
> from the very beginning, or else they are prone to the overhead of
> function outlining and linkage, which bloats themselves and their
> callers.
> 
> The series converts all these helper functions and wrappers into static
> inline functions, and shrink the module (!CONFIG_AMD_PMF_DEBUG &&
> CONFIG_AMD_PMF_UTIL_SUPPORT) size by 1472 Bytes (GCC 16 -O2):
> 
>        text       data        bss      total filename	(before)
>       26810      31672       2768      61250 amd-pmf.ko
> 
>        text       data        bss      total filename	(after)
>       26046      30964       2768      59778 amd-pmf.ko
> 
> As for CONFIG_AMD_PMF_DEBUG && CONFIG_AMD_PMF_UTIL_SUPPORT builds, the
> module size is shrunk by 1187 Bytes:
> 
>        text       data        bss      total filename	(before)
>       34593      45500       2784      82877 amd-pmf.ko
> 
>        text       data        bss      total filename	(after)
>       33988      44918       2784      81690 amd-pmf.ko
> 
> This should also optimize the performance a little bit theoretically,
> though it's probably not very important on modern hardware anyway.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Rong Zhang (5):
>        platform/x86/amd/pmf: Inline !AMD_PMF_DEBUG stub
>        platform/x86/amd/pmf: Inline simple helper functions of Core Layer
>        platform/x86/amd/pmf: Inline simple helper function of SPS Layer
>        platform/x86/amd/pmf: Inline simple helper function of Smart PC TA interfaces
>        platform/x86/amd/pmf: Inline wrappers of ap{mf,ts}_if_call_store_buffer()
> 
>   drivers/platform/x86/amd/pmf/acpi.c |  76 +-----------------
>   drivers/platform/x86/amd/pmf/core.c |  22 ------
>   drivers/platform/x86/amd/pmf/pmf.h  | 150 +++++++++++++++++++++++++++++++-----
>   drivers/platform/x86/amd/pmf/spc.c  |  15 ----
>   drivers/platform/x86/amd/pmf/sps.c  |   5 --
>   5 files changed, 131 insertions(+), 137 deletions(-)
> ---
> base-commit: 9ffed84a24d60ec506d8961fe138f0baa92fdbd0
> change-id: 6f1861db-amd-pmf-fix-outlining-204546e884cf
> 
> Thanks,
> Rong

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
