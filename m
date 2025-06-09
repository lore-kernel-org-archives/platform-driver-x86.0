Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CB21553A3
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 10:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465418; cv=none; b=krNbeAiq/dO2knj/sififs5SyQJQtZnt1fB8t9aAG+WyE9c1qHYV5zUYtDcn+XklWWtM2UoK9pMJcyaKZCcozcrCU3lwj3zto4zlfLLEg8JeMwpnQPrq/zGf1Xqr69xQza9xes5/FUO3dvfDAyZAbl1L9zgQv5aGRbrnRf4tA/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465418; c=relaxed/simple;
	bh=ksVuOVXVwxFWXglwboxbkJ+JNmyf22DBin+9HZgJgfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHyRExD9UmWCOtium14gVxpM6xHBsKT1P8RooZDatbe10A1bI1GhgAaxkrMO7Jt60c5xpIM7I3j5lSMHv3KXsa46j5jgJhUd9OaxNERYIdzSdTlSOjfDcS/0KqEH0Lu9gIq6otbPGvxKL8jl9vHnm2Ay2ZffeAPpTdvm2KeQea0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/ADWs1k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/ADWs1k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B57FC4CEEB;
	Mon,  9 Jun 2025 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749465415;
	bh=ksVuOVXVwxFWXglwboxbkJ+JNmyf22DBin+9HZgJgfI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O/ADWs1krzEppaHZh6kgEy7qKdTKLxFi+2cn6q2PG9wGFt+cizTDeR64rY1q+poBC
	 B9IMGaZgphuJCsVsIs7Ubw0PG/2vrYVJ04Mp3SKuKz+pk+8sVzmXiN0kAI21mprJas
	 95+xQq9SpGvyAEkywnbwMLVp+jc6A52exVm60qH2BsIb3zcQ3gSAf7wZpCtY1nL3hA
	 +38QWjs0bZIU62x2JR/b4RM2PmubVCSH9TOISk5sgrYomzfPrBUA+5aUVOTJavhrNn
	 g6eoW/PQQxZyj8t5sUM6qrKsDAeA/vW7C75ZP32fGYnl/OWYBBHYJ4m7/ee/FwW9gi
	 tLsNRdWoH+L4A==
Message-ID: <9d68b694-f1c4-401c-a1c4-f9445efc3f73@kernel.org>
Date: Mon, 9 Jun 2025 12:36:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: fujitsu: use unsigned int for
 kstrtounit
To: Jelle van der Waa <jvanderwaa@redhat.com>,
 Jonathan Woithe <jwoithe@just42.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20250609102115.36936-1-jvanderwaa@redhat.com>
 <20250609102115.36936-2-jvanderwaa@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250609102115.36936-2-jvanderwaa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Jun-25 12:21 PM, Jelle van der Waa wrote:
> The charge control threshold value ranges from 0-100.
> 
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/platform/x86/fujitsu-laptop.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 162809140f68..c8aeb28a783c 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -180,7 +180,8 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
>  				const char *buf, size_t count)
>  {
>  	int cc_end_value, s006_cc_return;
> -	int value, ret;
> +	int ret;
> +	unsigned int value;
>  
>  	ret = kstrtouint(buf, 10, &value);
>  	if (ret)

