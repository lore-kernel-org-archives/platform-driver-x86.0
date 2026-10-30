Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369637;
	b=qwC9qE0wnF3xpPoCQD5/pEudVkspClAwoLa8A30NWYf2jdu/D2pwVArwqv41Kk3sku1O
	 6Yl6YnluQQHyvpbN3sJ8l4K9nGH2fuoyJzkMsrSqegZ95HoEfICjWOegVjsav8s2cLtge
	 Iq5wT2LFeuBbikiMH9039lmzjmSKd9IXDhouVDdey+sgca+77pLnqCvIUq/prGD6pVt3D
	 xd1ShzF8jvm5SJpIVmoO0Z6CHK8SZyvUVlrJx9YKpLUNKANWtmzLDBfElSRWkWmM8zios
	 wYA8KG/oraVZjz7iBdLRIUVg4LF2gQ7wlAEFgWfg3Wv94jenKWxseaRpEj7Bs2B+zOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369637;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=TNsSVNLBeomaAlCQSkZboyICmvNvVMg7m1kWjt7v5rg=;
	b=E8ALnvIpanNN1CBZy8Ogi3gZHaYmVZ4IWoNfHSlTCivve4cGKRsOS5VPI1QYQWu1+ZWM
	 jgL2YsVXCNtSrfC1Pxwe4MAsNBgAnurB230P1UgqQxDM9tPS56lwFjkyQkb0sAV7tT2oj
	 RIPHc3So7CsqyXmg00WBe20S4YKo7tHSzzrvaISgTHyqJnIiURhsZaU/4YIEwHcsfmOpO
	 pyMxeAfstEYWDxIK6qBTToVUQv0ZlrdHTbQpdP3f0vw9ZM0Q5yBBGPUrx8bJ8PPwr84LQ
	 9rIFl4ISErILyetIQymuVCCBDz+Xt5B/UCCR4gUduPTWHgRggPd9UgEETfZ4/ZZ35gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHEW0HQf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BAA606A31A;
	Fri, 30 Oct 2026 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHEW0HQf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9791F0093A;
	Fri, 30 Oct 2026 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793369637;
	bh=TNsSVNLBeomaAlCQSkZboyICmvNvVMg7m1kWjt7v5rg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kHEW0HQfjjn+fvW3gHEgW9xEKuaPi/m7Pn6HW5sJNoeBC0BJ1FU78HDPp70YZlHpX
	 9eLOR5bswDFEy6iOUzZ//JdXQtTPb2wxLCfuJ5fpuXr0yAjUg4GDdmTTnbwYuGyJ0C
	 ShW55vneux9aK4Kj+sinCtX6PRX9ze1NeGWfHvDW8rNOe1qrx2fGcF1aBqmGWKMaTV
	 o5bf14bWmLRhbVZLE1Uf2Q+tCVT8lASIJ0tgezPgMLBLcjrvcK/ghTfvYL8Hg0OpOF
	 OXi5H5SeSoeMI20BenwUwUM05N+caszmYM3XZC79DFxVwxHS6p0gqTYvmCPupv/kwj
	 7eg+HFNQzpbtA==
Message-ID: <b9d12bc7-39de-4c39-9c16-80a1149dc055@kernel.org>
Date: Fri, 30 Oct 2026 09:13:52 -0500
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Add LG Ultra PC 16U70Q to quirks
 list
Content-Language: en-US
To: asinfreedom@gmail.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-lg-16u70q-quirk-v1-1-946f25fea731@gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20261030-lg-16u70q-quirk-v1-1-946f25fea731@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/29/26 18:24, Carlos Baiget Orts via B4 Relay wrote:
> From: Carlos Baiget Orts <asinfreedom@gmail.com>
> 
> The LG Ultra PC 16U70Q (Ryzen 7 5825U) spends ~5 seconds in the noirq
> resume phase on every s2idle resume. This is the same NVMe SMI handler
> issue seen on other Cezanne systems. Skipping it with s2idle_bug_mmio
> brings it down to ~32 ms.
> 
> As on the other Cezanne systems, the entry must also keep the spurious
> IRQ1 (8042) wakeup workaround. Otherwise the system wakes up immediately
> from s2idle, so use quirk_s2idle_spurious_8042.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/6021
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Carlos Baiget Orts <asinfreedom@gmail.com>
> ---

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> Tested on the 16U70Q (BIOS L2UG0160) with a locally built amd_pmc
> carrying this entry: noirq resume drops from ~5.2 s to ~32 ms, and
> s2idle no longer wakes up immediately from spurious IRQ1 events.
> ---
>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index fed6c51879..ca188d815c 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -386,6 +386,15 @@ static const struct dmi_system_id fwbug_list[] = {
>   			DMI_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
>   		}
>   	},
> +	/* https://gitlab.freedesktop.org/drm/amd/-/issues/6021 */
> +	{
> +		.ident = "LG Ultra PC 16U70Q",
> +		.driver_data = &quirk_s2idle_spurious_8042,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "16U70Q"),
> +		}
> +	},
>   	{}
>   };
>   
> 
> ---
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> change-id: 20261029-lg-16u70q-quirk-fae864db4054
> 
> Best regards,

