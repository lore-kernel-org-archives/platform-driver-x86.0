Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60C02D6629
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Nov 2025 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762448256; cv=none; b=CwMAkUYQhwMm8BYZFuatBf3EuQGnNki1RkzDvhJFN/lj/1jsjKKj8qMje8BKld9ZiUC6/RdUtGF4QUmrFPkKRnP3o2tNutfstJ1osEyR6GYV+4gWl8EobeVwI3mV8ORBLZXdxRUxgKYKSwSaOmCRnE8fbjzGob2oB/HWplichRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762448256; c=relaxed/simple;
	bh=hBDgCtgFgAJQ+dFgpCAhZa6Nwb6Otzu4vBYt89g6zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bdc6wJJfelWatPYGnMvaQXBExaifgKPCtcdIYxKTxBvJbztnAyUfbDJ0CXkizIiy40tHk4Nkei9jJdUzY249T8f2Ql4ycr3G2H/zznZkqkCLoyRO0Li7OLTJALBMalvEf6rkqkduQ2BZNRxXa5kyoYhqdpRv17SVyXvf8QEwxJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzBP2mjo; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzBP2mjo"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4283be7df63so651554f8f.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Nov 2025 08:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762448253; x=1763053053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43X08dmID9sHRRXmcYSgNQdluMQg9kQE7si7yBN+Lnw=;
        b=YzBP2mjoYJlN+ibY9A1ZN+YiX938uhrqDxm4UkvB4ICKAcjE0UBtG71OBZwOO0fm81
         /m9lJ6D+E71KXVUR0xltwsxwPu4mJyQmbUEYf9AEsKjBXe6UgyFqo+Jg0LIBoAV+7pCg
         VuRyfhqYcyeka3I8J3jzpyh6BfqfZHqbZ9VuoSZMpUrmUxgnYPkkCLk0MStmp68sU/ml
         BGvjaMSSOYzBvKauKDzAJW7h6kFgFte2SPVB5Fo3boQS9lnvLvJofxRG3eZFOkgnhY0q
         qD/6BzbXunpquYgnCyNSy2H3Es5ImYHkezlEDHdhwxTuACaS0QLwPLKuKHVt888rYW3X
         CItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448253; x=1763053053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43X08dmID9sHRRXmcYSgNQdluMQg9kQE7si7yBN+Lnw=;
        b=BVAw+MpgvSxUVaAXEs1swDBt278fVSkndlzlGvCITAnvvu6JC6cSWdANxYPLg624As
         EKrMpo+vSOpc5g7sw7+244MivO0z1qrH+X1bRsdgSJNrMceIRTt5xAZS+DY/G22PT6xr
         g7xlWf9qu9p6u+ZoK9usSYGGOVisqJrNKJvKpLZ0+QqrreNVFGzpPAtfLbtyH0K/bxh/
         1fox0kC6VOFypK/JaSyRfH+tAQ1GDOdAA8c3LAj9DQbtlCCYqdsHEOWZq2/9krToKYMf
         qlTu/ZC8dSdfT7NiRZUlp0NgrdaZFKAklh/xLOaQzzl91EUgJIk1f/7GotoBZcymPe20
         Werw==
X-Gm-Message-State: AOJu0Yx1qDaSH7HcpnlKzmKAOPXe6C6X4pSF8wsZ/fadAVtHDLkmVBWa
	fFHqGyjs2EMoKr/N9bWGkRfwsPaMLu5Y0I+QYh1BoolQkgKXnDvgGSzQ
X-Gm-Gg: ASbGncu5zbAqbl3NKhzISmNVBvli6Vc/YA6gnqRRe/fefk0QUpvrQ/+Ki6PgicwmZ+Z
	OZiir6rUwLYuiBwxvCks6yky24HkabXeE0nNK5tLBBoD41BaNj32prc7Xf/4g2Zlx1RXrKl8aZV
	/12UNu3wDfBSQGZHBPW0o5SR+TI0PguFijWulEteKHe2W88TqChXDf9/i8eoDxdGaPSc37u31Nk
	SYMgREyznmMAS2O2UdWgGmEd9MHleKixP6bpqCIhjUuVKaoivslvgsVKzU02tM2KWpk6SJ92pxt
	DO2utaG1FmmqqxktyKWqTxfIoIwr4Rk6Vv9cZWzGNkuOStJZEdLCvx90+Wigsk7J7F+uDXMM/Mr
	04z6UeBDQTnFkdKnhH4TcfOpmZNvcNKea3tPtwkprSU/5sXyo2L83lDtEDkVm8Y6foMcBDpWifb
	W1blAcDIrGv/Ze9dv9Qcg=
X-Google-Smtp-Source: AGHT+IFS3q2CQsG6hf1nqt/xuzgOKYXHnA+wB0Q9tXjzEjx/qrI7jVB+0ubmL/kqbQM56u/55k8zCg==
X-Received: by 2002:a05:6000:4013:b0:429:d3c9:b889 with SMTP id ffacd0b85a97d-429e32c81d5mr6488088f8f.1.1762448252844;
        Thu, 06 Nov 2025 08:57:32 -0800 (PST)
Received: from cachyos-x8664.ujaen.es ([150.214.100.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675cbefsm80306f8f.27.2025.11.06.08.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:57:32 -0800 (PST)
From: Marcos Vega <marcosmola2@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcos Vega <marcosmola2@gmail.com>
Subject: [PATCH v2] [PATCH v2] platform/x86: hp-wmi: Fixed Omen MAX 16-ah0xx board name
Date: Thu,  6 Nov 2025 17:56:57 +0100
Message-ID: <20251106165657.23241-1-marcosmola2@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <81699228-710c-144c-0909-1fe5be0604ca@linux.intel.com>
References: <81699228-710c-144c-0909-1fe5be0604ca@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

You are totally right, after more thorough testing, I realised I had made a mistake,
board 8D41 must only go on victus_s_thermal_profile_boards.

I send the correct commit in hopes to fix this.
This is my first time contributing to the kernel, ¡thank you for your patience!

Signed-off-by: Marcos Vega <marcosmola2@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8b3533d6ba09..7a3cad80f0b5 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -92,9 +92,10 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25"
 };
 
-/* DMI Board names of Victus 16-r1000 and Victus 16-s1000 laptops */
+/* DMI Board names of Victus 16-r1000 and Victus 16-s1000 laptops, as well
+   as some Omen boards using this profile */
 static const char * const victus_s_thermal_profile_boards[] = {
-	"8C99", "8C9C"
+	"8C99", "8C9C", "8D41"
 };
 
 enum hp_wmi_radio {
-- 
2.51.2

