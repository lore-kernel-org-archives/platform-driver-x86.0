Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DDD3C6A56;
	Tue, 17 Mar 2026 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752451; cv=none; b=tUxLoZsDX1m8LYRm1FxkthK9CmfMim1miVss1pvp/6DAjFKSq7zhs7BIfIDXP6euWfnPuFOn7iQaSRxRx6S8i7dwEJnoel70/vI1K/1X2TJNgtmwziMNIHVoOuFeDvLyayH4lyaSGlLewVOu4nGkmba64AVNpXUXhEE5HfkGBeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752451; c=relaxed/simple;
	bh=cVpvQ2KlasD+JiIyrzYIv4xH5P7evueW9utTr/YUCMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L+Y4PQciDq5bHDFAtuDOPiM3aok9ZsMl4mqhNWRTdwVDVCbhwbEWYKuRT0bccKXjrJI+IyueQDgsSFCW3NinSvUZYTKsigHk7ZR7c7vxWFuzMzo96dxbOzEL+MG4ZPBVwwpKw0sRD+lZMJOxZsr5YXcv/hw3EvvgdmdqOejvIu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSs0zxvF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSs0zxvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752451; x=1805288451;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=cVpvQ2KlasD+JiIyrzYIv4xH5P7evueW9utTr/YUCMQ=;
  b=jSs0zxvFUPZxOhxBD2h0rUUSAKDZvf+bIL8KtuBuwAeyHSKVj30fvcgS
   gsLqxr8zc1AExERGbeIvoMOJXFGJ/b3uKSZqxLBjnilKFKhXnt38n6yT+
   eCGarifO9jIaKSE7S6TputbYLnDRB1kNlxwtuGbh0dEUpeRAwD03hxpAk
   3knOR9s6W6Wi1ZKkW1fNRVAHPPy6lp43oJdbmOFOEdQapo9/b7sRVtsGs
   RyT9bsYlZQShZ8Ywlz/Y5cM1De3kVqkiMed/HrHBSzEISoExghEMlwt4u
   vWg5GSdkWHUOeBT/vSvoWg62A1yOB2Z1DfoTEKQjtJeEESnj5vkaoInvA
   w==;
X-CSE-ConnectionGUID: X4sG+tSjTLGPlokOozzVrg==
X-CSE-MsgGUID: 2nJdwgJgSKikkC8OF4bctQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100239202"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="100239202"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:50 -0700
X-CSE-ConnectionGUID: FT7Du6ENRXuCRUuMTdgAmg==
X-CSE-MsgGUID: waQGyov5Q6SXF79BRkCxTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="217962594"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260313-lenovo-wmi-gamezone-remove-gz_chain_head-v1-1-ce5231f0c6fa@kernel.org>
References: <20260313-lenovo-wmi-gamezone-remove-gz_chain_head-v1-1-ce5231f0c6fa@kernel.org>
Subject: Re: [PATCH] platform/x86: lenovo: wmi-gamezone: Drop gz_chain_head
Message-Id: <177375244084.9137.13371850428996047374.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 15:00:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 13 Mar 2026 14:06:34 -0700, Nathan Chancellor wrote:

> After commit 1ea4b473504b ("locking/rwsem: Remove the list_head from
> struct rw_semaphore"), which removed a reference to the variable passed
> to __RWSEM_INITIALIZER(), certain configurations show an unused variable
> warning from the Lenovo wmi-gamezone driver:
> 
>   drivers/platform/x86/lenovo/wmi-gamezone.c:34:31: warning: 'gz_chain_head' defined but not used [-Wunused-variable]
>      34 | static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
>         |                               ^~~~~~~~~~~~~
>   include/linux/notifier.h:119:39: note: in definition of macro 'BLOCKING_NOTIFIER_HEAD'
>     119 |         struct blocking_notifier_head name =                    \
>         |                                       ^~~~
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: lenovo: wmi-gamezone: Drop gz_chain_head
      commit: 6b99cc51e13e816962318e2f97e6ac58dc431c33

--
 i.

