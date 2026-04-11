Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09BC370D6D
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775921732; cv=none; b=BamGpWlzheAyLs33a3BTyX6zzzuONMyUG1GUKf7oaNgLd8vj+TzL5/cGRET7RLHrZSKW3e2JA3sQJWcGzdx59nIzXb7ywzvtR75m4wL/ttT/cvxG+4+q8otlCvtPEcu1QuBBjhp2RIrA23fdmizClGbeEDnerHmIipL4MJVRlxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775921732; c=relaxed/simple;
	bh=JjOcATBiphshUAVF6+CPCFdsq7PK0q43ZmQ5/0JZMbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lIHCOlki5f+gW2nGThYszbeVYZgvyhbDpo8EWHTFFTHIg1xgC4HgdcunbCuNxEhkX2QDJRWSFGuAkNjaA6cy0VljdKmHXhpCdXe3FDsuDsy9ic+6WOIZsdbRd7/12HJK+J3lg6O2m0+e1RADwOPO/6LZE6uOOSpp5OM1L/YohUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=levitati.ng; spf=pass smtp.mailfrom=levitati.ng; dkim=pass (2048-bit key) header.d=levitati.ng header.i=@levitati.ng header.b=mLpXBhIh; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Nng9dies; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=levitati.ng
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=levitati.ng
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=levitati.ng header.i=@levitati.ng header.b="mLpXBhIh";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Nng9dies"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=mLpXBhIhYkObUTwW2MGHgcvZaSv5gxVi2vqUxC5/4xouJh9DKQrXQHIjT+VWvu5yCe7NRFvUopNzKrbH7CMk9JOBXUzg2dWBV0wKbllMGQAM0+KzvuDyuLp9jV3gTubpP/+SPsxTDRPkkK1loMmnzHYrcVaet9rhuQezXjEOxatiC76P3Hn/VlKNjv32te4v9VJcxL9J0Jl6XI2TG409ITN8YZjaMNjiQwCl4D4uI7PURfaeHbgSRBaTqguleTP7lF9BbeVB1MqMTVd1kTv3cjjrckqyiaDODfGiCsuA13ZBuK3VMlfPfgVyXI55y5ARzRYDM+IzUI+DZZ/ngCjviw==; s=purelymail3; d=levitati.ng; v=1; bh=JjOcATBiphshUAVF6+CPCFdsq7PK0q43ZmQ5/0JZMbc=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=Nng9diesDTRgu7EugOhqBQ8jaDlr42ySSX7LdDuDq0ACk4pRpNRBN6vxS0eXHWjo9LlToSUNGEgYhE9/YP5t5BWxr3GIjAg9nAh6IeLm/L+ybBpr/UukYmD4rIAscn0Re7Kfz58QEEgx++Xi2sZ5aCkg7hvt9wiu0jcesxlCCHMYffOb7OxrGogi7nMjSxU8ZmdPzqR+apGDbjGb7vEoASe4rIyHm9sd6V8Hv0Gw1D5O/dQPK0DkecEdpX4YGuPxahMNxpdtS6Sm3cTFFuTMHNQFM9XaGuwwLNUYyHeJQCudQ/rFrUVZ/R+xYIYahHZo3wXq9saECJAsFubKguCNSg==; s=purelymail3; d=purelymail.com; v=1; bh=JjOcATBiphshUAVF6+CPCFdsq7PK0q43ZmQ5/0JZMbc=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 25799:4744:null:purelymail
X-Pm-Original-To: platform-driver-x86@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -252409021;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 11 Apr 2026 15:35:18 +0000 (UTC)
From: "LevitatingBusinessMan (Rein Fernhout)" <me@levitati.ng>
To: hmh@hmh.eng.br
Cc: mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	hansg@kernel.org,
	"LevitatingBusinessMan (Rein Fernhout)" <me@levitati.ng>
Subject: [PATCH] platform/x86: thinkpad_acpi: Don't report non-present second fan on models with quirk
Date: Sat, 11 Apr 2026 17:34:52 +0200
Message-ID: <20260411153452.1168082-1-me@levitati.ng>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Some models report a second-fan with speed 65535 indicating that this fan i=
s not present.

A previous fix (a10d50983f7be) disabled these fans.

However, the else branch still enables the fan on some models with a quirk =
enabled.

Namely the P15v Gen 1 has such a quirk, introduced in e8637dfca15e0.

Although it appears the P15 Gen 1 does have a second fan, the P15v Gen 1 do=
es not (reporting speed 65535).

I think in all cases, this can be solved by never enabling the fan if it is=
 detected and the reported speed reads 65535.

To do so, we only run the else branch if no fan was detected.
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform=
/x86/lenovo/thinkpad_acpi.c
index 8982d92dfd97..282a0c54ce0c 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -8948,7 +8948,7 @@ static int __init fan_init(struct ibm_init_struct *ii=
bm)
 =09=09=09=09/* fan control not currently available for ns ECFW */
 =09=09=09=09tp_features.second_fan_ctl =3D !fan_with_ns_addr;
 =09=09=09=09pr_info("secondary fan control detected & enabled\n");
-=09=09=09} else {
+=09=09=09} else if (res < 0) {
 =09=09=09=09/* Fan not auto-detected */
 =09=09=09=09tp_features.second_fan =3D 0;
 =09=09=09=09if (quirks & TPACPI_FAN_2FAN) {
--=20
2.53.0

