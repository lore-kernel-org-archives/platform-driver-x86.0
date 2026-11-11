Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406431;
	b=h8+UYzNhTko127ZMYEik9Xxcu0/hGly0bqzXH50A+dt27Z2AJ6X+47lR+9jdAjqsxbRQ
	 BKPg9vPz5cGL+N9zL/8biKkLz4fQ2jGM/fkV3TqbkeuhSwF96i60Eu/+6f/1WPjseQLLk
	 8Hot4HLjfSBgnp6vgDn1mRcTr3alm9DmiBIELDJxOZRsuPv0pqgExVeLGHyMY/gtWoTZp
	 Onx1JZwSaSc47FixROL5BFk1wvkMMekDKbKhbsFWrVoDQLap2Itg1A54qO1+//ysCfKYJ
	 at6NPdLLTrkEziFiIRWlFIvA/sO8til/7LonDXUzLwiHYOTugflRNUDEcsqUTNYOkAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lm9VncPkpHuUMf6V3GLKH7/yLlzBilRZyjcQhAoy+ig=;
	b=Wauh2n4nsFPXCBhNHuTlFByQqP/Sp+uolulB0FltUusv/WiCO3/hUYyOtK1RZ6lr0oRN
	 hTlo8tGtd207tdKIKy++vEqaL38/SJXbkdObH6abx4L8RdHD2MnI9w3HHsUloCsrs5KFD
	 6yatDmeM74QOR9scQ6TnIIeqlf7nVDdhIijyhZalNAnHS7vHOMYHFazUBdglEghaPibmL
	 euVzVgDrPs0RizAcJMpyVvpZA9V5BdfwAmF/7mmD2aAy9DP/S2UxbagyVzLybU1tubgef
	 L1yEmx01GTn/2k484sCZMZ2z0fgvG2W63sq0GSSQpmahhM43dmBMxKFYw5pt7hOWvNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u84WoHx2;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071A860A2626
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 14:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 071A860A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u84WoHx2
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1644295a91.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 06:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406430; x=1795011230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lm9VncPkpHuUMf6V3GLKH7/yLlzBilRZyjcQhAoy+ig=;
        b=u84WoHx2LFq6Ko6RxBMcr8AnLKz8YdHDcEN0t8eXbMbrIVAJgBnObGJBAxzM996pLG
         Js/KJAv7mqeBtKSPRK5EDC80VInTmYFpLadRyUDiJXJo2FC2kXkBVNToYTwdSVZWHFXk
         SEc97FjnIwuXhkYZ3OgCeqyTCRIgrvRrYd0YvS71dVLgNUTDOI0ivwvnWe48PJXGZb2q
         rF7uaXrmrG0m4Too5ZpxKs4V/3ZyH0IqHosBODsNlI1WjuyyeRkD3sIT9Wq4HFJUlYDn
         7In835f4rUP2/7wz2n8M7zSMjOAICgzFm29xdH3uDHn4StSwJhlx+cIeYEMwcAwhv0Bw
         +ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406430; x=1795011230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lm9VncPkpHuUMf6V3GLKH7/yLlzBilRZyjcQhAoy+ig=;
        b=P7QTsONEjWdVb4NlHPE/Y7KoKAJA6Gff40EdioFNPQ7he7VYjVbl5zO9Pr2HTHrqBz
         KrKExDPlR0/Qt4H2aVrbVdd2MYcgaAvTqz0160tMZGaSy0x9j6LZqkzqB8HjNvlsGAjK
         xhYgmQpN6I465tWdEPEH5QIm15hwwcbgp3dVSHuukQdCpe9IjNDFPmVXj0eOnnuTB6Pa
         rd1gIimCY1CKwDDBprYnWa4lqth/zSI8Knt4QHiflmOol6Mb+ERxtvW4lj0t7bgl+ciw
         Dm22buwLmuTqV51QzQhjrYX3A2uWO9q2/YgKKG+YbsEGzIk87i7jkZdBimMbWvUgTvl1
         9kiQ==
X-Forwarded-Encrypted: i=1; AL+hErEVtbY8K7XXzlB9zOplcTFIbBI5zv0ATdwFo6dVVDbMUDY7HFD+ANfNH2tBg1jMR4CbWT8Yd3jaAG14TqLUxqJdIYRi@vger.kernel.org
X-Gm-Message-State: APuU4Z9IeloXO5FodvfXTo/OqOcbkZgYpdqxCaxdP20my9zz8e60OOdq
	FdSd52OusQRP4h1LQvPBhZFC2z8S6wuH66Hbu9Ao8rVjjs3L5M8ITgWp
X-Gm-Gg: AYBFou3fWIEW6v8tbejUfml5tuUi5AAgrhmo2VS0u7WBv7P6+CY+my2Ex9R9dwIFm5z
	61BdjvJt3mmILgR2htCzJHOkovD5KSv35ZbdIohfMQq16+5xm5Y9j527qusaoqez/95+Yi9SLsj
	acguHGPjGvPZTUdDofGG+w0jVa9QN9r73Qd2cqIDFLLfOTfNfJ5eeYDqE6byy6pULlo5H+yJl/4
	vmjlFAUBQbIo1CxAkOif/+Dzhz21TlK3Mmp71V+2ANmF/lY03jkofxAc8D4/QE3EYUMGSvqya47
	ZcsTNpE3c0s7awDHEyu6Z9x2Kf41gOawY/Ma1UvUu9u7FFePVeq4/NeqMIgcxHQop3JafbcLWsW
	bcrCTpGZKWdIevTwGJLk8yfZbDlgMpDCi6MnhH/bVIb9uaDcLEy4kyMP65VUvwx6f/A0PJCH6rE
	wQPCn1ANIL//T+mngl0g1OTdSK9xe7PveqS8elF1exb5pNY3fegQJi0VUt/NArjNSkTEpXQwBom
	2j2cmSNLH08cl27ntvNY394Ep1HRpdh+UsY6rQPtlbrOZzpPo1LzwOdkzL3assfTFgDna9nkh0+
	Pns=
X-Received: by 2002:a17:90b:3bc3:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b1830046f3mr2991563a91.54.1794406430379;
        Wed, 11 Nov 2026 06:13:50 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm4789970a91.6.2026.11.11.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:49 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	okluar <okluar@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v16 6/6] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Wed, 11 Nov 2026 22:12:26 +0800
Message-ID: <20261111141226.9482-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111141226.9482-1-qby140326@gmail.com>
References: <20261111141226.9482-1-qby140326@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Bitland laptops, performance profiles require an external power
supply. If the system enters suspend in a performance profile and the AC
adapter is unplugged while the machine is asleep, laptop_profile_set()
fails with -EOPNOTSUPP during resume when attempting to re-apply
saved_profile.

Returning an error from the resume callback simply because the power
cable was removed during sleep is undesirable, as the device is
otherwise
fully functional.

Gracefully handle this condition by falling back to
PLATFORM_PROFILE_BALANCED
whenever restoring the saved profile returns -EOPNOTSUPP. Update
saved_profile accordingly and notify user space via
platform_profile_notify() so daemons such as power-profiles-daemon stay
in sync with the actual hardware state.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index d9678b979620..517bc241cdef 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -392,13 +392,27 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
+	ret = laptop_profile_set(dev, data->saved_profile);
+
+	if (ret == -EOPNOTSUPP && data->saved_profile != PLATFORM_PROFILE_BALANCED) {
+		dev_dbg(dev, "Cannot restore profile %d (likely on battery), falling back to balanced\n",
+			data->saved_profile);
+
+		ret = laptop_profile_set(dev, PLATFORM_PROFILE_BALANCED);
+		if (!ret) {
+			data->saved_profile = PLATFORM_PROFILE_BALANCED;
+			platform_profile_notify(data->pp_dev);
+		}
+	}
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

