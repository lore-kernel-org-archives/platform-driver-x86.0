Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777401;
	b=Upaick7Fd5hAnIKGW6WoAXkIJZBmFtAn+52ZBrBt+4IyZF2O/2w9rTFEuL7WYWIgtVHC
	 4U5JWs9Q6xowczCIk6ijtMo1+NJix6A8XEwZd3jyrWGTdetTAYgSM6goupwzUNVSqNzx6
	 32OfVcEVP1X7NgFvrAIF3C/+fr6rPriEycjg3FMGddKcgc2iTx+nxHGBvJXENpZ1rkToB
	 1EFAuw8INj/z1AOv+rbc2N1Zpn5c8W1zg5NnqT9rRJAF7KXnAg1iiRfgZDxU7uqHKJwWL
	 OQOnjnlpWAVg5s8iyS10xpp1Wo2kerNF/HNbEVhaB69vltS8w4HDwW1Ye7CQ/NXjIDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777401;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VhUiHoUvwaHzRo0iqWoFEinCyRU/jMmnOPM2znbr/PY=;
	b=cEsndNscXADBOJx8AhkuExSjxF6JaFKgjlKy3kPG49LsYtmcaI/R5Omu2njy+qo0yTeo
	 04+DoI3iTv9856D++Zjg0tBY5JxzHBQzqXDq/L2ljsEG5V6CiRms/x3SsHTb58L26Lp++
	 PM6cRLVfmOVGk4ukbOWvY4W5SguLqydjVrhW7hE/fmO3SDJfwgLR329dk+FjUghxKoKeM
	 odRQzTWrnSqJR5x1TJgv8T68bMbQ8rgDwPZFuxv1Ti+kkmhFgtljnPB4EfOI3ulWVUKdt
	 MnsGtjhKZ2Q4t9cqkez9mO7TYuJ3VakKR2SjvK3vCgPzWBarZ3cJd29T+46CQJBuIiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5jIsLw7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9A2606A31C;
	Fri, 27 Nov 2026 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5jIsLw7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795777401;
	b=v7Eenu6MejPtr3nkgBRL3MxJ7Rlv73ix3PCra8gItzeqEvqtYCVR/7JWAXWFAjkc6v8b
	 Aix0TXGZkJOLIUyJAKbRutH5oAM9mS8MFqmLHJBoubRNBfkH06PWKCLSSDrM6xyvP69E7
	 wC5KKXUUA4qMoA7imCBsckm1TXPCpZbPEls7FUfMsmsFzHh9wgGivk3pDqIOdXjthfOma
	 I1/aQc5KrLTBfNmdS3f6uQh1gsdL8V/mdhRxtqV3c9EyJHwKL9rkF6X0zwXLr3FCqaXZq
	 nuwtEriGo1qdfrDUq2FZKNW+4tl9GwXP8Tvob62sv4/5mvK2XQs97ei32WAPeO4HM1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795777401;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VhUiHoUvwaHzRo0iqWoFEinCyRU/jMmnOPM2znbr/PY=;
	b=Xz9HBHvQRq9XhtXTw7NvTQA+dcRBOCXYblIwCvxehVn8gcm59/z+gh7sPrkGIIZ45ihp
	 fekoNyEkfZwbfTh+U66LR5liI9bJvQmNET0qRjOcQjqsm0Ix2Xs85baE+NRPHIxv/kr0L
	 nTOM4Xeqa3nOrXn5L/PCG6XtIf49vaKJLut+ndV/KDwm7hAvMwHkb0/MABVnd623NrgL/
	 Iaa3rPFWQikf/r0eGj6YqJR3SZ8OTtvzpo5d1JbErjZ/DR9CB+TEZN29bjiD1lYaOuNFS
	 u+f501gxwaIDibL2yMdeAWvzZP8oX/SaHU1d2wpBQTeGDpRJBEMygt7Tp+wEoGDiiFw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37F541F000C1;
	Fri, 27 Nov 2026 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777401;
	bh=VhUiHoUvwaHzRo0iqWoFEinCyRU/jMmnOPM2znbr/PY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=O5jIsLw7DeakQjGkRa8dwb0rnOss4lBOlG2mcipXEJwdZ6pedjyoqRexFkBYhmLLy
	 8tc8AuvoriqaEoh0SNtiyiLHpbKUdFm1iogtQYo+mlfKD2dFackGtnfvdIlPRjzMxO
	 x9SzgqXfS+EUlZum9pw2QdSzPOSubceEK1vPk18dEksESwwb5Ip9xbpQg6ZC4SpG2f
	 bgGe6645bRsLfdV5AaaEgixxa6AYm0ZHPwWXH19f8knydO8RG2MKRwatkkHCGgHg/t
	 gx9NSk3igwS6dpdDEEwDVFDQTBBZ4C3UCfg34z3Fu1q8n+scnge81HbPqSBg7Oflrf
	 7ZVSIJCtC6lng==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BAE804B762;
	Fri, 27 Nov 2026 11:03:04 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 19:02:51 +0800
Subject: [PATCH v2 3/4] rust: wmi: add Driver trait, Adapter and implement
 RegistrationOps
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
Message-Id: <20261127-rust-wmi-v2-3-5bfafabd6a6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795777382; l=6617;
 i=nick42d@gmail.com; s=20261127; h=from:subject:message-id;
 bh=Yr/cV4bFQCpsCIJouPt3fyTS/uUCj24+sQv4ztfNN4g=;
 b=oocXIrckJJYiL4FowQMun3GCoMuuBgUIH3fw3ykOKGrWiNVvBPlI2qqAP/6TvwCBAlgsX1Bje
 xZIYNqPbf6NBC7EgjwrtIopzoeQ9FFuSxec08klN+OQSSshU6ZjOidV
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=rewGRrQm8GTjt8ii+wLiI2tUWP5gtTF4pntVEMNXrj8=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/20261127 with
 auth_id=1660
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com
Content-Transfer-Encoding: 7bit

From: Nick Dowsett <nick42d@gmail.com>

- Implements the `wmi::Driver` trait.
- Adds adapter implementing `driver::DriverLayout` and
  `driver::RegistrationOps` - `wmi::Adapter<T: Driver>`.
- Adds `wmi::Registration<T>` type alias for convenience.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
 rust/kernel/wmi.rs | 127 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/wmi.rs b/rust/kernel/wmi.rs
index f7fbde29177b..235c4a2cef6a 100644
--- a/rust/kernel/wmi.rs
+++ b/rust/kernel/wmi.rs
@@ -8,15 +8,138 @@
     bindings,
     device,
     device_id::RawDeviceId,
+    driver,
+    error,
     prelude::*,
     sync::aref::AlwaysRefCounted,
-    types::Opaque, //
+    types::Opaque,
+    ThisModule, //
 };
 use core::{
     marker::PhantomData,
     ptr::NonNull, //
 };
 
+/// Type alias for [`driver::Registration<Adapter<T>>`], the registration of
+/// a WMI driver wrapping a [`struct wmi_driver`].
+///
+/// When this struct is dropped the driver will be unregistered.
+///
+/// [`struct wmi_driver`]: srctree/include/linux/wmi.h
+pub type Registration<T> = driver::Registration<Adapter<T>>;
+
+/// WMI driver trait.
+///
+/// Drivers must implement this trait in order to register a WMI driver.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::{device::Core, prelude::*, wmi};
+/// struct MyDriver;
+///
+/// kernel::wmi_device_table!(
+///     MY_DRIVER_WMI_TABLE,
+///     [wmi::DeviceId::new(c"00000000-0000-0000-0000-000000000000")]
+/// );
+///
+/// impl wmi::Driver for MyDriver {
+///     type Data<'bound> = Self;
+///     const ID_TABLE: wmi::IdTable = &MY_DRIVER_WMI_TABLE;
+///
+///     fn probe<'bound>(
+///         _dev: &'bound wmi::Device<Core<'_>>,
+///     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
+///         Err(ENODEV)
+///     }
+/// }
+/// ```
+pub trait Driver {
+    /// The type of the driver's bus device private data.
+    type Data<'bound>: Send + 'bound;
+    /// The table of WMI device IDs supported by the driver.
+    const ID_TABLE: IdTable;
+    /// The `probe` callback is called when the WMI driver is bound to a matching WMI device.
+    /// Allocating driver-specific data structures and initializing interfaces to other kernel
+    /// subsystems should normally be done in this function.
+    fn probe<'bound>(
+        dev: &'bound Device<device::Core<'_>>,
+    ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound;
+}
+
+/// Adapter to allow [`Driver`] to be used with [`driver::Registration`].
+pub struct Adapter<T: Driver>(T);
+
+// SAFETY:
+// - `wmi_driver` is a C struct.
+// - Since `T` is a driver, `T::Data` is by definition the type of its
+//   device private data.
+// - `wmi_driver` embeds a `device_driver` at offset `DEVICE_DRIVER_OFFSET`
+//   as per `core::mem::offset_of!()`.
+unsafe impl<T: Driver> driver::DriverLayout for Adapter<T> {
+    type DriverType = bindings::wmi_driver;
+    type DriverData<'bound> = T::Data<'bound>;
+    const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
+}
+
+// SAFETY: It's always valid to unregister a registered `wmi_driver`.
+unsafe impl<T: Driver> driver::RegistrationOps for Adapter<T> {
+    unsafe fn register(
+        reg: &Opaque<Self::DriverType>,
+        name: &'static CStr,
+        module: &'static ThisModule,
+    ) -> Result {
+        // SAFETY:
+        // - It's safe to set the fields of `wmi_driver` on initialization.
+        // - All set fields meet the invariants of `wmi_driver`.
+        unsafe {
+            // SAFETY: `name` is valid for the static lifetime.
+            (*reg.get()).driver.name = name.as_char_ptr();
+            // SAFETY: This callback will only be called with a pointer to a `wmi_device`
+            // valid for the lifetime of the callback.
+            (*reg.get()).probe = Some(Self::probe_callback);
+            // SAFETY: `T::ID_TABLE` is valid for the static lifetime.
+            (*reg.get()).id_table = T::ID_TABLE.as_ptr();
+            // Per the documentation, new WMI drivers should be allowed to be instantiated
+            // multiple times (see `Documentation/wmi/driver-development-guide.rst`).
+            (*reg.get()).no_singleton = true;
+        }
+
+        // SAFETY: `reg` is a valid `wmi_driver`.
+        error::to_result(unsafe { bindings::__wmi_driver_register(reg.get(), module.as_ptr()) })
+    }
+    unsafe fn unregister(wdrv: &Opaque<Self::DriverType>) {
+        // SAFETY: `wdrv` is a valid `wmi_driver` previously registered with `register()`.
+        unsafe { bindings::wmi_driver_unregister(wdrv.get()) };
+    }
+}
+
+impl<T: Driver> Adapter<T> {
+    /// C wrapper for [`Driver::probe`] function to use it as a C function pointer.
+    ///
+    /// # Safety
+    /// - The caller must ensure that `wdev` is a pointer to a `wmi_device` valid for
+    ///   the lifetime of the callback.
+    unsafe extern "C" fn probe_callback(
+        wdev: *mut bindings::wmi_device,
+        _context: *const c_void,
+    ) -> c_int {
+        // SAFETY:
+        // - As per the safety requirement for the function, `wdev` is a pointer to a
+        //   `struct wmi_device` valid for the lifetime of the callback.
+        //   This is the definition of the Core and CoreInternal marker lifetime.
+        // - `Device` is `#[repr(transparent)]` over `struct wmi_device`.
+        let wdev = unsafe { &*wdev.cast::<Device<device::CoreInternal<'_>>>() };
+        let data = T::probe(wdev);
+        // As per the C driver subsystem documentation, the return type of a driver
+        // probe callback is 0 on success or a kernel error code on failure.
+        error::from_result(|| {
+            wdev.as_ref().set_drvdata(data)?;
+            Ok(0)
+        })
+    }
+}
+
 /// IdTable type for WMI drivers.
 pub type IdTable = &'static dyn crate::device_id::IdTable<DeviceId, ()>;
 
@@ -140,7 +263,7 @@ impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
     fn as_ref(&self) -> &device::Device<Ctx> {
         // SAFETY:
         // - By the type invariant on `Device<Ctx>`, `self.as_raw()` is a valid pointer to
-        //   a `wmi_device which embeds a `device`.
+        //   a `wmi_device` which embeds a `device`.
         // - If you have a reference to a `Device<Ctx>`, then the reference count must be
         //   non-zero.
         // - If you have a reference to a `Device<Ctx>`, it is either:

-- 
2.56.1


