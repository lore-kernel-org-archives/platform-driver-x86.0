Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4C82DAFDE
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Jul 2026 03:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784344401; cv=none; b=pkvsegdZtjJywgQaS4unzx5Nyx1+11zv1yHi+j4CoyiTsAd3Uh37RFG2S4Dqio6iuseeW9sUshdlU2q9LHnZMSJua3Sbbs0GVyaTb4nx8wfZe0iUvNgFEfrBbq0BdrNzmxJsxG2yO1rtXL5o1B9lPEtzFIdk7p2RqO2hII/XoB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784344401; c=relaxed/simple;
	bh=aOBw2HcgLgEM8aDoHKPmHmZVBs6GNFZZ48a9J8po5I0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oy1X1mAa57a6UykmyxKdRmYs5o5L4aAXjh7Ep5ZtpussKKUA+Zi/K0LCuenQJhPOf3u60zY6s279MVl2fUCiUgaidVEsQfRnUt1pEl5EUX6tjdXsPAp2yHVDuDBL2U5In2dMi20XJliOcvAPZ8o8mtdOjRVWbRXuf0wFHWrjbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YswQv9pn; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YswQv9pn"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9e7391839cso4620833a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 20:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784344399; x=1784949199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QE8lNOgVckXhLmS8P6+8xlD9TeqsOCv/J2j/3e1cOyo=;
        b=YswQv9pnY3bg41tg7I4SXMsKaJDEUefwW5XsISk8/6+g8iSnfWJPpgUR6xUxWiDtiG
         2eD9H2CaLHNc0wibue+y0LXAC3O7kZaBZjswCFwgK/SS45QdCuqhwqdWilzTbLtLmHNK
         Fv9NUPiKRXKTD8v0kY12f2T+jxSe7HKBAq03rhhE5BI+1cVyXkzx1D4auc/r5V8aCmyh
         Th4T+PuR8y2yIJIG5hhgKW/AurcC4nUd+wuy3NapyHC1Fyph56ZF3Os6qGW/KVdjw7WM
         HDhy51w0n0Se0DohXwbVDkc1vp26s8ImqSbEoyrrZraa6l7rfvLoUCpjZiwJ+d62QXPV
         pY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784344399; x=1784949199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QE8lNOgVckXhLmS8P6+8xlD9TeqsOCv/J2j/3e1cOyo=;
        b=LID3+19DhLg5U755IISjdi7iBzLTcf8LggFYJA+e46kSmcpRPXhrIFouqwkf7TGCp4
         V/9MoPxr/hT4QQYIwsReU/gYd298m92r8KwyloDPLS4s/v+6LowZMMFiNI1tTjzgCoew
         Znfkf5GL1d6Fkn7Xl1qg0jMzL4KtCTPiZSolFogveL12+wqWKVMXA4z2oIcH/vLbrIDL
         6T0XzmIt+zQqbJSqBCLECftbSKYEPFzwm+4ccRn15HyFAL8bSoqcjhMzP5RlJ+I7wXJF
         GD2RJjojXr3HOr/lIvuFHU4KF4wXxJJtWXFv1cjDfyxoXRArdgjIFJTFhVkGmisgUIw3
         WJJA==
X-Forwarded-Encrypted: i=1; AHgh+RrsVPxL+1ftY/wq3tFbGtdGr3QwuISiBbD6jxw4Ci8eL35xPjPCHFKIfEbXWu9SQYAdVqEIMUsaWGqGIfoDzSEGngCb@vger.kernel.org
X-Gm-Message-State: AOJu0YwXe2r/Q4QCxw9GlPvySPgnu/BQ+rL6d/poaNOYioG9LwaGUqjm
	u22iXqzjBY11+zpFRMzFzu7gV+z2t+eznIfhYxfuVNPBq5SXm18zLr1w
X-Gm-Gg: AfdE7ckOMi3qR7TdZMyTMpxusndoTOLcAecdxBStb4IVLdtuPvalhrAqH+vr9tGco3v
	idvrlIllfOD59Spy71c9+LJbzyVTOOcVaMh201K1PufaTSUADY1KUsctCM0Qlxjdj34OHpv9DXA
	+tWnGi8AXi1QDevp121H2rmenyK+huuUK8tNZJ4+GhnYpac2I795EqSQCj0WLwtIJtXyWS6EMnG
	uRdCxXjh0/UhPeISypaF6s8gHn0ZJVCImCxwlbTCAmiTkknfGjplAM0r/8cgAb/zOmRR2/JEZCO
	/2UfHkEG85+MWr6KkIRYlesOMnB0WtsSm2l+37NlyEASGkdv08+v68SyotZDSfOH0fViitRPqer
	DqXqUma4pIdn/5RF+3pPn9q/EZdCo8L18yKjigDIHGWwAV+TBz1yFV36x62BxAS29x/tBH2koih
	i7yRle3SJFHJuyzeUdektjny4jQlTjew==
X-Received: by 2002:a05:6a20:e282:b0:3c3:91f5:82ba with SMTP id adf61e73a8af0-3c3ad975d54mr6407653637.57.1784344399605;
        Fri, 17 Jul 2026 20:13:19 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a210571sm12059024eec.31.2026.07.17.20.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 20:13:19 -0700 (PDT)
Message-ID: <b19fca1a-642b-424f-9573-c5f7fbf1ecb9@gmail.com>
Date: Fri, 17 Jul 2026 20:13:15 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: hsmp: Check ACPI_COMPANION() against NULL
To: Jiale Yao <yaojiale02@163.com>, naveenkrishna.chatradhi@amd.com
Cc: carlos.bilbao@kernel.org, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <20260712155525.3355770-1-yaojiale02@163.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20260712155525.3355770-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Jiale,


On 7/12/26 08:55, Jiale Yao wrote:

> Add a requisite ACPI_COMPANION() check against NULL to the
> AMD HSMP acpi probe, aligning with the fix applied to
> asus-wireless driver.


And I'm supposed to know what fix is that? This looks like AI slop.


>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/platform/x86/amd/hsmp/acpi.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 97ed71593bdf..615b3ebe66e7 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -71,6 +71,8 @@ static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
>   {
>   	char *uid;
>   
> +	if (!ACPI_COMPANION(dev))
> +		return -ENODEV;


Nothing wrong with this, but you should also check uid after:

uid = acpi_device_uid(ACPI_COMPANION(dev));

since it itself can also be NULL.


>   	/*
>   	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
>   	 * read it and strip the "ID" part of it and convert the remaining


Thanks,

Carlos

