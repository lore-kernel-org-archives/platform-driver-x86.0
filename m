Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795321704;
	b=WvDwyJrDgz66MKizgv5UWVmlcxdxZLdfvkQBATV7l3BcCfjokYmPHHt2gQL8dzhevG6V
	 JQ8Dx71CYYQ04g3KZPpx9jlPjOWThtveZ2RlYYR7AQsGi96iL6gUsS0cbHzUuIz98qY6f
	 BiWfEdNV1PXS/Uk71hZdrekBHn8A3ZEfxeSm9mtcPDvPGW0v0d5soieP91BcBuV05FTLe
	 PLs2b0Ufe7GXwvGdaRfhFAGF95UDlt8JQ8JiC/VIvHYTZJCePzF3o+hkW+fT63Nn3hasc
	 Kp1fEegE5AtUA88V12sWl4iQf9JlYM0pRE1i9N/XLfn7DhTkF/sA27c53kKV/N2M7Gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321704;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XQww88CE4ncPleHQjKDJrOVK2foStslcNvThU2QtO2s=;
	b=QulAJxLMKENkB1gYP2YYbxNN7/X9LqU6eFOCXsUpHWzCBL2KNMo70WRohvo/C1L6o0RJ
	 G2AjwScKSFiv3W67TmJ2C53hY6rxH8zy8RErNqNLs3P/sIsc2DSgEMFTTx6Ypj0t7pP71
	 aOLdKFT9w3MmqyfoLX3y+5+HWC/aWagCrFH/4SRnLUu5PRnHQ7lxpt0lOlS2TBOqsfO7O
	 LMK5a7VLylzxuk9HVZ1GaS7HXD/9I2wt4ED/UBp3znMWt1ELVueRcN/wSvdZU10j8ohoB
	 ETta1Hyz9wL1s4MFNDdMWQxmgE1m0X+kkSjdeVLxrKMcDgZWVaI/i85uRYGHoj9Q5/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nV908r26;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED579606A333;
	Sun, 22 Nov 2026 04:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nV908r26
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795321703;
	b=G8cdanOL8Yx0KgZKHM9d0e8TOWEM2aZfjaMNoo8JQH8jpCtqhM7bguYy7JrOes1LFE99
	 qlFNloTkEJq4qJqKvo+OHRMNHmKWk14j2XU3FSD85NK56LgXEA94WF//Nuto2mjIotHUf
	 EMlqKVHF7nDOkNMgVURdcWHpHY2UGd99dfw94LZYGR304yS+ED5QZ/qYulDVRzrNl15vm
	 9YaUYQxD36hKrN87LJTgDDlkLM1NB/KnOhVHTo1B8VCtM+Q68WRLPYMJs0WoEnnZfBBzA
	 vkwO2MWVd9sBIW6SB5ezep5l/oXbhHF+RaLH6KTLr5HzzNkVzvADj2YYFGJLfjhHYoQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795321703;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XQww88CE4ncPleHQjKDJrOVK2foStslcNvThU2QtO2s=;
	b=IHtggPR1/12AEd6XvPCkCrdYfzoCiWj50sk1zICccad7qnWblQlYpqAp+9aUKfIYCekz
	 kEGqtbJj2h5CfHiNZEpw8c9SSrl2dA4pGwhE4lcZoSWCIK8bkZ9q5xE4dgiesGFxaGOxW
	 Gf95OQ6DWILmu/qZqCeFZsHpFNuWRY0AqwVDyTYG/SUwZ5sjWYdECTerddJ0v3X/EugXW
	 ZssCG6g6nXS0DAz6p3dR/r74WQaAw8T2i0tA9uJl4P3gb/vZH96OvpdP5GsOGdCDO4xH7
	 sGOdWdxZY8xIOMbyKC/EmkWM0vJFEu/k7Iih66vNNex6fwrJyGfBbJ/2gif3VLHW94A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADD071F000C6;
	Sun, 22 Nov 2026 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795321703;
	bh=XQww88CE4ncPleHQjKDJrOVK2foStslcNvThU2QtO2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nV908r26mYpXgNVOTvfdL/61cQrUNL6Zltl+dT/C17pQvp1NyKqDjaRzEijH3PLUA
	 JEtz4JUgPH1IbXJijOi1sS03TGiXDQkyach0EOcCMBQq0gHF3vpOCOA2+E12EvDyW+
	 hhpJ8dCuYLQwIev0l55CrmxyEq4fX9NKJfNeluPbApequ/o2jNeoEWzmfeJnfx3zmr
	 hx+10zmqgzBBIanetpoLeCRPTJmWyjgEhEKNUg4YHz9ZJfQ0SZo0zfUzupmZ/VNmYf
	 U+L9XjkhpomJmYo13gEvvRjHTI9ECJtsNF9gcz6Er2WBxzsaJFScwAdcFcsdsLVQgF
	 B+6xJze46RPzA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3C99F4BEAC;
	Sun, 22 Nov 2026 04:28:22 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 12:28:14 +0800
Subject: [PATCH 1/4] rust: wmi: add basic WMI device abstraction
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
Message-Id: <20261122-rust-wmi-v1-1-63111d9e824c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795321700; l=5566;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=Knm+6RNcLG75vWsIc9eLMNWmCBTmuerBtZDTKnVEFGg=;
 b=n+pCEhCVmKsQB10xdz/YmZv8Cc7AcFnoTejFJim4VEsR8a+g4bplx3nGdD5+siFFy2/kV4JjW
 8/l4ATrSiORAhXR/KB5LvDAlDS/n8mMvsAo2Vp9SuG6TgZYiRzEQfnt
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=1uIkNexEofzEXNN3Y3QW5z8IrgjWaP0yH6Es51jxWOg=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/default with
 auth_id=1596
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
 rust/kernel/wmi.rs              | 89 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+)

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
index 000000000000..5f1d8c9803d6
--- /dev/null
+++ b/rust/kernel/wmi.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions for WMI.
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
+    fn inc_ref(&self) {
+        self.as_ref().inc_ref();
+    }
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
+    fn as_raw(&self) -> *mut bindings::wmi_device {
+        self.ptr.get()
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
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


