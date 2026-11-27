Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748025;
	b=GWSk479iBhAv5+VBOA8s5oJssfMl+FI6sBJFRsgrKSH4gMxEqs9aqePKlWqapezwZYR2
	 6GGKHFLfuhWghZEzQX/ydWrFzMxTCuzRE0vPpzk4b1GiuUg4wUCsDVZMtpT8bHBr4+bFA
	 Xmfe2fkUMFS8e4jGX1mthIPWJVIdirEqx5+LFepW3M5+ERq/GUaBv4RBFrlXQXgsdplVl
	 0d3UGidHJTsem3K9jP+tXT8kuuWrkh5olfgkgsnMG75f4yypO7Y96I4Q5UlZkNY4jw1et
	 BEcC1iSbELPV3y3sNmC8NCwatKDhvEaVUzS+OhbhbnOPYF5ustcwFRyMtRFh4tHuEdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kIEYquLGrLx59Kpr6VlZaL3fgGAdFzJOpk+rvFhItik=;
	b=hbCN2vR9x6eeHSdDi+eQr9p74Hzkvc8rQ1jlFhrsDvAizDDxqloDm7PwrIHnaLUttN7F
	 bIfFgOefPgkBNJ1VNdHOJy5ciy8364+Q5feEQFOhjSOFgaWlLBRHbfk5OqWbPU/iWKDDR
	 S5DNkWAWmUvLR4Cfshn+nFTIVlyzEz88/Nz9FErqLWQ3fn0P0QM5d++jGEnP4YIPQfObh
	 jWp+fN5N7PEkZF9BGFe4eSIiQzDZfZgDfXIbQgnkkhD+GrMOMcqQz06sEEdx/v3ZvMb4v
	 boa1TXaCFCyUvMZG91oYcB2tOMgjE52plWbWyAVitcJkBQTMDEzxOdcyKlgWWgPJpjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=an0wXLNq;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649EB606A336
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 02:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649EB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=an0wXLNq
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38644aedba1so11263687eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 18:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748025; x=1796352825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIEYquLGrLx59Kpr6VlZaL3fgGAdFzJOpk+rvFhItik=;
        b=an0wXLNqmyWWggSf5AP1OqH1qG47Tkz67k+2nSHa6rgqm3L/544mzNiFdhjNf9zlNu
         aZRDhGDj6ghR+Z/ieuR+A1sPpgCfBj8sJKIor+qpuGLcrs8JJ9CG8uJvHtxSR1fRpDd+
         WTKVUcecjmbWfcflek6Ct+wE3f1TaGFte+j42RxSQwTm5mm7XALx/l5YWA1qtb2iN2zl
         g5sgbY9UIIrlhjFUuJ6UUU5rL4IPzre3cPr8qtTxs6MFnVIh7FQea3qQUePl4gbs+5Ss
         zqHFgKhT4Zre5j5radN1t1e26AYF0ab6jZ5HB6DJ5uvPBPHnORoJ19Ur92+CmVvBmz/t
         8HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748025; x=1796352825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIEYquLGrLx59Kpr6VlZaL3fgGAdFzJOpk+rvFhItik=;
        b=a1fB1Mdjx5wE1j25EgQFExdcb9q3JciNYehJsJMjMF5KKAdAeAGmu6kEYFZDH4Ef7+
         VDGHH+NJkV+aN6h+AcAKhJxFv5cTHDPBcJmLDPAYfne/Wcg2IEnZveY0f++2FrMkA0U7
         0Us4t7F2wdW21FP9wl0nFuivgPQ1aII94izSqTjXT1m/jM4v2A6l6pKMIT2QAbDodCuS
         pXS1owFJ+inC8Dr1ZJ+0xVbgDCJVPUtB90b57efSZePNQvMyOtB9cfv7FuShfgqtFTmq
         lWCyvvM4VQxVjnA9FnUj08Gvmth2P665kFxerS9MYhKy8/Zi/krZ8DCxz3Y9wg6LInZ3
         7auw==
X-Gm-Message-State: APuU4Z9AwbCEfPOeLxEmoGLgO87LY3hMXfQUQT95kLtFkdt38GUFzDxa
	PBnFV563L822uZQobrsPIGvGjRka/Lu3ZVOLVRMrFvV/CAJ2DqQRtiy6
X-Gm-Gg: AZFdTZcOoh8VRXDyVSX11F5WBp2W6+aoxmyA109kIEzwjK8I5sZOM82+HLXT89dgui/
	z3mdgHsRw4wLzCk/letizoueuO7ugO7BjSbCPCgvolLNbg+j1cGZMGJdIZ9ilsXB8iZVOlKbFu2
	Jw4fx4WSgXob37sm5XbOARev8TUagGwy88LCp+NL6dKtGd18EWxCyMzB4oGTZBjlfZAAxBwSwUQ
	JiUWivFKE1OhGOjt3PRa9Xsxxj62d2AsQs+iszm2oJQnXSvL/PTBaSWhEhGwT9+4YY9MwilvN1o
	h3rqfkrjdnu7bpzVrfTZFzeVNpyYIM9uFhiQgyXmREU1sMrjXas2sROlLW7J8SqK+rdBCRyMZpu
	FQ/UWT58a/AsLFKQdMdvggK/CSvI4Dwebb5eKFLBlSDTuSXkE7+OfFWR1EMqwd2lT+pcDq0IlXb
	fKdpzd8CpxhuQZiRekDya1hCTNQbfE3/Eolnke9eb2B14H+YJKYVJjFcUsMxkHUjJTIOdQgQbkz
	CymsCsll2A6JMmqD9i3PwqUwYamZ0WNeKlcVmokpXsFqmoRleorKV4uklZYi/RLXqmeiJZT9AHI
	iAZZMzKIJfEkZf6YXSEbQ+eUajM9XJKey38Ptle1omnfv3jDXtMxOvqbn7RIyq46XXO8RjrQWvu
	moEbXi+nW1E7E3xVFxFe2sJVjDQCKCMGGb8WGbsg0coofQtNtuc5Men1NCCV0EcQzTybteynQg1
	8uuhQmLgs5m9HmC4lIK0j8Tbg=
X-Received: by 2002:a05:693c:62d3:b0:386:de65:9969 with SMTP id 5a478bee46e88-386de65997cmr3725214eec.35.1795748024514;
        Thu, 26 Nov 2026 18:53:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm75811610eec.24.2026.11.26.18.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:53:44 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] platform/x86: dell-laptop: Make the charge end threshold unsigned
Date: Thu, 26 Nov 2026 18:53:38 -0800
Message-ID: <97f3ed2d4fe3d3098e5d86b6f10c6c3c16e3e400.1795747885.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795747885.git.rosenp@gmail.com>
References: <cover.1795747885.git.rosenp@gmail.com>
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

charge_control_end_threshold_store() passes a pointer to an int to
kstrtouint(), which only builds because the kernel disables
-Wpointer-sign, and makes the following "end < 0" check dead code.

Declare end as unsigned int to match kstrtouint() and drop the dead
check. kstrtouint() already rejects negative input, so the accepted
range is unchanged.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v4: unchanged
v3: make end unsigned int and drop the dead check instead of switching
    to kstrtoint(); retitled (review feedback)
v2: unchanged

 drivers/platform/x86/dell/dell-laptop.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index eca348497ac3..1e2867f182c8 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2380,12 +2380,13 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t size)
 {
-	int ret, end;
+	unsigned int end;
+	int ret;
 
 	ret = kstrtouint(buf, 10, &end);
 	if (ret)
 		return ret;
-	if (end < 0 || end > 100)
+	if (end > 100)
 		return -EINVAL;
 
 	ret = dell_battery_set_custom_charge_end(end);
-- 
2.56.1

