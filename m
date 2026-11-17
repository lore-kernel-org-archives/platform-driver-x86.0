Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874068;
	b=0fhfjHWOSOpC8QKaaoY6KTxob3O2QNfpdgEKN/rYqgF8dEtJXQOTk+/mTKRIGr5kNaNB
	 W7w2p2yww4b4a3m4fZHRDwdrlpKPyGpMteXaqRUCJyHBfyAYD+07jbOM2uTp0NHBHZtMS
	 OiZNBxVBLKfh4rgga/JTRbhTAV4SkaDk6/hDww0GGkIBJ2O4tMbinUeFk9J4Bt8TAZnhw
	 Q/6qgSnB/Rc4FxdFVvJ1Qv4kC8ZcXGQX+jK2q7EsDNzCWIUJ9mGx6AgKzNfQqwDJVjqgA
	 R3+Cq/y0hNCpm+LWut7PCP3AaDpYqzwgbv+b8ki2moe0WxmvD4eIWI8EBltyHdvkymg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A+yWjVg/RgP8llwsT9E3rZE971DL0mW9b4bpk6DiidE=;
	b=IPr131bFNOWZU/G2qPZVNn+QBPKR+x86q8Rp6lg6XOg3H+oLaJlnct76/I87Fn3VH1kh
	 pzKr+m8pTVlGnPKDdKJhbAw0xXxi1czPP289F6NTyOKUqrJo2NgrzDdxASlMuukLzs+LK
	 90QD2zryy+vbySbQ4FNnFv2w7gIEDC8axw06BKAkN0jptWp7SFGpObs8Vsjd17hcXVu4c
	 waJRfRH6Tx7zeR4xZeEe1rGvkoCl9oTy9u8OSi5GGnRAvQdIqJwJzwS1JBsUV6vzyN0BL
	 f38RfEm8jcrZY/2ZGCRkQWPJJl1FikdjzuWvoi637Akf0on+7ZpV1oK3dbmYwtp3loQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5AeQR09;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E390606A31C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 00:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E390606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5AeQR09
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so25823415e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 16:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794874066; x=1795478866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A+yWjVg/RgP8llwsT9E3rZE971DL0mW9b4bpk6DiidE=;
        b=L5AeQR09zRlNinlR0coJoNG6PEssD7POoJ42cgTVSFxn9Vi/t6WT6kwKcKfeVmKN16
         6ol17jStcLbBpf4sSJzL0nDihWHydZD7q/4IbWDEZKo1N12fY0szn5QkYYQxLUWbaGmE
         iD1VXlDrNNyH3lmKRthWt4F0n/v/jU3eN5bcmKYTNEGla/0+oI+ui95tpmSlOSIoQS88
         TJ2YBZ9vgQyP3b3bkiyZZrZmw65dmmNzqsbgj202oUodkbjPegYYQU8jNwGWaq9M1tpP
         8h7mW1wWiZT1GKDJZBwitNaSgGscNiQCuzRXifgyd+J9NNgRFxJa4n9XWjKKyYeablv9
         fYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874066; x=1795478866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+yWjVg/RgP8llwsT9E3rZE971DL0mW9b4bpk6DiidE=;
        b=T92vrDoG5mf5rS/nBmHcuSS3sbNpVZkFsdnpFLmHtjtkjKx4ymSY33FfGnU8E6X/0d
         pc1uGfBCqi+2duGMJxb+bS7gLkXFRItuKE0LFWfWNohiclNkxL6NwE4yGM1BcOSR6Ugq
         0grn3njwgGCCzft8uouJCHQbvOMx/g2om5xb7a8rTGKsAMUizR9hOEqYjdh05guhDYXb
         JJOZ0ztjcZZ0iOUth4QsA7YtkP7jV2UrznMYpNn60EodhfD3o5XmOql2048FYVGYeWRA
         1vEfpfp2CBofH8rDBXL/UQRCMOhS6OVpssM5pu6hZkxbeLdMzp8n+I8f338wvqi6/85C
         98Ew==
X-Forwarded-Encrypted: i=1; AL+hErE6BqZo+QQQ1Of9x7MI3GCo/JL2kB3ZfGkSsyQqV8+11iQYpg3ac4a/PwBhnRDEFvHX27TD6FqZYJuoLJ+wT+/6BpLT@vger.kernel.org
X-Gm-Message-State: APuU4Z/h8RMBJwJXULug7RtfKhT51bLmbGFaiwxZTjxo8YWaIfb71DNv
	2e3KuZglTFnGfeo3WVRMieDKpJP+SPpX0dMqxj/WCulRmFORguPvCIueKzGcfA==
X-Gm-Gg: AYBFou13ay5agmslUrKPE4l6X5IJ15uNN6r3cB0cporm5BiAfZAR3sMUEl0PbOa/kZz
	fgO1LEfjhoCLDCZDzZCeO/1si3mgalJI9E4BkctLe83tFaAijJ0funxi+oKEABB/HsxvmtShEZd
	vWEjjVHvp3/1ZGLK/4o4Ti2ZdXUFQJnJgxYFwGBjBlJybyCIyv3Ut49Wg7y89w+2dxLbwjnSwoh
	YA6KscAx2n3ow/BRqxecv/akmCwA/DfzgnnSWzgC3yIIlD5FzDpZgBEn0WZbRqrEk17IyrC4sZO
	yIeqStb0jdy7PM38EJNEidIFRfBQj/10AHZbUE3TCqBmIdQ8ed8yHBCOy2p0oErMKfkDeonJbSb
	wo7VByHJDvUEef3/WENru5DQY0UKpRSi0E/KuGoqn3/mbqOraQ6l3QKo4hkezNfIz/Wj+lv2CB3
	PJHCoo+KJDWQ/Bk4PgfmrpXUWY+jcwK1OUu1DWZqKdwlxFtWjHEkQPZ/AVzp7/ZkjTU9LJj7LGn
	wWvIVkI+s80VOyDU5IDoVu6ePVn1o3iDPism9ibJfmokug/vMVEe9zvWAkuRbvY55wdwgnfpWJf
	4xJgDwavHVGRCtX5vOCJlZKzJn7O
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr261294925e9.34.1794874066208;
        Mon, 16 Nov 2026 16:07:46 -0800 (PST)
Received: from [10.10.0.26] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7839cad7sm26779855e9.10.2026.11.16.16.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 16:07:45 -0800 (PST)
Message-ID: <068991e6-ca31-41b5-b9ed-f0902eae8368@gmail.com>
Date: Tue, 17 Nov 2026 03:07:41 +0300
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
Subject: Re: [PATCH v4 1/2] platform/x86: asus-wmi: add TUF keyboard RGB
 readback support
To: Denis Benato <denis.benato@linux.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-api@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>
References: <20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com>
 <20261029-asus-tuf-rgb-v4-v4-1-0d3b877d2c30@gmail.com>
 <cc9c8655-6f7c-05f9-ad09-4ea30f1dda95@linux.intel.com>
 <228df241-da5e-49cb-b29f-6b9158557f55@gmail.com>
 <def9fb29-3212-4d1f-8041-4bbb1c18e89e@linux.dev>
Content-Language: en-US
From: bartu alev <bartualev@gmail.com>
In-Reply-To: <def9fb29-3212-4d1f-8041-4bbb1c18e89e@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/17/26 2:53 AM, Denis Benato wrote:

> Yes, it's absolutely reasonable. If the return either doesn't have the
> presence bit set or is 0xFFF..... it is to be counted as "not implemented".
>
> And also yes, we should respect ABIs whenever possible...
>
> However... now that I think about it asus_wmi_evaluate_method_buf() can
> be used on setters and those don't have the presence bit, do we have that
> covered?
yes that wont break setters:

1. asus_wmi_evaluate_method_buf() is strictly a buffer-getter helper (its
   comment states it returns an error whenever the ACPI output is not a
   buffer).  Integer-returning DEVS setters use
asus_wmi_evaluate_method*() /
   asus_wmi_set_devstate() instead; even today, passing an integer `1`
   from DEVS through _buf() returns 1 as an error.

2. We wouldn't check ASUS_WMI_DSTS_PRESENCE_BIT in _buf() at all.  A
   buffer-returning call (getter or setter) still hits `case
   ACPI_TYPE_BUFFER` and returns 0 unchanged.  Only `case ACPI_TYPE_INTEGER`
   changes to decode via `u32 retval`:
   - 0xfffffffe or (u32)~0 (0xffffffff) -> -ENODEV
   - 0 or any other integer               -> -ENODATA (matching `default:`)

Then only kbd_rgb_read_status() maps -ENODATA -> -ENODEV so FX505DT /
0-returning firmware matches the ABI without altering setter or legacy
buffer semantics.
