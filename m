Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050013375AE
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Mar 2026 19:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772911378; cv=none; b=FFz2imNXwTCzYKBfceTrS2KIbN/xoRsvg3iPURsNbqXO8z4OQenuvKurexM5t3YZ9gau4c1lwxEIIYOPRL9NcZZPmoqYTi99H9rvNMXML4nOJS5UACInOeCDBRnb0YhenVkEW9yvDh8z003E/GEofmK0IS85nizdC9eJj9xJtbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772911378; c=relaxed/simple;
	bh=OidGI1kMym+aBrMoJHw7Jce8qYGtavJzLY1tCmWmYoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imhRvaM++TWgc8reyPEycvLgEQK8vpM/OleUVOzfTYrIUMgFuNPZxhHNZMPduIfvxvRCs6E65GhpLggqj8+/qc9AHVFzOfKclbUNVLjHQycWAALxr2rBzp0XyozVfiu+XNILMir4N4o5XHEGWVF1RWZrefEoSS3KqhSLBGxZd28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KzUpP2wL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KzUpP2wL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=iVBDf8GTUvh2s9g/Bu5rsweTObvpU/ATBdEZA1cWYDU=; b=KzUpP2wLlFXD2fxcnXnCTNGu5T
	O6MkYp74eAAhJzPzOEGJmbcfmlt2V1a/CqDAlW0TnKRnEpKF/PGFtbtdpkoIhbKJVKlisrO3DrCg3
	krIAJCYnjCfT7rVD8edq9ETXkvpjJ/uQX8knHRLFKjuVdmite3l5j38RQJD5pvRkveMeB77LOrdFD
	JAwqVIpDmxoQvgktocHsiXg1xA1HU7UD23h+zFvAKEqN3b1mgz7Uc/iuVAeMIMA7QMDKWb/wknvzl
	3srfgtJq+HJrWfLmlqiIOMjFBy7MNCdyV7K2RkO//GXAMxF3qLIEqPHJmh2jHz/6KMEbZqzgVUPGp
	dL5P2pog==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyxEd-00000005S5x-1si8;
	Sat, 07 Mar 2026 19:22:47 +0000
Message-ID: <f44e3959-838f-418f-b3fc-2c13c699803a@infradead.org>
Date: Sat, 7 Mar 2026 11:22:46 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/olpc: olpc-xo175-ec: Fix overflow error message
 to print inlen
To: Alok Tiwari <alok.a.tiwari@oracle.com>, lkundrak@v3.sk,
 andriy.shevchenko@linux.intel.com, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com
References: <20260307190533.3025563-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260307190533.3025563-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/7/26 11:05 AM, Alok Tiwari wrote:
> The command length check validates inlen (> 5), but the error message
> incorrectly printed resp_len. Print inlen so the log reflects the
> actual command length.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/platform/olpc/olpc-xo175-ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olpc/olpc-xo175-ec.c
> index fa7b3bda688a..bee271a4fda1 100644
> --- a/drivers/platform/olpc/olpc-xo175-ec.c
> +++ b/drivers/platform/olpc/olpc-xo175-ec.c
> @@ -482,7 +482,7 @@ static int olpc_xo175_ec_cmd(u8 cmd, u8 *inbuf, size_t inlen, u8 *resp,
>  	dev_dbg(dev, "CMD %x, %zd bytes expected\n", cmd, resp_len);
>  
>  	if (inlen > 5) {
> -		dev_err(dev, "command len %zd too big!\n", resp_len);
> +		dev_err(dev, "command len %zd too big!\n", inlen);
>  		return -EOVERFLOW;
>  	}
>  

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

-- 
~Randy
