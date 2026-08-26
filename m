Received: from mail.kekto.ru (mail.kekto.ru [188.242.149.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED6C3E3156;
	Wed, 26 Aug 2026 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.242.149.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750968; cv=none; b=gT5+CgSKWpI0KBapIFBcFrc2ldTkyeahfh8TA3BlKq7LayO21wKGVEdsj8oum2YF+H5GTp6sCyZI6I8PWxkweddafPjCk9lExYicAoRHD+KefHo3rODhDdNf9KLoKOXZuCw9iS1qNeQ9vA62SpQ3UglQs+ly9K1CHzosS04pSSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750968; c=relaxed/simple;
	bh=WUyJtCaUz3480v9zbrYiJ2cuiMTgivpXlxdbCeF/fCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A7ebYQoYFmzAYvAjTKtqoGuikVjUwSAr3aKa/Tx1cPUW6MieQCW/6Z4cUuaqfpKwXLIfCEN+Mu+RHLTHlzLbiPA9YABplnPy/Q3o0N7Ik54Tx0n/TcL7hB+fzbgOW4P42YAjlS8SVSDAd1VI4qXxpjCKDLg6/3tNFmhtTBHNUJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru; spf=pass smtp.mailfrom=kekto.ru; dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b=SM00PARL; arc=none smtp.client-ip=188.242.149.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kekto.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b="SM00PARL"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DD86254BB;
	Wed, 26 Aug 2026 16:29:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kekto.ru; s=dkim;
	t=1787750964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WUyJtCaUz3480v9zbrYiJ2cuiMTgivpXlxdbCeF/fCQ=;
	b=SM00PARL9qn2bg7qi2VSb/bgosoTssLk/n4jVr7anyr0f9VEoMN5aciefucxORpQTh2SDf
	R8P1JWR7ms5r5k6op6PMYUjlIPgqMhn5kIonPfdw7FXcTFjudwRSf9bZqsLd7B8MEC/guf
	Xg7UxhNzmfa7bYAVAwzgbNqAZj5zRuET4neiVLtifh7VV2qA5KOqOB7hzupvLCfdVTGxDY
	dpaoAYBNmWfwg9vZ/3KfgbKzL4YPnmMXanNeaYr1GSwSz4JekbJqlRWOq6sRDXFWwj2p1I
	ZYD529uNvUXhYZMJG3FJRtDsJBJ9ZcCLKzT7fosAAqvPN2OaiIWPXsIoBZbWwg==
From: KentoNion <kento@kekto.ru>
To: platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Mingyou Chen <qby140326@gmail.com>,
	Gladyshev Ilya <foxido@foxido.dev>,
	linux-kernel@vger.kernel.org,
	Nabil Danial <nabildanial.93@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: Re: [RESEND PATCH 4/5] platform/x86: bitland-mifs-wmi: drive lid switch via EC poll on Xiaomi Book Pro 14
Date: Wed, 26 Aug 2026 16:29:23 +0300
Message-ID: <20260826132923.179602-1-kento@kekto.ru>
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
