Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7938047CC69;
	Mon, 12 Oct 2026 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807576; cv=none; b=iWNGVZSLVLen4WsCuwx4lbqFFYfjZVfoxjHVkOEDjJZTki/EmIwov3cxQs1UXTuJ/e6VomxxlQnwa7hdAsPpFXIncJMGncg6w7qH72qysMZjIoMLjaXAykSrXE0wUznB9gRHXTh7WPWfvtMxQgE04rsuHDf/7nTwcXRlGzeeeoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807576; c=relaxed/simple;
	bh=e4T5HfQ/ea+OX+yyn394fUe5sCwamkThu+J3w25QZk0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QFT1WxKZipjU0BJ7wC7peRsoJ+sYPuTejYhx9Ap+8ZVeTzr6z3o3xzf+QWxF1LIWR+j8xwI9PJaB4YibmIpMUUF8rsDswku5Z8CBndKEV2l6WKYmTtZzM1Shgwzf3LmiZArmHbIVqskliHpYn3BPyVco60PF6Znk+YsOMui4dfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k36hovAv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k36hovAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791807574; x=1823343574;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=e4T5HfQ/ea+OX+yyn394fUe5sCwamkThu+J3w25QZk0=;
  b=k36hovAvi45fhxrNlvgBqx1S3Qldg8wtu5FzQ6R2fAxH6g/ZB9kdh/cp
   JzC2DuTOnJ+qLLJu+DdEe4iTgeITS3tqBhKEzZyD/ZKEOYAq5MuY28n9t
   V/zxbowprc+oXnWKXdsb4P7Q0N35USi8FnGXX4Hn6wgw53P2pomQYFRqz
   3KtjnK3jYQdY/rE2O8m0wxFhdITKdmwZOvxaq1k/JeNSiOXouIuyblrJA
   YMvLM2tA9A6zwNoKCNIQrXaphAgxKy7ykrGW+mDhc5xiSDJaX6tpSf5b5
   +Ep391G/rjKKeo1MNw1HgIgjk6HC0e7amPzGMO8Ofla4z7SJVgi+ko7AY
   g==;
X-CSE-ConnectionGUID: xiCkpuirRwqlAXNmApdeCw==
X-CSE-MsgGUID: NEZcI21dSfmoxgViejE21w==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="523163"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="523163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 05:19:33 -0700
X-CSE-ConnectionGUID: gbch9FkDQHGxOqlhlmDVGg==
X-CSE-MsgGUID: 02kRS+0zTtuif79TmnROyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1073001"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 05:19:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Oct 2026 15:19:23 +0300 (EEST)
To: Mingyou Chen <qby140326@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
    platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
    Armin Wolf <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>, 
    Chris Taraszka <chris@miget.com>, 
    Matias Civadda <matias.civadda2342001@gmail.com>, 
    =?ISO-2022-JP?Q?=1B$B9b=1B=28J_=1B$B=3DSJ8=1B=28J?= <btx342@gmail.com>, 
    powerfullz <wleizc7319@gmail.com>, 
    =?GB2312?B?y+8g0/7D+g==?= <wolf109909@outlook.com>, 
    =?ISO-8859-15?Q?Milo=A8_Vlku?= <vlku.milos.fun@gmail.com>, 
    Rsplwe <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>, 
    Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>, 
    Nika Krasnova <nika@nikableh.moe>
Subject: Re: [PATCH v11 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute
 key entries
In-Reply-To: <20261012100532.19612-4-qby140326@gmail.com>
Message-ID: <80e3176b-1d16-945f-1a9c-f9602aee6a89@linux.intel.com>
References: <20261012100532.19612-1-qby140326@gmail.com> <20261012100532.19612-4-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Oct 2026, Mingyou Chen wrote:

> Add the missing Redmibook mic-mute hotkey definitions to the shared
> sparse keymap table:
> - 0x00002101 (Fn-lock disabled state)
> - 0x00012101 (Fn-lock enabled state)
> 
> Reported-by: Nika Krasnova <nika@nikableh.moe>
> Link:
> https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index a6978d14b975..93a519b96189 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
>  	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
>  	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
>  
> +	/* Mic-mute key */
> +	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
> +	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
> +
>  	/* AI button has code for each position */
>  	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
>  
> 

What about this comment:

https://lore.kernel.org/all/20261008152651.1510220-1-uselessfire@gmail.com/

-- 
 i.

