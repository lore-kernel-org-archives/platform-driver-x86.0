Received: from mail.barrensea.org (mail.barrensea.org [198.12.121.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9669A3E5A2F;
	Fri, 16 Oct 2026 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.12.121.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136989; cv=none; b=jzZJlVlXe+d5BeDHIcFrXAZBva1cr8l6nz3aR+LKWPlgfjY5/sOOrXm75VXJtptOHuh6Tp6/WvYJza2hIBLAz0PgW/KhvKW7gcrVYCMPEOu4kL5y7iZpzodlzgShDjgsgD8WJZdynt/46w/JhgNCE4V8dHxUg5jHiGmCgQtYWWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136989; c=relaxed/simple;
	bh=LQR1CsR8q9EQjJ5kOcOPJtcnkeuMmemVj1RQdoHvXBk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JZoJfFQKR57SU1r8yxT3BnuJbZZURRUP+ueuVShIZGRTpPXSFZis7pD5e2ks3X8Igx5QNtf/HIlO6ZtcDv+wYpCJi59z+Mk8T7aWmSNc2Uq0G1gBTiGSColuzXPYEqGP2ove8WYXziGtxXBGpKyRR9bg8+vfySORuq4aFoVAzqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org; spf=pass smtp.mailfrom=barrensea.org; dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b=SjW6cEUy; arc=none smtp.client-ip=198.12.121.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barrensea.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b="SjW6cEUy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=barrensea.org;
	s=mail; t=1792136981;
	bh=LQR1CsR8q9EQjJ5kOcOPJtcnkeuMmemVj1RQdoHvXBk=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=SjW6cEUyj1JvhajOdCx7ww8DXT1obU+fvBAKAX10kh7id5ftmbd+TJryuhIJwtOrP
	 xVrhiL/JIM6aQi9pf2M9z7387nMqnDCqeFFmoIgzQT4BX6Gu00Q/vcX4e+uT9lIUr1
	 83mtbHXmmczcwardvSRYkZOPujlBGF3BrPD66PMsi9tol9sqAyKIakvGEUvz/yndF2
	 k76m9RL5CXExLqkKS6EpFvJKHLo+72tB9hurIHOnoPjnnLcAsZjcYJcj6DyWRJSkKh
	 9TWbD8RNUANo2dTjG1KgaNIWSqjdCMprGbCoZoe/rXhM5yWNMdLDZew1S7LL9kOuEN
	 bDkTjkHG28LxQ==
From: Donjuanplatinum <donplat@barrensea.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org, donplat@barrensea.org
Subject: Re: [PATCH v3] uniwill: Add support for MECHREVO WUJIE Series 15 X Pro
In-Reply-To: <8733ub7za5.fsf_-_@DESKTOP-4UP1K6L.lan> (Donjuanplatinum's
	message of "Mon, 12 Oct 2026 22:45:54 +0800")
References: <20261011081421.38128-1-donplat@barrensea.org>
	<8f67b6b6-ce55-46cc-a0ac-e54f4bdafb3e@gmx.de>
	<8733ub7za5.fsf_-_@DESKTOP-4UP1K6L.lan>
Date: Fri, 16 Oct 2026 15:49:38 +0800
Message-ID: <87wlridqzx.fsf@barrensea.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Sorry, I accidentally sent the patch as a MIME attachment using
Gnus. I'll resend it inline using git send-email so it can be reviewed
and applied more easily.
