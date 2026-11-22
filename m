Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795321703;
	b=livi6I/y9ObladnMzEWq+ephqDOneF1KL0mJOKW/1Y/e3Prlf3XTd2J7l1MCnm+XzMgF
	 hWnAcNyPw83ovsOZKjucG03s/YO1IqXl38xstNEN9dkRf/g1DP0VhoHZY/Eth7qcHTeUU
	 n7bOfdDOY5M2oNyN2pkqy72xPiquLmnwmDau+9rXv9dkAF/nrdY8FV2lAVZihakMUW8VK
	 Bw8AUZ+Q2bRPH4ijjCSEEeIWaWX9XL++7HXbglNpAXb1c3v6N6vPSChWe2qQIS/pCcoYc
	 zMAToshjHugtziDW5Q39iIxOUs4iIv2B32CuEeweB3KTidjIv3bvQ+niL5iOreCW/tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321703;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=pv8hSrBH0kUGdgNR8aDVgpBqcmVx2hyw6K/lDBuUZy8=;
	b=Eja/5rJ9mR6LoEE8Pu1aOht96sRDMc566DlquQtOimsxzBUcN/lAQg5a2Ti+lhm87Luc
	 9iqwCHMs4OH8JvxDJyeCkkSNlLWL8hJuE+t4RhQhecRvlXMg95JQTUihhNAD9qffnrR39
	 8emUTb8g3ToKR8OVGSAgUXx98mrD6sp8K+KeB+tUUfbplb7DCBl8NeevqoWgO+LasRXTN
	 fXuwKEyxQy/ASBydLAKc/nL2BeWBWd8Lg5WwAAogoEs/R6Q+5xoAu084svQArvQhk40v4
	 6zJh8kbe9H/ypp2A5oeqWI23uucZ/1TScR02bijpYTsGhZrgWRhMJ5RUjCmowCmOn7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SiGoR6A5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B887606A320;
	Sun, 22 Nov 2026 04:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SiGoR6A5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795321703;
	b=DxdQqwEfoQr8gO/jodFOES/eAa8xJJjyJ0rIGuslpTZGblgwkS71OyRsbpaSIqTuemN8
	 po+HgT23X9ZkKn5RIrH4jVQFFVzkDsAuKkoN/wgA9o9K9GqECFu1sxFv8iWP8sXiFZ6wb
	 U6hc/RJJvozzCVd6o9dhShP2Duy5CKkCyu9i1/4FIUJXJOZk1GY2JpHk2mkzDi0+wjm04
	 QjHieAqIWqe2QaHeXUEmF4FPhOPgW4lIu0irTWynTVM2ObJvkCjB1VwKGNI/DChl7JsMb
	 PWvoaWOv8IVNCyYjrQc7xgT0IRUBgRNyI+kEb90T0GIJTbsbADrSHrUUA2IoUjY2bXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795321703;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=pv8hSrBH0kUGdgNR8aDVgpBqcmVx2hyw6K/lDBuUZy8=;
	b=dEfSVFSPprICUFyKbXaQCibyezrQw6bNsa4VtuHEIXbXWBtli+rJQcy7426vMYKN0mHb
	 fgMRUex1nIEisIJmAriBgaY4Wl2aPYpnpea69CLffoZ92TwjBgFNC7tNVK6rI7Vxz0FtL
	 IaNS3FsptDPJMq42zLDQ5PxLBNP84zHnjSnpjNKsDUU6mdVTfHSs4s2ex8LGMTI3JFFvC
	 neFigXBwCYYF+YLIw9lYE/J8HJUuzNEqXnwYZHdBnchXuXUzg6JsIhcI7g1eWB29BOZqY
	 EInMU8UWIrn52C6C8m8hZCH94ewiqi+EzWjcK+EmL/WISwnny0xLFvzL8U7hQe3LJBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADCF41F000C4;
	Sun, 22 Nov 2026 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795321703;
	bh=pv8hSrBH0kUGdgNR8aDVgpBqcmVx2hyw6K/lDBuUZy8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=SiGoR6A5XKVEXj859PhPC0+cF5au7271fHTqsx9LYdLvTLJ6LNlYhI6p9jJu+L+3A
	 do8NZ+QgCyEWBU94GiXXPV+iAwb5+WcVXmb8W0m5ezjCovikE1DULkr275Azau2z8o
	 Bdo9SW5/xXGSZGqhyesWNb8G9ZqmUXeCqti0wPYzcBblI3rmNWfCaeTiKpgVv6xrc9
	 bWGckS8DUDDc5VLP8CCKpCLHuKt/k30v70jKLTsh2Lfrp9FbVkpG1JUFfCUDEzCIcY
	 MciWRH//Rkskg5fwEC4MUNOv5/kBeBrPIPPVDNV6J6OSibz9t2NjalOZWCMA2+qfy6
	 3ahh7fUWxf/0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 121BE4BEE6;
	Sun, 22 Nov 2026 04:28:22 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Subject: [PATCH 0/4] rust: wmi: add MVP of WMI abstractions
Date: Sun, 22 Nov 2026 12:28:13 +0800
Message-Id: <20261122-rust-wmi-v1-0-63111d9e824c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqAIBCF4VeJWSdoC6NeJVqUjTVBFk43EN89q
 +UH/zkBGD0hQ50F8HgS0+oSVJ6BmTo3oqAhGQpZaKVUJfzBu7gWEkb3EqXFquxKSPnm0dL9XTX
 tbz76Gc3+7iHGB1gJyq5sAAAA
X-Change-ID: 20261119-rust-wmi-c6b0e0fe97a7
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, Nick Dowsett <nick42d@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795321700; l=1620;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=LRMshCFfcJPtFSPE/6v1bGuREgTWrrb4IAOq+iyX/Wc=;
 b=DLa0YILKrbgNriQJag537mI/mDpfQWW8SXl8SpcnVXH6tnkBsyBCjMPtp1+BlmtTjqOBVkWFR
 033bHYyzf1WC3ZaoD5IQn+66GiZgZ4j27BG9yh4hVXKrOR9SVQ0k4UK
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=1uIkNexEofzEXNN3Y3QW5z8IrgjWaP0yH6Es51jxWOg=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/default with
 auth_id=1596
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com

Hi there; new to the LKML here, long time Rustacean and Linux user.

I have implemented this series to add an MVP of Rust abstractions for the
WMI subsystem with the bare-minimum implemented to support an in-tree
user, a Clevo laptop keyboard backlight driver
(`https://github.com/nick42d/linux/pull/4`).

Patches to follow for the driver. Note it has two other dependencies:
Markus Probst's LED classdev abstractions (v28) and basic DMI matching
abstractions.

This was not directly influenced by Ilya Gladyshev's previous attempt as
I was not aware of it, upon review, the key difference is that I have
used the newer buffer-based interface (no `acpi_object`), and implemented
less functionality/callbacks.

What's covered is driver probe, registration and unregistration, device
id table, and a safe implementation of `wmidev_invoke_method` that
returns an owned RAII buffer.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
Nick Dowsett (4):
      rust: wmi: add basic WMI device abstraction
      rust: wmi: add DeviceId and wmi_device_table! macro
      rust: wmi: add Driver trait, Adapter and implement RegistrationOps
      rust: wmi: add Buffer and Device::invoke_method()

 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/wmi.rs              | 361 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 365 insertions(+)
---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261119-rust-wmi-c6b0e0fe97a7

Best regards,
--  
Nick Dowsett <nick42d@gmail.com>


