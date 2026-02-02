Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F3D2798E5
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Feb 2026 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770053761; cv=none; b=M6pBzMlTSMr6Kmwr8PtHirA3UGyxVtOK0rT8KBQj0N4RR78tqf+ZKANiis2DLBtICvRFK6cQYpiLdI+7q26bT8yTD8mowHgXUM8X4ZZrBUbjSWfQFZvlPhFaO/wD9tt8kvt4Ahpa/fvinK83URR4Q2q97SHF6ZJBkzZhmilLGsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770053761; c=relaxed/simple;
	bh=mb25RumFzg5Dx/tWYIYWH4IWaYjutzcv4xNthKAATJ4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=bDKpH04TP2Daof+nucaG3ClCjmyA4mm03f+jt5KK5GJOtU7HBgBJH0JgLoshWNM7kmoHyANA4eD6dBeo2HOa/tVQbZUF8ge9Vthesgb2bcAB/KvGKa0hyrsIh0RXRdrYo12ZnzjoMjA4ngFqar83XWzH+lzdQl8xmiFUoUuO8J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKHwVSpf; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKHwVSpf"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5f53ba9c548so1398778137.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Feb 2026 09:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770053758; x=1770658558; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tG/1PYAXWKIrgLyAGPIOCcgkQWDRD4EftEQ3/HZGKk0=;
        b=NKHwVSpfy9u1KTSFt3y0KkrIk8KcO85y5EIuELEd6lEtKO7xDlUDLrJYzVDHFNKO1W
         gsgUlHPqkZ5TEko5aax7evUAMzKu+xYhBqGjlEuVxS8fRcNhtJLgnJ6mbVJlnl2+/3Yh
         kOa5aTztKH/cTcj8vNeIt9/5lKSfr1ZTs46xT7XhuvHyePZQThcSy9cW4WLcYnsxSgw7
         pnnz8yggWYZCIbSpGZjoXtrnT7VCodvQySazVFeo2uWKIZwH5RmA5DICpmzCS/FU8lCW
         HqWQk8gJI7zXnS+DGApZ0jCSMdkoi9a7hydDJCd3IjwpvYVt5AVaFqKH8+zHIylmhdF8
         6GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770053758; x=1770658558;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tG/1PYAXWKIrgLyAGPIOCcgkQWDRD4EftEQ3/HZGKk0=;
        b=LpQUIRuNkwAq+2AzCL9/iSzZLBSQPXbRLc4WndiBrK0pyYb0ZqnAFUyewOpBomjMY/
         gFIyRTM2R//vWKtr2tM0BVJnhDI3fv+iaa10r5c+4UhIxE2P+kfB+Ap39a3CSmaZVHI7
         G95yrNWYI3n3eW3abKkoxW56P9bpGQrmo9zNg34yg/XKcNIuKfl5EMyNRXBJsIgIw1Nl
         QP9HhGAaRohfrvGUPdygXK9kq2zhX8IJI2nJowtevazA6LgbA2+tAo3nPFK5+AcBnttF
         QqGGM9hSC0TRMlaB5PChOeSuC/DUC9Q0MFyxiDkQB04zGnROxhCaroutXv2snUL1wBsA
         on+Q==
X-Gm-Message-State: AOJu0YxkIt2/VH76+Xk2RwB307K71ARvt1LaKCpPJKVhI5571yx0qfI4
	v2CegL2/oCGhVRnI4OnuiKPtTGBTyCKINezBIpyPLp6olPJ+eCU4jVUB
X-Gm-Gg: AZuq6aLZOwEsg3LlDAO2Eq3wdLMvkBaUsXVfz9wX4sfV0wns2XFE6v2A9PUg8lnVhwX
	9LsmivZ9T9OC6rlq7DFaQgIFE53x8PHVI88u3pFeRYm9d9EcfO7h0UWKNxABDxEiRHDy6ULzYex
	seyrUAXlFTay4wBNY/PeQrcx0qsGuTdo+5upMXZAkBKZOuVF13gx2ael4Gj/3EcH0ZQDBakdgUa
	320FgguHqsKXYUFdquSxqHJU7g4He4pl4Z3wOFUR3ivyZ39a7JKFQT3KT9uSMfHj+oSYab/l8Fg
	IEhd62eHrJmeY60TZAFT6YJ0qhvlxneTezMFxTU8ML/m82PZRfkBUR1I8DEuQumEahRya+WWVgz
	uUzruQuejWC6Z1FSSMfcAusvr7e7bF8IXO5ODbsaofLLhnfi0drPSY9fNwFoJU+/r743jOmSbJE
	PzaA==
X-Received: by 2002:a05:6102:1611:b0:5f5:503e:c76d with SMTP id ada2fe7eead31-5f8e23760b2mr3398571137.4.1770053756470;
        Mon, 02 Feb 2026 09:35:56 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f734c8ed1esm4642256137.6.2026.02.02.09.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 09:35:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 12:35:49 -0500
Message-Id: <DG4NOQRW8MOE.25YALP6C6UTWZ@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Mario Limonciello" <mario.limonciello@amd.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Matthew Garrett" <mjg59@srcf.ucam.org>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Hans de Goede"
 <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Olexa Bilaniuk" <obilaniu@gmail.com>,
 <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add audio/mic mute key codes
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260201-mute-keys-v1-1-825e786732fc@gmail.com>
 <9bbeae98-279d-4b8f-bc52-f535851f497d@amd.com>
In-Reply-To: <9bbeae98-279d-4b8f-bc52-f535851f497d@amd.com>

On Mon Feb 2, 2026 at 9:17 AM -05, Mario Limonciello wrote:
> On 2/1/26 10:37 PM, Kurt Borja wrote:
>> Add audio/mic mute key codes found in some Alienware devices.
>>=20
>> Cc: stable@vger.kernel.org
>> Tested-by: Olexa Bilaniuk <obilaniu@gmail.com>
>> Suggested-by: Olexa Bilaniuk <obilaniu@gmail.com>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>   drivers/platform/x86/dell/dell-wmi-base.c | 3 +++
>>   1 file changed, 3 insertions(+)
>
> Make sure that you include Dell.Client.Kernel@dell.com in case they have=
=20
> any comments.
>
> I added them to CC.

Hi Mario,

Thanks, I'll add it.

--=20
Thanks,
 ~ Kurt
