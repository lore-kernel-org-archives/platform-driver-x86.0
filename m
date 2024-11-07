Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AE721894F
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731013196; cv=none; b=LTmaWInszTHPReip8nnfv/3vCB91kGwDutqGewqDoMzAc9swLgI1Vk4OhaEznPR/UBoo0eYRxJZaZ6wTCYEsCqK3Cr+kE7ORQtlsn8L4efnKuh5Mc69dSnBKg6V2xL3Vx9dbMzsf0Hn4Rr5Ed1ujQIdkha7FvVnaoJr6oAiF5Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731013196; c=relaxed/simple;
	bh=VoW+AYdBn5gDEVrzqejl/zPu6fJnlNOqEnSv20OCuAQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=htXQanjsefsGWUQ8PpR8zRAQB4oAY6L6kEYvnH4Vj5kl4xXK+HePW2wPcGzDr/i6TIo5K/cGNCI5x5oVv93z4kDt40DcBLxt7uwOg+zMWH5e3lRwtVkZJlW1WGJyfdm7/PB0eNKY6SImzQELthRTL6OLTNNNW6/0P5yEqAesHEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stowell.pro; spf=pass smtp.mailfrom=stowell.pro; dkim=pass (2048-bit key) header.d=stowell.pro header.i=@stowell.pro header.b=W7RzPxiv; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stowell.pro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stowell.pro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stowell.pro header.i=@stowell.pro header.b="W7RzPxiv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stowell.pro;
	s=protonmail2; t=1731013179; x=1731272379;
	bh=2KKVWwxWrzZiJudXl2IJdjfWIC9VUE6VdAF45niX7AM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=W7RzPxiv7EtzhX1UMj/Qg9pERHAxVGzL0LF6Wukm0V7OxtcS0kt0RvoiGwYhEkge7
	 3H6DbfIOZLuqrDErGdkTbe67f3rRoNgXwLSjciFxRdnYHDFjcirFzotUxBMIJNae1g
	 diM5nTvxJ1Xb4QLyrELIsh/2AN1Ka85Yye5DQNqujAZvyY8q2r4IMxdQDN0FVuRJW2
	 Ued6PaMPGAQy/Z0txjBJA1Lq18YZvxCinca5SOEBleYu8cILYZlVW/yVdicTKc4OrC
	 B4eNEpZCOtVu3Apb61SrYHwIKg3s9ihMhbCfzrUs3A5zJHFfqp9DUyG+LlNOxsjRo6
	 /XQu3KmTg7ADw==
Date: Thu, 07 Nov 2024 20:59:34 +0000
To: platform-driver-x86@vger.kernel.org
From: Cole Stowell <cole@stowell.pro>
Cc: linux-kernel@vger.kernel.org, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, alexhung@gmail.com, Cole Stowell <cole@stowell.pro>, Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH] intel-hid: fix volume buttons on Thinkpad X12 Detachable Tablet Gen 1
Message-ID: <20241107205908.69279-1-cole@stowell.pro>
Feedback-ID: 52027723:user:proton
X-Pm-Message-ID: 69dba8408ba6a9b7f1ea045692cf3f00a9751864
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------6ccf60ec37fdeaadf84b2f486a6a80766953055f5159cc843b264bf7087ce119"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------6ccf60ec37fdeaadf84b2f486a6a80766953055f5159cc843b264bf7087ce119
Content-Type: multipart/mixed;
 boundary=93d17a1c425e04f8d3181cdb373a4041be4f3ddf37cacaf8a88cf0bbcaee
From: Cole Stowell <cole@stowell.pro>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	alexhung@gmail.com,
	Cole Stowell <cole@stowell.pro>,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH] intel-hid: fix volume buttons on Thinkpad X12 Detachable Tablet Gen 1
Date: Thu,  7 Nov 2024 15:59:08 -0500
Message-ID: <20241107205908.69279-1-cole@stowell.pro>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0

--93d17a1c425e04f8d3181cdb373a4041be4f3ddf37cacaf8a88cf0bbcaee
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Volume buttons on Lenovo Thinkpad X12 Detachable Tablet Gen 1 did not
send any input events when pressed. When loading intel-hid with the 5
Button Array explicitly enabled, the buttons functioned normally.

Adds the X12 Detachable Tablet Gen 1 to the `button_array_table`.

However, the driver is unable to call INTEL_HID_DSM_BTNE_FN and prints
the warning "failed to set button capability" when attempting to enable
or disable the 5 Button Array. I'm not sure if this is normal,
but the warning seems harmless.

Co-developed-by: Mary Strodl <mstrodl@csh.rit.edu>
Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
Signed-off-by: Cole Stowell <cole@stowell.pro>
---
 drivers/platform/x86/intel/hid.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 445e7a59beb4..48ad75a56199 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -118,6 +118,13 @@ static const s
truct dmi_system_id button_array_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x2 Detachable"),
 		},
 	},
+	{
+		.ident = "Lenovo ThinkPad X1 Tablet Gen 1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X12 Detachable Gen 1"),
+		},
+	},
 	{
 		.ident = "Lenovo ThinkPad X1 Tablet Gen 2",
 		.matches = {
-- 
2.47.0


--93d17a1c425e04f8d3181cdb373a4041be4f3ddf37cacaf8a88cf0bbcaee
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - cole@stowell.pro -
 0x146D8A8D.asc"; name="publickey - cole@stowell.pro - 0x146D8A8D.asc"
Content-Type: application/pgp-keys; filename="publickey - cole@stowell.pro -
 0x146D8A8D.asc"; name="publickey - cole@stowell.pro - 0x146D8A8D.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tClZlcnNpb246IEdvcGVuUEdQIDIu
Ny40CkNvbW1lbnQ6IGh0dHBzOi8vZ29wZW5wZ3Aub3JnCgp4ak1FWXROQ3l4WUpLd1lCQkFIYVJ3
OEJBUWRBdDFuUjNGc0RpRTQ4MysvNy80OThpWFJLRlZUa1VINlFEWmZVCkI3dmM1Z25OSTJOdmJH
VkFjM1J2ZDJWc2JDNXdjbThnUEdOdmJHVkFjM1J2ZDJWc2JDNXdjbTgrd284RUVCWUsKQUNBRkFt
TFRRc3NHQ3drSENBTUNCQlVJQ2dJRUZnSUJBQUlaQVFJYkF3SWVBUUFoQ1JCUzFKbHFMdngyWXhZ
aApCQlJ0aW8zc0ErZFRGTlFMeEZMVW1Xb3UvSFpqZnRvQS9SNDhmZ096OENDSGg1Z0RNYm9NT0JT
bDdaVzVuYmtwCnRvWkFmRTJGUUVadEFQc0czbDdPY01JOXpqOERIbDRCMjNSUUJ1cXhGdUcvU1Bo
YVZyemRUeHVpQ000NEJHTFQKUXNzU0Npc0dBUVFCbDFVQkJRRUJCMEFEckFkN1JhWVgwTEhxL1Fh
MTBGMDJPM3ZzaTRRUm1IbGRhdktUQ3RUZgpSd01CQ0FmQ2VBUVlGZ2dBQ1FVQ1l0TkN5d0liREFB
aENSQlMxSmxxTHZ4Mll4WWhCQlJ0aW8zc0ErZFRGTlFMCnhGTFVtV291L0haalltRUJBUGVzSVll
WlRCVTFra1ZNQ011b0xrSm4wdUlmRTlHc2FZKzJCajBUSXpxaUFQOWwKZ3JYUkpoVm13d1pQVHFK
aFNXb0NSTFFRdXR1bnRBNm5neWlvd01lS0JRPT0KPTBCTDkKLS0tLS1FTkQgUEdQIFBVQkxJQyBL
RVkgQkxPQ0stLS0tLQ==
--93d17a1c425e04f8d3181cdb373a4041be4f3ddf37cacaf8a88cf0bbcaee--

--------6ccf60ec37fdeaadf84b2f486a6a80766953055f5159cc843b264bf7087ce119
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYIACcFAmctKjUJEFLUmWou/HZjFiEEFG2KjewD51MU1AvEUtSZai78
dmMAAJ/XAQCcr2za6oMkL8WGR9iRYjehNoqmJzd9yKzBKEX5QdFhJQEA6JtG
mpFT3uWC7e8bI8qh0HaY7wnOcAyeFneYUmcgBAc=
=qpQI
-----END PGP SIGNATURE-----


--------6ccf60ec37fdeaadf84b2f486a6a80766953055f5159cc843b264bf7087ce119--

