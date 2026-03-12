Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73D6375AA8;
	Thu, 12 Mar 2026 21:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351914; cv=none; b=h9/wQmeqxCG8qZ/nyLSRe/3OzNSjIFrFbjYlE6BSVm0sKQKdAcNP1o938mBShG9pTzAHeqrKNPh0k2BZD30pYcXyAzg+X2zEp9H5k1VSh9euicDtECD51HrRVjsNQ3FBj5x4ztfWbcKJPgeDfrMY799iBtTOn262vn/wizy4/68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351914; c=relaxed/simple;
	bh=DiYzzjCiSvjoXjlbKneQgG6niBoEYaqu6K52N7j9/Hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djtkm0r7htUGC7ohlhewvPo7cV9HnMOUwJd6rvn/sGz0H6fTvwMvNL1lo78ylOfu2pjvLjBFufC/Y/toR1rcvuBfHqaA/8ORjABWmO/LlCNUSDxIJhf8d2qUpcP3l9Mm0c3Q3qedrteF6vINo5X3GWxtqOSFeJxfKB9PgWOatZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsZSo/A8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsZSo/A8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE6AC4CEF7;
	Thu, 12 Mar 2026 21:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773351913;
	bh=DiYzzjCiSvjoXjlbKneQgG6niBoEYaqu6K52N7j9/Hs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fsZSo/A8bN1Keb2iGUN2XKyZU36MbxA5gRj7/g8p8FS1fSNDM1U+siUadb+e9Sk+7
	 AHhZNRd7r9T48ELVK+Hbzw68lX+T1YvrOqJ1f8psg+BknpxxSj/fonoJ2cP0zFGe7F
	 Z+mm0yYNUbIYDhYpAbmcidEgE7pAvAUFzjsdF/Xu9SV0bnJzqkh1LvWoFQQTyUzehD
	 DnH60BsyjH3hI81kPJ+UyAPE/K2N9ToA9AUoqTThk1DXshDx7kDWcT64Eez4MkI1hQ
	 Y3Uk9Yr6H9lNce8y81AhONDOP4d+P1ZmBF/DcyJ7KatNVnT8ZNTjeGo7HSqQGcrE4n
	 uOHxFAjDb0/3w==
Message-ID: <0bbbc939-7f3b-4f68-92ee-ed5ac32f07d1@kernel.org>
Date: Thu, 12 Mar 2026 16:45:11 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add DMI quirk for ASUS ROG
 Flow Z13-KJP GZ302EAC
To: Matthew Schwartz <matthew.schwartz@linux.dev>,
 Denis Benato <benato.denis96@gmail.com>, Hans de Goede <hansg@kernel.org>,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312212246.1608080-1-matthew.schwartz@linux.dev>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20260312212246.1608080-1-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/12/2026 4:22 PM, Matthew Schwartz wrote:
> The ASUS ROG Flow Z13-KJP GZ302EAC model uses sys_vendor name ASUS
> rather than ASUSTeK COMPUTER INC., but it needs the same folio quirk as
> the other ROG Flow Z13. To keep things simple, just match on sys_vendor
> ASUS since it covers both.
> 
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>

Nice solution to this.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/platform/x86/asus-nb-wmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index a38a65f5c550d..b4677c5bba5b4 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -548,7 +548,7 @@ static const struct dmi_system_id asus_quirks[] = {
>   		.callback = dmi_matched,
>   		.ident = "ASUS ROG Z13",
>   		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
>   			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Flow Z13"),
>   		},
>   		.driver_data = &quirk_asus_z13,

