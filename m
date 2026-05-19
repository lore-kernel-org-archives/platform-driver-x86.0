Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0E73A1E7B;
	Tue, 19 May 2026 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188976; cv=none; b=owF0pwBhMpetYZi48QWDMgGV9holFgkCuoxdj6tx52G3SRf1Wij3lQDQzG+iwIomlx2zYnCuINHvAadE/q35xkvAcT3OcUdPODskBhWSe/ZzXe3tqqQbZJdH0dxPAB/NYGyDEhlPpxytQpUNgO5v78LUKEKPdLvD73a8ARk3+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188976; c=relaxed/simple;
	bh=LHpSYqOACSXL6AviOxrQQLK3j9WhMa9CKdbDp/NsWJM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DzqJ/XagKQB5EaHEwPXxdJtA5HAhfMueg00ld7I3dPSIOAY4/my/Wx8Dvq1WzIibSBAD5w5FlPT4dmskRtWnEcGsxSAfIa4isETgA1IlN7HtTsfZJUEXGviLgjnjIqcvf8F+i4ClK2HR5KksxZzBzDCQymvMOHkvaVPlKFdWsws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ng+zX5iF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ng+zX5iF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779188975; x=1810724975;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LHpSYqOACSXL6AviOxrQQLK3j9WhMa9CKdbDp/NsWJM=;
  b=Ng+zX5iFW/jHWW9A1S0j+BQYx4i1Cko6crfuy75W5X5IbE1PauWKZdK0
   6e+dRDlSZvkMn7sPW/KMdL4rK6cmcH2cyJg9Sc4tKJs465p5In6PsVAef
   ejQnxdaPpxIcM+v5yLwXxNpz1ToKw9ErrA8Q9Y2nO/M1BJiLfr3yJYBzt
   ePeCXtnPn6OqmoM3jG1yk9bxXMzTYGcQlD7BKikLoiBLOTjs/MGCE7/ic
   hKSdjVPUyoR1D3fgYolcu7+ivom99ZY9k+pJy6s1W1DjIJ1CTWlU1UeMk
   2Ty+gL+q9Zg7LZag6LwEti0RtjQ2OVBog5RXXP1UL0KYlWxtdgog7KHjy
   w==;
X-CSE-ConnectionGUID: Fs3tSIygQ62AjmNSYf6oWw==
X-CSE-MsgGUID: em2KoHY2TwaHMXL07Dmb3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97497170"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97497170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 04:09:35 -0700
X-CSE-ConnectionGUID: b43nfzXnTrCsoUAdnQI0BQ==
X-CSE-MsgGUID: BKKf8LOHQTWsSRNYnEWzdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243728332"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 04:09:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 May 2026 14:09:28 +0300 (EEST)
To: Sakurai Shun <ssh1326@icloud.com>
cc: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: fix typo in uniwill-laptop.rst
In-Reply-To: <20260517024148.9642-1-ssh1326@icloud.com>
Message-ID: <69dcee54-cb48-aa66-f958-0de00060847b@linux.intel.com>
References: <20260516070650.9454-1-cheesecake2960@icloud.com> <20260517024148.9642-1-ssh1326@icloud.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 17 May 2026, Sakurai Shun wrote:

> Replace "benifit" with "benefit".
> 
> Signed-off-by: Sakurai Shun <ssh1326@icloud.com>

Thanks for the patch.

When sending an update, you should collect the tags from the earlier 
version.

No need to send another version because of it, I've added Armin's 
Reviewed-by while applying to review-ilpo-next (it will appear there later 
once I push the local changes into the public repo).

-- 
 i.

> ---
>  Documentation/wmi/devices/uniwill-laptop.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/wmi/devices/uniwill-laptop.rst
> index e246bf293..65583b239 100644
> --- a/Documentation/wmi/devices/uniwill-laptop.rst
> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
> @@ -189,7 +189,7 @@ Indexed IO
>  
>  Indexed IO with IO ports with a granularity of a single byte can be performed using the ``RIOP``
>  (read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods are unused because they
> -provide no benifit when compared to the native IO port access functions provided by the kernel.
> +provide no benefit when compared to the native IO port access functions provided by the kernel.
>  
>  Special thanks go to github user `pobrn` which developed the
>  `qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which this driver is partly based.
> 
