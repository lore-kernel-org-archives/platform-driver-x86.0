Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182333;
	b=vXJeOwDb5fs1Jr42eakoJBRdt+NygXSDxa0vceo5U0Wm5vDd3JyutLl1M0nk82mWWWhV
	 c9YOWS4Eh323F7uPZfuc451ZVsDCwN0bIv9pCdrQxQ8GGT8wh1IeQEdy588zKqsBff4TN
	 aMGqQgis8tgyFaN7lxVnewBV0h+8BDhdyCMREW9X660qPi7k+FRtZY28YrTAIQcvDKtUY
	 a+7FLiErgu1Crqbc3LbiF2tf2NH1HGBEk6cyGtwXzmrXNpX6Vmkwwoo84cRyeYfnf3Azf
	 zSSBUvclP/4MQpvToYFeLgtlhQiPGfm5CMxnTtXHCpvb5qZnkeQrm43CiDYjysT5vDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182333;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=nR/02VFMcgrMjmbzn5FYaYYKV0nuWEnm28BMLnre6NU=;
	b=M3/1IperqdsSwbUJC7mcYhJozTAJE5E5xv8BUtiuW3zM+KI8Z5quHPWgEvT/XoNSNd0k
	 /ALGCMYXszgWZq23t+d74yn5UB961K1ZLF3UaYq7jFHCTywbY/3tm4Mn/jVwfnPJLVxvZ
	 lqq0WfhQNQEp71D8vx7sHZRIcm8YeBL3vTQio45Eo12FjbkBie5Ey1mXkXszKLS/7an47
	 u6dHQi9tFShrpuBLMEEUQnZCnch5LdOBcN61HzO5i+gKzMdE7+Hg3MxUrcCiU2D8V0I5o
	 kI9RRj5EQ1DP/PpAxJ6NaOA8y+OQ3AWe4XAceJ2JPxFvr8LPxaRenkdvJmzZMBvOyHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LxXkbBHJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F35606A330
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LxXkbBHJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187171F000C0;
	Fri, 20 Nov 2026 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795182332;
	bh=nR/02VFMcgrMjmbzn5FYaYYKV0nuWEnm28BMLnre6NU=;
	h=From:To:Cc:Subject:Date;
	b=LxXkbBHJm9HsCSRhfLQLnzPAApTP/s2G6PkpSWh3HjWP3RydWjAyg+jE3XnAlg+mi
	 OY+9STBoomqENr27Xvi+275RP9/04z5awMsvPoM+XRZzTPrVqkrt/HjrnMLvZ39xmI
	 v6IM56npIYiKrYOchkovnGh51MNJkJKv4oU5hO6dE4xHMZCacVPogN89JONCA4AX+E
	 FnhC1AchDaalz8Sb0ab51X3jMcUJ+rzAuqGKYSF4ETH7d252Ep/Pg4jHdOEIf6pHp0
	 FHrpIzkIzBPDVR/yg3ajlLSx/aY6mAuPjDQCtB6XN9jb95D36nyo2wLBin9JAAAFD/
	 jcCy1qh7j2uxw==
From: Thorsten Blum <blum@kernel.org>
To: Mattia Dongili <malattia@linux.it>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthew Garrett <mjg@redhat.com>
Cc: Thorsten Blum <blum@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: sony-laptop: Preserve defaults for empty brightness tables
Date: Fri, 20 Nov 2026 14:45:26 +0100
Message-ID: <20261120134525.823067-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; i=blum@kernel.org; h=from:subject; bh=D83bXUfynQ9udOas7SqVEnXJEZ4WuMM3boqmIJzsd0k=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDNkMfl8vrb7FpB6Rpvslw07j+QLVk5p1W4zveDLf1+L8q frkHKNeRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEwk9DPDP/OoiJWCel/mLdE/ qtj2YNLT7hShSrZFJsIXn7IG3avmqGJkWC06oaGwVfIrl61+oe2GxVuT5Y54LOQ0m/0mTuHMser r7AA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

If the brightness table returned by the SN06 ACPI method is empty or its
first entry is zero, sony_nc_backlight_ng_read_limits() overwrites
->offset and ->maxlvl with min = 255 and max = 0, respectively, which
results in an invalid max_brightness of -255.

Return before updating ->offset and ->maxlvl if min > max to preserve
the default values (0 and 255) and to avoid a negative max_brightness.

Fixes: 62d2f23e8bce ("[PATCH] sony-laptop: limit brightness range to DSDT provided ones")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Found by code inspection but not reproduced on hardware.

 drivers/platform/x86/sony-laptop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 0bf4d3054e37..5d2f91f140f2 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -3076,6 +3076,9 @@ static void sony_nc_backlight_ng_read_limits(int handle,
 		if (buffer[i] < min)
 			min = buffer[i];
 	}
+
+	if (min > max)
+		return;
 	props->offset = min;
 	props->maxlvl = max;
 	dprintk("Brightness levels: min=%d max=%d\n", props->offset,
