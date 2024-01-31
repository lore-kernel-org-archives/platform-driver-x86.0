Received: from a1i923.smtp2go.com (a1i923.smtp2go.com [43.228.187.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7AF16426
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 04:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.187.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706673717; cv=none; b=oqjMAKNYu39+aKtUQbLGBNMRxaRWYiE5fy/0gLgZQPSzcaanSgSbWGuC8hxcxh2TYfhtdNu7wUqu1dTQLuBfipzZq+OIO5zJLVefIpCVz+DgQBsxwxnCFcrlbplj2S7G8IkdMHjacb3yNm8oFZNeUOuiNELr/YuTHbP6IuNRWaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706673717; c=relaxed/simple;
	bh=d0Z9qJSFTqxIOjmqZDL+YnDR1QAbROfuIIWpXVL5ruE=;
	h=From:Date:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BDEkVQFNUa0vU9fMQ7ipeuzL6xOyqsvs36HZ/74Qyr4DdyPyTLO8zMyO4ci10q2JJfyPI1R6VfAZE8657uSFd5f+r+p9GXN6k1BZP/hvb54dW9RXDxx4ckiobMdnZG+osnAzY0aQBggNwDfOmt3ZNCyG2Fcx79oCZhb+LmVk9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=wohsDM4y; arc=none smtp.client-ip=43.228.187.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="wohsDM4y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1706674614; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:Date:From:Reply-To:Sender:
	List-Unsubscribe; bh=2xL2mOUD9XwoqKsIHGXoC3ukneALHdJfU8TijpImKy0=; b=wohsDM4y
	2GyA5oO6MhiWbBZcrFjWj9miKsNTdxFDtCcDB4y4MIRdQm9mbzwa1Io921bqHyVyy02qvgVwwEnTh
	i8fxCob0OX4RMcPbgR0fXfOS1GcyxLJgwAPO9CLpqIPWuNgSqdasMgHWqBwGRBf18RKhJb/sVnfWE
	XfKdRMccjwmMz0HP7ePDwtqiraS6ngiFm70AtMAFAwKJZ8M36NlJTllUAGPufazRkDpOJD7KBizXH
	gqWZAlyFONKBpv2h1WH0nRQQSrpdtB6lXZUVvY/uQastTqPMqVdoc2w8KCBV/6GL8Es82HrHt3lKy
	XbjmNVLJCvyK9eJtUZMMuiAElQ==;
Received: from [10.45.56.87] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rV1nM-l1jktM-M4
 for platform-driver-x86@vger.kernel.org; Wed, 31 Jan 2024 04:01:52 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rV1nK-ynZKyk-1I
 for platform-driver-x86@vger.kernel.org;
 Wed, 31 Jan 2024 04:01:51 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Tue, 30 Jan 2024 23:01:47 -0500
From: "Dennis Nezic" <dennisn@dennisn.mooo.com>
Date: Tue, 30 Jan 2024 23:01:47 -0500
To: platform-driver-x86@vger.kernel.org
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
Message-ID: <ZbnGK9VBLro86dCg@panther>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Smtpcorp-Track: 1rV1nKynZKyk1m.INYvv_qotytll
Feedback-ID: 498822m:498822aoToIo_:498822sZEw92SIK9
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

> > Dennis, can you check that your device runs the latest BIOS? And if
> > this is not the case, could you do a BIOS update and send me an
> > updated acpidump? 
> > 
> > The reason for this is that currently, the button device receives only
> > system wake events, but no button press events during runtime. Maybe
> > this is a BIOS bug, although this could also be intentional (fancy
> > power button).
> 
> I was /finally/ able to update my BIOS slightly, only with the latest
> freedos image available, one version up ... there seems to be another
> newer (2011) windows-only one that I'm not able to use.
>
> No change.

(I "hacked" the "latest" 2011 bios rom in, and although it reports being
a newer version and newer release date, acpidump is exactly the same.
dmidecode says it's the newer one though. No difference.)
