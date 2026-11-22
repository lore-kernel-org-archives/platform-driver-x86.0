Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795322144;
	b=FXfJVAx7SWRPhSkM/9cz3g4+D77hqYH9+JIWAERjvHwSf1/26U+qzKKBT/PH4umfZJzn
	 eUgp1XHKIEarhwQl6yQDiwrfUu87MYbXWBJ/snN9/otj02kmSkNks9EyhmtGTwAZYubcJ
	 gVH3JT8tCTZPt+omWFcA8NaxFrWeLdxflhkdn74zW9BRUxy031mrFexbJJdIEaO/7rAim
	 3crkO3nu9fbg53B106JjKHDtFrpDIJ9OGHLKcrJ8wE6jVtjsN9F31eaHFsfEecCEBgubE
	 eclOzF+Fwi8nfXWkOmj/+4HmIEycN4HkyPL5ilHtdamSZGjszZFC5zdZPj9BwZrvhSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795322144;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nM5RZAWXXxV7flnIrsp6Ya4aRfvKlk/fkxnnJrnt4pQ=;
	b=ODF4qOy1nyiFYZBW7hZd8ZZHEV/C+c7VJOMOnmzKjUqSR/vQ4FsPG2ByaGZPBWPLoan8
	 dIid84HJ11SCv80qnTDPcGDQL4h2klvYQpklKknGDs3+3Z3WSKvr+Aoz2bUZf0cFRl8rp
	 sYwRhMSJnge5JAlMn2spyimZ1eBuif4yJbAyjHaEHCxrFuV4AOMZrxlvFxXc5trtE9Qzq
	 f5jJ5Rd8onUfpGeo3rU157aYZ0HsBimsu/MyFkRq6d4GqROuwUud+/VI0SvOiy2/8nbPz
	 h5OUdRBhULps6obVu5b/51yRgk54T1GMj+81ntkmUO3yR2K8iNkZNnhmzY5Gz2ejsAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3Pr00vU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E369606A686;
	Sun, 22 Nov 2026 04:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3Pr00vU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795322144;
	b=VJwO6gp058k7vtqKOm9mvJGitPOANyMoHvNSV61p7E5BeAzCvj5qjmA3MYoM8a6ACsET
	 KDc26lpwvbL+zq1Lz0KcwrvUP5BpL+V1uZSemmHUjQs74dvMH2JhHcFLCht4d5ycKSmIF
	 usjQca1gL1BPeGzv8wuMWb4ksF0+CWcjBicK4iEVXHPj/EBnu4+YYTxuYqPBmFFyTiEdP
	 a7TedpXtIojshDlckgs/K2AOyDXTggBdl+aQqx3p5bS4dCufHwJwrHmqOlGpinE8kGMYd
	 tjmcQJ8iiOxPxjWIt3bviUPGpPlbE4MtA8swyE6IGsiNan4fx7ThMJwO4/xVSfYrZCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795322144;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nM5RZAWXXxV7flnIrsp6Ya4aRfvKlk/fkxnnJrnt4pQ=;
	b=2PFFw4IpvoZtIuWMHJtW8A/uPLWb4dyPa8IWWGH3fRokfxcwAQtrR1rWS/jzlL8zJXuN
	 nkXapXVhacIt6alRmIeRzOQT3+FudC5jA2GrqBQVKwUhZpQZGlxUhwCV730C9p0SLGreh
	 Ht20XHwHdoaMMf4VKHEEdlYUw97wVg7p6bSIw2yxQJRnv2Wm3+XOXyiqfJDu08192gfFL
	 Iw3jSNTxeU6V8obUy0WocJleRv8v94lfHKZDFyymNr2pryA5rqNZiE7fnAS99kKbVtimW
	 0YcoKv1C6zr6NoGHh2hkLKqmgE+yQIQBZc53Xw4ZfnNVur/uj+BBY7PVK+Uv0zeWxXA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CBB01F000C0;
	Sun, 22 Nov 2026 04:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795322144;
	bh=nM5RZAWXXxV7flnIrsp6Ya4aRfvKlk/fkxnnJrnt4pQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=R3Pr00vUeishvthCtC8ioAQNOvBX9mS7bdrrMoizy0KNGzorAVdTBrqdvPoqwn9GP
	 TDO1SokmNgKuHcUhmnm6jtfKRPtj2859aMeHyTu0ep+gsoLNN6S3eRdROfNX8Clcx0
	 kXIFl5Ql79ekEcl7RGlw4SNMATnpwOrjFKz6Sh6YRNO1Zq2ens3K0ddRQ/kSEhifNb
	 5AyGgEFsNJDC91JBSU2/ELN4vYAH1rbAqmOALsRQW0hYMqpWC38EdsF9mQAOO1ZDfr
	 ZEUKD1uB9GWzTc0Xf+iNC+zxCryNOmVfe3bwflycchVLDWYfdWj83ZcKrDpKogWKJ9
	 BUZYU9tVBKQtQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2A6EC4BEFF;
	Sun, 22 Nov 2026 04:35:42 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 12:35:39 +0800
Subject: [PATCH 2/4] platform/x86: clevo-laptop: add EC WMI query interface
 and BIOS feature check
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
Message-Id: <20261122-clevo-laptop-v1-2-881debf4d4b0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795322140; l=4496;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=EPKNfrbkINZpqJuaFZ3pMA8YKpq/n10Zk87rakX3Q7k=;
 b=uw5Rn7jXoU00duppx5D21qAg0OfXBZjgW/qqa3ysThTq2dLQVxjgnkts4rkrqLMNvu8HujExs
 MFeKLSOZXTPBbJFihKx83xSn1X2mvk3RXgEHKsxxww0LQCSu/6jWl0c
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=1uIkNexEofzEXNN3Y3QW5z8IrgjWaP0yH6Es51jxWOg=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/default with
 auth_id=1596
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com
Content-Transfer-Encoding: 7bit

From: Nick Dowsett <nick42d@gmail.com>

- Add `EcQuery` trait and implement `EcInterface` for sending commands to
  the Clevo EC over WMI.
- Add `GetBiosFeatures1` query to verify the EC responds during probe.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
 drivers/platform/x86/clevo-laptop.rs | 104 ++++++++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/clevo-laptop.rs b/drivers/platform/x86/clevo-laptop.rs
index 1d862c57b3fe..289b30c478ec 100644
--- a/drivers/platform/x86/clevo-laptop.rs
+++ b/drivers/platform/x86/clevo-laptop.rs
@@ -24,6 +24,8 @@
 /// DMI board name allowlist, restricted to tested boards since the WMI GUID is not
 /// unique.
 const SUPPORTED_BOARDS: &[&CStr] = &[c"NLx0AU"];
+const CLEVO_EC_CMD_GET_BIOS_FEATURES_1: u8 = 0x52;
+const CLEVO_EC_WMI_INSTANCE: u8 = 0;
 
 module! {
     type: ClevoLaptopModule,
@@ -33,6 +35,21 @@
     license: "GPL",
 }
 
+/// Represents a query that can run on the Clevo Embedded Controller (EC).
+///
+/// # Endianness note
+/// Clevo EC sends and receives little endian data.
+/// As this is a `platform/x86` driver, no conversion is required.
+trait EcQuery {
+    type Output;
+    /// EC method code.
+    fn cmd(&self) -> u8;
+    /// EC method args.
+    fn args(&self) -> EcMethodArgs;
+    /// Each command must know how to deserialize itself from the raw EC output.
+    fn deserialize_output(output: &[u8]) -> Result<Self::Output>;
+}
+
 /// RAII guard for Clevo Laptop Module holding all subsystem drivers e.g WMI.
 #[pin_data]
 struct ClevoLaptopModule {
@@ -65,8 +82,91 @@ impl wmi::Driver for WmiDriver {
     type Data<'bound> = WmiDriver;
     const ID_TABLE: wmi::IdTable = &WMI_TABLE;
     fn probe<'bound>(
-        _dev: &'bound wmi::Device<device::Core<'_>>,
+        dev: &'bound wmi::Device<device::Core<'_>>,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
-        try_pin_init!(WmiDriver {})
+        pin_init::pin_init_scope(move || {
+            let backend = EcInterface::Wmi(dev);
+
+            backend.query(GetBiosFeatures1).map_err(|_| ENODEV)?;
+
+            Ok(try_pin_init!(WmiDriver {}))
+        })
+    }
+}
+
+/// Interface to Clevo Embedded Controller.
+enum EcInterface<'a> {
+    Wmi(&'a wmi::Device<device::Bound>),
+}
+impl<'a> EcInterface<'a> {
+    /// Send a query to the EC, receiving a response.
+    fn query<Q>(&self, query: Q) -> Result<Q::Output>
+    where
+        Q: EcQuery + core::fmt::Debug,
+        Q::Output: core::fmt::Debug,
+    {
+        let cmd = query.cmd();
+        let arg = query.args();
+
+        match self {
+            Self::Wmi(wdev) => {
+                dev_dbg!(
+                    wdev.as_ref(),
+                    "ec cmd {query:?} method_id 0x{cmd:02x} arg {arg:x?}\n"
+                );
+                let buf = wdev.invoke_method(
+                    CLEVO_EC_WMI_INSTANCE,
+                    cmd.into(),
+                    arg.as_bytes(),
+                    core::mem::size_of::<Q::Output>(),
+                )?;
+
+                let res = Q::deserialize_output(&buf)?;
+                dev_dbg!(wdev.as_ref(), "ec cmd {query:?} -> {res:?}\n");
+                Ok(res)
+            }
+        }
     }
 }
+
+/// Args for a command sent to the EC.
+#[derive(Debug)]
+enum EcMethodArgs {
+    Scalar(u32),
+}
+impl EcMethodArgs {
+    /// Convert to the type expected by the EC.
+    fn as_bytes(&self) -> &[u8] {
+        match self {
+            // Clevo EC expects little-endian integers; x86 is always little-endian.
+            Self::Scalar(val) => val.as_bytes(),
+        }
+    }
+}
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+struct GetBiosFeatures1;
+
+impl EcQuery for GetBiosFeatures1 {
+    type Output = BiosFeatures1;
+    fn cmd(&self) -> u8 {
+        CLEVO_EC_CMD_GET_BIOS_FEATURES_1
+    }
+    fn args(&self) -> EcMethodArgs {
+        EcMethodArgs::Scalar(0)
+    }
+    fn deserialize_output(output: &[u8]) -> Result<Self::Output> {
+        let (feat, _) = BiosFeatures1::read_from_prefix(output).map_err(|_| ENODATA)?;
+        if feat == BiosFeatures1::INVALID {
+            return Err(ENODEV);
+        }
+        Ok(feat)
+    }
+}
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq, FromBytes)]
+struct BiosFeatures1(u32);
+
+impl BiosFeatures1 {
+    const INVALID: Self = Self(0xFFFF_FFFF);
+}

-- 
2.56.1


