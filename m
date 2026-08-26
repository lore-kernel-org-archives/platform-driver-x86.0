Received: from mail.kekto.ru (mail.kekto.ru [188.242.149.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247AA379EE0;
	Wed, 26 Aug 2026 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.242.149.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750968; cv=none; b=jltEIFdL8XzSIRTP8TzsuDlDMBCcKqiy77GDF12p1+pcBt2XMhr6/PAkGtEKNNUNnhPuqWvFJ4a8Bi62mvBfDD41lmBRY901GpEN+xVtbjMkEFirjODu5gkPgo3x2mqbvduzR4KJac3A/VjVVVgsreY/hdcGP1bbzNplGLKyOAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750968; c=relaxed/simple;
	bh=gKkb35nV49U5xylloF8lUYhYYD8uGzOYdwhFRrI0sfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qxc//rP2ZUmY5g653fy1RRruVeyV5Z+xo98dJBiHpGBQNLX/ALNYm/dSj2YFAym9oFBdQrzRnayq2ufaPnuc073B5jiFv3nSDbRfM6Ph1hMYs1HQgaOuu6nq8JCF/dtdixTShpx0PC3hhfcCWDHgF14GuqtH8tmJW6KHGYlWGDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru; spf=pass smtp.mailfrom=kekto.ru; dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b=nXKBtmd+; arc=none smtp.client-ip=188.242.149.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kekto.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b="nXKBtmd+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78DF021664;
	Wed, 26 Aug 2026 16:29:20 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kekto.ru; s=dkim;
	t=1787750962; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dIH4SvExnP2K41dF5iMbKo9aEPZ7uZtw6qkuX9287pY=;
	b=nXKBtmd+79B54x2H1OKyE5115bVMIfNa8J2Uk8zfMwv5u82lML2SGJ3vwy+wC0DkoBjDLl
	/1UtdYVpOIjsfskHYEadVeApGO38DPdK0o+uksCdkA+gblbxdxDP1+XCi4NK9o35TdrXLa
	x8krslJ6yCjwMhdo9tHkhM8o8doGmbbjkzLybn3U9GKTYz6v4KBrcvUP+oGWO3g71UD/C5
	wrOBM7qvlNzotc5E8MHunr1dVBugRG9PZ21N4AcyswPDdCb9JS2qvxhMUVm6VW0ambYpLM
	GzQPq1mRbX8A/XK/K6e9cX9X56D3lTSxYfh+grVDwm5odhQ/KvTM7yiAhccwxQ==
From: KentoNion <kento@kekto.ru>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mingyou Chen <qby140326@gmail.com>,
	Gladyshev Ilya <foxido@foxido.dev>,
	linux-kernel@vger.kernel.org,
	Nabil Danial <nabildanial.93@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: add TM2424 thin-ultrabook perf-mode quirk
Date: Wed, 26 Aug 2026 16:29:19 +0300
Message-ID: <20260826132919.179519-1-kento@kekto.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816215825.289356-1-kento@kekto.ru>
References: <20260816215825.289356-1-kento@kekto.ru>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Please drop this patch.

Mingyou Chen's v5 ("Merge redmi-wmi into bitland-mifs-wmi") is the
right vehicle: a per-machine ops table instead of a DMI boolean fork.
A replacement follow-up that adds TM2424 ops on top of v5 is in:

  [PATCH] platform/x86: bitland-mifs-wmi: add TM2424 ops and hotkeys

That also avoids the laptop_attrs const-qualifier build error the
robot reported against this version (v5 already uses non-const
DEVICE_ATTR). The LKP report is therefore obsolete.

Thanks,
Kento
