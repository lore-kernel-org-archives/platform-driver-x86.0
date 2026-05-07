Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7F747A0DC;
	Thu,  7 May 2026 19:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181943; cv=none; b=uNUllh0c/UIfagzbxIWufi2aRBlJT8ok9gN0kdN44DHUTOshgPpA+BwRYEYz9x6Cv2vcbTZLxF237XGdMI70K05h8qwC6udvbKWTKHOBu5pBwJohoAeYIh0cYnn7SZ/IwfWCx8E5eObDHSoubZolfM4FJrX+Lge/3mjO0I38yFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181943; c=relaxed/simple;
	bh=HeDazWGAVmaakVM0nGv8u4k/+X8f6WSYNfDJRTRi30I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N6FJ757Cqiut8G8AeJbQuEGkGakr64q4mo3Ribiv8Gc4L+CLylILBG11A7PBUWQPsWJkarW0wN9gv85UikhNGjJPuo6yTzSamucgrrewAqfTqDwX1ywK83gP+VPg/nFDwnC+EZCK1yQTRe5PivVeG8HJ6xz4l0hymr+kEfT/eb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NI7zLl8b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NI7zLl8b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EB9C2BCB2;
	Thu,  7 May 2026 19:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778181942;
	bh=HeDazWGAVmaakVM0nGv8u4k/+X8f6WSYNfDJRTRi30I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NI7zLl8bFQKQ00Wn/0v5y6l3umEM4daPrH+RlZj/6NkNBlk1UKXB8T6HfkS5ehmLV
	 +8BCCJdO3Lh0kgGzpT/+ZrAb6E5LjLF3VV+seTWSvtktgTlzXTKelfTDKXRr+FFPY1
	 WCBIKGrFrzCM506ysVc3u6iHU9g14RPun7tOctyGvUL/mylP0twcVm5LU83wmDy693
	 KIzDDaHJew7JfgTtpXJM3GW4qeX3L8aqyMx5ZbleukzdbTaAJ4QNW6s7mDQnW8bLZ4
	 lyVfKYXOX1DK7R1WPUzY9job7VyMC6bCwaHMYBhdI3vX9bBJSyRasWaFbdwdESBxPk
	 NvY5DeoE/4wiQ==
Message-ID: <f06e974d-a8ab-4da6-8f70-cac400d8ecdd@kernel.org>
Date: Thu, 7 May 2026 14:25:40 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: hfi: Support for ranking table versions
Content-Language: en-US
To: Krishnamoorthi M <krishnamoorthi.m@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: Shyam-sundar.S-k@amd.com, perry.yuan@amd.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507190926.1211726-1-krishnamoorthi.m@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260507190926.1211726-1-krishnamoorthi.m@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/7/26 14:09, Krishnamoorthi M wrote:
> Add changes to support new ranking table version. Version 2 of the
> heterogeneous ranking table provides static CPU rankings. Version 3 adds
> dynamic ranking table support on newer AMD platforms. These changes ensure
> that platforms still reporting version 2 continue to function with the
> existing static ranking path, avoiding regressions on older hardware
> that does not supply a dynamic ranking table.
> 
> Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/platform/x86/amd/hfi/hfi.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
> index 83863a5e0fbc..e0ebcb0c4acd 100644
> --- a/drivers/platform/x86/amd/hfi/hfi.c
> +++ b/drivers/platform/x86/amd/hfi/hfi.c
> @@ -33,7 +33,8 @@
>   
>   #define AMD_HFI_DRIVER		"amd_hfi"
>   #define AMD_HFI_MAILBOX_COUNT		1
> -#define AMD_HETERO_RANKING_TABLE_VER	2
> +#define AMD_HETERO_RANKING_TABLE_MIN_VER	2
> +#define AMD_HETERO_RANKING_TABLE_MAX_VER	3
>   
>   #define AMD_HETERO_CPUID_27	0x80000027
>   
> @@ -158,7 +159,8 @@ static int amd_hfi_fill_metadata(struct amd_hfi_data *amd_hfi_data)
>   		dev_err(amd_hfi_data->dev, "invalid signature in shared memory\n");
>   		return -EINVAL;
>   	}
> -	if (amd_hfi_data->shmem->version_number != AMD_HETERO_RANKING_TABLE_VER) {
> +	if (amd_hfi_data->shmem->version_number < AMD_HETERO_RANKING_TABLE_MIN_VER ||
> +	    amd_hfi_data->shmem->version_number > AMD_HETERO_RANKING_TABLE_MAX_VER) {
>   		dev_err(amd_hfi_data->dev, "invalid version %d\n",
>   			amd_hfi_data->shmem->version_number);
>   		return -EINVAL;

