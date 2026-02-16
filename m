Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37601862
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 19:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771268521; cv=none; b=T702Vt0SRr/CKr+kOW8BS8poXf6kBvxFrUStIGB0m+n6L0rd7lllkGMEz6cyHbdN8/b62n/VXLX5VBHt/AbMRTIZBZks6gV7JdOIFq5XATpn6Ix1rlPzQXtPeAODmGMF1Kz13YGkbb95zKju0dT3riW7s0AJyjc5V4tKDW9frW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771268521; c=relaxed/simple;
	bh=nm3+SOnVX/x84HLlZy8oxKn5s1OKJoJoPNu5qGGoQIE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k652iFApcyuPBMHWANL7GQSB3URKONVC4bCbWR0asgGcaFib/SpFPNtO+/8LZ/azubVAFzoY3T/rN8/as3zusAMpLAprYcrq0jL+iqZs3IYIxvHyY/+D/oBiQNWjDvhWX1/9sYmhXkwK7bkeuvhx9hxMQa17hanmATaDZgAvRWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=hE87JCxS; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="hE87JCxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=omjgemtyizftppgat2ewl6pvka.protonmail; t=1771268510; x=1771527710;
	bh=nm3+SOnVX/x84HLlZy8oxKn5s1OKJoJoPNu5qGGoQIE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hE87JCxSBmi6reUMoofyo9OkXpojlFERzy2FFnakgD3P2KoTQOY+ylyisLZE/o6WD
	 sE6YGB5WRM6+NwSo4MdxdEwt69US8mqOho/OdP6V8i/c87ojBjdOtOM0AHYQ1z9set
	 jiCoWNn88JWzkT1TJKNcoKrqFlKRIczqCmXD0mBROsdVCtTihdziSxWWhZWgoMfVrZ
	 ayPBZV8UIF1scdRCs+kpY1xKqs+HWsm8dxkei/YFwkZAda7HLwS+m9FvD3Lu+nB1g4
	 whj8d4no31/NKDoBwOYpq4Gazu0w1meVHhP3/9Rz9umP2wP0JLGWIrGQR8n9/myaoK
	 hWdB1hQOVhXWA==
Date: Mon, 16 Feb 2026 19:01:48 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "metux IT consult\"" <info@metux.net>, platform-driver-x86@vger.kernel.org
From: Tj <tj.iam.tj@proton.me>
Cc: Hans de Goede <hansg@kernel.org>
Subject: pcengines_apuv2: LEDs/Input fails since v6.18
Message-ID: <b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 8aded3a63a9d78f5b1bbbdb60ec7f507ec73ec96
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Installed v6.19 recently and realised the heartbeat/network LED=20
configuration I'd set wasn't working. Checking the log I see:

kernel: platform gpio-keys-polled: deferred probe pending:=20
gpio-keys-polled: failed to get gpio
kernel: platform leds-gpio: deferred probe pending: leds-gpio: Failed to=20
get GPIO 'apu2-leds/led-1'

Looking through commits I found b8754092dfed4fc2fc

platform/x86: pcengines-apuv2: Use static device properties

After reverting it the LEDs operate as expected.=C2=A0This entered in v6.18=
=20
so will affect it as well.

In v6.17 I see:

kernel: platform gpio-keys-polled: deferred probe pending:=20
gpio-keys-polled: unable to claim gpio 0

that is a slight variation on the v6.19 report. I've not pin-pointed the=20
cause yet.


