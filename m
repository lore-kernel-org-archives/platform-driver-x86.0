Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8F53FFFBD;
	Mon, 15 Jun 2026 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781536078; cv=none; b=tF68Ku7jmtD2jjFf5pJbTmTXZKioDx1kpSVvFH6SxIYc9dyLs0snrQYxOkOR0sA0ZmTaMXgjIdtVG9yUVSyUNEQaFwYTjVD8jr4b164wfJup5sO0bgyOhnqf9sxNywvvENHuw219GtoaktS/wq1rnKBMi4ADn0dEkwnGDCe51dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781536078; c=relaxed/simple;
	bh=8g51DkdbIlcLFuWAEiK2QImWQp6WldGA2X6Ux9YuKTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+jaU2rmggdKyDDq6M18i7dd/utA6+awrVD98kV875XnDUY3M4keq+PgqFuy7Qdv7J+iXh0Hpj+ydMGmZpOowNUk1sb4jYhZ+EP/nw6uXoytyziYcF0j164ze2cmnXjhe4p8xV2bSJxqXR8v9B55j5q3CEu1izk1WKqA72cBsN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=U3h9MAS9; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="U3h9MAS9"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C59E126FEA;
	Mon, 15 Jun 2026 17:07:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVe284lhc7d0; Mon, 15 Jun 2026 17:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781536066; bh=8g51DkdbIlcLFuWAEiK2QImWQp6WldGA2X6Ux9YuKTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U3h9MAS933aXf7nQ9P7QSZK4XOaNS8rN+bKJvxKeEbt9D8S/H8D4+FDzUay0h9Tyy
	 zb80IFIA5GYTblnkxWAW+ygkY3FRIHGq6g9d6C5UQf5PQMQJ+3vKCRWa/m2GDBTW43
	 fIRACII+eOBIPn8+Q/QyJxdfn7cMoShOW3ISrLRJUO5PUNJf3mzd3weCXxYBfvIs9O
	 X/ng33WT6tH9V2xW2eXTwCmt7HKaAIxIHKbbBZQHPEmH8+JxClSORCVoQQwa+P+NLR
	 wZ+iaAq8QJQ5Zt/N9efgxzfM6+h4UwfmZsbguaHe8+m/J0XRvfzlk/xgq3H6aEfTMg
	 ANSKgfonGH19A==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com, Denis Benato <denis.benato@linux.dev>
Cc: corentin.chary@gmail.com, hansg@kernel.org, linux-kernel@vger.kernel.org,
 luke@ljones.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: asus-armoury: add support for G614PR
Date: Mon, 15 Jun 2026 17:07:30 +0200
Message-ID: <wwPQu_JvTXK897kIBeAj8A@disroot.org>
In-Reply-To: <524bc16a-6a66-4b2f-8aa6-6a4b0bc31f09@linux.dev>
References:
 <178119015973.12014.6231948241278781864.b4-ty@b4>
 <20260614084423.50723-2-scardracs@disroot.org>
 <524bc16a-6a66-4b2f-8aa6-6a4b0bc31f09@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> 
> In general all these data have been posted in the ppt data collection thread
> in form of screenshots (and I'd like to have yours too for future
> reference).
> 
> Your model isn't posted there, so I assumed these values were what is
> available to you on the official windows app, if so the previous one has to
> be kept unless you find an explanation of why what is see is different from
> what you expect to see.
> 
Hi Denis,

as I wrote you in private it was my bad in the end: I made gemini extrapolate
them from the ThrottleGear_G614PR.xml, which was encrypted, and didn't
triple check them.

As I told you I wrote down a python script [1], completely free from the ASUS 
code, that can handle these xml files, decrypt them and even create the quirks 
necessary to post in asus-armoury.h. I tried it with my G614PR.xml: it works 
without problems and the values are correct.

[1] https://gitlab.com/scardracs/throttlegear


