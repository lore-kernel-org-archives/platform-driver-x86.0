Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793146151;
	b=iJEnxC8KUAxl02db7a5AqCSu8zRRBmIbS73D4OHSZl48Ki6onJzIUXpO3w3gUup5MxXh
	 V8NKxtKhwWJ6E/cXBAPPjWK/rKAWlWoSDPWF+6hWHZEtOUE9GAIbMcjpR4iXMYhkwigI9
	 Y7hBFhzwgxpMjNc6hVaXwnG0aEH4X/Mzd+GQAbuzJGLIom50WLu0wmL3cIv2TKERwLhWQ
	 g4gquKYWV4Nku5ZBto3ggVwRcKxqYrIY4XIDuvIWT1Yiir0tj2uFyAl1pGCWtTr4hAS2A
	 E8H19hp2HMtmqqxZWtxPOBPPTPCZMMtHa56J4P2PuGRtXiy9+2jZx64sS2/1KXqgoog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793146151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rYaht9shbFWxq4kumOpndSaFwe2UdArezXMn/5BLyPQ=;
	b=yLmscj5/MeVz08dMz6vn6YJn1+1vGRhTm5WWNfBbVOLD6dCLNvE2eC8v6UH39XzaE0Ze
	 EGmZDyUxvJzJUw/Khmi0mk/FSQtHYzMErdfR+PRvfLDKKTvuwmvgsPBkNFm7nw/M00mBP
	 1f89SyXIBUqbTtlw7WSnhr+tVHy3WsXDhnhBd3GePUmqqCzp0goPC1FQ/9Yl8Xug1sotO
	 Oos72L8HeSr+jIN6pTRE3w+7rjop/7V3DrL8da+rqYAG+1t01MjkK8q89oPajO1edNg45
	 jjfpYDSgOdoy/yKtEON17Bxon30YxOmqgQOhaQ/j766SLHOuUYIwgY1gIBpCBge/QrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c965U5rN;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CC1606A31E
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 00:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CC1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c965U5rN
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a17a332ecso525262eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 17:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793146149; x=1793750949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYaht9shbFWxq4kumOpndSaFwe2UdArezXMn/5BLyPQ=;
        b=c965U5rNBMbffOcZNVLX7SYC5p8jyV80hOEHtyvhV7AogFI+ESUuCFugBF5gwdEW20
         1fiy5dd03AVDB/cQe0C2Q/RBf0zXqKxCwbDPMYjT4MS2A3E0X5mvX49a6WCzw69f8hoA
         /AbRH0Zpauzco43FsFU+8YvGTT1N96yrAqTD/QS8XIuKhvU4b5Q/iseu+NQ+WaunolGn
         vFYPzzBjXIXCruLcSApWJMHiAO6IFXuZLuMhC9e7kIi3vz7n1XlfZ9tFjiF5Mnj5EJlS
         R0pxRi2kX9r75u0t+R7/97vtTf04NnYctSwuK8dRSx7xAlpU9SukX0TDQzOmpY4B4XM3
         QBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793146149; x=1793750949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYaht9shbFWxq4kumOpndSaFwe2UdArezXMn/5BLyPQ=;
        b=SQ4U1w5NL7FehYhalM4jju9RGegfECc966o1UK5Z8vNpIlnnWsVSy3/rETcrC14Cms
         pMMVMJUFQzVPA8By1EKxoUKywIc9WSFNABy19F9Tbr5g5ZGYAisZFpsMHLLLQ3ZFoAUM
         0LRUJHI/ro/GtFNqsN+muh0NZAHUAA6NOszDCtDrSFAzIPXJ65QqkBeLWiDDtYZLs57y
         8+sQ/aA9xGPZjl3SlNvuwn62UWzzbXpuKgIEG8p7VvBZ372V4JiOasthauzj7M+02cNg
         46ZudrHOLC15Y41mIpVAw3nJSh3D8+Onc1VKqV/TaXPAaWJKy8z1mU9/E5DzBwT+sueI
         hYWA==
X-Forwarded-Encrypted: i=1; AKwUvBxoMGucK4iiYqc5Xru5XzyPFySMQpw4ZFDzK5epasUN648R+R9TZRDYxxbC6eDUUE281Rur/83pqttjNOwz2DFuhoZD@vger.kernel.org
X-Gm-Message-State: AFq9FYJ37Ad4hf+0xYgbfm40B6llhg28oX5x58nZvNEip1WboismHUXs
	Z30l8OWNm0m49rCV/k3WzYqIGw89dwhcQitrtzH8wLfBcvzEAFJajKw=
X-Gm-Gg: AYBFou1s3Zdia7ee2cSschjfgSFoUoBvCGlEkdIHrLre2qDUEG0/wbXKKkX4I3KI677
	6zWpB6j9C26KT39S3VR+JGIKZ5rkKbg4OkKg3x5M7rB0b7o/WPweXz5B/RffmTSKNxcpD7Ki0bf
	V++E/ATr7OIFOzjHuYpiSD5icLadHbZZFeW6NkjJUxyu3N3foMtAVqQtkBdlBK3lv+2mdJLwp4w
	a7kSA+adPNlPvXfNIYXXkXS2bOvtZCL3q2AYVfRd7uuZUaCv2QFYFhasGAV6IqIZgNRdCuGSNEu
	B7ILb2TC1h4JPgpRmDzcSOSMAzV/IAVZkn5FozigC9+0wVyikSlLak++ebhhhT/fDvtts5onomX
	ilyTLo0x7Dxk1otWesrcayb3C20hH/dLoeUbFV7eKrQ2McllzaMJx8B4Dld+Qesf7mROCZisb8j
	GCxiWwqh6o6WYOrzV1DP3ircnoKDtOSFCRVjkxx/6YnFImLc23+ciPOTInf3vVWZnnnAuKi5d/g
	1mNW82tbduKF0+Cv/lTKt6EliGL5DEqoYbvwV0I0SnLOLeey6zwEUEl7PaHUdIAo7QHZGEvYzhb
	Cd2ZUkID2iq7HhPZZQ==
X-Received: by 2002:a05:7300:c7c3:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a2017929amr1084712eec.23.1793146149163;
        Tue, 27 Oct 2026 17:09:09 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.118.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239198c9sm336354eec.15.2026.10.27.17.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 17:09:08 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: helgaas@kernel.org
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	christian.koenig@amd.com,
	dave.hansen@linux.intel.com,
	dev@deq.rocks,
	dri-devel@lists.freedesktop.org,
	hansg@kernel.org,
	harry.wentland@amd.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	kenneth.feng@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mingo@redhat.com,
	platform-driver-x86@vger.kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 02/13] PCI: Disable pcie port and access on D3 on specific amd devices
Date: Tue, 27 Oct 2026 20:08:41 -0400
Message-ID: <20261028000841.6816-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027230042.GA516670@bhelgaas>
References: <20261027230042.GA516670@bhelgaas>
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

> Reading or writing to PCI devices in D3cold is a problem on every
> system and we should avoid it in generic ways.  I don't know what's
> special about these MacBooks.

I did not know about, i will try to remove the ignore_access code, and
will tell you the results, i added it as a failsafe

> > +++ b/drivers/pci/pcie/portdrv.c
> > @@ -688,7 +688,7 @@ static int pcie_portdrv_probe(struct pci_dev *dev,
> >  	int type = pci_pcie_type(dev);
> >  	int status;
> >  
> > -	if (!pci_is_pcie(dev) ||
> > +	if (!pci_is_pcie(dev) || dev->no_pcie_port ||
> >  	    ((type != PCI_EXP_TYPE_ROOT_PORT) &&
> >  	     (type != PCI_EXP_TYPE_UPSTREAM) &&
> >  	     (type != PCI_EXP_TYPE_DOWNSTREAM) &&
> 
> Nor does this.  I don't know what the purpose of this is.

This is however nessacary, without this The CPU just catters, so something
used the PCIE address space or the config space of the bridges, unfortunately
dmesg dosent show anything or journalctl.

