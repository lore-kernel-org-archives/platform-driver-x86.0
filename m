Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFA419E98C
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 17:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757957024; cv=none; b=NlmmhspwbOma+wDNMj0j6jxaTOrj05CrD0shtBwCKBce2akL62xGhHeL9OdxG4Zg8huTbu5eLKathtcvAil/QK9u0fmTVjvtkdPCSd1PV1wcysdhxGDG0arAjrYPSjgJOeXFCyr+uQis6E8S1646gbTOP86JBT70p8sVGUhYeZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757957024; c=relaxed/simple;
	bh=JMjch3ZPOkePzriTe/mfAj6uY92Jf7f+7Cq58BOMwXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKhi14pzfUyKB2jnJhaPwnxYvLt8UkinO9XOfZ7V2cNuuQGTmtp0AEwjUdV4gXFLCUNHbkw1lkxR8QP/TfEQvfLGpVxSWEVng5+HV2Io2wZmm13IzHi4Xv4QykUU6YUP/e8kBxzSev66bBp2R7EsO9QRpIdKIVBvJgVRQxeCtZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4pFIgEn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4pFIgEn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17D9C4CEF1;
	Mon, 15 Sep 2025 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757957022;
	bh=JMjch3ZPOkePzriTe/mfAj6uY92Jf7f+7Cq58BOMwXA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S4pFIgEnHVTGVjSprQ/QTfBlDrJaEBQ1fn3VE+IEIb/VJaOUOqxU7gCNzla/xxFPd
	 fCBKSz2ceyGO67vTsuoNu1ngRNdWBSqnjsCksWnbVaxqZ2f1XjCOHgB4F1cDB7cUo/
	 TwmcA6ltVoNEtsu8Yddd2vfEoo1f4TtWNnUgmuo6IPTP9vDbIYTIJ1NDdCZ53YzeMF
	 6tPhKDIRHMYEAYcndGyF8AuYLm57IZjp35Tki/abQg9apVqbYTZccZEUG4UZYS4j/6
	 9x9fP17JwGvO1POdRikWTRWCc+ZB+aGBzgRtQE/+NT3hf9Wo2gOtarmsqY/yjuUUZR
	 9wlPT2sEmMXSg==
Message-ID: <cb53bd50-45e0-4b1a-b937-105f93b451be@kernel.org>
Date: Mon, 15 Sep 2025 12:23:40 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Support new ACPI ID AMDI0108
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20250915090546.2759130-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250915090546.2759130-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/25 4:05 AM, Shyam Sundar S K wrote:
> Include the ACPI ID AMDI0108, which is used on upcoming AMD platforms, in
> the PMF driver's list of supported devices.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/platform/x86/amd/pmf/core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index ef988605c4da..bc544a4a5266 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -403,6 +403,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>   	{"AMDI0103", 0},
>   	{"AMDI0105", 0},
>   	{"AMDI0107", 0},
> +	{"AMDI0108", 0},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);

