Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A67C2DFA31
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767901754; cv=none; b=ZO8mWVr9Acq0oxzZkb1iCcFRYvNisgkZmWWdinvUKUCIJyzMbyaQH8u8BORcHd1AuBcBDMkYKC0a8S2ommU8h863mOvDWD4KX/3NAS1aJOz+ObpmvzrfXS3/5bXNBczVwIv7dlqnYsELmk/ZQXa/A+dN29vl+UKvvN1LKrZm67o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767901754; c=relaxed/simple;
	bh=Rv22B45ECl7K4GgRzlTULCM5XRcWxKi2sI4Hk2eZ0ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3oJfJmD4W+2HgPiUIknVuD0vz/LNGuewpHuhSYARpqjlC7CwnHvQS6J+IAgLtY/yX4giApB7HyyqtegvubbcV/TWMLuoUqspWICtujr2IJXaFUhUECpPWoGoZvSyOj8tVciEDpXXih1/PyWmGY4dyl+fJZMeO+XohQeNjLUuk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8wC8/P8; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8wC8/P8"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3e7f68df436so1707646fac.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Jan 2026 11:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767901752; x=1768506552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JXd+uiaj7Yzl0wRzGWDip8TkXzK9MhZ9eZ0oBIaW4y0=;
        b=N8wC8/P8hzdq02TwG8uW4VgHgz4K4TmMm+LYtzHBtWQIj0hRvcuYvIWM6dZQUBHFP1
         dpiS5UghZKIhY4FSFizHIUwyZ01+8iZ+lHt7XoS8SSJpkE/neSDLLMncVDm6xMSo1h5A
         Tc7BtxEvGGTBTFdN6k5I5md4+S2dA/i3jjg713YXCH6qchnMsk/t2iqcHEyyMRp5fyv5
         u5r9gTP8YdtCrFGr5GVAhpafxPwaTB0Ii2ugQQsZkVBefm8FmCAkp+Q/3PDy4E2tBZ+7
         jUSAM5aj8fqOd/XQOuuQ7m93JHpdJd5DEWgIrKhKTygHMZZsX8MGgYl//qEAQihY98LN
         guZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767901752; x=1768506552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXd+uiaj7Yzl0wRzGWDip8TkXzK9MhZ9eZ0oBIaW4y0=;
        b=cz3yjKLDgSAAVRg677Ox89KwQuGiSPLjxitndc8B9NhwJS+OHryxnidSCjF/B3KBck
         bhrLxNBM+b1zveBowlTb7K3R3TRhZJEqLNhYttwraesNfQ9gCB4Lr5niRT9MTBBPcVMW
         FqvG/6Ve2jCh+ZFsFiMVyjJ/MVSBsWR6ftLcoa+AbcCgR9GkgiOw8xe25qWov61DMM1m
         /vQ1sOBGJaI3WqEiLE/tg/pYNRzKr5T2fK6AhONij3AeB2Ld4dW5U+UH1HVB+AJjqucJ
         BQN5Kj3oI5LLKF7yepH64ykR7KuAEwdXAwiug2Heb8y2t3dSe494FZzQgQ6dentL7ObN
         dltA==
X-Forwarded-Encrypted: i=1; AJvYcCU4mHWOtJbTufs8UmZ+/lA/zuLfgfGCyK/sBhu7jf9aISbnHcCXG6Uarj4kcwJkHWmF6DoSXNaBzq4nMCtDYYRI5dy/@vger.kernel.org
X-Gm-Message-State: AOJu0YxiUmdvvrv2+M3C00fEPKgo5t22GGTwq8qYwU5eLqYtplSlvuoJ
	qk2JgXO6Z6uBVmKdTV8KcBaCBlwu83Y6fq85gIvPri01cRGjTT6ojunHwRG0EDbF
X-Gm-Gg: AY/fxX4PNVneAm6bzheCPvwFdcBPRB2DtCZ5vODDlL/O86u2gqOBJE2SCc1iVdV1csS
	BGE8kZTh0FGuy2klxPK7lAxn4X/sg6KE4H3bsNPw2sF6Vrbu7aLRCr6SGGXqNBRs9zByoqkgDpW
	XZtOn4cGNsnP6O/cwExyq6TVaww9NC9BiGQn6gD0pGwNq9wrApTYkH9DOfXr6JRp/tXqdWWtB35
	lAWNmXll0MQ6zRyQZWgMFSUQ7pYOaTlPcqHnLIs8s4Yej6BKUpXT3RGSFynlkeEWdBrpIdlYBeH
	rG2Vj/LVEHsr3HnUq3qt2sXQvh3/I081jZMawr+dI25cpTyJt3Bu/Pvf0S0S+PCbfPpb0p4oT5J
	Xi9WBBvsRR84YUh2P5Ktg6Ecvl7Ivx4Yh4pZIXL/xvoDmJbiJdqa5fQSxRxh13CTRm9YAB4UQT7
	HCXpBMl2HiGlvCJdnKUgPDEXaqEioGrmoB08FkXkGXsOVexYkGzfcnO7oG
X-Google-Smtp-Source: AGHT+IHFFyCUxkj1ikJIpyyHr++2rhGsKovrS8Ixx05kY0aC7b0C4Go1pGQjC70k2O2yIsd66eeFmw==
X-Received: by 2002:a05:6871:8807:b0:3e8:97ab:d072 with SMTP id 586e51a60fabf-3ffbed0b801mr3484923fac.6.1767901751541;
        Thu, 08 Jan 2026 11:49:11 -0800 (PST)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4e3af4csm5579222fac.7.2026.01.08.11.49.10
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 11:49:11 -0800 (PST)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3f0c93ecf42so1502081fac.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Jan 2026 11:49:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhzPgFnHNZCAwoxo6U9F6QO2mA+okVuj8DdbsUrDkzh7MdlgqlFyTSGHtHmA4MwBQ/8VwU9VVuUuLGP3MAa+wiv+BG@vger.kernel.org
X-Received: by 2002:a05:6870:3355:b0:3f6:1e6:d0dc with SMTP id
 586e51a60fabf-3ffa24c14c7mr6020642fac.16.1767901750102; Thu, 08 Jan 2026
 11:49:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767818037.git.foxido@foxido.dev> <a119094f2e248587c541daf7c5b65bf4398b281b.1767818037.git.foxido@foxido.dev>
In-Reply-To: <a119094f2e248587c541daf7c5b65bf4398b281b.1767818037.git.foxido@foxido.dev>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Thu, 8 Jan 2026 21:48:58 +0200
X-Gmail-Original-Message-ID: <CAKBF=psGUwgr7e+EM1d2OAv8H1A6zKfhQaSPS56vVcnc=Ez_KA@mail.gmail.com>
X-Gm-Features: AQt7F2qS-4Xdo8QSiijGqc44FrAK202VttrXKCL_GLage0GrD20RodnCOw4u54M
Message-ID: <CAKBF=psGUwgr7e+EM1d2OAv8H1A6zKfhQaSPS56vVcnc=Ez_KA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: add WMI abstractions
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: "foxido @ foxido . dev-cc= Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Jan 2026 at 22:56, Gladyshev Ilya <foxido@foxido.dev> wrote:
>
> This introduces Rust abstraction for WMI subsystem via wmi::Driver trait
> and module_wmi_driver/wmi_device_table macros. Driver can be probed,
> notified on events and removed -- almost everything C-side can do.
>
> This abstraction will be used by subsequent redmi_wmi_rs reference
> driver.
>
> Signed-off-by: Gladyshev Ilya <foxido@foxido.dev>
> ---
>  MAINTAINERS                     |   1 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/lib.rs              |   2 +
>  rust/kernel/wmi.rs              | 277 ++++++++++++++++++++++++++++++++
>  4 files changed, 281 insertions(+)
>  create mode 100644 rust/kernel/wmi.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 765ad2daa218..4909ae8be6e3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -404,6 +404,7 @@ F:  Documentation/driver-api/wmi.rst
>  F:     Documentation/wmi/
>  F:     drivers/platform/wmi/
>  F:     include/uapi/linux/wmi.h
> +F:     rust/kernel/wmi.rs
>
>  ACRN HYPERVISOR SERVICE MODULE
>  M:     Fei Li <fei1.li@intel.com>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index a067038b4b42..f9671280c6b5 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -85,6 +85,7 @@
>  #include <linux/usb.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
> +#include <linux/wmi.h>
>  #include <linux/xarray.h>
>  #include <trace/events/rust_sample.h>
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index a6eccdba50b5..29bc2b87a103 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -152,6 +152,8 @@
>  pub mod uaccess;
>  #[cfg(CONFIG_USB = "y")]
>  pub mod usb;
> +#[cfg(CONFIG_ACPI_WMI)]
> +pub mod wmi;
>  pub mod workqueue;
>  pub mod xarray;
>
> diff --git a/rust/kernel/wmi.rs b/rust/kernel/wmi.rs
> new file mode 100644
> index 000000000000..a15258365a2e
> --- /dev/null
> +++ b/rust/kernel/wmi.rs
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions for the WMI devices.
> +//!
> +//! C header: [`include/linux/wmi.h`](srctree/include/linux/wmi.h).
> +
> +use crate::{
> +    acpi::AcpiObject,
> +    device,
> +    device_id::{
> +        RawDeviceId,
> +        RawDeviceIdIndex, //
> +    },
> +    driver,
> +    error::{
> +        from_result,
> +        to_result,
> +        VTABLE_DEFAULT_ERROR, //
> +    },
> +    prelude::*,
> +    types::Opaque, //
> +};
> +use core::{marker::PhantomData, mem::MaybeUninit, ptr::NonNull};

Also for these use vertical style.

> +use macros::vtable;
> +
> +/// [`IdTable`](kernel::device_id::IdTable) type for WMI.
> +pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
> +
> +/// The WMI driver trait.
> +#[vtable]
> +pub trait Driver: Send {
> +    /// The type holding information about each one of the device ids supported by the driver.
> +    type IdInfo: 'static;
> +
> +    /// The table of device ids supported by the driver.
> +    const TABLE: IdTable<Self::IdInfo>;
> +
> +    /// WMI driver probe.
> +    ///
> +    /// Called when a new WMI device is bound to this driver.
> +    /// Implementers should attempt to initialize the driver here.
> +    fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> impl PinInit<Self, Error>;
> +
> +    /// WMI device notify.
> +    ///
> +    /// Called when new WMI event received from bounded device.
> +    fn notify(self: Pin<&Self>, _dev: &Device<device::Core>, _event: Option<&AcpiObject>) {

This should be device::Bound

Also probably _ marks are not needed. I think compiler does give
unused build warnings.

I do not know reason but usually other drivers use this over self. And
device first so this
would be:

    fn notify(dev: &Device<device::Bound>, this: Pin<&Self>, event:
Option<&AcpiObject>) {

Same also in unbind. But like I said I'm not completely sure about this.

> +        build_error!(VTABLE_DEFAULT_ERROR);
> +    }
> +
> +    /// WMI driver remove.
> +    fn unbind(self: Pin<&Self>, _dev: &Device<device::Core>) {
> +        build_error!(VTABLE_DEFAULT_ERROR);
> +    }

unbind should not be mandatory so here just do

    let _ = (self, dev);

Also comment can say little more.

> +}
> +
> +/// A WMI device.
> +///
> +/// This structure represents the Rust abstraction for a C [`struct wmi_device`].
> +/// The implementation abstracts the usage of a C [`struct wmi_device`] passed
> +/// in from the C side.
> +pub struct Device<Cxt: device::DeviceContext = device::Normal> {
> +    inner: Opaque<bindings::wmi_device>,
> +    _p: PhantomData<Cxt>,
> +}
> +
> +impl<Cxt: device::DeviceContext> Device<Cxt> {
> +    fn as_raw(&self) -> *mut bindings::wmi_device {
> +        self.inner.get()
> +    }
> +}
> +
> +/// An adapter for the registration of WMI drivers.
> +pub struct Adapter<T: Driver>(T);
> +
> +// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
> +// a preceding call to `register` has been successful.
> +unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> +    type RegType = bindings::wmi_driver;
> +
> +    unsafe fn register(
> +        wdrv: &Opaque<Self::RegType>,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        macro_rules! map_callback {
> +            ($flag:ident -> $callback:ident) => {
> +                if T::$flag {
> +                    Some(Self::$callback)
> +                } else {
> +                    None
> +                }
> +            };
> +        }
> +
> +        // SAFETY: It's safe to set the fields of `struct wmi_driver` on initialization.
> +        unsafe {
> +            (*wdrv.get()).driver.name = name.as_char_ptr();
> +            (*wdrv.get()).driver.probe_type = bindings::probe_type_PROBE_PREFER_ASYNCHRONOUS;
> +            (*wdrv.get()).id_table = T::TABLE.as_ptr();
> +            (*wdrv.get()).probe = map_callback!(HAS_PROBE -> probe_callback);
> +            (*wdrv.get()).notify = map_callback!(HAS_NOTIFY -> notify_callback);
> +            (*wdrv.get()).remove = map_callback!(HAS_UNBIND -> remove_callback);
> +            (*wdrv.get()).shutdown = None;
> +            (*wdrv.get()).no_singleton = true;
> +            (*wdrv.get()).no_notify_data = true;
> +        }
> +
> +        // SAFETY: `wdrv` is guaranteed to be a valid `RegType`.
> +        to_result(unsafe { bindings::__wmi_driver_register(wdrv.get(), module.0) })

Many drivers use .0 but there is ongoing work that .0 is not used. So
can you use
.as_ptr() here.

> +    }
> +
> +    unsafe fn unregister(wdrv: &Opaque<Self::RegType>) {
> +        // SAFETY: `wdrv` is guaranteed to be a valid `RegType`.
> +        unsafe { bindings::wmi_driver_unregister(wdrv.get()) };
> +    }
> +}
> +
> +impl<T: Driver + 'static> Adapter<T> {
> +    extern "C" fn probe_callback(
> +        wdev: *mut bindings::wmi_device,
> +        id: *const c_void,
> +    ) -> kernel::ffi::c_int {
> +        // SAFETY: The WMI core only ever calls the probe callback with a valid pointer to a
> +        // `struct wmi_device`.
> +        //
> +        // INVARIANT: `wdev` is valid for the duration of `probe_callback()`.
> +        let wdev = unsafe { &*wdev.cast::<Device<device::CoreInternal>>() };
> +
> +        let id = id as usize;
> +        let info = T::TABLE.info(id);
> +
> +        from_result(|| {
> +            let data = T::probe(wdev, info);
> +
> +            wdev.as_ref().set_drvdata(data)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    extern "C" fn notify_callback(
> +        wdev: *mut bindings::wmi_device,
> +        obj: *mut bindings::acpi_object,
> +    ) {
> +        // SAFETY: The WMI system only ever calls the notify callback with a valid pointer to a
> +        // `struct wmi_device`.
> +        let wdev = unsafe { &*wdev.cast::<Device<device::CoreInternal>>() };
> +        // SAFETY:
> +        // - AcpiObject is repr(transparent) wrapper around FFI object, so it's safe to cast
> +        //    raw pointer to reference (in terms of alignment and etc),
> +        // - Option<&ref> is guaranteed to have same layout as raw pointer (with NULL representing
> +        //    None) by Rust's "nullable pointer optimization".
> +        let obj: Option<&AcpiObject> = unsafe { core::mem::transmute(obj as *const AcpiObject) };
> +
> +        // SAFETY: `notify_callback` is only ever called after a successful call to
> +        // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
> +        // and stored a `T`.
> +        let this = unsafe { wdev.as_ref().drvdata_borrow::<T>() };
> +        this.notify(wdev, obj);
> +    }
> +
> +    extern "C" fn remove_callback(wdev: *mut bindings::wmi_device) {
> +        // SAFETY: The WMI system only ever calls the remove callback with a valid pointer to a
> +        // `struct wmi_device`.
> +        let wdev = unsafe { &*wdev.cast::<Device<device::CoreInternal>>() };
> +
> +        // SAFETY: `remove_callback` is only ever called after a successful call to
> +        // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
> +        // and stored a `T`.
> +        let this = unsafe { wdev.as_ref().drvdata_borrow::<T>() };
> +        this.unbind(wdev);
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
> +        // `struct platform_device`.
> +        let dev = unsafe { &raw mut (*self.inner.get()).dev };
> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::from_raw(dev) }
> +    }
> +}
> +
> +kernel::impl_device_context_deref!(unsafe { Device });

Missing safety comment.

> +kernel::impl_device_context_into_aref!(Device);
> +
> +// SAFETY: Instances of `Device` are always reference-counted.
> +unsafe impl crate::sync::aref::AlwaysRefCounted for Device {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
> +        unsafe { bindings::get_device(self.as_ref().as_raw()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
> +        unsafe { bindings::put_device(&raw mut (*obj.as_ref().as_raw()).dev) }
> +    }
> +}
> +
> +/// Abstraction for the WMI device ID structure, i.e. [`struct wmi_device_id`].
> +///
> +/// [`struct wmi_device_id`]: https://docs.kernel.org/driver-api/basics.html#c.wmi_device_id
> +#[repr(transparent)]
> +pub struct DeviceId(bindings::wmi_device_id);
> +
> +impl DeviceId {
> +    /// Constructs new DeviceId from GUID string.
> +    pub const fn new(guid: &[u8; bindings::UUID_STRING_LEN as usize]) -> Self {
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut inner: bindings::wmi_device_id = unsafe { MaybeUninit::zeroed().assume_init() };

Use pin_init::zeroed() so no unsafe needed.

> +        build_assert!(inner.guid_string.len() == bindings::UUID_STRING_LEN as usize + 1);
> +
> +        // SAFETY: It's safe to copy UUID_STRING_LEN, because we validated lengths.
> +        // Also we leave last byte zeroed, so guid_string is valid C string.
> +        unsafe {
> +            ::core::ptr::copy_nonoverlapping(
> +                guid.as_ptr(),
> +                &raw mut inner.guid_string[0],
> +                bindings::UUID_STRING_LEN as usize,
> +            );
> +        }
> +
> +        Self(inner)
> +    }
> +}
> +
> +// SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `wmi_device_id` and does not add
> +// additional invariants, so it's safe to transmute to `RawType`.
> +unsafe impl RawDeviceId for DeviceId {
> +    type RawType = bindings::wmi_device_id;
> +}
> +
> +// SAFETY: `DRIVER_DATA_OFFSET` is the offset to the `context` field.
> +unsafe impl RawDeviceIdIndex for DeviceId {
> +    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::wmi_device_id, context);
> +
> +    fn index(&self) -> usize {
> +        self.0.context as usize
> +    }
> +}
> +
> +/// Declares a kernel module that exposes a single WMI driver.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// module_wmi_driver! {
> +///     type: MyDriver,
> +///     name: "Module name",
> +///     author: ["Author name"],
> +///     description: "Description",
> +///     license: "GPL v2",
> +/// }
> +/// ```
> +#[macro_export]
> +macro_rules! module_wmi_driver {
> +    ($($f:tt)*) => {
> +        $crate::module_driver!(<T>, $crate::wmi::Adapter<T>, { $($f)* });
> +    }
> +}
> +
> +/// Create a WMI `IdTable` with its alias for modpost.
> +#[macro_export]
> +macro_rules! wmi_device_table {
> +    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
> +        const $table_name: $crate::device_id::IdArray<
> +            $crate::wmi::DeviceId,
> +            $id_info_type,
> +            { $table_data.len() },
> +        > = $crate::device_id::IdArray::new($table_data);
> +
> +        $crate::module_device_table!("wmi", $module_table_name, $table_name);
> +    };
> +}
> --
> 2.52.0
>
>
