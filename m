Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633ED317143;
	Tue, 30 Jun 2026 21:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854022; cv=none; b=cj/zvNqVO1yJ9E7GEQAIAT/xxQLaJ/ZtUWdWNtfvoRs9vrhBZ75Y6s1s+kqjTZlyB+9M6iFRAAtmAtjNSdyJb8tujL7wKLr6pOQBBfHnzNCIEFg0ufr37OXKbsjK0gqh1X2nG1VfijmBaIM3ak7D//Istm8y376x+g0MRnGhDpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854022; c=relaxed/simple;
	bh=CayzZ/fC7v0fg6zmlMu+hC7RcJz3wxtU5CxBKX8ZTFA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mRTcCkLQfQ3Za6/9Mv270g0RG40NgK9mK8TI3bIF4Fl2ji3SNTzgG4IZ+yMe56MTxhm2AKdZN9AwVfng5XVZe1ZQEzi6e0PyYFXDmhSqnzd9FXNXg73pI9pxZlfEJ8gZhWY/OQqSvEiPQTwy6nhSyvfnxTeJCSUkxD6SJpbkzUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Lbpw9tD3; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Lbpw9tD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782854018; x=1783458818; i=w_armin@gmx.de;
	bh=Wip8inml5KL09GoU5mdf2c2el2EdnjguJz64pa4GJHw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Lbpw9tD3Z30ZerTroh71kCLrHSvfzgNu/mBmZrU75oBuWg6X9glg5YLWRb5rYHpa
	 lm4UM9WeQ0mO3cqpTsZShCgyokaA2dR0g6I+xM97Y2+6ArJyMUJf/Sf0V0CNEyb5X
	 6E8VjROnne5iVFokMwYiMlNabke21aeNREWdoNJgBi8xzUEHvvt210bXjpAn0Uz/1
	 ARAlMVZs46VgGQMmQD08VRS2LHCSMWUQN9dufhh4b/e30WNOIg/eO168cpcTSFJBJ
	 WcZb2Y2yGliG89mWHynwoQlw8mK+eEaREEDGZq+JH17ItwzJaqiiVVRKbqaU5aT5r
	 CFsaSg7qDVhnxwR65A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYXm-1xORC81fw6-00kvZq; Tue, 30
 Jun 2026 23:13:38 +0200
Message-ID: <ee196fe6-1677-4ce4-b2ea-48a389808962@gmx.de>
Date: Tue, 30 Jun 2026 23:13:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] platform/x86: Fix various issues inside Dell WMI
 drivers
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260612173451.467629-1-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20260612173451.467629-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:+c6mssVRA/Q0qOo/8JwF5fnhqldte+jE6B+NY+faLjwCq/nyqTk
 /tnqGQh/whPnX8iNGHkZ7OQJ0Amfe0QsdlW3gdyBmb87TUriJNxClkWdqFGJ0WL83DmfqoF
 bCpW3Gn8dR+pDsZFnLuH6jYXrZ6Yd5GXvF6YR5hIXdQ1DVZ2u+HAFAEiF4bCydMymuOlemZ
 S9mtMmlDeQWzZl8IDjcGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:g4lmultcLuk=;1m3Sv48LyaiPf2t1wAuI2GkRsxZ
 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

Am 12.06.26 um 19:34 schrieb Armin Wolf:

> During the review of a previous patch series, Sashiko found multiple
> preexisting issues in multiple Dell WMI drivers. The first three
> patches aim to fix those issues, while the last patch is based on
> a suggestion of Ilpo himself.
>
> All patches where tested on a Dell Inspiron 3505 and appear to work
> just fine.

Gentle ping for the series.

> Armin Wolf (4):
>    platform/x86: dell-privacy: Fix race condition
>    platform/x86: dell-wmi-base: Fix resource leak on module load failure
>    platform/x86: dell-wmi-base: Fix handling of ultra performance key
>    platform/x86: dell-ddv: Use no_free_ptr() to simplify error handling
>
>   drivers/platform/x86/dell/dell-wmi-base.c    | 19 ++++++++++++++---
>   drivers/platform/x86/dell/dell-wmi-ddv.c     | 22 ++++++--------------
>   drivers/platform/x86/dell/dell-wmi-privacy.c |  4 ++--
>   3 files changed, 24 insertions(+), 21 deletions(-)
>
