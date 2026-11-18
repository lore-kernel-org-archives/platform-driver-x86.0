Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013062;
	b=mdDtHQXgv4D31szB9oiHXgwlzhRL3L/KJr9YMPAb7fSaTBeGxeKVBeLscLDW8dqTawux
	 QcucGca783FElTS3/sTnz+G2BYnZltZiOYHmozX9Ek0IOFhKzBEjHrxC9XlJz1sNLW1c/
	 zTmFu7vMR8xxs2vsisQ0qPsDrM1LVkhHexIyFJT3Jwhklv5chWRY1mPgKYc2WM2xoh1b4
	 A6NJWqx01U4IKSbq0Ze2l55WD5B0UQu6meOUXIUd7JeSPJClLcvIThvF5y0V0Y4stGsR1
	 +31wqLecWrI/E2Oacv8vCgM7FrfIwJL8vDKnzIjRbiKGM6ylKKe1Dv+1x7LPXNT8jlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013062;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=q++1Rk3ubmUwnyldtBYLPBlY80xRxEQky74NTthTeeY=;
	b=XAuvtGDgAFOrrIqoRQURCePvVbdJz4g+PPs+dkDPRpRABz88nVSMW8F+H/LF1cwdtmJY
	 b+cALeAPcpR3oog4amjrWXONM5BUxDJmD/IO8nr33dY88YLSXIs1IgLgQecD19i4A4r1U
	 F1Qn8tM1SpbcxE1TEhp3OEanfOZGrgB9Y3A3pd/MrOP0QqHRjRRNqKHf+W2+Ves5jKjxS
	 E56fNSf8d4MqlAwMZOEjfwsnsUkR5SSminzwZpiV7mvjQA8LMx7incOqVl3Ncxv8Ypqzp
	 9X+qdBtopP01PeCn93IIxzxjMqJstFPyk2wOEmyzmZPHwUom8OELqIGyfQITm/aPNgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KUNv9dz/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B738606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUNv9dz/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BAB1F000C4;
	Wed, 18 Nov 2026 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013062;
	bh=q++1Rk3ubmUwnyldtBYLPBlY80xRxEQky74NTthTeeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KUNv9dz/5rRIlYlANVrAukL3C3N9Inv28oqFe7ldNCHCj0njhBT38ShpXUi/y4enT
	 gT/jUdnf0qJVv1mtwxkp09rdbfwDZ9cs9G8raN5auasbbIfBgxmDqI6nAe+2N/lldA
	 iKy0Cqcp5ta0kZ4aV5i+Ndap+Ft1cNdJadhpKUAX5NnvNOJrRUTTSaUwxZqkpoPeTT
	 NDJ0UUbY3Lqt+2dhqd1b71938/C2Zhp1OcTBILanykFTswj9O82mpFweIEVO/Iys8/
	 BtueVg+OcAfl/V9LYI2JY9COy+UAyKzEWZLRstI1GpfA5YbNd52BUVolwIsby3F0RH
	 LliSATOlAqA8Q==
Message-ID: <d8432776-21aa-43e2-9c94-dd7106032bfa@kernel.org>
Date: Wed, 18 Nov 2026 08:44:16 -0600
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
Subject: Re: [PATCH v3 04/10] platform/x86/amd/pmf: Get policy binary
 signature size from PSP header
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
 <20261118143034.3566684-5-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20261118143034.3566684-5-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/26 08:30, Shyam Sundar S K wrote:
> The policy binary size is calculated as the payload length plus a fixed
> 512 bytes, which assumes a 256 byte PSP header and a 256 byte RSA2K
> signature. Newer policy binaries can be signed with RSA4K, which has a
> 512 byte signature, or with an alternative signing mechanism, which has
> a signature size of its own.
> 
> Read the signature algorithm from the PSP header and use it to get the
> signature size. Check that the buffer is large enough before reading
> the header field, and that the size calculation does not overflow.
> 
> Policy binaries with an unknown signature algorithm are now rejected.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/platform/x86/amd/pmf/pmf.h    | 11 ++++++++
>   drivers/platform/x86/amd/pmf/tee-if.c | 37 +++++++++++++++++++++++++--
>   2 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 378798fb3ec9..4e6db4e6fbfb 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -23,12 +23,23 @@
>   #include <linux/power_supply.h>
>   #include <linux/platform_device.h>
>   #include <linux/platform_profile.h>
> +#include <linux/sizes.h>
>   #include <linux/types.h>
>   
>   #define POLICY_BUF_MAX_SZ		0x4b000
>   #define POLICY_SIGN_COOKIE		0x31535024
>   #define POLICY_COOKIE_OFFSET		0x10
>   
> +/* Policy binary PSP header */
> +#define POLICY_PSP_HEADER_SIZE		SZ_256
> +#define POLICY_PSP_SIG_ALG_OFFSET	0x34
> +#define POLICY_PSP_SIG_ALG_RSA2K	0
> +#define POLICY_PSP_SIG_ALG_RSA4K	2
> +#define POLICY_PSP_SIG_ALG_ALT		12
> +#define POLICY_PSP_SIG_SIZE_RSA2K	SZ_256
> +#define POLICY_PSP_SIG_SIZE_RSA4K	SZ_512
> +#define POLICY_PSP_SIG_SIZE_ALT		1932
> +
>   /* List of supported CPU ids */
>   #define AMD_CPU_ID_RMB                  0x14b5
>   #define AMD_CPU_ID_PS                   0x14e8
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index a0f2b4be1369..3c26296a5815 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -11,7 +11,9 @@
>   #include <linux/array_size.h>
>   #include <linux/debugfs.h>
>   #include <linux/dev_printk.h>
> +#include <linux/overflow.h>
>   #include <linux/tee_drv.h>
> +#include <linux/unaligned.h>
>   #include <linux/uuid.h>
>   #include "pmf.h"
>   
> @@ -327,9 +329,35 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
>   	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
>   }
>   
> +static int amd_pmf_get_pb_sig_size(struct amd_pmf_dev *dev, u32 *sig_size)
> +{
> +	u32 sig_alg;
> +
> +	if (dev->policy_sz < POLICY_PSP_SIG_ALG_OFFSET + sizeof(sig_alg))
> +		return -EINVAL;
> +
> +	sig_alg = get_unaligned_le32(dev->policy_buf + POLICY_PSP_SIG_ALG_OFFSET);
> +
> +	switch (sig_alg) {
> +	case POLICY_PSP_SIG_ALG_RSA2K:
> +		*sig_size = POLICY_PSP_SIG_SIZE_RSA2K;
> +		return 0;
> +	case POLICY_PSP_SIG_ALG_RSA4K:
> +		*sig_size = POLICY_PSP_SIG_SIZE_RSA4K;
> +		return 0;
> +	case POLICY_PSP_SIG_ALG_ALT:
> +		*sig_size = POLICY_PSP_SIG_SIZE_ALT;
> +		return 0;
> +	default:
> +		dev_dbg(dev->dev, "Unknown PSP signature algorithm: %u\n", sig_alg);
> +		return -EINVAL;
> +	}
> +}
> +
>   int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>   {
>   	struct cookie_header *header;
> +	u32 sig_size, total_sz;
>   	int res;
>   
>   	if (dev->policy_sz < POLICY_COOKIE_OFFSET + sizeof(*header))
> @@ -342,11 +370,16 @@ int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>   		return -EINVAL;
>   	}
>   
> -	if (dev->policy_sz < header->length + 512)
> +	res = amd_pmf_get_pb_sig_size(dev, &sig_size);
> +	if (res)
> +		return res;
> +
> +	if (check_add_overflow(header->length, POLICY_PSP_HEADER_SIZE + sig_size, &total_sz) ||
> +	    dev->policy_sz < total_sz)
>   		return -EINVAL;
>   
>   	/* Update the actual length */
> -	dev->policy_sz = header->length + 512;
> +	dev->policy_sz = total_sz;
>   	res = dev->ta_ops->invoke_init(dev);
>   	if (res == TA_PMF_TYPE_SUCCESS) {
>   		/* Now its safe to announce that smart pc is enabled */

