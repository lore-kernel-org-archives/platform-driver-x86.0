Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3E020B22;
	Sun, 10 May 2026 00:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778372483; cv=none; b=EbAEeqFgeB/can2sgCO6L/HnS2c7Eo7ySA8UrbkowOp6hLm1BEz5vlIRR5eil9sF1NLEvF1Ixr+BGhRliwnH62RP63/E5LiYKEnvDzloq47DQlkCssd2ZeaWKfo94AjowcziHJ+wZmUXgZ/JXOSvtCCGuJFcIicD8uXZ/QYP8oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778372483; c=relaxed/simple;
	bh=m2KP2GSnx2/YgJsTMf2pdsJ20gvmVLeYML9kTR+VMFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IUxjtbagdhfOsCOzgiwNRdRihgiYurCMXhuiKmxMTxvZhTiR6mUwL7V4tBH3y65ryWbj/4Jz6HHdr9gH/rkZk4kpnhZ7AG5TDkveho7vNb0hZdYx+BkyWOE+5vVha0U1eM6Zxf5vhyE4/QxaxGJS9UZ2c0SeeerVa+4IBl+haN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cA4hJaeM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cA4hJaeM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A113C2BCB2;
	Sun, 10 May 2026 00:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778372483;
	bh=m2KP2GSnx2/YgJsTMf2pdsJ20gvmVLeYML9kTR+VMFY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=cA4hJaeMHEHNz7ZrgOExJtnAMu+SxUGdqjcADqr6fBEvLHaQZZIkI3rL1yBRzxEjA
	 B5O7Ob26BvKLTbNPvUiYOyTqJdJp79LzgFiYkx3qe32epOk/EKAiukfwCfCf/3wuFF
	 7+oPyLd/x3339GCKQ8fT1OqPdRV6x391Z5lx6khRdm5hVfiPfb9XfJM9ws/EOSDsLT
	 W5v0hKn+hsR3twYndLywbK9YKov1N6gtpv3/GU7K17S689V8AZ04YNNn5cdqkWreJg
	 JwSKu4Twrx9TTXp/shpk4DgXy/TPLPq6WR0SuiouKt8GLhQDkqfBIZJoGiN1TdQCOJ
	 vy+TdMH4QKprQ==
Message-ID: <f0a3b54c-54e6-4573-9342-d0b40148cbed@kernel.org>
Date: Sat, 9 May 2026 19:21:21 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] Documentation/arch/x86/amd-debugging: Add example
 for reset register
To: Daniel Gibson <daniel@gibson.sh>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260509013105.816339-1-daniel@gibson.sh>
 <20260509013105.816339-5-daniel@gibson.sh>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260509013105.816339-5-daniel@gibson.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/8/26 20:31, Daniel Gibson wrote:
> To me it wasn't clear how I get the information stored in the reset
> register, or how to identify the messages in the syslog mentioned there.
> 
> Mario Limonciello sent me an example line which illustrates what to
> look for and I added it to the AMD debugging documentation, with a short
> explanation.
You can drop this second paragraph and just add:

Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 
> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
> ---
>   Documentation/arch/x86/amd-debugging.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
> index d92bf59d62c7..3176a1240fee 100644
> --- a/Documentation/arch/x86/amd-debugging.rst
> +++ b/Documentation/arch/x86/amd-debugging.rst
> @@ -366,3 +366,8 @@ There are 6 classes of reasons for the reboot:
>   This information is read by the kernel at bootup and printed into
>   the syslog. When a random reboot occurs this message can be helpful
>   to determine the next component to debug.
> +
> +For example, if bit 19 was set, you will get a message like this in the log on
> +next bootup::
> +
> +  x86/amd: Previous system reset reason [0x00080000]: software wrote 0x6 to reset control register 0xCF9

