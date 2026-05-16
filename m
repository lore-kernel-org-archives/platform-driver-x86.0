Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14E2381AF;
	Sat, 16 May 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778951704; cv=none; b=bM41pBqPOcn60aIkNi2TlDCRtFG0hDlFwQEPn0Eb+NYSBIutbWfx0jVqPveNFGRDttO9ooo9Z73GQgjg2rmM3gDgHnqOETHHCi3hKkozLlI8m9D3wch7A9kItHoyLA8Oin8esb7m3euhUMzPkEB2e9vqtDSdM6geTQ0XzbGCBYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778951704; c=relaxed/simple;
	bh=PTaFdiP0zvdQAQZh3l4J1kxx+h7sbOpyKW827AxPK5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJslMBrtTDYoOGY8UowVEQAgBFX2dLgvAiTwitiukOCz6VBWeC/LiOpU5uQN+m5NiZMOpzYToLbncCC4S5xFMvtkPK3vd5wRxv3CzqHrE5XW283hy9wDqLs1CdETnaOvywKRw7SjsbIFg0G18x/NjXJK0tmlMTM8wwW9h7hNgLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aWn6tp5C; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aWn6tp5C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=GGZo+B4gbkzBypGAJrfp0pJ03H1aSk19wI+pAVwppSo=; b=aWn6tp5CL4aPAFlcWcgLgaGs7x
	H/cRD8IO79FmRcAQ6tZIJb2znqrA//0Dul1Vf35kk7g4xbbETDcrBxAEtBoTmTcNOtSar7CScZh86
	m2xiLdQo+psCZNQyD7D8TtoLBQX4D/uDbNvy7TxVrS6klrBckbYGW02U5yHEXKhRvb3u0NVyd1JAx
	hPmjUNso/Hy33A1ukAX6/xOhhnC5/Y7YVjhsa6v+5sxrLmQTvQP+xElW+uyA4Gi8p53yYvvPGs79T
	+dvmp1u9nc+XvMNVKgwUrBlCx3WwH7mAgrYbTjw7pa80KD9vgIG34clpUpSzVcffRPlMyPVOWzA1g
	363os3Bg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOIbG-0000000B5Du-26Xw;
	Sat, 16 May 2026 17:14:54 +0000
Message-ID: <8177891c-7103-489f-9384-105ab101301f@infradead.org>
Date: Sat, 16 May 2026 10:14:53 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix typo in lenovo-wmi-other.rst
To: Cheesecake <cheesecake2960@icloud.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260516075020.16745-1-cheesecake2960@icloud.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260516075020.16745-1-cheesecake2960@icloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/16/26 12:50 AM, Cheesecake wrote:
> Replace "Minumum" with "Minimum".
> 
> Signed-off-by: Cheesecake <cheesecake2960@icloud.com>
> ---
>  Documentation/wmi/devices/lenovo-wmi-other.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index 01d471156..1d0410500 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -144,5 +144,5 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>      [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
>      [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans")] uint32 FanId[];
>      [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
> -    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
> +    [WmiDataId(4), read, Description("Minimum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
>    };

This is a well-known misspelling but apparently it's what the hardware/device
reports (or contains), so it should remain as is.

https://lore.kernel.org/platform-driver-x86/BAA4F3A7-E892-4904-95A6-64B177CDA7AD@gmail.com/
and
https://lore.kernel.org/platform-driver-x86/cfd7977e-d612-4e08-a68a-65fed8e164b6@gmx.de/

Looks like we should add a NOTE: there.


-- 
~Randy

