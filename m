Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777396;
	b=xoVPF0EOfrJ3QeXX+MS2NeljXQAXP3Z7yd3rU4HAdYMJTpjGfmjwnyaHtRIS5rj1jjup
	 CHSB9H+FJpN56+D6YucjBlUxsCIV975hx/qOViwRONTmHECxBb8WAuuJVYLRvreKtLVni
	 9T+V5rP2VFOr1Cg9iBHfal83VI3vDS06fMPhYBFoF8vnl+PqR2cwULPdqr430yPsq2zxV
	 QDP5wBy38OXHW5Q/9wLeHpv0Aq9d+Wumji2aCRFEWJ+G4oToWt0eH6ByvTVSZWB7n3X2p
	 cBGzl8gHvDWZiHpPsyasFEZBHSKp+wmoeMms4KIheem5qriSHaRb6u0Ax9BQeyyDYJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777396;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MLDR7oT360iHaJvhJSYyzbAYs1/YDF9qNCrdKB4tX58=;
	b=ym+BsvQrm2izb/xCfa5Ta2vIRH/aWcNHsDB1eRPxHI5Cp6wjTUSx3+FtU/1CpNCTh5yy
	 dr2FI+7c6v7oZqz9NUYXErzhv8r5hyyIK26hMLNZdU/j3E1Z3qGkS33UFDtJXLSk2Pfmx
	 E4+9b0jakruXNbWnP394M5ufELaxhfOmNUsN6HpM/iVVlm7AbKe/JZymatFp3HuYsX6TT
	 Xl8+MG0nU/DjSe69QC9aDjFduxed+PP4ZoXf43PvIitjxgXQeCmaUViojnyhOkpS2hTKs
	 m+4MyTZta1i5iLNuEm8N/SJvcDZE+zOgJvSOhfaKzhJ7CLqovE8IOeRlPt+cTdLmf3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hZt8nIyW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80F606A33F;
	Fri, 27 Nov 2026 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hZt8nIyW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795777396;
	b=u45wilx0lyhOF3kk10t8KXK/BA2gxXZVJWx3cBuyDjanMX94MO/lsHMri9bbElX2Eqom
	 xZREayUWuzrc5FBtcRuE5a8Qeh47pm2z7wE2Y6X4UkvLT02pXCM+Kq0qdejfOc8JNYk8C
	 Gfyom4XyAPb0v0EMUYjVFdz6YK5seXaVTDRXj+yUIiTzOdBEVohiRtjZz14yJJFVzFN0x
	 aG79LvecKLrirhNd6dUtwS6kJBE1O9AtI9moojYYTr1xRvTa2ejtkIJ2eoKtIe1wW4Ovs
	 AwrlrO81KSbMF5NaAZ2UgMPf0sGVDDnvboWUwBVt/OKELFxtaZKSbT72AcEtQ5EkyWA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795777396;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MLDR7oT360iHaJvhJSYyzbAYs1/YDF9qNCrdKB4tX58=;
	b=SBhHwNtaAd+I9ouoaCrF7/ro1iNt9SIbNh949pzzBPZxKEfkfh7UMEmB0jZnR9w4pOnz
	 L4OnlGZ2Ri6Au478NXCoS5afayF1W4MJ+95pWea18ikjhHxpoZUjwSU3mpmjHhharzOWb
	 CCap12JTNuk4vMkE1le+svWWgWpNwFuhve4IJRO8uWKvMz0o5UzKYnTmATRdANEJnkfM3
	 K5JLUzX7Q7e4MHK2SUyWU+rW9j9xeV+EWKDsf8t/hTl7A5o2p/JK4WL1CVJUyBQGcpzKU
	 zf2KL9L3SkwSj4N2Fwi1e/tMc8EL0CxN8dUDolpR409TDRcACAtj26ztuIsCMzVQWjg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED01C1F0089C;
	Fri, 27 Nov 2026 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777396;
	bh=MLDR7oT360iHaJvhJSYyzbAYs1/YDF9qNCrdKB4tX58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hZt8nIyWw+OO3wegQ+GcEK7y7K06kvAYUgpOY0ynU+EYX9vRuH6IT0WsEI+8Ti1IS
	 rk6alcjZA1h2yMhLSLS6XFP7cfCMA5POSgpd7ZFikNK2epU+A9Jpotp3e4j/SHDt9k
	 9SLgxyxO0YVAtYsd3JAreQitI7sAMyXz28HO1EyC+dLXM997/XIJMgwhfSVJ28LMa5
	 7N/0LFhlI8cOMtxHGXTi0Ihhh1rBqNVFeoI4mMf3kNpDAgpkI9EwCrZbAtmUlHexk4
	 c/hC7xlvjtX67vr66TKe907cQsbjeaIHFhtSrlz7HMtviMNGIkb0iyF3FtxB7tQuEU
	 zQBy217GoZIqw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7B3E24B750;
	Fri, 27 Nov 2026 11:03:04 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 19:02:49 +0800
Subject: [PATCH v2 1/4] rust: wmi: add basic WMI device abstraction
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
Message-Id: <20261127-rust-wmi-v2-1-5bfafabd6a6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795777382; l=5667;
 i=nick42d@gmail.com; s=20261127; h=from:subject:message-id;
 bh=NqLE0httKlFvmMsJh2OQmeBDiskD2AOxrW1TgQXi5Ww=;
 b=NAXbE+BK/0xj0yLbogWHaXoxS7jApLT1jmntGpBg19hzfkQlXPcgLI3+YeuCX/xYmfwBk07f5
 XvagUdn3VEFAEmyG5/X7pvLlGqpUxgicThUuGVJ9wstRgvljc6vgrb8
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=rewGRrQm8GTjt8ii+wLiI2tUWP5gtTF4pntVEMNXrj8=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/20261127 with
 auth_id=1660
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com
Content-Transfer-Encoding: 7bit

From: Nick Dowsett <nick42d@gmail.com>

- Adds the `kernel::wmi` module
- Exposes `linux/wmi.h` to bindgen.
- Adds `rust/kernel/wmi.rs` to MAINTAINERS.
- Implements `wmi::Device<Ctx>` wrapper around `struct wmi_device`.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  2 +
 rust/kernel/wmi.rs              | 93 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb2b8..f58a44003d78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -422,6 +422,7 @@ F:	Documentation/driver-api/wmi.rst
 F:	Documentation/wmi/
 F:	drivers/platform/wmi/
 F:	include/uapi/linux/wmi.h
+F:	rust/kernel/wmi.rs
 
 ACRN HYPERVISOR SERVICE MODULE
 M:	Fei Li <fei1.li@intel.com>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc7..81652d0dfed1 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -94,6 +94,7 @@
 #include <linux/tracepoint.h>
 #include <linux/usb.h>
 #include <linux/wait.h>
+#include <linux/wmi.h>
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
 #include <net/genetlink.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1ab41129d557..b9713bd16313 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -147,6 +147,8 @@
 pub mod uaccess;
 #[cfg(CONFIG_USB = "y")]
 pub mod usb;
+#[cfg(CONFIG_ACPI_WMI = "y")]
+pub mod wmi;
 pub mod workqueue;
 pub mod xarray;
 
diff --git a/rust/kernel/wmi.rs b/rust/kernel/wmi.rs
new file mode 100644
index 000000000000..f821bf35220e
--- /dev/null
+++ b/rust/kernel/wmi.rs
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions for WMI (Windows Management Instrumentation).
+//!
+//! C header: [`include/linux/wmi.h`](srctree/include/linux/wmi.h)
+
+use crate::{
+    bindings,
+    device,
+    sync::aref::AlwaysRefCounted,
+    types::Opaque, //
+};
+use core::{
+    marker::PhantomData,
+    ptr::NonNull, //
+};
+
+/// A WMI bus device ([`struct wmi_device`]).
+///
+/// # Invariants
+/// - `Device` wraps an in-place `Opaque<bindings::wmi_device>` allocated and always
+///   reference-counted in a thread-safe way by the C subsystem.
+/// - Instances are never constructed or moved by value in Rust, they are only accessed behind
+///   `&Device<Ctx>` or `ARef<Device<device::Normal>>`.
+///
+/// [`struct wmi_device`]: srctree/include/linux/wmi.h
+#[repr(transparent)]
+pub struct Device<Ctx: device::DeviceContext = device::Normal> {
+    ptr: Opaque<bindings::wmi_device>,
+    _marker: PhantomData<Ctx>,
+}
+
+// SAFETY: `Device<Ctx>` is a transparent wrapper of `Opaque<bindings::wmi_device>` whose
+// representation does not depend on `Ctx`.
+crate::impl_device_context_deref!(unsafe { Device });
+crate::impl_device_context_into_aref!(Device);
+
+// SAFETY: By the invariant, `Device<Normal>` is never moved by value in Rust.
+// If sent to another thread as `ARef<Device<Normal>>`, the reference-counting
+// is performed in a thread-safe way.
+unsafe impl Send for Device<device::Normal> {}
+
+// SAFETY:
+// - All that `&Device<Normal>` can do is increment its reference count (thread-safe)
+// and perform a reference conversion to `&device::Device<Normal>`.
+// - All methods on `&device::Device<Normal>` are thread safe.
+unsafe impl Sync for Device<device::Normal> {}
+
+// SAFETY:
+// - By the type invariant, all instances of `Device` are reference-counted.
+// - Increments to the reference count keep the object alive in memory at least
+//   until matching decrements (`dec_ref` via `put_device`) are performed.
+unsafe impl AlwaysRefCounted for Device<device::Normal> {
+    #[inline]
+    fn inc_ref(&self) {
+        self.as_ref().inc_ref();
+    }
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // CAST: `Device` is a `#[repr(transparent)]` wrapper of `Opaque<bindings::wmi_device>`.
+        let wdev: *mut bindings::wmi_device = obj.cast().as_ptr();
+        // SAFETY:
+        // - The safety requirements of `dec_ref` guarantee that `obj` is a valid pointer with a
+        //   non-zero reference count.
+        // - `put_device` safely decrements the refcount and triggers release cleanup when it
+        //   reaches 0.
+        unsafe { bindings::put_device(&raw mut (*wdev).dev) };
+    }
+}
+impl<Ctx: device::DeviceContext> Device<Ctx> {
+    /// Returns the raw pointer to the underlying `bindings::wmi_device`.
+    #[inline]
+    fn as_raw(&self) -> *mut bindings::wmi_device {
+        self.ptr.get()
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
+    #[inline]
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        // SAFETY:
+        // - By the type invariant on `Device<Ctx>`, `self.as_raw()` is a valid pointer to
+        //   a `wmi_device which embeds a `device`.
+        // - If you have a reference to a `Device<Ctx>`, then the reference count must be
+        //   non-zero.
+        // - If you have a reference to a `Device<Ctx>`, it is either:
+        //   - Borrowed from an `ARef<Device<Normal>>` that cannot be dropped and decrement
+        //     reference count to zero whilst the reference is held.
+        //   - Derived from a scope (such as a callback) that guarantees that reference count
+        //     will not be reduced to zero whilst that reference is held.
+        unsafe { device::Device::from_raw(&raw mut (*self.as_raw()).dev) }
+    }
+}

-- 
2.56.1


