Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046661FD4;
	Sun,  6 Sep 2026 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700318; cv=none; b=YQnQ3cikubbWgkQ6CUTlj98smyj17nMz6ss3VZpRzeNzpbKWYk53dw3+OanSOHqwD3iTL0aRpmstNDEKz44uU5ITec/AiQVZr7akiVFeqWviQqaIKwu1/P0gnGJZppvtHsDPSNZausXLGC2xU6fH/fGl67NtOA349wLbHvRpf4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700318; c=relaxed/simple;
	bh=TgIkiisz1+HoOZBSiB97E9xjIh1VYJrlPvyDoQ8MLrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=goJ5ja+i6fhuDzHYw2sLVREgygEqjESV7m0lsIfh/JiAD3KjbhwTj2+LxkxYYSEIbwvz9nf4+9mwkt7mAVB+nCp6ZIXpfRDISDon5pa4q+sbl8baoFfVsfmtaYOFKa1GfogyyCZwyUzg/p2OWAB4/4zGVYAznxj/5QpLZe8j1LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=e09xDAxE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="e09xDAxE"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 881018072C;
	Sun, 06 Sep 2026 15:11:52 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnKHikTDxWux; Sun,  6 Sep 2026 15:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1788700311; bh=TgIkiisz1+HoOZBSiB97E9xjIh1VYJrlPvyDoQ8MLrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e09xDAxEyp6hnGd5uNGHsy7mOcU524oSSEqT0TCb+OI0uEa+1enpoqcZ/3uZAXBdH
	 dEW9Lx4n7o2Vt7mzlwSas5sp9q8RihmTHNemlNINz8jIM6SnaHgDYu55s6VNLfsHcO
	 AE/6FPJAgWctKuwcteAwFemPEE2K961mXNeMqj9ueZF75p9P4UNZfJAp+6csZcIQ5q
	 t2uj/SGcWAhZPuUOzmA1H1StWDPJJqnO1+dMFI52Tq2b8DsxCAZVzJdB/KX29ymaMT
	 x8mRtIiAtQLXAE9rjKpv/bIpzWKDyZ0Fh6xZ08bJsYkHAEfG7svpzBB6nK24KXneTy
	 bAGG3d7E+AVaA==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nitin Joshi <nitjoshi@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] platform/x86: thinkpad_acpi: convert mutex_lock() to guard(mutex)
Date: Sun,  6 Sep 2026 16:10:19 +0300
Message-ID: <20260906131107.20966-1-aliamemis@disroot.org>
In-Reply-To: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
References: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dmitry,

Tested the series on a ThinkPad T490, v7.2.3 with CONFIG_PROVE_LOCKING. The
patched and unpatched modules behaved identically and there were no lockdep
reports. debug_locks stayed 1 throughout.

Tested the hotkey, NVRAM polling, DYTC profile, keyboard backlight, fan
control, error paths, module reload and suspend/resume paths.

Tested-by: Ali Ahmet Memiş <aliamemis@disroot.org>

Thanks,
Ali
