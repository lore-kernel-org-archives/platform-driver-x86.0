Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0CA3F4101
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743566; cv=none; b=PE25/LYKVQ4Kl/7KkdtozYi7eYXbqqmtdGpAyX2wS4JgDPYDyxoAgGq96KK1LFYXwLmDbh4HTLNU1r7aXl+AxrRygmxe+nqi5zN1hPzc+zEeo5ZHrQrfo3LMUnfwyJD2xzmbly3QcB5NFUtkKEYno65eNLt/CNMdEeFrorYF5T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743566; c=relaxed/simple;
	bh=eEgpaClffVrKnbl8QivNz86iFYVr5r5dBokF6FDLlLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOlEYR6mJ75spVblBbySz0TEvoN0rN/lwXgx7xI7W2+Pw+x9gmR0JJBisWjZljSO6REwCY77kEQorVMKR4MywINuEi3RrWLFeCGVZgW6JbX6T1o7mw8mfNJO+hQJ1ZiaBo68gHiIBAIJQXlTb7l1ZnwtRXwg8mLF/liUtSnOHoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQ8lKO3m; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQ8lKO3m"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fde295992so646196f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 04:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787743563; x=1788348363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYiYddQzsC9fBru2MSOJ2EoKWlTSTEPRQUEf7Ju5SIo=;
        b=IQ8lKO3mEQyq3prJ+7JZgcMTNXv6i/RJeXHFf59F54k0A7X5FLlfh2oTw3YXfW4I3d
         qy4KUuAiPc0HafG2bp7acFMYw6bmxn2ZChk+SBEgPXvo2bG3WloGRbE52JPFeLv3VN2A
         i4y7H1D6oLOc+sFoK9FM894c7riuO2BitrPdVDD2Zugb8n8ZvnpjBjZ8Ftt6UK7t5kZr
         ToGZCdn8cFxSnzvUVBpRMuqcmC+AN03/rU2DEM2Uh5d03KkLxgUialTcRbmqzJ8B3HWl
         ZauD9u3XfXQrRxvc/8ex6ZwRn2q+iuRln48TE/ZqBLuRHgAkpkLI9klYGkPZzB4zOKG5
         I2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743563; x=1788348363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NYiYddQzsC9fBru2MSOJ2EoKWlTSTEPRQUEf7Ju5SIo=;
        b=LfH30CXNY/+CXbtQP0vb1EIq1Yu6tTfp1Hfc8T+bNf/AskgG2JtYcJYEzX0vWnJzqp
         7u2KKTZJiQRejQKmns3zXYTQxp1GP/v/aA5znDtMvS8MKabLZjlFvScvZlWdpQXPQ4Xv
         KiVg85rJwhuQUWWXq42qzaBjls0h0OZJRuq9TkqFPl0ziKiyBPXl0D/ZVKqbP2x0nnJI
         1ffAZMIrKJdzQtUH5813eCHu2ebHvtCWW7cK/B6zyl3nmB57Nw1y/Y6ONYytsyOftFJL
         0ARwMBOjyrdQM2xH5xPtC5ZqPp9/udGVehgp4LbmLSOv4JLpNRp4Qw2v+4hf4BLK9yWM
         uDVw==
X-Forwarded-Encrypted: i=1; AHgh+RqtQczCzNYYvlMoFe2lt4ziIqtvZxNbrzTh/B1/hiWF4P/I6pmF1V4swYWQ3Yl9xGE4OK6vigKD4BaI+cJc5gOGPeTt@vger.kernel.org
X-Gm-Message-State: AFuF++mkDb/eAWNm+Q2bwJ8jkRaer6Ze3ti95TYu7n8FhPbQBu7ykNxK
	m5rXQ9AuSiULB5AgN2Y1xBvvbKYCDyPrcYyviG21n5qz+/RnNSkJVtnV
X-Gm-Gg: AR+sD10GiQAyb7zJFMt13PrBLy3xkGznJAHKeLEQDRjQUwlSvhd0GdAiC4DWWQ3o2Rd
	qanJNexvB52G5kTos9nd9M/U4lyiBhmKGD4sS36eGGTaHU6kIVQha/Fgpmsm1QgWVESSgYyRLkC
	pz8O7wgcZzPLDj7vk/MdIvhkSuctJmANt9YUFjsWKX2GxL7cyj16Fkp3NBQi674dte7Bec5Jdui
	JbRBhYN5/QFHZ7+RK/R6HUFIa/eez9DnY+HLIC5BVJJqPk8IvDCYHT9VAMk2Og+c0+S8QMwxFJP
	ZifidQ+hv/+ohykxYquT9TZbKe7OncFfXUN1oEq1ViBcOnUj5bRQkZGJ8eKVlqK43vxT2rvmGXl
	xCoO1J0Hd0pCPTMRIQHyvR0OTKOPhU2Ix+1+kKxnlhpLXTjI/iKE6VkiEGvvc9X8Go4r+YBKRud
	ZTCTyVu1ZCdA+Y5Tn24Tj18SLYBuMOmo/gUhIFGMBriLeA0qygMxXIfaCB
X-Received: by 2002:a05:6000:610:b0:47f:e7f7:370f with SMTP id ffacd0b85a97d-482d9960f57mr15661034f8f.10.1787743562429;
        Wed, 26 Aug 2026 04:26:02 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:6b23:b1a3:f913:3d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6119sm2442098f8f.34.2026.08.26.04.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:26:02 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v8 2/6] platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop counters
Date: Wed, 26 Aug 2026 13:24:47 +0200
Message-ID: <20260826112452.13539-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826112452.13539-1-tchatard@gmail.com>
References: <20260826112452.13539-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO lookup table loops in the probe and remove paths iterate up to
board_data->n_gpiod_lookups, which is unsigned int. Use unsigned int for
the loop counters to match and avoid a signed/unsigned comparison.

No functional change.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..828ae208e 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -150,7 +150,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	int n_consumers;
 	int device_type;
 	int ret;
-	int i;
+	unsigned int i;
 
 	if (!adev)
 		return -ENODEV;
@@ -233,7 +233,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 static void skl_int3472_tps68470_remove(struct i2c_client *client)
 {
 	const struct int3472_tps68470_board_data *board_data;
-	int i;
+	unsigned int i;
 
 	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 	if (board_data) {
-- 
2.53.0

