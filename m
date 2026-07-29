Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44ED45198E
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 18:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785350139; cv=none; b=iTRxMGsuynY0dLMy298DPoB60ga6vruQzVy8vHJt4ZeujA2RmGNRcHNE6OlnHVHv0TNjFq35gi/CoZskAf/0dFM2LXbvQ0woIqOhWH1eMCJpANEG4QNQs3JsrmUKFY11JDL5d8cUHhAVYNRuZ0UWvh8/afrJzZUKHAq5AA3GM2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785350139; c=relaxed/simple;
	bh=w8ZcsTYZq6h1WcjQ9hsHh5n9tzoVHYRugiOtWG6aBT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ffpjmXJfvWAyfUARal0S4zW7RI+lxI6j+gvvcQ5/xTyblFBtqRY63/IZTo66d9gdq6ndFFvnq0HKtR4Ij5Q0lMzLnJ5jxRq/Vzi7kIKH0W2fnBBHm5bnPaFfzmbGV0bbic/0690vxKz42TtyQ8b1ndgDDUlSMbaAJu1Q2cHKOgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQ8r3hTi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQ8r3hTi"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ced3386430so13339295ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785350137; x=1785954937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8ZcsTYZq6h1WcjQ9hsHh5n9tzoVHYRugiOtWG6aBT8=;
        b=IQ8r3hTihDiHql8XStVzAvqfjhtDRgi2V5JQUxt/RD9oDTMOWG0xFjc1UeyrzoQBcp
         fep2WMI0SlVztxeV60UEjFzToFkkJZGHq0rBJvbEMtFuzHk8EmMsbDIpWDAsznjx5FoE
         G+PfbuUo77ZBaPThehnA4rCAYfcMIDtTNrBHAW8nMAQv3tSHDD2nuPdRoP3lriEWi1w6
         8rVxNa3hAncs/f0aB6K2x18hXZE/xFD1b6s+9/9S/tJamvYR5NTYlU0NT7WC98LzTFtb
         5c10gdVBLex8w7MTwbrCos8qkWmJRyTk+K7DoG+sGeCdKx1I7/xnAB2xjy8ayPQcmelJ
         qz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785350137; x=1785954937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w8ZcsTYZq6h1WcjQ9hsHh5n9tzoVHYRugiOtWG6aBT8=;
        b=PG+srtIn0NfXzDeHEsrchxTUeqv7SUEnbe5sAQnEsaIuTCzzs9sFMh09SoFf1/tpYI
         EFLjHdyCR8put5kMLEuwzSaNuiEbNJXlEeb6scE7W04ETowjwUQlHEpXEo19Ew8X3vFY
         ITiOMvW3zdDqIQQQdjH6sKVMXzfmcZ2RA+SUoaMNOXi4703mEHKJiYPj7wthn0AAeP9E
         qMc0CfU4ZqzqnPxt6ooQck/W+hgGSq6FYAjKuZIuTDeX4o7ArFAuClyvfdOZT9mFNJeu
         TeEw3TR2oMchpQZDNv3E2ZIiVwhHOjxGaBv/u7ECTZEjvlfJLXScv2xTZf7QEmaI+NtK
         hIWw==
X-Forwarded-Encrypted: i=1; AHgh+RpRrHSSIIpadeGZC0KFtwTxdLakLRc6goV933S7okxREYWOUzTvMd0RU+ENSxxEu3e5Z078vQ/XKFitUrATlwy9cDa9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxd7hGLGGJrt7RdC9Js5v/Po9+9dVgosiKI/7EEwhh791jXDdu
	NNAYy04BJJKMYmH0DMITe9GxqI2DHvU6K2lKtlCbawE1ZtjAn7O/SZY=
X-Gm-Gg: AR+sD100S1b5mYtAavW82LQsSDYm4LENV/+XwK4xzR8mDjmU4dJPYyd3JvmvWAneS+A
	18Dn4HJ3EbTFoYtB+AX0smef5ijBo2q+YBcffxcCvEBS5LZrnzSJ+KNjeJupfyoTg5lTpnUyF+G
	FtI16X2j1g/udt+5G2mMa3a0p0B9rB1zc1pdt1OJ7k2sfHkGBQSi9ZLJ+lzWnXaIKgnZ8kfz0xO
	1GTMfbH3/tzV0Ylil87OWUKXvOSIQHyd2WHhV7ijpoZVjDBHbF5Iru7oRFh2uRQFZGqhSJ6WCOU
	nLpDrKpr64F+qjCWi1icaIqkKlXAjPqqvJ7MHvTdT9wpvE4Gcm3mx+mJsQ03cps+LiLzv+lCBHm
	G/rA2tIhU3bQ9pmpR5OPFNjGq//XrQkuhIqbZqPX9Fme7vxJB+RrMQvIrZ2uDJgdwRH0vpG1nBm
	f2qB5HWlP0QUJfla0T+tfJm+nFOy4PBM+opYqsLcFrbznHLTHpQBzcGAbwZd25rA4MAbGvjtEsG
	zYaXdzf6SfIDkmI4KHCTFwd+F+XUdTCG6GzCaAk
X-Received: by 2002:a05:6a20:1449:b0:3c3:9557:3b56 with SMTP id adf61e73a8af0-3c8ba66b71fmr9232328637.72.1785350137261;
        Wed, 29 Jul 2026 11:35:37 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([106.202.119.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d37368sm22620397eec.22.2026.07.29.11.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 11:35:36 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: YehezkelShB@gmail.com,
	andreas.noever@gmail.com,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	dev@deq.rocks,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mingo@redhat.com,
	paul@paul-moore.com,
	platform-driver-x86@vger.kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	tglx@kernel.org,
	westeri@kernel.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: Re: [PATCH v5 2/2] thunderbolt: Add device links for Apple T2 NHI
Date: Wed, 29 Jul 2026 14:35:24 -0400
Message-ID: <20260729183524.1199-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728044841.GP2365036@black.igk.intel.com>
References: <20260728044841.GP2365036@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> We should not be calling PCI functions anymore from the SW CM core. We have
> pci.c for that.

That is outside the scope of this patch, this should be another patch.

> I wonder if we can put this to pci.c, rename it to tb_pci_add_links()
> instead.

Same thing as before, its outside the scope of this patch.

> BTW, why you need to differentiate T2 vs. the rest of Apple x86? Don't this
> variable do?

Because the Patchset is specifically for T2 Macs.

> I'm not fan of __free() and the like so let's not use it here.
>
> Also you don't need to scan all the slots. Just look for the tunneled
> downstream ports based on their PCI IDs like we do already.

Could you please point me to the "like we do already" code you're referring to?

> This is unrelated change.

Its not. the patch specifically says T2 macs, and Titan ridge is only on T2 Macs
so we dont need to use has_apple_t2_chip for that.

