Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FB835CB6B;
	Fri, 16 Oct 2026 11:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150099; cv=none; b=aB4XLqSDnSzuXbBApAiTI9W1djGG1h2lCCwS9IwFyNUtgPH656TONOuMWRcJusG2mLXUy9A1DD0q9VHuDRpx5X4acqm6XqW9mNHeKtRAZ0UmsIIeUyJcu9oSrnKjL36ilJ3JclssMaiO2if84B6TGsnbSRexkUwfE9cI9lugkZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150099; c=relaxed/simple;
	bh=5DFAb0p1QI16M+Im7teM/V0ggs8P5vmQ07oO/6EG6lU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k6tpoCPu0io7YUrH9DVWe7OOQ7rITff9ucKEe5ivYokaXb+QNfhm4hpI5eEREA/k2Xga8zMsv59ebw7UhcghwVy2Kun4t1RfbhFJ5Jbc5nd5b5tFPRWILk0j47iX41P4TK7nh6zmWidojytCceGBKPk3hjHpT8g2KfKOa4fGSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=SliMkUhi; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="SliMkUhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792150090; x=1792409290;
	bh=5DFAb0p1QI16M+Im7teM/V0ggs8P5vmQ07oO/6EG6lU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SliMkUhiHmnhi0O9oQKAPKfT/ruLWfGssi004e01Y5evYFcr1LkD7heVSoF5StPXZ
	 y/LO2T/l9xfQueUtID++Wl4tH/mkoxy7Q28wHXp63bAVJebqrtR4GUlDh0pBUMdAbk
	 qnxbCw5J0UDs10DlXu3wmMqQcluICHfKlWwQRyVeOJ4EQw0l2No4mYJEtkj5OKccCz
	 4QmeO1F694XI2+h0TAmcUeteyiX4TTTNT5EYHgBEXFfJ3CKVw4H7RBDNhThxPGpV/t
	 us4KRp7HcX/phV0RLf8senTIM4gWGK/9gii85iVkx3xyyoDZkjh+91NkSbIvruKLA0
	 6C8I/iubCe5JQ==
Date: Fri, 16 Oct 2026 11:28:02 +0000
To: Hao Yao <hao.yao@intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for DSM method
Message-ID: <20261016112744.39905-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: d3e3c2e49dec7b70a116e6d09278d73495caef78
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Hao,

This fixes a camera on the Surface Pro 11 with Intel (Lunar Lake), for
your v2:
https://lore.kernel.org/all/20251208035122.2147678-1-hao.yao@intel.com/

Its infrared sensor, an ST VD55G0 (SMO55F0), has 24 MHz in its SSDB,
and INT3472 turns its clock on through the _DSM with 1, 19.2 MHz. The
sensor driver sets the sensor up for 24 MHz, so everything the sensor
derives runs at four fifths: it streamed at 47.31 fps where its
configuration gives 59.14, which also puts its MIPI output at 633.6
Mbps, below the sensor's minimum of 750. With your v2 on media next and
my vd55g0 driver, the sensor runs at 59.14 fps in every mode, as computed.
A value of 0 did not change the clock here either, as you saw on the
oscilloscope.

Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11 (Intel), VD55G0

Would you send a v3 with the Fixes tag and the note on 0 and 2 that Ilpo
asked for? I will repeat the Tested-by on it. If you are busy, I can
resend it with your authorship.

Sergey

