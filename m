Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795322144;
	b=S+4bCIyChh1WLh7aBUu8mqJDjRQXyV90JHlnv8qB8LeGFjlyxLw4GL64SGs3PFnlVwIB
	 nyL5AseRIPi4Osyt2MY9DO8vPoMRGyAcaX7M++IihsxXcJDpdDdhmyy7qt3nWLhNO0NiZ
	 TN3NUtsLkBjgW2mcYs9mmfeyluTS7B85sdWZfQTbgAvhzcGeOjE4cK0T8ThrpH+aOMhIi
	 aKPZRBGd6QHvQ6BpH09z5Q2btaU6mwZZTH2c3Fsb/s4WE6SXLkIBCLm9lXD6kCswEdY+n
	 pOe3tC3BToEBZ1xs4FXTho4vpj/pDPptZ/Si8fkVDz/nSbyJ7aJijYvboXKd8Zr6/sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795322144;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TEYgMxyx8vm22/gG+DhD0gLFIDLxgxoL7k4osD5HL1U=;
	b=RXj2x4pZEHv8md0IiyyjRjP3GUjkGMrcFjMGUKbBZFfLSKbUJcyL13+LsL5j8KQdh+L4
	 hRUx0Sx/jSOWBpDoRUc1QtzdbJO/56k9hhreD5tmrUJRdj5cbr/NCE1aJesvQWvodksWd
	 XB2kdg/rhhNeUC1E25Vh6E6j4ZYjvoLhljtdpx2kUjyNn5XyWhxyqdrZ0JNsS1jpR3ZLS
	 U3xFjh2Tj/+k519W2bCutePU057Zh+9UhHxHuBq+u05ClOdI4b49EXFIGei/5Rqwb0rKz
	 kSPEuDQ9jIA4dnVG2ENK3ayKcZJwtXOSlJYxAJn2IKrFH9A8X2pkHuX/Ds9Lyocm6dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZK7ZHEue;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2C1606A685;
	Sun, 22 Nov 2026 04:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZK7ZHEue
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795322144;
	b=u4SbeDlPffFDQLgE4XNMlKNsWWAKb6c54D5Nx7gqnHJbeWMUh0Bl/lewbMpb5x/DbJhT
	 RmjeKvuviH+1dIzBrkCgotjw25D3raKCwiKElaCXHOEVbEWGQwiMXkLPT54mAy70mY+2u
	 B1i5qFRbwGu3dPivPx55bEOompGveMe4tjWG1QagDV7b3LcOwcXGDvJw731kJP4NZyr8h
	 M2itODc7ZbcBeC6Wqy4rdLQ1Z+DKbyMoASGoBcbTJDBMXG40Lc0PxDdiNdXeo0qrqstU4
	 1uC8MwJnPYmVXNYYzSa3yWqFn+pB2NpehYHGOSEGeceCYngr0i6nYdtk0E+swPrP1Jw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795322144;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TEYgMxyx8vm22/gG+DhD0gLFIDLxgxoL7k4osD5HL1U=;
	b=oXP0OUX6zoKHztB2QTpvWwyxuoe6wtxEvzOP08Wtvtdjo3nZ09Nf+8OKWz2I4G8mALr/
	 we/5eMYKpKPvOTCzEGKLmnItDfzVcW+tI+CjY0//pbodBBNYAq0e7f/baDJYU1cKMO9Cd
	 CZyDhOpCFWemNUBpSGp04uPkugakZa0cTNcCGlSswPiYUlNlSDS+6dqcE94dA9UzZ5N0e
	 9u/aMpCrrfY8PLE98LbS8BIjpaN2RWQbm1OlHDzBuiyliKn7+cqh4VUQ7S8mIlihi83ep
	 0+Tc294tzCFlo+C+9a1gYiNicumMviTKsw7q3G3DP2ULD1cZiZHBEKzt+2m1MK5L1Qg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D38431F000CF;
	Sun, 22 Nov 2026 04:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795322144;
	bh=TEYgMxyx8vm22/gG+DhD0gLFIDLxgxoL7k4osD5HL1U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZK7ZHEuerpryacHN3c6psuPT2VqJr0XZvsGA6ytrATBDbMSvCx3HH/BCgaVur2uTx
	 HSty8RUkMITpjxtDHs4SJ0mMjzACO6EXzUn+YQMAKLnIIAh/mhmTkcYfwxp/DGk99n
	 CzvhlkgEVPCEmhYSfHQP5iIt3em7H2UfwtKoeD2bSAPLgCY/1dhhWSgn10EwFKKU8I
	 waQPbdV4sWmDovxljMq9/CdjBQYj1cXdtyhMAjXJ90QOzMYaOJ4W0n/r7TswBKVIP/
	 p9UTJuhBKmzR7RmvHjWjlvtrZrJMsafHw7RqLGjU44YV4ryeqGyTBxlLLJ9Synd1s5
	 lzQ1529at2nQQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 619454BF07;
	Sun, 22 Nov 2026 04:35:42 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 12:35:41 +0800
Subject: [PATCH 4/4] platform/x86: clevo-laptop: register 5-step white
 keyboard backlight LED device
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
Message-Id: <20261122-clevo-laptop-v1-4-881debf4d4b0@gmail.com>
References: <20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com>
In-Reply-To: <20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Armin Wolf <W_Armin@gmx.de>, Werner Sembach <wse@tuxedocomputers.com>, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Nick Dowsett <nick42d@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795322140; l=5814;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=w57T94ShI0LShB2wRkuNbPlY4Amo9JRyqK2KuAoMqHs=;
 b=DKQ/TUsRuX2U3+TE48LKKw1KN+3UVUItfycAQrEs8Oltw7SsALlGlZo28PWc58J8UxbMamZ9j
 bR2yvY1GiytAwRQVKkLV3MSX3ZotBxc618ab7aPfD26+hGl3zrbmtTY
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=1uIkNexEofzEXNN3Y3QW5z8IrgjWaP0yH6Es51jxWOg=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/default with
 auth_id=1596
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com
Content-Transfer-Encoding: 7bit

From: Nick Dowsett <nick42d@gmail.com>

- Add `SetWhiteBrightness` EC command and `Brightness` wrapper.
- Implement `LedOps` (`FixedColorLedOperations`) and register a
  `white:kbd_backlight` LED class device during WMI probe.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
 drivers/platform/x86/clevo-laptop.rs | 100 +++++++++++++++++++++++++++++++++--
 1 file changed, 95 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/clevo-laptop.rs b/drivers/platform/x86/clevo-laptop.rs
index 6f08bf295c07..0a9cb96e7811 100644
--- a/drivers/platform/x86/clevo-laptop.rs
+++ b/drivers/platform/x86/clevo-laptop.rs
@@ -10,8 +10,14 @@
 //! Inspired by Tuxedo Computers' drivers.
 
 use kernel::{
+    self,
     device,
     dmi,
+    led::{
+        self,
+        LedOps,
+        Normal, //
+    },
     prelude::*,
     time::{
         delay::fsleep,
@@ -31,6 +37,7 @@
 const CLEVO_EC_CMD_GET_SPECS: u8 = 0x0D;
 const CLEVO_EC_CMD_GET_BIOS_FEATURES_1: u8 = 0x52;
 const CLEVO_EC_CMD_GET_BIOS_FEATURES_2: u8 = 0x7A;
+const CLEVO_EC_CMD_SET_KB_WHITE_LEDS: u8 = 0x27;
 const CLEVO_BIOS_FEATURE_CODE_WHITE_ONLY_KB: u32 = 0x4000_0000;
 const CLEVO_BIOS_FEATURE_CODE_3_ZONE_RGB_KB: u32 = 0x0040_0000;
 const CLEVO_BIOS_FEATURE_CODE_WHITE_ONLY_KB_MAX_5: u32 = 0x4000;
@@ -63,7 +70,7 @@ trait EcQuery {
 #[pin_data]
 struct ClevoLaptopModule {
     #[pin]
-    _wmi_driver: wmi::Registration<WmiDriver>,
+    _wmi_driver: wmi::Registration<WmiDriver<'static>>,
 }
 
 impl kernel::InPlaceModule for ClevoLaptopModule {
@@ -83,12 +90,14 @@ fn init(module: &'static ThisModule) -> impl PinInit<Self, Error> {
 
 /// RAII guard for Clevo WMI driver holding all subsystem devices e.g LED device.
 #[pin_data]
-struct WmiDriver {}
+struct WmiDriver<'a> {
+    _led: LedRegistration<'a>,
+}
 
 kernel::wmi_device_table!(WMI_TABLE, [wmi::DeviceId::new(CLEVO_WMI_METHOD_GUID)]);
 
-impl wmi::Driver for WmiDriver {
-    type Data<'bound> = WmiDriver;
+impl wmi::Driver for WmiDriver<'_> {
+    type Data<'bound> = WmiDriver<'bound>;
     const ID_TABLE: wmi::IdTable = &WMI_TABLE;
     fn probe<'bound>(
         dev: &'bound wmi::Device<device::Core<'_>>,
@@ -109,11 +118,64 @@ fn probe<'bound>(
                 return Err(ENODEV);
             }
 
-            Ok(try_pin_init!(WmiDriver {}))
+            if let Err(e) = backend.query(SetWhiteBrightness(Brightness::OFF)) {
+                dev_dbg!(
+                    dev,
+                    "Error {e:?} setting keyboard brightness on initialization.\n"
+                );
+            }
+
+            let led_dev = KBox::pin_init(
+                led::DeviceBuilder::new()
+                    .name(c"white:kbd_backlight")
+                    .color(led::Color::White)
+                    .build(
+                        dev.as_ref(),
+                        try_pin_init!(FixedColorLedOperations { backend }),
+                    ),
+                GFP_KERNEL,
+            )?;
+
+            Ok(try_pin_init!(WmiDriver {
+                _led: LedRegistration::White5Step { _dev: led_dev },
+            }))
         })
     }
 }
 
+/// RAII guard for Clevo LED device holding the appropriate sysfs device for the backlight type.
+enum LedRegistration<'a> {
+    White5Step {
+        _dev: Pin<
+            KBox<led::Device<'a, FixedColorLedOperations<'a, { Brightness::MAX_WHITE_5.raw() }>>>,
+        >,
+    },
+}
+
+/// Represents how to perform LED operations for a Clevo single-color LED keyboard, generic over
+/// `MAX_BRIGHTNESS`.
+#[pin_data]
+struct FixedColorLedOperations<'a, const MAX_BRIGHTNESS: u8> {
+    backend: EcInterface<'a>,
+}
+#[vtable]
+impl<'a, const MAX_BRIGHTNESS: u8> LedOps for FixedColorLedOperations<'a, MAX_BRIGHTNESS> {
+    const BLOCKING: bool = true;
+    const MAX_BRIGHTNESS: u32 = MAX_BRIGHTNESS as u32;
+    type Mode = Normal;
+
+    fn brightness_set<'bound>(
+        self: &<Self::Mode as led::Mode>::Device<'bound, Self>,
+        brightness: u32,
+    ) -> Result<()> {
+        let clamped = u8::try_from(brightness)
+            .unwrap_or(MAX_BRIGHTNESS)
+            .min(MAX_BRIGHTNESS);
+        self.backend
+            .query(SetWhiteBrightness(Brightness::new(clamped)))
+    }
+}
+
 /// Interface to Clevo Embedded Controller.
 enum EcInterface<'a> {
     Wmi(&'a wmi::Device<device::Bound>),
@@ -182,6 +244,20 @@ fn detect_backlight_type(&self) -> Result<Option<KbBacklightType>> {
     }
 }
 
+/// Keyboard backlight brightness level.
+#[derive(Debug, PartialEq, Eq, PartialOrd, Ord, Copy, Clone)]
+struct Brightness(u8);
+impl Brightness {
+    const OFF: Self = Self(0);
+    const MAX_WHITE_5: Self = Self(5);
+    const fn new(val: u8) -> Self {
+        Self(val)
+    }
+    const fn raw(self) -> u8 {
+        self.0
+    }
+}
+
 /// Keyboard backlight type - e.g Fixed Color
 #[derive(PartialEq)]
 #[repr(u8)]
@@ -219,6 +295,8 @@ fn as_bytes(&self) -> &[u8] {
     }
 }
 
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+struct SetWhiteBrightness(Brightness);
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 struct GetSpecs;
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
@@ -226,6 +304,18 @@ fn as_bytes(&self) -> &[u8] {
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 struct GetBiosFeatures2;
 
+impl EcQuery for SetWhiteBrightness {
+    type Output = ();
+    fn cmd(&self) -> u8 {
+        CLEVO_EC_CMD_SET_KB_WHITE_LEDS
+    }
+    fn args(&self) -> EcMethodArgs {
+        EcMethodArgs::Scalar(self.0.raw().into())
+    }
+    fn deserialize_output(_output: &[u8]) -> Result<Self::Output> {
+        Ok(())
+    }
+}
 impl EcQuery for GetBiosFeatures1 {
     type Output = BiosFeatures1;
     fn cmd(&self) -> u8 {

-- 
2.56.1


