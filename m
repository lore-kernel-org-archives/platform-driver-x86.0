Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795321704;
	b=oqEXrMvLzHW7Gs27A0KzUEvSNI16wVaj11LfrQyxZao/+mv/83YKc/PJ1u38nwXaogci
	 bANwz+5C+zv4oDDVhPN46OsAktxXYUCWdMzWGhNuBqeXL5F4Soz9bFcFrhGcgvFKyr+7f
	 yj8jjvYtvLmyXCeDF5+oa1Su5WVkJ4ygzw2A4udPb38wpnJBuOvvY1UDKj7NBK3XHnSO4
	 1vMz13ddQdT9rAfdW0Po0x/HHqD1DvsTIEXZzMVYanX3rD/P8Bw9LFTti8Mqk5TTSql0k
	 mPVOs/hp8fqJIizIr3ZA05d8YgKCpw59FcQooDcYglknOsb1ab+mk/WjWCltM2YHmjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321704;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HXWx9Df0pY/DINSyxxO4vxfCFplqWB2ueWyslaQ3MdE=;
	b=R3f/q+YiTtMngSVQ2YbHeXLKbkowZGwbHQ8Q4RB1uLCudQTK9t87nwZlmzFV8JPVoZRB
	 ItkUJFreLalV1AqCbmHrA/WOkBLHggtuWrHbM+2zDZaNz4qZ4+eIgaJHIWACIoU1H089Z
	 F152k3FjeFq3pWJTevt6pUNCHCCykg2uyN9qIeke17tg/Sk5wh3eYf9xknsafW5y41h+S
	 LLQ/KEvYo3FWCQKrdrc4knCxreVDrPSUsY2IqOuEbM5ehhGBucx1+9BBNoqmjt3yMJQdR
	 cpnHhx18pfMz/2QLiq3SqLYFiI0lhrnNY73ZwgxJcI0W0Gtzwonr2HAueYWsIMSs80g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q7uvrMuz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675C7606A33E;
	Sun, 22 Nov 2026 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q7uvrMuz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795321704;
	b=f+16tup7Um+a17rlUq9g/jkfxJidWEkrush5SRht66m1Z5zf3q3GYRd9SABFc6YQGZTS
	 tWWNduPKomOUOsuPW9Ye/AI6co/vSnN3xohP2skhTbFpyIB0XWvFCa2fPSApdtQKcgbKB
	 6wwqxB1T2gX8kmjrwIlyaP+8+5rufKBdz90FpYZ3WqPoVbd0V3/x0q55CpO5G7ECV9qOK
	 DFGDC7xWsG75Urtmh35lQMSY0YBS3azlEeQgoa2VwRh7PPtFd5ojYjgb8Fhk5TYeXBeQ7
	 x0kabrg179k6pM2wrEkDKNILde9EHxJaYgwZ3o5B/hwW33Df5WpsfojcwEcf5uGq+kA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795321704;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HXWx9Df0pY/DINSyxxO4vxfCFplqWB2ueWyslaQ3MdE=;
	b=ubcv2KCFQoaL7/5ZdX3h41C6FFyU62upV/LS9g7mBIFtBT6KKTXn80F6LXLVg6Xyl9y5
	 tf6RukMZmPip2rbqKVgEvlFTA8jVIgyoXan+FUrzY+ht7RrmyQIW73BKs0m/WP41VLOhj
	 HmnHoUvPONKU3aZGvMQLAH/tcyxfwk34gqstefj4GxSFQx42fCXh5dKzzd3I/yFrgn3Xg
	 hIEXqmlFQEftcnhzQuSLsIn2yD5+L6OVUZZljBTvsg4+kMuiNVG0Zed9XHErljsPrZHsR
	 Frt3ySPcDotkCqynJZWpEbThtv/WjUeZzbeL7Tpa3PSOTcuJZ4LFmsNg2oRgsSq3PeQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C99CC1F000CF;
	Sun, 22 Nov 2026 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795321704;
	bh=HXWx9Df0pY/DINSyxxO4vxfCFplqWB2ueWyslaQ3MdE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Q7uvrMuzKLI2Ce3VvVcpHfxmbdA9fEBL9EHdit3qp5rwn1lbUNQOTayG+kZhFFPGX
	 IsXXILJyXMkC3LVmDc8RcoiAZgY6tmGKaJxnLEnx8TTEY2uwNOQpbyQ446ybQ/9WrC
	 UdRFO8wcfXgGyhSgsiVuwGXcE/qqp6+GCuCQUuUpBSsbYqoWVvsPLo4BnzTcuAliDL
	 WUOq0MuzJCZBjMDVO0QKfphbS3X7fe9xTCWuJP9ZKN5hPoFlisd+e/0yM8Q5WsLAAv
	 eN0Gy4XBdIo3xP0xqe036wdVr7eOm6yGqcSY+q/E1yAxYzBzhM3zCXmOhcU3p4nuxy
	 SjxuEf7qqIVPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5975D4BEEA;
	Sun, 22 Nov 2026 04:28:22 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 12:28:15 +0800
Subject: [PATCH 2/4] rust: wmi: add DeviceId and wmi_device_table! macro
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
Message-Id: <20261122-rust-wmi-v1-2-63111d9e824c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795321700; l=2770;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=rN5WOMkzuWsdFdqCtGFto3bveJqWkdJKdIJZrv+wpJA=;
 b=HjDeKiCcpD/X/W5TCtr79VRGMnJDNbpXoWRXrRCf1L/3uC1jmyZT66TotA9kdT+Y4Q4lS2YK1
 pLLqOiKX/DJB3ubFEcXPob2nyCVBHqrTSi3ciLVWbGaK+k4EgqRlpDo
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=1uIkNexEofzEXNN3Y3QW5z8IrgjWaP0yH6Es51jxWOg=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/default with
 auth_id=1596
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com
Content-Transfer-Encoding: 7bit

From: Nick Dowsett <nick42d@gmail.com>

- Add `wmi::DeviceId` wrapping `struct wmi_device_id`.

- Implements `wmi::IdTable` and the `wmi_device_table!` macro.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
 rust/kernel/wmi.rs | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/rust/kernel/wmi.rs b/rust/kernel/wmi.rs
index 5f1d8c9803d6..494797fdbf68 100644
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
@@ -15,6 +17,61 @@
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


