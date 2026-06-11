Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB963E44E2;
	Thu, 11 Jun 2026 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179759; cv=none; b=WaSgm5iSSjJSkmTI8owsIAEfkg8KvtmAQkbA/oWvZztXUIDSe7yg4wLvp5rcVu3u69pJGnL2eC/uNpvHaY4+CkwsEv6w6S3yJO0S9RPPLTb54kw/FOJmvK97aq4ZoR6bHQX4Tmj15uUOzseDJmJnqUzwU1gpflO9H4bg72Wn3u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179759; c=relaxed/simple;
	bh=sNtRubcqAHDmCYl5kNV7lU1sAICN4UfL0yFmmXztLJ4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GM+cSBPkKJeaSrBZRTaGoJzNi4WL7FduCQfgvuh4Jb3m2JqXeTVICAIp9HkpT4TIyuiA8ceLCQ2gMB5ZpwmX0IieaMNY8jb3Zv4wbfnJ1nW6l4JJjzY3lSVqnggEUWnQpmk5RecypDQxZgI46GR7Twa58H68FVTCgjnmsHXN6xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/q72OK3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/q72OK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781179757; x=1812715757;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sNtRubcqAHDmCYl5kNV7lU1sAICN4UfL0yFmmXztLJ4=;
  b=G/q72OK3z9wDsTvdFdKeSvI+qNqYZBM7JxgEU7oQ+oYUzpk7otA4db2B
   nMnT8T5mqz/jNH/rEbXeQTDShGZSzD1rUyCtz+QlK5r7675x1PRLUw5pJ
   FDAWTF6qK+jZi7KxdzYLB3mVDh1qKKZPt9VQW7ZBcOIDu5FBAPZ6vhv4R
   vJK7IAUeDhOzHqSzWwx+s37o4GNnu8SgWMBbcmJGU9uoNdppjmKvfWBPQ
   twoJTs/VvaF5m1XX6GR77og/WkFrzNN29ITdedug8rN5mggqfRk3lJqp7
   ro+bC1CBUnU//kJLOhExoU/7JJyr7VweQ0ZnKq7AMJTnj4YwwSZt67kaa
   A==;
X-CSE-ConnectionGUID: vAWLyvMgRw29LrO+fwvxeg==
X-CSE-MsgGUID: sw53l1OYQ5mNL+NVwEBUHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85828409"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="85828409"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:09:17 -0700
X-CSE-ConnectionGUID: F3lrk+LoQMaOrfC3/7/b7g==
X-CSE-MsgGUID: M/2su+nrTze1nmdnSRZSrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="284539925"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:09:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jun 2026 15:09:11 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v5 6/8] platform/x86/amd/hsmp: Sanitize hsmp_ioctl_msg()
 msg_id for Spectre v1
In-Reply-To: <20260611052919.1095549-7-muralidhara.mk@amd.com>
Message-ID: <0a312950-54df-7290-e702-14ba31951b0c@linux.intel.com>
References: <20260611052919.1095549-1-muralidhara.mk@amd.com> <20260611052919.1095549-7-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 11 Jun 2026, Muralidhara M K wrote:

> Although validate_message() checks msg_id, a mispredicted branch can
> still allow speculative indexing into hsmp_msg_desc_table[].  Clamp
> msg.msg_id with array_index_nospec() at entry to hsmp_ioctl_msg() so
> downstream dereferences (including via is_get_msg() and
> hsmp_send_message()) see a bounded index.
> 
> Reviewed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 36ff83744684..a9dca97568b8 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -306,6 +306,19 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>  	if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
>  		return -ENOMSG;
>  
> +	/*
> +	 * Sanitize the user-controlled msg_id against speculative
> +	 * execution.  The bounds check above retires the out-of-range
> +	 * case with -ENOMSG, but a mispredicted branch can still let the
> +	 * CPU speculatively use msg_id as an index into
> +	 * hsmp_msg_desc_table[] (here and in validate_message() /
> +	 * is_get_msg() called downstream via hsmp_send_message()), and
> +	 * pull arbitrary kernel memory into the cache (Spectre v1,
> +	 * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
> +	 * dereference sees the sanitized value.
> +	 */
> +	msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
> +
>  	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
>  	case FMODE_WRITE:
>  		/*

Sashiko mentions there's similar gadget for sock_ind in 
hsmp_send_message().

-- 
 i.

