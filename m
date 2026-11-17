Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794898687;
	b=D9aKMnq1oOlOwYJug8u+rjfBJvRlVAkZfyEFd6o+bA+4t1T3UOmTtUSVNbmiYLmd9kFu
	 C2kQOHFr89ZUnPc7nbTNfkKEa8KTru7e8VKIZY7g/lqEY/zXynpiOzszIRfmo45MgqHCO
	 sys3hNTFzLT7iCKilcC7Qz6kslmnueKIWmwBEciQ6T63/3hbJerbzeuexeZ5NmV0765cb
	 FIouauf1T37XSzyO1pS6oqXT4lIlppPcUrvJSQAX9tPJAH5Q6paI4b4+lRDaeCVqYtuCO
	 0RIEk2xQMJYS4wDqr3fJ1nZL2Jzo40g9DOPdcQuKUPRDrnHRw4yy+ty+JjmHwo6qnpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=kxEt8vG+DRrVDcd2eXyG/fDAKs1GojQKFTKXDjvZyvM=;
	b=QszB7kMjk6tJr7mXH8xks1GYSVLysXMxcVNHYe6JaWMBCz7FRpW/jc29IcDMsvhWj4C3
	 4aHV9pAwC+iFNvXMqN7QTtjHGPs27ib+m7JGkXjHWhhPFPZSgqC402PYALGhHoyeW9VIy
	 iKvpaYonf9GH/JDwZDbjPuTviU+GeaJnJN5MdoOZjtEroRDgFy5d1VPTASnljWi+xp033
	 BgrIdDu5FnEwGZ7vXfilqg3t2Td3OVCYwKqcNQIH14JLs0vhEFGYwtvjt0W4y1ryhwwr7
	 8lvzmksd34dxwX1OAa/JvjNcj+fpTSgKyF0sytQH3hwgABaO8RLkI+eoSdmFEZv/8IQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4rM+d5e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1588A606A31C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 06:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1588A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4rM+d5e
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c10dc41270so4538051e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 22:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794898685; cv=none;
        d=google.com; s=arc-20260327;
        b=IhFIyhx7rjvmMLLANESCmkmH2uGhH3kOjmKD1V7Wy9pFc4q1UQn6O/pPtuNhEWfVTk
         UGXA0Mqj/LTsoTgXpQgvDBAxbclSf3rQmEcWYCEeL2yvza6bscZ9BlJsMmSEAnbrJo2i
         J1nNxDuL+gXjN8siuyKVX/pKHyplZvXb5XKXlHk44Kox3bTxsFrEaQ/YoxzyhKdPvEVs
         cpsawocBdvrOJ6iMUfqVSXrvRDslTjjvTtmOtoPO0TVb5NsRcj9lIWzc7omkX+5wQNKk
         oKH1xNjUm7JLCajyfcl8EwIkiiF+fTFqYUiYfX/1puMjB94dFMuGbJ3puHrQQKLMZUNf
         2xnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kxEt8vG+DRrVDcd2eXyG/fDAKs1GojQKFTKXDjvZyvM=;
        fh=bl3oaCkJqJLi1976U6daTIbmpx9cT8+79DLB542x7lw=;
        b=Acj3zCH6hftU4FbUoRpiGx2gyxwrxILIq4jfHedczvmKXk0pDD9OsNtO6mZAsJTGbb
         Bk7gWzxijbMQXdD/F9n4JFAjEzpLkSR136t6o47h9qwIZFBuPVmCSRLivkjvXT60MKqn
         Ge2UHAD+Xq+5BOrGDdXlHhWRgWsY4mAEyh/ES4Dzs8GXNoaok7batPAxmGZBcMpo6tZ2
         RoFZ7+pODqnUWlUwIm4VuqJWFXE3l1zKQxOsW8H6BeKR4oOIsRnS/iGWtZjzoeaCoDWU
         7fJOElhcQh64VDrBlRXeUAhjMvK+j2THiLwWlP7sNvAPJi6MrLftNS+0IaLGhRfxavaG
         BGlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794898685; x=1795503485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxEt8vG+DRrVDcd2eXyG/fDAKs1GojQKFTKXDjvZyvM=;
        b=x4rM+d5eQf4pNGW78XWsyX1n5/EENz1y9C582ayOUP3S4yXFLe4ti1OMdst2hKDcNR
         H0MZ59d+v5p7RRpmZsCUYqwPVdiI15zMWLgPo1dyKoAbznFIEsa0VRqbBWGkFJm4pDjZ
         TdabPI9bMHH4aGyrZlCqZVYl76Kme+lPQfoBD5xEUz0itaR7Mj/8FciSX+cfIZ+RrWKA
         CXqm0Ou5VOpQDOiwcyXzsiGTsBbHStSxve4GGZCDrfNumM9QQpQhYF8vZA/zcS3HuQ6T
         tT2fD5ZjpETcM4oSA5+HNYJSGq43pV6EAIUsl5A1AsbI9HLnXPRes8GdxUsuCOdnscWb
         iCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898685; x=1795503485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxEt8vG+DRrVDcd2eXyG/fDAKs1GojQKFTKXDjvZyvM=;
        b=L/hQcqwhL91pptPLLWZ/i6UQn1K7yB9xHTlKWmDCjycZILYGGhgQI1FgSc4hVhNcMC
         29JBnSubGCyTGIfp0kNjdo8JPdbA3lJmzF4HtXd5ICTpi1oZBt4Vez5rihddU7aficy5
         nrFewQrTg8jHpz7qTqyGg5Ac2sFXYVz0vlMKhXxtw0m1iSmTY3oZi7A5ShLZxC2lhHqK
         D5sIdUdfF3Y15KbebnYZvaNjCR2CNKEYG1C0XbllnUGBe/TVB4rkT6iUL2QX3z6SfMFr
         QsDJHIMRXaXRiLVd01LTYg0QHQ9tRYavLDvLQUY+aJnS6F3rRIcUqcOMmMiM5FEvcoBV
         HJcg==
X-Gm-Message-State: APuU4Z+mQL5XhSfTX+vpH9Or88Xtjwgv7nZ93RVS6krzCRkDwYbaKDtc
	+P7AS9gmmZABSotSWRqngXcGEEA5zw81TWBvc79v/T6+9B5U5yMTt5X3JNJhE80tWOlrh5TOZWy
	LSao1m3BiXi4JX4LXzmqWoZxmGnaKgAXdWIzh
X-Gm-Gg: AYBFou2ZkrPiOqSlgFGE6mA+4Y4mbC7ANKOQBtymYHAHp/yYMjwrhMRrZ7jFlfPbZU9
	ClmDZuK2dk0ntY2wqoWBlwNmtLkLOM/Mn/5jDhLMolaeUaIVsp/M50zy8xjE6GE3+wZjEoq34lH
	FyRQPh6Z4vQnOlbvL0WPfs4mphWaJaClBEfkLhuUaufGB9A9oY0YSJYnSgUJPWWfCDqJgiw4LLY
	QcuxXMKJ3QWgva1SbQzjA7J46wwMd62NxrYEAoTWf1tqG85W9vp9ZGSa3109Z2At0UYMoHGARg1
	hECQLpZ1CLsQwqDGmkMpxCQB4TAMrFoTy8uq53cR9CeOoNqh/2jx3DElgRvcln6cDrTMSJ/sGM8
	Iw6+988HpCR4XKFY86ayXSsQLSQ+M6KNG/BK2XLUK2grunfITfxpqVYfsYkn50rKTXCPqyoko/d
	v0l9OmYMyGGVQLM1sRTaP8JpSYN7rN/B0pPTkLWtlbii3bHjo4hSTtnxDHzf9EFYJHyUuyLaBBm
	M6GCFyMia0DaYos/FOzAUx3LTYg5YHD8N1kvDoTX9uFzt/aLf1b0fUr0MwYnqxXK2k4VEywFOIo
	gFp58yA7gohR4lib+l2MhupBTmhmilo/XgEgsLWShFY6pPAWkrHXx0xKa09paJG0g96Queo14lA
	ZM6ihLTptpibdM2xAlA==
X-Received: by 2002:a05:6512:b97:b0:5c1:57b6:c791 with SMTP id
 2adb3069b0e04-5c170589d1emr5037922e87.0.1794898684865; Mon, 16 Nov 2026
 22:58:04 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANsc=4Uec03px3_Q+4YQDwL9H5FugS_QyEGPKAOy0Nq5tTOmPg@mail.gmail.com>
 <d6ef8523-6e72-4fba-bf99-3cc24ff41af7@gmx.de>
In-Reply-To: <d6ef8523-6e72-4fba-bf99-3cc24ff41af7@gmx.de>
From: =?UTF-8?Q?Adrien_Verg=C3=A9?= <adrienverge@gmail.com>
Date: Tue, 17 Nov 2026 07:57:53 +0100
X-Gm-Features: AclHuK_M93myyz_s31T6nIztoB1qp7oIKlQgJaoLk0bHFnYH7WMISZ9qDdqaqqQ
Message-ID: <CANsc=4XWjHcDTiK907_Pu=JKBgcLi0R7OPkMhqSddpE9gYFRwQ@mail.gmail.com>
Subject: Re: [BUG] platform/x86: lg-laptop: Windows key not working since
 native ACPI events
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Armin,

> take a look at https://lore.kernel.org/platform-driver-x86/20261103180750=
.228116-1-W_Armin@gmx.de

Thanks! I found it shortly after posting my initial message. I applied the =
patch
on top of kernel 7.3.3 and I confirm it fixes the bug introduced by commit
ad873d634095 ("platform/x86: lg-laptop: Add support for native ACPI events"=
).

Thanks again. I hope it can be merged upstream and backported to 7.3.

Adrien Verg=C3=A9
