Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723491E991B
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 17:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749834757; cv=none; b=oKE3O4RAzJ1ZrQdK3NHSoFp830O80W+1F/9uxxrX5FOjt+9waReyqvzB1svdCmpf+Ym+RnMMth/I5oy+JgYRj/V/F9O8pi3/WcK/xl9FNKzgjUAmVuD8Z3uZKkAM56Smn51f5lW+dxQI+otAA0DSBTKAOckfvSFYpodyFTERvk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749834757; c=relaxed/simple;
	bh=/XKoo/+vO2nmDDJYmtmrXfafA5La5ByYRpEWPXLCqh8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rGdPOQc8hmTNIWUmk5uce+QxY6fitLom2N8ejqm8D0bztsQQAZDou7QJnxLwjKcx8O/b0Ukk3h4v9Tnbu0HHG/oPAgoe5lgamed9lK4/v0dHi7NnCFxX41dq0NIuLY4/ScoWI2Uts4op1axs2gJdISp12gC9svhsyLHnMM/uopE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=hu04G4pO; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="hu04G4pO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1749834748; x=1750093948;
	bh=/XKoo/+vO2nmDDJYmtmrXfafA5La5ByYRpEWPXLCqh8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=hu04G4pOs2QeV9sliOOYuRINgvBCtzWLAd0KCzSNhiTKLGsacydYgZAxE5aRXdHn9
	 K2EThxmt0LlyUh+TR78FR7qDu0ufwLg7770rFBS355Ap8pl/1JUr/gBVwMFbIjb6xf
	 9/WAXNlDYFehxReDKyWKIMFS497Nd8SpFGLe9UhvbKxWpDOtaRQO3m6oWC3G22K4PQ
	 KXYWGREt42t20oSntFoIu6+PcQ8udWRCViLdniUO/nb/ZtpWqZrA02929Tm3mfp7dm
	 q2bPyO19wkI6Wf3nYjB0hNhfwx5Jo9XI9upNMROEorYZTKssqqENuzUhqC0zcw0YAf
	 7tSdvtWunptHA==
Date: Fri, 13 Jun 2025 17:12:24 +0000
To: "jlee@suse.com" <jlee@suse.com>
From: Bugaddr <Bugaddr@protonmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: [Bug] Acer AN515-58: Fn+F10 affects display brightness unexpectedly
Message-ID: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com>
Feedback-ID: 43498376:user:proton
X-Pm-Message-ID: 85eac2cdd5cf3f3aeda9f8ebed05298163e12f28
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,
I'm writing to report what appears to be a bug affecting the Acer AN515-58 =
laptop, and I would appreciate any assistance in investigating or resolving=
 it.

When I press Fn + F10=E2=80=94which is intended to increase the keyboard ba=
cklight brightness=E2=80=94the display brightness unexpectedly decreases=
=C2=A0along with it. Furthermore, the display brightness continues to lower=
 incrementally, until I manually press Fn + Brightness Up to stop and rever=
se it.

After pressing Fn + Brightness Up, the display brightness behavior returns =
to normal, and the issue does not reoccur=E2=80=94however, from that point =
onward, the Brightness Down key no longer works.

This behavior is consistent and reproducible. I'm happy to assist with any =
debugging, log collection, or kernel testing as needed.

Best regards,
Bugaddr
