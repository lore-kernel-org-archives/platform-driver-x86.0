Received: from mail.kekto.ru (mail.kekto.ru [188.242.149.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D15424D5A;
	Wed, 26 Aug 2026 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.242.149.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751257; cv=none; b=ll3Ug5gCwDnCOQL6FC23qmflxaCx54J347LEUapJVrMXrIYrFCRJz2sLrh34X4I66oH0gZ0M/uLWv6db2Lsvx+c4+dq8PWzOBCtE/Q4v/z7g77yBow+Xf/k4zOCmies5dYUqBgUz4W39Fr3ln30RUiuQoRVqB4aK1Wpcv4//JGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751257; c=relaxed/simple;
	bh=WUyJtCaUz3480v9zbrYiJ2cuiMTgivpXlxdbCeF/fCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E//g02UH+ewd1E6/gqTg77c9w5hy1mrm9ZuVfZhcvLoP576TfpEmm4gQVQeT4ABD0/zZ6SokQjUC4QphN982cuV5jzTeR2gmTmF/N7prgxS96AW2wtAQ8EkcPR1GHqR7W0MZxl5O5zVnhgSGnOFisvu8587ya42rNN+nAup/iH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru; spf=pass smtp.mailfrom=kekto.ru; dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b=R9yyngWG; arc=none smtp.client-ip=188.242.149.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kekto.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b="R9yyngWG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E86E0254A0;
	Wed, 26 Aug 2026 16:26:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kekto.ru; s=dkim;
	t=1787750798; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WUyJtCaUz3480v9zbrYiJ2cuiMTgivpXlxdbCeF/fCQ=;
	b=R9yyngWGCFPPuVPmPRuq622hyXBx9zWVx/eXHN4JDjcD/9lSrHW7nTHKvTwH6QZA6py8YB
	LstvVlAU5+RI/1wsGa7SqreaBmDrReUkxdRZuzD7wVjAMVhND96GRCBlNkI9j1Y6/ijpEu
	G0CnfzDelZZon0VZ5SfDpBpcUGUpW7hkZTO4u/+u2EhWQH00whc0OAR1WPdzSNh9fgqTYG
	lalmqIBfcwrbO/sJ8oIy8e97/KV7nLqda7FmOYualTi/e33xYjdDmxyc57D6Wylm5IunFU
	EBAovP63JXBcjwalS5f9or9+/aAvM+0lbBDUoq3EqRM/trbIwn9m8pDQ7Ubilw==
From: KentoNion <kento@kekto.ru>
To: platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Yuming Sun <wolf109909@outlook.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Mingyou Chen <qby140326@gmail.com>,
	Gladyshev Ilya <foxido@foxido.dev>,
	linux-kernel@vger.kernel.org,
	Nabil Danial <nabildanial.93@gmail.com>,
	Nika Krasnova <nika@ableh.moe>
Subject: Re: [RESEND PATCH 4/5] platform/x86: bitland-mifs-wmi: drive lid switch via EC poll on Xiaomi Book Pro 14
Date: Wed, 26 Aug 2026 16:26:39 +0300
Message-ID: <20260826132639.177809-1-kento@kekto.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <349da64e-fe09-0778-3b09-3f5edb0eebe4@linux.intel.com>
References: <20260728180944.51356-1-wolf109909@outlook.com> <20260728180944.51356-5-wolf109909@outlook.com> <349da64e-fe09-0778-3b09-3f5edb0eebe4@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Ilpo,

On Mon, Aug 24, 2026 at 19:00:50 +0300, Ilpo Järvinen wrote:
> So does this mean it polls it while the machine is supposed to be
> suspended?

I am not carrying 4/5. Same machine class (TM2424, BIOS XMAPT4B0P0707):
the boot DSDT EC still starts, events are unblocked, and Lid Switch
already binds as PNP0C0D LID0 / input event0. ECON is missing from
_STA, which is the ACPI bug Armin asked to see in an acpidump.

Polling LSTE from a WMI driver and evaluating _Q0C/_Q0D is the wrong
layer even if some BIOS revision really has no SW_LID. Details and
dmesg are in the reply to Armin on 0/5.

Thanks,
Kento
