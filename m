Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007035;
	b=x8ErdLN7q8fXV3eJpwTHq52hHSfXzy9UHGrpCZfASaivdNhsmOvFD1g6Tsnjgf+kCb0/
	 v7i6xmrl9l+MjjvIl/TtPaDjvYKVEEMgTEaDw7LzdPwEBhMit4UgXeKszqgjRrBI1aIvd
	 i5raJL51ZIbgtgW1yvAxaGtFd6+uFZ8UFHCNBZOwulwqJAvtxa4RvNIVPhYVSlxwpu1sN
	 N7aqYmpQcT5Ohym+Sj9WIIQxvdWo8ZB8EswQYdOMO0xUi2X+6R2IZS8/7FfZB3z2cwP/v
	 tOgLFQayi08w9oNfblOWer6NcrB4WaXlQYX7CpNuJixETf6P0zqw+gIX4Q9S5SBKoHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9Nx64ZUk6CyAu6407EOO7ojQd1FcMEUOXaKbUe9eUR4=;
	b=OK346tPnRX1+XWS43UN13QGKEBL7WMYYTnp36fuq9ZhzwkqZa4DZyje68yzq802AgXJ5
	 OadfRpKDRgFt4ND7i/J94fcQWLaY1+UqtIg5DcYFG0psA75rdW3+LM3rECElNP3M2XKlV
	 bei+dtNx6DVh3+8fEwA0kIl+38bHGk+jzn13KIs2NpoXBzthyIGVQt2I1juI0IkjEt8jo
	 If00B4kfnyDtccpVhXkmNQDRw07NltFXjytVJcu4ym0/4P0Ti6C12Os5Lff5hz/GZmjDf
	 SZPGYWsHPIad0w4JQSqOu9TqhqtHrLwAVLc97LtOCdEHc3DgQVVyeqg2Fhob9rKZDsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X1EizSir;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E135860A2603
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 09:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E135860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X1EizSir
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so1162632a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793007034; x=1793611834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Nx64ZUk6CyAu6407EOO7ojQd1FcMEUOXaKbUe9eUR4=;
        b=X1EizSir/SPFC1iekp3/Ythb9HqjSwTXCN91i7egrkmk4EYyChYh4skg8qNN6YZKjG
         wXzcJdIMeKBFzSP0K1ePX1lsMvzM7gDcxJ4grEU2ZnFFOAXlML33Q6rGLj8IXv+0D7Av
         i4XZujl0NOm1a+yu2jrxx5j3f4yQpY0NCErIuA5DxxYZLY42EBRRGhk3WXqsRRUUrVT3
         GM17cV3bntBGvYAmiA45hnbap7exo1PvHdzq1YXgmRNCW/O8N41hCxufemiaqbDeVvYg
         cGDBKI75NNvJUhiO31WEEo/Xg+wBbYCQuN/OON5vN71ZzlD6lF48DLQ2ewBtFohGCcO/
         f/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007034; x=1793611834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Nx64ZUk6CyAu6407EOO7ojQd1FcMEUOXaKbUe9eUR4=;
        b=ZS3N8Ya3E8KcSwUS8PKPbNnd6f8uVl5Hg9kuv13fUxuwFw4dxHdyggapCC90mpyFvN
         ZjVERF1Ct6KfxH2FR81TNgNLzqxCQb8qiT5RatWVx14tgEntaPZRdZYuTBl/DH0P2DNr
         GSI2KlHUIXhZSY3RYRnyQnjLp0++d2z3Ujh5CrHUtTZ1GAH8eT5qK/s9KCOVVRUd2dht
         gaFn4Bo82LPknrEQS292yr4h4V9gGLkZA0qrQxERpgTPFRHFrhK86YC7tgUiqaE8qWr/
         1FdpFzoe1M5MLVFNmWJkljC5FgBAHoIVjsnIacnhR5dsO0TRWS8bTMzPboE4Eb2KkJNJ
         WwMg==
X-Gm-Message-State: AFq9FYKUhoMyy5kggWx6/JW6qPj1cB+ikHtQVzEgMTv923+ng+mz1a6B
	IIH5QIr1U+q6IAM87wJS+eJMaZwh7VVEb47JEFQH1Mi4lM5W6ZVC383KdA3OGOA7
X-Gm-Gg: AYBFou1jT5vGve54DUuAyweO5ITNem56F+reawtthQ217QqGe8VUO6MqH69ZF5hH9Fe
	ZWDfKeTYk2TknX3P2AK8eT9YokJKQlX+5etBF2KeubBjbxEVqF+t/IbtMLrgWOkwijTBLKUjrcf
	O7ni93Im6PBLnoBvzTJN5Tkwz9+MWA0d8laspntkyR+80JTZ/jzzWpnhNwJ62XIBYhNaGHf4wvi
	kCty+NKVhzu2QBeL6Wu0DRRbPXALd+SJJDDiGdgMqN92rLcoUVAoi4u/vpDX/ronMGDQXe5ev3Q
	N1zaQbdk3BsOe9dEZQhj+xfBxctS8WwJ+0NqihOczMtfpPrfMUB83eMHH1Q6PKkJlxdqwsJdt24
	U7DHw3eF4WL4IgVg2sEStzYOUngHnGFQu8FC8l5g1qf6eD8l+/RlKAXEyqqS0yeIbHrfXVZRN+G
	950/BX22xxMvS7zB5vtmK5Zv2aDYN1xOZKYDSoFS62F/7/a4/Gvylg+HQO1CtYbm8os0mV1xggl
	hkIh9Vo1Qd1BMcoVBr7Ba1LX7rTllTK9OK3g9Skc845Jk0S5v6hNGI7Kxp143zCOhZFmgV6gEnN
X-Received: by 2002:a05:6a20:4305:b0:3e2:8c65:b229 with SMTP id adf61e73a8af0-3e7bfa30602mr3664594637.11.1793007034252;
        Mon, 26 Oct 2026 02:30:34 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:3934:2b73:344c:e6fc? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccccf37esm1395979a12.27.2026.10.26.02.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:30:33 -0700 (PDT)
Message-ID: <5360953a-ed8a-450b-93c2-f55876af8600@gmail.com>
Date: Mon, 26 Oct 2026 17:30:29 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: bitland-mifs-wmi: Don't fail suspend
 or resume on profile errors
To: Chris Taraszka <chris@miget.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda <matias.civadda2342001@gmail.com>
References: <20261025195456.43414-1-chris@miget.com>
 <20261025195456.43414-3-chris@miget.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261025195456.43414-3-chris@miget.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 03:54, Chris Taraszka wrote:
> bitland_mifs_wmi_suspend() returns the laptop_profile_get() error to
> the PM core, which aborts the whole system suspend. This happens on any
> machine whose firmware reports a SystemPerMode value that is missing
> from its profile table, and on such a laptop with the lid closed logind
> keeps retrying the suspend, so the machine stays awake and drains its
> battery.
>
> bitland_mifs_wmi_resume() likewise returns any error other than
> -EOPNOTSUPP from restoring the profile, so the resume is reported as
> failed although the machine is fully usable.
>
> Saving and restoring the platform profile is best effort. Warn and
> continue instead of failing the system transition, and skip the restore
> when nothing was saved, so resume does not write a stale or default
> profile.
>
> Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
>
> Notes:
>      Tested on the same machine with v13 and this patch, without patch 1,
>      and the firmware in 0x04. v13 alone aborts a pm_test=devices suspend:
>      
>        bitland_mifs_wmi_suspend [bitland_mifs_wmi] returns -22
>        PM: failed to suspend: error -22
>      
>      With this patch the suspend completes, "Failed to save platform
>      profile: -22" is logged and the firmware is still in 0x04 after resume.
>      
>      This supersedes "platform/x86: bitland-mifs-wmi: Don't abort suspend
>      when platform profile access fails" [1], reworked on top of v13 6/7.
>      
>      [1] https://lore.kernel.org/all/20260911182131.461415-1-chris@miget.com/
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index 73be63146fd5..df9a931fa939 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -237,6 +237,7 @@ struct bitland_mifs_wmi_data {
>   	struct device *pp_dev;
>   	const struct bitland_mifs_quirks *quirks;
>   	enum platform_profile_option saved_profile;
> +	bool profile_saved;
>   };
>   
>   static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
> @@ -408,10 +409,15 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
>   		return 0;
>   
>   	ret = laptop_profile_get(data->pp_dev, &profile);
> -	if (ret == 0)
> -		data->saved_profile = profile;
> +	data->profile_saved = !ret;
> +	if (ret) {
> +		dev_warn(dev, "Failed to save platform profile: %d\n", ret);
> +		return 0;
> +	}
>   
> -	return ret;

What value does the firmware respond?

This patch fixes the suspend problem, but it hides the real driver 
problem (unsupported profile entry).

I saw 0x04 in your patch "platform/x86: bitland-mifs-wmi: Add Xiaomi 
Book Pro 14 quirk".

If result.data[0] in laptop_profile_get actually equals 0x04, the 
function should be succeed, but it doesn't.

Is there another no_set (for read only) profile entry for the 
performance profile?

> +	data->saved_profile = profile;
> +
> +	return 0;
>   }
>   
>   static int bitland_mifs_wmi_resume(struct device *dev)
> @@ -419,8 +425,8 @@ static int bitland_mifs_wmi_resume(struct device *dev)
>   	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
>   	int ret;
>   
> -	/* Skip event device */
> -	if (!data->pp_dev)
> +	/* Skip event device, or nothing was saved on suspend */
> +	if (!data->pp_dev || !data->profile_saved)
>   		return 0;
>   
>   	ret = laptop_profile_set(dev, data->saved_profile);
> @@ -436,8 +442,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
>   		}
>   	}
>   
> -	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
> -	return ret;
> +	if (ret)
> +		dev_warn(dev, "Failed to restore platform profile: %d\n", ret);
> +
> +	return 0;
>   }
>   
>   static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
