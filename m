Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795321704;
	b=XcDO+iaIS1LATFKWc4kuAGqBs3GgFOYQ1VirF69pi6HayX7SEC4RHOyM+ZSGbSKRJkQH
	 NqyA5PWvJvR1ijojjKuT6OrsfAlJwbSPUK+kXHMu1tn/Mw5n97i/eCfeXgrOfiCTt84nY
	 rV2JrqJ75luu26wPt7RynG6uOKWeMD+ML4ypmJAum8F9VEYh1d2XGgJiNt6uOmjVJ62kv
	 UEhH1MRGWDMm7Yl8pCAVutLRAT8bz++Dd8CbOJa2fTkNEyI4XacaNC7rRgke6VeIGDK6O
	 v02N7qfiyKKkgU1hem4U/PaweQzg+f2ZqcsJoB+jeLWn+5celIBQxYZhvegsH+yxfLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321704;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iOB3JE5qE0FUvOsGS7IC7g4sM218MK+UDdbKg/F5LWA=;
	b=FSGCenX5ffkN4YQUdzXBd8ADRvySTrpTmO4sQQj1Vwpjo+9SPSoHZv77XyEkDS5Z/bzP
	 V7lvzFL2yBV6n2JcOqGsK8iMoPZKT2Jr69hD8ctWp9/7O4BrlIF9uzSqV16kh4G0td8kI
	 AaFUGvCAbi9te6uZ05A4A1LvYjWjCjMG9ZlF9e0xA/gkkDDJEmk4HjiMEtPaEdFLkDaWq
	 zMAOZogxZEl41kjLkYTBxsOIVClr7e66Tg8NWfgwdSSv0znwFZCcsWscYb8T/68Ai9C8H
	 i9zz/3Wvnwgp0ReLmvUbuqVbsc7VIEE10Qh9ibPb7YOYjEWujuwvEiHsBJlsxc0wkCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eVEsVxEi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3762606A687;
	Sun, 22 Nov 2026 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eVEsVxEi
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795321704;
	b=jokUd89y+aDsrYHwkxFh0L4lqBcFh5xSwxTK47p/yskZYyL7Yo+syCrJR9meXg6TXUrB
	 XYqwfdGSFMZaC7JRqsjNn1cp5kuY+VG+ShqK2zp2NYG0UjgiaFQY/Po6jOhznw+kQXlrf
	 85GWyRVepuZ6+depXxDFlwBYjFY3Z8gsdVFtQDmNTKObw6YPBNM9P3x3qK3/mRbAXUH5U
	 4ujxr+susiT56qZfDOTkk/E/bxRmyDhzbMcLHk0eSr7gQLI0W5w9Fk/xDDLuNviM1Th99
	 FGn2Lp/Pq9lDzs5YeQ+3YT5eIs9GZxt+bsxLR29mYhYYNnvlKoM+zRh3L9nq0nxOUgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795321704;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iOB3JE5qE0FUvOsGS7IC7g4sM218MK+UDdbKg/F5LWA=;
	b=FwGJyrJkSzDISWj3UAsc9uI1I8wnl5vaP+3M13pFbsjcEyIQfwN6zaOP/8czO279daPJ
	 xSyfbqIIUnUwqTQpa18ASs+48W5CN4EIamAALc8EPz5uYr1X5uqtG2KiTr4W9BqNrpDgx
	 k5mnKR4DD59dJu08N+DjfJhDsSNEXN7GoDONFhnE2TJhGSFHd1Agi3AbmPmUZscBBsXcj
	 in/YGdN+6PWnEEiRkA4zqZBFiAnmIGCun8++1T6SR+PZx2XdMHbuQhasAiLHDpMsUxzZz
	 zBvDKY2dIKvxtpbzNEE3p2E7iySpJ/G4+g3XFB1VBKU4qmlRB3gsOX9uljlFUzT5g9g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E43AD1F000CA;
	Sun, 22 Nov 2026 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795321704;
	bh=iOB3JE5qE0FUvOsGS7IC7g4sM218MK+UDdbKg/F5LWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eVEsVxEiCRr2JBD/JfNNljqp+DsJ1dmdMIEeROaXUApcZgdPD/CsIm5eM5os51w6J
	 YVzh2N9Sz5wHbknCsH3Di3wSyBDGpvGp/KmYaMM2KoMz2nee8jNCP03uXCUuWckS3a
	 dCz9zF7VDb4oRRpkXTP+8jSEeu3vLYWO5QlBWptg1zucleV8vyRBQ48XcWpnpTzpjt
	 9oLLdadCha+LIdg0dw/7kxaUoUQud25HctYliIUgs/U9AOZ3qhSNsqioF0Q2C5T9ew
	 vOwhz3AahC5RJlf0OULya4PpE/claU/3zmM0TPEtE8FckYlLUifPmPw7J5K2jciSTa
	 2xV4AmbYnYZuw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 740B74BEEE;
	Sun, 22 Nov 2026 04:28:22 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 12:28:16 +0800
Subject: [PATCH 3/4] rust: wmi: add Driver trait, Adapter and implement
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
Message-Id: <20261122-rust-wmi-v1-3-63111d9e824c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795321700; l=6297;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=NBBpMJ2e+LoZ/1yJhSczt6U3XB3Ub4uia4ccHmG6ulI=;
 b=AADnUhHNgw1sRfdAG73isLFjmJjuIPtj7VRj86+EVDjShOpyZggn9JR4dTv9qzLSEbL7XqLxk
 XMBz3XJubp8A1QQ36mBWPHqzMCCkn9mJhDevn4XqRy2oalO3TvWd4Yr
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=1uIkNexEofzEXNN3Y3QW5z8IrgjWaP0yH6Es51jxWOg=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/default with
 auth_id=1596
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
 rust/kernel/wmi.rs | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/wmi.rs b/rust/kernel/wmi.rs
index 494797fdbf68..09712cbc1c93 100644
--- a/rust/kernel/wmi.rs
+++ b/rust/kernel/wmi.rs
@@ -8,15 +8,134 @@
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
+            (*reg.get()).driver.name = name.as_char_ptr();
+            // SAFETY: This callback will only be called with a pointer to a `wmi_device`
+            // valid for the lifetime of the callback.
+            (*reg.get()).probe = Some(Self::probe_callback);
+            (*reg.get()).id_table = T::ID_TABLE.as_ptr();
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
 
@@ -133,7 +252,7 @@ impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
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


