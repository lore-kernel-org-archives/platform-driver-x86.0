Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795322144;
	b=Pehot08C+e1hxaozXN9a4G6lT0GAqdYP9a7qgvyg4Kx3D9REflfZcxCubrG68va9UwV/
	 AHXn9cyvIW70Ig2po+P8jngNPuoNBqOeV50R5souzsa6HjiLizoS96YHbCd9KM3ckS2uo
	 dM6hCXsXDEksiV2IRXEqrnLvrCr424I5pbQLq7hvU7t3OO0E/0WCVtG8F1BbXrL9i3Zwf
	 rwLsAHD3tPMytZUPLhfVnVmXI2XAYYBcjV04yRMG+ADEXJ7pf942Uhkp2ly55+d26DQ/v
	 i4WG/BxA2Fxpp15a72hHTNI9vcwf1B4yC09BznRSjQcVkD66CtkMfyo2Cxc/obhHFnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795322144;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6w1KSDkRJhlso48nKJo/NCKPKTEqmQ7kzzIZEMGYM1I=;
	b=btO1DHpRC5Izm+nq5tE8iSLSN3vC98bpHqQtmqPgdeyWMKlSfwtCfaSZp1l0WPimwf/y
	 DTtPvOJ7xdrV/N1x7ae8x1ri1OWgwtJUYpAoxlS0YMiiPFlhxPttsWbyyLAz2pgiWQY+9
	 r8w3vgYDA5VoT/hms7kMZcFlbc3rZX8rFP4EukbsTf8NY/0NGVzZh6yZyBAsRqmj4OnVL
	 M11gmzGPTFMnzM5pIpWh6svXhJsJoKeUNIY1F0SSdbHtw3V90U284D7M9bhH5ClutqLQ6
	 +/SQ1TX/h+p8b6nfndQrEBYdoltgHHwumfB4l6Ttp0ImBT45d6PE72IGHQmKh3IQUtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJ6J0RPC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5662606A695;
	Sun, 22 Nov 2026 04:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJ6J0RPC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795322144;
	b=qRB3SnO976tTMBjGppYAD1V1i69UI5OO6FckXXGWg00+F+G+k7LxvKW1rKLmLCGw52h+
	 JGUZKErhdNppT2Oo342dLRBGbqrvpnGdk8p9zpsJXQjVkyzWLS95bIzGOK3gHnVpeG8hE
	 MgN0kiDJIEucPaH2k4L6jLbJTgmV0l9rtHZ445R4D85nioDiJRmOP3w/GwqwBw+0oMoIi
	 9d+gMbsAi9sfKW6eGU7Vefd0OiBUDDc+mMc6FG786uewDiCpW3nPjtV0ANmGOhTtxM5hF
	 Dk5JWReb5kWULE9a3C56GsWeiBli6awYW7bLAO5Ii7UGDYCMD2ukaePU6Pfrx/8iovw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795322144;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6w1KSDkRJhlso48nKJo/NCKPKTEqmQ7kzzIZEMGYM1I=;
	b=kgdBZyquGKJQW6UsWOGl4QvSxQlmvkJBbimw71TeYeBb23ZsXH9lad0y2HDeXMek5rJb
	 MujHqUtfklppES2Rhlz2AsPYz3N4WvhDEVKRgZwY2ei+vCrNUaYqZLEsaqm9Fj8bRPM2t
	 YOuQkoRa0dkE3kG+jyGE0N27FhntbVUi52N2EXqQcXVu6PzH4nA48w+A+kteSkUvjjF3k
	 YgLN1gWyPR/0sMMNlge34c3c2G9nkQT2unfjpazBSoFHcZK+9mSt1vxaqFPFi3xDE83ii
	 75ZAwjxc/ZoQ8FtJwJXRN9Uqr2hcsJPH9781wBApNZfjyOdcC+UaIkkOYeqES+CvQ1A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B96921F000C4;
	Sun, 22 Nov 2026 04:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795322144;
	bh=6w1KSDkRJhlso48nKJo/NCKPKTEqmQ7kzzIZEMGYM1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JJ6J0RPCNC89lA72ejLOujbNO+KkgnS7o8khwTH+3atP+nqBqqxKxPdCz0Mu5YZQO
	 eAJ8VWJha1PyBfkMq1I4J3MdO12JNa8YlK8GZJipsoqxux6JMacR1MX5ZbwW+o5cQf
	 qnNQeHty0R2aEf6OZ52muSLxKuY+q0oJ8Q0/Ulq3BNVru9CXfra4Bh/G8hyWw+vh/1
	 ZGNud3btzo1Olfei5AkKUamkcQBq71FzHEAS37ialzFUnphez4wywITpWQba5OXrjH
	 vNRxD88yR/xAUblSgswH6EriJZSLZ8l96RL2Sz24gulXJ/znTuPjQ8VgBFmpU/IXUC
	 ggO88xGcK87gQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 471C84BF03;
	Sun, 22 Nov 2026 04:35:42 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 12:35:40 +0800
Subject: [PATCH 3/4] platform/x86: clevo-laptop: probe keyboard backlight
 type and detect 5-step white backlight
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
Message-Id: <20261122-clevo-laptop-v1-3-881debf4d4b0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795322140; l=6319;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=zhmmGSNR3OSLrzhCCRTFeuk7Hl8QAWk96pymxiIpueQ=;
 b=yvR0HYD40/ncdu8Rn5vvHwCpW32+HFnym+lcwVUt/kQXf8VZqAtjZ/zw+rWOd5Q9J8uHsgisK
 23wRgPoV2+YDpdkCiVYPzx0Bzf6TkwdzJy0afKrKMCGMniDJIrPfdyd
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=1uIkNexEofzEXNN3Y3QW5z8IrgjWaP0yH6Es51jxWOg=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/default with
 auth_id=1596
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com
Content-Transfer-Encoding: 7bit

From: Nick Dowsett <nick42d@gmail.com>

- Add `GetSpecs` and `GetBiosFeatures2` EC queries and `KbBacklightType`
  detection (with retries and BIOS features fallback for older devices).
- Restrict probe to the supported 5-step white keyboard backlight.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
 drivers/platform/x86/clevo-laptop.rs | 125 +++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/drivers/platform/x86/clevo-laptop.rs b/drivers/platform/x86/clevo-laptop.rs
index 289b30c478ec..6f08bf295c07 100644
--- a/drivers/platform/x86/clevo-laptop.rs
+++ b/drivers/platform/x86/clevo-laptop.rs
@@ -13,6 +13,10 @@
     device,
     dmi,
     prelude::*,
+    time::{
+        delay::fsleep,
+        Delta, //
+    },
     wmi, //
 };
 
@@ -24,7 +28,12 @@
 /// DMI board name allowlist, restricted to tested boards since the WMI GUID is not
 /// unique.
 const SUPPORTED_BOARDS: &[&CStr] = &[c"NLx0AU"];
+const CLEVO_EC_CMD_GET_SPECS: u8 = 0x0D;
 const CLEVO_EC_CMD_GET_BIOS_FEATURES_1: u8 = 0x52;
+const CLEVO_EC_CMD_GET_BIOS_FEATURES_2: u8 = 0x7A;
+const CLEVO_BIOS_FEATURE_CODE_WHITE_ONLY_KB: u32 = 0x4000_0000;
+const CLEVO_BIOS_FEATURE_CODE_3_ZONE_RGB_KB: u32 = 0x0040_0000;
+const CLEVO_BIOS_FEATURE_CODE_WHITE_ONLY_KB_MAX_5: u32 = 0x4000;
 const CLEVO_EC_WMI_INSTANCE: u8 = 0;
 
 module! {
@@ -89,6 +98,17 @@ fn probe<'bound>(
 
             backend.query(GetBiosFeatures1).map_err(|_| ENODEV)?;
 
+            // MVP: Only the NL57AU 5-step white backlight is supported.
+            if backend.detect_backlight_type()? != Some(KbBacklightType::FixedColor) {
+                return Err(ENODEV);
+            }
+            let has_white_5 = backend
+                .query(GetBiosFeatures2)
+                .is_ok_and(|feat2| feat2.has_white_only_kb_max_5());
+            if !has_white_5 {
+                return Err(ENODEV);
+            }
+
             Ok(try_pin_init!(WmiDriver {}))
         })
     }
@@ -127,6 +147,61 @@ fn query<Q>(&self, query: Q) -> Result<Q::Output>
             }
         }
     }
+    /// Detect backlight type e.g white.
+    fn detect_backlight_type(&self) -> Result<Option<KbBacklightType>> {
+        const MAX_RETRIES: usize = 3;
+        const RETRY_SLEEP_DURATION: Delta = Delta::from_millis(50);
+
+        for attempt in 0..MAX_RETRIES {
+            if attempt != 0 {
+                pr_debug!(
+                    "KbBacklightType::None probably wrong, retrying - attempt {} of {}\n",
+                    attempt,
+                    MAX_RETRIES - 1
+                );
+                fsleep(RETRY_SLEEP_DURATION);
+            }
+            if let Ok(specs) = self.query(GetSpecs) {
+                let backlight_type = specs.kb_backlight_type();
+                if backlight_type != Ok(None) {
+                    return backlight_type.map_err(|_| ENODEV);
+                }
+            }
+        }
+
+        // Check for devices <= Intel 8th gen (only white only, 3 zone RGB,
+        // or no backlight on these devices)
+        let feat1 = self.query(GetBiosFeatures1).map_err(|_| ENODEV)?;
+        if feat1.has_3_zone_rgb_kb() {
+            Ok(Some(KbBacklightType::ThreeZoneRgb))
+        } else if feat1.has_white_only_kb() {
+            Ok(Some(KbBacklightType::FixedColor))
+        } else {
+            Ok(None)
+        }
+    }
+}
+
+/// Keyboard backlight type - e.g Fixed Color
+#[derive(PartialEq)]
+#[repr(u8)]
+enum KbBacklightType {
+    FixedColor = 0x01,
+    ThreeZoneRgb = 0x02,
+    OneZoneRgb = 0x06,
+    PerKeyRgb = 0xF3,
+}
+impl KbBacklightType {
+    const fn from_raw(raw: u8) -> Result<Option<Self>, u8> {
+        match raw {
+            0x01 => Ok(Some(KbBacklightType::FixedColor)),
+            0x02 => Ok(Some(KbBacklightType::ThreeZoneRgb)),
+            0x06 => Ok(Some(KbBacklightType::OneZoneRgb)),
+            0xF3 => Ok(Some(KbBacklightType::PerKeyRgb)),
+            0x00 => Ok(None),
+            other => Err(other),
+        }
+    }
 }
 
 /// Args for a command sent to the EC.
@@ -144,8 +219,12 @@ fn as_bytes(&self) -> &[u8] {
     }
 }
 
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+struct GetSpecs;
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 struct GetBiosFeatures1;
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+struct GetBiosFeatures2;
 
 impl EcQuery for GetBiosFeatures1 {
     type Output = BiosFeatures1;
@@ -163,10 +242,56 @@ fn deserialize_output(output: &[u8]) -> Result<Self::Output> {
         Ok(feat)
     }
 }
+impl EcQuery for GetBiosFeatures2 {
+    type Output = BiosFeatures2;
+    fn cmd(&self) -> u8 {
+        CLEVO_EC_CMD_GET_BIOS_FEATURES_2
+    }
+    fn args(&self) -> EcMethodArgs {
+        EcMethodArgs::Scalar(0)
+    }
+    fn deserialize_output(output: &[u8]) -> Result<Self::Output> {
+        let (feat, _) = BiosFeatures2::read_from_prefix(output).map_err(|_| ENODATA)?;
+        Ok(feat)
+    }
+}
+impl EcQuery for GetSpecs {
+    type Output = Specs;
+    fn cmd(&self) -> u8 {
+        CLEVO_EC_CMD_GET_SPECS
+    }
+    fn args(&self) -> EcMethodArgs {
+        EcMethodArgs::Scalar(0)
+    }
+    fn deserialize_output(output: &[u8]) -> Result<Self::Output> {
+        let (specs, _) = Specs::read_from_prefix(output).map_err(|_| ENODATA)?;
+        Ok(specs)
+    }
+}
 
 #[derive(Debug, Clone, Copy, PartialEq, Eq, FromBytes)]
 struct BiosFeatures1(u32);
+#[derive(Debug, Clone, Copy, PartialEq, Eq, FromBytes)]
+struct BiosFeatures2(u32);
+#[derive(Debug, Clone, Copy, PartialEq, Eq, FromBytes)]
+struct Specs([u8; 16]);
 
 impl BiosFeatures1 {
     const INVALID: Self = Self(0xFFFF_FFFF);
+    const fn has_white_only_kb(self) -> bool {
+        (self.0 & CLEVO_BIOS_FEATURE_CODE_WHITE_ONLY_KB) != 0
+    }
+    const fn has_3_zone_rgb_kb(self) -> bool {
+        (self.0 & CLEVO_BIOS_FEATURE_CODE_3_ZONE_RGB_KB) != 0
+    }
+}
+impl BiosFeatures2 {
+    const fn has_white_only_kb_max_5(self) -> bool {
+        (self.0 & CLEVO_BIOS_FEATURE_CODE_WHITE_ONLY_KB_MAX_5) != 0
+    }
+}
+impl Specs {
+    const fn kb_backlight_type(&self) -> Result<Option<KbBacklightType>, u8> {
+        KbBacklightType::from_raw(self.0[0x0F])
+    }
 }

-- 
2.56.1


