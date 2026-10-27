Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793137713;
	b=cdXjPiJI0bJWeBJ9jUUS0LhfhsfROmLZLhRV09WX8822oDMaUbhpwJ8RoMrj/O3/42Iw
	 3YkYn5wVn4sNYYJ5zwBTUvO9mvV0LqjCuJ2sHaKQoi1+/lWRrp/x3KrHCdijr7FMPriUu
	 kI3xssWzR5f/dutd+cVbdNRigJbxKj2fnvuJhcpPvAnN4K4JiTtTWfheE/XRH12A/DEE6
	 SgQULGDIHtru9FCmM8w54533AgpE8z5obOQD2pNtbcHNT4j4DoL1q5pHAwcc6+H80yoqe
	 F4lnrC3aeeIug1PPeBXzkceDy9OGdNS6eFg+O9ZY9Dl/t/JnsmQH0rMJFQN10BleM8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R5y3TC+OxgWb2k2zCyoTeuDSWBjSf0l8Xg0k9asjKQ8=;
	b=cNWGN1WqwfvK5tWCeJFM4TwfBiuoWXEovWAtEMMvtNfpUcOqh4yKiKwp2RPsSRzopxqX
	 X9Tq/DRE01xq6A0OnYg5cuyed9GHqtkSSFxqHRG7TUvmq2w6DCBnlOGVlEXsGsjpUCV9i
	 g1rifE3b5PXdreYWXePlQCOUvTp0zGMIhpdLKW8SGB20xMm1kZVLTbhhgxgeI6r9AE1B2
	 CVjFNOey9YNV5L0QSanwLYRQ5apqMH4AmufrmD+oB4/i6tvrC09mLZiBrQUbs3Nmo6Th8
	 wDrRshPjqIHaM1I7Dj2Gj7e3gkvSFpF4mWr5bU6ieKXLAlPNyKd1ET35iShEG0sulQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NsnIF6s2;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B09606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 21:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B09606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NsnIF6s2
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 132743FE82
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 21:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793137710;
	bh=R5y3TC+OxgWb2k2zCyoTeuDSWBjSf0l8Xg0k9asjKQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=NsnIF6s23mLz8NdigrB4LFVWsHXrAI2gv8c/0r4DaBDgi1/szzsT3mv4J1WQvsX7U
	 zdzd/DmaabVx0WgdHBRtYbsUUXQfLEmyIpuGgKO5QETxu3kW2fIUwM5U7EAKh+CzyL
	 Pp9eBfvo7+XiQGcCKx0ts23DJkfEFlO/G03UBIhkJasSzYcHH7IHNp5njCNmk+G+fX
	 8D5ybftMkhFpOTqrB031ZTfloLSY5zbGBxPF3Pi4FrN6DTWkxAj/qZzzsg59AoaEST
	 9SQcPFdyqRxu7i3MP42POw4BgRS9tkm1/JJA95eprKGqLI9+SH3EgE2aJ+83zzBQsH
	 0BK2u573yl1ivql/6a50YiauLCYuvqU9yJpCciUGP6JfULI4OnQFcAEoLF8LQkShTJ
	 C8pkCrsnxG0Ls3PJ67TagKG7PvFo6IabWsfM8+YMZ2fKbwt8i9URBHx+cOA+J+9wIB
	 wjNDKJ+hHkZKc3fQAhVSzXiNzs1EkPR6BwsF+9hJgbaT19J/EoO76NQTPsQftvBV1S
	 fue1T1CPnh3FP1giDmLPTaBIcypc/pNfudv+N/2IhOW/d7T1F9SgW+oVhU44HidGMJ
	 +gSp4ue3iAgi/OMUiyJX881ZsA2MKWyhDgMtdfG/H//GT7I9gqPXcQFi3DcV1xLLUR
	 +OW5JYCOTL41oZtLE0vGfUp4=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab08c4aca5so74247a91.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 14:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793137708; x=1793742508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5y3TC+OxgWb2k2zCyoTeuDSWBjSf0l8Xg0k9asjKQ8=;
        b=1JyfH78SENxO3eQd2qspSMoV3ZuApoyjxZS3I9LFbQoVtXrOv8nua/7BJjr0bIlAul
         bjoJGkCOtQcqEQgFegVQNsa64o1K5Nhe2C9kqHpIBlsZt1HqGuaYj1i9M1hJdxBnsGGm
         3XLNvO7w2MvaJFO3aRfLJvs1lsShPkouhojoF+fQQgkRrjkuAmA7PaYDKCSOFxYp+n4E
         lrGYq2sb92VDmHHg2kQyQJtxSBptWDXkKgz50aH9R5o9ImEh3cUFg9PARXOaGbaQ1vK4
         P/deIuogCJDPvOXxqEOwpcHp3VL0cau33oCV43PyOnIDrfD/L9XXhb+f0VFSOv76g7Pw
         ojIg==
X-Forwarded-Encrypted: i=1; AKwUvBwAqnHh53jziCGGTfyvscXDLS50VIQcU9JKGb6J99rQoW0vZpJVanZ37PANjwG5cze7FAgpN6UfOmBcYuxmE+hGTkOG@vger.kernel.org
X-Gm-Message-State: AFq9FYKv3sV5/TrL0V9ENhW9BOA9Vqw7ijMKlYyY6KPED72nqot094YJ
	MHgAgU4rt9ZDMfZ3Gvw5WH79mKKhjB1JKBzgcDQUFyXRn2yccX15Qm5a7O7N7QzjuhzDdZQRDcL
	HM8zFz+kB6zT2ISWJWrQ4xdHCSyoHQ1jG9UA32EBtL1IhYTTOQZxIM8RPDIYhWlrKmIZvoWFK8q
	V+m3RKyT6vlwc+tyc=
X-Gm-Gg: AYBFou358uXr6wNZF6LYFh6L4W1CSy3JSK8AXgH/XM9JEnzGRUFvvkCMcbi3gXcqwka
	P6AAJAbmEwjwfCPURv1s4Ho+4P1bD79H6cTNsNyg6JJed3tePOQ56rKLcwnrVDd4VbvsWD0BhQi
	HXyM9rhDjKJBfP6SYzL4PpQ7Pobn18xnUKQZvekdjzErEKdnJEpx1qizL+CtoZGTRewoWMH6TjD
	+BPJf704y0F/LqtEZ1XPXGAE/p8wbk4nagnbr6KeWihJyi9ciII3TrU/00yk5/UnPCO6piR145x
	l7G7wK3QcyRGiPEheU1SIvuey2BgVSKI82tKyUD8BYcbDLUA328PmlhwB+6jfz8NBrU18RdSLNB
	Aju2smHtcWp0j7qzBOAGPXSCCgsGzas+gHQpCdRYLp4c3gVJdXXaXXgRRYkBrGTjkUCctab36gF
	0/YGyGnpvGj5zW+xitzPCwRP6/Jc9rxxT0k33NbGIm44hfesIOBVOCqe7kV5PqfW7r8cWz27SIA
	Ay16wkAPB9w4v+A+G5MqmZGq8ElnD4S+cRAlpr/xw==
X-Received: by 2002:a17:90b:6d0:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3ae581402edmr428965a91.4.1793137708581;
        Tue, 27 Oct 2026 14:48:28 -0700 (PDT)
X-Received: by 2002:a17:90b:6d0:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3ae581402edmr428960a91.4.1793137708192;
        Tue, 27 Oct 2026 14:48:28 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-fcc4-d427-0dad-9764.dynamic-ip6.hinet.net. [2001:b011:2008:445c:fcc4:d427:dad:9764])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a5e73sm37741a91.10.2026.10.27.14.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:48:27 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	cocci@inria.fr,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6 1/3] serdev: handle devices without an ACPI or device tree node
Date: Wed, 28 Oct 2026 05:47:42 +0800
Message-Id: <20261027214742.3624605-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <75e6d86340073638d966acb85465c28e6a08ceda.camel@posteo.de>
References: <cover.1792856688.git.an.wu@canonical.com> <263a607c3602f31a3f6fdd245e3c2008cdf97abd.1792856688.git.an.wu@canonical.com> <75e6d86340073638d966acb85465c28e6a08ceda.camel@posteo.de>
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

On Mon, 2026-10-26 at 13:59 +0000, Markus Probst wrote:
> Reviewed-by: Markus Probst <markus.probst@posteo.de>
>
> You should add the maintainers for the modpost scripts to To/Cc.
>
> $ ./scripts/get_maintainer.pl scripts/coccinelle/misc/of_table.cocci
> scripts/mod/file2alias.c scripts/mod/devicetable-offsets.c
> include/linux/mod_devicetable.h

Hi Markus,

Thank you for the reminder. Adding the Coccinelle and modpost
maintainers to Cc now.

BR
    An
