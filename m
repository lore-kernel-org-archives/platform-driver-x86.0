Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00102FFF8F;
	Tue, 12 May 2026 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587303; cv=none; b=DUcsBl8HeS/BM6Agx9fQwABW9HCCNvEhCI0zitCY4hRgbZH5Zp9YQ6WYvubIsYZtz3dF6RCcm/b2SxYd4AcghQrCcb+l8ynofUMpqjHvLxiLiMKAAh+nzGFs8Kd+XcWM0xBLsRiFyxrNfS+WrpJM4SBnDO8lWzPAq0Wp6UYYSZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587303; c=relaxed/simple;
	bh=Sh0sM2FhR9mvSbUXTbK1MR2ZOY+y5mmVCASXwjuJibo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUCRcvH3r7K+TrM0cnvQ6blvQbHpSv4IGH0977X1pTP9u55D1RsdidhDxJtAK4kjdTQ1+YmbuHgcADs2IyMHvSkWpAuuHAiUmsgcVAOz8dt350vnj2xLGCP12X333QZYsUfusdmz8gU6r2Hxh4g8MAGL0wNNvodBZ/qSO9xupoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PsRsHsym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PsRsHsym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EF5C2BCB0;
	Tue, 12 May 2026 12:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778587303;
	bh=Sh0sM2FhR9mvSbUXTbK1MR2ZOY+y5mmVCASXwjuJibo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PsRsHsym3I0LehlqajPIWl49px1znrSjaPh6fA139i8jWH3YlinBZLmbDrGy0GITP
	 MA1PNyUU6sb+sItw1XMGzrRrv7ycKtRMsbNVFLYO43mAmWvj4liXOR/429DKoxQrOF
	 uzafBUxkWc+Z44PDMu9nmkIrZ+YfEWvhSpoqGb70=
Date: Tue, 12 May 2026 14:01:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Muralidhara M K <muralidhara.mk@amd.com>
Cc: ilpo.jarvinen@linux.intel.com, rafael@kernel.org,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Nayak K Prateek <kprateek.nayak@amd.com>
Subject: Re: [PATCH v2 4/7] sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary
 attributes larger than PAGE_SIZE
Message-ID: <2026051214-getaway-mammary-debb@gregkh>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-5-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427155129.545327-5-muralidhara.mk@amd.com>

On Mon, Apr 27, 2026 at 09:21:26PM +0530, Muralidhara M K wrote:
> Historically, sysfs read buffers were allocated with get_zeroed_page(),
> limiting reads to PAGE_SIZE.  Commit 13c589d5b0ac ("sysfs: use seq_file
> when reading regular files") transitioned regular (text) attribute reads
> to seq_file, which can dynamically grow buffers beyond PAGE_SIZE.
> However, the PAGE_SIZE limit was intentionally preserved for
> compatibility.  When binary attribute handling was later unified into
> the same codebase, the non-seq_file read path (kernfs_file_read_iter)
> retained this PAGE_SIZE cap for binary files as well.
> 
> Drivers that expose binary attributes larger than PAGE_SIZE — such as
> the AMD HSMP metric table (~13 KB) — cannot deliver the full content
> in a single read() call through the existing path.

That's fine, userspace must be able to handle a "short" read, and will
just continue on and read everything afterward, right?  You can't rely
on userspace always asking for more data.

> Introduce a new opt-in flag SYSFS_HUGE_BIN_FILE (040000) that drivers
> can OR into their bin_attribute mode.  When set, sysfs selects a new
> kernfs_ops (sysfs_bin_kfops_huge_file_ro) whose .seq_show callback
> pipes the bin_attribute ->read() result through seq_file, allowing
> reads of arbitrary size in one shot.  Existing binary attributes
> without the flag continue using the legacy capped path.

If this is such a big issue, why not just do it always for binary files?
What is the benefit of keeping two different code paths just for this
"new" flag?

thanks,

greg k-h
