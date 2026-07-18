Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326203DD538
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Jul 2026 16:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784390857; cv=none; b=Nal7Z/sTn03+7skNejT50ZO6dlwfphVDQpL4/NugFBjIEWuNLnSaaDpBNeUXG3/C8wpRf0KJreJvStQAORZBwOi1GmPHt1YPASfxkScWEsFf5145vzFi/z2ADWCHvgqT8187wehcOOnzvE7bPUvSkouyQdBoT9t8bxTiCJlhqGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784390857; c=relaxed/simple;
	bh=0tkHVs38qBONTZfqi/mF0p62rce8wQD2qOPTHzC2JPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVX4fHmZAJcgeXjbC+B40nEpBMaSoruFANiWFYSSIkMcj7SQLx1rYV4Faw2QxckygOZXDFEp4kO0ar2PokNSTYssfuYa0ITzXMxNxQ4f5BGlfLmGu13DOHCOJdpl+mUoaDFCpuVX0wEUd9TcwGLafUnYdIkqaGD58MiqZdJDoXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=YB9F70mf; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="YB9F70mf"
Date: Sun, 19 Jul 2026 00:07:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784390846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/25ta5xlo6p4cnt6EZ5DIe5/5JM6jQvLXP7zu1ZdWY=;
	b=YB9F70mfQ9DeixojMAe4Au93J6HQOV50ATssWsKwFsCDXvBBgLQKbC2fILPqTGKY//7VqL
	N/r/UjT8AoonN+ycsh+XVDrukE4yDU+3MEiJY2v9wUBSJaCZ/LdSE0I/L/vVsnaBdbvNRk
	lnQVkH6XSikBZSYtMRANV4YyxvzOZDzbBC5Qep4nOrZppOJ0lqGNsmVvRaf8dpap6KKw06
	mTxPaIC2fMGRwkItWLCwObP5s9T9/XLC0D7fuIYiiRvYLul4QHabXokjVH9lZVq8hfDyna
	jyDLnpvb5Gwcn+l6ZSjHU9e/UEba+iVqZq0oUktuPF9bOleNg0eSSmrjS8X3uw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Yahya Toubali <yahya@yahyatoubali.me>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:LENOVO drivers" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 4/5] Documentation: fix spelling typos
Message-ID: <alukuB0r73qfc1PG@wyuan.org>
References: <20260718151913.1892547-1-yahya@yahyatoubali.me>
 <20260718151913.1892547-4-yahya@yahyatoubali.me>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718151913.1892547-4-yahya@yahyatoubali.me>
X-Migadu-Flow: FLOW_OUT

On Sat, Jul 18, 2026 at 04:19:10PM +0100, Yahya Toubali wrote:
> Fix 'Minumum' -> 'Minimum' in lenovo-wmi-other.rst and 'maintainance' -> 'maintenance' in housekeeping.rst.
> 
> Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>

Hi Yahya,

It's better to wrap your commit message to ~72 columns.

See:

  https://docs.kernel.org/process/submitting-patches.html#subject-line

Thanks.
