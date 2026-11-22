Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795321705;
	b=sS40gd/NMyab/571fW0nCIecqIX2y17Twdg+lUNSeX2DI6obogpZCu1+00LeVOHKB9qO
	 K6T/9TMtqV9VpXqQ20SMdEMNabaafbyRRhocTVl4dlJaL1x3OfolpPQHbaXLGAHxdijTc
	 ZvjUY1AYs4wAYuoBWmPDLTlYsVbyaYkxr47Av/Px4Kq5gm3UKr+A3aDmc5OXOzKAGlE1Z
	 tZ/+ZAH855Q3DFf369ZbTJqC4FovWsy4k8aVpJJd+LArBsQl4xhqXjtquZO5jt56oe0N2
	 Ti42BJvWYIn3yY/CPsSEe9hwt5E5yoMvfUMGT8orgGd+DomAQZTSa9fOnyMvsiiYbfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321705;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qIENcXcsXDQ9ZgrTaWKLrjR+qyFqEiW4ZYJCFWa3s6c=;
	b=XUfdRyYvkR2nnMJfjTY/Y/5m/ToGusCr2mOTxx7wf7xVCOFv01kNqoXHEOofnxWfGd0s
	 cKUnrcMZhWje8uKLbhnFAv5GDEK9l0Nkn2acU/0ZceCR9oH8JiKO8FLqL17xaU1lvrOmg
	 9UYQjBCBLow0+5RrUa+2FvGbgfnMfnJFrisnrUWz1+cZtSSuQ5D25NbqKFaKSdZEoFKz2
	 0auvASrZs1kLV5CCHY60Zfeavu3IJtvtoiPUK+Tkfl3E/CgcbIjlaS40/OAxE22F2e2B6
	 WG09Xk1qKU/0+oDKnWfB40TdC6DroUwVuTxmHOgfw4MC0idQDPyk9IAnod6yRjiJc1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lhr/wpa1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AEC606A32A;
	Sun, 22 Nov 2026 04:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhr/wpa1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795321704;
	b=pX3Sy7M95oyPtZySXzBKi+iHnXcYKVNH7GOkoMXZZC9oxCNKRog4fszx4ThaHJ5js0wC
	 vBn19epApXMO06GG9b52TwH+0a2v4dUVT5/zM8T0ZJXWR8G7R+RWWDeOnu965JPEq1Ogz
	 m/Pj9oK8dn+nMfm3A7TJI7OfPfaWF6RCeWk7hWAVy9aZIxhoIN7XZbIfCj5X/4pLjlGub
	 FiDQHdpcVRAkdIa+pGjbXaOS3wyQHyu8IktHyMrCbN9BXpQbgLyBE6vF94C+2kqGyVV+O
	 szKkB0qL4ueJVd560oZfMXvVFlDC4xVRTTHGVqhVP531gLuzE1PthIchNjz8SO20KUQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795321704;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qIENcXcsXDQ9ZgrTaWKLrjR+qyFqEiW4ZYJCFWa3s6c=;
	b=nXTXCSEwwVs9MDSphN6xlle+uDyVDvz2j013ZXIJD3lhnqYdN12Pph0C2Q066Sd9W4pT
	 /7U9zOkr6QexRy812jutDWW6s6klYRJVxcgL+Vvbo2Q2lzf1PFR/S/zdwU3GrIuiMK+We
	 xKMWmuj8BRlOsJ/oAcd7vsEJflJrR/CRsrbYb6eUWRmmpiDO7KU6HMRd4tEsmp0Y0A2jv
	 0ESHq9evSJNWn0+YeLt31ITAxOjE3deYUpRbX1hZmfhWrmTL+xc9jx9wUoewPOXGJ9xG8
	 10AsUgSitt6L7FTZ/xsO9x6nF5SBExrfrljLhNg6IogJRL/5uV11jL1NE96SFNKx/0A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 127821F000D0;
	Sun, 22 Nov 2026 04:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795321704;
	bh=qIENcXcsXDQ9ZgrTaWKLrjR+qyFqEiW4ZYJCFWa3s6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lhr/wpa1/VWDbK2vhk65OU/XHsTdUqOlVxi+Qny6FKIVigqUe0NqkR2sVXShka9Ey
	 kfOJG7pJi3qMKHBiigOs08/EI0dgEVARDmsu2VoRw1CP72VtXTo9OB4BVVW4S7e6zc
	 2cQbyIojpJhSq5GNt0XYwzEFP3gk71wRMQbUchPFheORlS0iFdG38NJ+bjx3EOvPRO
	 JJS/yNO5eEaBU52kLWgiRffkk7lpwbMVEj/+k0V0ugEVIrGPZD7IFYaDWgDuX+PEDE
	 DJ/YUrLxVzUiqExnF02bI/HsIzzxT5nWD0nu+LLfiIoNv00FjTF+0oCQYORTdHFdxH
	 NCE+EYsERnffQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 96CA54BEF2;
	Sun, 22 Nov 2026 04:28:22 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 12:28:17 +0800
Subject: [PATCH 4/4] rust: wmi: add Buffer and Device::invoke_method()
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
Message-Id: <20261122-rust-wmi-v1-4-63111d9e824c@gmail.com>
References: <20261122-rust-wmi-v1-0-63111d9e824c@gmail.com>
In-Reply-To: <20261122-rust-wmi-v1-0-63111d9e824c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795321700; l=5545;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=VW4iRI5cDRDRluz4CYZ2xuelFH93Nr8DBnHhhhSeFjE=;
 b=bqfy+MYcO5ooFuXfwQE7sB0dvrGN1BN/VE0CjFx1xy5WtFBl1ZncUb6DzRL9wFhBcAItpIGXx
 g+PCl93MbP8CBlMo+aWVGVBPOnpQwWvowCbB8NiKblKPbRNCdM47wil
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=1uIkNexEofzEXNN3Y3QW5z8IrgjWaP0yH6Es51jxWOg=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/default with
 auth_id=1596
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com
Content-Transfer-Encoding: 7bit

From: Nick Dowsett <nick42d@gmail.com>

- Adds safe \`wmi::Buffer\` RAII abstraction wrapping an owned

  \`struct wmi_buffer\`.

- Implement \`Device::invoke_method()\` - safe abstraction for

  \`wmidev_invoke_method\`.

- Also implement \`Sync\` for \`Device<device::Bound>\`.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
 rust/kernel/wmi.rs | 98 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/wmi.rs b/rust/kernel/wmi.rs
index 09712cbc1c93..d97c8cb7cbf7 100644
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
@@ -222,6 +224,11 @@ unsafe impl Send for Device<device::Normal> {}
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
@@ -248,6 +255,70 @@ fn as_raw(&self) -> *mut bindings::wmi_device {
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
+        // On success, `wmidev_invoke_method` returns a `wmi_buffer`
+        // satisfying `Buffer`'s invariants, which we hand to the caller as the
+        // new owner.
+        Ok(Buffer(out_buf))
+    }
+}
 impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
     fn as_ref(&self) -> &device::Device<Ctx> {
         // SAFETY:
@@ -263,3 +334,28 @@ fn as_ref(&self) -> &device::Device<Ctx> {
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
+    fn drop(&mut self) {
+        // SAFETY: By the type invariant, `self.0.data` is exclusively owned and
+        // freeable with `kfree()`.
+        unsafe { bindings::kfree(self.0.data) };
+    }
+}

-- 
2.56.1


