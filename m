Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB3323BD1B
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559217; cv=pass; b=bqJPCjbWrS2vOdqayiH1RcNfAtk54L/qGzwemGP5REO89jPWgh3E+HuTW/rAHYDWTcPwWLY4bCUC24CE7qCpcvUfNwJStxPJrx4Njt0OlFytLF4AmS4wegy6636RdTpYmcBOwqJStbMjvqotsz0mwG8KBUQoIAX4qequdRHomms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559217; c=relaxed/simple;
	bh=Bk/Zhm46UsksqKxdCgEL1IXAFMmudAH/kvx9B8xFq6I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=TzfNKjEocIPS2PpY3tCYrI+HDJGKmrTLjRZuo95dR1B0UIV7YV5JEm0whi/GIAKE54Tte1LK6nvRYsTELivIEr56BTWX6VOgDOWc+3BKyzgdlF+xQeqapuu/Vp2vUXbEFU9H9yg7Hpef06z2e+Rom+XIeJZZboNWLep1SgeMLq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=eVt9KpH0; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eVt9KpH0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so512326f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 04:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789559211; cv=none;
        d=google.com; s=arc-20260327;
        b=ja916epgowvcDoiN/69H/1L4OAGNe2IIVOVndzn/Qcr4UFSnKrxfogtebXvqw1gIRE
         V3ltat5o0STDFu+XH3nQIHfgTfwmATL+1p3cDn9vTC0FQtw6kjs9Tf6CjTf+z2VyKpNR
         KT+Jg8Jc8x3dPsi9mz8d5N6v3jJxTGcQQln7H4TbNoZ8JAuFN3QyxLEBWIuSQvfvLwdU
         mkSgHZ1il9cKf61hTTqfqvTX+V+qWalT+Xz4QCzi+TjzOqdJEL9Bapp06YuQddH1Tbyc
         fycQptnVlOVlp0/aeL2l+1NAWjrEbuxqkNkNPzgdhCEl70aQnLcY6vy1sLYVfZgrbsM3
         gMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Bk/Zhm46UsksqKxdCgEL1IXAFMmudAH/kvx9B8xFq6I=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=gX401yLS0IUzLpztx9pR/MqzbbdkrIgGOL8eIVj2wcisE7Qg7O0F8hxHQO+IoF96AU
         lC1CO0R9jSR8QyzB9qjVpxmW8FINHoe0qudQ8j15VwiF7S3Z8IhSrr/8zz2unoqjCorl
         aTcYBEBp9I80xmnSbFOxQoy0P9NxDeCXJ2qgpFVivxsdjYUixTDIbTTcDudXOpR/utx3
         O99pZI1MWb1AZgloFdo5W54YysuLd1MJo+Pn97ekNQAn9WW1SBNPc0ciwwlb6P16BOuv
         IkAN+QNFHN5K5fJ4tuCxFx/Qcuxm+mJqBc9qgXSBPF7KBwSlqKS1Lxm9u7tufaRRuD80
         hVwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789559211; x=1790164011; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Bk/Zhm46UsksqKxdCgEL1IXAFMmudAH/kvx9B8xFq6I=;
        b=eVt9KpH0WVInLaFn5DxmPmexSV4SxhpbXXIIPKfDXBjuE0nBO7fqd8Gj6uloImcqit
         kRUfj9KhySaTr3f4UKj7RFwc1Rc7IL+T9XwTBsU1NTa2zxrR1NEM78e15mTLDxHLgTF9
         jfCLvxCYz6M46FXyNmjw9FnTMOZT0m9zUa3HV8q3+qni3Zo9d2soNYfR+MZsr4rV1/YC
         XbONx9bJvxsrR57W0/aSvGQzYuXZxxUATkC8uTelvIS6mYBEpAHns0XvFQ5K+X4lpKYv
         zBsvsUOiangvWq26EWRu9lhURRzkCDFwQWuPRnA8SXDoZ77KQWGkzW6vdJfc6gPenl5l
         suNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789559211; x=1790164011;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bk/Zhm46UsksqKxdCgEL1IXAFMmudAH/kvx9B8xFq6I=;
        b=JLcdDmQ0KmiGG+v7y8ikWPKiL9yfl6GhMNfbIP/OpzooVKeBiTUom3DfVE5E+ZLFR0
         LE81qJHF9tqr7kE1h3jfCJAdeor1VlOxqIAASyxkThWncVLNpv4adzQ4VucnzI5tuB6w
         Lyhhj9soGefFFSsECBbQI/l/PHVgGcJ2ApNRvGiSeRcQM38+p4LdZqqKh1gkt1iK1zsp
         P77U/C6AwzJCdWvWtfQhru6uQ2vMno89vGXSkoACIbxiPPUXWxJPOj5Ngfel1LPnx/8+
         gX/qduiAalywGK0R3UKq/HZ++tAhFynmFoF0SjwYi2otjvG49/YksI7MVSzV7aYExchl
         YgTw==
X-Gm-Message-State: AFuF++mCI0qLUzCKk3CubcW4rJ8Dny9PS7C6qNlRu5otUlh3SRtjjqAC
	q3mATaXEm3HWd9At0xck85IM9qYCFzdIZNOAI92t606trfXTpsyA9BOS3aSIKZ7D72C9+C8FQS/
	f/rr54arDPWU7G4LqC96kyGWKV3Mhi34kQYTg
X-Gm-Gg: AYBFou3Nkfey5qaDiVtd3MJsh07l658u7gufnpfidzx8Rx0PUiNIWysndpOJ3KWBhbP
	M+xzbDjCyi+zzH4TDU5VMfmrVyCeIP6XgMDYr5zeRhNJO9hn0B/tJ8msoAaRh4vFJVjA0a3wWR5
	Y1B9Esxfw3A/LtQf+A4ZhaymRV6BOC1/uHpAEctMC0d8XytRbYLjpVN4kRbkkoQ3+eMpCw4S8BR
	nstO1GZNGFoiiJMT7fq+MBcIL2E6FyzQTawlyhr7aNjuXG3HyQUnDN7ICF05DkZepS6jxC7sJZJ
	yOC/UUSw7PxUR4VtRUKrD8KIXdVUWDioNGY1u/CV7vs8mB5ljQEy2zg=
X-Received: by 2002:a05:6000:230f:b0:486:f1ec:f939 with SMTP id
 ffacd0b85a97d-4870d26e897mr3159343f8f.40.1789559210826; Wed, 16 Sep 2026
 04:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Karsten Wiese <fzuuzf@googlemail.com>
Date: Wed, 16 Sep 2026 13:46:38 +0200
X-Gm-Features: AcwNN1WoYNyN3o9ZWAjfFNt4ubxLqstaGWx8NVmdcdjBF2doFCUpluSSMGxZRYQ
Message-ID: <CAM=nh0S9e1+_U4WGR92HwOrNC2h2xYb6eKvgN5_skg-vvbSbqQ@mail.gmail.com>
Subject: amd/pmc
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

your change makes a huge difference here, no more hangs suspending/resuming.

amd_pmc AMDI0009:00: Delaying suspend by 2.5s because delay_suspend=1.
If this solves problems on your machine, please report this whole line
to: platform-driver-x86@vger.kernel.org so it can be automatically
detected as affected in the future. System Vendor: "LENOVO" Product
Name: "83AR" Product Family: "IdeaPad Pro 5 16APH8" Board Vendor:
"LENOVO" Board Name: "LNVNB161216"

Thanks,
Karsten
