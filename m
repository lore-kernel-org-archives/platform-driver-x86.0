Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B60913791E
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 May 2024 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716227361; cv=none; b=Xf7+TV3CWjdtSYLsll1LVF01MqSDLVk+sDhi/klgOcq0RXTkjTWIUdSgtx0DYBhjXHSaG6s48TIgxiOLzD3JHaXvxTK73TSpnszeklRRUBGLOGD41L1cJzAuBvHfTR6sKoUVmyRggYophgzYW54LrxKzGl/D64WaWwO101HIfRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716227361; c=relaxed/simple;
	bh=MJpuSgcxvqV4UwKfTH3b1ou3TMAnP03pjUJAZgV5i6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2SFpw3vqpjRD6xXrOUjcewAMWAKMraVUK0wgwl8KkvbiQ8NwtRfetdGA2lmIiAXKEgd6HpRc6diAl2/GxXK3nxwVKTzSXlOEf6XW9rUri1sabw/uiPyoXt2h7uhfF2F2dGlfX1If4pnCNXDh7gnR1uzthZvHEGn+Qo7gcNgcPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FMmF8BN5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FMmF8BN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716227359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZrUbAm2R7943JoyNmgrw2MQcGZgNrzrbVs07vVMy1k=;
	b=FMmF8BN5Pr1xGKijwYllV9aaWIxxz0ASGIX7j8mfBHqO8sHcHwPptXRUEonUsDN9mQVt/T
	cQ0RK5t8tAuZdstJxA4pu26RVyyRlYlus/byPOOtA1VCIEnwmetlfZwhi15HZ+ZendQ26X
	cB8I+Q2ff8IPBR8/V5p3DvjOQGVVx78=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-PUAjN431Mi-15Ivi0UcU8A-1; Mon, 20 May 2024 13:49:17 -0400
X-MC-Unique: PUAjN431Mi-15Ivi0UcU8A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a51fdbd06c8so778821766b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 May 2024 10:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716227357; x=1716832157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZrUbAm2R7943JoyNmgrw2MQcGZgNrzrbVs07vVMy1k=;
        b=w2oGa4upQ9QF2D1ErzkXQYwlEKcziMrNcGj3MWEFRJ0gdfkiZuWdt4dQ1YmcppvObg
         9HKk5SZjM0lATFKSsUNQfQg/9dvxqFgYQDYL2WRslP1ZEHFmUWytEs+3sfQSBnxQqkGH
         pRHx2Fk5QTVqtzCtdxAdeSd07d4sBsYXgHuTxj0bolkbFYutMi+P+aRRX5aeSFt5lYRF
         EXqbmSYZvRsjbZy6j7NiCHmRF7wWOvHdXkjYumZqumpyI8OxAST2VRtssMx/fKZVzgtD
         cgTzbCCBFSsJW7txAp0SRD9M2PpBwL3y8VDKghzjloQSsiOjBxLwFyqrJ4+z70OlF8iN
         KYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZukQn4z4YWzpC93qKWzArBuvsupXmhafXmknt/Is/1TbncTyYgLhp9BBz9Zh/aXfUTwJP612MQfyLm5NfDsU/wn/fxxKRsPCsG3R64jldxoqXyw==
X-Gm-Message-State: AOJu0YzWsxrAxUZ3lSm1Tz6x1lYvS4vr9BdUc4nR+9mwqUg97spYPhFY
	tLBhGh/Sk4G8TXbysBTOo00F2q1eAzTEnSxFR5ffmcdae05V1AHdUe031wN9yGmYBgzEdeNiDjW
	FUuWdch6/m1FHsY8fFSqaDrye3pCXABBxTTl+kwJyVE3yh3lCaptyi+5ZtnXJ5IxtrGyqLwc=
X-Received: by 2002:a17:907:da4:b0:a59:9e01:e788 with SMTP id a640c23a62f3a-a5a2d5d0228mr2025038166b.34.1716227356817;
        Mon, 20 May 2024 10:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgYGJtNUxZr1d8EH1WwxVSjgBenIzpG3s1njnGCUReQnYbY3i4NHmZt7xWOF9IUrJVori1jA==
X-Received: by 2002:a17:907:da4:b0:a59:9e01:e788 with SMTP id a640c23a62f3a-a5a2d5d0228mr2025036466b.34.1716227356442;
        Mon, 20 May 2024 10:49:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b0163csm1486276766b.163.2024.05.20.10.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 10:49:15 -0700 (PDT)
Message-ID: <5287fc2e-91c5-442b-b66c-6eb1fe334ce4@redhat.com>
Date: Mon, 20 May 2024 19:49:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] platform/x86: ISST: fix use-after-free in
 tpmi_sst_dev_remove()
To: Markus Elfring <Markus.Elfring@web.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Zhang Rui <rui.zhang@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, Dan Carpenter <error27@gmail.com>
References: <20240517144946.289615-1-harshit.m.mogalapalli@oracle.com>
 <d5203ff5-8ed4-48ea-8e58-a2e6680b0542@web.de>
 <6d1bf351-77cc-7fe9-2d62-8bd99789e4f1@linux.intel.com>
 <d73fe99b-dea3-4792-aa1c-c3317f296003@web.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d73fe99b-dea3-4792-aa1c-c3317f296003@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Markus,

On 5/20/24 12:56 PM, Markus Elfring wrote:
>>> …
>>>> Fix this by reordering the kfree() post the dereference.
>>>
>>> Would a wording approach (like the following) be a bit nicer?
>>>
>>>    Move a kfree() call behind an assignment statement in the affected if branch.
>>
>> No, the suggested wording would make it less precise ("post the
>> dereference" -> "behind an assignment") and also tries to tell pointless
>> things about the location in the codei that is visible in the patch itself.
> 
> Would you eventually like another wording variant a bit more?
> 
>     Thus move a kfree() call behind a dereference of an invalid pointer.

The original wording of the commit message really is fine as is,
I see no need for Harshit to send a new version and I plan to
merge this as is.

Regards,

Hans


