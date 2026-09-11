Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8CF31E82E;
	Fri, 11 Sep 2026 07:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110542; cv=none; b=jjsLMxlTkS+fkY5sduSml6s796S0xDvPeOCpr/yS4mzga11iry9s8ZtpLohqLktgR4V3obtdqZXTz7pSSXZKmV1/FVMkCPKT+VzB/E7acNHT7qMrmhKDr45WVGF72a8VAM3bEo1iKLYrXTXxqSrHHQ+cE3FmUZIs1PFYqbbws4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110542; c=relaxed/simple;
	bh=IZDVBeL8mBU8xLQjl4jtZCHl79zDJIzc2LWvIdLo2yg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dW6i4ansD0S+zVMl3n77jQcIeD0aoRJnylcSHnDUVOQPW/ZDscjK2VrlzaJqWJ0jdyKhhbVEjMy6q9MSf4o2eVAbqg012G8MS/4zvBplelqH0Ob387/z1VUWRf/EkXm5qXA8CagKal2rK7w4n0KKyg3AKtEAtZ6/RxQrWjeEzy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=PJAO2SOp; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="PJAO2SOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789110524; x=1789369724;
	bh=kGMnsgvIqrwqMbVOF8sKjWbOa7Ti2WQpXFP2F2Gb+PE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PJAO2SOpDFJ3RCwa9Oma843NC1mj1ExkvuSUnTsNhrAjW93Ep3Jd6TjV3KWTFq3pS
	 BjjZMPMgfaewuEr5twkVJYfBAIuJc4S9y2MO1VNazDbl8nABywsrsi/6/Y3VRzBCMG
	 IQAjUhcNVhJEGUx3ib9ryTX96an+syazQ0vbHNRajmOhKCo9mQKbbUxOk8F7k/1fme
	 l4KWOJhpeAOmGa4BG568Ohkjpi/kQv78uxs2VLXCUvV2f6oWOsD2B6IKP5d6aZUQYO
	 O5JNrruWEtwnOur3Fz6UceadlZCSPXUTZlk6z4zezml6jtvT7+31XWs5CaAs51FtrG
	 EHgoUAxgFSY/w==
Date: Fri, 11 Sep 2026 07:08:38 +0000
To: Andy Shevchenko <andy.shevchenko@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, German <germanpapulindez@gmail.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Jakob Berg Jespersen <dev@berg.pm>, platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [BUG] platform/x86: int3472/discrete: unknown GPIO type 0x08 breaks OV13858 rear camera on Surface Pro 11/12 Business (INT3472:00 / OVTID858)
Message-ID: <20260911070826.62755-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 4107d40965ab91d30eb1ddcd105f755065f2163e
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andy, this answers your question of 3 September in this thread - "I can't s=
ee
that commit in many trees from kernel.org nor in media.git" - in case it is
still open. I am writing from a machine that has the same problem, not on
anyone's behalf. My reply may arrive unthreaded, which is why the question =
is
quoted rather than assumed.

The commit is 34e31390a3b939db2e0cbfef4c40d95052572df0, "platform/x86: int3=
472:
support the POWER1 GPIO type", by Jakob Berg Jespersen. Authored 29 August,
committed 2 September at 08:05 UTC - about 33 hours before you looked, whic=
h
may be the whole of it.

Checked today, 11 September:

  git.linuxtv.org/media.git, branch next        present
  git.kernel.org .../next/linux-next.git        present
  git.kernel.org .../torvalds/linux.git         absent

So the answer to what you actually asked is yes: it is in linux-next now, a=
nd
it is not yet in mainline.

(One trap I walked into on the way: api.github.com will hand you that commi=
t
from repos/torvalds/linux in full, because the object is reachable through =
the
fork network. kernel.org's cgit 404s on it correctly.)

For German's original report: this commit is necessary but not sufficient. =
With
it, INT3472:00-dvdd becomes a real regulator instead of an unknown-type
warning. The rear sensor still fails to probe afterwards, because the in-tr=
ee
ov13858 driver requests no supplies, takes no reset GPIO and enables no clo=
ck -
it acquires one and never turns it on. That part is a separate patch, sent =
to
linux-media on 31 August and still unreviewed:

  https://lore.kernel.org/linux-media/20260831130312.26296-1-lsa.uz@pm.me/

Sergey

