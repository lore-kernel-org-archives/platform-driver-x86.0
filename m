Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC49497B8A
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209029; cv=none; b=c0Qxdfcb4+ePgwEEEapiVM8hD0DwPoEHm2IWlF5xiC9DV15/kTMLuMmKGoLotrwPJABR4AVVx0O1Af9NnwlCPvaz/MRPbGxNMznelV67afCaAX1FRIm61wCg1ZCdJwQb2MhWRweqvCphrx5pB2JeNoztPjLCQmn6oIL8hxHkoBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209029; c=relaxed/simple;
	bh=AVeVm05CYgT5z3QKa+DfDu93k5CtY5W0HGeJLzRt1P0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1DC+nP50fp3ls7ZJgkP/cw+ggM2TrAHqAlW7qMpQEVzAXEtDOOq5Blp27p3Twdl8U7OApffgxAtvMGvlhe+26xNOSYwsry95QzBNiL89vxisO+mzHtJjsOYR3t4NnY0is1jk2r1GrEaHX+T6Cpf2z4mN0lcqlR1YfY0ydEPEX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pn6wUe2E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pn6wUe2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667621F000FF;
	Mon,  5 Oct 2026 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791209027;
	bh=6CTPKAP6gA6C7SYgJe449H88PpZo0q1070dTL+L80oM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Pn6wUe2E5XfN1vQZTBl5iVc0q2ryhH7N5Dr0CvAbEq6sa/dZhavQXzbBMfAWK3iaV
	 bIgGhDrQPpt56jbNIkNBWppbwAHxEji1tAWg+t4A0npPZYEGrQ7Mnf77VqoBkPxuGr
	 ieuciQV28ssO3N3a5HNaK04Z6wVyi9q+Bb6mXgsct5/e/W4oGSuHVLLRgWMVJ4MCIr
	 KHO8+08B5Om3dfoRtc/Hjwp5bM7f1QamcMFajz1cpC+w4cz1klxUwaZ6tpKMwD0wsW
	 Y9Kmlg+qH4rQGygPhkBhimnpBYLD6LZ/8cdIYkfCOo0i7vkbPJdKqFhBx/DbEWGm7H
	 3O1vH2hyaYOXQ==
Message-ID: <c51db40a-b028-4277-bcbd-763981d5fb69@kernel.org>
Date: Mon, 5 Oct 2026 09:03:45 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86/amd/pmf: Fix ACPI buffer validation in
 APTS path
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20261005072811.1378555-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20261005072811.1378555-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/5/26 02:28, Shyam Sundar S K wrote:
> apts_if_call_store_buffer() reads a u16 size from info->buffer.pointer
> without checking it is non-NULL and at least 2 bytes long, so a short or
> NULL firmware buffer can cause an out-of-bounds read.
> 
> Add a common helper, amd_pmf_if_verify_buffer(), that validates the
> buffer (type, NULL or short pointer, header and output size) and returns
> the size on success. Call it from both apts_if_call_store_buffer() and
> apmf_if_call_store_buffer().
> 
> Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks for following my suggestions.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
> v3:
>   - Move full buffer validation (type, NULL or short pointer, header and
>     output size checks) into verify buffer helper.
> 
> v2:
>   - Add a helper function for NULL pointer and buffer validation. Reuse it
>     in apmf_if_call_store_buffer() and apts_if_call_store_buffer().
> 
>   drivers/platform/x86/amd/pmf/acpi.c | 70 +++++++++++++----------------
>   1 file changed, 30 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 3d94b03cf794..59173bcc3750 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -50,47 +50,54 @@ static union acpi_object *apmf_if_call(struct amd_pmf_dev *pdev, int fn, struct
>   	return buffer.pointer;
>   }
>   
> -static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
> +static int amd_pmf_if_verify_buffer(struct amd_pmf_dev *pdev,
> +				    union acpi_object *info, size_t out_sz)
>   {
> -	union acpi_object *info;
>   	size_t size;
> -	int err = 0;
> -
> -	info = apmf_if_call(pdev, fn, NULL);
> -	if (!info)
> -		return -EIO;
>   
>   	if (info->type != ACPI_TYPE_BUFFER) {
>   		dev_err(pdev->dev, "object is not a buffer\n");
> -		err = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>   	}
>   
> -	if (info->buffer.length < 2) {
> -		dev_err(pdev->dev, "buffer too small\n");
> -		err = -EINVAL;
> -		goto out;
> +	if (!info->buffer.pointer || info->buffer.length < 2) {
> +		dev_err(pdev->dev, "buffer pointer is NULL or too small\n");
> +		return -EINVAL;
>   	}
>   
>   	size = *(u16 *)info->buffer.pointer;
>   	if (info->buffer.length < size) {
> -		dev_err(pdev->dev, "buffer smaller then headersize %u < %zu\n",
> +		dev_err(pdev->dev, "buffer smaller than headersize %u < %zu\n",
>   			info->buffer.length, size);
> -		err = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>   	}
>   
>   	if (size < out_sz) {
>   		dev_err(pdev->dev, "buffer too small %zu\n", size);
> -		err = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>   	}
>   
> +	return (int)size;
> +}
> +
> +static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
> +{
> +	union acpi_object *info;
> +	int size;
> +
> +	info = apmf_if_call(pdev, fn, NULL);
> +	if (!info)
> +		return -EIO;
> +
> +	size = amd_pmf_if_verify_buffer(pdev, info, out_sz);
> +	if (size < 0)
> +		goto out;
> +
>   	memcpy(dest, info->buffer.pointer, out_sz);
>   
>   out:
>   	kfree(info);
> -	return err;
> +	return size < 0 ? size : 0;
>   }
>   
>   static union acpi_object *apts_if_call(struct amd_pmf_dev *pdev, u32 state_index)
> @@ -125,37 +132,20 @@ static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
>   				     u32 index, void *data, size_t out_sz)
>   {
>   	union acpi_object *info;
> -	size_t size;
> -	int err = 0;
> +	int size;
>   
>   	info = apts_if_call(pdev, index);
>   	if (!info)
>   		return -EIO;
>   
> -	if (info->type != ACPI_TYPE_BUFFER) {
> -		dev_err(pdev->dev, "object is not a buffer\n");
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
> -	size = *(u16 *)info->buffer.pointer;
> -	if (info->buffer.length < size) {
> -		dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",
> -			info->buffer.length, size);
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
> -	if (size < out_sz) {
> -		dev_err(pdev->dev, "buffer too small %zu\n", size);
> -		err = -EINVAL;
> +	size = amd_pmf_if_verify_buffer(pdev, info, out_sz);
> +	if (size < 0)
>   		goto out;
> -	}
>   
>   	memcpy(data, info->buffer.pointer, out_sz);
>   out:
>   	kfree(info);
> -	return err;
> +	return size < 0 ? size : 0;
>   }
>   
>   int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)

