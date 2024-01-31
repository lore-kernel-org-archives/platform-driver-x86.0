Received: from a1i923.smtp2go.com (a1i923.smtp2go.com [43.228.187.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777BB17BC8
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 04:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.187.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706674013; cv=none; b=rpKvuZSkLXBapnWKq14fGVBnsvUh2DIk+aTkShVJzl2tSwVDenfMNDa47jBFcKHHHLkLFRqb9+mDUMc/w1gRjfKodcMqDvF8V2fzFJlK8KuamPp8AFMQ+qtptx1lR0QMnBC9ivb07+p9aVOhxXQBMXjFLOpei6cWm1bd6SarjGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706674013; c=relaxed/simple;
	bh=2xL2mOUD9XwoqKsIHGXoC3ukneALHdJfU8TijpImKy0=;
	h=From:Date:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LE9pPLFwb4MpFxR4fnrjuILCnVj0yf1276U1kbucLhfmS+v68z2PAen3xX/R+EH5mNC9KkESMwIFs/wZUv0l4EWCSNLJFNL1MCgLhPfj+C5BdpZ5FnCyYiJ+BE9O74RFfqXyHAuRSmqBUlyjckqaVvV6jEHPQ5Ii9E/0Blq6jwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=eFHaj+gd; arc=none smtp.client-ip=43.228.187.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="eFHaj+gd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1706674911; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:Date:From:Reply-To:Sender:
	List-Unsubscribe; bh=2xL2mOUD9XwoqKsIHGXoC3ukneALHdJfU8TijpImKy0=; b=eFHaj+gd
	tI2pqB9/d1FIEMQJO7sgHy9BGuNEBvbmNEn1ln+U8tJZX+egHHmULWB+sS0twpn1iq6xO3Pg3tp/W
	3enb0GPZXVdaiTOlfusrtWIdiK+31EhoTTSORWocEIyPb0q7wdzGo92KcLLNyeZ3Zev9MaYbNO9wt
	TuAgAjpp4Cd4KOg/vsq2YizpjLeWW1Y1kzn5/gdGvF3zKsPDvLFapg2RaIIHb2QsntenPGYa1YvCe
	r4K7f8Fp5/iqerOacxXFxhMKWiFLQBXD1KU+TMP5pjQmnxVdsBMPg+kgOcW5JKc5cZzpBSN/hS0Kw
	GhyD8wEKAWrcHOZNvXxixwoNKQ==;
Received: from [10.66.228.43] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rV1sA-l1jkZJ-9m
 for platform-driver-x86@vger.kernel.org; Wed, 31 Jan 2024 04:06:50 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rV1s8-wSEozO-2y
 for platform-driver-x86@vger.kernel.org;
 Wed, 31 Jan 2024 04:06:49 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Tue, 30 Jan 2024 23:06:47 -0500
From: "Dennis Nezic" <dennisn@dennisn.mooo.com>
Date: Tue, 30 Jan 2024 23:06:47 -0500
To: platform-driver-x86@vger.kernel.org
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
Message-ID: <ZbnHV2PsaZeQYXVn@panther>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zbk9fAMf_70EfLA3@panther>
X-Smtpcorp-Track: 1rV1s8wSEozO2y.INdZv_v-nRhGo
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
