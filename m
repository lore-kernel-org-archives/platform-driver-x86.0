Received: from a1i923.smtp2go.com (a1i923.smtp2go.com [43.228.187.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B49D7EF1B
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.187.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706721434; cv=none; b=QZd2N4LIm4tBXKwmZ71Ls0kY0PQINUc/35EXISSqaKapJ3IClIIgxk8VN2LrsID92B7s6qCukmvfNBXLUrZCN9jabeXtdmIMWIusK0cHFGlYsvw81kN7Jp9uj6tNULJ6Ln8AeWBbIG1e1DF1QdRY7E1kcBzuUyW47I17dODBHv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706721434; c=relaxed/simple;
	bh=wQzrjVjdkAgCCOfGnQ6fT5uoy44+70IvEbcafz1SPOc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXBEr04AGW11akA8nWm8Vw6Rm/0IbVPV+5j15wVkcjURuzx3eafFDH0CTQrCTdrYdry/coW+a7KgGd6yu4acgue5Y5M2IDoaxxOM2ViOX65h7VnnoBfIuy4FTz9XkCQ/+3o0kNYbEf9wjdBgx7siLFO1dTrwYK0npRuYyjyO1+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=XlZElrUV; arc=none smtp.client-ip=43.228.187.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="XlZElrUV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1706722331; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:Date:From:Reply-To:Sender:
	List-Unsubscribe; bh=38KEIY4xJ8TEpOuGTiguC3jrcKAVbr/TADJ48hvIrjI=; b=XlZElrUV
	WW35cfr8YPGN+M68lCgrzIgaY+/Mchv//mlFdg6M1WMFRfIrFFFrylm34OXHW2awntNjX5oOPIWmc
	5nYEoloGy8k5yT37FoS4EppJV/3d2FwEKDg2sSZe+tP2n2+INtzYhdDp8QQMBkcqcBPIGtQeHVt8I
	PizareTneUljpJhmKKiGAeTF3IZhJbAKoX04OtDhzqgDkTRLx18twp7sCv16nTxahBYOKLotiBrqm
	gSjXPa9Q2r+Lx2m9z3SSVAuk2D2eUhTvE+D+QozkhIVbDqV4Gk9CWQhZnQuIZVfr6pqVMOskl4wU4
	IWEoZk2EtXvNicMKe/k8yOEgCw==;
Received: from [10.45.79.114] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rVECx-l1jdaN-RV; Wed, 31 Jan 2024 17:17:07 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rVECw-g34Cl4-0O;
 Wed, 31 Jan 2024 17:17:07 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Wed, 31 Jan 2024 12:17:04 -0500
From: "Dennis Nezic" <dennisn@dennisn.mooo.com>
Date: Wed, 31 Jan 2024 12:17:04 -0500
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/x86: Add ACPI quickstart button driver
Message-ID: <ZbqAkNe3ONcteSQ9@panther>
References: <20240131111641.4418-1-W_Armin@gmx.de> <ZbpqZqyIHuX0s5vz@panther>
 <4bd98f0f-831d-43e4-acfb-f8e65ca027fd@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bd98f0f-831d-43e4-acfb-f8e65ca027fd@gmx.de>
X-Smtpcorp-Track: 1rVECwg34C_40O.I5CQvRwlVy9d9
Feedback-ID: 498822m:498822aoToIo_:498822soj83CG8eh
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On 31 Jan 18:07, Armin Wolf wrote:
> The issue is that you machine does not support runtime button events on the quickstart button,
> only wake events.
> 
> Can you check if you can now use the unresponsive button to wake the system?

Nope, only the main power button can wake it from a sleep state, those
quickstart buttons do nothing.
