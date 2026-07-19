Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1C43624CE
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 22:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784501680; cv=none; b=PG17GPCT+CBJIf5M3mDk8G0NQWRGkv0qZpBR99u7j0oYo5L0qI/mxVYXrH11VSXVBiyDvoEtxsn2foYu5U0bbWvUa846+t/Sz+PhsHK/L3MkimcM9B0ZS4HEbSvGzxLUozq8lAgBgiEcmYTFcWXsnPkpiCvrH3FWKAMRLYQO8+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784501680; c=relaxed/simple;
	bh=6h7Zl+qQVxWwwLNDblZSH+OAgmOGACOTDe5d4+A8H0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1PDUZgcLw10Bt+mBks5VrvM9x0+b1npCrzh/qOwpO4TrjC5W+TzeJ5OUYoPegHr1ExsJB4RVymc4LEMb9Yb9NSRtx2viTKsQPOeRNhH6K6yD1Z+j7Om9nt5D7+3ncwb/9mXOeZy0duPjIqVGAQAf5+xNg444himfjabky96Liw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=RHRIE9qd; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="RHRIE9qd"
Date: Mon, 20 Jul 2026 06:54:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784501666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VPQG6ZvSD/n62usd3XLtKNk1YS8Rr48P6+5K+Z8EIl0=;
	b=RHRIE9qdcVNC8fzIKGZh9rjfxNL2baC20gx+uOCnLWneXezHnG3VnAjKL1+SS7WZlpbFy0
	Ghy3UWgUwsP+D0tKdcB4y3vKzp4dhVmWezhwr29ITTdbhxFiitaihGJyduh2c/8K117MEX
	X1Ov9nxvEHmWYfR2iU+TyycNrVPHxOG81MOf/Z9lCpi7HXEM1KBvVx79re0PoScSS/kpq2
	buxn4Qq0d47KGMc9qzivpaQrlQYx5jM0iEoli+8xsWQCd2W1du+vBfyykPoV8euQp4l82Y
	MvJoCfxpWL52LpMfjGlDfRX5+nvfNtai1teyJbM7yWnvOWI7Rj5rA7+CzR1Kmg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Yahya Toubali <yahya@yahyatoubali.me>
Cc: Jonathan Corbet <corbet@lwn.net>, mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: wmi: lenovo-wmi-other: Document
 intentional BIOS misspelling
Message-ID: <al1VnJ-JFh_uYtYf@wyuan.org>
References: <20260719173710.2367930-1-yahya@yahyatoubali.me>
 <87o6g250ya.fsf@trenco.lwn.net>
 <20260719224317.2450320-1-yahya@yahyatoubali.me>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719224317.2450320-1-yahya@yahyatoubali.me>
X-Migadu-Flow: FLOW_OUT

On Sun, Jul 19, 2026 at 11:42:46PM +0100, Yahya Toubali wrote:
> Hi Jon,
> 
> Yes, I used an LLM to help me format the email text because I am still
> learning how the mailing list process works.

I suspect it's not just the format.

> I will work on my next patches to make sure they are well-structured
> and follow the proper git mailing list standards.
> 
> Thanks for the patience and the explanation,
> Yahya

Friendly reminder ;-)

You may get started by wrapping your email to 72 columns first.

Thanks.
