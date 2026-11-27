Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777395;
	b=vaZyAimay/5Qdd8QJU91tACPo4aTcJ8uPava8n/BEo+v8x674ZvLK4Yt3Ef60kZM/TxE
	 VBr2yUAQ9vr8d7d/3CTW/rig1RvU52tDhkOe32ZtyyRAFSIK3fEoLyJUEsbY+gR92cQSM
	 71u3aLGrtvylPRchXYKaORZLHjtpxUn5n+cGXw+manQ4baA5Z/3DtJwVAf6m7Gi1teJRn
	 4NbjFD1A2inFDkGlFgRPPQ7vhAAHr1T5pEUTZWOHOCJxGdhcn6zh7UDh/9xNldPUQtNwd
	 rqgWeFx4Nj/kFQgd/gZTO08V0fvCfweURLd5USXCw/KaeLG3dBrBb6908wx7nsT4rHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777395;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DHEDSigtm2z1IUZ8oBLIo/Dge674DRyWFqv29yWsRoo=;
	b=R4Ni988rD4vAFX1lUymLg/YglsaaBbV2tjvgnxTXrRnXLmNQIk+drZNhH43XsjtURjlw
	 7KHJK66TXlarUqZ0qAtUOD91JM5PdoEFEboMncdnMkwLSFv7JiQpAPX6cHrH44kL1Nj6J
	 K5l0XWwyF6Rh32DKKUvQfPyyuuJbRv9SliB0shZyJRDrQCBs49Fp0Xts2FZu1Y5F29g+E
	 8mWDKFwDq06bmhqdBbjM6WCjV/a4lO/Ars34XXId+Zosa4DoREEkx6bLtdo5LQEiReGF3
	 RUvbCz88Sk43EDNGCTrSuAtJ1vzBoTphjxhV47hfaTZujLoAMkU9FxUNSzBT5jRT8sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U/n8Yw1l";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D745606A330;
	Fri, 27 Nov 2026 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/n8Yw1l
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795777394;
	b=yMvKT8Yh4M3LCXq0D4cKqRg/ZzH+RH3d6LGMz99UYbskvjYgb2SZ6H1XoBcEZR9ZZGye
	 +ZYzunBlXxfdFdqSr87vBWQvFhhO7FutvGj7i2NCay37GpXF+JVDKc+/jut+USs4Tn/q6
	 Ix7Su39g5glUdyum6zcK2PbeMpEdLdogJQYi8RkreneKbGpN6YtaZsMZ+baaKzr1WFUU9
	 TlL6kSgbd2yorT+pQKediFGhef3QZKmUXVLRHN2dMVzEWPsDQunaptQmeqLw0T1LQA/eR
	 chW/J7cZ6sligp2K3v/xt5i5FZgd39mGNoobkcv4v7ALJK1gyhsnBVlJ4wMck322EfQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795777394;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DHEDSigtm2z1IUZ8oBLIo/Dge674DRyWFqv29yWsRoo=;
	b=ClqKJjNKD2rhDyeDV2V4EYTRdUElLcB/de2kZYw1p+k3Pob1ubkz6rzgvBu16/46eTaI
	 Z9UzCfmZoKvnR1VkhRh+pUhbILNG5E+Nh7lDrhFVoTvrTNbMjrDzYFyIP4HKaGks0MfSo
	 mJ491B24dJi1KnEgynVz4m6FTBEtCDIPf3aglO/+sp4xzk5f8jXAsY5RkCUAbJL5mVK9F
	 JGpELYXF1/26fTPoBozBcjLjHg+IWffhTKjoGdiVsHy8vUo8Mo9fQUwUsOL6avF9aXwBT
	 iCBpL2v1rlzWLZfBnTeZExUulISAlcJJn4c+XrgH/AFTq1Ws2AaGy+UCVWfLfhNFe3Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1823A1F0089F;
	Fri, 27 Nov 2026 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777394;
	bh=DHEDSigtm2z1IUZ8oBLIo/Dge674DRyWFqv29yWsRoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=U/n8Yw1lqfqxmzPIXhXZIqmOKSGCB/4frIDY9ZtQVcnKEr4ds2V4C4FjEgLB726ui
	 6CSk719A3U4fSSjI14kXZEpTkwWi/HrbhhVEHgNdZ+tZVk9V0uiDtprgej6gIX5feH
	 GJixzHdV1aHbwn4tOY7uJrW7UqIjv7sepXvNNQtCkf7eci9wyIEWJGY6IkY+KnBPBS
	 +sM1PgQnfU+TzLbOy4kAUs8xWT+rQo6Dt3UHRS91DwpRA/3fJU68mFEWCTamJzrvfT
	 iDCy5rH3qvqLQXmG01zZWPiLp9E54RNJwJsPz8gIoHXE1yVqDaGW1M1xzcSC6k6Stg
	 AUNdx1fox9pYw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9B78D4B75E;
	Fri, 27 Nov 2026 11:03:04 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 19:02:50 +0800
Subject: [PATCH v2 2/4] rust: wmi: add DeviceId and wmi_device_table! macro
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
Message-Id: <20261127-rust-wmi-v2-2-5bfafabd6a6e@gmail.com>
References: <20261127-rust-wmi-v2-0-5bfafabd6a6e@gmail.com>
In-Reply-To: <20261127-rust-wmi-v2-0-5bfafabd6a6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795777382; l=2936;
 i=nick42d@gmail.com; s=20261127; h=from:subject:message-id;
 bh=H0X1G2laYUTK70oLjzC7CZtH2UqOBWIa7sfwgkRyp88=;
 b=trrd1YxGluSOeMtaUutG20HesIhsqNjqItJIlV1bb7cJdFlHcGdmnrRez9xl1laMIgH5e0tHv
 K+WBIi0u9OyB9Ywq/Z3o4z0i8g85xLulzQ9LzKA8vG1xFPiN0+Rphrd
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=rewGRrQm8GTjt8ii+wLiI2tUWP5gtTF4pntVEMNXrj8=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/20261127 with
 auth_id=1660
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com
Content-Transfer-Encoding: 7bit

From: Nick Dowsett <nick42d@gmail.com>

- Add `wmi::DeviceId` wrapping `struct wmi_device_id`.
- Implements `wmi::IdTable` and the `wmi_device_table!`.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
 rust/kernel/wmi.rs | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/rust/kernel/wmi.rs b/rust/kernel/wmi.rs
index f821bf35220e..f7fbde29177b 100644
--- a/rust/kernel/wmi.rs
+++ b/rust/kernel/wmi.rs
@@ -7,6 +7,8 @@
 use crate::{
     bindings,
     device,
+    device_id::RawDeviceId,
+    prelude::*,
     sync::aref::AlwaysRefCounted,
     types::Opaque, //
 };
@@ -15,6 +17,64 @@
     ptr::NonNull, //
 };
 
+/// IdTable type for WMI drivers.
+pub type IdTable = &'static dyn crate::device_id::IdTable<DeviceId, ()>;
+
+/// A WMI device ID wrapping [`struct wmi_device_id`].
+///
+/// [`struct wmi_device_id`]: srctree/include/linux/device-id/wmi.h
+///
+/// # Invariants
+/// `self.0.guid_string` is a valid, null-terminated string of length [`bindings::UUID_STRING_LEN`].
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct DeviceId(bindings::wmi_device_id);
+// SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `wmi_device_id`.
+// `wmi_device_id` does not have any invariants, so it's safe to transmute to it.
+unsafe impl RawDeviceId for DeviceId {
+    type RawType = bindings::wmi_device_id;
+}
+impl DeviceId {
+    const WMI_UUID_LEN: usize = crate::num::casts::u32_as_usize(bindings::UUID_STRING_LEN);
+    /// Creates a new [`DeviceId`].
+    ///
+    /// Fails at compile time if `guid.len()` is not [`bindings::UUID_STRING_LEN`].
+    #[inline(always)]
+    pub const fn new(guid: &'static CStr) -> Self {
+        let src = guid.to_bytes_with_nul();
+        // NOTE: Function is marked `#[inline(always)]` to help compiler optimise the error path.
+        build_assert!(
+            src.len() == Self::WMI_UUID_LEN + 1,
+            "WMI DeviceId length incorrect"
+        );
+        let mut id: bindings::wmi_device_id = pin_init::zeroed();
+        // TODO: Upgrade to core::slice::copy_from_slice(src) once rustc>=1.87
+        let mut i = 0;
+        while i < src.len() {
+            id.guid_string[i] = src[i];
+            i += 1;
+        }
+        // INVARIANT:
+        // - All bytes were copied from a Rust `&'static CStr`.
+        // - The build assert above guarantees `id` to meet the length invariant.
+        Self(id)
+    }
+}
+
+/// Create a WMI [`IdTable`] with an "alias" for modpost.
+#[macro_export]
+macro_rules! wmi_device_table {
+    ($table_name:ident, [$($id:expr),* $(,)?]) => {
+        $crate::module_device_table!(
+            "wmi",
+            $crate::wmi::DeviceId,
+            $table_name,
+            @none,
+            [$($id),*]
+        );
+    };
+}
+
 /// A WMI bus device ([`struct wmi_device`]).
 ///
 /// # Invariants

-- 
2.56.1


