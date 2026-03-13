Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A822B22F767
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 01:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363833; cv=none; b=kapGwujQv0tJQFe6ZHVnuQuqYq+FIBegmLnAWa4Bns68jaiTwYbPWjk25aspKDL2GuhusRZ1JTgA2WYWhMv/vDnXvIKGI7U1uRE1EnkOWeWlcFntm1uAOCQ+ODMRbJ32GIMXVcGxvX4QiYQidL2lazIkBzzf9oh8gvZ+yAvXcJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363833; c=relaxed/simple;
	bh=grtV7xNzXcmVCe8jFx0HNx4G4ARC/4/vgr2DVh/i7c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUQme6kK3qnecNFiVToWK+lhqD5X8T5TXGKA6+LgDn6qEa7ULRVfzXaVlGZE9GsQzSt8ajct074c5zklB0RwkzaOuyS1VyP/94ckouCQMKpWscOM1euWpB5Jp6rH0cBvWjuIAsE61jfc1I2oViUSnEVyowt4sOOJVmqLbzb3PeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwjrxMnn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwjrxMnn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483487335c2so14100985e9.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 18:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773363830; x=1773968630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grtV7xNzXcmVCe8jFx0HNx4G4ARC/4/vgr2DVh/i7c8=;
        b=JwjrxMnn34YILqbeTBhjdLRjtPydsKkrPCdhXaIaAF17lVQnMU1El3sWoESE7oGilW
         zA1sYVa4KAPGN3idshGUZnxBEqDeUDqaMetukoGtnkZ9aLRFnulliAZp4r/Vxy0Nz2ua
         LKktStAOqSrFdMt52oXi74iSoxubzYbhGtGla7+++lURbB9aV28TOvR597WrxTgpue4L
         Uojq6R2x8Y+ytP5ZxIIjf7jirMKH/g+TWpgcOkwBN4x+R3hPx4k06W8T+gdLJ3nQyOWo
         9L8bHVoIZCzbKAcIsYWqNYD8i0w61X14owbZ76RYaaxCq9zb2U/fjZvnFRmsQU4S/tD1
         Fe1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773363830; x=1773968630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grtV7xNzXcmVCe8jFx0HNx4G4ARC/4/vgr2DVh/i7c8=;
        b=pIvl7zC1kFYMGylhnm7WwDBhg4BdOsrf/rqBxvwsDOi82kQlL0KQISfi2ErTNIL4ix
         51lGoC4ywoPyEmorTL3mHQV/TrR3K+/x7xlJlwlD4dI6dZhkVUkA/r1ogGPbcEC5xnPh
         GV81VmGVkQ9mEiyrXgqHYku79fO38Xcoi6+Gz+29iDjI4/1PO0R5ja3vnmWJPcXlo17P
         btFMKnoGFYWMAHjshHI9jSqRN70NqMes95/hmZDGWU7IlK4Y4IYAz2EvRKxWERQbS+5U
         CsbidrU9f+HziUQr/gD3I9k+AVy3YF4BvMfSMJmLC7If+dQamuz40uoj0tGIOm8eu+4e
         3kjQ==
X-Gm-Message-State: AOJu0YxQHpzemEADeatSwHyzoO0WnxsSHfj53gz8AIxq0+E9Jq2XuoTM
	5XXuioVdHzyf9cDRe/VkDGpI5mNf3AjLjqlMhA84pmrtgaW04BxAtnAi5tPbTDPf
X-Gm-Gg: ATEYQzxvP0Xm+22QM9+EtGwB26QPbkJPhQVN8GmHfD5iYcq/qkR+ne6J+q5C0kNnVAw
	s044hKcEz0odaSKL+XPmKOv4MNN0vOgkhTeZH+pIWSwC0UXOWhgWgcqSh2fXRQkeo0cP4FF9hZC
	wO7rCzVHS88NRDnlmeHn4xXXMXqu9eZYe4BE5KRHHueF/JdbSpDOhEEIGQZroFbk/w/3XWriw14
	zKye/3mfwTNf/q3P9H4zB2BinDOkeKkghUqClWDwffJG4zOzsQO4IRy+D2yQuZZCOOdXDa+zSjZ
	6Bk4DXIYjCZUqs4i1bslnPpF7s4eM7lna6s2B/QY0uwsTfIJqKJ9ISkzbzZwUrtQ7Ft9UV8oDs6
	Vvm+25rSaterxUEPRgDZJjfh1SDVsb+KW8G/izdoSdmCP1BSObHRfc+cNkaoUXG0wzaPm8U46kL
	mq6UqbmOzWnshDraqeot9BsGzTdyfDiGM6sPj2sMEUrXSu
X-Received: by 2002:a05:600c:1d0f:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-485566ca95cmr21147335e9.5.1773363829811;
        Thu, 12 Mar 2026 18:03:49 -0700 (PDT)
Received: from [192.168.1.121] ([151.61.18.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6ce2fsm6761565e9.25.2026.03.12.18.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 18:03:49 -0700 (PDT)
Message-ID: <5f2c4c8f-ee6c-401d-b0b7-b044740e326c@gmail.com>
Date: Fri, 13 Mar 2026 02:03:48 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add DMI quirk for ASUS ROG
 Flow Z13-KJP GZ302EAC
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 Hans de Goede <hansg@kernel.org>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312212246.1608080-1-matthew.schwartz@linux.dev>
 <0bbbc939-7f3b-4f68-92ee-ed5ac32f07d1@kernel.org>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <0bbbc939-7f3b-4f68-92ee-ed5ac32f07d1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 3/12/26 22:45, Mario Limonciello (AMD) (kernel.org) wrote:
>
>
> On 3/12/2026 4:22 PM, Matthew Schwartz wrote:
>> The ASUS ROG Flow Z13-KJP GZ302EAC model uses sys_vendor name ASUS
>> rather than ASUSTeK COMPUTER INC., but it needs the same folio quirk as
>> the other ROG Flow Z13. To keep things simple, just match on sys_vendor
>> ASUS since it covers both.
>>
>> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
>
> Nice solution to this.
>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   drivers/platform/x86/asus-nb-wmi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>> index a38a65f5c550d..b4677c5bba5b4 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -548,7 +548,7 @@ static const struct dmi_system_id asus_quirks[] = {
>>           .callback = dmi_matched,
>>           .ident = "ASUS ROG Z13",
>>           .matches = {
>> -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +            DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
>>               DMI_MATCH(DMI_PRODUCT_NAME, "ROG Flow Z13"),
>>           },
>>           .driver_data = &quirk_asus_z13,
>
