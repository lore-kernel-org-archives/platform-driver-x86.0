Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243607;
	b=JWZNDpnDZFrlqULS4qLoMPuJOVuWwb3gsJwtXaLFIHhf3sVsiGT5SteAlEtcgEV0Hzgi
	 OQYzfHl76LspcQ8gxhmCpSaa3MzgGe7g6UgwYU2927I3lV3QgKby+qPKjCq9wEL85/G0U
	 1cxx5xn6/43HKvynCoi0sFEvS+L8PaFpSf9OaOW7WAS1F2/Kk71kE3Yu460hGh6gLJiB/
	 EhY+vg2ocENNVL5M0UQ98dIM92L++3scS/UwtyZ7yQkIoW+Oy7w7B0S5hLCACW8GH5jRY
	 IoKYKN18mo8E67Q6kA5lBXOjUNPymIB5Y+b8QY0Yvyqkma0YLt+xDV/XIIER3Pg3VTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243607;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aY5EcZyrEDvQUbF5OJzJqSOec7/wGusghwDq0yymoqQ=;
	b=uWMbHkmb3qXpSN/3GkiNiIT2I9EkjWHHXlnkW+cgYbnDXvaSb1EoouZTJd8Q7J+7KMZO
	 LlYJzcrD4wLKN7KPVfNRBbHvAT1GWwn7jT3IY+oB1K6W9WiJMuXDIu2tNtI5GeThczvux
	 KVxuF8GnLaEhRcsQ1/4d4u+/waqrhstJlEKOTDkN/pIaR9HwhnlycQOXkMOPKXG8Yq6Ia
	 FACsBifszI4pnbm+9kg+sbR8wBH0SwH8aCeIYHCsEQq/rISmOvBcQn0VYY5dEb7anpd5K
	 7ByJEVm+F0kWf0Qe5t2sWPEKXvOtsiHTu/KIdgjP6sHdT6rfrsxN/+AgamNL7QJikyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oi5OrqRr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD258606A333
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 17:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oi5OrqRr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D841F0089F;
	Mon,  9 Nov 2026 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243606;
	bh=aY5EcZyrEDvQUbF5OJzJqSOec7/wGusghwDq0yymoqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Oi5OrqRr4+h3yrn4qAXePlfqGoRrf0tAPlRETxDzANG3+KBsKFhcPrV1wiwQBvF6w
	 AZazlaf5BE7qEqR86qZA1yo9YGtBZr1JkzPy3ghwC19qNzf/udXZqYf61M6ubNiUha
	 xGP0u32sOvPpznPjKOaXkPL7JMj5AVmq2gaMeRbDytpjDJG9xEcdXY9euMYopPmOC+
	 /+b1OeIrJAd+3nXURzi760dP7UYZvVNQmiIKuo05j/0bQAk7RW5OStmY7hKyvTOM5r
	 m/t3TxvmfrLSORexOkgLJE88KAAPje8T0oXO3M4GUqT7GdrdPIRkfHQs/LAWxD8yra
	 oblG9j/oTbwmA==
Message-ID: <137530d2-4228-4053-b50d-d98556becca5@kernel.org>
Date: Mon, 9 Nov 2026 11:00:02 -0600
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
Subject: Re: [PATCH v2 05/10] platform/x86/amd/pmf: Use enum system_state for
 the TA system state action
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
 <20261106164429.30738-6-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20261106164429.30738-6-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 10:44, Shyam Sundar S K wrote:
> The TA reports the requested system state as 0, 1 or 2, which are the
> values of enum system_state. Use the enum names instead of the literals
> when handling PMF_POLICY_SYSTEM_STATE.
> 
> No functional changes.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/platform/x86/amd/pmf/tee-if.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 9b328be1e8f4..e672f7cdd1b5 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -209,13 +209,13 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>   
>   		case PMF_POLICY_SYSTEM_STATE:
>   			switch (val) {
> -			case 0:
> +			case SYSTEM_STATE_S0i3:
>   				amd_pmf_update_uevents(dev, KEY_SLEEP);
>   				break;
> -			case 1:
> +			case SYSTEM_STATE_S4:
>   				amd_pmf_update_uevents(dev, KEY_SUSPEND);
>   				break;
> -			case 2:
> +			case SYSTEM_STATE_SCREEN_LOCK:
>   				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
>   				break;
>   			default:

