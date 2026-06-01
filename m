Received: from mx01lb.world4you.com (mx01lb.world4you.com [81.19.149.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E713E716D
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337724; cv=none; b=JUqCeZkpa72s4oouruRmVQV8E0FtF/Fstmx04yI2Z7owPKD8d1QBNrowGjtkV0NIi0CENMIBjiIx6QE704rqlAJGwELe+LmGGtdWysD2sYJ5XwBTiicawAxMQuZ18k3sIEXfa9nBsqoITYWXmYsIjXibDb/ym+30z2fv1MdsXNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337724; c=relaxed/simple;
	bh=9q183NFC9fS2JbtBL36Ugl1YrAbf8Ci2YCyn/eMtdUU=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=YXJQ0ozGBGcOsKvLqXkBOpQrCZQiNhrR/Zh7FxgtqY3f8JwXO/csBEsd4xcJ8QrpN/V3w7E3DH9Q7+p0DWJWCLo6TmFpyBfqWMNNgqTM1C1h/qvbRcgKsgK5gj7Le5rLVqT+zYDOqcESnnN4tQqXpQgp0l4K20c6ydh5YiETZjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ciaorelated.com; spf=pass smtp.mailfrom=ciaorelated.com; arc=none smtp.client-ip=81.19.149.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ciaorelated.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciaorelated.com
Received: from 89-26-47-193.stat.cablelink.at ([89.26.47.193] helo=[127.0.0.1])
	by mx01lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <info@ciaorelated.com>)
	id 1wU7AU-000000006ai-0ZmI
	for platform-driver-x86@vger.kernel.org;
	Mon, 01 Jun 2026 20:15:18 +0200
From: Dogan Karaarslan <info@ciaorelated.com>
To: platform-driver-x86@vger.kernel.org
Subject: Open source social media project from Salzburg
Message-ID: <7b98a69b-2b66-676c-138f-86ff7980cafe@ciaorelated.com>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 18:15:17 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-AV-Do-Run: Yes

Hello,

I found your contact through GitHub.

I=E2=80=99m a developer based=
 in Salzburg, and I=E2=80=99ve created an open source social media project =
focused on communities and meaningful connections.

I=E2=80=99d love to share it with you. If you like the idea of an open =
source social media project, I would really appreciate it if you could take=
 a look and maybe star the repository.

I=E2=80=99ve put a lot of heart =
into this project, so any kind of support, feedback, contribution, or =
simply sharing it would mean a lot to me.

Here is the project:
https://github.com/dogankaraarslan1/ciaorelated

Thank you for your time.

Best regards,
Dogan Karaarslan
