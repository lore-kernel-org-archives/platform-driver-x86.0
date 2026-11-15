Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784589;
	b=lrt1NOdgm6J6zHHSQW1Ov6c1V2KztkgWxy02y2TRQlwDOvxkXSK6wK1iiydoEuPFbB3x
	 V3iwh9yA3/nxS57Danu9YMuqiFe3fgcOFgcqhcHJKtVDAmhPIXubVwEi5YAd969jAIuo0
	 k0PSSmGRem/RhVIq4UVJCuusBp7poSIqKVlC+IJh+U4ULAtNBiexr3r/C8ByyxMnDLb/x
	 HWItmBHGYqzG+5eLYn0uiwK+xZ4bjEWdO2FzPCpb92CI66MRLtjljZp6tQJl6Y5/7PNIh
	 W4TWZAPNayG2lXRRoS8CuKAiW5hGJp49uA7YGWAleBSqr82gBFzueQHA4J8deGIRdsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784589;
	h=Received:Received:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=a+w238kPtYPJFlKbG68YXn27xRXOoOY7E6OIISLXm1k=;
	b=wwE1MkKtz35hMFW4YzyUroAiVtcrIjyVrdEY3k5wsRaJnGZIrLh9Xw/rOPxiuZeAzqPZ
	 LnLk3o4q7gxkhYTf7uwL/LQR/JTnkjU1HgHtauBr7I8CzCHkw0fXfTen/i1Nh1jBlzGZK
	 tMApKcMe3X7Y/B81Gg7JOFGiE8GRHr3fMcKMA7ucF+qG0KQ/0KTEqhFrDfmaEZ2QcV1uc
	 /PlNITyaPNlcp/smJnMuYQ3rR559LbiifL9Dm6wseMNyU3gUrAunKPd0lW683f4sYLCCr
	 lrbw+n989twGn62WXMlvrH3E0m2UCYxSKYdUd4Hn0Qeyr5aFHFaKfGgdb6vfhvKeXVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9863E606A323;
	Sun, 15 Nov 2026 23:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A65A1F000C7;
	Sun, 15 Nov 2026 23:16:29 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 9397C181BFB; Mon, 16 Nov 2026 00:16:27 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Sebastian Reichel <sre@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Eliav Farber <farbere@amazon.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
In-Reply-To: <20261113104459.35839-1-farbere@amazon.com>
References: <20261113104459.35839-1-farbere@amazon.com>
Subject: Re: (subset) [PATCH v6 5/7] platform/x86: uniwill-wmi: use
 devm_blocking_notifier_chain_register()
Message-Id: <179478458759.205616.10010504977852392294.b4-ty@b4>
Date: Mon, 16 Nov 2026 00:16:27 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 13 Nov 2026 10:44:53 +0000, Eliav Farber wrote:
> Replace the blocking_notifier_chain_register() +
> devm_add_action_or_reset() pattern with a single call to
> devm_blocking_notifier_chain_register(), removing the
> devm_uniwill_wmi_unregister_notifier() callback.

Applied, thanks!

[7/7] power: supply: cros_pchg: use devm_blocking_notifier_chain_register()
      commit: 1937d7bfbae4268a293043589c0954fe16f98ae6

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

