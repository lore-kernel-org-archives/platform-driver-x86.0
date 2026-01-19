Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1553F301010
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jan 2026 22:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768861614; cv=none; b=U1Qku1boZs2zEYN3vNaUyrQUSQTu48wvvSP5Pwzc/wwBZRkCyz3XvOkvYOV87aNSPtvhMyvB72czg9nmY/ZRAIS9a2z7H+Q9jfYP5dzKuTxXEluWL9+NR15BJz6C9loHuPrJR312KFw9Hr4OziB41NlA4FkOOG3bPE4Bx7k8Gjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768861614; c=relaxed/simple;
	bh=uvmDme2Gtv/X7hjkklXCqWbJOKuZeI329xIDKGYZh7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PNmQUHrgi8tPVCYlCrBSiERqVoL1QcE8vstTtB5bXGx3FZQPty3lbA+bo30DX7VbVQ5WM4OcwlxD8894Y7N0vrIeQkJWlCTYDpOM4m/C7w0Ud0b2xvE4VBU5z79g0upyp9EYMfaF4TWNZgcU2Z/WWum4zuKV7kSb5aMFS8jhWP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iV/QZAyS; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iV/QZAyS"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5636bf70eb6so1225536e0c.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jan 2026 14:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768861612; x=1769466412; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jURO2ckcFL19RxOJqIofnonofth+ErU8EOq2ZvpXKE=;
        b=iV/QZAyS5ZdTbN/NXkr+thdA6iXQDy/HPTtTRhON7bh0MryP1cX7nUc174MZzcqXvd
         n5Nt0jNZCYAXORZ/rSjJiNUMWY4JFE3HSoGz20t14+e6Hm5PxPzdReiJlgctqDHdTmBN
         eZT3u0/v2f7b8GEB2OZdK3u03woyARCYedt+MCxIwq/y1Y66bhtf/pqtH7BHtCuMGe9p
         jE4mz3TuMQ2mQS+HP34qRXwM+xqPCT38GsPEXebSmNhuvxGNACUvF7wRSD/JH/mj4lGe
         W9zgiFYhj2R6+2OMJ4CMum6e7ktoV5ZU93iPbF/AKHRsbLGajan163+iUNukHENgx0Ab
         xFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768861612; x=1769466412;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jURO2ckcFL19RxOJqIofnonofth+ErU8EOq2ZvpXKE=;
        b=QYfHXvEJ8ZAsowfbFhj5Lzuag0nHFZDzMIXVDmVO261GuCLM4HRgCnSwJ2mnyJlrph
         C3UMMkI6WbzFRkSeHPm/Jo0G5i69CtXnBefdoBKbiCwEeD22Lbarutv60fqJi4edvA0H
         N6Kjxt0vuz4mlqgfPgt3oQIqPt5mD58CxndeEEFWvZpyIg17O2ovKmH2gPE0El5HamPV
         ZkR65tYTkE5F76I0idqBSXmsLYV5c6O5tqxI+JS+yTdF/ItG2S/XUwvaMdNPaHubvCNz
         xHWbdXgsVfoT6doA0p30OPp5ffLPwZuLosUEp9tx3TbkcP4huaT3PgVa6F2VkSW1iLkx
         NTYA==
X-Forwarded-Encrypted: i=1; AJvYcCXmpjQK5jNlpjI5vrKCYoP3wgSiBL/8yP1Uun/auOKSJ9RIqZcCKvnsx4ZYL73gc/nAPYJA9ocPHURUTDt4Hf0qqZ1g@vger.kernel.org
X-Gm-Message-State: AOJu0YwKNitYsR1MCpkT8Kd+D5R3nYZbPunkZooNhpsrh+7mH7uhjmpv
	ApVTalqjkIRiyb4/iVtQlX8ZrKsVcDqc4DgQDJve+GlXAlkRC2ONUoKQ
X-Gm-Gg: AZuq6aJYjdAePuqAEJFRMajxv0mTFGe4SZpxwi+Qwh1Jhie1uXV9Bc4iLPQh7xDH0QC
	BE9ZgHj7Tqokk/jMlZtG+q0LbdO7nlBF6Nuf+Smc7alnWalHuSwbKwnX/HPM4KaqrR176/MlS7j
	2Uct3864FJRDYbzzT7IO2KZAltzthBSNQFYoWSCa/lX80sjndG9rdEhkl9VnXCDKBcQJNAmlBye
	LUyVfPpsuZVhudQI39fQtC7b4zkP9A5qnWoj26Iogku8EuPCA2SZQYw/mSQUgyy20ycp50n6qLU
	F8DQT8f6wbxxYin9luSU0xNrgtNdIl9DLCiwvKesFI7MBMQy1iSFBviHy+F0YIZ/v7utzyU0G4X
	hZGwuWOkJWd8ZyDtGFIoD+lsxUGnt3sVPxjjzmKfdj2q1uXjWwzsmGrdZgatGKNh6/NXhh4cgU8
	Yd0vWP9M4=
X-Received: by 2002:a05:6122:35c6:b0:563:72d9:8091 with SMTP id 71dfb90a1353d-563b5bbe9f7mr3512987e0c.6.1768861611901;
        Mon, 19 Jan 2026 14:26:51 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b70e58cesm3155768e0c.11.2026.01.19.14.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 14:26:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:26:49 -0500
Message-Id: <DFSX3XCGAGAP.2OA0L4PGOLDC8@gmail.com>
Cc: "Guenter Roeck" <linux@roeck-us.net>, "Kurt Borja" <kuurtb@gmail.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v10 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Rong Zhang" <i@rong.moe>, "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>, "Armin Wolf"
 <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260117210051.108988-1-i@rong.moe>
 <20260117210051.108988-8-i@rong.moe>
In-Reply-To: <20260117210051.108988-8-i@rong.moe>

On Sat Jan 17, 2026 at 4:00 PM -05, Rong Zhang wrote:
> Register an HWMON device for fan reporting/tuning according to
> Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) provided
> by lenovo-wmi-capdata. The corresponding HWMON nodes are:
>
>  - fanX_div: internal RPM divisor
>  - fanX_input: current RPM
>  - fanX_max: maximum RPM
>  - fanX_min: minimum RPM
>  - fanX_target: target RPM (tunable, 0=3Dauto)
>
> Information from capdata00 and capdata_fan are used to control the
> visibility and constraints of HWMON attributes. Fan info from capdata00
> is collected on bind, while fan info from capdata_fan is collected in a
> callback. Once all fan info is collected, register the HWMON device.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

Can't wait to for this to reach stable. Thanks!

Tested-by: Kurt Borja <kuurtb@gmail.com>

--=20
Thanks,
 ~ Kurt
