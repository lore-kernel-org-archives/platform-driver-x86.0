Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB96D217659;
	Mon, 31 Aug 2026 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181779; cv=none; b=DOmUTxtgzrDSx+ybcl2KcxrGT8ks9kL8iX9VhU0WmM7Rqr+bcz8P+klsWSC9MjDXWetBsczv0oy+Q5o0/IgoXaQHLvTmRqTR8hz+bwhel6wf5MX/4HP6yeLdW/is6A9eq3CcsQAG43Dvyh9wOrVXDcFcReUzGMQbny4HO+VDkqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181779; c=relaxed/simple;
	bh=RykEXpmmMnmIrkfH8+y14SWzui5g2AA4nMPPE2DTnPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVpipMFTr1ywHEoc/M2MMvT4uCkwBScarSkKcf3NBEVKq/kCoszo39LdEaVTRwKHYIn54vrbPB6tQGtDabBaNm/yO/ESo43UnHnE+Gj7ktwjGAqmCZiF+668IHGqbF8qHuu/VW2oGXW7G+7kEK97vejecXqOhYrwlgCc+QXsJTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IG/1jFnQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IG/1jFnQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BF91F00A3D;
	Mon, 31 Aug 2026 13:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788181778;
	bh=wzODhYLih3/yeQ6zgjsKrlSflzuebCRc0xO9gWk7OKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IG/1jFnQKtfCVkRlWiE9RuCvLAOvQNmb+iTBygBVD5RBusSdqFd6A5+DC7Zu252py
	 YB1898suhcdnvTFRSjzA9YlMvICHBmRmWUUHJxIvEdNOJDl9LICGIVwLSOZY4LEhZf
	 awX37Yr5JJRWOgRkrMt2XWHfuVfON4mwFZHFFzoPw9lfjSkn7DvbOwXksGmj93p+WU
	 CL9YI5QDadLYPiEOFdoRIqlDz8bArKuw87cppK4N61f4AVcL3Itij2IXQsXH2HzYZv
	 9IFlZmYKi2M5T6m2RUxOk5v4s9IpGT5Wo3O0eB1sfV7ZzZPB9ZgmBSCh63Dj5RZLR1
	 rnSyY4AmwyWWA==
Message-ID: <0f7ffc62-83ec-417e-ad14-e32503a70992@kernel.org>
Date: Mon, 31 Aug 2026 08:09:35 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: fix build on !CONFIG_AMD_PMF_DEBUG
Content-Language: en-US
To: Pedro Falcato <pfalcato@suse.de>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: Sanket Goswami <Sanket.Goswami@amd.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>
References: <20260831114346.2041361-1-pfalcato@suse.de>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260831114346.2041361-1-pfalcato@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/26 06:43, Pedro Falcato wrote:
> amd_pmf_get_ta_custom_bios_inputs() is used by non-debug features.
> 
> Fix the build on !CONFIG_AMD_PMF_DEBUG by moving
> amd_pmf_get_ta_custom_bios_inputs() outside the ifdef CONFIG_AMD_PMF_DEBUG.
> 
> Fixes: 5bda82c797c9 ("platform/x86/amd/pmf: Implement util layer ioctl handler")
> Reported-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Link: https://lore.kernel.org/all/fS7s9V_xTaedaqEAaxwKnQ@natalenko.name/
> Signed-off-by: Pedro Falcato <pfalcato@suse.de>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/platform/x86/amd/pmf/spc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 94355b435a66..592ba4de4c7f 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -17,7 +17,6 @@
>   #include <linux/units.h>
>   #include "pmf.h"
>   
> -#ifdef CONFIG_AMD_PMF_DEBUG
>   u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
>   {
>   	switch (index) {
> @@ -31,6 +30,7 @@ u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
>   }
>   EXPORT_SYMBOL(amd_pmf_get_ta_custom_bios_inputs);
>   
> +#ifdef CONFIG_AMD_PMF_DEBUG
>   void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>   {
>   	int i;

