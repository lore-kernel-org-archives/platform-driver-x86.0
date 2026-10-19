Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD0C29992B;
	Mon, 19 Oct 2026 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416683; cv=none; b=Y90Hg4IcI6nluzLY/RVoXBtK2aYRJtylZGUIdD114mkSWqQuFR5+9TX1V9imrBTgexG4tXqnkTd/iaDy9vPaMUYGOoyxRlkNW7IM5ouaD2f3JS9TKmESgSF4X2uKyidgib1U39dnPy2BGJN5Wr6f9FbZTpYW0mQMv3daokmWDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416683; c=relaxed/simple;
	bh=ryVF/5Fko28guKgSZkM9gRmavKBOKpBwkRlnzHHpYxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFZtWAiYPXXKz+/a2thVGDRayfILEFBAvp2Ig8JqFXDY4OyCAVEZQ8G1JYqJyAK0gmNWs0Jm1v1ACYkPiBSMEqYMRL4Q1i5pOLQ0kbuCY5tCwiBUrMZD6yOIBflnN6bo8yviQjFO2Rz2nHduc/5bxJCzclFTjLz9AVpF4j4Tflw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMA/pUZ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMA/pUZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B901F000C4;
	Mon, 19 Oct 2026 13:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792416681;
	bh=2ZUpFclP4e4S9HsPisw78ng5kxf+BVMkFJVBEMBjbqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kMA/pUZ50Zg70dwklO8io0KWQoHZ+bnhAPJIXIR/PnEC0eMN08LSbW9sXnqGXTMK4
	 zaF0TFDRDD4Bdsvf70WfzO39k/xRctVp5IkNcopDQ4QMGXGpym30s+AAc3E6gk/XBn
	 1aGunoE9uqoRl/mhU2uxBNqN9MMtxV3CvPt7SqkR8mv0N+HPg0aA0VO8ib4Q15X+e5
	 mkfgSfTds3CfBCnS8BtVdIDVThx3eRw3uV8aJiQL4V3oYXZJhgXl8aGz7f6Q5UxvKd
	 GAcx9jxFYm0Gh9KA+XvJIk8uSqEf+EfVFvVYYFUXKAN6JyfBzPr8HIa4NtgoLKU7yT
	 sl/LjBwtNr0cw==
Received: by pali.im (Postfix)
	id BB0C2566; Mon, 19 Oct 2026 15:31:24 +0200 (CEST)
Date: Mon, 19 Oct 2026 15:31:24 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Haoran Wang <haoranwangsec@gmail.com>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/wmi: dell-smbios-example: fix 1-byte stack
 overflow in find_token()
Message-ID: <20261019133124.67k77hljuf6iq2wd@pali>
References: <179241617018.5916.3033533776160790448@whr>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179241617018.5916.3033533776160790448@whr>
User-Agent: NeoMutt/20180716

On Monday 19 October 2026 21:22:50 Haoran Wang wrote:
> diff --git a/tools/wmi/dell-smbios-example.c b/tools/wmi/dell-smbios-example.c
> index 1f3e7ab14..214071f6f 100644
> --- a/tools/wmi/dell-smbios-example.c
> +++ b/tools/wmi/dell-smbios-example.c
> @@ -52,8 +52,8 @@ static int run_wmi_smbios_cmd(struct dell_wmi_smbios_buffer *buffer)
>  
>  static int find_token(__u16 token, __u16 *location, __u16 *value)
>  {
> -	char location_sysfs[60];
> -	char value_sysfs[57];
> +	char location_sysfs[61];
> +	char value_sysfs[58];

Hello, from this change it is absolutely impossible to figure out if
there is OOB access or not. 61 and 58 are just magic numbers and if
somebody send another patch which changes it to 62 and 59, or 60 and 57,
I think that people could also accept it.

If buffers are bound to some input, what about using sizeof() operator
on the input buffers and demystify magic numbers behind?

E.g.: char location_sysfs[sizeof(token_sysfs) + sizeof("/XXXX_location")]

Also another way to prevent buffer overflows: Use snprintf() instead of
sprintf() which can easily detects those buffer overflows.

>  	char buf[4096];
>  	FILE *f;
>  	int ret;
