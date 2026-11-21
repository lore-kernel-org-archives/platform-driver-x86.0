Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795225123;
	b=zsTCjL5vMvbvvfjt4/+cxiRd4hG4IVdeIiu7gKeCi33KXZzdyhEVTpiWu2cy/pJIvMK3
	 GCP1Zj7CjraGTDh3cO5YDyCnv0hlH/qvai8/mrHD8ChiEOc9JZo9R8Jp9J88MTD09stRg
	 A2xK3lpqhjgpyVaTAZxQ5CJkAhA9IXYK/8qTEHyIbseiuDVWeOAGaqR3eK11fQSpq6pMC
	 +e4gG6Ojy1iwovm5pjMuLZaiGRA/auJdSK6ypRrmSYURadl2td3/74uSAC0vsoUfcpCSP
	 XFxlqZI75sqhCd8c2Kw71tWmDaY9x4H2Rp2ItTshvjB1rZ+s4lkTReXgP5a6a3riupQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225123;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=KSHGXjTTOohXyR/j3uJ9ZXhmiZzvyVcAO3qAmI7l2vU=;
	b=XirFDMozC32zAdHS2h4nHaxUwzeX55pUA+o1IPrZXUfIv2LYz8CBEGWk4IRn2r6Qnfb+
	 nktJesT/9jR+RiqPui8MPZklOFYcdpEDjIlGyBO5H/Z5dxWnOHtpTuP+3wnJps8lMQZLD
	 AqA7/QyqcAQjmxjYj/POEWNHglFBfvfdXtwr8zVr4JXqVi+r/Oq0ofHDMfqi4Oyj+6Kuj
	 PxxVNLOdnBqTJnu3s1tSwH7dlS9JUUgi9e8tmKPk907+yRKrUqrXIH6A3ubJb0G0c9cwI
	 aV9/3HbPdo5CYoxdHjy/bi1IKt6iUPt0d1jA4ZoTNaug5tKV/ZZa82uGWwcjBRy4jNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xg479fwh;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97E3606A6B7;
	Sat, 21 Nov 2026 01:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97E3606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xg479fwh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=KSHGXjTTOohXyR/j3uJ9ZXhmiZzvyVcAO3qAmI7l2vU=; b=Xg479fwhpUYGws90zNBTptf7yd
	oHNWntv6SBtyl9RaJ6HKCE9tYNN8KrhKYmn4Db6MaCpM0QZA725b/p/H1KN3ze7XBZJO8pQ0nYAN1
	7oPV6juKPArlDMAvmj/pFoKkRMJinAev5PiGW89AcaWNASJlSvIWb6rrjjGcj8YCb09xho5tuDoG7
	ydA7tlGzTBAlpDlUttAG1OKkCJimBWPesgtkEx3zLrzKfIN8bchXDQ7ttLnW9KVwzg7Hs4lBAMnnB
	YYNdI+DOvKSwTbHTTk2lzEXC5HUHPGkqq7+o1R7IvXkvomk3Nmqp79YrrJ8NQPVyOE+fpa78R2zKC
	fZrE/uRw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUa3i-0000000GeUk-3FnK;
	Sat, 21 Nov 2026 01:38:30 +0000
Message-ID: <a87b9450-dc36-422d-a897-12248004ef3b@infradead.org>
Date: Fri, 20 Nov 2026 17:38:30 -0800
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
Subject: Re: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
To: Brian Mak <bmak@nvidia.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>,
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Lyndon Sanche <lsanche@lyndeno.ca>,
 Armin Wolf <W_Armin@gmx.de>, Prasanth Ksr <prasanth.ksr@dell.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-5-bmak@nvidia.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261121000556.173028-5-bmak@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/26 4:05 PM, Brian Mak wrote:
> CONFIG_DELL_LAPTOP is currently not available on ARM64, due to a
> dependency on CONFIG_SERIO_I8042. This dependency is actually not
> necessary, as there is a fallback. Make it optional.
> 
> Signed-off-by: Brian Mak <bmak@nvidia.com>
> ---
>  drivers/platform/dell/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/dell/Kconfig b/drivers/platform/dell/Kconfig
> index 7030f817b6af..0223e2373508 100644
> --- a/drivers/platform/dell/Kconfig
> +++ b/drivers/platform/dell/Kconfig
> @@ -77,7 +77,7 @@ config DELL_LAPTOP
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
>  	depends on RFKILL || RFKILL = n
>  	depends on DELL_WMI || DELL_WMI = n
> -	depends on SERIO_I8042
> +	depends on SERIO_I8042 || SERIO_I8042 = n

Could also be
	depends on SERIO_I8042 if SERIO_I8042

>  	depends on DELL_SMBIOS
>  	select POWER_SUPPLY
>  	select LEDS_CLASS

-- 
~Randy

