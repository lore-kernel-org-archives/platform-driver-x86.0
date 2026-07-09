Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B53E38F255
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616361; cv=none; b=FyhdN5mdi9SxxOChok7AL1nnpG62d9/BN2HspUHTUWNqdUMuqpJoWJoMHyzTpcFR8CdHy0HwhglKzs/PHj08Gyy5UIMiFOmOKdr195Lk4mgRkpuDhdiXEi3yHcDIxB+22D2mVSGqJrEoI+SRZJwirpDRDK3tI/u/l6lArVq4Ycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616361; c=relaxed/simple;
	bh=pGq6Ho7akFAbOMMkEMP4bgv7HVaDVNSGjgc1WcBOf1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5P4DiAJODd21Hy5u9ZCsu2VsQgpj0rLBAlTed9KnC1y2FNTIOQuEVe5lK/UpgN49avyayWkYzIlsea/uoTnxdS3v4OOuQZmXAUbbVGpAcZOdGRUCMYlU1BMlSxZC+4blwbLapZlaBUr8lvmkwba1ifAyBeda641Od3PuSHjS+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/VFXBqu; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/VFXBqu"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698b558a792so32598a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 09:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783616359; x=1784221159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FcqmO2qOzufGvSZVtWMC1+200YXwxI3/0WI8kXhX1g4=;
        b=Z/VFXBquoOVgqI9jKhtNefNpdSQGrQyz2SVHh2E9pdylEA9OJFPOUTsg5e+A4XVOtR
         IZ7LTVmPXfnEZtGr8DLDEe4vUzntA6YEBN51zW/Y414/MgGltVlutgdJnv3qrhXkLukF
         JxBcHVLImUikKuQjaNgoOravmmsVoSrLKrW1bsiojCIlfPkvxhtrC65N968vEYjSeLdf
         fzjsNRJ/J7g7l+8vlEttIO7rN5oQ0FYxp20nzW9QUaZ+nSYu+3qa0of3NA3UTKkN+bu1
         Auc3/Ug8il6CEKus06AF3q+ikYa+iSu7bvCihZKs+6aGLPqOKlqt7aJhee4Zi2LtaLbl
         CBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616359; x=1784221159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FcqmO2qOzufGvSZVtWMC1+200YXwxI3/0WI8kXhX1g4=;
        b=i9rArNgtngmpg2wZG9e5aDaXadGGjHT/Z0K7hyXgmCaBpDZW9gJQPHrkELCZGEUDWO
         t0Rs35WBuC3sG7RvQsW038TQ/eRB1nVUMveJfv1tQLHc94rPT62ZQg3mBKjwvPtw6SMg
         Yz2uAkPz0VoiibD9IF4KdOGicv0FviOgooR1G/Z9UASw9w1aps/ycH886Sabye3HnVYw
         Oks2H2ZFXyw2EOMCozvfKrDHbX1mx9+jSmy6PydS6nwHmJYLze0EGoQOjt2iN+0zUKLR
         mZmV+ntCtI87pH4sH+3jgZuEmE3C1uvJus0Y88aPsGHCV57VI0BRftC+w10D3lTJ+VbS
         MckQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgnrourHrOyDot45uhnyJ1ziCW/ogXLGredlz7UEHhjvfDAtY3BIx2S4+jOGO+FaO6DZqcIFfkkW5jncwqh9m/lJaP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0rEYw8vLjMnZLBqsivMwNmCPcxsMVQ2bjhQ7FClNRohthwvq/
	xIw+ToSGGQfPMX5PrF7ImRJPEjBaIbMrldGv3cG5biI222BY2Aj0mfVT
X-Gm-Gg: AfdE7cnj8fDF2w/5QFfNujb+uP+5GRzQEfkdWZHkGs3yhNkewiszZ3fXAhkjBTsh+1/
	NnEkj9EN55uILEYs3oI5ZUsTurAZs+rdgwtLv/PNpjVWc0oFjMTkX9/iKczVWMFpn2NxSIMNVnh
	/xRrQb40DTyPzPLUgcSOufyetOy6jZurMwi8IgE/7mxxnimqF7T7Kt9WQE63HfpLS3MMnz7J1Id
	baM1m7k+rumqIavj2mlHLCSBOW/7ZvbjlBiH5UyXqbsqlVrgSEyep3PFy0DlRxxo0jcgsuSA6OK
	RpMIdqzeLO9yAOcLjmDLHSdm+1PKZIZMszLm45bPMQcVMjET9/mj8ixx1nzbK90/5EAdMbsJwqj
	1vzLtRI2H6rJVP5ranbVHqZMUQddFeKEHAxGd8X9u35uczUEv/9nt0fL69uojv+SDejNRBkWDwh
	iAPpo8bDMl1nEhTzhduGMPr9Mrf308SsTShPz57ZUoKBmEsoIJ+cOuWUngtXS7PV8=
X-Received: by 2002:a17:907:d15:b0:c15:9350:dfa6 with SMTP id a640c23a62f3a-c15ce21e09dmr319755066b.60.1783616358766;
        Thu, 09 Jul 2026 09:59:18 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c79f2a3fsm329902666b.49.2026.07.09.09.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:59:18 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v5 4/4] platform/x86: hp-bioscfg: warn on element type mismatch instead of failing
Date: Thu,  9 Jul 2026 21:58:59 +0500
Message-ID: <20260709165900.30615-5-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709165900.30615-1-meatuni001@gmail.com>
References: <20260709165900.30615-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_populate_enumeration_elements_from_package() returns -EIO and aborts
enumeration of the entire attribute when any single element has an
unexpected ACPI type. This is observed on HP EliteBook 840 G2 when the
BIOS returns malformed ACPI data following a failed WMI query:

  ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x000000032)
    is beyond end of object (length 0x32)
  ACPI Error: Aborting method \_SB.WMID.WQBE due to previous error
  Error expected type 2 for elem 13, but got type 1 instead
  hp_bioscfg: Returned error 0x3,
    "Invalid command value/Feature not supported"

Aborting immediately discards the attribute entirely.

Warn about the unexpected element type, free the temporary string, skip
the offending element, and continue parsing the remaining package
instead of failing the whole attribute.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index de156a9f88a18..21077d17113b9 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -163,10 +163,11 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 
 		/* Check that both expected and read object type match */
 		if (expected_enum_types[eloc] != enum_obj[elem].type) {
-			pr_err("Error expected type %d for elem %d, but got type %d instead\n",
-			       expected_enum_types[eloc], elem, enum_obj[elem].type);
+			pr_warn("Unexpected element type at elem %d: expected %d, got %d, skipping\n",
+				elem, expected_enum_types[eloc], enum_obj[elem].type);
 			kfree(str_value);
-			return -EIO;
+			str_value = NULL;
+			continue;
 		}
 
 		/* Assign appropriate element value to corresponding field */
-- 
2.55.0

