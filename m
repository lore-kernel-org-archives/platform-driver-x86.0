Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1229240D57C
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 00:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782002850; cv=none; b=b1RAxh8RXMuUX+Ugw9SvWK4SDUaf7B7bMVVFU3vRO18vnLfBoV7gP7nqnnUES3bwpb8tdCGcTNbKx+5/XrSld5m5yMtsmy5U+GfDf8e+MvKYmiVRb+jLCeBdOuDqVlyUTAQgLBYHwYVWBqWg3w7s1W6t50PCMV5z3L6hRO7pjvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782002850; c=relaxed/simple;
	bh=9a8qyFm6RYo1GgI9LX7SOVPqxGxxrq9ApHGgp0F0Xfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=obO7AT10nDGciJLR8v5GQj91JM8MsWnjwlk0VgpRrWKowpE+MKsWDYarUdmRoCiq+IWW98yWk8w/7/SLFa6eX0q/d2aIeXzQ25/3bpfnUxePn+eOuY6z2NAIxYDvUJ39XK4FAdoJ+xW2cL8NYdRPZ7QfUFxcX2BDWDedRb0z8Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=FaMIYHBT; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=qZVmaN0T; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="FaMIYHBT";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="qZVmaN0T"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=FaMIYHBTyuMkA5jAL/MYLx1xMsZJQ96csaKjSanVefup37qiGAmqBmZ/Lkf7CCJnK1WRAhmPuWSpmbkmrOssdGzrucKGgqFPBtBvQrrP+QDXHS6IlMdT7FGFhPupflJAk0v0WlfDF/eCBBzpCaT6EJB6PCN+oHfBq0yml0TFo2NnBM97IhY6kohE/VBWED90mbxVizwlPNhXTHaSNbuSC/L94klNtEsDrl0ThyOvzcUNc4FNgh57fs+e96UVSvGk42zihZn2XdXMxFrB6aB0CJ23n9434hSglfCmtKk5j+R84ZcbKap0w8/Ju9vH6GbH6UmLyOBk7JB6iGVvq37pZQ==; s=purelymail1; d=nikableh.moe; v=1; bh=9a8qyFm6RYo1GgI9LX7SOVPqxGxxrq9ApHGgp0F0Xfo=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=qZVmaN0TiQHmu2yVtRdo8sAtJ2sA09pXRa+Bsh1MvObd8mQsCzecwpXIHFPm9Fp802goUGt6LS9wz8E2z3xEvkBvPX/kezdPhuVlqLuArLGhsN5P9XLTkttyz33P1XUbT92JYKLAms5I7Cc8MZT741xEsyuKpJv1cOmqs+CREdts4twf/W+LcGDJP0aqdoE3jnxgcSbLOfR7WrszO/YhwJWNoYStGadYmig/KAV1AFgMFqzo/COUU4sRqFniu4u/EA7V5kFIWq8p1qv8UkK7jKM5foqk4xAx+PTopmT4sMN3W6TDYfMeVQLLwN0wTI78L2DwLyLMweCdv0bJtlauvQ==; s=purelymail1; d=purelymail.com; v=1; bh=9a8qyFm6RYo1GgI9LX7SOVPqxGxxrq9ApHGgp0F0Xfo=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: platform-driver-x86@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1655701854;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 21 Jun 2026 00:47:21 +0000 (UTC)
From: Nika Krasnova <nika@nikableh.moe>
To: Ilya Gladyshev <foxido@foxido.dev>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: Re: [PATCH] platform/x86: redmi-wmi: Add mic-mute key mapping
Date: Sun, 21 Jun 2026 02:47:14 +0200
Message-ID: <20260621004719.2328773-1-nika@nikableh.moe>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <8a08f701-71eb-4b0d-9794-86bc820f119b@foxido.dev>
References: <20260620145928.2156909-1-nika@nikableh.moe> <8a08f701-71eb-4b0d-9794-86bc820f119b@foxido.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

On 2026-06-20 17:40, Ilya Gladyshev wrote:
> Is this a hardware mic switch that just notifies userspace, or does the=
=20
> hardware just make an assumption about the current state of the user's mi=
c?

It's not a hardware switch: pressing the key only sends a key event;
userspace (GNOME) does the actual muting, which I've tested works.

> Because for the first case, I am a bit afraid of bad UX if the hardware=
=20
> switch and userspace state get desynchronized :)

You're right that the LED can drift out of sync with the real mute
state. The root cause is that the firmware reports an absolute state
(muted/unmuted, via the two scancodes) while KEY_MICMUTE is a toggle, so
that information is lost -- and there's no KEY_MICUNMUTE to preserve it.

That said, before this patch the key does nothing, so the mic never
mutes and the firmware's LED toggling is meaningless. With it, the key
works and the LED is correct except for an initial-alignment edge case.
I'd therefore like the keymap fix to land on its own, and address the
LED separately. I'm preparing that as a follow-up -- the LED state is
the EC field MIUT, settable through the same WMAA control device that
bitland-mifs-wmi already wraps.

--=20
Nika Krasnova
