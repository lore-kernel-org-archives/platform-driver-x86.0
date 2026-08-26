Received: from mail.kekto.ru (mail.kekto.ru [188.242.149.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A96425872;
	Wed, 26 Aug 2026 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.242.149.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751257; cv=none; b=eQX/UFauOz70WcRc24s4ixctkJVYiCOaTcwq7e5og9YNYcSwbS4tyGHk8iujkQnHXCl8MquciYCON4II2jePR4QErWqg7++ml/z4o/nOZasAYqQ7bxbdZ0upRS5DHOO0Mfi141nGkDyLQys3TLcPmSoMHmxxnqdv0F69Mjs78Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751257; c=relaxed/simple;
	bh=gKkb35nV49U5xylloF8lUYhYYD8uGzOYdwhFRrI0sfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWyaza2gSK4u+6BRPQv14ecyTotaipIZXI/5RltDnyI3wvNjr2jT30/bn0AyA2syeR6HW7My7rN4q/GDrupyKZATveg4qzbknBu/uKX8VWXGccR5Hd3T2IsWr5iM78sws6aP9ZyyuJywPRyfW6VX3NTzhGMyMhcWfnAX6p/ZMtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru; spf=pass smtp.mailfrom=kekto.ru; dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b=KFzbe2/A; arc=none smtp.client-ip=188.242.149.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kekto.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b="KFzbe2/A"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF9DF251B7;
	Wed, 26 Aug 2026 16:26:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kekto.ru; s=dkim;
	t=1787750796; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dIH4SvExnP2K41dF5iMbKo9aEPZ7uZtw6qkuX9287pY=;
	b=KFzbe2/AJwOAXbi/Sw87LGyijifgdILHDHmPiLvYZMuB/u1duETSQj1TWNCvcxDkshmhyu
	zUwCMmRmkpA/GTxK0ns73jWS3uE6fuZ/4HmEypyxAaw9nXadlkM+KDZOCNdIZ6SsWzAUG6
	zq97t5HheqTQZNJl29Aaq2TEFG26nAElSpgtE0TSs5xE9HhSpyrvkeLRfUtOCVGgWw+I29
	ibPbF8dBYElkv4MSgtoWqEIOvNjPkKGMlrcov0FW/1IiVSurTyzrT+TIDkCbN3gzmKpIRF
	v8mnG6g9usswge+zfmcKhjB8NPYHuQ+bVU1kAcKplbuSQloxOKJH4dAZ5rndDQ==
From: KentoNion <kento@kekto.ru>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mingyou Chen <qby140326@gmail.com>,
	Gladyshev Ilya <foxido@foxido.dev>,
	linux-kernel@vger.kernel.org,
	Yuming Sun <wolf109909@outlook.com>,
	Nabil Danial <nabildanial.93@gmail.com>,
	Nika Krasnova <nika@ableh.moe>,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: add TM2424 thin-ultrabook perf-mode quirk
Date: Wed, 26 Aug 2026 16:26:32 +0300
Message-ID: <20260826132632.177694-1-kento@kekto.ru>
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
