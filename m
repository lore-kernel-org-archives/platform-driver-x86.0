Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3AF423A83;
	Mon, 11 May 2026 16:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517940; cv=none; b=h+4Cpkv4lnvrJ1m4C6h1zhcjCJbNCilX74+hhy3LKyX2jqgG3b+mWbXk/O8CREdGnXwoR3xiWMmzIvg/TV0zBUyGZI5V/PS9QKdTntPYAZFSaiF3mna65A9BchloFXm0AeFK4yCtW0d1cmdPWbEayGddtuMZsc5mlnp1TQkooDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517940; c=relaxed/simple;
	bh=eS/Ai8qSubnyR4KR3BZitTHxELFAHF/XgAvKrEoJFeE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mJ1T4foA2Nkn6hwRdCp3AJeIAgos57FxBVZzNvbVgvc81P+B8UQBu+ImKuxmzIozTL7kUEfY9BkfOixBhffQpjTbU614asU6kad0iuMOwe6lrZjAtkct8jshvNLB8yfwr5NoEPMaAGf8vu7ziqkkEw4E0ozf5gd+IJwLbF1vYXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBlILNJO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBlILNJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778517939; x=1810053939;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eS/Ai8qSubnyR4KR3BZitTHxELFAHF/XgAvKrEoJFeE=;
  b=QBlILNJOGR4nN6GX9jDn8IQwnevJ6ReE2pgt3OEIKquBu62ePOaGpKTH
   XtLW4xLjYeWv2RSYTJZ1FzVBN3P+bhEJBOt/UPfxVNPkCa0IZWgnENWaH
   bnW9IPWYxvOlGsJxaeKZmOdWrZJCn6U1OC3FK1O0nc3rkngwvgktr0oyD
   QSpKjbGZzRRzeo/9nxVnyx2Tnj5ENUnRXoOdYlDJJzYPv35h5Zne7ZEd0
   emt0BY2PC/9E6P/KcUphui3KD8674ZTlWLp+mERIMOHdm6GdjThhoynab
   VYu1jJ1tXYdaPuQT2yDA9Dqn6ExDSrXw9kqHQ3NO/kFHuSc+NPAc8xtx9
   w==;
X-CSE-ConnectionGUID: DB3c0N/yQKSXCGgy+6pPKQ==
X-CSE-MsgGUID: ONfjbvseTTGOVDgng6WnDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79273973"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79273973"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 09:45:39 -0700
X-CSE-ConnectionGUID: V0stx07OSlmcmedPSv9jQg==
X-CSE-MsgGUID: ASUBzpiWR/ezaese1EVSxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="233019457"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 09:45:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 19:45:34 +0300 (EEST)
To: Melih Emik <melihemik@noirlang.tr>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: replace strcpy() with strscpy()
In-Reply-To: <20260506175031.25337-1-melihemik@noirlang.tr>
Message-ID: <de236862-343f-8322-b6c4-06c99122d7db@linux.intel.com>
References: <20260506175031.25337-1-melihemik@noirlang.tr>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 May 2026, Melih Emik wrote:

> Replace strcpy() with strscpy() in dell_rbu to use the preferred
> 
> kernel string API for bounded copies.
> 
> The destination buffer size is known at compile time
> 
> (sizeof(image_type)), so this conversion is safe.
> 
> No functional change intended.
> 
> Signed-off-by: Melih Emik <melihemik@noirlang.tr>
> ---
>  drivers/platform/x86/dell/dell_rbu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
> index 3fa9de9aa47b..85eea8898fac 100644
> --- a/drivers/platform/x86/dell/dell_rbu.c
> +++ b/drivers/platform/x86/dell/dell_rbu.c
> @@ -562,9 +562,9 @@ static ssize_t image_type_write(struct file *filp, struct kobject *kobj,
>  		buffer[count] = '\0';
>  
>  	if (strstr(buffer, "mono"))
> -		strcpy(image_type, "mono");
> +		strscpy(image_type, "mono", sizeof(image_type));
>  	else if (strstr(buffer, "packet"))
> -		strcpy(image_type, "packet");
> +		strscpy(image_type, "packet", sizeof(image_type));

As the sizeof information for image_type is available here, you should use 
two input strscpy() variant instead.


-- 
 i.

