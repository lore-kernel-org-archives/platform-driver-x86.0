Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB1014ABE;
	Sun, 19 Jul 2026 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784483056; cv=none; b=kcEyic7yw0nMwUFT66SmIjMz/wUCS+RPjJLzb2G8xOThc9fsIC12bS5AJO1SWwthVXhaDMVM8+9bmKbp+QahQbjonbfA57YH7i8GDehEB2cbwywdz1r4XR3HWScw145bE3l/rTxWistD/fyNeh3By5aYU8Yvqh9PtXeYL8i9QOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784483056; c=relaxed/simple;
	bh=oqIlF13FYtToWfCw0PAO56C3stUXhka2Ur5vpR0phmQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PJSPDT5EPypEENiwQhNF17vmmzUlhnsb/9vYI+m+NifxkuqQTSGeQ4T1i7YavuB4uP2HPE0jxd8lINy8MxshGZWUaNhwf/NlYM7SLjU9ClgUywx4zffo1shvgp0hy2vEiQ9GGf20+gzG81phhobgmPkn+cK9NZjdVqPmVHMfM2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gO0RogPC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gO0RogPC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C1015408BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784483053; bh=iDopaxRzPF/gKPxBxgw6/irDLrGKGrxe1sfKCY3bUHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gO0RogPCjtIdk9SXtQ2XnczV87OSCi3Jj9oU6DfrMO/sniXf91DVRwqef90zD08C/
	 mOAFN6hJtTAwegey3N+7dOjaOp1ki2ePjALl9hm7U2Rk4djqt/ZDHYBibZpnfLc9Qd
	 xdsGRxL0b44pz03LU95KURVbkox95vbYaxab8q+/FxQ+i7BaXxnv5HM7tEwrkVu8M0
	 5VAb+i2s6+NyRoTg2Wg/xbT8lbLXrtv8uT3hdTsSO6hzPbKoiMAaZiQOIk76q1139N
	 4J4xXlos4/7rHcTqW/RmNDJluuNxWyjdpxmHMVBn+J+tgDqK9LSpf72vgjrTx2LvJF
	 krsCh21hSVaoA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C1015408BC;
	Sun, 19 Jul 2026 17:44:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yahya Toubali <yahya@yahyatoubali.me>, mpearson-lenovo@squebb.ca
Cc: linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, yahya@yahyatoubali.me
Subject: Re: [PATCH] Documentation: wmi: lenovo-wmi-other: Document
 intentional BIOS misspelling
In-Reply-To: <20260719173710.2367930-1-yahya@yahyatoubali.me>
References: <87v7ab3p2p.fsf@trenco.lwn.net>
 <20260719173710.2367930-1-yahya@yahyatoubali.me>
Date: Sun, 19 Jul 2026 11:44:13 -0600
Message-ID: <87o6g250ya.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yahya Toubali <yahya@yahyatoubali.me> writes:

> The spelling "Minumum" in the FanMinSpeed entry is intentionally kept
> as-is because it reflects the actual string returned by the system BIOS.
> Add an explanatory note to prevent future redundant spelling-fix submissions.
>
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>
>
> Thanks Mark and Jon for the context.
>
> That makes total sense. I dropped the housekeeping typo fix for now to avoid
> unnecessary churn, and this v4 keeps the BIOS spelling but adds the explicit
> note documenting the firmware quirk as suggested.

For future reference, text like this does not belong in the changelog.
You can put it below this line:

> ---

...and the maintainer won't have to strip it out when the patch is
applied.

>  Documentation/wmi/devices/lenovo-wmi-other.rst | 4 ++++
>  1 file changed, 4 insertions(+)

One other question: are you writing these patches yourself, or using
some sort of LLM to create them?

Thanks,

jon
