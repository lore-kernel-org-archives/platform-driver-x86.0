Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C3241A773;
	Mon, 20 Jul 2026 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551875; cv=none; b=AvExPyjwAz3tIZ3CgTx/9hYzDkKl2TagEr5N9pTy1gHCu4Pg1C/eAXaPVPcmGdX20zq59yych+d3iWtCVdfmGJ0GFEuZStyYUe9SPTqGuh0+pKxoDy7exgDokmOz5hBl3dvVklqeItEoBAm+kFuRZoMGMmMSgt0/jyz1CiIDbX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551875; c=relaxed/simple;
	bh=RWTsETDb3U6rlTB9oV32gWrRL8xfysYWP2BNiE2o+3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Oq/VaWoL9L8fkz99NN//Xfdfc+tRdL8ErUCYysvaRPGSeinnjBfxoaLtHpFp/+KxCwgyQU87lwlOwF8xOHoGujEAPtO2O2MuWeFQr+3bRxhcXyT4bmvZ6orPcFo2CuhvGnDNPeTSlzAiknqzhl3JfP0XsThcOab8BMB/XgcElf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DSHMRBvD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DSHMRBvD"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8A07B408C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784551872; bh=voYCRweTevulBZ/4+46DrI81MY9Sq77ChoH8WqOtToY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DSHMRBvD5F0IGE6isx1CdYPsZdND9/PwO2tAxu8vK329b/IPSWZ1xQQgoe5Pr00+g
	 /RbMyY5ulT+IxdZr78/FCS1oriRUnfZJ+P6S1FeUdhMZvYLkfjFJIqE6tTs2eJgKvW
	 QkVtw0nLDczT4gR0HLQOANC1RY+KLIpgW5VFsfZ69DEpH+XpAdkjnNaw9j63VSsVxh
	 C0SDpyON8Zp5XLlPPN/oj1iqCd2iMzRtezeq/JeEyLMY4KcqMlzJifVBC3TKrb98DO
	 WYS1D1m/rVrs2TX0zQ1d9BGEw8wv9MGwsYX+mzAXA8fgNvuk5L8/YSRSurdK1sSiZk
	 +LUOFJbpTtDWw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8A07B408C1;
	Mon, 20 Jul 2026 12:51:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yahya Toubali <yahya@yahyatoubali.me>
Cc: Yahya Toubali <yahya@yahyatoubali.me>, Weijie Yuan <wy@wyuan.org>,
 mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: wmi: lenovo-wmi-other: Document
 intentional BIOS misspelling
In-Reply-To: <20260719224317.2450320-1-yahya@yahyatoubali.me>
References: <20260719173710.2367930-1-yahya@yahyatoubali.me>
 <87o6g250ya.fsf@trenco.lwn.net>
 <20260719224317.2450320-1-yahya@yahyatoubali.me>
Date: Mon, 20 Jul 2026 06:51:11 -0600
Message-ID: <87jyqp4yf4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yahya Toubali <yahya@yahyatoubali.me> writes:

> Hi Jon,
>
> Yes, I used an LLM to help me format the email text because I am still
> learning how the mailing list process works.

Just formatting?

Please review our requirements around LLM use:

  https://docs.kernel.org/process/coding-assistants.html

Thanks,

jon
