Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E5B20AF7C
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Mar 2025 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742303621; cv=none; b=Xqdxc9GwSSrRHYEaXCe46InZhLYns3HnBibCucke7W8ZSZE+0kR/C5lrkljUKC+0HjsXCkHA3cFpBA+6bhwRqKQdimbIrzO9fxaK1RfVmt9Opirvu1IMPwWq8ksqwLH56C14rYvzPWQixfaEDQSyiS3wME4wwotEsqcXrVOEoMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742303621; c=relaxed/simple;
	bh=3cbo3V+ERzwvhpqb8mdcT0xDeEI68QU1dKEMMFi1FhE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LltUtJSwdU5u5bQQV7L+G6Pnoz1DWWZq37Edy1ydhox7QSgXuNVQNiHWd7pIZQb/msCCXH8dOX0nOdoQleQdeiAnambncnwsAHFbY2PPV4nfqC3sn8R22+w5/ePIMbFJ7tU89aMxbViL/1aFSXZwjIqOUaHo//VdfR6UvXwRE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZlPR1sj; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZlPR1sj"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3015001f862so4061065a91.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Mar 2025 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742303619; x=1742908419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zs7IYNhlQvV4arAUVbEpVuGQ2G/ePkg/3UwW/eQBhfY=;
        b=EZlPR1sj3boJvS8eoPA6w36qAKr7zEpADaltHyknLhYIWuONBldIMaB/bDRgtddO6N
         +ROZ+f+xOvhLHzWgtxKboRy5Drl2GiWcwiXf5Ni5CZb9KTYng9el6Q5ituK0pAHGJZIi
         5OITOHFG1926AOArvLydAdAtdaYE6n+Rzy6rt6ViVzrHuO4shbL+bFp9UTFohg0bHurI
         +1N0i8AcIVjD1W0BrQekUHRA0zCxj3oZGBg24aqhPlyWxRcvjcd8uHqe26vgsqVP8evV
         5S1iY+Ll4U7W/doJDR6jW6nqHHM1xfVoEhwprycaoQtEvsrwWv2+r4W15F1AdwDIi3Cx
         1D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742303619; x=1742908419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zs7IYNhlQvV4arAUVbEpVuGQ2G/ePkg/3UwW/eQBhfY=;
        b=hpkJI1O+wFgtzLjUZSk4aHIj8au6tLvo2r4MM+qaNIuu6SALYV7hbw+T9MwxHGaF6q
         YF9Rt4i5Eu3OE2lsoL7JDvdiYNUHTEP/Vk+2ldIsm1m47t2JWnhJxbUtMaa8C9ZzxtZM
         0iohUUvPvvlsRnSrO/nB7OaDUZoIDbfPlyt0qtCYqc+YN3D04fjajeH6/fiuSt8Mh3r+
         /+n08nj5jhtRvBLnnrP5uc0XZ8uWVy/2lg12sAuC310RrIH+9BFarlGzHJX3GuQuvOv+
         WugeH+8SeVIL9kxcV4Q1piXBdQqD8qm8OTzfn1FPwyCXa2HPLb2CO9Jvo0Zbd4FgOF0R
         3tng==
X-Gm-Message-State: AOJu0Yy1VU+oFcjO/qKmE942wJgLgtg8SafrpIwti65El7KnAFDHBIAW
	7nuuSje0MY0LKomxn86IxFrKQBG65hlkXfAG9l824XFBJe7Ur5FsCj7kAx+Xqgqu06ngd24yV1L
	o2pSAeuy6uMPoHbXaFdLdKt37/RqVM4QNiBQPbw==
X-Gm-Gg: ASbGnctKBiTkZ+TOv8hbOp6oWNKI0aLrHHmiI76e6iwSWm5tQJPX26yTyt3DNPII/mV
	LHB+yr4VgCPFiAMk62Jn8SmyEbMh/XVbJg7kVhcKbAheZ4NzQlf8/qKQl3hHw0CtKDSOnIpFLRm
	XnbdoqxKfdslUjbRRzTDA123Jo54Q=
X-Google-Smtp-Source: AGHT+IFpMY/RD9Vab2WzCj2kXgN7O4YX9SXflvJ8iRu3lyGLZl9/62vWDHtHyHas/DeKSmt/5nQcqxCtjaCA9OXwROA=
X-Received: by 2002:a17:90b:314a:b0:2ee:90a1:5d42 with SMTP id
 98e67ed59e1d1-301a538d415mr3723927a91.0.1742303618737; Tue, 18 Mar 2025
 06:13:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Agoston Lorincz <pipacsba@gmail.com>
Date: Tue, 18 Mar 2025 14:13:13 +0100
X-Gm-Features: AQ5f1JoLNj2IrfsxvgkJ1Twz5S4x1T1_UCd_DoD0b1B0ik1I62QQfiBRV2HAYB4
Message-ID: <CAMEzqD+DNXrAvUOHviB2O2bjtcbmo3xH=kunKr4nubuMLbb_0A@mail.gmail.com>
Subject: x86_android_tablets kernel module fails to load on Lenovo Yogatab3 YT3-90L
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

I face the following problem: x86_android_tablets kernel module fails
to load on Lenovo Yogatab3 YT3-90L
>[   17.853705] x86_android_tablets: error -16 getting GPIO INT33FF:01 5
>[   17.859623] x86_android_tablets x86_android_tablets: probe with driver
>x86_android_tablets failed with error -16
Steps to Reproduce:  compile and boot into kernel 6.14-rc5 (from
tarball) Lenovo Yogatab3 YT3-90L. Ubuntu 24.04 is used as an
environment. Kernel is compiled on target.

Actual Results: e.g. the batteries are not recognized

Build Date & Hardware:
  OS: Ubuntu 24.04.2 LTS x86_64
  Host: CHERRYVIEW D1 PLATFORM Blade3-10A-001
  Kernel: 6.14.0-rc5

Additional Builds and Platforms: last checked working using kernel
6.6.30 (I have not tried on later 6.6.x  kernels, but already not
working - same results- on 6.7.10) - here the Ubuntu mainline compiles
were used and installed from .deb files.

Additional Information: some additional logs on
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2062120

Please let me know if any other information can help.

Best,
=C3=81goston
