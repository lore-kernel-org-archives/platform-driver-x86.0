Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BDD3191C8
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 14:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101991; cv=none; b=aW2FqwGKoUgHmJRLbujK4zAw59dNPB7r+6xyz2djrwf6pupohjf8BWmd6HrkgaiSfOuXmIJOtqGwayPy0IOUMZERFwK3NVXNUgayY486jsgGjMCWh3jXaoiu4A9dho1jdzlOd9x3gIj/UhzG3FHAJUu7y87JDNAkgqEK22L4Yfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101991; c=relaxed/simple;
	bh=DpIUGqCdwO+OP79+su3mQjS3f7NTPvKaQtodb5LCDgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oQ83G2RnRUOhtJkedWE7DGoYpie9ojqOtaqcmQxfDJFSS/SJlKYs6irS9wSNcxxiihBzL4SIAlMsvL75lCc4nEFDuGdInch+JAmYu65G/0sZ+MM16AeLPOzK0eTatSZR4LpgtqrdGioq1HQKuoYh8b0c59VQhvDQjzfPDamrSfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kFAFHpSt; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kFAFHpSt"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so5187057f8f.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 07:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781101988; x=1781706788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8L5FLXq5yqg+LlkXkmbsIe+Frlyt4shC5UvlQEuVHc0=;
        b=kFAFHpSteMecdBM9RfcnTTMMBJAey/YGmMMR1lyxAXWv6DRE+Qh7dtQj/RDBcE3Gvn
         IVcsrPnO7cwYnxQpo5Z8qQi/bQZBfpMQLh8TzbR2i7890htnuHdUfV1Oue3q7LLIYpDW
         069LsjnqIiMu6zHNlS+RDOMbpNatSSR3LQ9ftxJvMr0wI+jFpPSGnTFvaQnw34q7OwK4
         AACP1qd6vvx5P6Cy/c5REP79VEEugRHUuYXNe6HIzD9d1leQM1JoAwEN9ZNFHy7WvXMO
         x0INOifNHh/ntelN/D4HbhaesvlBbxkRDDBvpQ6lYR4hofs2yYcss/qxjtFwhY/FZYpj
         FeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101988; x=1781706788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8L5FLXq5yqg+LlkXkmbsIe+Frlyt4shC5UvlQEuVHc0=;
        b=bsGWQ+tMRAA/E1is8rS6Gd3uIzNZj7dxWYzA536yaoU6F1cliLw73FqsRbZM2TI93z
         nIwhETnG35Xr09upIr4ITLEASUzIpFR/ZWGEOoDqcPyejs61U2Y09g+uP1HDy5VRC2V+
         zcZk8hRby7yab4+2lgekDMnjAL4nQ8/fKh3+9+J5mWbzRXEzWCwlflgm+GCxqQSXQWoH
         lX7M+NomGgHp8Sjk6JNYsDcW8Vw2uaL4FBzPz6CbxAHpFtJDlyWBxHKsYSby2FcAxHdK
         benFCI73u/Sqi/D65ORsDXGAAUenrCzxqBWbXHxj6OC6luvbvetHXecXOv328+JBhEFa
         PmWQ==
X-Gm-Message-State: AOJu0Yx6uIU58m2r8gOv3Qo/WwfqhN13hWkZ9ENtk11mmTn6YAYCyg5T
	1BefTTJhGXgyQoPrsdougCVVxJruZcM+orOaBerJR/2JrJPT7te/vKQCZ4c2MJvPIZ8=
X-Gm-Gg: Acq92OHRsesTt5ODR+7dD4qFGnjjvx/6SChA7LshjFfQm2jBsthfWkUToxXxufHi8Cl
	iHIDA30NvmGaqt3XojNpgTah5eKPUA8qe8F7X7Jb2TByXSE13Z7BAy1+ZWXZBNpcOfgGgLsT/eN
	ruNRMOfRftvTcPH+urXr5qjDYQOkRsayLaVFd3tkSWOs9EmykAtX/PTgqRAfalfs6MGJ9Y1cHGP
	BSxoS/RZASf+swBVhCzPhmFfNRM0H7fnxB6tpL7+u4GiLvAHV0KPbhYVXKeaFuvpURKnN6kDLX6
	s31iU47s2QGDkRo9av4G+fc5aNjVyrFXt91uFfLwbVAnZP7IoF49E8OVEpXrAxh7BPhKrp1LaiN
	xIMiWaQ1uzt5dpJSuaYAMCshYEF/b7S9Dli9aEbSd8QYx3QxVAG2lrKk76CGWeq8BJ+AmAH8X2M
	vZmP7PCqeANbM+pclhbbxmmnr2h8bc/IqDYNCLTWFW4X2bZxp5/r9kQXkjkNAo4Kq4zzUw6OGOq
	n3al4AkPm7zMMf6cZG7G4ZLZ3zgHRFSsBVl
X-Received: by 2002:a05:600c:5246:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490c25ff39amr402685145e9.27.1781101987829;
        Wed, 10 Jun 2026 07:33:07 -0700 (PDT)
Received: from localhost (p200300f65f47db046aec8c3a4b621e71.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6aec:8c3a:4b62:1e71])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc3b5b06sm515421755e9.3.2026.06.10.07.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:33:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] platform/x86: apple-gmux: Drop unused assignment of pnp_device_id driver data
Date: Wed, 10 Jun 2026 16:32:59 +0200
Message-ID:  <dd6e70d3075205a1d5c1fa324db7a822f37e2349.1781101905.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=DpIUGqCdwO+OP79+su3mQjS3f7NTPvKaQtodb5LCDgQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqKXWbDgH743hPFtHCKcjEZllELCt/90Z3SnKZ9 EQhkjdDUDKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCail1mwAKCRCPgPtYfRL+ TnFECACgDTtHBn38iKChZnJx9WeG8YxZzCPR6X+rdL2DPFhYeH2etCuw8+4b2Gw99FeeDRTtqkO WGGwrq5rSD2auJO4rs4CU6divJbBNCUgEgURvyGZi4NB32p1f7q9YV5MpaTrEd0nMWyi2Go9C6X cBpA5ug5z4DLZjhjmALpuYNu1TnVkkOvybJPjtHrIMyocXFxq2ngGRGtnpzhkgAYbcLgOvUIt5c 8WnOCpyl1bgBAG8z7i6IaOv5VolhkWXE8GKdFDlJe+YVkvUKh/85NJDMDMkhawTbpsYQR+mTlp2 PqeT03ySSOKvTPzgRPfhzJdlRcfd9CBsSGI9RIQhjcEgh1q5
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
pnp_device_id to zero without relying on that value. Drop these unused
assignments.

While touching this array use a named initializer for .id for improved
readability and simplify the list terminator.

This patch doesn't modify the compiled array, only its representation in
source form benefits. The former was confirmed with an x86 build.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

I intend to change struct pnp_device_id and for that it's required that
.driver_data is not assigned using a list initializer. Instead of
converting it to a named initializer, drop the assignment as the value
is unused. So this is both a cleanup and a preparation for a later patch
series.

See
https://lore.kernel.org/all/cover.1779878004.git.u.kleine-koenig@baylibre.com/
for a more verbose description on the mentioned change to struct
pnp_device_id (though this is about platform_device_id, but the idea
here is the same).

Best regards
Uwe

 drivers/platform/x86/apple-gmux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index fbc30f1f8abd..9c728ac4e045 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -1013,8 +1013,8 @@ static void gmux_remove(struct pnp_dev *pnp)
 }
 
 static const struct pnp_device_id gmux_device_ids[] = {
-	{GMUX_ACPI_HID, 0},
-	{"", 0}
+	{ .id = GMUX_ACPI_HID },
+	{ }
 };
 
 static const struct dev_pm_ops gmux_dev_pm_ops = {

base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
-- 
2.47.3

