Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDCE17A314
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 05:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227905; cv=pass; b=EOB0Oucc17yq6pGCOGgHqIgUXIlG1cMauX5JBttLMtEdtuweZZEVo8+W/g5ahsv/sGHdHGuMrM14RUbBmKZNHX4HKIilbfh7mQSYUKz26MfLbJzfsObGBdMuSahKKZquFUT+eaSDFh9y9PhF655wXOqxspOjsqt2dbpKvA5SV0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227905; c=relaxed/simple;
	bh=OnT1j0gF55TZq8gmDZO0CcJ6lH9dlv7EE1MvVq0Lt6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOEE2GEa+qdyTvo5cPpwnJC82QB3E/QrouY80/sKBUpPWEtqHJdQakkllyCAgyC9I2WDNd1Csz1e62AVusyOPwo8H7RM4MZVuQMod7MLXO4dlip8ODwQVNKcjNdQX8PsRbHqMkxTZlGLPHApluGfBGFI+nKWB9uaewqwFFQyyds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ec4Y0yNV; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec4Y0yNV"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so240681266b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 22:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227903; cv=none;
        d=google.com; s=arc-20260327;
        b=pHKjzrFfrtD+LYqLqfv8gsDrAR7eMOpFp4djWlYzy1nJ1MzQhPGhXiu3rFkmSh2Nf8
         0oxZQS42dq74Zp4BERLlUqM+SwV2FOjAQiXzN3ZimWg70QgWmmHPrS3XKwX6dDayjHfT
         Iz9iCBtGRC37QhjaTyKZWRdxLX9rkDwVnXCvGn4X7hWJKe6c/4JG+4X52xhnd3xPzyQ6
         B8t4qubqdSulDke593be1lwefP8gIs40XKdbErRfQw0u6D8JPff0UF+hcaf7Z9l02WlJ
         3G59LuYTeu2cw+1ucbUWT+hgdrmmxNm1YybBVcnSkpXrqoOhyRwacpKd3P9t2A1hKTew
         qB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OnT1j0gF55TZq8gmDZO0CcJ6lH9dlv7EE1MvVq0Lt6U=;
        fh=2yH1GT0cYPNtG1FW1o+NdiNIbW/gtOUQXZRyB0hQ64w=;
        b=VkcQOTkkwth/lehZCxx+h1REuYR5wiGwXsiAoUav0KeycpHy5cLOe8Wt6yIh4a7SLj
         vV9///GoBzSnA0OFc9KykIiwa4b95pazDfFan3+3C+4pQxP6TPxf82Uxhb2sHUWa4W8X
         PkzuTQXGJ5MSwiZsP8wgUFtmz4q4BAT8XDh7raSlYovR7oMjzjmZSPDz8X5VzVO88sY4
         t8CeblP6FqmT7K4mEBP7AEY4Uy3VCBDOvz0K44aMWe9MJHxYQZilxE/wU5AIHEWFe2cJ
         BNEi62sfsmGbBYV4M9oTvGttGG44cfKWsNnwM9jPIrfnF2pHZSFNpO2WYIEs+IMaViuP
         5woQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790227903; x=1790832703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OnT1j0gF55TZq8gmDZO0CcJ6lH9dlv7EE1MvVq0Lt6U=;
        b=Ec4Y0yNVIuqjN4CltJ710c5Y58NRLWNH3ym2uvNg7Mv1/1Uj06/Xq4E6PeeMJvwyNk
         /Qg3aTEqllqNutlzA+9CyegcOEPM7XmfkblOWMnc75hxmaQeoMzzrFqCiD5bNdLVuqCf
         7cxBz3hHgt31I5IwUyy6M62Tq1ZDmsYUl8eBWhw8rkukXk6Zz07U89sr2xZ3XRkNsWQj
         j6+FPdGHGG6lMBdmTHP4MUlJNoP1LdamX84HrPWkVYliDtAG8NUSLq961MBjrjojyDJg
         VBcAs5oufQ3kGZy4rjR9y9QvfnBKipVquZPdOZ4hyOieC9t6oagtwGWDDZrobueucOZb
         QlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227903; x=1790832703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnT1j0gF55TZq8gmDZO0CcJ6lH9dlv7EE1MvVq0Lt6U=;
        b=WRsepq1CXNXGDtOWz9ukxxeymt8e0c0zP8ocmJXVDOCkUqUqLbm1NnY20xwc61E9vG
         JSrRUEc6K3GRCLCBQeuxvsYQl3p6/o/kVFUAymlcxqqssb7GXS/EduNtyrLvoHS5ASDv
         Y7mljlyH4gG+zuwvxtUD3s52S9OToT/1xdMKz5gImwIUjLQ0PwEAu9Dk/WH2uAQm+9Wb
         gsCdZCK0c6jdoI18oHxH2HI0VbLvPwrtMQcH0U5/brFgERjVp80cGPNEGXRlnkeFv+hy
         q6ZxB1NDXgKUcW5sfdh03HprfSjjDwXHPwEHTfhY4x7ciokfvXku7DuH6SQOoziLU23k
         5RXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxS0ztG0VExBCVzSB7Mo2EhYi2Ji2mivvKPrENYyV0+NLnzQggwl2k1dfVfGl+T7H8QuvIYk8nPU/Uc17aPigiZaPF2@vger.kernel.org
X-Gm-Message-State: AFuF++k+q5nXYizSJAwb159Ys0F+rYombR6KxNpXG09hrUhRwYz2j0/e
	9fU0vbE54ZXwdW7l87d5u/5NtEDXaeOF6q0T54T48izFtTTsFQa2TZRDcNsYpqnOCq3r+PihuYt
	NjIaTwMQzMEwNRmO+3g4Di9H/XptN+cs=
X-Gm-Gg: AYBFou285fIUTcdgLZMSoD3o2adax34tP2R2eCJghNNgg22CK9qFArG00QL+4qzuwO9
	dKDK71TWSV3u8VzGk4t8Ddxzn33G8RtYmdO1Ul64zYk20s7euq9fj93w4WkFNU4yvnMLa/v6oHd
	PSvuiqgrNn787CmSde+B0MUaSoRehSGlpk2LYM85KMa5fEOW1EuV0D2ick+EMiAYxRsHzsglj4b
	IZKt27CoReN090C9siXe7kPjXfeOW4w2iM8nGy6UNcdQY4nNFOj+l+RqFsMYgXhNt5cMb/Gacqr
	ByBXYqM7UgNdsJAsn0Jlre50lYSOaEgWKYDW9mruXLiiFcdKPmPdSy/oB5bnC0FOnWaeZYE6KHx
	QifqiN8cUJds=
X-Received: by 2002:a17:907:9603:b0:c26:2a2:b91d with SMTP id
 a640c23a62f3a-c2ac23db836mr101945666b.6.1790227902600; Wed, 23 Sep 2026
 22:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-gv302-tablet-v1-1-a45dd3a383f1@gmail.com>
In-Reply-To: <20260924-gv302-tablet-v1-1-a45dd3a383f1@gmail.com>
From: =?UTF-8?B?0J3QuNC60L7Qu9Cw0Lkg0J/Qu9Cw0YHRgtC40L3QuNC9?= <plaztininikolai@gmail.com>
Date: Thu, 24 Sep 2026 13:31:31 +0800
X-Gm-Features: AclHuK9ID68yXpk8yW-_xVM6S7qoHJoqGYfZL8hMoFlRtkmEuF3_JCoIEGlOQHM
Message-ID: <CAEbFrdhw7q6VC=dCnX7BoUW6ufwnbk+xrCyzfGbg_+zUneP=4Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add tablet mode quirk for ROG
 Flow X13 GV302X
To: plaztininikolai@gmail.com
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 24 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 01:4=
8, Nikolay Plastinin via B4 Relay
<devnull+plaztininikolai.gmail.com@kernel.org>:
This patch was prepared with the help of an AI assistant (Assisted-by: LLM)=
;
I reviewed it and tested it on my GV302XV. Happy to resend with the tag
if preferred.
