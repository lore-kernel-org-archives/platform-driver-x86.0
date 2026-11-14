Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637779;
	b=QwRy3nZJQ+29oYVsPSg2B9STUHoXlR2S4hQGqsDrjCKk0YxSUvG+AfZQmbAiU3xnK2a8
	 DeXpGXvEQ8Ht+C7ns/oumGNrZJjZ4pel61So+JAa7POUABGBJ6kEBkk5MTqPAOSFoX3Qx
	 y8JcjrZHApE5o7kgKMSCSoLG3DI7Ffqa0bpRb+O2cXbBATpqIJT121L0ustWqhUJFfzgn
	 5gJghaG0WAymM1RdeI+oTvX5gWUpPH0J2rzqnjc/T7e1ricw2IpIOiWPhN2PaZOCBNQck
	 Oap3DHn4tm3BJjR1BlQgheGWiAi0TBOOZXc+wpVmuHWAWARkyjat3uujpNYx6AlQHqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lo9RrpZDu+xmeeItRofeFQQIM7/msHlPwqtAcJHtB2I=;
	b=hRClKJ/UN6605qormiwHA4WMpl5Ayesit8cooae2caOK0O+VWQSRpwEfUg1yO2lNHsmG
	 KMiEATopmLM4uLQzrEIVhoY9oXm22s7P72dR/lGsjkTFY2ZeiDHj6FphVmr63xMmh5WDB
	 t7ujO8E8Rqw0tUurdWGuKicP7DDUKShPvYiEwx0lq7iyIGrpO0ha49zHGyKoCXQFlCw4r
	 gpzpNXRxxER26tLTYdN5fXxcX1+snQ5C4dybNUQqnO2Q3ucA8RaarkPRKWsQliqAoeiH1
	 sISwnyhd8Kta+1TUiNhAT1E5AT6UDYa+lAIvsWR/GWT2+roVbPebRy4NMmPkBc01Q+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDA+YNhC;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C57E606A89E
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C57E606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDA+YNhC
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so6068125ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637779; x=1795242579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lo9RrpZDu+xmeeItRofeFQQIM7/msHlPwqtAcJHtB2I=;
        b=qDA+YNhCDqQ5cvNYHPK4O+K5Meiju3IEvGc3XX2y7izqZXS0Dq/9eyUY70QLGMDByW
         hXD1EGYP4kgl1kqAKcQblg3k6Y0GhXKlJSOfqpfD4l8uYaqQqOchi9S5pYtiLWlEBubK
         qdrS3RuQGEaMoPO6sUh/p/nEm1AiyfbC1Gk+ySw1dWK7CBM9Sdre6svsoDqV4me0uNdi
         7jIkPorweWLsmj7vWntk4hWRhVQjqFRG1aIonPJ8QBQTEAyUR9ItAmC8tk2JS++t7wkh
         MSo7EDJS/dHm9yXuAcAsFoxgDtJ0H1zP6bLonWeurOh1mmHM2iIj3H0y8WeLq+68ZS/g
         divg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637779; x=1795242579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lo9RrpZDu+xmeeItRofeFQQIM7/msHlPwqtAcJHtB2I=;
        b=pT0slqU3FeJUsA14KO08D4SKuGdSJxqsULBzhT+3F1BaUAsNlX9IeS8rgIcqCc94Vh
         R3o1AKDVrKzG3eBSxhx9xXJdRNOmynMsgU1nsIFKFdgvnQDPHFKIDSl99GKLDpks4zVj
         +h6EF8znLvnSbrPU2/vw+rT2gshubEPlwqCwf/eiv+3x9QOfnBWcDpvnAoi9EBIrCrYO
         IIptI89ZTvvarBKuDtabmFXBLK0VqsR9Hu3tJGLYqNhn6lbGCEW3lmmmh1y6uOQ/oR+M
         /8TIbfrkLc62J3DRJtBGq8nJ9dxwNGnBbdyuJkTLAqBsEV99wZHUgOVl8n6UDlg7/8I8
         3vcQ==
X-Gm-Message-State: APuU4Z9+Xz/1p3nsBTxRl8cy68jmgdoA1DGqxdbcYEPKdkJv+YguSTdL
	Ukx1f2m57xYiUbqwsRQkZh1iG2XL7rws5zuozcHzXBQD4j/WiY3dLQfh
X-Gm-Gg: AYBFou1munhjW105qrjHcsLQcXmku1RK6HO1iWdHmEHERqxMi2buJ0MQW5LZROFm0dw
	1bxhDaUsbX38Vton//HmZXpK+XGalEz8ugIocsXC7IPRnaXjvwzxu/v9BNqd4QldLWwpEpc1BkX
	dJRccrIno0ZmJ0ORYZgRF5hm/t+MQwdH0l5ZMqGfrt1oOFvDyJ0bENOn0F4ZB4+43xVO4qfR2Lo
	0NztwQTQseVZqrIKDOP+ZNHRSG7dZAp7hjVdqk7CqkdygyobhqMlZZ0Pqw6d6gEnCSNcA47cO5V
	4QPKpPU8pYtxByffaTqp5w3MiqYkN/SKy+Sfqd0NZXDHAchAfjj7cXYyF6B9Os8NdD7KYrPVLsw
	d/+2GeV5zs07VJHpAt0yfK2m+RabFRMCJu8MZ2+3vBpvIBuVxRNTsn53qDMst40issfI0Pijm0M
	x0rwtm8k3DmKLkq/SVFJnzb6MgCf6ZKDeCOrU+kUWUhfJmP1tXmBDebB+vTibBkO93qnFWJyGQ+
	BMB57AXdsgo+VWnhXDSGP7tUDyQyqCFxK+ZIPbcBP87XpauU5gdIK+MsunPQoR5qdt4JDL2wEVY
	5jFtMdv4duFmXOXkHC3yYDBIXQ0WLdKpsBsUYdJKPkBpQu6yA6aKyauPWCy90EkqoVPAJP3U7Rq
	eMjIZyCszsDaKjbYyMdLeVwhz3tsAoN3+7G38Ptn4JetyhY+VIsaq6a2hzTyG1U9/bHdCJgSUEm
	EZJQ==
X-Received: by 2002:a17:903:2b0e:b0:2e9:5ed2:c38f with SMTP id d9443c01a7336-2ee0dc03234mr52576665ad.36.1794637778894;
        Fri, 13 Nov 2026 22:29:38 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f224370sm18382465ad.0.2026.11.13.22.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:29:38 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: dell-laptop: Parse the charge end threshold as an int
Date: Fri, 13 Nov 2026 22:29:27 -0800
Message-ID: <29edd5de9d2d7f90adfd5f9c889e50ad032d2d9c.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
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
Use kstrtoint() like charge_control_start_threshold_store(). Values
outside 0 to 100 are rejected either way.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 171728d63c81..2ebfef8e5bbe 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2385,7 +2385,7 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 {
 	int ret, end;
 
-	ret = kstrtouint(buf, 10, &end);
+	ret = kstrtoint(buf, 10, &end);
 	if (ret)
 		return ret;
 	if (end < 0 || end > 100)
-- 
2.56.0

