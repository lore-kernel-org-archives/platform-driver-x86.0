Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0215119F12A;
	Mon, 29 Dec 2025 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767021713; cv=none; b=iUMnPI2fPZSkxyv9G8B5pFUV+FZ03qHyKGSNEYrNSAzXO0iNtIaJ3b5ZaoDZ09BKxvCOExwVF61gJu980FykYHUcKKJ83NfnKxNCV2MG94mvhiImjvt4oCbaHB8wLI/lmzOSpCvWqN9m2rAOaWYFwLspZuuymh4yp42iCKC5Odg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767021713; c=relaxed/simple;
	bh=3ZtmIapkEIXDViMLF51sDtLL9EBbgtLV80qdIGkqajs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VT22SIuRks9chMRb7BrdwtsHjpBomyR8NAlmKjxtzjJIUIUOAH83/ZXyx8I9IC393kLYQxZjzr+DtKQNhVwcTXMfqRR1UTCnKtARKZo9NjiwAeZEQTRwB2yH2zaIE6Yizk9hEFmKacoWuVXaW05oA0QHGN2sxubc0Y2XoKIV1q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZltFW3e; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZltFW3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767021711; x=1798557711;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3ZtmIapkEIXDViMLF51sDtLL9EBbgtLV80qdIGkqajs=;
  b=IZltFW3e9eGXazLc0rvFPtESMIDUCJbz8HnjQdW+Oh0pfYxMI4tQsOP9
   fzyy+qpuxXX1LtXI3DkYW7PgmT8s8C3RA4b8KrnjDC6QPlf7df/yQ0cUg
   P4sG1XgmmOiPW88UKZwhggJYsy0JAODBT/4u/pb5xBL1JgrV4qabO339H
   EeJ62GHALzvUazn76TPwyV+A70wvoFhJrVdXxPZSzkOuFyGhch06VDJ/z
   6K3i8xffQ5l+3RVbWB/sufS56QWnqTEYU/BTcb+1KH9Z8/OmzA6NhzPDO
   SE1InJp1H6rWOBXB+PZpUCtp3BkaWqQ+S9juXEv+62xpSmZYHu2M+vu8c
   A==;
X-CSE-ConnectionGUID: qOMDBDotQficxN2TonsVKQ==
X-CSE-MsgGUID: 0YTY7fGdTP6vDVtP2c3/Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79356897"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="79356897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 07:21:50 -0800
X-CSE-ConnectionGUID: 3O0fmuIBTTyYYqkoBI/WOw==
X-CSE-MsgGUID: SbKC30oRRwC3WqQiz/oAqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="200828911"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 07:21:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 17:21:45 +0200 (EET)
To: Akiyoshi Kurita <weibu@redadmin.org>
cc: platform-driver-x86@vger.kernel.org, kuurtb@gmail.com, 
    Dell.Client.Kernel@dell.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: alienware-wmi: fix typo
In-Reply-To: <20251223111838.2579217-1-weibu@redadmin.org>
Message-ID: <2c6bc38e-aa36-6c89-7464-55555c70a655@linux.intel.com>
References: <20251223111838.2579217-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Dec 2025, Akiyoshi Kurita wrote:

You need to add changelog, it's not enough to have just the shortlog in 
the subject.

-- 
 i.

> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  Documentation/admin-guide/laptops/alienware-wmi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Documentation/admin-guide/laptops/alienware-wmi.rst
> index 27a32a8057da..e532c60db8e2 100644
> --- a/Documentation/admin-guide/laptops/alienware-wmi.rst
> +++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
> @@ -105,7 +105,7 @@ information.
>  
>  Manual fan control on the other hand, is not exposed directly by the AWCC
>  interface. Instead it let's us control a fan `boost` value. This `boost` value
> -has the following aproximate behavior over the fan pwm:
> +has the following approximate behavior over the fan pwm:
>  
>  ::
>  
> 
