Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354348;
	b=WOJ+17TwqHSGvgGrdz/t703+WTGQWQ01g3oy2zXIyo38YKrEMesR9AYvv4jkPw7AVbTQ
	 7xaPbkJloEbtCrwlVYdo71LY3I2c1hhjvgg4igy18D9UgUhTE6iMRg2vRiJQfbNz+XNKo
	 x6D4Zq/0jsBfUpRZ2zFqtpIk2BvZoj1IXvrzMDi2zJL1shYrAKLgUr91/HWDjLx7F/ZZS
	 QRROqwWuIWggV9utiuek0eMfWrL7bETzk7/yIV38OntTQphWrwG4p+6USWwOnEHM23a3L
	 RsImQgwgNAy2NMz0WeuY2GAlosTjsvmD80Yx9lBNhovHo7hcR4dmp6/jiUqQgfZcb2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4Lsy1zyB+gZPkYYNWFQCNSOq76EenYc9gTefr5K/zps=;
	b=Z44btUUGxBpad7DNpyhTPbW54LgZyiopTN7wk1qacuvXf8oMcGdZLlAKcUIqaoqNWG3P
	 PMeybeNI3Sga/E/REtTbJ3sFfWFR6hb1xNXWtCPY5itiWYp6CYu+T+K2MKbym3IFd1gPH
	 b8N40GD2RyVEto7H965gdo2l1stlp5OUOtBsAk66b3acU630XO3dxqFsvHhJ0IES9SQaI
	 h54u3hHhWLgVDu1+Tnkup55I+ZRy4qPpH9ynQ4hURvO2n1Ifj+g/OUudAG/tZX3+QnDgP
	 nPubQkpFFn0YpIf8QwpGN9GBjfc6mMcipWEuCODSEn+L5vXSsT61SchnPaKKU3WM0/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxfmtrg6;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4A2B9606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 23:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A2B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxfmtrg6
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so20893625e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 15:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794354347; x=1794959147; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Lsy1zyB+gZPkYYNWFQCNSOq76EenYc9gTefr5K/zps=;
        b=kxfmtrg6hICMHR/In+Quy6FtPzrP0qEjJrogJcgX5m8fZd5Cc4i6EkbuNbBfat6HvA
         jYkEgpBgf+8KWakwxcFHTzqJxNFY/eZvLGXUeqnTzZP00Ya/pRdKQB7a+85C3iU/TzSK
         l9pM1aazZib8wTjm0WiZ3wKNSWR7gXoFKc0TAWO0BQUFzJ+AGiqNs1Ix/Vng7CWEknz/
         H8UUTQOreCE6tBxpOwmpiHmwkp7CgXX/8S3RizmQ8Ghbs5xXZJ199iv7J+v8VjhXfOqX
         4rnL8Gc+kUKAWqxL1eIN69C5fplCmdzM/AlrH6yMbKBH1CdNLEOLT1YHQbtR0EApHuMe
         IKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354347; x=1794959147;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Lsy1zyB+gZPkYYNWFQCNSOq76EenYc9gTefr5K/zps=;
        b=NS2LTDdKRmbBevtko2qKN6wiAhwJYsg87d5rk/ggrQ6qQPD8uYZ9vfKCdM+dwO8TlT
         KQ0N/bu0NgO78mw2AiFCMX0q9C9p/m4F4KiBc5KoY5K2e8k/w8A1WLRswbO1L2VO9Hbh
         QZ3EsRCrYl56kE5BBoWgz6DGIZ+8bxZALjN/4nIn+1e0STC0BULxTVUBpHyiyYQMLbA+
         olD3MxWatdZgYZbDE5bEWw0tZXZzK9iRV+ZXVju8djpVEjLCD6/JINjN2qpe4jaD5tCp
         +ixBcMETH6yVAnagtPbL7K33v+oFVSesjHpY/0lVbxBbbxr1DWY34hsX4uPlIZUjquKl
         GjMA==
X-Forwarded-Encrypted: i=1; AL+hErFvyCE7xf2idGu1IP3fN2UJUshBSSlQqY4bNrQQxWiXZwlUqZkMrQGsxEAqTZs+AX7wVsCLy1bjVkSDZkY5273TEzay@vger.kernel.org
X-Gm-Message-State: APuU4Z+slVh0R6+LNV+35l/ipMUNqGqecDwx1fEwfudhisk5RCuCVp7C
	FbG7UjUfvztH1rTVxnrgGcwIimV7lwLuqkkgksEevF+fg4Qw2Cwbun8=
X-Gm-Gg: AYBFou3xvfiJnnjS4hO+P98bu+LTs2VbMYTpDNFDosnqvG08VXHlOwFF3Jkfm6LHytq
	ajKz4nO0VC1bdWMBwuE2LDLueMdOgBOzUrpXBchKhk7Jaeu0N1g72fUe4GiMxFbblW/7Ei7MTQM
	poQWiL8v3FuLJtr6waYk/LxqC6npf54BLttVONnR2wb0wn609yHRsrNJhAxwyZ3xTDigbIRhZEU
	i4E17Zz9Ba7gWs1UAR7s3ovYYHgNXVYRdxjDrG7ZY5Ny01x8G/jF1ya4uLJeD08kK+bS2V4IIlS
	hYrOiEjQNQ2qGL8cO/uXDfhjKEX2/VJeRpbF3rdthFoZ+lytwVOr2GiqMchG01H4faKAM5Ef7V5
	4PEuSzwig65YAMc6PG7dpF6mWlnGJExvtNoK/yPHRSNu67ltf7r7ZDEPt3Q4if6U07hpmEhEXQD
	gOTpdTGszNbGTC+OvkSLh1BB8dVqvk2w9CpWFqd4PzahSTwCTx53yCCx0nSSM6YXqMRMJNxh7of
	mUvK5xq9b5x0/8YQtgmeLeOnRABAU+Na19xVSC674j/FMleHkgzeELNJoy+vr77VtGviQVvVRuq
	IjaW/oPy
X-Received: by 2002:a05:600c:4ecb:b0:4b9:ff69:19ac with SMTP id 5b1f17b1804b1-4ba093811d3mr8644335e9.11.1794354346600;
        Tue, 10 Nov 2026 15:45:46 -0800 (PST)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4983f7801bbsm7532615f8f.5.2026.11.10.15.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:45:46 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Azael Avalos <coproscefalo@gmail.com>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: toshiba_acpi: validate ACPI object type in
 tci_raw()
Date: Tue, 10 Nov 2026 23:45:45 -0000
Message-ID: <179435434594.2276199.18274627858522339873@talencesecurity.com>
In-Reply-To: <7ac2114f-f4a5-c94a-0578-7659a7a291eb@linux.intel.com>
References: <20261102181827.1989460-1-tristan@talencesecurity.com>
 <7ac2114f-f4a5-c94a-0578-7659a7a291eb@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 9 Nov 2026, Ilpo Järvinen wrote:
> Your ACPI validation patches seem to lack information whether these
> actually have been observed to occur on some device.

No, this was found by code audit, not observed on hardware.  The
tci_raw() function accesses the returned ACPI object as a package
without checking the type field first.  If the firmware method ever
returns something other than a package (e.g. an integer or buffer),
the code interprets whatever the union holds as package.count and
package.elements, which is undefined.

The sibling hp-bioscfg driver already validates the return type in
the same way (biosattr-interface.c line 159), but toshiba_acpi
predates that and never picked up the check.

I can resend as v2 with the changelog explicitly noting this is a
hardening fix found by code inspection, if that helps.
