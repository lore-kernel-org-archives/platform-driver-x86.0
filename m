Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648303;
	b=JJR2ACLgoriwVscJiio6bGeKHqSM91UzVfWXcEXhEQs7Q9HIoDr6q4+415HUiNPiGodt
	 5jAm4lPVd4d6+HpDUlLqG8efKmJcZa9vAdwl6Nxc5gvUfpVXdlQui65jUpAFtWmkBQxDT
	 AfkJnMpSukMHT7O9kDUGrJ5BXkvdfudZ5Z3W83KJP2Fi8QpvDpq/qUoadHfHyDyML05QN
	 NEAj17iwoUCavPcKK04u1I720lSjVwJYeUuSg9T8/5GXMn0gO7dxZ/p7C4L8+GA1S7VJm
	 QG3zDvb7UodV120qI/DA3gonB5cVietFAlIEsKS3q2+862zmu4WO6EMts0Irg8ISEeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=QpYNJ549fdADTammIXtO9Dh/diEXsHFrpOZSN7ztXJM=;
	b=XfvHLyzlebG2+SA22xh9Rn1wmbhrmCA+GQdOHBdTOrc5Rh1uKVR/HDOFKozu0sbTgti6
	 2D9AsLugxLLuiKXsdn2OgFHlmwZGa+9fxnGQfZEGcavAnipWyr+yLzyhBFBmkZn8OQrHO
	 gNWEOXdy73tpOJWECDiuRTPKle6gni1/Ct93WEs3xB7+uzgiVw5blgrSrvd8ghBEy8XkJ
	 3+24n8e6v+OIsvzF3ERvktvN8oD/PUPr87p5Eq7NQ/VDiBGQV7QKCOKh/VUwV1cyLSx0j
	 X6dyoIm0NdFQ7KE12NDa3eIrwRIL72+hi8C2oCCUvWfp5h5jRtFwCNhPWVOCaT43b8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKdcU70H;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10CE606A684
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A10CE606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKdcU70H
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385c497bf94so4051803eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648302; x=1796253102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpYNJ549fdADTammIXtO9Dh/diEXsHFrpOZSN7ztXJM=;
        b=MKdcU70Hbeyrbz4m6ifJxxgfGyivclLBcaeiSI/5fg4Rz8alar9D0opUBIUXxmXrAm
         wECPBC30/ZEPFQj2N/nYXvMToTXNJU7gRkCtN8c8HfPj2PdDkMeXMy37LJC6kKuL4sHE
         /Wp0NXWhn9U2FMyS1SmTlXydf/YJs2d22AcE9+cQ9HSjG/VzaB8tOZ50ouVKwDx55S9h
         jg1BRArw7hzsstUUT9yJszG9PAjcbMvs0cC+5xzX7/w2EEcRMEX/30TKCABa41C+u16K
         TA+tx9wriIv0bO7zOSVnMnYQuOO+2gniQ6SAWd8dXcgUxXsyel3TbI72DqsGLQOSZOZU
         ++gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648302; x=1796253102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpYNJ549fdADTammIXtO9Dh/diEXsHFrpOZSN7ztXJM=;
        b=EdCpQhwFNfGK11PXcH5DPl/LMocV6EOeM695m1Ag4pQRTPxFwY7PZo7M7Qx0019a+7
         sc2P+7FvqLeIsTFbNcyYxdwgzmFjnhnFKtjtorIpovruDtjbOH8oB+tQKTLsdBZd/2oZ
         ELyZPpVYzBLjSTr4tlyIluKXfW4t1bgH9fXwNB1rZ3Gf2XjtS7VprkxcoV6uyb4DP3p1
         7xzwaJjagF+wLGdRSXTGk5bqRdDLLgdFPaa+x7BWVM1qy424EGGD0WrwyQTg4nfPqXhO
         8bI2AeZumy00LHZJAANQ08MFS5MvAftXKUkj6fcraVdEn6lqUinAx7yDB+R8hoM4Q3z2
         rtHw==
X-Gm-Message-State: APuU4Z+yb4elLkgxt0AbZS0VtylYb2lPLIHKhjxtZ3NqV5F64rhqv7Z2
	GW2gv4tVDqP0W/wZB7e9TgZ4xET8qpZKimCHlVXpSKTEX7vD6KDv3qk9
X-Gm-Gg: AZFdTZcz0/2VCuQxBNegV9tzKYUfSnN3B+8cuAo6uS45jhLN52kVeKT3dat19UAG4P8
	zgJtZbpkLiotmmTuZ/NFTxyaIuoadna5q6jCSVVpvV0MiBcmRikErIqlN0u0cwsrc7dRpOruh0F
	v8t/6RheGMIVHokTY+rZjYc3tj/Xi8ri9lfTj0G4h06QHoAb1FprhXLsayRXKAWVZIMpVa4ei+D
	7JVUsUAVUpZoP/n93MiuFdasSVmj+IkISetlGt2arTx1Zf6ESmMRIVW5EBrWE9r2no7ZJ1S/vQJ
	OJ53ZPXKFCmMXjN4Yk5BdDMwbms1skQOTtT89PXy71oed1eiGXFf1bZFQAcJtbwenEFEirvoe8T
	Tp2Dm8H7G+5xMj9HrZx6oR7syFBXu4y4LJogDx9moRF/GaL2+loiOBhe6y4hEHc5cT7R0HGelEC
	q4Y7mUKcyV2keRLCYwgzuzYW4jLeRN+sh9iFUUnFU1xiJgHR+7SdZCfc/y/IbV7CEhsMqdwbFvi
	JGhiNwzZFNFtgqPlPQKPr3xCcNRwgQetYZQA8lZGHAJCtLi26bffPbesaZ5k3h+RiK/sw7vhXf7
	HPe3Lb72bK8xqdju+PAGXLyN4yVu+viJXpxP9Mjc/hPw4dCoxeOlVjiVPWTouWet2uHxkdjyJSA
	gwk4h4pNpmlmtptMrJA==
X-Received: by 2002:a05:7300:c00f:10b0:384:bc32:fe6b with SMTP id 5a478bee46e88-3856e63b194mr23394607eec.13.1795648301528;
        Wed, 25 Nov 2026 15:11:41 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:40 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:17 -0800
Subject: [PATCH 4/8] platform/x86: thinkpad_acpi: update polling state in
 hotkey_user_mask_set()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-4-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

hotkey_user_mask_set() is called from both hotkey_mask_store() (sysfs)
and hotkey_write() (/proc/acpi/ibm/hotkey), but only hotkey_mask_store()
called hotkey_poll_setup(true) afterwards. As a result, updating the
hotkey mask through /proc/acpi/ibm/hotkey did not start or stop the
NVRAM polling thread to match the new mask.

Move the hotkey_poll_setup(true) call into hotkey_user_mask_set(),
matching tpacpi_hotkey_driver_mask_set(), and drop the redundant #ifdef
guard from hotkey_mask_store().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index e5f78107bd1a..7a82a9014a3e 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2137,6 +2137,8 @@ static int hotkey_user_mask_set(const u32 mask)
 	/* Enable the available bits in hotkey_user_mask */
 	hotkey_user_mask = mask & (hotkey_acpi_mask | hotkey_source_mask);
 
+	hotkey_poll_setup(true);
+
 	return rc;
 }
 
@@ -2647,10 +2649,6 @@ static ssize_t hotkey_mask_store(struct device *dev,
 
 	res = hotkey_user_mask_set(t);
 
-#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-	hotkey_poll_setup(true);
-#endif
-
 	tpacpi_disclose_usertask("hotkey_mask", "set to 0x%08lx\n", t);
 
 	return (res) ? res : count;

-- 
2.56.1.839.g22a8290db9-goog

