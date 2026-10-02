Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98B14F93A4
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 16:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958850; cv=none; b=IPxV3Jw/i1SzkkzwcnbGO57FhyTFQLexacdR6BbF/0LQu4xUzdRt8cUfQuCEd+5hHleGLzH4oU9lDXQPvEHUjkTOgttMndWABH88rItn0zlw7rI4F9z/kh9UQJCSm9i9YmTtMPAztEju+FIk0ftjRoMkwPlwn0ThxhaK/jof8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958850; c=relaxed/simple;
	bh=AvUzFboM7H93fhwbAikzDlpbK4GBTjLvRdTsd/b65es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+TKR97/dIslSLcu//E6ZUYsWAg8AwCO2+Q9pG5WJulTIyomdAyoA3C0zkgxAztlZE7NKDhhROlZGNBM0riNrdXUXTE9tTCCemz/UyQsU7PqLmT1beTcpHnO7iSvoMzfkzHa2jduh16K39eLI4Aj8CLqK58SuVGZKzM19baq/bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CU+y/j1q; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CU+y/j1q"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88098dbba5fso1760038b3a.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 09:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958848; x=1791563648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USaPPC+zxnngb2fFx6SoqK5zosNs4HcXcnLieBdI/5o=;
        b=CU+y/j1qnwI2k/9ZHWMhTLClDyoqFqSkNRNJX1Dwipn2WarNVFZHUuG2KAc9IWa2k1
         IsiO9W/X1rs0wVcgStvZvPrlQL/d1iawRD3lkBqniFvQTb4vVrU6YjHr+4hhqnCx/0/N
         5gsKPaRsiIRNSO9Ox2wriLl8W3j1FdYdY/ingZdKuba/YmanFC5lEPz71QeKG135HxV7
         XWx/Gln4Y6PAYTaq+y8/vT/8PtR4T5UdOpAqDaRmTkieAPuDojt97Ev5Yf7PfyGatTIs
         94s46pL9CaLYmPhO0Lf8asuCP+4q1efMdfH83k9sVk/sw6ENWVjnaazJns75mEab5MpA
         DFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958848; x=1791563648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=USaPPC+zxnngb2fFx6SoqK5zosNs4HcXcnLieBdI/5o=;
        b=2B5P411Y+6Mqh8aCsmMQtPTn27AqiwnbR8sojpVUX7Hu1iuzGPUYhG+ZsXf5HqfNBA
         3zUULJYlmidCjAfGzJ9+eYznlkhy/OUP3ubgSklyMqbcsyHpaDzNvMclTuXsYsq1K4To
         Y/ewKN5ICEcONiH09TVXXd3LryiLXluQZ2XC3gu0CxZ4Ji65Cvg0Vx7rFFFb8Ry4kCLW
         jzZob6tRL2X3lARDD3MNGRYVgWXcjQNMNaoMYajqYvVS1izJGn2vUQ8vupd+gxaB4DaG
         1xfbMr9O9vEQ6XSvJ6CIXrNnytchTy1bqrAJ1Dl+eiKNWFjsVZWsM1mqadjloftE/bMg
         csLQ==
X-Gm-Message-State: AFuF++ktAnHFs/wljed292Ec1q1PXouUtXbXYavxeydNuPyqUx9B8CX6
	EF1OBYIajLgMb9HM+q8Pu1yunZyw9Na43FHIy8tqIIHgEyrK13aKZXAa
X-Gm-Gg: AYBFou0SDLOBqVdqbFr3JKc85URwUWre78SnfpFG62Donc9Y4+qsmKTq8bSetE5o398
	4ObC+idFVgdxoUh42DLjUSCIGPaO/8+6TIami8HrPn5zZ0nLe4zVyxzp71TFgxLPs3Prm8ERaKz
	R/fSeRPD/MxPj6XjM00YsTMpa5h/Dfo55F9gLI34fbDWWU+TWXXLPfXhie3WbqELI02BxYn7LyB
	cQSQeJmW7n6NemNtK2IcKxu5P7yceNg7k0+iFmguB+2Mchcb7Jt8qgjVXJ8EW/uZfWZcGmc98EH
	BNyk2FSH4i00KMbUJ/JakBE14ue2dKCgKgCKDRGI2jlFIGhLpp1XGLMMy5rCwpMwnnBkD8iS5G8
	jjArdsxMsZoWZoVlTq8gV4EAjtgxk4ysEtmIs6s5uQg9p2W05jOt9uq5RMTRKPwYfyO+jqgRuub
	rqjICRJSkHDj2ZSeIlyNIJmzPjYJyC94sejJValuknEsz2oNSmXcGh9euk3Yw5EHsgEPQ6kMuLa
	Bd5AQ==
X-Received: by 2002:a05:6a00:3cd2:b0:881:5d89:fb93 with SMTP id d2e1a72fcca58-88af5118716mr2310647b3a.15.1790958847835;
        Fri, 02 Oct 2026 09:34:07 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:07 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 3/9] platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop counters
Date: Fri,  2 Oct 2026 09:33:44 -0700
Message-ID: <20261002163350.1248431-4-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
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

Assisted-by: LLM
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a77ed32ab..35909a683 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -149,8 +149,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	struct regmap *regmap;
 	int n_consumers;
 	int device_type;
+	unsigned int i;
 	int ret;
-	int i;
 
 	if (!adev)
 		return -ENODEV;
@@ -234,7 +234,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 static void skl_int3472_tps68470_remove(struct i2c_client *client)
 {
 	const struct int3472_tps68470_board_data *board_data;
-	int i;
+	unsigned int i;
 
 	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 	if (board_data) {
-- 
2.53.0

