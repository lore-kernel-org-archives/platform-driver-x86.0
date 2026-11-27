Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777393;
	b=H2ILfRBHHI+3jnxsc5uZDl6tNqon/qcASsPp+BDW4pJZB0r1JgpzbwOzBGcv0BdfL6vA
	 IzdKKplxUrfjsrvUGkYB6cPfcd4lyB9XAPIC7pEJVWCJdvgVnWI+GBZCrQw8Zc+ye8iJP
	 wd4PPjLtoQn+6CGXOOU2mgw7hJGhur23N+EzkRfpTLXn4cV2SutbicOy9h7P5HZ5FhIym
	 pabq8zuMDLJFmo5RMo1G3ikYmv8vmycXlphXT/LBSgDZ2pPupzVFz9OW4ntQhzaArnBVX
	 NjPe11e7+He1NKI5GD20Y4IM+CU4aTicegBuUPy0aXAEkWdUj/ED35CQnV8MuKYnqjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777393;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=B7A358oFSEjkW+WXOoTSL18z3KDDUiMpQuX3wB/0PQM=;
	b=hGJ0wHh6CgNN/DdcxB7qDwsD7KPj5dCt1cIOmyuyai4dD07wc0mLW2fHZQCfoYk+w/ge
	 Erzcm9yFQB2ciVgEXAozAXatRi/72CnwW2u3bQFX0kavK/Gksoja4o3DE/TN3H0k5keXx
	 KpqwVQUnv2NAP8L0OMoJbmdNoY1EvPnRfvZxb63hljciFEgwhWey1B0Fuzrtyeu3TrUJR
	 9woQDvmQuE6tyLkMqNUQhK1pXvYuyDvU8qAVjkTZGKh78UjAxU5U8cOaa2wb1DUS3CtsE
	 bAgGobJdKKQ5wPO3lHfOGJvsCmchp1aHpA/w8mcu4EhKLP3YHjpx2RsktNNNbDpgejQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OBXrW5vV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91907606A31C;
	Fri, 27 Nov 2026 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OBXrW5vV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795777392;
	b=NsXVtEyCKMCLOtesv21AEhZhtFTFUZ50E0qG/bJ9qxUZNae2nMb5MXbW4BD1D+sxcvuT
	 4h26LiSQlOtp3KazxBxKDgRSpfEBzFOUEe4f0SgIva+bxSfu8R8ho6A2wa4HfpwJYPBu1
	 j8A6XEkvLQwMUkdKl/ziv8FN/2kr/OGxAlKrKs41wVPJc6YtrB9k0pjJ/Z8IQtOITVXX6
	 9qlCzxPb32X8cc3BAWSn1b1z1CY8aMLobrY4jv6y16gjQQLLbGqr9UOVUT2hh8n4zs+Xt
	 PyUsC8hCM5oOxC4bdXZO8peOS4HpgBwQCc6HczoKltyOIsjOPMeGQLHyG9oSF2wSlpw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795777392;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=B7A358oFSEjkW+WXOoTSL18z3KDDUiMpQuX3wB/0PQM=;
	b=KJCqUR02lSdvgVtmJaNNcT7fogXmKisJXXH45WNWfX+1mQ+4MV/pJ0yvQt3GoeCE0ODp
	 K1Lcux9lRhasT1i+PWmV7r2owre91PL+VRAuXfc1dxVA8sNElYXVve2cPgcNz39Hk5BQc
	 vP585SJUEZmb2mXlgGd8Kv7KcPO/waknn1twdcLET2fdocOH3hF31svQpPDQlzwpCYM3v
	 tf4jLB0wvwjlckb88kruG+rA7wTR3+y4eb9tGiRmxNCeaAPplbqKGA6A+/r+ghdPBeAOJ
	 /VUDOhBvAiwKx92LzuArwcMvUUACRFwS4U5v/Cr/X8Qum/W1YqCJMk3kbNWQt5vaY7A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5812D1F00919;
	Fri, 27 Nov 2026 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777392;
	bh=B7A358oFSEjkW+WXOoTSL18z3KDDUiMpQuX3wB/0PQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OBXrW5vV8sm35lGzdZAo3O/hM+39bQH9O2DI6ELrZ9dzwM/mfmgZLd8g1ugSUuQWK
	 pLaWoyk9Vc3v2kQOZqFQ5NnMPxnWYDnuzunRF0fScm4vvXD7JSxXelVB5a3qLL5yq4
	 N6ieOp2kyt40Teu+Y9v64QHEtm1EOPMflJwz1WctuHFO88LLhvU+oiXchN/yPydkK5
	 Tkjwnb3h4P1Of4ii5Eqi3Ledm9XEBGLFiEy+0g4kK3VmsP/BCmWXNJbJ1fQp3Mg+V0
	 L5/XK8Bd5R/VOFJ+7/78RpUuMBNSA2M1InFxbYUa2N3HD15aaacFY915q3sSqRTcRp
	 ioUvMqoY5rCWg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D9AEA4B766;
	Fri, 27 Nov 2026 11:03:04 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 19:02:52 +0800
Subject: [PATCH v2 4/4] rust: wmi: add Buffer and Device::invoke_method()
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
Message-Id: <20261127-rust-wmi-v2-4-5bfafabd6a6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795777382; l=5608;
 i=nick42d@gmail.com; s=20261127; h=from:subject:message-id;
 bh=O7obddgUP9HSPTKHNV9B4ghMFjoxhu9TL4QbXxN6nhQ=;
 b=ILzk/2gDAqgHkX1N5roGOVEY0CXYH74RLORgX8pqavcxaa8WJXa9N0CPB4mchPQsiYHfBF5JO
 d57RdFYPiQCDDklXsNOWs32G9eQsucnlYVg48dyuTvmcndK0OFRC4WV
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=rewGRrQm8GTjt8ii+wLiI2tUWP5gtTF4pntVEMNXrj8=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/20261127 with
 auth_id=1660
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com
Content-Transfer-Encoding: 7bit

From: Nick Dowsett <nick42d@gmail.com>

- Adds safe `wmi::Buffer` RAII abstraction wrapping an owned
  `struct wmi_buffer`.
- Implement `Device::invoke_method()` - safe abstraction for
  `wmidev_invoke_method`.
- Also implement `Sync` for `Device<device::Bound>`.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
 rust/kernel/wmi.rs | 101 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/wmi.rs b/rust/kernel/wmi.rs
index 235c4a2cef6a..3cd5bed6066f 100644
--- a/rust/kernel/wmi.rs
+++ b/rust/kernel/wmi.rs
@@ -17,7 +17,9 @@
 };
 use core::{
     marker::PhantomData,
-    ptr::NonNull, //
+    ops::Deref,
+    ptr::NonNull,
+    slice, //
 };
 
 /// Type alias for [`driver::Registration<Adapter<T>>`], the registration of
@@ -229,6 +231,11 @@ unsafe impl Send for Device<device::Normal> {}
 // - All methods on `&device::Device<Normal>` are thread safe.
 unsafe impl Sync for Device<device::Normal> {}
 
+// SAFETY:
+// - As per `&Device<Normal>`, but `&Device<Bound>` also has the method `invoke_method()`,
+//   which wraps the internally synchronised `bindings::wmidev_invoke_method()`.
+unsafe impl Sync for Device<device::Bound> {}
+
 // SAFETY:
 // - By the type invariant, all instances of `Device` are reference-counted.
 // - Increments to the reference count keep the object alive in memory at least
@@ -258,6 +265,71 @@ fn as_raw(&self) -> *mut bindings::wmi_device {
     }
 }
 
+impl Device<device::Bound> {
+    /// Calls `wmidev_invoke_method`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{device::Bound, prelude::*, wmi};
+    /// const METHOD_ID: u32 = 0xB105;
+    /// const METHOD_ARGS: [u8; 1] = [0];
+    /// fn method_returning_u32(wdev: &wmi::Device<Bound>) -> Result<u32> {
+    ///     let output: wmi::Buffer = wdev
+    ///         .invoke_method(0, METHOD_ID, &METHOD_ARGS, size_of::<u32>())?;
+    ///     let output_as_bytes: [u8; 4] = output
+    ///         .get(..size_of::<u32>())
+    ///         .and_then(|buf| buf.try_into().ok())
+    ///         .ok_or(ENODATA)?;
+    ///     let output_u32 = u32::from_le_bytes(output_as_bytes);
+    ///     dev_dbg!(wdev.as_ref(), "WMI output: {}\n", output_u32);
+    ///     Ok(output_u32)
+    /// }
+    /// ```
+    #[inline]
+    pub fn invoke_method(
+        &self,
+        instance: u8,
+        method_id: u32,
+        input: &[u8],
+        min_output_size: usize,
+    ) -> Result<Buffer> {
+        let mut out_buf = bindings::wmi_buffer::default();
+        let in_buf = bindings::wmi_buffer {
+            length: input.len(),
+            // NOTE1: Even if the input slice is empty, this will create a dangling pointer
+            // rather than a null pointer as Rust references are always non-null.
+            // NOTE2: The input parameter to wmidev_invoke_method is expected to be read-only,
+            // however, we cast to a mutable pointer here purely to meet the type definition of
+            // `wmi_buffer`.
+            data: input.as_ptr().cast_mut().cast::<c_void>(),
+        };
+        // SAFETY:
+        // - By type invariants, `self.as_raw()` points to a valid, live `wmi_device`.
+        // - `out_buf` and `in_buf` are pointers to valid, live `wmi_buffer`s.
+        // - `in_buf` contains a pointer to an allocation behind a Rust reference (which therefore
+        //   lives as long as this method call) with length less than or equal to the allocation
+        //   size, or contains a dangling pointer with length 0.
+        // - The allocation in `in_buf` will not be mutated - the C implementation declares the in
+        //   parameter as const.
+        let status = unsafe {
+            bindings::wmidev_invoke_method(
+                self.as_raw(),
+                instance,
+                method_id,
+                &raw const in_buf,
+                &raw mut out_buf,
+                min_output_size,
+            )
+        };
+        error::to_result(status)?;
+
+        // INVARIANT: `wmidev_invoke_method` was confirmed to succeed. On success
+        // it returns a `wmi_buffer` satisfying `Buffer`'s invariants, which we
+        // hand to the caller as the new owner.
+        Ok(Buffer(out_buf))
+    }
+}
 impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
     #[inline]
     fn as_ref(&self) -> &device::Device<Ctx> {
@@ -274,3 +346,30 @@ fn as_ref(&self) -> &device::Device<Ctx> {
         unsafe { device::Device::from_raw(&raw mut (*self.as_raw()).dev) }
     }
 }
+
+/// An owned, 8-byte aligned output buffer.
+///
+/// # Invariants
+/// - `self.0.data` is a pointer to an 8-byte aligned owned buffer of length
+///   at least `self.0.length` and freeable with `kfree()`.
+pub struct Buffer(bindings::wmi_buffer);
+impl Deref for Buffer {
+    type Target = [u8];
+    #[inline]
+    fn deref(&self) -> &[u8] {
+        if self.0.length == 0 {
+            return &[];
+        }
+        // SAFETY: By the type invariant, `self.0.length != 0` guarantees `self.0.data`
+        // points to an owned buffer of length at least `self.0.length`.
+        unsafe { slice::from_raw_parts(self.0.data.cast::<u8>(), self.0.length) }
+    }
+}
+impl Drop for Buffer {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: By the type invariant, `self.0.data` is exclusively owned and
+        // freeable with `kfree()`.
+        unsafe { bindings::kfree(self.0.data) };
+    }
+}

-- 
2.56.1


