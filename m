Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795322143;
	b=uNPo0vGQh7raU8nblKZjnDoDPAeIviDIbcBrWXChiRyN0pYJyo7dN4f/MR75ZuaIKORA
	 5+MP77FAmmT+df7bJj2KhPR1ULAuBYK4nlRu7PMJ6gE7gmZ23onSREHFD+DoZ6Ws4oHOa
	 Q82ooZTU7RnHeDFUzzcW9pTHGuxrOFO9TDnTu/5PUALIfhIsWZLcr12tq0wGPx9OmE0y2
	 H+P+GlUk6M2ziupM3ivArkYlLAoy8cQUPK+Ge4iDTJQ2OQcbhq4seda2Hf8ZzYHU2Ywh3
	 dLL9a/bXV/O3vgDCi5aP1eGOSzOHi4oNfKQH9CxMPM5RvAdaL64YP3rAP2w3pfutrzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795322143;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=89VLhvuRQZuA273RQaix65r3d730rv0xXXofbKFdTsk=;
	b=bb99sib2jNNfMdebC117EW8UTD5vZtYrHAxuSIss3DgYu4/23y3hrFcESA1jHNGUGIjf
	 6HxTvpvNpaLDh4HjrdF0eGbHIq7pLC3g/rHer3t3Q/neMp/HQc1EOVvPPhYRHboo1FRF/
	 rCi7zvTx4WtjIJsQkhdUfiY4458FGgryDJteD3nWfSMe/Br7a8GisWNsZOGNHyBVn8j8N
	 vxKXYXZaE4F0T2lcbIFCJI+WQCldk1RtrY1yupW7n5oEOXsTKoJ0bsX06T1fuybEOmV9T
	 gBvCY1R0pxd67NYdaeEwK0svIBrW2O89cgcvyYKIpYposZk2BHzLYIHxPo/ScyqLAYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hT4ma0Kf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F593606A331;
	Sun, 22 Nov 2026 04:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hT4ma0Kf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795322143;
	b=nofHqT/hamlnGFM345FLrnbH/UjSdvb/urQWLqN6AqahuW9IJvGjUfbVOT9Ia48vmjWD
	 f7nr5IsEa3txXiIc+NsJbxT0407FhyfkOfwsbzTPRFUY9vTcgWH3qZb02uegZznP1/6bH
	 yaZ+wnUOUZSjlbBv5xbnABOYBp6ydPiVCIOXmDao0Ap74i/l9fRCnp1VhV9ZRoInY6ehG
	 FabjAgAfchW9SnhyncGxDe1LJSKEZZvJcKkruKu6qrtmuzA4oU7vstYASYwX7FPQhslfU
	 g1k9gwa/pzoSXb+it8fb2dI9sWoLS611Ogullib3foSLNpS0Yu2PtM9kntvdQPGbllQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795322143;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=89VLhvuRQZuA273RQaix65r3d730rv0xXXofbKFdTsk=;
	b=Ma2HGNd5oSUBbbsIIxjGJvFfAgg1IJ4dQkjvzYrBMrMSYgUGGbUUrr3F8gysj1h3gn8q
	 qg1J6TySwPYjP2vQQIsAi1xMo0Iu2cODt+6bMOM/MWPEKC1QEOI9PdqG7nAzGG0XbDOmM
	 88yT+96KU8pFa0WGsReRofM5RbQaEMRtW+9q5kjWpOUPbojPcJqRlnZpq+Jr2V8bqz3K2
	 HzEIx90k30IBymkThOct1qTE9epZVGtC6q48TBXkNfVM6sfEvWo/fBwSD8YGFKE7zFFCU
	 VbfqZY0zMyZ7YLu9IB8dXMfyE5ggyaM5loCz31BBvE4IrMHjaTrXBoR3OiaNhbImJeQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D01E1F000CA;
	Sun, 22 Nov 2026 04:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795322143;
	bh=89VLhvuRQZuA273RQaix65r3d730rv0xXXofbKFdTsk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=hT4ma0KfAlOMBL372wwLa54uQQxYGkEEP/yiP2eSKfJFIGAdlPUJlwqq0wW9IfkJ6
	 Zkm+/hb2axAXXVbxIqQrLzvGD+HjTf3sr2OW+wUC9VQaGHFAH/e7bH9yWhcKZvV+p8
	 xGUEQjYDSyc1mGxNiDvg3KBdb41+0b+IGvrbiMyZTm6BmpxtLQ2iMOiAU66bBuw2s1
	 FIvdvKiyWLvCBkbZD0DGBfJtBRTyXYR6cIPH8fm7oU7AxlgtxyWH4CZDt70WKmhXvp
	 xXsWXeQBdY07GJcdvX+8pZMqThQhwZRNMgzUF1w2qUhlddXBNrXD/QlXB/o7vnSDgC
	 oMeIIG6krbOcA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E189C4BEFB;
	Sun, 22 Nov 2026 04:35:41 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Subject: [PATCH 0/4] platform/x86: clevo-laptop: add initial Rust driver
 for keyboard backlight
Date: Sun, 22 Nov 2026 12:35:37 +0800
Message-Id: <20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBBA0avErBNUyKSrRIvSqSYkRSuC6O5ZL
 d/i/wsSRsIETXFBxIMS+TVDlAWYuV8nZGSzQXKphJCcGYeHZ64Pmw9M1NyqShurag05CRFHOr9
 d2/1O+7Cg2d4H3PcD8Wxb43AAAAA=
X-Change-ID: 20261120-clevo-laptop-170d658cd678
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Armin Wolf <W_Armin@gmx.de>, Werner Sembach <wse@tuxedocomputers.com>, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Nick Dowsett <nick42d@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795322140; l=1960;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=p78MTrTYwQzdn9dfkJDldtBDVtC1Y5FQDIFCazyzkhc=;
 b=1LfJha8InVu8PtbAMRzAgT44KCMkucZ+h4g8DHDeSIe8mBmk4tAmSA6rBrrrMhHVJczjmHvfs
 T3z8LUxxnoZBx5vDonouDhQs6oABs4w5yQ+l3UbUu+56foRJTsD3+/v
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=1uIkNexEofzEXNN3Y3QW5z8IrgjWaP0yH6Es51jxWOg=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/default with
 auth_id=1596
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com

This series adds a new Rust platform driver MVP (`clevo-laptop`) for
Clevo barebones and rebranded laptops (Metabox, Tuxedo, Sager, XMG,
etc.), starting with 5-step white keyboard backlight control.

It is intended as the first in-tree user of the Rust WMI abstractions,
and a starting point to be extended to additional Clevo models and EC
features.

What's included:
- Minimal driver skeleton, Kconfig/Makefile plumbing, and MAINTAINERS
  entry.
- Type-safe EC WMI query interface.
- Driver registration and backlight type detection following
  tuxedo-drivers business rules.

Dependencies (not yet merged):
- Markus Probst's Rust LED classdev abstractions (v28):
  https://lore.kernel.org/all/20261113-rust_leds-v28-0-b8cf2f74fa57@posteo.de/
- Rust WMI abstractions (change-id: 20261119-rust-wmi-c6b0e0fe97a7)
  https://lore.kernel.org/all/20261122-rust-wmi-v1-0-63111d9e824c@gmail.com/
- Rust DMI abstractions (change-id: 20261121-rust-dmi-c49d2041d7e2)
  https://lore.kernel.org/all/20261122-rust-dmi-v1-1-4ace9449f872@gmail.com/

Tested on a Clevo/Metabox NL57AU laptop.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
Nick Dowsett (4):
      platform/x86: clevo-laptop: add minimal WMI driver skeleton and Kbuild plumbing
      platform/x86: clevo-laptop: add EC WMI query interface and BIOS feature check
      platform/x86: clevo-laptop: probe keyboard backlight type and detect 5-step white backlight
      platform/x86: clevo-laptop: register 5-step white keyboard backlight LED device

 MAINTAINERS                          |   6 +
 drivers/platform/x86/Kconfig         |  17 ++
 drivers/platform/x86/Makefile        |   3 +
 drivers/platform/x86/clevo-laptop.rs | 387 +++++++++++++++++++++++++++++++++++
 4 files changed, 413 insertions(+)
---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261120-clevo-laptop-170d658cd678

Best regards,
--  
Nick Dowsett <nick42d@gmail.com>


