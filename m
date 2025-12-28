Received: from mail.thenautilus.net (mail.thenautilus.net [178.162.154.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63C2188CC9
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Dec 2025 21:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.162.154.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766956018; cv=none; b=oS7VyG3nY73ggtIwFtTv8eRJf0RjsH4jWQxE38NiYNxbeESW+wh78v8srLZvYFo4KkEmsWAVdtztIlEpYRckPE45k56bRo0XDxzUOOm2zNk1Q+f1FZKjyJTLZd+vWzi9Xz8lVNoCkJaqMX65LQ0dlVd/CCRdbAUPHwOifGwZ/io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766956018; c=relaxed/simple;
	bh=FsXkOQrZzrS1tMUyD3kAOhsn8d6tAvnuMvw1ajE4Dvc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bj9KNuqXpMcdLnU9fjG83CDiaGDusfZvrHLGcC9enwvkO230GvB4V/5f35pqgmi1TORhkdQ4XqZfbbcPAK4gnIVtPRd0RPdUFXbNRCJOMRUFuBCG6Gu6AkxWWIFxOkfbAjG3ktRE8r6UJkMkReXyfSwPGs7JgSVmqLNxmOQMKbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thenautilus.net; spf=pass smtp.mailfrom=thenautilus.net; dkim=pass (2048-bit key) header.d=thenautilus.net header.i=@thenautilus.net header.b=wp/gADYz; arc=none smtp.client-ip=178.162.154.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thenautilus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thenautilus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thenautilus.net header.i=@thenautilus.net header.b="wp/gADYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=thenautilus.net; h=date
	:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	20240114; bh=FsXkOQrZzrS1tMUyD3kAOhsn8d6tAvnuMvw1ajE4Dvc=; b=wp/
	gADYzvVXL4J2xWnm0XIGsAipaUATxP+GTcb9Bpg9XjhQ+C0Bd+dijEPJXTDSL3qx
	QH9t/Rq1+vCbZ8tPmscDpIKuDbpqCI2ip3La0PHYFHJWOgu79z84UFyrSWGUsDYm
	tv02dTHKmlu9M6aa8g4fdAoUK9tXcccI0XSG0LRbfzjb9y0lytVGjSLiwqOmH2kk
	Dx9P0il+RKq/uFBzOrsMrJgXGuLO58P1SwUBb7kCTEnhSilRDwinExzLpPbHl/Vw
	7gwj6ZpRi9IprtFtx3MpuMMUKpK0yeGMqJxpaRcn7Xgg49O9ZMe1B1fo9fMpsPGU
	iHvWxxhDE7jwmh1spdw==
Received: (qmail 23172 invoked from network); 28 Dec 2025 21:06:53 -0000
Received: from unknown (HELO localhost) (dakkar@::ffff:151.29.43.112)
  by 0 with ESMTPA; 28 Dec 2025 21:06:53 -0000
Date: Sun, 28 Dec 2025 21:06:49 +0000
From: Gianni Ceccarelli <dakkar@thenautilus.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Joshua Grisham <josh@joshuagrisham.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: samsung-galaxybook writes to a int via a u8*
Message-ID: <20251228210649.65c1dd80@thenautilus.net>
In-Reply-To: <c6f87174-8ab1-40ae-bf7d-601caee89784@gmx.de>
References: <20251228115556.14362d66@thenautilus.net>
	<c6f87174-8ab1-40ae-bf7d-601caee89784@gmx.de>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-12-28 Armin Wolf <W_Armin@gmx.de> wrote:
> Thanks for your report, this pointer cast indeed seems to be the root
> cause of the strange values returned by charge_control_end_threshold.
> I attached a patch for you to test that implements you suggestion.

I confirm that the patch works.

-- 
	Dakkar - <Mobilis in mobile>
	GPG public key fingerprint = A071 E618 DD2C 5901 9574
	                             6FE2 40EA 9883 7519 3F88
	                    key id = 0x75193F88

