Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586187;
	b=AkR00KiU0Jlbe2mQD6b4CGGdEB7aPIkd3n2F0dW7aJSN4xUrfq2Ygayd+RXEbeFM2Soj
	 RiCcxRQE+hYTX3oYO6WGeu86KK3LVd4BjjD2IjOzDJmiFT3MNYVY5TgMHCrOzcvhD9UY3
	 NRsarwUDS+AbEGsNC5JX0AC7tqMXADG5ORm0+rbdngXrj4TT7mdlS/s1NcHxJ8Zd6h79H
	 7Nba7GpII1q1ejU/hG2PsL8+1gIX1GcPpyjbBgWmjo833enA9qGuylZfEXOWYCKZr9soV
	 AOmke+Jevy1nnU9OZc/tAj72QT+zz0lWskN41P4ck+IZaLOuC9UwQAVGCxM+KGRMs1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A3wRfe9sMloXs5k9s52yyaXQN/yvODgxq6R0LM/3RHw=;
	b=aN9DyJbLm+MbY71D786E+cRTKz0oraLfdtkAKDxZZaF2H5nE0mmhzyu47YEK+nefjnRo
	 6oRYMUgjbPkMTthcTzmpte2KYy/GgILB5ti/TWdl+NVwWs7vDA29+JdQoTEG1WLR8fFRp
	 Pn9PGeVkmeTyT1mQTYghsM54U55QhM1Nzd37I0UdaBc4u0DAxboXmBDvJXrxkPeyQe+Si
	 +d9VIAoMlk7Yeb62xASjFj8FYFkgvMHBwconyu3Z3JeAIfxAiXiP3nEKIfXcN1GhQCC9/
	 HiHjRg6z3GnEofoctxNh1HbIo+jRow/NXLozYJtsmxTFwMYL9CNVqOLsepFTXJsrZ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="qgLDCNV/";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A20260A4ADA
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 12:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A20260A4ADA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qgLDCNV/
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so1448324eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586186; x=1793190986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3wRfe9sMloXs5k9s52yyaXQN/yvODgxq6R0LM/3RHw=;
        b=qgLDCNV/ZOF0YzIxaW5n5UDtDQEI4IZeI2Z8Wv2mfwPgd8Vnx14Cx11H1OHmGicI/d
         qEKDqPOFGd8HjbRAMtFvf2kItK0as75Akc37mOWCkNCT5Q5aFgmnrz18ZwAUs5vYc+Qt
         DCH4WSWz6nJxd6ASBDvG/WckvCRE66XJWxv4i5KxJHQpQFKzROlClrc/NH18zHPUliQ1
         fSpZOUr6Mi+HuuwP+dqZz8hLLMvWdumaId9eBTVsIl4ji2cpPH+X6V9HbGvMAbi6KqQY
         p1vhNSBJ3A3d5xsyVlb8URFgmFskmbKbboGXuEQ7mzKYT3A87QxvNpm4GzBG0Le1rLlU
         bwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586186; x=1793190986;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3wRfe9sMloXs5k9s52yyaXQN/yvODgxq6R0LM/3RHw=;
        b=qyQBdX2kMUBTxdJb2uPfV7oyadoagYg79BaxLTepdro3QaK/c5zDeJJA3HGUN9OuUW
         I4Z2iC2W2hyJ1z1gzDFDMmcB+GaMS8TVsmj/Tq7F6KbKFfg+pR79MJAiNtnZlqgjYVx9
         syZQJWUEBzNAL+YFCRvAESFRy82G/kvTkYk+l0b6LMerxIwEewyUU06dnT3NrQ5ZcWhZ
         j+TxuGAsICNQfRs9xWreUauz4rtvL2CnZQOt26Ew5VvukD4eYdlm8OcSlegNiGw6G4bx
         QQ7I1K9SIIPnTPJdi4Ct6ypLfVLw1KLAbJqywm59Eo5Oc/taT3ZO0HzStCC1Cb49c7wr
         BJBw==
X-Forwarded-Encrypted: i=1; AKwUvByhZ5vuMhwDPtVb+5zE9uG2YdCyVgk6UI3JQXqCq/KXjSuY4zDRlACopIauiTeTetMnf/+ZAVCVQriX0rU7sh8PiEpU@vger.kernel.org
X-Gm-Message-State: AFq9FYLEwp/D/jhCKGJQMieS/gVglwAcLi7oedQyh6RuWOgwKwJ+u6+Y
	qSETRV1wZJSSY+VX5L5uzzRIAE2dVj/7bXPe6dAIEiuGPGLFwLZ2WwUx
X-Gm-Gg: AYBFou3x/05OxZaIJbLPI+NuxHJz2z9AOBQf+u9Y9lakTLWoyezuu4csDpeSixRXSSO
	4rMTQxRvNMhexC0DXF6tna6cruJSC2pl+lIYp0k+7M9KUrhLa0ODzKBwdj3O3zpLdUg/tg8WqYm
	XerRmPlRo0ijQnJZDGle72cyaq3gleERfQoUeUzXQKk2weecdInY647uPbItXFrkc7Q8vsCU/5o
	KMCl9BBBDbVstTVA0P+Jr0fruLunkCtTSxEB3E+w0gPC7LxRA32UTL3yhvljcLKvPknqLQ5iOfh
	nGZDtpSsi2u5Wh1/zZj9x8gc1xDn4RoM3X9axBQGrIV89tQV+UyExI1kzhYoutwHovsKs4La2iy
	fO0b3dEGM0mK4ludeUtjovxtgS81wH6D9xK2TzO8yTJ6c6CZDaoPBLk31CfSeX+EoVu2fmRt6cz
	EWA1aQDf8iqjg7TgSgeoMw/Ly2cmEf72DymOgVHqyI1EqCiB4B1FV1LV+npL0miXYy4FeBB+Ka/
	HINr5QI+lEz0mhRNHI20RRZ48Fv0em/mVxJpHKxJlt64rOR2sNdB5aG/5KokJN6IGpTxc5Wk7AM
	b4qoLXR5JUrxCU+G7OA=
X-Received: by 2002:a05:7300:c00e:10b0:35b:d329:9f3e with SMTP id 5a478bee46e88-3674e842a86mr3427400eec.28.1792586179507;
        Wed, 21 Oct 2026 05:36:19 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:e587:7022:9bde:e16f? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm15270240eec.26.2026.10.21.05.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:36:18 -0700 (PDT)
Message-ID: <5f8047e2-9803-451e-9a70-6b9275d4ce5d@gmail.com>
Date: Wed, 21 Oct 2026 20:36:14 +0800
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
Subject: Re: [PATCH v3 1/2] platform/x86: bitland-mifs-wmi: Fix response
 payload copy size
To: TuteMthCD <matias.civadda2342001@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ilya.gladyshev@linux.dev,
 ilpo.jarvinen@linux.intel.com, hansg@kernel.org, chris@miget.com
References: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
 <20261020234927.121570-2-matias.civadda2342001@gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261020234927.121570-2-matias.civadda2342001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/26 07:49, TuteMthCD wrote:
> sizeof(*output->data) copies only one byte, leaving the rest
> uninitialized. Use sizeof(output->data) to copy the full 28-byte
> response payload.
>
> Signed-off-by: TuteMthCD <matias.civadda2342001@gmail.com>
> ---
>   drivers/platform/x86/bitland-mifs-wmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index 44b16b7b4034..522b38e9755e 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -265,7 +265,7 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
>   	if (output) {
>   		output->return_code = return_code;
>   		output->function = function;
> -		memcpy(output->data, payload_data, sizeof(*output->data));
> +		memcpy(output->data, payload_data, sizeof(output->data));

Hi,

I've included this fix in my v13.

>   	}
>   
>   	return 0;
