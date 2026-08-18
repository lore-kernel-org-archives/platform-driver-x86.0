Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8848338E5C4
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787064164; cv=none; b=dodrMvCdiePgX5o3qzb19l3NNKX455qWFibG3O9SNlGQq83SSyoDgcLobkK2WBgeXxg6Yy63ptMcfrFKoGl2VLt7aVFZwff1r74J30uqJZ4VjIodgCpUhm/ofqAGxge/yzPv+EpqJtUmygNzW42STfNUrGirzZUDRjuo7MVloLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787064164; c=relaxed/simple;
	bh=8J0rbDx9ItXdPpS7Hb3xmyrFm2Szr4Co/d26EqVQquU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtmG5lPjPw19l0bJevensnfZI5cg77ifH56NK9tHHgb5t9RaN0H6CgBE2fJFjuGNQg0z5wONgQEkcieFJ6rCqf9+yYM+9PKMojA6wYsCTSSmhV/cap6u8QrJ1YzAaUxWcAjpSmSop1V1GVrGLZFMZuw5FFnfS/j6CM/pmhD0JDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvgWjd5P; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvgWjd5P"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso39857245ad.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 07:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787064163; x=1787668963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOGG0ti3unzshhRepeEmkLPHEtt5lfjI/l1a03sxhdg=;
        b=dvgWjd5P8SJZMtq8VmsL0FX50UHvOo1/fXHXtyJRRRRqDcfsyAXNvn6C5UW15yp9sK
         lJZnYAlmodPNK2F7Tbci3Lv1B71QKqC8e5eHSsxA8GRRV5vfRu/cYwCzIrlZW/e4XP6o
         ubmOmdrT3W/iSBbG9pNOgk3ecvqu3r39dS15pD+DMiXOvNgveO+a1qli9Es4jRS4eGnp
         1sGWojWAFvK72qk9Fdhv8VqQJ2i81k0Wi+cFSHunlhhW25V30VQ7wVE3M61w61ucD5IZ
         THgN/kgmk+HZ/QXrJPLhX33Hk4n8LilHSTfGmsNz18ixHUQvMis6CcoozpnFwFDvnTkw
         h2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787064163; x=1787668963;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FOGG0ti3unzshhRepeEmkLPHEtt5lfjI/l1a03sxhdg=;
        b=F2zRVGZhbgZL9Te34IfvKAg05IdBODNp6E33h5C319RTxZ0IFyt2HDhicmaJ3lrZS2
         D1Q9RRsHTi4yiyWi46E9ZcBd1yV0LgKDgpDYYmqhh+GMOyCCZBK32X2kljUoAvxmUym7
         9dA1BLTGfOSyvvKMiAqQPkli5aNfjkVOPC9jUrZmu19euvvqGMo3ANmxBYTIsijrZcej
         ucPxK/gzkExWcQ+1WMjtdPOxgIO7xkIEamIsk+j96kblMl1EvIYktr3rE0lRMNBzCcyd
         CU7J1C08QNzTvueayuJHtbPlCb0ps1Xwk3Y7JqAIUL+rRB5GLD/9jj+RbeGFfBh19eIc
         Di5g==
X-Forwarded-Encrypted: i=1; AHgh+RoB+0sv63Pl61amM0qA3UO64KLpd5ellDO/9XSHwUlJTiKKnBlNgzbbcTVEdGgCecE7i1Ed/EhGlFlJluToTdvWRqEq@vger.kernel.org
X-Gm-Message-State: AOJu0Yylycj/Uesx0XAkahHTJ9F75udQuTRtjuujHXlXjYOckhVwaYKI
	z4qRBkt2GJ2Jxtyqau15vNNktYXVyWf9IMJ8+VSrQ0HPjWNGjmrIx1uU
X-Gm-Gg: AR+sD11+r3qB/oNTdGS9APowhbCNnxmBqWVoFNxoADMkwLT+PS4uw8ppomlkiXop4nh
	IFsjlHxoZfURJLx5U7tyUVCgAUdOiZgfrmPD5xrAraElTbUpu4z1cayENLT9kggGBrIDe45njHA
	CunhU14b2F3Ok4Mr4E5iv41vKi6ecP53mqnMKUHa81s2fvlQhzg+KZeBMsrpkhJLOdVlCvcqqIF
	ekycATBty8BEn2x24KMhIWgQAYuvYlbrlfkRuHdDIWFFMK9XdNHj3BVe0O60npG5OJhLeNItkXR
	ond1QjgBmISLI5pssEhAZa7SwvqjWuf7gTPXQuA0IDm5fG+WwjlzLhrn/KryUvFoyLXcuIAJBkY
	YaAYKymt86m/drmhUOSk3Wlkfgr46ZlN4j819rgomDajpVrldW2nHPuU1Ph4Ve/CLzSDNWt6BGs
	ulYybfQs9f8TiPcpoW+A82gkWkSyoMojLs6LFYozP8BCn0kQ3xseKi4C7+7eDsCnaSDCm33pxC5
	41jnootc/uURSCsepCBK+wvu/2owHfay5Gf+Q==
X-Received: by 2002:a17:90b:5884:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-3933b7c3b7cmr39349162a91.4.1787064162690;
        Tue, 18 Aug 2026 07:42:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bbdasm6321887a91.11.2026.08.18.07.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 07:42:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
Date: Tue, 18 Aug 2026 07:42:40 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: lkml@antheas.dev, W_Armin@gmx.de, corbet@lwn.net, hdegoede@redhat.com,
 jdelvare@suse.com, kuurtb@gmail.com, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com>
 <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/18/26 07:12, Ilpo Järvinen wrote:
> On Mon, 3 Aug 2026, Derek J. Clark wrote:
> 
>> The ML patch set uses a guard within a switch case that violates cleanup
>> rules. Move the guard outside the switch so all return paths are covered.
>>
>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>> ---
>>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
>> index dfb65ac8fbf6..33acd448f674 100644
>> --- a/drivers/platform/x86/msi-wmi-platform.c
>> +++ b/drivers/platform/x86/msi-wmi-platform.c
>> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct device *dev, enum hwmon_sensor_types ty
>>   	u8 buffer[32] = { };
>>   	int ret;
>>   
>> +	guard(mutex)(&data->wmi_lock);
>>   	switch (type) {
>>   	case hwmon_pwm:
>>   		switch (attr) {
>>   		case hwmon_pwm_enable:
>> -			guard(mutex)(&data->wmi_lock);
> 
> While I cannot see the code easily, one could also add braces to inside
> the case to avoid this problem.
> 

I don't see the code either, but wouldn't this be a use case for
scoped_guard() ?

Guenter

>>   
>>   			buffer[0] = MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE;
>>   			ret = msi_wmi_platform_query_unlocked(
>>
> 

