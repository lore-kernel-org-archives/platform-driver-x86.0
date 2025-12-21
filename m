Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046EE221FCD
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Dec 2025 18:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766341156; cv=none; b=imCOvp+61e7+Ko4IaA9SBtX2KgLmMW5xP2D0H6KunB6ac/dUjo9r52BK/rbcl4LJfZWFU+7pRQacJpmJncEFtry6LdCnjfRuElvqR67kZvo0jXxV8D4uw9rlTnswrm+jXs9dozK8KZtZicIKqTmb/e9gPFwW1zHfqdxoBn+ixgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766341156; c=relaxed/simple;
	bh=RXmW0atasCuSrW0Y7GsY9dZ6mnkSlYB9AlHzcCZgyhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eiy37jSKGcJCmbRnwlfK+ivtyy8cdPqQ9qeUmUiwg/5GrIy3d+PgEPHPo0ISptvgzxSzIjTb7WbbKMCjM0brBRU03W7DrABADIJw5IpdvvSM+/X+5i0GCX6GLQAmiDcyjqeuAOiKb7ft2kLlm0wAOt0ZfzPOPt4soMiY9rNppnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWoT8JU8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWoT8JU8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64ba74e6892so3284485a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Dec 2025 10:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766341153; x=1766945953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9TT7zhqvqJiplcf52NWEybMRU+oLF/P3+KC9H/O1Oc=;
        b=iWoT8JU826d6vM4gvomBGcerOhYBJdfS6rX4EI+7tDXhezD0VRsDfobS+2QmOyDdQE
         l+mWKh3tHL2cyD+gQido8xQTNNVg0NELZoCeZxJ3r+8r9Jzeu80ypQE9SrkMgAgjhaof
         eXCeE10M+FfQkdpR0EIB41ds3hTy0bamQC4TtC+x7uI0eucvl2cTdY7WHe6/M3oaKY4m
         5Sc44A3/4fujk40YmauzjDvGbvH5SXGLOOC2QD50Uv1dT7D6/7en1N872XizH5eXYbY4
         tx9cqT93hN88jIZ2PGrPLrocUcK1xRpORbO4mZMURxCTICfRXwGRzbRW8GNq3ixSKuWo
         GvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766341153; x=1766945953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9TT7zhqvqJiplcf52NWEybMRU+oLF/P3+KC9H/O1Oc=;
        b=JmdBHHMBoYLyW5DQm8GX1JR5F5dMciGFYHIZZgEaVTIQcoVwL+R7JfSO5vnWjQJydn
         /9Na3Oqzr3glMdNs4vOCK6FeVY4nBz2Hsa1fU+lhXvBBBJDP2XSk3Ynnir8U+8GKdx5E
         Tdr6gxkY5fUU/ASLClzaxtFrjlGl1QtrpBPMB3T867pkv+PgmH5pobUhwBnJtpdBsG9M
         0Mztoj1NX3JLVR+fDENqXZsr6klwcH4qILPQkFq+Qo6J29CYLryIQA2eat5eCgLd1gPp
         fsh6p3S9Vq1GS1JnZG4RlUmkLVu+zD98xDlvxp/2pycbfeaq6C7xiR1FH9C1YtQocryb
         AY0A==
X-Gm-Message-State: AOJu0YzF46ki9YbHO97+iIjiI8MfdKZaCACgiv9vo9eoGzTX01+d4Qaq
	Ml5ov3PMVAdAsfgIWvgF3CIl/uXlZmYBITzDWcAPL9mZBgVXVeyQl9RzX8Vy4fZ/
X-Gm-Gg: AY/fxX54wDbqZsaShSqr3v6W7NP/If5N31De9Z1ic2sRWTEz/lVmyiZI9GBuX3Ivx5B
	/fOHw3kWF7nUR9RBu13DYfegmHpiD9o7yO8paPnh5mR2J5wLHdG11WkELB9Q/EI9NMfFk1d9fG5
	+aCGmtGFBN8UM660MVPRvAs1Lc7sQvBsov3iMuxU/8QrmBpqUjcHlUqmJoDr8x2p3CNUUmR2lYp
	7TeR5R0b/eTI+rILSnt5NnmYHRpomV1CS4M4jjs7nZ2b/dH0SqJmZhXvR0Y3smyIaUvFHvNN2R7
	qMySzM0UJkoWWNiC//g84SlnDMhYJ4LVP30qvngXK/qUoIxZgDaZfFdTz/uclSS86WpDQfj/w/j
	/L6CklU849oadzwSi37cmJtX4WEbjkPQjj9aHSJ4onpEtAGFnvrWrsH81CvqN+WcM4NuT6/PV5C
	qzzw9AYwQEgB7oPmeSVhxDMlS81gLoTq8xdTsm8wb0Rbb21iSJhP+SkQZylsiPB3Jq
X-Google-Smtp-Source: AGHT+IFcpqNRh6GUdhmMqalZKHKvlxynCUVoFzkDr9gsGge6Hpud16Cs5cB6rbhoFfIZsDWS1vtYWQ==
X-Received: by 2002:aa7:d283:0:b0:64b:5abb:9be7 with SMTP id 4fb4d7f45d1cf-64b8ecb2036mr6036864a12.23.1766341152748;
        Sun, 21 Dec 2025 10:19:12 -0800 (PST)
Received: from localhost (2a02-a44a-2a80-0-8c2a-39d0-7ce1-2682.fixed6.kpn.net. [2a02:a44a:2a80:0:8c2a:39d0:7ce1:2682])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a4eesm7678494a12.24.2025.12.21.10.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 10:19:12 -0800 (PST)
From: Tim Wassink <timwassink.dev@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Tim Wassink <timwassink.dev@gmail.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] platform/x86: asus-nb-wmi: Add keymap for display toggle
Date: Sun, 21 Dec 2025 19:17:14 +0100
Message-ID: <20251221181724.19927-1-timwassink.dev@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Asus Zenbook 14 (UX3405MA), the Fn+F7 key combination emits
WMI code 0x2d, which was previously unmapped.

Map this code to KEY_DISPLAYTOGGLE. This matches the behavior of the
display toggle/projector mode key found on other Asus laptops, allowing
userspace to handle multi-monitor switching or screen toggling.

Tested on ASUS Zenbook 14 UX3405MA.

Signed-off-by: Tim Wassink <timwassink.dev@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 6a62bc5b02fd..a38a65f5c550 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -580,6 +580,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x2a, { KEY_SELECTIVE_SCREENSHOT } },
 	{ KE_IGNORE, 0x2b, }, /* PrintScreen (also send via PS/2) on newer models */
 	{ KE_IGNORE, 0x2c, }, /* CapsLock (also send via PS/2) on newer models */
+	{ KE_KEY, 0x2d, { KEY_DISPLAYTOGGLE } },
 	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
 	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
 	{ KE_KEY, 0x32, { KEY_MUTE } },
-- 
2.52.0

