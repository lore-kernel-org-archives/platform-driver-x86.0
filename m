Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4AD37F738
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 07:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345532; cv=pass; b=piRB+mdhWJh45IPUidOqowYnKbxuuWiwG0evYUNPNOziFq8s8umyOmENMgjYyJWgOc4cs9MA+Xu2eJiTSd5ruQvLTCIDk8U1jYPfHFEb6Cg7EVegx02U57a5h+yWZxYIvEnFhBMj7Rgk45eY+4VBCdjVMNPIBV+bFXIp/wQ57Lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345532; c=relaxed/simple;
	bh=/aqDLbb7WCHA8JBVj7RUW1KrCp1VlqkwbhMlYSu6exY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+ACFMFnjS16YOYJhageGVBBEpQ5mhxvTCUZ9QxTYVctnaQ93auZGOUn6f8woX5sQWyOVRxu+GsSg8yrTtlsdqwZyhcRuZNku39vhI6jJ6W488RN9CT2gKWJyOutTnkhiLODs6NwGCQHaLT2VDq0plQxWxAmzJuIRcykjh40F4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj4mG3kM; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj4mG3kM"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39f20d19895so10292871fa.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 00:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786345529; cv=none;
        d=google.com; s=arc-20260327;
        b=qenpUSDS1R7iCXKSXD6tNFwUqGyXGkYBB/V45qX6dhinaZDS7cZZcKHLccbyGqCtah
         BoWbT3DvxCs50n8/8lfh0er28XNzRUx8MUo5wO15whxH3DaI6JCfEJHXza8mdY++lSwm
         4OhnP8gdHDR9lAgupj+JiFp+pujD1FmS5PuM+dpT9RUbBeHmoJxNINkWfAlekpY+sIw5
         ttp5ZkIYMuymsRtwGaS9xTWWjjfnwJpJq3rtMvpcG+4v6mZxGP5+mEfi1ltrk0ttBomi
         Ssg/F6FU0gzrRqzcaq5GoJJWISzKIQ0EZNPYnLYyWEuWcNOvjXVzS7rz6Wn2IYsFU6DQ
         49Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/aqDLbb7WCHA8JBVj7RUW1KrCp1VlqkwbhMlYSu6exY=;
        fh=+yPStEhjzH+2VvFCQz84D20LNnHiOr9bTRW8pGxzUrc=;
        b=GY3i6/e8HkVSIkInZv3x5iI8F+7pjz03RcBD2z+pvl8DoFHKXOM1eyCp2p8GRmpM+Y
         tLNN2C2zLq1RGkjc8PbT7YVxdMjfq1bVAs7w3R6Jo/MhMYsdinOYIDgR09JGMDP/Lpgn
         jtQlpk49+tLUMHkSGcgjzNW1MRDfve0cUaffkZka3hInCouei8HV1ReEQJRxODaX8n2P
         FTGz4Cfa0GhFHzESZyqqCfLajynUTc+RzXCfdsr+XfWwtb9FJePW0xd+wYCMGKKIIdgb
         M5q3D2zqqsfhYxy9XzAIDFTtOxvO8VmiufpvVUkYVGpkOz5DOAmZ3bOmyTUq0qtqjptr
         76HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345529; x=1786950329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/aqDLbb7WCHA8JBVj7RUW1KrCp1VlqkwbhMlYSu6exY=;
        b=Hj4mG3kMnN31HcwOVq6qe+DqGbRrLIdeYPF3RJiiwOmNiwsutID9ywFlURqIQHz7zk
         QHm1tYQxOsn91i1vArX9jO4LUPyCcy/+xu5HVsWZjAGMgnqKszpjxszFt/rYgWWPEWBa
         XiJ2vUJ7qLlia54KmMgT3qqqeKoaI3oWusugYJ/VZV1II4rky01m4JUpelJor4zUmseY
         tPN5VszazHXaIAhGt60TD1Lm40dUfmYnWGnYBbcJUZnJWGm+mu8ZBKDEXCZwwlukppc7
         0JXzawKhqKq05dTY3zJF+1AwpO/3qdGIJXfWWq/jqNHIlaUL65APSx2gU1MtjyIXZvEr
         jjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345529; x=1786950329;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aqDLbb7WCHA8JBVj7RUW1KrCp1VlqkwbhMlYSu6exY=;
        b=M7jfQOZ/ML3Zh1xpORgUKjWC6cg34RmksILv8G0VV9MA5wsxuBMiOTUzoDjhD/S+xS
         nqjP2WIZrgSh/9l/6odq6yYekWOyitbdOLcx8fo/z+nU/ULk0Bq4KeqtM1nd8UOLNGux
         sw0W4lQaCQUUvHNYxnax/gHH9IQx1QM+Ug9DclytdfxBPzEHbaTZbi4kymv37vqfF9me
         +CWQWmQpLRPhqT2zuAz1AYpdC1z49jTlv8aflvDtNKRxdPlLxbydtcrMLfZeqN4V4JiB
         EbucnyKhA72JYUoAbLqt9aA4X2YlwymyLwBnNUXIgQu0mRGs6HZSeBK1qr8WwnjaZwZG
         coSw==
X-Forwarded-Encrypted: i=1; AHgh+RrcKHl87Jg8Hi8YnRC3NAJ0d1AJgcwHJ4phBpNc0Yqlq7c3f3zEDpuaT2rFuoE/P38lIOvlGziSBGmsFs9Wq+fAbTPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyeBCBvOmmdV3PKv+MK78Ua1lZGyV9vp5oz2tJz7vH3c6Gyj7fQ
	OyfApNxuOiCnrnMAASWrNKkUj12Q0FxGBj1m3MgtuTnCgJt1Ov3lsY2sEu7j22UXqYGLALj9Kc5
	XRKOPreFGyPrhVxhyg6PHprFMDsnnQnM=
X-Gm-Gg: AR+sD13ZNOVCkE3NTCvypG2oGPj16m59wWzevA8q8TAGocDivBTdeBfMvmyIRzbMiSW
	m+AKykMaeFAOAYhSxzstbhuCqxaCKmcp/nruxQYbF02ET6HLlRZnPwoVS4qqaKZHQwnfviqVnL/
	z9azpOPqltyB67BJe2PnSCqhdN0/yYtUkLaeT30PdEJkTtFQvLKkRedqHLjLtqbOXnA2sXXkFdR
	5GNHq1qBYdGdrItWV10tscsMYpA0Ib1SM5mHf7YbVyXkCMdPAcZIShOAT5XJjM6QyEv8Kq59rXW
	ytvXO+3bPv144c3UIznCCq1Md36z8njTOulmckm3ztWU20+e9v1j9icT3nlXZVvxoThypFBm14W
	rTnWqXM2zOfNgRqKUeiRlfGrmet8WiuBOEvvdbYazyxtKamyVA1cCpDm/LZOuGFAa9NO/h/Fq75
	tfpZmmWUiF2oJEac6vR+KIhli9NdWRYtDciiZ9fGX+5Q==
X-Received: by 2002:a05:651c:a388:10b0:39b:1a03:bcb0 with SMTP id
 38308e7fff4ca-39fbb1e30c3mr39938941fa.10.1786345528875; Mon, 10 Aug 2026
 00:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810052625.27614-1-phucduc.bui@gmail.com> <20260810052625.27614-3-phucduc.bui@gmail.com>
In-Reply-To: <20260810052625.27614-3-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 10:04:52 +0300
X-Gm-Features: AUfX_mx2Fihnb3SOjLgD27lN_XXIET8YTZWwqJ2CakRjhp5Yp_VfwgGndbeYV98
Message-ID: <CAHp75Vd+cAOp28btmTzNXMejues5XHdy_BtZvnskshpLkr8=kw@mail.gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: intel_scu_ipc: Handle errors from
 optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Eric Piel <eric.piel@tremplin-utc.net>, Hans de Goede <hansg@kernel.org>, 
	ilpo.jarvinen@linux.intel.com, Zha Qipeng <qipeng.zha@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:26=E2=80=AFAM <phucduc.bui@gmail.com> wrote:

> platform_get_irq_optional() can return errors such as -EPROBE_DEFER,
> but the driver currently stores the return value directly in
> scu_data.irq and continues probing.
>
> Propagate negative errors other than -ENXIO using dev_err_probe(), and
> only assign the IRQ to scu_data.irq when a valid IRQ number is
> returned.

You haven't read the code, have you?
Check the implementation of __intel_scu_ipc_register() in
drivers/platform/x86/intel_scu_ipc.c and act accordingly.

--=20
With Best Regards,
Andy Shevchenko
