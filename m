Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720DC366066
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782050972; cv=none; b=G7/BtRk36Vz56BIXOJmkywc+DyVqDIQiGUqvyUPUpR4kgLZhC9uYL9nu4ViuOXm1rjmPy9lMtXiCDWzOZxFsc7G+rdYQPcxoYfeMplDZRdgp5jHKf0AlDPk61ULfi8rX7X2QD7VVqpGIXygfjNUYHGgaHnLwASGIIdu5fLQVJwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782050972; c=relaxed/simple;
	bh=3S2IOh0spc4J55Qlia0WT80phT71Zbx0TpEfvwBLUTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sA2a2lxbtZEd0OZRYpIOb8CuqW+VPVDXfM9ZSMROOVS0GXEIiL9bPkI8hKTPIsBvL0Y8ZMNK3Kwb9dUCfpZFDCbSATAncMCaugDodTo9KQH61E3kPAnuVAvR99oqAWm7b7guSUibydWoR228GtDt42QG7J8z/irJlJqQKWStiXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=kOoONE6M; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=chRZTM5D; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="kOoONE6M";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="chRZTM5D"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=kOoONE6M7A+PI0iqoCDGwqxAIbpabUV+oKkJqXEuH4/hGG7xCekXxSSRz6xEOTW6fkGmL/k67rQF/pqy47qF3BLCcT2Ll5NE5Zzq0ebtzA6vVElH6r9ozTdu+qhFaPO0LbCda4qJCYJqp0QsOS4AhuP6hindSV+MCk+NSWSk4Dt3iGmZHSZNA6hfIfzRrEgUIyF1DfQDHcfiGkqzfFQWTZ9OwtMIxRQucKAL+sqoUT8t7msb0UfzVVfqX/UwsA754wk2YtPaByBJXvEo6PRKwC4c/1ALvgpfiQE7erd98PNArMBzuTET/2g3l4d4LJnNURRF93nj6gDzD8ploYL3JA==; s=purelymail1; d=nikableh.moe; v=1; bh=3S2IOh0spc4J55Qlia0WT80phT71Zbx0TpEfvwBLUTY=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=chRZTM5DEYg5T8bTdtEzKb049emDMx+D/8jqbBZR5WR/0y8XQG7pNP9de3KzvKtimpwy28tYUvyPHoCK/GrxKvxjGF4P1e/1hEUMfsWWTQW2aN9NiQAjK/S4jxREecbIZ2KfKVsJNPxyHfSDZhmo/zEEMe3xa7iG2UuulaQ//i2h7nm+zow/+VJ+N1OLzdm2/cLfBFpJChHjXSpJ5H9MqSNu3PJ9xi9FiLGCT3j8eRUoudgj2yixhVg7EH/m3LIkUfdIh8QR06USEdpux40MZoJeEiE49nCfptB7FWjs0iCqyNHiPG5zMCOrkU90Yq3Yf/ar+krG4PVuE4NvvtOHKA==; s=purelymail1; d=purelymail.com; v=1; bh=3S2IOh0spc4J55Qlia0WT80phT71Zbx0TpEfvwBLUTY=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: platform-driver-x86@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -515468910;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 21 Jun 2026 14:09:20 +0000 (UTC)
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
Date: Sun, 21 Jun 2026 16:09:09 +0200
Message-ID: <20260621140914.2387872-1-nika@nikableh.moe>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <707ac777-0a4b-4a54-8066-317b09792a3a@foxido.dev>
References: <20260620145928.2156909-1-nika@nikableh.moe> <8a08f701-71eb-4b0d-9794-86bc820f119b@foxido.dev> <20260621004719.2328773-1-nika@nikableh.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

On 2026-06-21 10:33, Ilya Gladyshev wrote:
> Yeah, if the key itself does nothing then desync isn't scary. Thanks for =
clarifying and
>=20
> Reviewed-by: Gladyshev Ilya <foxido@foxido.dev>
>=20
> (I am aware that lore.kernel.org will filter out this email. I will fix t=
his issue ASAP [thanks for letting me know]

Thanks for the review! Relaying your tag here so it's archived:

Reviewed-by: Gladyshev Ilya <foxido@foxido.dev>

--=20
Nika Krasnova
