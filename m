Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B832AD35;
	Mon, 14 Sep 2026 02:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351304; cv=none; b=OTeAIxHQzrePSK5/jLf3kMsg86/KtWyN+nifSnkjEshQUVw+hVCdc4gD1RyFgPkuPMkMqbTs3wisMADsUnj25LsW2Ut2X2tYfeP81AB05WkDLjdzVOo4pPv8BsTyzahRUukTM5sg6FcdbA4abIBi054L2TyVAERgGdPpbCRiiY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351304; c=relaxed/simple;
	bh=04k4f9e5gea5+x/CyoY7hoQpWb9+xswIoo6JawiSkYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayp/xzWbm3BhSNTWPXIUxku4qrXzE/J8cHMLM888qHUgdqfosQiwUmx4cIw99jTK3AK+UwxNqc9eLmfi86CtXEYF65tVEkFUAsdP/6LmKJlpnJYk61K8Uk8UgCwTaXMfselDbQx82yB2Gh3RDAWIijOuy6BA5mpf0r5OEampcN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RNX6qIEI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RNX6qIEI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0K3FOZW0zXjce4YXC5/62Q2NjlSiguNAa7sWXDR+mmA=; b=RNX6qIEImbEpECsvjNGu91bNRz
	yaSVbyKOKYXWyh9Nor9441rBV7Z+ldsK3+YQBshlzZcvrAwMhF/ylVGXbZnVmyvGLYbPx38cTHGTn
	qx7O1+KBCv8GGsUZBXDJU9a/l2/6yEZ2u7XVxXJIjvAFE+grSdWJtJCczgRmFRQPiZkt1602SwW1r
	a6oUln1Sw5PA2faxleEzQ2DlEm7o9D+HgHD0/5p089Q1V1IHA1NttaNNzZV37TtMvWAMaE0YZfb4c
	rIKtkpklpccmMKeDlEqjjlGXaq5lUvVir3/EU7LeLBairbXCoU13wkfcSoMJjad4ISvBDRkDWr4DN
	9R5zjqBA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5w0l-00000002AKp-2Bzk;
	Mon, 14 Sep 2026 02:01:35 +0000
Message-ID: <38c933e8-b026-42e7-8b68-6b469e39abe9@infradead.org>
Date: Sun, 13 Sep 2026 19:01:33 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Support WUJIE15 PRO HPT
To: Bozhen Peng <bozhenpeng93@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Gladyshev Ilya <foxido@foxido.dev>,
 Mingyou Chen <qby140326@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <0da43a8c-1755-49fe-b8e2-403489297f06@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <0da43a8c-1755-49fe-b8e2-403489297f06@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/13/26 6:12 PM, Bozhen Peng wrote:
> diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
> index 9e86ecc29..fd966cf18 100644
> --- a/Documentation/wmi/devices/bitland-mifs-wmi.rst
> +++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
> @@ -7,6 +7,37 @@ Bitland MIFS driver (bitland-mifs-wmi)
>  Introduction
>  ============
>  
> +MECHREVO WUJIE15 PRO (HPT) firmware variant
> +-----------------------------------------

The underline should be at least as long as the heading line.

-- 
~Randy

