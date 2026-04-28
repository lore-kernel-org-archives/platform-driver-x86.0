Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4303C6A57;
	Tue, 28 Apr 2026 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392345; cv=none; b=eJ/vU7qxIpF1Ri6O8AVLD65qf9ZuYTRVam1WXjzO27U/nmLhXTnPyBS9pcEJx4Vf8G5sChE5uXTBLp47gIDn986sZUQQw9HSUpa9N1pBU74EXj49Ur51klgxngo+VVLNmF7PQi9ntsFQXPp0WSnrgG/A9ssaFo1oAFH9y1oxRAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392345; c=relaxed/simple;
	bh=nrVs7N/gpoWePpx+5HFefMlRCtK2g6r81t29A+1/JJs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jBUbKCp+t+51v01SlC2EeFIdKzVmKpBJPcjjcD225a/zrikQ4D/hfODeNkQcbdPj+3/skViVOFwLLUidOww49mqHMdgRfZ0YHBTfNNMegj61SNH59y/1X8A8ZSMPQ8EF5yycyMaRFQNTx0oyh+ciu+DCEWRmHWs4mVSYaYm3nkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdL7pEKz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdL7pEKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777392344; x=1808928344;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=nrVs7N/gpoWePpx+5HFefMlRCtK2g6r81t29A+1/JJs=;
  b=LdL7pEKz5axGnFfnjuY+Z+8MVJoeIUELiX7BkdPBMgVoHtsThG/FWeT2
   h8J0z9SJI/pRFYVfRkWwhjYUdhIegmbmPANi1YzRzuz6kF6bKtztWMtOy
   XOYxNgFZU/yU5/OYot7+mBeSVIzLVu4l/d4slDraoALc2/CjCwc43oXUW
   4QMvQaPEL5LTfdtepgaq0ts9ziWTCgCh4j6hzzlzRkNkkKNY9bSHxBSx9
   Z0RciFv0ZLGtF/crHlPRyFavrSnclNG9/cNgq2X9a7NL7NxGok4k4KR0A
   cz8DZ3+WOLFLpPFzIFfzNlzgpLCMTzfA+sN3+Cf8fUTzaGbbSSgo+gwLb
   A==;
X-CSE-ConnectionGUID: 5THLk4YLSQW5wTrFpzvjuQ==
X-CSE-MsgGUID: 6rHpgn1ARJeLILosHkiuEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="80881213"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="80881213"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:05:44 -0700
X-CSE-ConnectionGUID: iQSsbNCfQdiRN9VIjXRNOw==
X-CSE-MsgGUID: nGhU85KhRvS+vVQrFeScFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="227468256"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:05:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260410091633.2822-4-thorsten.blum@linux.dev>
References: <20260410091633.2822-4-thorsten.blum@linux.dev>
Subject: Re: [PATCH 1/2] platform/x86: use u8 * for raw byte buffers
Message-Id: <177739233741.10973.10183395717862069127.b4-ty@linux.intel.com>
Date: Tue, 28 Apr 2026 19:05:37 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 10 Apr 2026 11:16:34 +0200, Thorsten Blum wrote:

> The buffer parameters in populate_{security,string}_buffer() and
> call_{biosattributes,password}_interface() are raw byte buffers, not
> character strings - use 'u8 *' instead of 'char *' to reflect this.
> 
> Update the local buffer variables at the call sites and in
> populate_security_buffer() accordingly.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: use u8 * for raw byte buffers
      commit: 9f82bbcac0a0d7727d7cff84ef517bf015752c9d
[2/2] platform/x86: dell_rbu: use strscpy in image_type_write
      commit: 0b9f109c318a88d40e8a450d56f9bdcece94a327

--
 i.

