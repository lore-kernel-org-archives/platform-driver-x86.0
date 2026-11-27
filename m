Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777396;
	b=sHUwvGczz6IY2k7+aHzPTpPwRNC8kxg7mYf6SviFC3BNnRkKq8PE52PMtWiq97m2x+ya
	 Ed3h4uasdp5jBLWoWBAQ+85fHq5gwi8g3TYJHv8zGW8SmYfXki0ThRFATRZ/S1kT7Hppq
	 Ww1fqJq+zlyz1CHODhqEK761VPrQOhkqBaSAx26B860A6Loztkpdy0AK5fKM959gO6Fqe
	 D02FiMKTUK3L+Xdb0BrZpH5hpYM9eH1NSiXX668f/0N7cGUqlo7IgdZi7OhlF9weFp15F
	 a4RQde3Xbo9FQ6QJzbNw8PUXkpX2r8o7pet8O+5p/eN8jwp3Sg9xhGfnHyX972NNviQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777396;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=KPRXfXF0dITNJb6dfnV8/uVeC4AOzBO8N/zGHrMoP6A=;
	b=vxR9KnBW6Hi9/8gbeWNZaR6iPQAKfKqa9ydv4T1VfHHv09zHW3HeYvWZw504tqtezAEg
	 J9PGqCskP5GJOAsMP2wF3hutDxPX1ioCfxDOibyO7X/gna3+Vk23D61Y5u0J8UHFLuX9p
	 q3Ybojh4RURa0pRcFjxc/v//3R2uK0ZJnJiZCWkN+CLJhGAHt4axmON5e9ESExyMWH4n9
	 7MXggiGES+KdaX/V/0OPV0kSJW/Wgb0uaQ1VXc3X6rzMDkmdvJMb3ZkpRAVrks4Izm3XS
	 LG7X91wb2iioIB4uJxjGY22NusoiWrsgNyMHHdwJSTPrbrZHP6Eb9ytZveAN+1RHlhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amspqBor;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E6606A334;
	Fri, 27 Nov 2026 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amspqBor
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795777396;
	b=ctQOnJzOq4pBHbWXgNM7j45UFSIjjLJVZKmSDf+EPYD4y9b8qZa9iY4s1wBqBH7Ck4HH
	 YhZpKpSYkw1hhz2eNNTiJv4wyZHgOjmY+QVedx8fqL3jFXDbaA6iRRNype7CZCnjQt5gJ
	 hL1UOi50e7UpF0/HoP6rsiW70YAYTBcvG9GcKIyTkdvuHxwMpfhcz6pRjl2543Q8MyZp9
	 oWYlqmxKA6bvKbhErbf6ozOPBiWejpZpIAiKNRQf2gcaM6nFCsrAvebuziSr9vDHGYwxs
	 8mYzK0Hqlhlata5T+nKXLniC84ezWHgCIVUa89wLXW+vgOdbjI7l6WCg0PSQcXkWPNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795777396;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=KPRXfXF0dITNJb6dfnV8/uVeC4AOzBO8N/zGHrMoP6A=;
	b=3JZEadlxwN83O85IK8dKcviLr0r3uybEZvEasbyqiAHis0sShphNnPx0OZXz9lZJ3ASs
	 lVwDv2YUq/4cVYdqmcKeijuvuSkx6Wm7GKC8ACTLpGm+yMNUSS4UoRNoVaEUFaqVNTkgL
	 ZnN4ConVsu0CmU+lZspFeRWBXgRs9UIf/k11Jjdo13r2/gYZszM9bRF33K1AOMKRHOA3j
	 JjZEOVVVeHO6s+PgDVg2qPJV4DHw7on0fl29troXlrGtjv41VDt6mDh1+MZlMPQi2ONWu
	 amJvZn8BJ30QWchq63ZFWBbM3GFEVMrDq75HuyTAu4tlWk3c73FuJsWj/Nr7GX3OQsg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D53621F0089B;
	Fri, 27 Nov 2026 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777396;
	bh=KPRXfXF0dITNJb6dfnV8/uVeC4AOzBO8N/zGHrMoP6A=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=amspqBorpDRN8ffr7+fBKI6MA2TRQgF9mulvkSKNQZ+9iqxexmk3oOWfCYjkByLkB
	 S5by7KE6CxH0enGXM7lX4duaIgzrDjIpFPYCmA8VP2XelyOyrwC83BDh/veSGER17S
	 HZ2RSjbZU9NP+FdvPxS8oob4iWzGB27Lpi3OToaZpOKiKvhts8vA2VQQXTzu6i0fbn
	 DgaSq08pYYHDFXWo0Cra7+bVw35x/sHI5Otl5mZFLCVXb2EgbabGITd8CY0PBfRFft
	 bHTiQ8/IqW8Z7X9rsoHqYjGGuQTeFwo/tFVyHX08biAZq4uVjEkFGpxN58DAdeWgiM
	 L53DVe/EXH6ow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5594F4B75A;
	Fri, 27 Nov 2026 11:03:04 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Subject: [PATCH v2 0/4] rust: wmi: add ACPI WMI bus abstractions
Date: Fri, 27 Nov 2026 19:02:48 +0800
Message-Id: <20261127-rust-wmi-v2-0-5bfafabd6a6e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ6CMBBFr0Jm7Zi2miKuvIdhAWWAMUJNC1VDe
 ncLmrh8yfvvL+DJMXk4Zws4CuzZjgnULgPTV2NHyE1iUEJpKWWBbvYTPgdGo2tBoqUir3JI+sN
 Ry68tdS2/7Of6RmZa96vRs5+se29fQa7eL6vUPxskCtSH9NUUdFJHc+mGiu97YwcoY4wfTeZ9x
 LIAAAA=
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
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, Nick Dowsett <nick42d@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795777382; l=1961;
 i=nick42d@gmail.com; s=20261127; h=from:subject:message-id;
 bh=2hHid/ofHgHaK/BRgZmTbjHrJRvc3ibg8IsjVO6o5mU=;
 b=we5Lhv6/SyTPqkxY8A/SFnFWWN39viazN8AGD7NdJHpuSB9asmpVsgDK1Fn6I6nSVw274UQPC
 KXtoUgJ5TXvCbWJAW6YP0g+ALk/Siodj3BHofe9zbEdZJxgU1D53IIs
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=rewGRrQm8GTjt8ii+wLiI2tUWP5gtTF4pntVEMNXrj8=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/20261127 with
 auth_id=1660
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com

Hi there; new to the LKML here, long time Rustacean and Linux user.

I have implemented this series to add an MVP of Rust abstractions for the
WMI subsystem (`include/linux/wmi.h`) with the bare-minimum
implemented to support an in-tree user, a Clevo laptop keyboard
backlight driver [1].

Note the driver has two other dependencies: Markus Probst's LED
classdev abstractions and basic DMI matching abstractions.

[1] https://lore.kernel.org/all/20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com/

This was not directly influenced by Ilya Gladyshev's previous attempt as
I was not aware of it, the key difference here is that I have used the
newer buffer-based interface (no `acpi_object`), and implemented less of
the callbacks initially.

What's covered is driver probe, registration and unregistration, device
id table, and a safe implementation of `wmidev_invoke_method` that
returns an owned RAII buffer.

---
Changes in v2:
- Add inline annotations (Sashiko)
- Add / standardise `// INVARIANT:` documentation (Sashiko).
- Additional comments documenting device construction state, expand
  abbreviation in module documentation, and fix typos.
- Rebased onto v7.4-rc4.
- Link to v1: https://patch.msgid.link/20261122-rust-wmi-v1-0-63111d9e824c@gmail.com

---
Nick Dowsett (4):
      rust: wmi: add basic WMI device abstraction
      rust: wmi: add DeviceId and wmi_device_table! macro
      rust: wmi: add Driver trait, Adapter and implement RegistrationOps
      rust: wmi: add Buffer and Device::invoke_method()

 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/wmi.rs              | 375 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 379 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261119-rust-wmi-c6b0e0fe97a7

Best regards,
--  
Nick Dowsett <nick42d@gmail.com>


